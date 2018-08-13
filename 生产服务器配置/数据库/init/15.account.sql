use account;

DROP TABLE IF EXISTS account.account;
CREATE TABLE account.account (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT      NOT NULL,
  tenant_app_id BIGINT      NOT NULL,
  account_type  VARCHAR(32) NOT NULL COMMENT '账户类型: cash-金钱   point-积分 red_packet-红包 sms-短信',
  owner_type    VARCHAR(32) NOT NULL COMMENT '拥有者类型:user - 用户, tenant_app - 服务号, system - 系统',
  owner_id      BIGINT      NOT NULL COMMENT '拥有者id: 0-system',
  balance       DECIMAL(20, 2)   DEFAULT 0 COMMENT '账户余额',
  cumulation    DECIMAL(20, 2)   DEFAULT 0 COMMENT '账户存入累计值',
  status        TINYINT UNSIGNED DEFAULT 1 COMMENT '状态:1-正常,2-冻结',
  create_time   DATETIME,
  update_time   DATETIME,
  UNIQUE KEY uk_all(tenant_app_id, account_type, owner_type, owner_id)
) COMMENT '账户主表' DEFAULT CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS account.account_flow;
CREATE TABLE account.account_flow (
  id                  BIGINT PRIMARY KEY,
  src_tenant_id       BIGINT NOT NULL,
  src_tenant_app_id   BIGINT NOT NULL,
  src_account_type    VARCHAR(32) COMMENT '源账户类型',
  src_account_id      BIGINT COMMENT '源账户id',
  src_account_balance DECIMAL(20, 2) COMMENT '源账户余额',
  dst_tenant_id       BIGINT NOT NULL,
  dst_tenant_app_id   BIGINT NOT NULL,
  dst_account_type    VARCHAR(32) COMMENT '目标账户类型',
  dst_account_id      BIGINT COMMENT '目标账户id',
  dst_account_balance DECIMAL(20, 2) COMMENT '目标账户余额',
  amount              DECIMAL(20, 2),
  busi_type           VARCHAR(32) COMMENT '业务类型',
  busi_id             BIGINT COMMENT '业务id',
  remark              VARCHAR(512) COMMENT '备注',
  create_time         DATETIME,
  update_time         DATETIME
) COMMENT '账户流水表' DEFAULT CHARACTER SET utf8mb4;

INSERT INTO account.account VALUES (1,0,0,'cash','system',0,0,0,1,now(),now());
INSERT INTO account.account VALUES (2,0,0,'point','system',0,0,0,1,now(),now());
INSERT INTO account.account VALUES (3,0,0,'sms','system',0,0,0,1,now(),now());
INSERT INTO account.account VALUES (4,0,0,'red_packet','system',0,0,0,1,now(),now());

drop table if exists wx_redpacket_send_msg;
drop table if exists wx_redpacket_send_order;


create table wx_redpacket_send_msg
(
   id                   bigint not null comment '主键',
   mch_billno           varchar(28) not null comment '商户订单号',
   send_message         text not null comment '发送报文',
   receive_message      text comment '接收报文',
   create_time          datetime not null comment '创建时间',
   update_time          datetime comment '更新时间'
);
alter table wx_redpacket_send_msg comment '微信红包发送报文记录表';
create index idx_redpacket_send_msg_order on wx_redpacket_send_msg
(
   mch_billno
);


create table wx_redpacket_send_order
(
   id                   bigint not null comment '主键',
   tenant_id            bigint not null comment '单位ID',
   tenant_wechatapp_id  bigint not null comment '服务号appid',
   user_id              bigint not null comment '用户id',
   mch_billno           varchar(28) not null comment '商户订单号（每个订单号必须唯一。取值范围：0~9，a~z，A~Z）,接口根据商户订单号支持重入，如出现超时可再调用。',
   send_name            varchar(50) comment '红包发送者名称',
   mch_id               varchar(32) not null comment '微信支付分配的商户号',
   sub_mch_id           varchar(32) not null comment '微信支付分配的子商户号，服务商模式下必填',
   wxappid              varchar(32) not null comment '微信分配的公众账号ID',
   msgappid             varchar(32) not null comment '服务商模式下触达用户时的appid',
   re_openid            varchar(32) not null comment '接受红包的用户在wxappid下的openid',
   total_amount         int(11) not null default 0 comment '付款金额，单位分',
   total_num            int(5) default 1 comment '红包发放总人数',
   wishing              varchar(500) comment '红包祝福语',
   client_ip            varchar(20) comment '调用接口的机器Ip地址',
   act_name             varchar(100) comment '活动名称',
   remark               varchar(1000) comment '备注信息',
   scene_id             varchar(32) comment '发放红包使用场景，红包金额大于200或者小于1元时必传
            PRODUCT_1:商品促销
            PRODUCT_2:抽奖
            PRODUCT_3:虚拟物品兑奖 
            PRODUCT_4:企业内部福利
            PRODUCT_5:渠道分润
            PRODUCT_6:保险回馈
            PRODUCT_7:彩票派奖
            PRODUCT_8:税务刮奖',
   risk_info            varchar(1000) comment 'posttime:用户操作的时间戳
            mobile:业务系统账号的手机号，国家代码-手机号。不需要+号
            deviceid :mac 地址或者设备唯一标识 
            clientversion :用户操作的客户端版本
            把值为非空的信息用key=value进行拼接，再进行urlencode
            urlencode(posttime=xx& mobile =xx&deviceid=xx)',
   consume_mch_id       varchar(32) comment '常规模式下无效，服务商模式下选填，服务商模式下不填默认扣子商户的钱',
   send_time            datetime comment '调用接口成功发送时间',
   order_status         int(2) not null default 0 comment '订单状态（0待发放，1已发放待确认领取，2已确认领取，3未领取已退回，4发放失败，5终止发放）',
   failure_reason       varchar(1000) comment '失败原因',
   biz_id               bigint comment '业务ID',
   biz_type             varchar(32) comment '业务类型',
   biz_tag              varchar(50) comment '业务Tag',
   send_listid          varchar(32) comment '微信单号',
   need_callback        tinyint(1) default 0 comment '是否需要结果回调',
   create_time          datetime not null comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
);
alter table wx_redpacket_send_order comment '红包发放订单表';
create index idx_redpacket_tenant on wx_redpacket_send_order
(
   tenant_id,
   tenant_wechatapp_id,
   user_id
);
create unique index idx_redpacket_order on wx_redpacket_send_order
(
   mch_billno
);


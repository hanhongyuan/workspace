USE `sms`;

DROP TABLE IF EXISTS `sms_account`;
CREATE TABLE IF NOT EXISTS `sms_account` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户单位id',
  `tenant_wechatapp_id` bigint(20) NOT NULL COMMENT '客户服务号id',
  `balance` bigint(20) DEFAULT NULL COMMENT '剩余条数',
  `total` bigint(20) DEFAULT NULL COMMENT '累积总数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id_tenant_wechatapp_id` (`tenant_id`,`tenant_wechatapp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账户表';

DROP TABLE IF EXISTS `sms_account_detail`;
CREATE TABLE IF NOT EXISTS `sms_account_detail` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `sms_account_id` bigint(20) NOT NULL COMMENT '账户id',
  `occurrence` bigint(20) NOT NULL COMMENT '发生额',
  `occurrence_type` tinyint(4) NOT NULL COMMENT '1充值,2消费',
  `balance` decimal(10,0) NOT NULL COMMENT '余额',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_sms_account_id` (`sms_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账户明细';

DROP TABLE IF EXISTS `sms_report`;
CREATE TABLE IF NOT EXISTS `sms_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `phone_number` varchar(64) DEFAULT NULL COMMENT '短信接收号码',
  `success` varchar(64) DEFAULT NULL COMMENT '发送是否成功',
  `biz_id` varchar(64) DEFAULT NULL COMMENT '发送回执ID',
  `out_id` varchar(256) DEFAULT NULL COMMENT '调用发送短信接口时传的outId',
  `send_time` varchar(128) DEFAULT NULL COMMENT '转发给运营商的时间',
  `report_time` varchar(128) DEFAULT NULL COMMENT '收到运营商回执的时间',
  `err_code` varchar(128) DEFAULT NULL COMMENT '错误码',
  `err_msg` varchar(128) DEFAULT NULL COMMENT '错误信息',
  `sms_size` varchar(128) DEFAULT NULL COMMENT '140字节算一条短信，短信长度超过140字节时会拆分成多条短信发送',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息回执';

DROP TABLE IF EXISTS `sms_send`;
CREATE TABLE IF NOT EXISTS `sms_send` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `phone_numbers` mediumtext COMMENT '短信接收号码',
  `sign_name` varchar(64) DEFAULT NULL COMMENT '短信签名',
  `template_code` varchar(1024) DEFAULT NULL COMMENT '短信模板ID',
  `template_param` mediumtext COMMENT '短信模板变量替换JSON串,友情提示:如果JSON中需要带换行符,请参照标准的JSON协议。',
  `sms_up_extend_code` varchar(64) DEFAULT NULL COMMENT '上行短信扩展码,无特殊需要此字段的用户请忽略此字段',
  `out_id` varchar(256) DEFAULT NULL COMMENT '外部流水扩展字段',
  `request_id` varchar(1024) DEFAULT NULL COMMENT '请求ID',
  `biz_id` varchar(1024) DEFAULT NULL COMMENT '发送回执ID,可根据该ID查询具体的发送状态',
  `code` varchar(128) DEFAULT NULL COMMENT '状态码-返回OK代表请求成功,其他错误码详见错误码列表',
  `message` varchar(1024) DEFAULT NULL COMMENT '状态码的描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='发送短消息';

DROP TABLE IF EXISTS `sms_template`;
CREATE TABLE IF NOT EXISTS `sms_template` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `title` varchar(16) DEFAULT NULL COMMENT '模板名称',
  `content` varchar(128) DEFAULT NULL COMMENT '模板内容',
  `code` varchar(16) DEFAULT NULL COMMENT '模板标识',
  `type_name` varchar(50) DEFAULT NULL COMMENT '模板类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模板';

DROP TABLE IF EXISTS `sms_up`;
CREATE TABLE IF NOT EXISTS `sms_up` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `phone_number` varchar(64) DEFAULT NULL COMMENT '短信接收号码',
  `content` varchar(1024) DEFAULT NULL COMMENT '短信内容',
  `sign_name` varchar(1024) DEFAULT NULL COMMENT '短信签名',
  `send_time` varchar(1024) DEFAULT NULL COMMENT '时间',
  `dest_code` varchar(1024) DEFAULT NULL COMMENT '扩展码',
  `sequence_id` varchar(1024) DEFAULT NULL COMMENT '消息序列ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信上行';


drop table if exists sms_signname
create table if not exists sms_signname
(
  id                    bigint          not null
  comment 'id'
    primary key,
  tenant_id             bigint          not null
  comment '客户单位id',
  tenant_name           varchar(50)     not null
  comment '单位名称',
  tenant_wechatapp_id   bigint          not null
  comment '客户服务号id',
  tenant_wechatapp_name varchar(50)     not null
  comment '服务号名称',
  sign_name             varchar(16)     not null
  comment '签名',
  state                 int default '0' null
  comment '状态',
  create_time           datetime        null
  comment '创建时间',
  update_time           datetime        null
  comment '最后修改时间',
  constraint uk_wechatapp_id_signname
  unique (tenant_wechatapp_id, sign_name)
)
  comment '服务号签名'
  charset = utf8mb4;

use `sms`;
INSERT INTO sms.sms_template (id, title, content, code, type_name, create_time, update_time) VALUES (462179875399274496, '短信通知', '尊敬的贵宾${user}：您在${shop}消费了${amount},为您积分${integral}，积分可兑换礼品或抵现', 'SMS_115390968', 'sales', '2018-06-29 08:57:49', '2018-06-29 08:57:49');
INSERT INTO sms.sms_template (id, title, content, code, type_name, create_time, update_time) VALUES (462180734325624832, '验证码', '您的验证码${code}，该验证码10分钟内有效，请勿泄漏于他人！如非本人操作，请忽略本条信息。', 'SMS_136176446', 'verification_code', '2018-06-29 09:01:14', '2018-06-29 09:01:14');

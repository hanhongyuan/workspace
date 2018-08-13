use mysql;

-- 1
DROP DATABASE IF EXISTS `activity_service`;
CREATE DATABASE activity_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'activityuser';
CREATE USER 'activityuser'@'%' IDENTIFIED BY 'ihdbje3N4JH5';
GRANT ALL ON activity_service.* TO 'activityuser'@'%';

-- 2
DROP DATABASE IF EXISTS `authorization_service`;
CREATE DATABASE authorization_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'authorizationuser';
CREATE USER 'authorizationuser'@'%' IDENTIFIED BY 'LkZcisEyXbfm';
GRANT ALL ON authorization_service.* TO 'authorizationuser'@'%';

-- 3
DROP DATABASE IF EXISTS `comment_service`;
CREATE DATABASE comment_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'commentuser';
CREATE USER 'commentuser'@'%' IDENTIFIED BY '7BW7wdjUt99W';
GRANT ALL ON comment_service.* TO 'commentuser'@'%';

-- 4
DROP DATABASE IF EXISTS `coupon_service`;
CREATE DATABASE coupon_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'couponuser';
CREATE USER 'couponuser'@'%' IDENTIFIED BY 'gVYXR6DdhGBB';
GRANT ALL ON coupon_service.* TO 'couponuser'@'%';

-- 5
DROP DATABASE IF EXISTS `customize_page`;
CREATE DATABASE customize_page CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'customize_pageuser';
CREATE USER 'customize_pageuser'@'%' IDENTIFIED BY 'CniukrTTaw2k';
GRANT ALL ON customize_page.* TO 'customize_pageuser'@'%';

-- 6
DROP DATABASE IF EXISTS `erp_sync`;
CREATE DATABASE erp_sync CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'erpuser';
CREATE USER 'erpuser'@'%' IDENTIFIED BY 'EvBRrxga8jEB';
GRANT ALL ON erp_sync.* TO 'erpuser'@'%';

-- 7
DROP DATABASE IF EXISTS `gift_mail`;
CREATE DATABASE `gift_mail` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'giftuser';
CREATE USER 'giftuser'@'%' IDENTIFIED BY 'tfDkWQ5xbcJr';
GRANT ALL ON gift_mail.* TO 'giftuser'@'%';

-- 8
DROP DATABASE IF EXISTS `message_push`;
CREATE DATABASE message_push CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'message_pushuser';
CREATE USER 'message_pushuser'@'%' IDENTIFIED BY 'c2LEeBr7D6Fs';
GRANT ALL ON message_push.* TO 'message_pushuser'@'%';

-- 9
DROP DATABASE IF EXISTS `oss`;
CREATE DATABASE oss CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'ossuser';
CREATE USER 'ossuser'@'%' IDENTIFIED BY 'wb5VQLDwUAae';
GRANT ALL ON oss.* TO 'ossuser'@'%';

-- 10
DROP DATABASE IF EXISTS `sms`;
CREATE DATABASE sms CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'smsuser';
CREATE USER 'smsuser'@'%' IDENTIFIED BY 'yCkbTrUP4zpG';
GRANT ALL ON sms.* TO 'smsuser'@'%';

-- 11
DROP DATABASE IF EXISTS `tenant`;
CREATE DATABASE tenant CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'tenantuser';
CREATE USER 'tenantuser'@'%' IDENTIFIED BY 'M4p5i8MZJ3kZ';
GRANT ALL ON tenant.* TO 'tenantuser'@'%';

-- 12
DROP DATABASE IF EXISTS `user_service`;
CREATE DATABASE user_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'useruser';
CREATE USER 'useruser'@'%' IDENTIFIED BY 'uyXBELcPyLWf';
GRANT ALL ON user_service.* TO 'useruser'@'%';

-- 13
DROP DATABASE IF EXISTS `warranty_service`;
CREATE DATABASE warranty_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'warrantyuser';
CREATE USER 'warrantyuser'@'%' IDENTIFIED BY '6Za6eeyZGbbw';
GRANT ALL ON warranty_service.* TO 'warrantyuser'@'%';

-- 14
DROP DATABASE IF EXISTS `wx_gateway`;
CREATE DATABASE wx_gateway CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'wxuser';
CREATE USER 'wxuser'@'%' IDENTIFIED BY 'YJ9wmzBKw99t';
GRANT ALL ON wx_gateway.* TO 'wxuser'@'%';

-- 15
DROP DATABASE IF EXISTS `account`;
CREATE DATABASE account CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'accountuser';
CREATE USER 'accountuser'@'%' IDENTIFIED BY 'UwAB5aC2q9PU';
GRANT ALL ON account.* TO 'accountuser'@'%';

--16
DROP DATABASE IF EXISTS `position`;
CREATE DATABASE position CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'positionuser';
CREATE USER 'positionuser'@'%' IDENTIFIED BY 'ZvjLyvNT8AWD';
GRANT ALL ON position.* TO 'positionuser'@'%';

--17
DROP DATABASE IF EXISTS `erp_to_platform`;
CREATE DATABASE erp_to_platform CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'platformuser';
CREATE USER 'platformuser'@'%' IDENTIFIED BY 'k7LwFvXfZ8c9';
GRANT ALL ON erp_to_platform.* TO 'platformuser'@'%';

--18
DROP DATABASE IF EXISTS `value_added`;
CREATE DATABASE value_added CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'addeduser';
CREATE USER 'addeduser'@'%' IDENTIFIED BY 'k7LwFvXfZ8c9';
GRANT ALL ON value_added.* TO 'addeduser'@'%';

--19
DROP DATABASE IF EXISTS h5link;
CREATE DATABASE h5link CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'h5linkuser';
CREATE USER 'h5linkuser'@'%' IDENTIFIED BY 'RpaXxPe2vvLk';
GRANT ALL ON h5link.* TO 'h5linkuser'@'%';

--20
DROP DATABASE IF EXISTS qrcode_service;
CREATE DATABASE qrcode_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'qrcodeuser';
CREATE USER 'qrcodeuser'@'%' IDENTIFIED BY '6a932gdssKsT';
GRANT ALL ON qrcode_service.* TO 'qrcodeuser'@'%';

--21
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'employeeuser';
CREATE USER 'employeeuser'@'%' IDENTIFIED BY 'E9PR9F8kYNQL';
GRANT ALL ON employee.* TO 'employeeuser'@'%';

--22
DROP DATABASE IF EXISTS `tag_service`;
CREATE DATABASE `tag_service` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'taguser';
CREATE USER 'taguser'@'%' IDENTIFIED BY 'Ph4pvvAFx5LX';
GRANT ALL ON tag_service.* TO 'taguser'@'%';USE activity_service;
-- create table
drop table if exists activity;
create table activity
(
   id                   bigint not null,
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   activity_type        varchar(32) not null comment '活动类型(枚举值：lottery抽奖)',
   activity_main_pic_url varchar(512) not null comment '活动主图',
   activity_name        varchar(32) not null comment '活动名称',
   start_time           datetime not null comment '开始时间',
   end_time             datetime not null comment '结束时间',
   activity_remark      varchar(256) not null comment '活动说明',
   status               int not null comment '状态(0停用，1启用)',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
);
alter table activity comment '活动';
create index idx_activity_tenant_type on activity
(
   tenant_id,
   tenant_wechatapp_id,
   activity_type
);
create index idx_activity_type on activity
(
   activity_type
);

drop table if exists lottery_activity;
create table lottery_activity
(
   id                   bigint not null,
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   activity_id          bigint not null comment '活动id',
   lottery_type         varchar(32) comment '抽奖类型(枚举值：super_big_turntable超级大转盘,squared_up九宫格)',
   is_once              bool not null default 0 comment '仅限一次',
   times_per_day        int(5) not null comment '每天N次',
   failure_remark       varchar(1000) not null comment '失败提示',
   activity_data        json comment '活动数据',
   partake_num          bigint default 0 comment '参与人数',
   partake_count        bigint default 0 comment '参与人次',
   lottery_num          bigint default 0 comment '中奖人数',
   lottery_count        bigint default 0 comment '中奖人次',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   version              bigint not null default 0 comment '数据版本号',
   primary key (id)
);
alter table lottery_activity comment '抽奖活动';
create index idx_lottery_activity_tenant on lottery_activity
(
   tenant_id,
   tenant_wechatapp_id
);
create index idx_lottery_activity_id on lottery_activity
(
   activity_id
);


drop table if exists lottery_prize;
create table lottery_prize
(
   id                   bigint not null,
   tenant_wechatapp_id  bigint not null comment '服务号id',
   tenant_id            bigint not null comment '单位id',
   activity_id          bigint not null comment '活动id',
   lottery_activity_id  bigint not null comment '抽奖活动id',
   prize_type           varchar(32) not null comment '奖品类型(枚举值：coupon优惠券, integral积分)',
   prize_item_name      varchar(50) comment '奖项名称',
   prize_name           varchar(50) comment '奖品名称',
   prize_image_url      varchar(512) comment '奖品图片',
   prize_push           int not null comment '奖品数量',
   prize_get            int default '0' comment '中奖数量',
   winning_probability  int not null comment '中奖概率',
   prize_data           json not null comment '奖品数据',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   version              bigint not null default 0 comment '数据版本号',
   primary key (id)
);
alter table lottery_prize comment '抽奖奖品';
create index idx_lottery_prize on lottery_prize
(
   lottery_activity_id
);

drop table if exists lottery_user;
create table lottery_user
(
   id                   bigint not null,
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   activity_id          bigint not null comment '活动id',
   lottery_activity_id  bigint not null comment '抽奖活动id',
   user_id              bigint not null comment '用户id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
);
alter table lottery_user comment '抽奖活动参与明细';
create index idex_lottery_user on lottery_user
(
   lottery_activity_id,
   user_id
);


drop table if exists lottery_winner;
create table lottery_winner
(
   id                   bigint not null,
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   activity_id          bigint not null comment '活动id',
   lottery_activity_id  bigint not null comment '抽奖活动id',
   user_id              bigint not null comment '用户id',
   head_img_url         varchar(512) comment '头像URL',
   user_name            varchar(32) comment '用户姓名',
   mobile_no            varchar(16) comment '用户手机号',
   prize_type           varchar(32) not null comment '奖品类型(枚举值：coupon优惠券, integral积分)',
   prize_name           varchar(50) comment '奖品名称',
   prize_image_url      varchar(512)  comment '奖品图片',
   prize_data           json not null comment '奖品数据',
   winning_prize        json not null comment '中奖数据',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
);
alter table lottery_winner comment '抽奖活动中奖明细';
create index idx_lottery_winner on lottery_winner
(
   lottery_activity_id,
   user_id
);USE authorization_service;
DROP TABLE IF EXISTS func;
CREATE TABLE func (
  id          BIGINT PRIMARY KEY NOT NULL,
  func_name   VARCHAR(32) COMMENT '功能名称',
  func_path   VARCHAR(256) COMMENT '功能路径',
  func_app    TINYINT COMMENT '1手机端，2桌面端',
  func_type   TINYINT            NOT NULL COMMENT '桌面端时：1模块，2菜单，3按钮, 手机端时：1模块，2页面，3操作',
  logo_url    VARCHAR(512) COMMENT '图标url',
  parent_id   BIGINT DEFAULT 0 COMMENT '父节点id',
  func_index  TINYINT COMMENT '序号',
  create_time DATETIME COMMENT '创建时间',
  update_time DATETIME COMMENT '最后修改时间'
  --   UNIQUE uk_func_path_parent_id(func_path, parent_id)
) COMMENT '功能即系统业务块，如商城、礼品商城等' CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS role;
CREATE TABLE role (
  id          BIGINT      NOT NULL,
  role_name   VARCHAR(32) NOT NULL COMMENT '角色名称',
  role_code   VARCHAR(32) NOT NULL COMMENT '角色代码',
  role_type   TINYINT     NOT NULL COMMENT '1平台角色,2单位角色,3服务号角色',
  role_logo   VARCHAR(512) COMMENT '角色logo',
  role_remark VARCHAR(128) COMMENT '角色说明',
  create_time DATETIME COMMENT '创建时间',
  update_time DATETIME COMMENT '最后修改时间',
  PRIMARY KEY (id),
  UNIQUE uk_role_code(role_code)
) COMMENT '角色' CHARACTER SET utf8mb4;
;

DROP TABLE IF EXISTS role_func;
CREATE TABLE role_func (
  id          BIGINT NOT NULL,
  role_id     BIGINT NOT NULL COMMENT '角色id',
  func_id     BIGINT NOT NULL COMMENT '功能id',
  create_time DATETIME COMMENT '创建时间',
  update_time DATETIME COMMENT '最后修改时间',
  PRIMARY KEY (id),
  UNIQUE uk_role_id_func_id(role_id, func_id)
) COMMENT '角色和功能的关联' CHARACTER SET utf8mb4;


DROP TABLE IF EXISTS user_role;
CREATE TABLE user_role (
  id                  BIGINT NOT NULL COMMENT 'id',
  user_id             BIGINT NOT NULL COMMENT '用户id',
  role_id             BIGINT NOT NULL COMMENT '角色id',
  tenant_id           BIGINT NOT NULL COMMENT '系统角色时为0',
  tenant_wechatapp_id BIGINT NOT NULL COMMENT '系统角色时为0',
  create_time         DATETIME COMMENT '创建时间',
  update_time         DATETIME COMMENT '最后修改时间',
  PRIMARY KEY (id),
  INDEX idx_role_id(role_id),
  UNIQUE uk_user_tenant_app_id(user_id, tenant_id, tenant_wechatapp_id, role_id)
) COMMENT '用户与角色的关联' CHARACTER SET utf8mb4;

# 登录相关
DROP TABLE IF EXISTS user_login_info;
CREATE TABLE user_login_info (
  id             BIGINT      NOT NULL COMMENT 'id',
  user_id        BIGINT      NOT NULL COMMENT '用户id',
  login_way      TINYINT     NOT NULL COMMENT '1账号密码登录，2微信扫码登录',
  login_name     VARCHAR(32) NOT NULL COMMENT '登录账号,微信扫码登录时为unionId',
  login_password VARCHAR(512) COMMENT '账号密码',
  login_salt     VARCHAR(32) COMMENT '密码加盐',
  create_time    DATETIME COMMENT '创建时间',
  update_time    DATETIME COMMENT '最后修改时间',
  PRIMARY KEY (id),
  UNIQUE uk_user_id_login_type(user_id, login_way),
  UNIQUE uk_login_way_name(login_way, login_name)
) COMMENT '用户登录账号' CHARACTER SET utf8mb4;


DROP TABLE IF EXISTS user_login_token;
CREATE TABLE user_login_token (
  id               BIGINT       NOT NULL COMMENT 'id',
  user_id          BIGINT       NOT NULL COMMENT '用户id',
  tenant_id        BIGINT COMMENT '租户id',
  tenant_wx_app_id BIGINT COMMENT '租户微信服务号id',
  login_way        TINYINT      NOT NULL COMMENT '1账号密码登录，2微信扫码登录',
  login_token      VARCHAR(64) NOT NULL COMMENT '凭据',
  status           TINYINT UNSIGNED COMMENT '0：无效，1：有效',
  expire_time      DATETIME COMMENT '过期时间',
  create_time      DATETIME COMMENT '创建时间',
  update_time      DATETIME COMMENT '最后修改时间',
  login_ip         VARCHAR(32) COMMENT '登录ip地址',
  PRIMARY KEY (id),
  UNIQUE uk_token(login_token)
) COMMENT '用户登录凭据' CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS permission;
CREATE TABLE permission (
  id          BIGINT PRIMARY KEY,
  path        VARCHAR(512) NOT NULL COMMENT '请求url',
  method      VARCHAR(64)  NOT NULL COMMENT '请求方法：GET,POST,*',
  status      TINYINT      NOT NULL  DEFAULT 1 COMMENT '状态：1-生效，2-无效',
  update_time DATETIME     NOT NULL,
  create_time DATETIME     NOT NULL
) COMMENT '权限表' CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS role_permission;
CREATE TABLE role_permission (
  id            BIGINT PRIMARY KEY,
  role_id       BIGINT   NOT NULL,
  permission_id BIGINT   NOT NULL,
  update_time   DATETIME NOT NULL,
  create_time   DATETIME NOT NULL,
  UNIQUE (role_id, permission_id)
) COMMENT '角色-权限表' CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS ignore_permission_url;
CREATE TABLE ignore_permission_url (
  id          BIGINT PRIMARY KEY,
  method      VARCHAR(16)   NOT NULL COMMENT '请求方法： *代表所有 ',
  url         VARCHAR(1024) NOT NULL COMMENT '请求地址： /xx/**',
  priority    TINYINT          DEFAULT 0 COMMENT '优先级',
  description VARCHAR(512) COMMENT '描述',
  status      TINYINT UNSIGNED DEFAULT 1 COMMENT '状态：0-无效，1-有效',
  create_time DATETIME,
  update_time DATETIME
) COMMENT '无需鉴权地址' CHARACTER SET utf8mb4;


/*删除短信签名模块*/
delete from authorization_service.func where id=456774384166768640;

/*系统管理员用户id修改*/
update user_role set user_id=20180715 where id=183260035114344448
update user_login_info set user_id=20180715 where id=183259332664893440

/**
角色添加字段 修改默认值
 */
alter table role add role_app tinyint DEFAULT 1  COMMENT '1桌面端 2手机端';
update role set role_app=2 where id in(183259005916028928,183259029018255360);use comment_service;

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   id                   bigint not null comment 'id',
	 tenant_id							BIGINT not null COMMENT '租户id',
	 tenant_wechatapp_id		BIGINT not NULL comment '客户服务号id',
   user_id              bigint not null comment '用户id',
   content              varchar(256) comment '评价内容',
   score                smallint not null comment '评分',
   primary_key_id       bigint not null comment '主键id,如订单id',
   foreign_key_id       bigint default 0 comment '外键id,如订单的商品的id',
   prize_id             bigint default 0 comment '评论奖励id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)CHARACTER SET utf8mb4;

alter table comment comment '评价内容';

/*==============================================================*/
/* Index: uk_comment                                            */
/*==============================================================*/
create unique index uk_comment on comment
(
   primary_key_id
);

/*==============================================================*/
/* Table: comment_image                                         */
/*==============================================================*/
create table comment_image
(
   id                   bigint not null comment 'id',
   comment_id           bigint not null comment '评价id',
   image_url            varchar(512) not null comment '图片url',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)CHARACTER SET utf8mb4;

alter table comment_image comment '评价图片';

/*==============================================================*/
/* Index: idx_comment_id                                        */
/*==============================================================*/
create index idx_comment_id on comment_image
(
   comment_id
);

/*==============================================================*/
/* Table: reply                                                 */
/*==============================================================*/
create table reply
(
   id                   bigint not null comment 'id',
	 tenant_id							BIGINT not null COMMENT '租户id',
	 tenant_wechatapp_id		BIGINT not NULL comment '客户服务号id',
   reply_user_id        bigint not null comment '回评用户id',
   content              varchar(256) not null comment '评价内容',
   comment_id           bigint not null comment '评价id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)CHARACTER SET utf8mb4;

alter table reply comment '回评内容';

/*==============================================================*/
/* Index: idx_reply_user_id                                     */
/*==============================================================*/
create index idx_reply_user_id on reply
(
   reply_user_id
);

/*==============================================================*/
/* Index: uk_comment_id                                         */
/*==============================================================*/
create unique index uk_comment_id on reply
(
   comment_id
);

/*==============================================================*/
/* Table: reply_image                                           */
/*==============================================================*/
create table reply_image
(
   id                   bigint not null comment 'id',
   reply_id             bigint not null comment '回评id',
   image_url            varchar(512) not null comment '图片url',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)CHARACTER SET utf8mb4;

alter table reply_image comment '回评图片';

/*==============================================================*/
/* Index: idx_comment_id                                        */
/*==============================================================*/
create index idx_comment_id on reply_image
(
   reply_id
);

use coupon_service;
drop table if exists coupon_get_center;
create table coupon_get_center
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   coupon_template_id   bigint not null comment '礼劵模板Id',
   put_quantity         int not null comment '投放数量，必须大于0',
   received_quantity    int default 0 comment '已领数量',
   remaining_quantity   int default 0 comment '剩余数量',
   get_limit_per_user   smallint not null comment '限领数量，必须大于等于0',
   state                tinyint not null comment '1已上架，2待上架',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id),
   INDEX idx_coupon_get_center(tenant_wechatapp_id,coupon_template_id),
   UNIQUE uk_tenant_wechatapp_id_coupon_template_id(tenant_wechatapp_id,coupon_template_id)
)comment '领券中心' CHARACTER SET utf8mb4;


drop table if exists coupon_give;
create table coupon_give
(
   id                   bigint not null comment 'id',
   coupon_template_id   bigint not null comment '礼劵模板Id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   user_id              bigint default 0  comment '用户id',
   get_token            varchar(32)  comment '领取时验证有效',
   coupon_user_id       bigint comment '已领取的券id',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id),
   INDEX idx_tenant_wechatapp_id_coupon_template_id_user_id(coupon_template_id,tenant_wechatapp_id,user_id)
) comment '礼券转赠' CHARACTER SET utf8mb4;


drop table if exists coupon_mall_order;
create table coupon_mall_order
(
   id                   bigint not null comment 'id',
   mall_product_id      bigint not null comment '产品id',
   price                decimal not null comment '价格',
   account_detail_id    bigint not null comment '账户明细id',
	 pay_type             tinyint comment '1积分，2现金',
   coupon_user_id       bigint comment '券id',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id)
) comment '券集市订单' CHARACTER SET utf8mb4;


drop table if exists coupon_mall_product;
create table coupon_mall_product
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   coupon_template_id   bigint not null comment '礼劵模板Id',
   put_quantity         int not null comment '投放数量，必须大于0',
   received_quantity    int default 0 comment '已领数量',
   remaining_quantity   int default 0 comment '剩余数量',
   get_limit_per_user   smallint comment '限领数量，必须大于等于0',
   state                tinyint not null comment '1已上架，2待上架',
   pay_type             tinyint comment '1积分，2现金',
   integral_price       int comment '积分价格',
   cash_price           decimal comment '现金价格',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
	 primary key (id),
	 INDEX idx_coupon_mall_product( tenant_wechatapp_id,coupon_template_id),
	 unique uk_tenant_wechatapp_id_coupon_template_id( tenant_wechatapp_id,coupon_template_id)
) comment '券集市商品' CHARACTER SET utf8mb4;


drop table if exists coupon_specify_category;
create table coupon_specify_category
(
   id                   bigint not null comment 'id',
   coupon_template_id   bigint not null comment '礼劵模板Id',
   category_id          bigint not null comment '商品类型Id',
   category_name        varchar(64) not null comment '商品小类名称',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id),
   unique uk_coupon_template_id_category_id( coupon_template_id,category_id)
) comment '礼劵模版指定商品小类关联' CHARACTER SET utf8mb4;


drop table if exists coupon_specify_product;
create table coupon_specify_product
(
   id                   bigint not null comment 'id',
   coupon_template_id   bigint not null comment '礼劵模板Id',
   product_id           bigint not null comment '商品Id',
   product_name         varchar(256) not null comment '商品名称',
   category_name        varchar(64) not null comment '商品类型名称',
   price                decimal not null comment '商品价格',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id)
) comment '礼劵模版指定商品关联' CHARACTER SET utf8mb4;


drop table if exists coupon_template;
create table coupon_template
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   coupon_name          varchar(64) not null comment '礼劵名称',
   face_value           decimal not null comment '礼劵面值',
   coupon_type          int not null comment '礼劵类型包括1线上礼劵（商城劵）、2线下礼劵（门店劵）、3通用券、4增值券',
   use_threshold        decimal not null comment '满多少元可以使用。0表示无限制（当礼劵类型为线上礼劵时才需要设置使用门槛）',
   begin_time           datetime not null comment '此时间表示此类礼劵总的有效开始时间和结束时间',
   end_time             datetime not null comment '有效期结束时间',
   create_channel       tinyint not null comment '创建渠道
            1领券中心
            2券集市
            3增值兑换
            4生日赠送
            5商家赠送
            6抽奖
            7绑定手机赠送

            ',
   scope                int not null comment '商品范围包括：全部商品、指定商品、指定商品小类',
   state                int not null comment '状态包括：启用、禁用',
   remark               varchar(256) comment '礼劵说明',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id),
   unique uk_tenant_wechatpp_id_coupon_name( tenant_wechatapp_id,coupon_name,create_channel),
   INDEX idx_coupon_type(coupon_type)
) comment '礼券模板' CHARACTER SET utf8mb4;


drop table if exists coupon_user;
create table coupon_user
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   tenant_id            bigint not null comment '租户id',
   coupon_template_id   bigint not null comment '礼劵模板Id',
   coupon_no            bigint not null comment '礼劵编号',
   coupon_state         int not null comment '礼劵状态
            1已领取,2已核销,3已过期',
   owner_id             bigint not null comment '所属用户id,现在券的拥有者,随着赠券可能发生变化',
   creator_id           bigint not null comment '创建用户id,原始获得券的用户id,记录创建则值不再变化',
   creator_name         varchar(20) default '' comment '创建人姓名',
   user_name            varchar(20) default '' comment '拥有者姓名',
   mobile_no            varchar(11) default '' comment '拥有者手机号码',
   create_channel       tinyint not null comment '创建渠道
            1领券中心
            2券集市
            3增值兑换
            4生日赠送
            5商家赠送
            6抽奖
            7绑定手机赠送

            ',
   coupon_name          varchar(256) not null comment '礼劵名称',
   face_value           decimal(10,2) not null comment '礼劵面值',
   coupon_type          int not null comment '礼劵类型包括1线上礼劵（商城劵）、2线下礼劵（门店劵）3、通用券4、增值劵（预留类型限定接口创建）',
   use_threshold        decimal not null comment '满多少元可以使用。0表示无限制（当礼劵类型为线上礼劵时才需要设置使用门槛）',
   begin_time           datetime comment '此时间表示此类礼劵总的有效开始时间和结束时间',
   end_time             datetime comment '有效期结束时间',
   remark               varchar(256) comment '礼劵说明',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id),
   INDEX idx_tenant_wechatapp_id_user_id(tenant_wechatapp_id,owner_id)
) comment '用户礼劵' CHARACTER SET utf8mb4;

drop index uk_tenant_wechatpp_id_coupon_name on coupon_template;

alter table coupon_user add creator_mobile_no varchar(20) COMMENT '创建者手机号码';

alter table coupon_template add take_effect_way tinyint NOT NULL  COMMENT '生效方式';
alter table coupon_template add take_effect_day int COMMENT '领取后多少天有效';

alter table coupon_template modify column begin_time datetime DEFAULT NULL COMMENT '此时间表示此类礼劵总的有效开始时间和结束时间';
alter table coupon_template modify column end_time datetime DEFAULT NULL COMMENT '有效期结束时间';

alter table coupon_template modify column use_threshold decimal(10) DEFAULT 0 COMMENT '使用门槛';

alter table coupon_user modify column use_threshold decimal(10) DEFAULT 0 COMMENT '使用门槛';

ALTER  table coupon_give ADD transfer_user_id BIGINT COMMENT '转赠人id';







use customize_page;

CREATE TABLE IF NOT EXISTS `customize_page` (
  `id` bigint(20) NOT NULL COMMENT 'Id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '商户Id',
  `tenant_wechatapp_id` bigint(20) DEFAULT NULL COMMENT '服务号Id',
  `page_name` varchar(128) NOT NULL COMMENT '页面名称',
  `title` varchar(256) NOT NULL COMMENT '标题',
  `modules` text COMMENT '模板内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_tenant_wechatapp_id_url_uindex` (`tenant_wechatapp_id`,`page_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='页面';


drop table if exists special_topic;

drop table if exists special_topic_collect;

/*==============================================================*/
/* Table: special_topic                                         */
/*==============================================================*/
create table special_topic
(
   id                   bigint not null comment 'id',
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   title                varchar(32) not null comment '标题',
   summary              varchar(128) comment '摘要',
   master_img    varchar(128) not null comment '列表主图',
   customize_page_id	        bigint comment '自定义页id',
   hits                  int default '0' comment '点击量',
   collect               int default '0' comment '收藏量',
   topping              bool default 0 comment '置顶',
   topping_time         datetime comment '置顶时间',
   puton_status         bool default 0 comment '上架状态',
   puton_time           datetime comment '上架时间',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '最后修改时间',
   primary key (id)
);

alter table special_topic comment '专题';

/*==============================================================*/
/* Table: special_topic_collect                                 */
/*==============================================================*/
create table special_topic_collect
(
   id                   bigint not null comment 'id',
   special_topic_id     bigint not null comment '专题id',
   user_id              bigint not null comment '用户id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '最后修改时间',
   primary key (id)
);

alter table special_topic_collect comment '专题收藏';



/*==============================================================*/
/* Index: uk_special_topic                                      */
/*==============================================================*/
create unique index uk_special_topic on special_topic_collect
(
   special_topic_id,
   user_id
);

alter table special_topic_collect add constraint fk_reference_2 foreign key (special_topic_id)
      references special_topic (id) on delete restrict on update restrict;

USE erp_sync;

DROP TABLE IF EXISTS synch_retries;
-- auto-generated definition
CREATE TABLE synch_retries (
  id       BIGINT AUTO_INCREMENT COMMENT '重试数据记录id' PRIMARY KEY,
  data     VARCHAR(4000) COMMENT '重试同步数据',
  put_time DATETIME COMMENT '发起同步时间',
  retries  INT    DEFAULT '0' COMMENT '重试次数',
  origin   INT    DEFAULT '0' COMMENT '数据来源，0：同步程序，1：同步程序同步队列，2：业务程序同步队列'
) COMMENT '同步重试记录表' CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS synch_log;
-- auto-generated definition
CREATE TABLE synch_log (
  id            BIGINT NOT NULL COMMENT '唯一编号，由业务传入' PRIMARY KEY,
  data          VARCHAR(4000) COMMENT '同步数据',
  synch_time    DATETIME COMMENT '同步成功时间',
  tenant_app_id BIGINT NULL
  COMMENT '租户公众号ID',
  tenant_id     BIGINT NULL
  COMMENT '租户id'
) COMMENT '同步日志表，记录同步的数据，防止重复同步' CHARACTER SET utf8mb4;

CREATE INDEX synch_log_tenant_id_tenant_app_id_index
  ON synch_log (tenant_id, tenant_app_id);

ALTER TABLE synch_log
  MODIFY synch_time DATETIME COMMENT '同步成功时间'; 
  
CREATE TABLE retry_data (
  id            BIGINT PRIMARY KEY,
  business_type VARCHAR(128),
  tenant_id     BIGINT,
  tenant_app_id BIGINT,
  user_id       BIGINT,
  erp_member_id BIGINT,
  data          TEXT,
  retry_times   INTEGER UNSIGNED,
  create_time   DATETIME
) COMMENT '重试数据表' DEFAULT CHARSET utf8mb4;

ALTER TABLE retry_data
  ADD COLUMN operation_type VARCHAR(16) AFTER business_type,
  ADD COLUMN need_erp_member_id TINYINT UNSIGNED AFTER erp_member_id;  use gift_mail;

/*==============================================================*/
/* Table: category 商品分类                                    */
/*==============================================================*/
drop table if exists category;
create table category
(
   id                   bigint not null comment 'ID',
   tenant_wechatapp_id  bigint not null comment '商家Id',
   categroy_name        varchar(16) not null comment '商品分类名称,最小长度2',
   parent_id            bigint not null comment '父类id',
   image_url             varchar(512) comment '默认图片，最少10个字符',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
) DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table category comment '商品分类';

/*==============================================================*/
/* Index: uk_category_name                                      */
/*==============================================================*/
create unique index uk_category_name on category
(
   tenant_wechatapp_id,
   categroy_name,
   parent_id
);

/*==============================================================*/
/* Table: inventory  库存                                      */
/*==============================================================*/
drop table if exists inventory;
create table inventory
(
   id                   bigint not null comment 'ID',
   product_id           bigint not null comment '产品ID',
   product_name          varchar(64) comment '产品名称',
   quantity             int not null comment '剩余数量',
   volume               int default 0 comment '销量',
   barcode               varchar(64) comment '货号',
   specification        varchar(16) not null comment '规格1,最小长度2',
   price                int not null comment '价格',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table inventory comment '库存';

drop table if exists inventory_log;
create table inventory_log
(
   id                   bigint not null comment 'ID',
   inventory_id         bigint not null comment '库存ID',
   quantity_before      int not null comment '调整前数量',
   quantity_arfter      int not null comment '调整后数量',
   quantity_chage       int not null comment '调整数量',
   user_id              bigint not null comment '调整人编号',
   remark               varchar(512) comment '备注',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table inventory_log comment '库存修改记录';

/*==============================================================*/
/* Index: uk_inventory                                          */
/*==============================================================*/

create unique index uk_inventory on inventory
(
   product_id,
   specification
);

/*==============================================================*/
/* Table: 异业商家                                             */
/*==============================================================*/
drop table if exists partner;
create table partner
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   partner_name         varchar(32) not null comment '商家名称，最小4',
   contact              varchar(256) not null comment '联系方式，最小4',
   tel                  varchar(32) not null comment '电话号码，最小7',
   address              varchar(256) not null comment '地址，最小10',
   logo_url             varchar(512) not null comment '品牌logo',
   manager_mobile_no    varchar(16) not null comment '收款人手机号码最小11',
   manager_user_id      bigint comment '收款人OpenId',
   lon                  varchar(32) comment '经度',
   lat                  varchar(32) comment '纬度',
   shop_id              bigint not null comment '门店id',
   shop_name            varchar(32) not null comment '提货门店名称',
   remark               varchar(512) comment '备注',
   is_disable           bool comment '停用标志',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
alter table partner comment '异业商家';

/*==============================================================*/
/* Table: partner_product 异业商品                             */
/*==============================================================*/
drop table if exists partner_product;
create table partner_product
(
   id                   bigint not null comment 'id',
   product_id           bigint not null comment '产品ID',
   partner_id           bigint comment '异业商家id',
   settlement_price     decimal(10,2) comment '异业结算价',
   can_get_per_day      int default 0 comment '每天可兑换件数',
   integral_price       int comment '异业积分价',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table partner_product comment '异业商品';


/*==============================================================*/
/* Table: partner_trade_pay  异业商家订单付款                  */
/*==============================================================*/
drop table if exists partner_trade_pay;
create table partner_trade_pay
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   partner_id           bigint not null comment '异业商家ID',
   trade_id             bigint comment '订单Id',
   trade_no             varchar(32) not null comment '商户单号',
   transaction_id       varchar(32) not null comment '微信支付单号',
   manager_user_id      bigint comment '收款人id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table partner_trade_pay comment '异业商家订单付款';

/*==============================================================*/
/* Table: product  商品                                        */
/*==============================================================*/
drop table if exists product;
create table product
(
   id                   bigint not null comment 'id',
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   product_name          varchar(64) not null comment '商品名称，最少4个字符',
   product_type         int not null comment '商品类型，1自有商品 2异业商品',
   category_id          bigint not null comment '品类Id',
   product_status       int not null default 1 comment '商品状态，1，正常，0 下架',
   tag_price            decimal(10,2) default 0 comment '市场价',
   volume               int default 0 comment '销量',
   default_image_url     varchar(512) comment '图片，最少10个字符',
   is_disable           bool default 0 comment '停用标志',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table product comment '商品';

/*==============================================================*/
/* Index: idx_category_id                                       */
/*==============================================================*/

create index idx_category_id on product
(
   category_id
);

/*==============================================================*/
/* Table: product_status 商品上架状态                                       */
/*==============================================================*/
drop table if exists product_status;
create table product_status
(
   id                   bigint not null comment 'id',
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   product_id           bigint not null comment '商品id',
   price                int not null default 1 comment '价格',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
);

alter table product_status comment '商品上架状态';

/*==============================================================*/
/* Index: uk_product_status                                     */
/*==============================================================*/
create unique index uk_product_status on product_status
(
   tenant_wechatapp_id,
   product_id
);

/*==============================================================*/
/* Table: product_desc  商品详情                                */
/*==============================================================*/
drop table if exists product_desc;
create table product_desc
(
   id                   bigint not null comment 'ID',
   tenant_wechatapp_id  bigint not null comment '商家ID',
   product_id           bigint not null comment '产品Id',
   product_desc         text not null comment '详情',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table product_desc comment '商品详情';

/*==============================================================*/
/* Index: uk_product_id                                         */
/*==============================================================*/

create unique index uk_product_id on product_desc
(
   product_id
);

/*==============================================================*/
/* Table: product_image  产品图片                               */
/*==============================================================*/
drop table if exists product_image;
create table product_image
(
   id                   bigint not null comment 'ID',
   tenant_wechatapp_id  bigint not null comment '商家ID',
   product_id           bigint not null comment '产品ID',
   image_url            varchar(512) not null comment '图片url',
   image_index          SMALLINT not null comment '图片顺序',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table product_image comment '产品图片';

/*==============================================================*/
/* Index: idx_product_id                                        */
/*==============================================================*/

create index idx_product_id on product_image
(
   product_id
);

/*==============================================================*/
/* Index: uk_product_image                                      */
/*==============================================================*/

create index uk_product_image on product_image
(
   product_id,
   image_index
);

/*==============================================================*/
/* Table: self_product 自有商品                                */
/*==============================================================*/
drop table if exists self_product;
create table self_product
(
   id                   bigint not null comment 'id',
   product_id           bigint not null comment '产品Id',
   take_type            int not null default 0 comment '提货方式',
   lead_day             int default 0 comment '备货周期，最大100，最小0',
   price                NUMERIC(10,2) DEFAULT 0 COMMENT '价格',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table self_product comment '自有商品';

/*==============================================================*/
/* Table: take_shop    提货门店                                */
/*==============================================================*/
drop table if exists take_shop;
create table take_shop
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   shop_id              bigint not null comment '门店Id',
   shop_name            varchar(32) not null comment '提货门店名称',
   product_id           bigint not null comment '产品Id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table take_shop comment '提货门店';

/*==============================================================*/
/* Index: uk_take_shop                                          */
/*==============================================================*/

create unique index uk_take_shop on take_shop
(
   tenant_wechatapp_id,
   shop_id,
   product_id
);

/*==============================================================*/
/* Table: trade    订单                                        */
/*==============================================================*/
drop table if exists trade;
create table trade
(
   id                   bigint not null comment 'id',
   tenant_id            bigint NOT NULL COMMENT '单位号',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   trade_no             varchar(32) not null comment '订单号为雪花算法生成，最小长度4',
   trade_type           int not null default 1 comment '订单类型  1自有商品 2异业商品',
   user_id              bigint not null comment '会员id',
   mobile_no             VARCHAR(16) not null comment '会员手机号码',
   product_id           bigint not null comment '产品id',
   product_name          varchar(64) not null comment '商品名称',
   price                int not null default 0 comment '价格',
   quantity             int not null default 1 comment '数量',
   remark                varchar(512) comment '订单备注',
   inventory_id         bigint comment '库存Id',
   order_status         int not null default 1 comment '订单状态',
   specification        varchar(16)  comment '规格最小长度2',
   delivered            bool default 0 comment '妥投状态',
   take_type            int default 0 comment '提货方式',
   expressid            bigint default 0 comment '快递发货Id',
   is_disable           bool comment '是否删除',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table trade comment '订单';

/*==============================================================*/
/* Table: trade_addr  订单收货信息                             */
/*==============================================================*/
drop table if exists trade_addr;
create table trade_addr
(
   id                   bigint not null comment 'ID',
   tenant_wechatapp_id  bigint not null comment '商家ID',
   user_id              bigint not null comment '会员ID',
   trade_id             bigint not null comment '订单ID',
   recipients            varchar(20) not null comment '收件人，最小2',
   user_tel              varchar(20) not null comment '联系电话,最小10，最大20',
   address               varchar(64) not null comment '收件地址，最小10',
   area                 varchar(32) not null comment '省市区',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table trade_addr comment '订单收货信息';

/*==============================================================*/
/* Table: trade_express  订单快递发货                          */
/*==============================================================*/
drop table if exists trade_express;
create table trade_express
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   trade_id             bigint not null comment '订单Id',
   express_company       varchar(32) not null comment '快递公司，最小4',
   express_no            varchar(32) not null comment '快递单号，最小8',
   remark                varchar(512) comment '备注',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table trade_express comment '订单快递发货';

drop table if exists trade_log;
/*==============================================================*/
/* Table: trade_log     订单日志                                */
/*==============================================================*/
create table trade_log
(
   id                   bigint not null comment 'id',
   trade_id  bigint not null comment '订单ID',
   remark               varchar(4000) comment '说明',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table trade_log comment '订单日志';

/*==============================================================*/
/* Table: trade_take  门店提货                                 */
/*==============================================================*/
drop table if exists trade_take;
create table trade_take
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   trade_id             bigint not null comment '订单Id',
   shop_id              bigint not null comment '提货门店',
   shop_name            varchar(32) not null comment '提货门店名称',
   can_take_date        datetime not null comment '可提货日期',
   remark               varchar(512) comment '备注',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table trade_take comment '门店提货';
USE `message_push`;

DROP TABLE IF EXISTS `wx_template_mapping`;
CREATE TABLE IF NOT EXISTS `wx_template_mapping` (
  `id` bigint(20) NOT NULL COMMENT '标识',
  `scene_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '对应SceneTypeEnum',
  `wx_template_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信模板Id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='微信模板映射';

DROP TABLE IF EXISTS `message_log`;
CREATE TABLE IF NOT EXISTS `message_log` (
  `id` bigint(20) NOT NULL comment '标识' primary key,
  `tenant_id` bigint(20) NULL  comment '商户Id',
  `tenant_app_id` bigint(20) NULL  comment '服务号Id',
  `user_id` bigint(20) NULL  comment '用户Id',
  `scene_type` varchar(128) null  comment '场景类型',
  `post_data`  text null  comment '推送消息内容',
  `create_time`  datetime null  comment '创建时间',
  `update_time`  datetime null  comment '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息推送记录';

use `message_push`;
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (465448286967435264, 'points_change', 'OPENTM207665167', '2018-07-08 09:26:51', '2018-07-08 09:26:52');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (465448717420466176, 'coupon_get', 'OPENTM207804704', '2018-07-08 09:27:48', '2018-07-08 09:27:49');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (465448940687462400, 'coupon_exchange', 'TM00232', '2018-07-08 09:28:29', '2018-07-08 09:28:31');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (465449117024391168, 'coupon_expiring', 'OPENTM207251323', '2018-07-08 09:29:13', '2018-07-08 09:29:14');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (465449304862101504, 'coupon_write_off', 'OPENTM206215005', '2018-07-08 09:30:10', '2018-07-08 09:30:11');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (465449542377148416, 'gift_exchange_success', 'OPENTM411613106', '2018-07-08 09:31:02', '2018-07-08 09:31:03');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (465449766415896576, 'value_added_create', 'OPENTM402063677', '2018-07-08 09:34:17', '2018-07-08 09:34:18');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (465451167246323712, 'value_added_holding', 'OPENTM207940503', '2018-07-08 09:37:39', '2018-07-08 09:37:40');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (465451429398712320, 'value_added_impairment', 'OPENTM207940503', '2018-07-08 09:38:31', '2018-07-08 09:38:32');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (465451658101526528, 'product_cert_added', 'OPENTM402063677', '2018-07-08 09:39:19', '2018-07-08 09:39:20');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (467356143602241536, 'sales', 'TM00504', '2018-07-13 07:46:52', '2018-07-13 07:46:55');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (467356143602241336, 'gift_take_success', 'OPENTM414526462', '2018-07-13 07:46:52', '2018-07-13 07:46:55');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (467356143602571536, 'gift_send_success', 'OPENTM405848800', '2018-07-13 07:46:52', '2018-07-13 07:46:55');

DROP TABLE IF EXISTS `schedule_task`;
CREATE TABLE IF NOT EXISTS `schedule_task`
(
  id          bigint PRIMARY KEY NOT NULL COMMENT  '标识',
  schedule_time bigint NOT NULL COMMENT '计划任务时间也是redis的key',
  topic       varchar(128) NOT NULL COMMENT 'rocketmq消息topic',
  tag         varchar(128) NOT NULL COMMENT 'rocketmq消息tag',
  post_data   text NOT NULL COMMENT 'rocketmq消息推送数据json',
  create_time datetime COMMENT '记录创建时间',
  update_time datetime COMMENT '更新时间'
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='计划任务备份';

USE `oss`;

DROP TABLE IF EXISTS `oss_res`;
CREATE TABLE IF NOT EXISTS `oss_res` (
  `Id` bigint(20) NOT NULL,
  `Bucket` varchar(100) NOT NULL DEFAULT '0',
  `Object` varchar(100) NOT NULL DEFAULT '0',
  `Etag` varchar(100) NOT NULL DEFAULT '0',
  `Size` int(11) NOT NULL DEFAULT '0',
  `Mimetype` varchar(100) DEFAULT '0',
  `Imageinfoheight` int(11) NOT NULL DEFAULT '0',
  `Imageinfowidth` int(11) NOT NULL DEFAULT '0',
  `Imageinfoformat` varchar(100) DEFAULT '0',
  `Extdata` text,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='oss 上传回执';USE `sms`;

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
use `tenant`;

CREATE TABLE `erp_department` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户单位id',
  `dept_name` varchar(32) NOT NULL COMMENT '部门名称',
  `dept_erp_id` bigint(20) NOT NULL COMMENT '部门erpid',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '是否停用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_department` (`tenant_id`,`dept_erp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门'

CREATE TABLE `erp_employee` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户单位id',
  `employee_erp_id` bigint(20) NOT NULL COMMENT '员工erpid',
  `employee_name` varchar(32) NOT NULL COMMENT '员工名称',
  `employee_jobno` varchar(16) DEFAULT NULL COMMENT '员工工号',
  `mobile_no` varchar(16) NOT NULL COMMENT '手机号码',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `employee_type` varchar(20) DEFAULT NULL COMMENT '员工类型',
  `dept_erp_id` bigint(20) NOT NULL COMMENT '所属部门erpid',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '是否停用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_employee` (`tenant_id`,`employee_erp_id`),
  UNIQUE KEY `idx_mobile_no` (`tenant_id`,`mobile_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='员工'

CREATE TABLE `erp_integral_log` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户单位id',
  `integral_erp_id` bigint(20) DEFAULT NULL COMMENT '积分异动erpid',
  `member_erp_id` bigint(20) NOT NULL COMMENT '会员erpid',
  `note_erp_id` bigint(20) DEFAULT NULL COMMENT '单据id',
  `remark` varchar(256) DEFAULT NULL COMMENT '异动说明',
  `integral` int(11) DEFAULT NULL COMMENT '积分值',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '是否停用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `tenant_wechatapp_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_integral_log` (`tenant_id`,`integral_erp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='积分异动记录'

CREATE TABLE `erp_pallet` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户单位id',
  `dept_erp_id` bigint(20) NOT NULL COMMENT '部门erpid',
  `pallet_erp_id` bigint(20) NOT NULL COMMENT '看货盘erpid',
  `pallet_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '看货盘编号',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '是否停用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_pallet` (`tenant_id`,`pallet_erp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='看货盘'

CREATE TABLE `erp_pallet_product` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户单位id',
  `pallet_product_erp_id` bigint(20) DEFAULT NULL COMMENT '记录erpid',
  `pallet_erp_id` bigint(20) NOT NULL COMMENT '看货盘erpid',
  `product_erp_id` bigint(20) NOT NULL COMMENT '产品id',
  `product_barcode` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品条码',
  `product_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称',
  `stone_weight` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '石重',
  `gold_weight` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '金重',
  `total_weight` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '总重',
  `remark` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其它备注信息',
  `tag_price` decimal(10,0) NOT NULL COMMENT '上柜价',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `erp_pallet_product_tenant_id_pallet_product_erp_id_uindex` (`tenant_id`,`pallet_product_erp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='看货盘看货记录'

CREATE TABLE `erp_product_category` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户单位id',
  `category_name` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品分类名称',
  `category_erp_id` bigint(20) NOT NULL COMMENT '产品分类erpid',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '是否停用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_product_category` (`tenant_id`,`category_erp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品分类'

CREATE TABLE `erp_sales` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户单位id',
  `tenant_wechatapp_id` bigint(20) NOT NULL COMMENT '客户服务号id',
  `sales_erp_id` bigint(20) NOT NULL COMMENT '销售单erpid',
  `sales_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售单单号',
  `sales_date` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '入账日期',
  `member_erp_id` bigint(20) NOT NULL COMMENT '会员erpid',
  `employee_erp_id` bigint(20) NOT NULL COMMENT '导购erpid',
  `employee_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '导购名称',
  `dept_erp_id` bigint(20) NOT NULL COMMENT '部门erpid',
  `amount` decimal(10,0) NOT NULL COMMENT '实收金额',
  `sales_remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单据备注',
  `receipts` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收款信息',
  `sales_status` tinyint(4) NOT NULL COMMENT '单据状态',
  `busi_date` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '录入系统的日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sales` (`tenant_id`,`sales_erp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='销售单主表'

CREATE TABLE `erp_sales_detail` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户单位id',
  `tenant_wechatapp_id` bigint(20) NOT NULL COMMENT '客户服务号id',
  `sales_erp_id` bigint(20) NOT NULL COMMENT '销售单erpid',
  `sales_index` tinyint(4) NOT NULL COMMENT '单内序号',
  `sales_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售类型',
  `product_barcode` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品条码',
  `product_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称',
  `cert_no` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证书号',
  `hand_size` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手寸',
  `category_erp_id` bigint(20) NOT NULL COMMENT '产品分类erpid',
  `category_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品分类名称',
  `stone_weight` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '石重',
  `gold_weight` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '金重',
  `total_weight` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '总重',
  `quantity` smallint(6) NOT NULL COMMENT '数量',
  `amount_total` decimal(10,0) NOT NULL COMMENT '应付金额，包括了优惠金额，积分抵现等',
  `amount_pay` decimal(10,0) NOT NULL COMMENT '实际支付的金额，不包括优惠金额',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `remark` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sales_detail` (`tenant_id`,`sales_erp_id`,`sales_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='销售从表'




/*==============================================================*/
/* Table: tenant                                                */
/*==============================================================*/
CREATE TABLE tenant
(
  id               BIGINT      NOT NULL COMMENT 'id',
  full_name        VARCHAR(64) NOT NULL COMMENT '全称',
  short_name       VARCHAR(16) NOT NULL COMMENT '简称',
  contact_name     VARCHAR(16) NOT NULL COMMENT '联系人姓名',
  contact_tel      VARCHAR(16) NOT NULL COMMENT '联系人电话',
  area             VARCHAR(64) COMMENT '地区',
  address          VARCHAR(128) COMMENT '地址',
  admin_user_id    BIGINT      NOT NULL COMMENT '管理员id',
  status           tinyint COMMENT '状态，1有效，2无效，3删除',
  erp_address      VARCHAR(128) COMMENT 'erp地址',
  wechatapp_number INT COMMENT '允许服务号数量',
  admin_user_tel   VARCHAR(20) COMMENT '联系电话',
  conduct          TINYINT COMMENT '管理方式0其他,1单位统一管理,2按服务号管理',
  creator_user_id  BIGINT      NOT NULL COMMENT '创建人id',
  create_time      DATETIME COMMENT '创建时间',
  update_time      DATETIME COMMENT '最后修改时间',
  erp_connect_str  VARCHAR(255) COMMENT 'erp连接字符串',
  PRIMARY KEY (id)
);

ALTER TABLE tenant.tenant
  COMMENT '客户单位';

/*==============================================================*/
/* Table: tenant_wechatapp                                      */
/*==============================================================*/
CREATE TABLE tenant_wechatapp
(
  id           BIGINT      NOT NULL COMMENT 'id',
  tenant_id    BIGINT      NOT NULL COMMENT '租户id',
  wechat_appid VARCHAR(32) NOT NULL COMMENT '微信appid',
  brand_name   VARCHAR(32) COMMENT '品牌名称',
  is_disable   BOOL COMMENT '停用',
  auth_status  TINYINT COMMENT '授权状态:1-授权,0-未授权',
  auth_time    DATETIME COMMENT '授权或者取消授权时间',
  create_time  DATETIME COMMENT '创建时间',
  update_time  DATETIME COMMENT '最后修改时间',
  PRIMARY KEY (id),
  UNIQUE KEY uk_wechat_appid (wechat_appid)
) COMMENT '客户服务号';

/*==============================================================*/
/* Table: tenant_wechatapp_para                                 */
/*==============================================================*/
CREATE TABLE tenant_wechatapp_para
(
  id                  BIGINT       NOT NULL COMMENT 'id',
  tenant_wechatapp_id BIGINT       NOT NULL COMMENT '服务号Id',
  para_code           VARCHAR(32)  NOT NULL COMMENT '参数代码',
  para_value          VARCHAR(512) NOT NULL COMMENT '参数值',
  create_time         DATETIME COMMENT '创建时间',
  update_time         DATETIME COMMENT '最后修改时间',
  PRIMARY KEY (id)
);

ALTER TABLE tenant.tenant_wechatapp_para
  COMMENT '服务号参数';

/*==============================================================*/
/* Index: uk_tenant_wechatapp_id_para_name                      */
/*==============================================================*/
CREATE UNIQUE INDEX uk_tenant_wechatapp_id_para_name ON tenant.tenant_wechatapp_para
(
  tenant_wechatapp_id,
  para_code
);

/*==============================================================*/
/* Table: tenant_wechatapp_shop                                 */
/*==============================================================*/
CREATE TABLE tenant_wechatapp_shop
(
  id                  BIGINT PRIMARY KEY COMMENT 'id',
  tenant_wechatapp_id BIGINT NOT NULL COMMENT '客户服务号id',
  tenant_id           BIGINT NOT NULL COMMENT '租户id',
  dept_erp_id         BIGINT NOT NULL COMMENT '部门erpid',
  shop_name           VARCHAR(32) COMMENT '门店名称',
  shop_address        VARCHAR(128) COMMENT '门店地址',
  shop_image_url      VARCHAR(512) COMMENT '门店图片',
  shop_manager_name   VARCHAR(32) COMMENT '负责人姓名',
  shop_tel            VARCHAR(16) COMMENT '门店电话',
  shop_hours          VARCHAR(32) COMMENT '营业时间',
  shop_traffic        VARCHAR(64) COMMENT '交通提示',
  shop_longitude      DECIMAL(20, 10) COMMENT '经度',
  shop_latitude       DECIMAL(20, 10) COMMENT '纬度',
  create_time         DATETIME COMMENT '创建时间',
  update_time         DATETIME COMMENT '最后修改时间'
);

ALTER TABLE tenant_wechatapp_shop
  COMMENT '服务号门店';

/*==============================================================*/
/* Index: idx_tenant_wechatapp_id_erp_department_id_dept_erp_id */
/*==============================================================*/
CREATE INDEX idx_tenant_wechatapp_id_erp_department_id_dept_erp_id ON tenant.tenant_wechatapp_shop
(
  tenant_wechatapp_id,
  dept_erp_id
);

use tenant;
alter table tenant_wechatapp_shop add column status tinyint COMMENT '状态，1正常，2停用'

use tenant;
-- ----------------------------
-- Table structure for employee_user
-- ----------------------------
DROP TABLE IF EXISTS `employee_user`;
CREATE TABLE `employee_user`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '租户ID',
  `tenant_wechatapp_id` bigint(20) NOT NULL COMMENT '客户服务号id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `employee_erp_id` bigint(20) NOT NULL COMMENT '员工id',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '员工用户对应表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

use tenant;
ALTER TABLE tenant
  MODIFY COLUMN erp_connect_str VARCHAR(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'erp连接字符串';
ALTER TABLE tenant_wechatapp_shop ADD qrcode_image_url VARCHAR(512) NULL COMMENT '二维码';
ALTER TABLE employee_user ADD qrcode_image_url VARCHAR(512) NULL COMMENT '二维码';

ALTER TABLE tenant
  MODIFY COLUMN erp_connect_str VARCHAR(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'erp连接字符串';

USE user_service;
DROP TABLE IF EXISTS user;
CREATE TABLE user_service.user (
  id             BIGINT      NOT NULL PRIMARY KEY COMMENT 'id',
  plat_unionid   VARCHAR(64) NOT NULL COMMENT '平台unionid',
  plat_openid    VARCHAR(64) COMMENT '平台openid',
  user_name      VARCHAR(32) COMMENT '姓名',
  mobile_no      VARCHAR(16) COMMENT '手机号码',
  nick_name      VARCHAR(32) COMMENT '昵称',
  sex            TINYINT UNSIGNED COMMENT '性别：0-未知，1-男，2-女',
  head_img_url   VARCHAR(512) COMMENT '头像',
  country        VARCHAR(64) COMMENT '国家',
  province       VARCHAR(64) COMMENT '省',
  city           VARCHAR(64) COMMENT '城市',
  status         TINYINT UNSIGNED DEFAULT 1 COMMENT '状态：1-有效，2-禁用，3-删除',
  is_subscribe   TINYINT UNSIGNED DEFAULT 0 COMMENT '是否关注：0-未关注，1-关注',
  subscribe_time DATETIME COMMENT '关注或者取消关注时间',
  create_time    DATETIME COMMENT '创建时间',
  update_time    DATETIME COMMENT '最后修改时间',

  UNIQUE uk_unionid(plat_unionid)
) COMMENT '用户表' DEFAULT CHARACTER SET utf8mb4;


DROP TABLE IF EXISTS tenant_user;
CREATE TABLE user_service.tenant_user (
  id                    BIGINT PRIMARY KEY,
  user_id               BIGINT       NOT NULL COMMENT '用户id',
  tenant_id             BIGINT       NOT NULL COMMENT '租户id',
  tenant_app_id         BIGINT       NOT NULL COMMENT '租户app id',
  tenant_app_open_id    VARCHAR(128) NOT NULL COMMENT '用户openId',
  is_subscribe          TINYINT UNSIGNED DEFAULT 0 COMMENT '是否关注：0-未关注，1-关注',
  subscribe_time        DATETIME COMMENT '关注或者取消关注时间',
  shop_id               BIGINT COMMENT '门店id',
  erp_member_id         BIGINT COMMENT '线下会员id',
  mobile_no             VARCHAR(16) COMMENT '手机号码',
  user_name             VARCHAR(32) COMMENT '用户姓名',
  sex                   TINYINT UNSIGNED COMMENT '性别：0-未知，1-男，2-女',
  birthday              DATETIME COMMENT '生日',
  birthday_is_lunar     TINYINT UNSIGNED COMMENT '生日是否为农历：1-是，0-否',
  address               VARCHAR(256) COMMENT '地址',
  memorial_name         VARCHAR(64) COMMENT '纪念日名称',
  memorial_day          DATETIME COMMENT '纪念日',
  memorial_day_is_lunar TINYINT UNSIGNED COMMENT '纪念日是否为农历：1-是，0-否',
  interest              VARCHAR(128) COMMENT '兴趣爱好',
  create_time           DATETIME,
  update_time           DATETIME,
  UNIQUE uk_user(user_id, tenant_id, tenant_app_id)
) COMMENT '租户用户表' DEFAULT CHARACTER SET utf8mb4;


/*==============================================================*/
/* Table: express_address 快递收货信息                          */
/*==============================================================*/
DROP TABLE IF EXISTS express_address;
CREATE TABLE user_service.express_address
(
  id                  BIGINT               NOT NULL COMMENT 'ID',
  tenant_wechatapp_id BIGINT               NOT NULL COMMENT '商家ID',
  user_id             BIGINT               NOT NULL COMMENT '会员ID',
  recipients          NATIONAL VARCHAR(20) NOT NULL COMMENT '收件人，最小2',
  user_tel            NATIONAL VARCHAR(20) NOT NULL COMMENT '联系电话,最小10，最大20',
  area                NATIONAL VARCHAR(32) NOT NULL COMMENT '省市区',
  address             NATIONAL VARCHAR(64) NOT NULL COMMENT '收件地址，最小10',
  is_default          TINYINT UNSIGNED DEFAULT 0 COMMENT '是否默认',
  create_time         DATETIME COMMENT '创建时间',
  update_time         DATETIME COMMENT '更新时间',
  PRIMARY KEY (id)
) COMMENT '收货信息';



-- --------------------------------------------------------
-- 主机:                           192.168.1.11
-- 服务器版本:                        5.7.22-0ubuntu0.16.04.1 - (Ubuntu)
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

create table erp_integral_log
(
  id                  bigint                 not null
  comment 'id'
    primary key,
  tenant_id           bigint                 not null
  comment '客户单位id',
  tenant_wechatapp_id bigint                 not null
  comment '服务号Id',
  integral_erp_id     bigint                 null
  comment '积分异动erpid',
  member_erp_id       bigint                 not null
  comment '会员erpid',
  note_erp_id         bigint                 null
  comment '单据id',
  remark              varchar(256)           null
  comment '异动说明',
  integral            decimal(10, 2)         null
  comment '积分值',
  is_disable          tinyint(1) default '0' null
  comment '是否停用',
  create_time         datetime               null
  comment '创建时间',
  update_time         datetime               null
  comment '最后修改时间',
  constraint id_uindex
  unique (tenant_wechatapp_id, integral_erp_id, member_erp_id, note_erp_id)
)
  comment '积分异动记录'
  charset = utf8mb4;

-- 数据导出被取消选择。
create table erp_member_grade
(
  id           bigint      not null
  comment 'id'
    primary key,
  tenant_id    bigint      not null
  comment '客户单位id',
  grade_erp_id bigint      not null
  comment '会员级别erpid',
  grade_name   varchar(32) not null
  comment '会员级别名称',
  create_time  datetime    null
  comment '创建时间',
  update_time  datetime    null
  comment '最后修改时间',
  constraint erp_member_grade_tenant_id_grade_erp_id_uindex
  unique (tenant_id, grade_erp_id)
)
  comment '会员级别档案'
  charset = utf8mb4;

create table erp_member
(
  id                   bigint                        not null
  comment 'id'
    primary key,
  tenant_id            bigint                        not null
  comment '客户单位id',
  tenant_wechatapp_id  bigint                        not null
  comment '服务号id',
  member_erp_id        bigint                        not null
  comment '会员erpid',
  employee_erp_id      bigint                        null
  comment '所属员工id',
  grade_erp_id         bigint                        null
  comment '会员级别id',
  card_no              varchar(32)                   null
  comment '会员卡号',
  dept_erp_id          bigint                        not null
  comment '部门erpid',
  mobile_no            varchar(16)                   not null
  comment '手机号码',
  consumption_integral decimal(10, 2) default '0.00' not null
  comment '累计消费积分',
  user_name            varchar(64)                   null
  comment '用户名称',
  create_time          datetime                      null
  comment '创建时间',
  update_time          datetime                      null
  comment '最后修改时间',
  constraint erp_member_tenant_id_member_erp_id_uindex
  unique (tenant_id, member_erp_id),
  constraint erp_member_tenant_wechatapp_id_mobile_no_uindex
  unique (tenant_wechatapp_id, mobile_no)
)
  comment '会员'
  charset = utf8mb4;

-- auto-generated definition
create table erp_member_info
(
  id                   bigint                        not null
  comment 'id'
    primary key,
  tenant_id            bigint                        not null
  comment '商户id',
  tenant_wechatapp_id  bigint                        not null
  comment '服务号id',
  erp_member_id        bigint                        not null
  comment '会员id',
  mobile_no            varchar(16)                   not null
  comment '手机号码',
  user_name            varchar(32)                   not null
  comment '姓名',
  sex                  varchar(8)                    null
  comment '性别',
  birthday             varchar(20)                   null
  comment '生日',
  birthday_is_lunar    tinyint(1)                    null
  comment '生日是否农历',
  home_address         varchar(128)                  null
  comment '家庭住址',
  memorialday          varchar(20)                   null
  comment '纪念日',
  memorialday_name     varchar(16)                   null
  comment '纪念日名称',
  memorialday_is_lunar tinyint(1)                    null
  comment '纪念日是否农历',
  interested           varchar(16)                   null
  comment '感兴趣的',
  amount               decimal(10, 2) default '0.00' null
  comment '累计消息金额',
  create_time          datetime                      null
  comment '创建时间',
  update_time          datetime                      null
  comment '最后修改时间',
  constraint erp_member_info_tenant_id_erp_member_id_uindex
  unique (tenant_id, erp_member_id),
  constraint erp_member_info_tenant_wechatapp_id_mobile_no_uindex
  unique (tenant_wechatapp_id, mobile_no)
)
  comment '会员信息'
  charset = utf8mb4;

INSERT INTO user_service.user (id, plat_unionid, user_name, create_time, update_time)
VALUES (20180715, 'system', '系统管理员', now(), now());

ALTER TABLE user_service.tenant_user
  CHANGE COLUMN birthday birthday DATETIME,
  CHANGE COLUMN birthday_is_lunar birthday_is_lunar TINYINT(3) UNSIGNED DEFAULT NULL COMMENT '生日是否为农历：1-是，0-否';

ALTER TABLE user_service.erp_member_info
  CHANGE COLUMN birthday birthday VARCHAR(20),
  CHANGE COLUMN birthday_is_lunar birthday_is_lunar TINYINT(1) COMMENT '生日是否为农历：1-是，0-否';

ALTER TABLE user_service.tenant_user
  ADD COLUMN is_update_info TINYINT UNSIGNED DEFAULT 0 COMMENT '是否更新资料' AFTER subscribe_time;

use user_service;
 DROP TABLE IF EXISTS user_employee;
create table user_employee
(
   id                   bigint not null comment 'id',
   tenant_id            bigint not null comment '租户id',
   tenant_wechatapp_id  bigint not null comment '服务号',
   user_id              bigint not null comment '用户id',
   employee_user_id     bigint comment '员工会员对照表id',
   employee_erp_id      bigint not null comment '线下员工id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id),
   unique uk_tenant_wechatpp_id_tenant_id_user_id_employee_user_id(tenant_wechatapp_id,tenant_id,user_id,employee_user_id)
) comment '会员所属员工' CHARACTER SET utf8mb4;


INSERT INTO user_employee (id, tenant_id, tenant_wechatapp_id, user_id, employee_user_id, employee_erp_id, create_time, update_time)
  SELECT
    tu.id, tu.tenant_id, tu.tenant_app_id, tu.user_id, eu.id, em.employee_erp_id, now(), now()
  FROM user_service.tenant_user tu
    JOIN user_service.erp_member em
      ON tu.tenant_app_id = em.tenant_wechatapp_id AND tu.erp_member_id = em.member_erp_id
    JOIN tenant.employee_user eu
      ON eu.tenant_wechatapp_id = em.tenant_wechatapp_id AND eu.employee_erp_id = em.employee_erp_id
  WHERE em.employee_erp_id != 0 AND NOT exists(SELECT id
                                               FROM user_employee ue WHERE
                                                 ue.tenant_wechatapp_id = tu.tenant_app_id AND ue.user_id = tu.user_id);




use warranty_service;

/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/6/5 9:58:28                             */
/*==============================================================*/

drop table if exists warranty;

/*==============================================================*/
/* Table: warranty                                              */
/*==============================================================*/
create table warranty
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   user_id              bigint not null comment '用户id',
   erp_sales_id         bigint not null comment '销售单id',
   update_user_id       bigint not null comment '修改人',
   warranty_no          varchar(20) not null comment '质保单号',
   warranty_data        text not null comment '数据',
   is_disable           bool comment '停用',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '最后修改时间'
);

alter table warranty comment '质保单';

/*==============================================================*/
/* Index: uk_erp_sales_id                                       */
/*==============================================================*/
create unique index uk_erp_sales_id on warranty
(
   erp_sales_id
);

/*==============================================================*/
/* Index: idx_tenant_wechatapp_id_user_id                       */
/*==============================================================*/
create index idx_tenant_wechatapp_id_user_id on warranty
(
   tenant_wechatapp_id,
   user_id
);

use wx_gateway;
CREATE TABLE wx_config (
  id           BIGINT PRIMARY KEY,
  config_key   VARCHAR(128) NOT NULL UNIQUE,
  config_value VARCHAR(512) NOT NULL,
  create_time  DATETIME,
  modify_time  DATETIME
) COMMENT '配置表' DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE wx_token (
  id                  BIGINT PRIMARY KEY,
  appid               VARCHAR(64) COMMENT '微信appId' NOT NULL UNIQUE,
  app_secret          VARCHAR(128) COMMENT '微信appSecrete',
  refresh_token       VARCHAR(256) COMMENT '刷新token',
  access_token        VARCHAR(512) COMMENT '访问token',
  access_token_expire DATETIME COMMENT '访问token过期时间',
  jsapi_ticket        VARCHAR(512) COMMENT 'js sdk 访问token',
  jsapi_ticket_expire DATETIME COMMENT 'js sdk 访问token过期时间',
  refresh_type        TINYINT UNSIGNED              NOT NULL COMMENT '状态：0-不刷新,1-服务号刷新，2-第三方平台刷新，3-授权服务号刷新',
  create_time         DATETIME,
  update_time         DATETIME
) COMMENT '授权信息表' DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE wx_app_info (
  id                 BIGINT PRIMARY KEY,
  tenant_id          BIGINT COMMENT '租户id',
  tenant_app_id      BIGINT COMMENT '租户appId',
  appid              VARCHAR(64) COMMENT '微信appId' NOT NULL UNIQUE,
  app_secret         VARCHAR(128) COMMENT '微信appSecrete',
  nick_name          VARCHAR(128) COMMENT '授权方昵称',
  head_image         VARCHAR(512) COMMENT '授权方头像',
  service_type_info  VARCHAR(16) COMMENT '授权方公众号类型，0代表订阅号，1代表由历史老帐号升级后的订阅号，2代表服务号',
  verify_type_info   VARCHAR(16) COMMENT '授权方认证类型,-1代表未认证，0代表微信认证',
  user_name          VARCHAR(128) COMMENT '授权方公众号原始id',
  principal_name     VARCHAR(128) COMMENT '公众号的主体名称',
  alias              VARCHAR(128) COMMENT '授权方公众号所设置的微信号，可能为空',
  business_info      VARCHAR(128) COMMENT '功能的开通状况',
  qrcode_url         VARCHAR(512) COMMENT '二维码图片的URL',
  funcscope_category VARCHAR(512) COMMENT '权限集列表',
  authorize_time     DATETIME COMMENT '最近一次授权时间',
  status             TINYINT UNSIGNED COMMENT '状态：0-未授权，1-已授权 ',
  create_time        DATETIME,
  update_time        DATETIME
) COMMENT '授权方信息表' DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE wx_auth_state (
  id          BIGINT PRIMARY KEY,
  params      VARCHAR(4096) COMMENT 'state对应参数',
  status      TINYINT UNSIGNED COMMENT '是否有效：0-失效，1-有效',
  create_time DATETIME,
  update_time DATETIME
) COMMENT '授权state参数表' DEFAULT CHARACTER SET utf8mb4;


CREATE TABLE wx_user (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT       NOT NULL,
  tenant_app_id BIGINT       NOT NULL,
  union_id      VARCHAR(128) NOT NULL,
  open_id       VARCHAR(128) NOT NULL,
  wx_app_id     VARCHAR(128) NOT NULL,
  cm_open_id    VARCHAR(128) NOT NULL,
  user_id       BIGINT       NOT NULL,
  create_time   DATETIME,
  UNIQUE uk_app_open(wx_app_id, cm_open_id)
) COMMENT '微信用户映射表' DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE wx_gateway.wx_sys_template (
  id          BIGINT PRIMARY KEY COMMENT 'id',
  template_no VARCHAR(32) UNIQUE NOT NULL COMMENT '模板编号',
  industry    VARCHAR(128)       NOT NULL COMMENT '行业',
  example     VARCHAR(512)       NOT NULL COMMENT '内容示例',
  content     VARCHAR(512)       NOT NULL COMMENT '详细内容',
  title       VARCHAR(128)       NOT NULL COMMENT '标题',
  remark      VARCHAR(256)       NOT NULL COMMENT '使用说明',
  status      TINYINT UNSIGNED COMMENT '1-有效,2-无效',
  create_time DATETIME COMMENT '创建时间',
  update_time DATETIME COMMENT '最后修改时间'
) COMMENT '微信模板库' DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE wx_gateway.wx_template (
  id                  BIGINT PRIMARY KEY COMMENT 'id',
  tenant_id           BIGINT      NOT NULL COMMENT '租户id',
  tenant_app_id       BIGINT      NOT NULL COMMENT '客户服务号id',
  template_id         BIGINT      NOT NULL COMMENT '模板id',
  template_no         VARCHAR(32) NOT NULL COMMENT '微信模板公众编号',
  template_private_no VARCHAR(64) NOT NULL COMMENT '微信模板编号',
  status              TINYINT UNSIGNED COMMENT '1-有效,2-无效',
  create_time         DATETIME COMMENT '创建时间',
  update_time         DATETIME COMMENT '最后修改时间',
  UNIQUE uk_app_template_no(tenant_id, tenant_app_id, template_id)
) COMMENT '商家微信模板' DEFAULT CHARACTER SET utf8mb4;

create table wx_template_msg
(
	tenant_id bigint not null,
	id bigint not null comment 'id'
		primary key,
	tenant_app_id bigint not null,
	user_id bigint not null comment '用户id',
	tenant_user_open_id varchar(128) not null comment '租户用户openId',
	template_id bigint not null comment '模板id',
	template_no varchar(64) not null comment '模板库编号',
	url varchar(512) null comment '链接地址',
	data varchar(1024) null comment '数据',
	msg_id varchar(64) not null comment '消息id',
	status int null comment '状态:1-成功,2-失败',
	err_msg varchar(512) null comment '错误描述',
	title varchar(128) not null comment '标题',
	content varchar(512) not null comment '详细内容',
	create_time datetime null comment '创建时间',
	update_time datetime null comment '最后修改时间',
	user_head_img_url varchar(255) null,
	user_name varchar(32) null,
	user_mobile_no varchar(11) null,
	tenant_app_name varchar(32) null,
	tenant_short_name varchar(16) null
)
comment '用户已发送微信模板消息' engine=InnoDB charset=utf8mb4;
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

USE position;

DROP TABLE IF EXISTS geo_position;
CREATE TABLE geo_position (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT COMMENT '租户id',
  tenant_app_id BIGINT COMMENT '租户appid',
  object_type   VARCHAR(64) NOT NULL COMMENT '物品类别：user-用户,shop-门店',
  object_id     BIGINT      NOT NULL COMMENT '物品id',
  geo_hash      VARCHAR(32) COMMENT '位置的geo_hash',
  latitude      DECIMAL(10, 7) COMMENT 'wgs84 纬度',
  longitude     DECIMAL(10, 7) COMMENT 'wgs84 经度',
  create_time   DATETIME,
  update_time   DATETIME
) COMMENT '地理位置表' DEFAULT CHARACTER SET utf8mb4;USE erp_to_platform;
CREATE TABLE erp_department
(
  id          BIGINT                 NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id   BIGINT                 NOT NULL
  COMMENT '客户单位id',
  dept_name   VARCHAR(32)            NOT NULL
  COMMENT '部门名称',
  dept_erp_id BIGINT                 NOT NULL
  COMMENT '部门erpid',
  is_disable  TINYINT(1) DEFAULT '0' NULL
  COMMENT '是否停用',
  create_time DATETIME               NULL
  COMMENT '创建时间',
  update_time DATETIME               NULL
  COMMENT '最后修改时间',
  CONSTRAINT erp_department_tenant_id_dept_erp_id_uindex
  UNIQUE (tenant_id, dept_erp_id)
)
  COMMENT '部门'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_employee
(
  id              BIGINT                 NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id       BIGINT                 NOT NULL
  COMMENT '客户单位id',
  employee_erp_id BIGINT                 NOT NULL
  COMMENT '员工erpid',
  employee_name   VARCHAR(32)            NOT NULL
  COMMENT '员工名称',
  employee_jobno  VARCHAR(16)            NULL
  COMMENT '员工工号',
  mobile_no       VARCHAR(16)            NOT NULL
  COMMENT '手机号码',
  sex             VARCHAR(2)             NULL
  COMMENT '性别',
  employee_type   VARCHAR(20)            NULL
  COMMENT '员工类型',
  dept_erp_id     BIGINT                 NOT NULL
  COMMENT '所属部门erpid',
  is_disable      TINYINT(1) DEFAULT '0' NULL
  COMMENT '是否停用',
  create_time     DATETIME               NULL
  COMMENT '创建时间',
  update_time     DATETIME               NULL
  COMMENT '最后修改时间',
  CONSTRAINT erp_employee_tenant_id_employee_erp_id_uindex
  UNIQUE (tenant_id, employee_erp_id),
  CONSTRAINT erp_employee_tenant_id_mobile_no_uindex
  UNIQUE (tenant_id, mobile_no)
)
  COMMENT '员工'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_integral_log
(
  id                  BIGINT                 NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id           BIGINT                 NOT NULL
  COMMENT '客户单位id',
  tenant_wechatapp_id BIGINT                 NOT NULL
  COMMENT '服务号Id',
  integral_erp_id     BIGINT                 NULL
  COMMENT '积分异动erpid',
  member_erp_id       BIGINT                 NOT NULL
  COMMENT '会员erpid',
  note_erp_id         BIGINT                 NULL
  COMMENT '单据id',
  remark              VARCHAR(256)           NULL
  COMMENT '异动说明',
  integral            DECIMAL(10, 2)         NULL
  COMMENT '积分值',
  is_disable          TINYINT(1) DEFAULT '0' NULL
  COMMENT '是否停用',
  create_time         DATETIME               NULL
  COMMENT '创建时间',
  update_time         DATETIME               NULL
  COMMENT '最后修改时间',
  CONSTRAINT id_uindex
  UNIQUE (tenant_wechatapp_id, integral_erp_id, member_erp_id, note_erp_id)
)
  COMMENT '积分异动记录'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_member
(
  id                   BIGINT                        NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id            BIGINT                        NOT NULL
  COMMENT '客户单位id',
  tenant_wechatapp_id  BIGINT                        NOT NULL
  COMMENT '服务号id',
  member_erp_id        BIGINT                        NOT NULL
  COMMENT '会员erpid',
  employee_erp_id      BIGINT                        NULL
  COMMENT '所属员工id',
  grade_erp_id         BIGINT                        NULL
  COMMENT '会员级别id',
  card_no              VARCHAR(32)                   NULL
  COMMENT '会员卡号',
  dept_erp_id          BIGINT                        NOT NULL
  COMMENT '部门erpid',
  mobile_no            VARCHAR(16)                   NOT NULL
  COMMENT '手机号码',
  consumption_integral DECIMAL(10, 2) DEFAULT '0.00' NOT NULL
  COMMENT '累计消费积分',
  user_name            VARCHAR(64)                   NULL
  COMMENT '用户名称',
  create_time          DATETIME                      NULL
  COMMENT '创建时间',
  update_time          DATETIME                      NULL
  COMMENT '最后修改时间',
  CONSTRAINT erp_member_tenant_id_member_erp_id_uindex
  UNIQUE (tenant_id, member_erp_id),
  CONSTRAINT erp_member_tenant_wechatapp_id_mobile_no_uindex
  UNIQUE (tenant_wechatapp_id, mobile_no)
)
  COMMENT '会员'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_member_grade
(
  id           BIGINT      NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id    BIGINT      NOT NULL
  COMMENT '客户单位id',
  grade_erp_id BIGINT      NOT NULL
  COMMENT '会员级别erpid',
  grade_name   VARCHAR(32) NOT NULL
  COMMENT '会员级别名称',
  create_time  DATETIME    NULL
  COMMENT '创建时间',
  update_time  DATETIME    NULL
  COMMENT '最后修改时间',
  CONSTRAINT erp_member_grade_tenant_id_grade_erp_id_uindex
  UNIQUE (tenant_id, grade_erp_id)
)
  COMMENT '会员级别档案'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_member_info
(
  id                   BIGINT                        NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id            BIGINT                        NOT NULL
  COMMENT '商户id',
  tenant_wechatapp_id  BIGINT                        NOT NULL
  COMMENT '服务号id',
  erp_member_id        BIGINT                        NOT NULL
  COMMENT '会员id',
  mobile_no            VARCHAR(16)                   NOT NULL
  COMMENT '手机号码',
  user_name            VARCHAR(32)                   NOT NULL
  COMMENT '姓名',
  sex                  VARCHAR(8)                    NULL
  COMMENT '性别',
  birthday             VARCHAR(20)                   NULL
  COMMENT '生日',
  birthday_is_lunar    TINYINT(1)                    NULL
  COMMENT '生日是否农历',
  home_address         VARCHAR(128)                  NULL
  COMMENT '家庭住址',
  memorialday          VARCHAR(20)                   NULL
  COMMENT '纪念日',
  memorialday_name     VARCHAR(16)                   NULL
  COMMENT '纪念日名称',
  memorialday_is_lunar TINYINT(1)                    NULL
  COMMENT '纪念日是否农历',
  interested           VARCHAR(16)                   NULL
  COMMENT '感兴趣的',
  amount               DECIMAL(10, 2) DEFAULT '0.00' NULL
  COMMENT '累计消息金额',
  create_time          DATETIME                      NULL
  COMMENT '创建时间',
  update_time          DATETIME                      NULL
  COMMENT '最后修改时间',
  CONSTRAINT erp_member_info_tenant_id_erp_member_id_uindex
  UNIQUE (tenant_id, erp_member_id),
  CONSTRAINT erp_member_info_tenant_wechatapp_id_mobile_no_uindex
  UNIQUE (tenant_wechatapp_id, mobile_no)
)
  COMMENT '会员信息'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_pallet
(
  id            BIGINT                 NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id     BIGINT                 NOT NULL
  COMMENT '客户单位id',
  dept_erp_id   BIGINT                 NOT NULL
  COMMENT '部门erpid',
  pallet_erp_id BIGINT                 NOT NULL
  COMMENT '看货盘erpid',
  pallet_no     VARCHAR(20)            NOT NULL
  COMMENT '看货盘编号',
  is_disable    TINYINT(1) DEFAULT '0' NULL
  COMMENT '是否停用',
  create_time   DATETIME               NULL
  COMMENT '创建时间',
  update_time   DATETIME               NULL
  COMMENT '最后修改时间',
  CONSTRAINT erp_pallet_tenant_id_pallet_erp_id_uindex
  UNIQUE (tenant_id, pallet_erp_id)
)
  COMMENT '看货盘'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_pallet_product
(
  id                    BIGINT      NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id             BIGINT      NOT NULL
  COMMENT '客户单位id',
  pallet_product_erp_id BIGINT      NULL
  COMMENT '记录erpid',
  pallet_erp_id         BIGINT      NOT NULL
  COMMENT '看货盘erpid',
  product_erp_id        BIGINT      NOT NULL
  COMMENT '产品id',
  product_barcode       VARCHAR(32) NOT NULL
  COMMENT '产品条码',
  product_name          VARCHAR(64) NOT NULL
  COMMENT '产品名称',
  stone_weight          VARCHAR(16) NULL
  COMMENT '石重',
  gold_weight           VARCHAR(16) NULL
  COMMENT '金重',
  total_weight          VARCHAR(16) NULL
  COMMENT '总重',
  remark                VARCHAR(64) NULL
  COMMENT '其它备注信息',
  tag_price             DECIMAL     NOT NULL
  COMMENT '上柜价',
  create_time           DATETIME    NULL
  COMMENT '创建时间',
  update_time           DATETIME    NULL
  COMMENT '最后修改时间',
  CONSTRAINT tenant_id_pallet_product_erp_id
  UNIQUE (tenant_id, pallet_product_erp_id)
)
  COMMENT '看货盘看货记录'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_product_category
(
  id              BIGINT                 NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id       BIGINT                 NOT NULL
  COMMENT '客户单位id',
  category_name   VARCHAR(16)            NOT NULL
  COMMENT '产品分类名称',
  category_erp_id BIGINT                 NOT NULL
  COMMENT '产品分类erpid',
  is_disable      TINYINT(1) DEFAULT '0' NULL
  COMMENT '是否停用',
  create_time     DATETIME               NULL
  COMMENT '创建时间',
  update_time     DATETIME               NULL
  COMMENT '最后修改时间',
  CONSTRAINT uk_product_category
  UNIQUE (tenant_id, category_erp_id)
)
  COMMENT '产品分类'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_sales
(
  id                  BIGINT         NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id           BIGINT         NOT NULL
  COMMENT '客户单位id',
  tenant_wechatapp_id BIGINT         NOT NULL
  COMMENT '服务号Id',
  sales_erp_id        BIGINT         NOT NULL
  COMMENT '销售单erpid',
  sales_no            VARCHAR(32)    NOT NULL
  COMMENT '销售单单号',
  sales_date          VARCHAR(10)    NOT NULL
  COMMENT '入账日期',
  member_erp_id       BIGINT         NOT NULL
  COMMENT '会员erpid',
  employee_erp_id     BIGINT         NOT NULL
  COMMENT '导购erpid',
  employee_name       VARCHAR(32)    NOT NULL
  COMMENT '导购名称',
  dept_erp_id         BIGINT         NOT NULL
  COMMENT '部门erpid',
  amount              DECIMAL(10, 2) NOT NULL
  COMMENT '实收金额',
  sales_remark        VARCHAR(256)   NULL
  COMMENT '单据备注',
  receipts            VARCHAR(128)   NULL
  COMMENT '收款信息',
  sales_status        TINYINT        NOT NULL
  COMMENT '单据状态',
  busi_date           VARCHAR(10)    NULL
  COMMENT '录入系统的日期',
  create_time         DATETIME       NULL
  COMMENT '创建时间',
  update_time         DATETIME       NULL
  COMMENT '最后修改时间',
  CONSTRAINT uk_sales
  UNIQUE (tenant_id, sales_erp_id)
)
  COMMENT '销售单主表'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_sales_detail
(
  id                  BIGINT         NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id           BIGINT         NOT NULL
  COMMENT '客户单位id',
  tenant_wechatapp_id BIGINT         NOT NULL
  COMMENT '服务号Id',
  sales_erp_id        BIGINT         NOT NULL
  COMMENT '销售单erpid',
  sales_index         TINYINT        NOT NULL
  COMMENT '单内序号',
  sales_type          VARCHAR(32)    NOT NULL
  COMMENT '销售类型',
  product_barcode     VARCHAR(32)    NOT NULL
  COMMENT '产品条码',
  product_name        VARCHAR(64)    NOT NULL
  COMMENT '产品名称',
  cert_no             VARCHAR(16)    NULL
  COMMENT '证书号',
  hand_size           VARCHAR(16)    NULL
  COMMENT '手寸',
  category_erp_id     BIGINT         NOT NULL
  COMMENT '产品分类erpid',
  category_name       VARCHAR(32)    NULL
  COMMENT '产品分类名称',
  stone_weight        VARCHAR(16)    NULL
  COMMENT '石重',
  gold_weight         VARCHAR(16)    NULL
  COMMENT '金重',
  total_weight        VARCHAR(16)    NULL
  COMMENT '总重',
  quantity            DECIMAL(10, 2) NOT NULL
  COMMENT '数量',
  amount_total        DECIMAL(10, 2) NOT NULL
  COMMENT '应付金额，包括了优惠金额，积分抵现等',
  amount_pay          DECIMAL(10, 2) NOT NULL
  COMMENT '实际支付的金额，不包括优惠金额',
  integral            DECIMAL(10, 2) NULL
  COMMENT '积分',
  remark              VARCHAR(1024)  NULL
  COMMENT '其它备注信息',
  create_time         DATETIME       NULL
  COMMENT '创建时间',
  update_time         DATETIME       NULL
  COMMENT '最后修改时间',
  CONSTRAINT uk_sales_detail
  UNIQUE (tenant_id, sales_erp_id, sales_index)
)
  COMMENT '销售从表'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

use value_added;

-- ----------------------------
-- Table structure for value_added_category
-- ----------------------------
DROP TABLE IF EXISTS `value_added_category`;
CREATE TABLE `value_added_category`  (
  `id` bigint(20) NOT NULL,
  `tenant_wechatapp_id` bigint(20) NOT NULL,
  `template_id` bigint(20) NOT NULL,
  `erp_product_category_id` bigint(20) NOT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_tenant_wechatapp_id_erp_product_category_id`(`tenant_wechatapp_id`, `erp_product_category_id`) USING BTREE
 ) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '增值类型关联产品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for value_added_template
-- ----------------------------
DROP TABLE IF EXISTS `value_added_template`;
CREATE TABLE `value_added_template`  (
  `id` bigint(20) NOT NULL,
  `tenant_wechatapp_id` bigint(20) NOT NULL,
  `template_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `added_percent_per_day` decimal(10, 4) NOT NULL,
  `add_days` smallint(6) NOT NULL,
  `keeping_days` smallint(6) NOT NULL,
  `devalue_percent_per_day` decimal(10, 4) NOT NULL,
  `exchange_days` smallint(6) NOT NULL,
  `is_disable` tinyint(1) DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `effective_days` smallint(6) DEFAULT NULL,
  `Remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_wechatapp_id_name`(`tenant_wechatapp_id`, `template_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '增值类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for value_added_user
-- ----------------------------
DROP TABLE IF EXISTS `value_added_user`;
CREATE TABLE `value_added_user`  (
  `id` bigint(20) NOT NULL,
  `tenant_wechatapp_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `template_id` bigint(20) NOT NULL,
  `sales_erp_id` bigint(20) NOT NULL,
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shop_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_barcode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `amount_total` decimal(10, 0) NOT NULL COMMENT '应付金额，包括了优惠金额，积分抵现等',
  `amount_pay` decimal(10, 0) NOT NULL COMMENT '实际支付的金额，不包括优惠金额',
  `amount_added` decimal(10, 0) NOT NULL,
  `state` tinyint(4) NOT NULL COMMENT '1正常，2已兑换增值券，3已停用',
  `add_days` smallint(6) NOT NULL,
  `added_percent_per_day` decimal(10, 4) NOT NULL,
  `devalue_percent_per_day` decimal(10, 4) NOT NULL,
  `keeping_days` smallint(6) NOT NULL,
  `exchange_days` smallint(6) NOT NULL,
  `coupon_user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `sales_index` tinyint(4) NOT NULL COMMENT '单内序号',
  `tenant_id` bigint(20) NOT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_erp_sals_detail_id`(`tenant_id`, `sales_erp_id`, `sales_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户增值记录' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

use value_added;
alter table value_added_user modify column `amount_added` decimal(10,4) NOT NULL;
USE `h5link`;

/*==============================================================*/
/* Table: h5_link                                               */
/*==============================================================*/
DROP TABLE IF EXISTS `h5_link`;
create table h5_link
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   func_id              bigint not null comment '功能id',
   link_url             varchar(512) not null comment '链接地址',
   link_text            varchar(128) not null comment '链接文字',
   link_image_url       varchar(512) comment '链接图片',
   detail_id            bigint not null comment '明细id，如产品的id\活动id等',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '最后修改时间',
   primary key (id)
) comment 'h5链接'  CHARACTER SET utf8mb4;

alter table h5_link comment 'h5链接';

/*====================================================================*/
/* Index: uk_tenant_wechatappid_func_module_id_func_page_id_detail_id */
/*====================================================================*/
create unique index uk_tenant_wechatappid_func_module_id_func_page_id_detail_id on h5_link
(
   tenant_wechatapp_id,
   detail_id
);use qrcode_service;
drop unique uk_tenant_wechatpp_id_scene_id_data on qrcode;
drop table if exists qrcode;
/*==============================================================*/
/* Table: qrcode                                                */
/*==============================================================*/
create table qrcode
(
   id                   bigint not null comment 'id',
   tenant_id            bigint not null comment '租户id',
   tenant_wechatapp_id  bigint not null comment '服务号',
   scene_id             smallint not null comment '场景id',
   data                 varchar(64) not null comment '数据',
   action_name          varchar(20) not null comment '二维码类型',
   ticket               varchar(512) comment '二维码凭据',
   expire_time          datetime comment '过期时间',
   image_url            varchar(512) comment '图片url',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id),
   unique uk_tenant_wechatpp_id_scene_id_data(tenant_wechatapp_id,scene_id,`data`)
) comment '二维码定义' CHARACTER SET utf8mb4;
use `employee`;
/*==============================================================*/
/* Table: backlog                                      */
/*==============================================================*/
DROP TABLE IF EXISTS employee.backlog;
CREATE TABLE employee.backlog (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT      NOT NULL,
  tenant_app_id BIGINT      NOT NULL,
  user_id       BIGINT      NOT null ,
  status               varchar(32) not null comment '开始start,完成finished,逾期中止,expire_stopped,主动中止stopped',
  scene                varchar(32) not null comment '生日待办birthday,纪念日memorial_day,评价回评sales_comment,销售第一次回访sales_first_call,销售第二次回访sales_second_call,销售第三次回访sales_third_call',
  data                 json comment '数据',
  expire_time          datetime comment '过期时间',
  create_time          datetime comment '创建时间',
  update_time          datetime comment '最后修改时间',
  UNIQUE KEY uk_all (tenant_id,tenant_app_id,user_id,status,scene)
) COMMENT '员工待办' DEFAULT CHARACTER SET utf8mb4;

/*==============================================================*/
/* Table: backlog_detail                               */
/*==============================================================*/
DROP TABLE IF EXISTS employee.backlog_detail;
CREATE TABLE employee.backlog_detail (
  id            BIGINT PRIMARY KEY,
  backlog_id           bigint not null comment '待办id',
  content              varchar(2048) not null comment '日志',
  create_time          datetime comment '创建时间',
  update_time          datetime comment '最后修改时间'
) COMMENT '员工待办明细' DEFAULT CHARACTER SET utf8mb4;

/*==============================================================*/
/* Table: backlog_statistics                                */
/*==============================================================*/
DROP TABLE IF EXISTS employee.backlog_statistics ;
CREATE TABLE employee.backlog_statistics (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT      NOT NULL,
  tenant_app_id BIGINT      NOT NULL,
  user_id       BIGINT      NOT null ,
  scene                varchar(32) not null comment '生日待办birthday,纪念日memorial_day,评价回评sales_comment,销售第一次回访sales_first_call,销售第二次回访sales_second_call,销售第三次回访sales_third_call',
  record        int  comment '当前场景下当前用户待办任务统计',
  create_time          datetime comment '创建时间',
  update_time          datetime comment '最后修改时间'
) COMMENT '员工待办任务统计' DEFAULT CHARACTER SET utf8mb4;

/*==============================================================*/
/* Table: backlog_setting                               */
/*==============================================================*/
DROP TABLE IF EXISTS employee.backlog_setting;
CREATE TABLE employee.backlog_setting (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT      NOT NULL,
  tenant_app_id BIGINT      NOT NULL,
  scene                varchar(32) not null comment '生日待办birthday,纪念日memorial_day,评价回评sales_comment,销售第一次回访sales_first_call,销售第二次回访sales_second_call,销售第三次回访sales_third_call',
  advance_day          int not null comment '提前天数',
  expire_day           int not null comment '期满天数',
  talk_count           int default 0 comment '话术数',
  status               bit  default 0 not null comment '设置状态，默认是0禁用,1启用',
  create_time          datetime comment '创建时间',
  update_time          datetime comment '最后修改时间',
  UNIQUE KEY uk_all (tenant_id,tenant_app_id,scene)
) COMMENT '员工待办设置' DEFAULT CHARACTER SET utf8mb4;

/*==============================================================*/
/* Table: backlog_talk                               */
/*==============================================================*/
DROP TABLE IF EXISTS employee.backlog_talk;
CREATE TABLE employee.backlog_talk (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT      NOT NULL,
  tenant_app_id BIGINT      NOT NULL,
  scene                varchar(32) not null comment '生日待办birthday,纪念日memorial_day,评价回评sales_comment,销售第一次回访sales_first_call,销售第二次回访sales_second_call,销售第三次回访sales_third_call',
  talk                 varchar(2048) not null comment '话术',
  create_time          datetime comment '创建时间',
  update_time          datetime comment '最后修改时间'
) COMMENT '员工待办话术' DEFAULT CHARACTER SET utf8mb4;use tag_service;
-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_Name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称',
  `classify_id` bigint(20) NOT NULL COMMENT '标签分类id',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `used_total` bigint(20) DEFAULT NULL COMMENT '使用总计',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(6) DEFAULT NULL COMMENT '最后修改时间',
  `tenant_wechatapp_id` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tag_classify`(`tag_Name`, `tenant_wechatapp_id`,`classify_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tag_classify
-- ----------------------------
DROP TABLE IF EXISTS `tag_classify`;
CREATE TABLE `tag_classify`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `classify_name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `classify_grade` tinyint(4) NOT NULL COMMENT '级别',
  `parent_id` bigint(20) NOT NULL COMMENT '父节点id',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(6) DEFAULT NULL COMMENT '最后修改时间',
  `tenant_wechatapp_id` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
   UNIQUE INDEX `uk_tag_classify`(`classify_name`,`parent_id`, `tenant_wechatapp_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag_classify
-- ----------------------------
INSERT INTO `tag_classify` VALUES (1000, '到店需求', 1, 0, '2018-07-20 11:55:14.000000', '2018-07-20 11:55:14.000000', 0, 0);
INSERT INTO `tag_classify` VALUES (2000, '会员描述', 1, 0, '2018-07-20 11:55:14.000000', '2018-07-20 11:55:14.000000', 0, 0);
INSERT INTO `tag_classify` VALUES (3000, '购买需求', 1, 0, '2018-07-20 11:55:14.000000', '2018-07-20 11:55:14.000000', 0, 0);
INSERT INTO `tag_classify` VALUES (4000, '维系任务', 1, 0, '2018-07-20 11:55:14.000000', '2018-07-20 11:55:14.000000', 0, 0);

-- ----------------------------
-- Table structure for tag_data
-- ----------------------------
DROP TABLE IF EXISTS `tag_data`;
CREATE TABLE `tag_data`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `classify_id` bigint(20) NOT NULL COMMENT '标签分类id',
  `tag_id` bigint(20) NOT NULL COMMENT '标签id',
  `data_id` bigint(20) NOT NULL COMMENT '数据id',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(6) DEFAULT NULL COMMENT '最后修改时间',
  `tenant_wechatapp_id` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tag_classify`(`tag_id`) USING BTREE,
  UNIQUE INDEX `uk_tag`(`tag_id`, `data_id`) USING BTREE,
  UNIQUE INDEX `uk_tag_data`(`tag_id`, `data_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签数据' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

use authorization_service;

delete from func;
delete from ignore_permission_url;
delete from role;
delete from role_func;
delete from user_login_info;
delete from user_role;

INSERT INTO ignore_permission_url VALUES (1, '*', '/authorization/api/v1/login', 0, '登录', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (2, '*', '/authorization/api/v1/login/tenant', 0, '租户登录', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (3, '*', '/wxgateway/login', 0, '微信网页授权', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (4, '*', '/wxgateway/js/config', 0, '微信jsconfig', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (5, '*', '/wxgateway', 0, '微信平台服务号消息', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (6, '*', '/wxgateway/cm/{regex:[a-zA-Z0-9]+}', 0, '微信租户服务号消息', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (7, '*', '/wxgateway/mp/auth/code/callback', 0, '微信平台服务号网页授权回调', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (8, '*', '/wxgateway/cm/auth/code/callback', 0, '微信租户服务号网页授权回调', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (9, '*', '/wxgateway/cm/auth', 0, '微信服务号授权', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (10, '*', '/wxgateway/cm/auth/event', 0, '微信授权消息', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (11, '*', '/wxgateway/cm/auth/callback/{tenantId:[0-9]+}', 0, '微信服务号授权回调', 1, now(), now());

INSERT INTO ignore_permission_url
VALUES (12, '*', '/authorization/auth/check', 0, 'token检查', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (13, '*', '/authorization/auth/reload/config', 0, 'token检查', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (14, '*', '/authorization/api/v1/super-login', 0, '快捷登录', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (15, '*', '/tenant/api/v1/tenant/wechatapp/get-tenant-app-by-name', 0, '获取租户app', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (16, '*', '/user/api/v1/get-user-info-by-keyword', 0, '获取用户信息', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (17, '*', '/oss/callback', 0, '图片回调地址', 1, now(), now());


/**
角色初始化
 */
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183257370250715136, '系统管理员', 'system', 1, 'static/images/menu/role/icon_manage.png', '系统配置', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183258332713459712, '运维管理员', 'admin', 1, 'static/images/menu/role/icon_maintenance.png', '管理所有单位', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183258467749076992, '单位管理员', 'tenant_admin', 2, 'static/images/menu/role/icon_merchant.png', '管理单位', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183258583545421824, '服务号管理员', 'tenant_wechatapp_admin', 3, 'static/images/menu/role/icon_boss.png', '', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183258719801581568, '财务', 'tenant_financial', 3, 'static/images/menu/role/icon_shoppingGuide.png', '', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183259005916028928, '导购', 'tenant_sales', 3, 'static/images/menu/role/icon_shopManager.png', '', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183259029018255360, '店长', 'tenant_shop_manager', 3, 'static/images/menu/role/icon_accounting.png', '', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (464095291973439488, '单位操作员', 'tenant_operation', 2, 'static/images/menu/role/icon_merchant_operator.png', '管理员具有平台全部功能使用权限。请谨慎配置', '2018-07-04 15:53:36', '2018-07-04 15:53:36');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (464096328360792064, '服务号操作员', 'tenant_wechatapp_operation', 3, 'static/images/menu/role/icon_unit_operator.png', '管理员具有平台全部功能使用权限。请谨慎配置', '2018-07-04 15:53:36', '2018-07-04 15:53:36');

/**
账户初始化 平台管理员
 */

INSERT INTO user_login_info (id, user_id, login_way, login_name, login_password, login_salt, create_time, update_time)
VALUES
  (183259332664893440, 1, 1, 'admin', '5f1d7a84db00d2fce00b31a7fc73224f', 'e10adc3949ba59abbe56e057f20f883e', now(),
   now());

/**
账户角色初始化
 */
INSERT INTO user_role (id, user_id, role_id, tenant_id, tenant_wechatapp_id, create_time, update_time)
VALUES (183260035114344448, 1, 183257370250715136, 0, 0, now(), now());

/**
功能初始化  手机端
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (1000, '会员中心', '/', 2, 1, 'static/images/nav/icon_my.png', 0, 2, '2018-07-07 11:09:24', '2018-07-11 16:04:21');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (1001, '首页', '/', 2, 1, 'static/images/nav/icon_home.png', 0, 1, '2018-07-11 14:24:05', '2018-07-11 16:04:11');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (2000, '礼品商城', '/gift_store', 2, 1, 'static/images/nav/icon_gift.png', 0, 3, '2018-07-07 11:10:32', '2018-07-11 16:06:01');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (3000, '礼券', '/coupon', 2, 1, 'static/images/nav/icon_class.png', 0, 4, '2018-07-10 20:00:57', '2018-07-11 16:07:09');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (4000, '超级导购', '/employee', 2, 1, 'static/images/icon_shoppingGuide.png', 0, 5, '2018-07-11 14:38:25', '2018-07-11 16:07:29');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (5000, '活动', '/activity', 2, 1, 'static/images/nav/icon_activity.png', 0, 7, '2018-07-11 14:39:08', '2018-07-11 16:06:10');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (6000, '自定义页面', '/customize_page', 2, 1, '', 0, 7, '2018-07-11 14:39:08', '2018-07-11 16:06:10');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001001, '首页', '/member', 2, 2, '', 1000, 1, '2018-07-10 19:57:15', '2018-07-11 14:23:16');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001003, '注册与绑定', '/register', 2, 2, '', 1000, 3, '2018-07-10 19:54:34', '2018-07-11 14:24:20');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001004, '更新资料', '/member/data', 2, 2, '', 1000, 4, '2018-07-10 19:55:06', '2018-07-11 14:27:50');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001005, '关注公众号', '/member/attention', 2, 2, '', 1000, 5, '2018-07-10 19:55:28', '2018-07-11 14:24:38');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001006, '我的管家', '/member/my_steward', 2, 2, 'static/images/menu/member_icon_steward.png', 1000, 6, '2018-07-10 19:56:50', '2018-07-11 16:05:27');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001007, '门店购物', '/member/shopping_record', 2, 2, 'static/images/menu/member_icon_offlineBuy.png', 1000, 7, '2018-07-10 19:58:14', '2018-07-11 16:05:48');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001008, '我的积分', '/member/point', 2, 2, 'static/images/menu/member_icon_integral.png', 1000, 8, '2018-07-10 20:03:34', '2018-07-11 16:04:38');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001009, '我的礼券', '/coupon/my', 2, 2, 'static/images/menu/member_icon_coupon.png', 1000, 9, '2018-07-10 20:04:58', '2018-07-11 16:04:50');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001010, '我的增值', '/appreciation', 2, 2, 'static/images/menu/member_icon_appreciation.png', 1000, 10, '2018-07-10 20:07:29', '2018-07-11 16:05:14');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001011, '我的质保单', '/product_certs/my_list', 2, 2, 'static/images/menu/member_icon_guaranteeSlip.png', 1000, 11, '2018-07-10 20:08:12', '2018-07-11 16:05:02');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001012, '附近门店', '/member/store', 2, 2, 'static/images/menu/member_icon_receivingGifts.png', 1000, 12, '2018-07-10 20:08:46', '2018-07-11 16:05:37');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (20002001, '首页', '/gift_store', 2, 2, '', 2000, 1, '2018-07-11 14:32:35', '2018-07-11 14:36:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (20002002, '附件好礼商家首页', '/gift_store', 2, 2, '', 2000, 2, '2018-07-11 14:35:16', '2018-07-11 14:36:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (20002003, '详情页', '/gift_store', 2, 2, '', 2000, 3, '2018-07-11 14:34:33', '2018-07-11 14:36:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (20002004, '我的兑换记录', '/gift_store/order', 2, 2, '', 2000, 5, '2018-07-11 14:36:15', '2018-07-11 14:36:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (20002005, '扫码提货', '/employee', 2, 2, 'static/images/menu/employee_icon_pickUpGoods.png', 2000, 6, '2018-07-07 11:19:31', '2018-07-11 14:36:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (20002006, '快速提货', '/employee/gift_store', 2, 2, 'static/images/menu/employee_icon_returnGoods1.png', 2000, 7, '2018-07-07 11:19:43', '2018-07-11 14:36:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (30003001, '领券中心', '/coupon/center/detail', 2, 2, '', 3000, 1, '2018-07-10 20:02:01', '2018-07-10 20:05:30');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (30003003, '券集市', '/coupon/mall/detail', 2, 2, '', 3000, 3, '2018-07-10 20:02:45', '2018-07-10 20:05:30');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (40004001, '首页', '/employee', 2, 2, '', 4000, 1, '2018-07-11 14:56:02', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (40004002, '现场互动', '/employee', 2, 2, '', 4000, 2, '2018-07-11 14:56:15', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (40004003, '店长管理', '/employee', 2, 2, '', 4000, 3, '2018-07-11 14:57:30', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (40004004, '礼品商城', '/employee', 2, 2, '', 4000, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (50005001, '抽奖', '/activity', 2, 2, 'static/images/menu/member_icon_drawAward.png', 5000, 1, '2018-07-11 14:49:35', '2018-07-11 16:06:18');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (50005002, '首页', '/activity', 2, 2, '', 5000, 1, '2018-07-11 14:49:08', '2018-07-11 14:49:08');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (100010091001, '未使用', '/coupon/my', 2, 2, '', 10001009, 1, '2018-07-11 14:30:00', '2018-07-11 14:30:00');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (100010091002, '已使用', '/coupon/my/history', 2, 2, '', 10001009, 1, '2018-07-11 14:30:26', '2018-07-11 14:30:26');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (100010091003, '已过期', '/coupon/my/expire', 2, 2, '', 10001009, 1, '2018-07-11 14:30:44', '2018-07-11 14:30:44');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040021001, '添加质保单', '/employee/my_sales_search', 2, 2, 'static/images/menu/employee_icon_qualityPolicy.png', 40004002, 1, '2018-07-11 14:56:29', '2018-07-11 16:07:39');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040021002, '添加增值计划', '/appreciation/add', 2, 2, 'static/images/menu/employee_icon_appreciation.png', 40004002, 2, '2018-07-11 14:56:47', '2018-07-11 16:07:53');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040021003, '我的销售', '/employee/my_sales', 2, 2, 'static/images/menu/employee_icon_myMarket.png', 40004002, 3, '2018-07-11 14:57:03', '2018-07-11 16:08:10');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040031001, '员工离职', '/employee/dimission', 2, 2, 'static/images/menu/employee_icon_alterationDG.png', 40004003, 1, '2018-07-11 14:57:50', '2018-07-11 16:08:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040031002, '员工注册', '/employee/guide_register', 2, 2, 'static/images/menu/employee_icon_employeeRegister.png', 40004003, 1, '2018-07-11 14:58:14', '2018-07-11 16:08:52');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040031003, '联盟商家注册', '/employee/partner/add', 2, 2, 'static/images/menu/employee_icon_IPCRegister.png', 40004003, 1, '2018-07-11 14:58:14', '2018-07-11 16:08:52');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040041001, '快速提货', '/employee/gift_store', 2, 2, 'static/images/menu/employee_icon_kstihuo.png', 40004004, 1, '2018-07-11 14:58:59', '2018-07-11 16:09:13');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040041002, '扫码提货', '/employee', 2, 2, 'static/images/menu/employee_icon_smtihuo.png', 40004004, 1, '2018-07-11 14:59:13', '2018-07-11 16:09:03');/**
功能初始化  桌面端
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456500742547705856, '运维管理', '/operation', 1, 1, 'el-icon-mall-server_05', 0, 1, '2018-06-13 16:51:00', '2018-06-29 17:23:43');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456500982487060480, '商家管理', '/merchant', 1, 1, 'el-icon-mall-shangjiaguanli', 0, 5, '2018-06-13 16:51:57', '2018-06-29 17:23:43');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456501286725095424, '专题与页面', '/special', 1, 1, 'el-icon-mall-zhuanti', 0, 8, '2018-06-13 16:53:09', '2018-06-29 17:23:43');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456501340840005632, '营销应用', '/marketing', 1, 1, 'el-icon-mall-yingxiao', 0, 9, '2018-06-13 16:53:22', '2018-07-06 11:14:41');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456501927287590912, '礼品管理', '/gift_store', 1, 1, 'el-icon-mall-lipin', 0, 11, '2018-06-13 16:55:42', '2018-06-29 17:23:43');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456502102538194944, '线下数据', '/offline_data', 1, 1, 'el-icon-mall-tongji', 0, 6, '2018-06-13 16:56:24', '2018-06-29 17:23:43');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456773372207042560, '客户管理', '/operation/company', 1, 2, '', 456500742547705856, 1, '2018-06-14 10:54:19', '2018-06-28 20:06:07');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456773531242467328, '微信', '/platform_manage/weixin', 1, 2, '', 456500742547705856, 3, '2018-06-14 10:54:57', '2018-07-08 17:11:33');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456773764085059584, '模板', '/operation/wx/template', 1, 2, '', 456773531242467328, 2, '2018-06-14 10:55:53', '2018-07-15 09:19:10');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456773924684959744, '已发送', '/operation/wx/send', 1, 2, '', 456773531242467328, 1, '2018-06-14 10:56:31', '2018-07-15 09:19:10');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456774098656301056, '短信', '/operation/sms/sign_name', 1, 2, '', 456500742547705856, 2, '2018-06-14 10:57:13', '2018-07-08 17:11:46');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456774194626170880, '账户', '/operation/sms/account', 1, 2, '', 456774098656301056, 1, '2018-06-14 10:57:35', '2018-07-15 09:18:20');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456774293263618048, '模板', '/operation/sms/template', 1, 2, '', 456774098656301056, 2, '2018-06-14 10:57:59', '2018-07-15 09:18:20');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456774567701123072, '发送记录', '/operation/history/sms', 1, 2, '', 456774098656301056, 3, '2018-06-14 10:59:04', '2018-07-15 09:20:12');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456774617047109632, '发送记录', '/operation/history/wx', 1, 2, '', 456773531242467328, 3, '2018-06-14 10:59:16', '2018-07-15 09:20:04');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456774917300555776, '服务号参数', '/merchant/service_number_parameter', 1, 2, '', 456500982487060480, 1, '2018-06-14 11:00:28', '2018-07-14 19:48:42');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456775137400852480, '微信菜单', '/merchant/menu', 1, 2, '', 456500982487060480, 2, '2018-06-14 11:01:20', '2018-07-14 19:48:42');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456775205096919040, '门店', '/merchant/store', 1, 2, '', 456500982487060480, 4, '2018-06-14 11:01:36', '2018-07-14 19:48:42');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456775253490798592, '员工', '/merchant/employee', 1, 2, '', 456500982487060480, 3, '2018-06-14 11:01:48', '2018-07-14 19:48:42');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776041529217024, '专题管理', '/special/subject', 1, 2, '', 456501286725095424, 1, '2018-06-14 11:04:56', '2018-07-07 17:28:20');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776123343310848, '商城首页', '/special/edit_mall', 1, 2, '', 456501286725095424, 3, '2018-06-14 11:05:15', '2018-07-04 15:01:19');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776214280015872, '礼品首页', '/special/edit_gift_store', 1, 2, '', 456501286725095424, 4, '2018-06-14 11:05:37', '2018-07-04 15:01:24');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776281212719104, '会员中心', '/special/edit_member', 1, 2, '', 456501286725095424, 5, '2018-06-14 11:05:53', '2018-07-04 15:01:30');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776370471702528, '增值计划', '/marketing/appreciation', 1, 2, '', 456501340840005632, 2, '2018-06-14 11:06:14', '2018-07-02 15:32:55');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776654958759936, '抽奖', '/marketing/lottery', 1, 2, '', 456501340840005632, 1, '2018-06-14 11:07:22', '2018-07-13 21:33:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776836307881984, '领券中心', '/marketing/coupon/center', 1, 2, '', 456501340840005632, 2, '2018-06-14 11:08:05', '2018-07-14 17:43:18');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776959213572096, '券集市', '/marketing/coupon/mall', 1, 2, '', 456501340840005632, 1, '2018-06-14 11:08:35', '2018-06-26 18:40:09');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777068936564736, '礼品档案', '/gift_store/product', 1, 2, '', 456501927287590912, 1, '2018-06-14 11:09:01', '2018-06-26 17:28:33');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777140973735936, '联盟商家', '/gift_store/partner', 1, 2, '', 456501927287590912, 2, '2018-06-14 11:09:18', '2018-07-02 11:08:41');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777213631664128, '订单', '/gift_store/indent', 1, 2, '', 456501927287590912, 3, '2018-06-14 11:09:35', '2018-06-26 17:28:33');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777447669633024, '部门', '/offline_data/department', 1, 2, '', 456502102538194944, 1, '2018-06-14 11:10:31', '2018-06-21 11:42:08');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777500740161536, '员工', '/offline_data/employee', 1, 2, '', 456502102538194944, 2, '2018-06-14 11:10:44', '2018-06-21 11:40:02');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777612006658048, '销售', '/offline_data/market', 1, 2, '', 456502102538194944, 3, '2018-06-14 11:11:10', '2018-06-21 11:40:02');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777740671127552, '积分', '/offline_data/integral', 1, 2, '', 456502102538194944, 4, '2018-06-14 11:11:41', '2018-06-21 11:40:02');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777790402990080, '看货盘', '/offline_data/pallet', 1, 2, '', 456502102538194944, 5, '2018-06-14 11:11:53', '2018-06-21 11:40:02');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777840029995008, '线下会员', '/offline_data/erp_member', 1, 2, '', 456502102538194944, 7, '2018-06-14 11:12:05', '2018-06-27 16:49:57');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (461110944018337792, '平台管理', '/system', 1, 1, 'el-icon-mall-server_05', 0, 2, '2018-06-26 10:10:16', '2018-06-29 17:23:43');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (461112885414858752, '帐号管理', '/system/account', 1, 2, '', 461110944018337792, 1, '2018-06-26 10:17:59', '2018-06-26 10:17:59');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (461568786550624256, '账号', '/merchant/account', 1, 2, '', 456500982487060480, 5, '2018-06-27 16:29:34', '2018-07-15 09:24:41');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (462713998572392448, '服务号管理', '/merchant/wx_service', 1, 2, '', 456500982487060480, 6, '2018-06-30 20:20:14', '2018-07-14 22:03:18');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (463295408647573504, '礼品档案', '/gift_store/unit/product', 1, 2, '', 456501927287590912, 1, '2018-07-02 10:50:33', '2018-07-16 10:36:23');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (464083165942779904, '平台首页', '/special/edit_home', 1, 2, '', 456501286725095424, 2, '2018-07-04 15:00:49', '2018-07-04 15:01:11');
**
角色功能初始化
 */
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (462716055962390528, 183257370250715136, 461112885414858752, '2018-06-30 20:28:25', '2018-06-30 20:28:25');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (462716055979167744, 183257370250715136, 461110944018337792, '2018-06-30 20:28:25', '2018-06-30 20:28:25');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600711643136, 183259005916028928, 466618676674695168, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600728420352, 183259005916028928, 466614245669343232, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600741003264, 183259005916028928, 466618731708157952, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600753586176, 183259005916028928, 466618789891543040, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600761974784, 183259005916028928, 466618867716853760, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600774557696, 183259005916028928, 466618932472713216, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600787140608, 183259005916028928, 466619323352485888, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600816500736, 183259005916028928, 466619419792117760, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600850055168, 183259005916028928, 466619478805975040, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637658374934528, 183259029018255360, 466619045442097152, '2018-07-11 16:11:27', '2018-07-11 16:11:27');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637658391711744, 183259029018255360, 466614245669343232, '2018-07-11 16:11:27', '2018-07-11 16:11:27');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637658404294656, 183259029018255360, 466619131341443072, '2018-07-11 16:11:27', '2018-07-11 16:11:27');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637658421071872, 183259029018255360, 466619229081309184, '2018-07-11 16:11:27', '2018-07-11 16:11:27');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230405251072, 183258332713459712, 456500742547705856, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230422028288, 183258332713459712, 456773372207042560, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230438805504, 183258332713459712, 456774098656301056, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230451388416, 183258332713459712, 456774194626170880, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230468165632, 183258332713459712, 456774293263618048, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230484942848, 183258332713459712, 456774567701123072, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230497525760, 183258332713459712, 456773531242467328, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230514302976, 183258332713459712, 456773924684959744, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230526885888, 183258332713459712, 456773764085059584, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230543663104, 183258332713459712, 456774617047109632, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230560440320, 183258332713459712, 456502102538194944, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230573023232, 183258332713459712, 456777447669633024, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230589800448, 183258332713459712, 456777500740161536, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230602383360, 183258332713459712, 456777612006658048, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230619160576, 183258332713459712, 456777740671127552, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230635937792, 183258332713459712, 456777790402990080, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230648520704, 183258332713459712, 456777840029995008, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372445356032, 183259005916028928, 40004002, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372462133248, 183259005916028928, 4000, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372478910464, 183259005916028928, 400040021001, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372495687680, 183259005916028928, 400040021002, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372512464896, 183259005916028928, 400040021003, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372529242112, 183259005916028928, 40004004, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372550213632, 183259005916028928, 400040041001, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372562796544, 183259005916028928, 400040041002, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584207376384, 183258583545421824, 456774917300555776, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584224153600, 183258583545421824, 456500982487060480, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584236736512, 183258583545421824, 456775137400852480, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584253513728, 183258583545421824, 456775253490798592, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584270290944, 183258583545421824, 456775205096919040, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584337399808, 183258583545421824, 461568786550624256, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584354177024, 183258583545421824, 456501286725095424, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584370954240, 183258583545421824, 456776041529217024, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584383537152, 183258583545421824, 464083165942779904, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584400314368, 183258583545421824, 456776123343310848, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584417091584, 183258583545421824, 456776214280015872, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584433868800, 183258583545421824, 456776281212719104, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584450646016, 183258583545421824, 456501340840005632, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584467423232, 183258583545421824, 456776959213572096, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584480006144, 183258583545421824, 456776654958759936, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584496783360, 183258583545421824, 456776370471702528, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584513560576, 183258583545421824, 456776836307881984, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584530337792, 183258583545421824, 456777068936564736, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584542920704, 183258583545421824, 456501927287590912, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584559697920, 183258583545421824, 456777140973735936, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584576475136, 183258583545421824, 456777213631664128, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348534620160, 183258467749076992, 462713998572392448, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348551397376, 183258467749076992, 456500982487060480, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348568174592, 183258467749076992, 456502102538194944, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348580757504, 183258467749076992, 456777447669633024, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348597534720, 183258467749076992, 456777500740161536, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348610117632, 183258467749076992, 456777612006658048, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348626894848, 183258467749076992, 456777740671127552, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348639477760, 183258467749076992, 456777790402990080, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348656254976, 183258467749076992, 456777840029995008, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348673032192, 183258467749076992, 463295408647573504, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348685615104, 183258467749076992, 456501927287590912, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348702392320, 183258467749076992, 456777213631664128, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572277960704, 464095291973439488, 456774917300555776, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572294737920, 464095291973439488, 456500982487060480, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572307320832, 464095291973439488, 456775137400852480, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572324098048, 464095291973439488, 456775253490798592, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572336680960, 464095291973439488, 456775205096919040, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572353458176, 464095291973439488, 456502102538194944, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572366041088, 464095291973439488, 456777447669633024, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572382818304, 464095291973439488, 456777500740161536, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572395401216, 464095291973439488, 456777612006658048, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572412178432, 464095291973439488, 456777740671127552, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572424761344, 464095291973439488, 456777790402990080, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572441538560, 464095291973439488, 456777840029995008, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572454121472, 464095291973439488, 463295408647573504, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572470898688, 464095291973439488, 456501927287590912, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318840672256, 464096328360792064, 456774917300555776, '2018-07-18 12:04:52', '2018-07-18 12:04:52');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318857449472, 464096328360792064, 456500982487060480, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318870032384, 464096328360792064, 456775137400852480, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318886809600, 464096328360792064, 456775253490798592, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318899392512, 464096328360792064, 456775205096919040, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318916169728, 464096328360792064, 456501286725095424, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318932946944, 464096328360792064, 456776041529217024, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318945529856, 464096328360792064, 464083165942779904, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318962307072, 464096328360792064, 456776123343310848, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318974889984, 464096328360792064, 456776214280015872, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318991667200, 464096328360792064, 456776281212719104, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319004250112, 464096328360792064, 456501340840005632, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319021027328, 464096328360792064, 456776959213572096, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319037804544, 464096328360792064, 456776654958759936, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319050387456, 464096328360792064, 456776370471702528, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319067164672, 464096328360792064, 456776836307881984, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319079747584, 464096328360792064, 456777068936564736, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319096524800, 464096328360792064, 456501927287590912, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319109107712, 464096328360792064, 456777140973735936, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319125884928, 464096328360792064, 456777213631664128, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112387555954688, 183259029018255360, 40004003, '2018-07-18 12:05:09', '2018-07-18 12:05:09');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112387568537600, 183259029018255360, 4000, '2018-07-18 12:05:09', '2018-07-18 12:05:09');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112387585314816, 183259029018255360, 400040031001, '2018-07-18 12:05:09', '2018-07-18 12:05:09');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112387602092032, 183259029018255360, 400040031002, '2018-07-18 12:05:09', '2018-07-18 12:05:09');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112387614674944, 183259029018255360, 400040031003, '2018-07-18 12:05:09', '2018-07-18 12:05:09');

/**
添加员工任务相关功能
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (40004005, '任务', '/employee', 2, 2, '', 4000, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040051001, '纪念日回访', '/employee/task/anniversary', 2, 2, 'static/images/menu/employee_icon_commemoration.png', 40004005, 1, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040051002, '生日回访', '/employee/task/birthday', 2, 2, 'static/images/menu/employee_icon_birthday.png', 40004005, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040051003, '第一次销售回访', '/employee/task/first', 2, 2, 'static/images/menu/employee_icon_marketHF1.png', 40004005, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040051004, '第二次销售回访', '/employee/task/second', 2, 2, 'static/images/menu/employee_icon_marketHF2.png', 40004005, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040051005, '第三次销售回访', '/employee/task/third', 2, 2, 'static/images/menu/employee_icon_marketHF3.png', 40004005, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040051006, '门店销售评价', '/employee/task/sale_comment', 2, 2, 'static/images/menu/employee_icon_marketComment.png', 40004005, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');


/**
导购角色添加会员分配功能
 */
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (474585385943568384, 183259005916028928, 400040051001, '2018-08-02 14:32:53', '2018-08-02 14:32:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (474585385956151296, 183259005916028928, 400040051002, '2018-08-02 14:32:53', '2018-08-02 14:32:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (474585385964539904, 183259005916028928, 400040051003, '2018-08-02 14:32:53', '2018-08-02 14:32:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (474585385972928512, 183259005916028928, 400040051004, '2018-08-02 14:32:53', '2018-08-02 14:32:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (474585385985511424, 183259005916028928, 400040051005, '2018-08-02 14:32:53', '2018-08-02 14:32:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (474585385993900032, 183259005916028928, 400040051006, '2018-08-02 14:32:53', '2018-08-02 14:32:53');

/*删除短信签名模块*/
delete from authorization_service.func where id=456774384166768640;

/*系统管理员用户id修改*/
update user_role set user_id=20180715 where id=183260035114344448;
update user_login_info set user_id=20180715 where id=183259332664893440;
USE wx_gateway;


/*************************开发环境********************************/
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES (1, 'component_auth_callback_url', 'http://v3dev.sjfx.com.cn/wxgateway/cm/auth/callback/%s', now(), now());
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES
  (2, 'mp_redirect_uri', 'http%3a%2f%2fv3dev.sjfx.com.cn%2fwxgateway%2fmp%2fauth%2fcode%2fcallback', now(),
   now());
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES
  (3, 'cm_mp_redirect_uri', 'http%3a%2f%2fv3dev.sjfx.com.cn%2fwxgateway%2fcm%2fauth%2fcode%2fcallback', now(),
   now());
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES
  (4, 'error_page', 'http://v3dev.sjfx.com.cn/web/#/error', now(),
   now());
INSERT INTO wx_app_info VALUES (1, 0, 0, 'wxed16bd90c68476c7', '866bad353ebe6cfe008bf7e033f964e8',
                                   '世纪福星', NULL, 2, 0, 'gh_ee03bfd8f5bf',
                                   '湖南越翼网络科技有限公司', 'sjfxzbsoft', NULL, NULL, NULL, NULL, 0, now(), now()
);

INSERT INTO wx_token (id, appid, app_secret, refresh_type, create_time, update_time)
VALUES (1, 'wxed16bd90c68476c7', '866bad353ebe6cfe008bf7e033f964e8', 1, now(), now());

INSERT INTO wx_token (id, appid, app_secret, refresh_type, create_time, update_time)
VALUES (2, 'wx511c51039f561228', 'bffa2023e8e7e21bdcd7bcfe5a127951', 2, now(), now());



/**************初始化微信公共模板****************/

INSERT INTO wx_gateway.wx_sys_template
VALUES (1, 'OPENTM207665167', '消费品 - 消费品', '', '', '积分通知', '', 1, now(), now()),
  (2, 'OPENTM207804704', '消费品 - 消费品', '', '', '兑换通知', '', 1, now(), now()),
  (3, 'TM00232', '消费品 - 消费品', '', '', '积分兑换成功通知', '', 1, now(), now()),
  (4, 'OPENTM207251323', '消费品 - 消费品', '', '', '产品即将到期提醒', '', 1, now(), now()),
  (5, 'OPENTM206215005', '消费品 - 消费品', '', '', '核销成功提醒', '', 1, now(), now()),
  (6, 'OPENTM411613106', '消费品 - 消费品', '', '', '礼品申领成功通知', '', 1, now(), now()),
  (7, 'OPENTM402063677', '消费品 - 消费品', '', '', '订单创建通知', '', 1, now(), now()),
  (8, 'OPENTM207940503', '消费品 - 消费品', '', '', '订单状态提醒', '', 1, now(), now()),
  (9, 'TM00504', '消费品 - 消费品', '', '', '消费成功通知', '', 1, now(), now());
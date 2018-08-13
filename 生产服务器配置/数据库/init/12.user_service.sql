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





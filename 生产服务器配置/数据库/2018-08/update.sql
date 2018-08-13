use coupon_service;

alter table coupon_template add take_effect_way tinyint NOT NULL  COMMENT '生效方式';

alter table coupon_template add take_effect_day int COMMENT '领取后多少天有效';

alter table coupon_template modify column begin_time datetime DEFAULT NULL COMMENT '此时间表示此类礼劵总的有效开始时间和结束时间';

alter table coupon_template modify column end_time datetime DEFAULT NULL COMMENT '有效期结束时间';

alter table coupon_template modify column use_threshold decimal(10) DEFAULT 0 COMMENT '使用门槛';

alter table coupon_user modify column use_threshold decimal(10) DEFAULT 0 COMMENT '使用门槛';

ALTER  table coupon_give ADD transfer_user_id BIGINT COMMENT '转赠人id';

alter table coupon_template modify column begin_time datetime DEFAULT NULL COMMENT '此时间表示此类礼劵总的有效开始时间和结束时间';
alter table coupon_template modify column end_time datetime DEFAULT NULL COMMENT '有效期结束时间';

USE erp_sync;
DROP TABLE IF EXISTS synch_tenant_register;
CREATE TABLE `synch_tenant_register` (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `tenant_id` bigint(20) NOT NULL COMMENT '所属单位id',
  `tenant_app_id` bigint(20) NOT NULL COMMENT '所属服务号id',
  `tenant_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0' COMMENT '客户端IP',
  `tenant_status` bit(1) DEFAULT b'1' COMMENT '状态，0禁用，1启用',
  `connection_string` varchar(400) NOT NULL COMMENT '数据库连接字符串',
  `user_name` varchar(40) NOT NULL COMMENT '数据库访问用户名',
  `password` varchar(40) NOT NULL COMMENT '数据库访问密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `synch_tenant_register_tenant_app_id_uindex` (`tenant_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='同步客户端注册';

use `sms`;
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

USE user_service;
ALTER  table user_employee MODIFY user_id BIGINT NOT NULL COMMENT '用户id';


use value_added;
ALTER TABLE value_added_user MODIFY amount_pay DECIMAL(10) NOT NULL COMMENT '实际支付的金额，不包括优惠金额';
ALTER TABLE value_added_user MODIFY amount_total DECIMAL(10) NOT NULL COMMENT '应付金额，包括了优惠金额，积分抵现等';

use tenant;
ALTER TABLE employee_user add tenant_id BIGINT(20) COMMENT '租户ID';

use authorization_service;
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (475956746427437056, 183259005916028928, 40004005, '2018-08-06 09:22:11', '2018-08-06 09:22:11');


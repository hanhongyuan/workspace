use gift_mail;
ALTER TABLE partner MODIFY manager_user_id BIGINT(20)  COMMENT '收款人OpenId';

use user_service;

CREATE TABLE `erp_member` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户单位id',
  `tenant_wechatapp_id` bigint(20) NOT NULL COMMENT '服务号id',
  `member_erp_id` bigint(20) NOT NULL COMMENT '会员erpid',
  `employee_erp_id` bigint(20) DEFAULT NULL COMMENT '所属员工id',
  `grade_erp_id` bigint(20) DEFAULT NULL COMMENT '会员级别id',
  `card_no` varchar(32) DEFAULT NULL COMMENT '会员卡号',
  `dept_erp_id` bigint(20) NOT NULL COMMENT '部门erpid',
  `mobile_no` varchar(16) NOT NULL COMMENT '手机号码',
  `consumption_integral` decimal(10,2) NOT NULL COMMENT '累计消费积分',
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_member` (`tenant_wechatapp_id`,`member_erp_id`),
  UNIQUE KEY `tenant_wechatapp_id_mobile_no` (`tenant_wechatapp_id`,`mobile_no`),
  KEY `idx_mobile_no` (`mobile_no`,`tenant_id`,`dept_erp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员';
  
CREATE TABLE `erp_member_info` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '商户id',
  `tenant_wechatapp_id` bigint(20) NOT NULL COMMENT '服务号id',
  `erp_member_id` bigint(20) NOT NULL COMMENT '会员id',
  `mobile_no` varchar(16) NOT NULL COMMENT '手机号码',
  `user_name` varchar(32) NOT NULL COMMENT '姓名',
  `sex` varchar(8) DEFAULT NULL COMMENT '性别',
  `birthday` varchar(20) DEFAULT NULL,
  `birthday_is_lunar` tinyint(1) DEFAULT NULL COMMENT '生日是否为农历：1-是，0-否',
  `home_address` varchar(128) DEFAULT NULL COMMENT '家庭住址',
  `memorialday` varchar(20) DEFAULT NULL COMMENT '纪念日',
  `memorialday_name` varchar(16) DEFAULT NULL COMMENT '纪念日名称',
  `memorialday_is_lunar` tinyint(1) DEFAULT NULL COMMENT '纪念日是否农历',
  `interested` varchar(16) DEFAULT NULL COMMENT '感兴趣的',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT '累计消息金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_erp_member_id` (`erp_member_id`),
  UNIQUE KEY `tenant_wechatapp_id_erp_member_id` (`tenant_wechatapp_id`,`erp_member_id`),
  UNIQUE KEY `tenant_wechatapp_id_mobile_no` (`tenant_wechatapp_id`,`mobile_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员信息';

use coupon_service;
drop index uk_tenant_wechatpp_id_coupon_name on coupon_template;

use tenant;
alter table tenant.tenant add admin_user_tel varchar(20);

use tenant;
alter table `tenant`.erp_integral_log add tenant_wechatapp_id bigint(20) not null default 0;
alter table `tenant`.erp_sales_detail  modify column remark varchar(1024);

use user_service;
ALTER TABLE user_service.tenant_user
  CHANGE COLUMN brithday birthday DATETIME,
  CHANGE COLUMN brithday_is_lunar birthday_is_lunar TINYINT(3) UNSIGNED DEFAULT NULL COMMENT '生日是否为农历：1-是，0-否';

use tenant;
-- ----------------------------
-- Table structure for employee_user
-- ----------------------------
DROP TABLE IF EXISTS `employee_user`;
CREATE TABLE `employee_user`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_wechatapp_id` bigint(20) NOT NULL COMMENT '客户服务号id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `employee_erp_id` bigint(20) NOT NULL COMMENT '员工id',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '员工用户对应表' ROW_FORMAT = Dynamic;

use coupon_service;
alter table coupon_user add creator_mobile_no varchar(20) COMMENT '创建者手机号码';

use wx_gateway;

alter table wx_gateway.wx_template_msg add user_head_img_url varchar(255);
alter table wx_gateway.wx_template_msg add user_name varchar(32);
alter table wx_gateway.wx_template_msg add user_mobile_no varchar(11);
alter table wx_gateway.wx_template_msg add tenant_app_name varchar(32);
alter table wx_gateway.wx_template_msg add tenant_short_name varchar(16);

use authorization_service;
update user_role set user_id=20180715 where id=183260035114344448;
update user_login_info set user_id=20180715 where id=183259332664893440;

use coupon_service;
alter table coupon_template modify column use_threshold decimal(10) DEFAULT 0 COMMENT '使用门槛';

alter table coupon_user modify column use_threshold decimal(10) DEFAULT 0 COMMENT '使用门槛';


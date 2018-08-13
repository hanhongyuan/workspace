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


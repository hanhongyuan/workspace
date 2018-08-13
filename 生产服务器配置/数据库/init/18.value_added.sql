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

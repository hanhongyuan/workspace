use tag_service;
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

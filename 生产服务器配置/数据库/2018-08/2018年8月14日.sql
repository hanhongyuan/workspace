--已执行
use activity_service;

alter table `activity` modify column  `activity_type` varchar(32)  NOT NULL COMMENT '活动类型(枚举值：lottery抽奖,light_up_blessing点亮祝福)';
alter table `activity` add column  `activity_background_pic_url` varchar(512) DEFAULT NULL COMMENT '活动背景图' AFTER `activity_main_pic_url`;

DROP TABLE IF EXISTS `assist_task_activity`;
CREATE TABLE `assist_task_activity` (
  `id` bigint(20) NOT NULL,
  `tenant_id` bigint(20) NOT NULL COMMENT '单位id',
  `tenant_wechatapp_id` bigint(20) NOT NULL COMMENT '服务号id',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `assist_type` varchar(32) NOT NULL COMMENT '协助类型(枚举值：light_up_blessing点亮祝福,cut_down_price砍价)',
  `task_total_num` int(10)  NOT NULL COMMENT '任务总数',
  `activity_data` json NOT NULL COMMENT '活动数据',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '数据版本号',
  PRIMARY KEY (`id`),
  KEY `idx_assist_task_tenant` (`tenant_wechatapp_id`),
  KEY `idx_assist_task_activity_id` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='协助任务活动';


DROP TABLE IF EXISTS `assist_task_prize`;
CREATE TABLE `assist_task_prize` (
  `id` bigint(20) NOT NULL,
  `tenant_wechatapp_id` bigint(20) NOT NULL COMMENT '服务号id',
  `tenant_id` bigint(20) NOT NULL COMMENT '单位id',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `assist_task_activity_id` bigint(20) NOT NULL COMMENT '协助任务活动id',
  `prize_data` json NOT NULL COMMENT '奖品数据',
  `prize_total_num` int(5) NOT NULL COMMENT '奖品数量',
  `prize_received_num` int(5) NOT NULL COMMENT '已领取奖品数量',
  `prize_detail` text NOT NULL COMMENT '奖品详情',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '数据版本号',
  PRIMARY KEY (`id`),
  KEY `idx_assist_task_prize` (`assist_task_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='协助任务奖品';

DROP TABLE IF EXISTS `assist_task_user`;
CREATE TABLE `assist_task_user` (
  `id` bigint(20) NOT NULL,
  `tenant_id` bigint(20) NOT NULL COMMENT '单位id',
  `tenant_wechatapp_id` bigint(20) NOT NULL COMMENT '服务号id',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `assist_task_activity_id` bigint(20) NOT NULL COMMENT '协助任务活动id',
  `user_id` bigint(20) NOT NULL COMMENT '参与用户id',
  `assist_user_id`       bigint(20) comment '协助用户id',
  `assist_task_user_id`  bigint(20) comment '协助任务申请id',
  `partake_type` varchar(30) NOT NULL COMMENT '参与类型(枚举值：appoint预约,apply申请,assist协助)',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态(1正常，2预约取消,3任务已完成，4已领取奖品,5未领到奖品)',
  `assist_data` json DEFAULT NULL COMMENT '协助数据',
  `finished_task_num` int(10) DEFAULT 0 COMMENT '已完成任务数',
  `finished_task_time` datetime DEFAULT NULL COMMENT '完成任务时间',
  `received_prize_time` datetime DEFAULT NULL COMMENT '领取奖品时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idex_assist_task_user` (`assist_task_activity_id`,`user_id`),
  KEY `idex_assist_task_user_activity` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='协助任务活动用户参与明细';


DROP TABLE IF EXISTS `assist_task_receive_prize`;
CREATE TABLE `assist_task_receive_prize` (
  `id` bigint(20) NOT NULL,
  `tenant_id` bigint(20) NOT NULL COMMENT '单位id',
  `tenant_wechatapp_id` bigint(20) NOT NULL COMMENT '服务号id',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `assist_task_activity_id` bigint(20) NOT NULL COMMENT '协助任务活动id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `head_img_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像URL',
  `user_name` varchar(32)  DEFAULT NULL COMMENT '用户姓名',
  `mobile_no` varchar(16)  DEFAULT NULL COMMENT '用户手机号',
  `prize_data` json NOT NULL COMMENT '奖品数据',
  `receive_prize_data` json NOT NULL COMMENT '领取奖品数据',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_assist_task_receive_prize` (`assist_task_activity_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='协助任务活动用户领取奖品明细';


use user_service;
ALTER TABLE user_service.erp_member
    ADD UNIQUE uk_app_member(member_erp_id, tenant_wechatapp_id);

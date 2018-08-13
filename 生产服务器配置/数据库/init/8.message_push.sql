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


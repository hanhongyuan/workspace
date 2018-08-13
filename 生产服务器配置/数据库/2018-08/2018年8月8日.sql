-- 已执行
use coupon_service;
alter table coupon_template modify column use_threshold decimal(10,2) DEFAULT 0 COMMENT '使用门槛';

alter table coupon_user modify column use_threshold decimal(10,2) DEFAULT 0 COMMENT '使用门槛';

ALTER TABLE coupon_template modify column face_value decimal(10,2) DEFAULT 0 COMMENT '礼券面值';
ALTER TABLE coupon_user modify column face_value decimal(10,2) DEFAULT 0 COMMENT '礼券面值';

-- 已执行
use message_push;
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (467316143602371536, 'reservation_expiring', 'OPENTM202194461', '2018-07-13 07:46:52', '2018-07-13 07:46:55');
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (467326143602371536, 'task_completed', 'OPENTM410037016', '2018-07-13 07:46:52', '2018-07-13 07:46:55');



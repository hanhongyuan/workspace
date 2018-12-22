use `message_push`;
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (467325897102371536, 'card_created', 'OPENTM201378211', '2018-07-13 07:46:52', '2018-07-13 07:46:55');


use authorization_service;


/**
超级导购增加消费卡发放功能
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040041003, '消费卡', '/gift_store/card/give', 2, 2, 'static/images/menu/member_icon_card.png', 40004004, 1, '2018-07-11 14:59:13', '2018-07-11 16:09:03');


/**
给导购和店长添加消费卡发放功能权限
 */
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (482576362679439360, 183259005916028928, 400040041003, '2018-08-24 15:46:11', '2018-08-24 15:46:11');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (482576402256891904, 183259029018255360, 400040041003, '2018-08-24 15:46:20', '2018-08-24 15:46:20');



-- 已执行
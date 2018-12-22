use authorization_service;

/**
增加智能管理
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (40004007, '智能管理', '/employee', 2, 2, '', 4000, 2, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040071001, '意向顾客登记', '/employee/shop_guest/add/list', 2, 2, '/static/images/menu/employee_icon_userKeep.png', 40004007, 1, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040071002, '意向顾客维系', '/employee/shop_guest/maintain/list', 2, 2, '/static/images/menu/employee_icon_clientBaguette.png', 40004007, 2, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
/**
增加意向顾客功能
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040031005, '意向顾客管理', '/employee/shop_guest/audit/audit_intention_list', 2, 2, '/static/images/menu/employee_icon_customers.png', 40004003, 5, '2018-07-11 14:57:50', '2018-07-11 16:08:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040031006, '顾客维系管理', '/employee/shop_guest/audit/audit_together_list', 2, 2, '/static/images/menu/employee_icon_keep.png', 40004003, 6, '2018-07-11 14:58:14', '2018-07-11 16:08:52');

/**
超级导购增加消费卡发放功能
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040041003, '消费卡', '/gift_store/card/give', 2, 2, 'static/images/menu/member_icon_card.png', 40004004, 1, '2018-07-11 14:59:13', '2018-07-11 16:09:03');


/**
给导购和店长添加消费卡发放功能权限
 */
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (482576362679439360, 183259005916028928, 400040041003, '2018-08-24 15:46:11', '2018-08-24 15:46:11');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (482576402256891904, 183259029018255360, 400040041003, '2018-08-24 15:46:20', '2018-08-24 15:46:20');


INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (481765995816554496, '消费卡', '/gift_store/consumer_card', 1, 2, '', 456501927287590912, 4, '2018-08-22 10:06:04', '2018-08-22 10:06:04');

INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (481834389458784256, 183258583545421824, 481765995816554496, '2018-08-22 14:37:50', '2018-08-22 14:37:50');


use `message_push`;
update wx_template_mapping set wx_template_id='OPENTM201838773' where wx_template_id ='TM00504';





use authorization_service;

/**
增加点亮祝福功能
 */
INSERT INTO func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (50005003, '点亮祝福', '/activity/light_lantern', 2, 2, 'static/images/menu/member_icon_lantern.png', 5000, 2, '2018-07-11 14:49:35', '2018-07-11 16:06:18');

/**
添加数据初始化功能
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (477487519118790656, '数据初始化', '/operation/data_init', 1, 2, '', 456500742547705856, 4, '2018-08-10 14:44:56', '2018-08-10 14:44:56');

/**
给运维角色添加数据初始化功能
 */
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477487548780908544, 183258332713459712, 477487519118790656, '2018-08-10 14:45:03', '2018-08-10 14:45:03');


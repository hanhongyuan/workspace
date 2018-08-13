use authorization_service;
/**
增加券核销功能 文波 已执行
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040021004, '券核销', '/employee', 2, 2, 'static/images/menu/member_icon_coupon.png', 40004002, 4, '2018-07-11 14:57:03', '2018-07-11 16:08:10');

/**
导购角色增加券核销功能 文波 已执行
 */
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (476319523113406464, 183259005916028928, 400040021004, '2018-08-07 09:23:44', '2018-08-07 09:23:44');

--xuxueyi 已执行
use message_push;
INSERT INTO message_push.wx_template_mapping (id, scene_type, wx_template_id, create_time, update_time) VALUES (467356143602371536, 'employee_task', 'OPENTM207178317', '2018-07-13 07:46:52', '2018-07-13 07:46:55');

--xuxueyi 已执行
use `tenant`;
alter table erp_sales_detail modify column cert_no varchar(60);
desc erp_sales_detail;
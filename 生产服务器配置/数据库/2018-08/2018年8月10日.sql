use authorization_service;

/**
清除店长权限 已执行
 */
delete from role_func where role_id=183259029018255360;

/**
给店长角色设置权限 已执行
 */
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411616776192, 183259029018255360, 4000, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411625164800, 183259029018255360, 40004001, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411633553408, 183259029018255360, 40004002, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411683885056, 183259029018255360, 40004003, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411750993920, 183259029018255360, 40004004, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411780354048, 183259029018255360, 40004005, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411847462912, 183259029018255360, 40004006, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411646136320, 183259029018255360, 400040021001, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411654524928, 183259029018255360, 400040021002, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411662913536, 183259029018255360, 400040021003, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411671302144, 183259029018255360, 400040021004, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411692273664, 183259029018255360, 400040031001, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411700662272, 183259029018255360, 400040031002, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411709050880, 183259029018255360, 400040031003, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411742605312, 183259029018255360, 400040031004, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411763576832, 183259029018255360, 400040041001, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411771965440, 183259029018255360, 400040041002, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411788742656, 183259029018255360, 400040051001, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411797131264, 183259029018255360, 400040051002, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411809714176, 183259029018255360, 400040051003, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411822297088, 183259029018255360, 400040051004, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411830685696, 183259029018255360, 400040051005, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411839074304, 183259029018255360, 400040051006, '2018-08-10 16:23:51', '2018-08-10 16:23:51');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477512411855851520, 183259029018255360, 400040061001, '2018-08-10 16:23:51', '2018-08-10 16:23:51');


/**
修改我的会员图标 已执行
 */
UPDATE authorization_service.func SET logo_url = 'static/images/menu/employee_icon_vip.png' WHERE id = 400040061001;
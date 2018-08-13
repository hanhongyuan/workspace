
use authorization_service;

delete from func;
delete from ignore_permission_url;
delete from role;
delete from role_func;
delete from user_login_info;
delete from user_role;

INSERT INTO ignore_permission_url VALUES (1, '*', '/authorization/api/v1/login', 0, '登录', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (2, '*', '/authorization/api/v1/login/tenant', 0, '租户登录', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (3, '*', '/wxgateway/login', 0, '微信网页授权', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (4, '*', '/wxgateway/js/config', 0, '微信jsconfig', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (5, '*', '/wxgateway', 0, '微信平台服务号消息', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (6, '*', '/wxgateway/cm/{regex:[a-zA-Z0-9]+}', 0, '微信租户服务号消息', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (7, '*', '/wxgateway/mp/auth/code/callback', 0, '微信平台服务号网页授权回调', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (8, '*', '/wxgateway/cm/auth/code/callback', 0, '微信租户服务号网页授权回调', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (9, '*', '/wxgateway/cm/auth', 0, '微信服务号授权', 1, now(), now());
INSERT INTO ignore_permission_url VALUES (10, '*', '/wxgateway/cm/auth/event', 0, '微信授权消息', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (11, '*', '/wxgateway/cm/auth/callback/{tenantId:[0-9]+}', 0, '微信服务号授权回调', 1, now(), now());

INSERT INTO ignore_permission_url
VALUES (12, '*', '/authorization/auth/check', 0, 'token检查', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (13, '*', '/authorization/auth/reload/config', 0, 'token检查', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (14, '*', '/authorization/api/v1/super-login', 0, '快捷登录', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (15, '*', '/tenant/api/v1/tenant/wechatapp/get-tenant-app-by-name', 0, '获取租户app', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (16, '*', '/user/api/v1/get-user-info-by-keyword', 0, '获取用户信息', 1, now(), now());
INSERT INTO ignore_permission_url
VALUES (17, '*', '/oss/callback', 0, '图片回调地址', 1, now(), now());


/**
角色初始化
 */
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183257370250715136, '系统管理员', 'system', 1, 'static/images/menu/role/icon_manage.png', '系统配置', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183258332713459712, '运维管理员', 'admin', 1, 'static/images/menu/role/icon_maintenance.png', '管理所有单位', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183258467749076992, '单位管理员', 'tenant_admin', 2, 'static/images/menu/role/icon_merchant.png', '管理单位', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183258583545421824, '服务号管理员', 'tenant_wechatapp_admin', 3, 'static/images/menu/role/icon_boss.png', '', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183258719801581568, '财务', 'tenant_financial', 3, 'static/images/menu/role/icon_shoppingGuide.png', '', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183259005916028928, '导购', 'tenant_sales', 3, 'static/images/menu/role/icon_shopManager.png', '', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (183259029018255360, '店长', 'tenant_shop_manager', 3, 'static/images/menu/role/icon_accounting.png', '', '2018-06-26 09:34:42', '2018-06-26 09:34:42');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (464095291973439488, '单位操作员', 'tenant_operation', 2, 'static/images/menu/role/icon_merchant_operator.png', '管理员具有平台全部功能使用权限。请谨慎配置', '2018-07-04 15:53:36', '2018-07-04 15:53:36');
INSERT INTO authorization_service.role (id, role_name, role_code, role_type, role_logo, role_remark, create_time, update_time) VALUES (464096328360792064, '服务号操作员', 'tenant_wechatapp_operation', 3, 'static/images/menu/role/icon_unit_operator.png', '管理员具有平台全部功能使用权限。请谨慎配置', '2018-07-04 15:53:36', '2018-07-04 15:53:36');

/**
账户初始化 平台管理员
 */

INSERT INTO user_login_info (id, user_id, login_way, login_name, login_password, login_salt, create_time, update_time)
VALUES
  (183259332664893440, 1, 1, 'admin', '5f1d7a84db00d2fce00b31a7fc73224f', 'e10adc3949ba59abbe56e057f20f883e', now(),
   now());

/**
账户角色初始化
 */
INSERT INTO user_role (id, user_id, role_id, tenant_id, tenant_wechatapp_id, create_time, update_time)
VALUES (183260035114344448, 1, 183257370250715136, 0, 0, now(), now());

/**
功能初始化  手机端
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (1000, '会员中心', '/', 2, 1, 'static/images/nav/icon_my.png', 0, 2, '2018-07-07 11:09:24', '2018-07-11 16:04:21');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (1001, '首页', '/', 2, 1, 'static/images/nav/icon_home.png', 0, 1, '2018-07-11 14:24:05', '2018-07-11 16:04:11');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (2000, '礼品商城', '/gift_store', 2, 1, 'static/images/nav/icon_gift.png', 0, 3, '2018-07-07 11:10:32', '2018-07-11 16:06:01');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (3000, '礼券', '/coupon', 2, 1, 'static/images/nav/icon_class.png', 0, 4, '2018-07-10 20:00:57', '2018-07-11 16:07:09');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (4000, '超级导购', '/employee', 2, 1, 'static/images/icon_shoppingGuide.png', 0, 5, '2018-07-11 14:38:25', '2018-07-11 16:07:29');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (5000, '活动', '/activity', 2, 1, 'static/images/nav/icon_activity.png', 0, 7, '2018-07-11 14:39:08', '2018-07-11 16:06:10');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (6000, '自定义页面', '/customize_page', 2, 1, '', 0, 7, '2018-07-11 14:39:08', '2018-07-11 16:06:10');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001001, '首页', '/member', 2, 2, '', 1000, 1, '2018-07-10 19:57:15', '2018-07-11 14:23:16');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001003, '注册与绑定', '/register', 2, 2, '', 1000, 3, '2018-07-10 19:54:34', '2018-07-11 14:24:20');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001004, '更新资料', '/member/data', 2, 2, '', 1000, 4, '2018-07-10 19:55:06', '2018-07-11 14:27:50');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001005, '关注公众号', '/member/attention', 2, 2, '', 1000, 5, '2018-07-10 19:55:28', '2018-07-11 14:24:38');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001006, '我的管家', '/member/my_steward', 2, 2, 'static/images/menu/member_icon_steward.png', 1000, 6, '2018-07-10 19:56:50', '2018-07-11 16:05:27');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001007, '门店购物', '/member/shopping_record', 2, 2, 'static/images/menu/member_icon_offlineBuy.png', 1000, 7, '2018-07-10 19:58:14', '2018-07-11 16:05:48');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001008, '我的积分', '/member/point', 2, 2, 'static/images/menu/member_icon_integral.png', 1000, 8, '2018-07-10 20:03:34', '2018-07-11 16:04:38');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001009, '我的礼券', '/coupon/my', 2, 2, 'static/images/menu/member_icon_coupon.png', 1000, 9, '2018-07-10 20:04:58', '2018-07-11 16:04:50');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001010, '我的增值', '/appreciation', 2, 2, 'static/images/menu/member_icon_appreciation.png', 1000, 10, '2018-07-10 20:07:29', '2018-07-11 16:05:14');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001011, '我的质保单', '/product_certs/my_list', 2, 2, 'static/images/menu/member_icon_guaranteeSlip.png', 1000, 11, '2018-07-10 20:08:12', '2018-07-11 16:05:02');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (10001012, '附近门店', '/member/store', 2, 2, 'static/images/menu/member_icon_receivingGifts.png', 1000, 12, '2018-07-10 20:08:46', '2018-07-11 16:05:37');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (20002001, '首页', '/gift_store', 2, 2, '', 2000, 1, '2018-07-11 14:32:35', '2018-07-11 14:36:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (20002002, '附件好礼商家首页', '/gift_store', 2, 2, '', 2000, 2, '2018-07-11 14:35:16', '2018-07-11 14:36:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (20002003, '详情页', '/gift_store', 2, 2, '', 2000, 3, '2018-07-11 14:34:33', '2018-07-11 14:36:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (20002004, '我的兑换记录', '/gift_store/order', 2, 2, '', 2000, 5, '2018-07-11 14:36:15', '2018-07-11 14:36:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (20002005, '扫码提货', '/employee', 2, 2, 'static/images/menu/employee_icon_pickUpGoods.png', 2000, 6, '2018-07-07 11:19:31', '2018-07-11 14:36:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (20002006, '快速提货', '/employee/gift_store', 2, 2, 'static/images/menu/employee_icon_returnGoods1.png', 2000, 7, '2018-07-07 11:19:43', '2018-07-11 14:36:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (30003001, '领券中心', '/coupon/center/detail', 2, 2, '', 3000, 1, '2018-07-10 20:02:01', '2018-07-10 20:05:30');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (30003003, '券集市', '/coupon/mall/detail', 2, 2, '', 3000, 3, '2018-07-10 20:02:45', '2018-07-10 20:05:30');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (40004001, '首页', '/employee', 2, 2, '', 4000, 1, '2018-07-11 14:56:02', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (40004002, '现场互动', '/employee', 2, 2, '', 4000, 2, '2018-07-11 14:56:15', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (40004003, '店长管理', '/employee', 2, 2, '', 4000, 3, '2018-07-11 14:57:30', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (40004004, '礼品商城', '/employee', 2, 2, '', 4000, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (50005001, '抽奖', '/activity', 2, 2, 'static/images/menu/member_icon_drawAward.png', 5000, 1, '2018-07-11 14:49:35', '2018-07-11 16:06:18');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (50005002, '首页', '/activity', 2, 2, '', 5000, 1, '2018-07-11 14:49:08', '2018-07-11 14:49:08');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (100010091001, '未使用', '/coupon/my', 2, 2, '', 10001009, 1, '2018-07-11 14:30:00', '2018-07-11 14:30:00');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (100010091002, '已使用', '/coupon/my/history', 2, 2, '', 10001009, 1, '2018-07-11 14:30:26', '2018-07-11 14:30:26');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (100010091003, '已过期', '/coupon/my/expire', 2, 2, '', 10001009, 1, '2018-07-11 14:30:44', '2018-07-11 14:30:44');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040021001, '添加质保单', '/employee/my_sales_search', 2, 2, 'static/images/menu/employee_icon_qualityPolicy.png', 40004002, 1, '2018-07-11 14:56:29', '2018-07-11 16:07:39');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040021002, '添加增值计划', '/appreciation/add', 2, 2, 'static/images/menu/employee_icon_appreciation.png', 40004002, 2, '2018-07-11 14:56:47', '2018-07-11 16:07:53');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040021003, '我的销售', '/employee/my_sales', 2, 2, 'static/images/menu/employee_icon_myMarket.png', 40004002, 3, '2018-07-11 14:57:03', '2018-07-11 16:08:10');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040031001, '员工离职', '/employee/dimission', 2, 2, 'static/images/menu/employee_icon_alterationDG.png', 40004003, 1, '2018-07-11 14:57:50', '2018-07-11 16:08:22');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040031002, '员工注册', '/employee/guide_register', 2, 2, 'static/images/menu/employee_icon_employeeRegister.png', 40004003, 1, '2018-07-11 14:58:14', '2018-07-11 16:08:52');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040031003, '联盟商家注册', '/employee/partner/add', 2, 2, 'static/images/menu/employee_icon_IPCRegister.png', 40004003, 1, '2018-07-11 14:58:14', '2018-07-11 16:08:52');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040041001, '快速提货', '/employee/gift_store', 2, 2, 'static/images/menu/employee_icon_kstihuo.png', 40004004, 1, '2018-07-11 14:58:59', '2018-07-11 16:09:13');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040041002, '扫码提货', '/employee', 2, 2, 'static/images/menu/employee_icon_smtihuo.png', 40004004, 1, '2018-07-11 14:59:13', '2018-07-11 16:09:03');/**
功能初始化  桌面端
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456500742547705856, '运维管理', '/operation', 1, 1, 'el-icon-mall-server_05', 0, 1, '2018-06-13 16:51:00', '2018-06-29 17:23:43');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456500982487060480, '商家管理', '/merchant', 1, 1, 'el-icon-mall-shangjiaguanli', 0, 5, '2018-06-13 16:51:57', '2018-06-29 17:23:43');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456501286725095424, '专题与页面', '/special', 1, 1, 'el-icon-mall-zhuanti', 0, 8, '2018-06-13 16:53:09', '2018-06-29 17:23:43');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456501340840005632, '营销应用', '/marketing', 1, 1, 'el-icon-mall-yingxiao', 0, 9, '2018-06-13 16:53:22', '2018-07-06 11:14:41');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456501927287590912, '礼品管理', '/gift_store', 1, 1, 'el-icon-mall-lipin', 0, 11, '2018-06-13 16:55:42', '2018-06-29 17:23:43');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456502102538194944, '线下数据', '/offline_data', 1, 1, 'el-icon-mall-tongji', 0, 6, '2018-06-13 16:56:24', '2018-06-29 17:23:43');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456773372207042560, '客户管理', '/operation/company', 1, 2, '', 456500742547705856, 1, '2018-06-14 10:54:19', '2018-06-28 20:06:07');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456773531242467328, '微信', '/platform_manage/weixin', 1, 2, '', 456500742547705856, 3, '2018-06-14 10:54:57', '2018-07-08 17:11:33');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456773764085059584, '模板', '/operation/wx/template', 1, 2, '', 456773531242467328, 2, '2018-06-14 10:55:53', '2018-07-15 09:19:10');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456773924684959744, '已发送', '/operation/wx/send', 1, 2, '', 456773531242467328, 1, '2018-06-14 10:56:31', '2018-07-15 09:19:10');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456774098656301056, '短信', '/operation/sms/sign_name', 1, 2, '', 456500742547705856, 2, '2018-06-14 10:57:13', '2018-07-08 17:11:46');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456774194626170880, '账户', '/operation/sms/account', 1, 2, '', 456774098656301056, 1, '2018-06-14 10:57:35', '2018-07-15 09:18:20');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456774293263618048, '模板', '/operation/sms/template', 1, 2, '', 456774098656301056, 2, '2018-06-14 10:57:59', '2018-07-15 09:18:20');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456774567701123072, '发送记录', '/operation/history/sms', 1, 2, '', 456774098656301056, 3, '2018-06-14 10:59:04', '2018-07-15 09:20:12');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456774617047109632, '发送记录', '/operation/history/wx', 1, 2, '', 456773531242467328, 3, '2018-06-14 10:59:16', '2018-07-15 09:20:04');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456774917300555776, '服务号参数', '/merchant/service_number_parameter', 1, 2, '', 456500982487060480, 1, '2018-06-14 11:00:28', '2018-07-14 19:48:42');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456775137400852480, '微信菜单', '/merchant/menu', 1, 2, '', 456500982487060480, 2, '2018-06-14 11:01:20', '2018-07-14 19:48:42');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456775205096919040, '门店', '/merchant/store', 1, 2, '', 456500982487060480, 4, '2018-06-14 11:01:36', '2018-07-14 19:48:42');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456775253490798592, '员工', '/merchant/employee', 1, 2, '', 456500982487060480, 3, '2018-06-14 11:01:48', '2018-07-14 19:48:42');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776041529217024, '专题管理', '/special/subject', 1, 2, '', 456501286725095424, 1, '2018-06-14 11:04:56', '2018-07-07 17:28:20');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776123343310848, '商城首页', '/special/edit_mall', 1, 2, '', 456501286725095424, 3, '2018-06-14 11:05:15', '2018-07-04 15:01:19');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776214280015872, '礼品首页', '/special/edit_gift_store', 1, 2, '', 456501286725095424, 4, '2018-06-14 11:05:37', '2018-07-04 15:01:24');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776281212719104, '会员中心', '/special/edit_member', 1, 2, '', 456501286725095424, 5, '2018-06-14 11:05:53', '2018-07-04 15:01:30');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776370471702528, '增值计划', '/marketing/appreciation', 1, 2, '', 456501340840005632, 2, '2018-06-14 11:06:14', '2018-07-02 15:32:55');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776654958759936, '抽奖', '/marketing/lottery', 1, 2, '', 456501340840005632, 1, '2018-06-14 11:07:22', '2018-07-13 21:33:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776836307881984, '领券中心', '/marketing/coupon/center', 1, 2, '', 456501340840005632, 2, '2018-06-14 11:08:05', '2018-07-14 17:43:18');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456776959213572096, '券集市', '/marketing/coupon/mall', 1, 2, '', 456501340840005632, 1, '2018-06-14 11:08:35', '2018-06-26 18:40:09');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777068936564736, '礼品档案', '/gift_store/product', 1, 2, '', 456501927287590912, 1, '2018-06-14 11:09:01', '2018-06-26 17:28:33');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777140973735936, '联盟商家', '/gift_store/partner', 1, 2, '', 456501927287590912, 2, '2018-06-14 11:09:18', '2018-07-02 11:08:41');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777213631664128, '订单', '/gift_store/indent', 1, 2, '', 456501927287590912, 3, '2018-06-14 11:09:35', '2018-06-26 17:28:33');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777447669633024, '部门', '/offline_data/department', 1, 2, '', 456502102538194944, 1, '2018-06-14 11:10:31', '2018-06-21 11:42:08');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777500740161536, '员工', '/offline_data/employee', 1, 2, '', 456502102538194944, 2, '2018-06-14 11:10:44', '2018-06-21 11:40:02');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777612006658048, '销售', '/offline_data/market', 1, 2, '', 456502102538194944, 3, '2018-06-14 11:11:10', '2018-06-21 11:40:02');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777740671127552, '积分', '/offline_data/integral', 1, 2, '', 456502102538194944, 4, '2018-06-14 11:11:41', '2018-06-21 11:40:02');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777790402990080, '看货盘', '/offline_data/pallet', 1, 2, '', 456502102538194944, 5, '2018-06-14 11:11:53', '2018-06-21 11:40:02');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (456777840029995008, '线下会员', '/offline_data/erp_member', 1, 2, '', 456502102538194944, 7, '2018-06-14 11:12:05', '2018-06-27 16:49:57');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (461110944018337792, '平台管理', '/system', 1, 1, 'el-icon-mall-server_05', 0, 2, '2018-06-26 10:10:16', '2018-06-29 17:23:43');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (461112885414858752, '帐号管理', '/system/account', 1, 2, '', 461110944018337792, 1, '2018-06-26 10:17:59', '2018-06-26 10:17:59');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (461568786550624256, '账号', '/merchant/account', 1, 2, '', 456500982487060480, 5, '2018-06-27 16:29:34', '2018-07-15 09:24:41');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (462713998572392448, '服务号管理', '/merchant/wx_service', 1, 2, '', 456500982487060480, 6, '2018-06-30 20:20:14', '2018-07-14 22:03:18');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (463295408647573504, '礼品档案', '/gift_store/unit/product', 1, 2, '', 456501927287590912, 1, '2018-07-02 10:50:33', '2018-07-16 10:36:23');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (464083165942779904, '平台首页', '/special/edit_home', 1, 2, '', 456501286725095424, 2, '2018-07-04 15:00:49', '2018-07-04 15:01:11');
**
角色功能初始化
 */
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (462716055962390528, 183257370250715136, 461112885414858752, '2018-06-30 20:28:25', '2018-06-30 20:28:25');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (462716055979167744, 183257370250715136, 461110944018337792, '2018-06-30 20:28:25', '2018-06-30 20:28:25');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600711643136, 183259005916028928, 466618676674695168, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600728420352, 183259005916028928, 466614245669343232, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600741003264, 183259005916028928, 466618731708157952, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600753586176, 183259005916028928, 466618789891543040, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600761974784, 183259005916028928, 466618867716853760, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600774557696, 183259005916028928, 466618932472713216, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600787140608, 183259005916028928, 466619323352485888, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600816500736, 183259005916028928, 466619419792117760, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637600850055168, 183259005916028928, 466619478805975040, '2018-07-11 16:11:14', '2018-07-11 16:11:14');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637658374934528, 183259029018255360, 466619045442097152, '2018-07-11 16:11:27', '2018-07-11 16:11:27');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637658391711744, 183259029018255360, 466614245669343232, '2018-07-11 16:11:27', '2018-07-11 16:11:27');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637658404294656, 183259029018255360, 466619131341443072, '2018-07-11 16:11:27', '2018-07-11 16:11:27');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (466637658421071872, 183259029018255360, 466619229081309184, '2018-07-11 16:11:27', '2018-07-11 16:11:27');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230405251072, 183258332713459712, 456500742547705856, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230422028288, 183258332713459712, 456773372207042560, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230438805504, 183258332713459712, 456774098656301056, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230451388416, 183258332713459712, 456774194626170880, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230468165632, 183258332713459712, 456774293263618048, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230484942848, 183258332713459712, 456774567701123072, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230497525760, 183258332713459712, 456773531242467328, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230514302976, 183258332713459712, 456773924684959744, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230526885888, 183258332713459712, 456773764085059584, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230543663104, 183258332713459712, 456774617047109632, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230560440320, 183258332713459712, 456502102538194944, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230573023232, 183258332713459712, 456777447669633024, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230589800448, 183258332713459712, 456777500740161536, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230602383360, 183258332713459712, 456777612006658048, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230619160576, 183258332713459712, 456777740671127552, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230635937792, 183258332713459712, 456777790402990080, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191230648520704, 183258332713459712, 456777840029995008, '2018-07-15 23:04:48', '2018-07-15 23:04:48');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372445356032, 183259005916028928, 40004002, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372462133248, 183259005916028928, 4000, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372478910464, 183259005916028928, 400040021001, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372495687680, 183259005916028928, 400040021002, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372512464896, 183259005916028928, 400040021003, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372529242112, 183259005916028928, 40004004, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372550213632, 183259005916028928, 400040041001, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191372562796544, 183259005916028928, 400040041002, '2018-07-15 23:05:22', '2018-07-15 23:05:22');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584207376384, 183258583545421824, 456774917300555776, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584224153600, 183258583545421824, 456500982487060480, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584236736512, 183258583545421824, 456775137400852480, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584253513728, 183258583545421824, 456775253490798592, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584270290944, 183258583545421824, 456775205096919040, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584337399808, 183258583545421824, 461568786550624256, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584354177024, 183258583545421824, 456501286725095424, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584370954240, 183258583545421824, 456776041529217024, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584383537152, 183258583545421824, 464083165942779904, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584400314368, 183258583545421824, 456776123343310848, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584417091584, 183258583545421824, 456776214280015872, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584433868800, 183258583545421824, 456776281212719104, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584450646016, 183258583545421824, 456501340840005632, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584467423232, 183258583545421824, 456776959213572096, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584480006144, 183258583545421824, 456776654958759936, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584496783360, 183258583545421824, 456776370471702528, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584513560576, 183258583545421824, 456776836307881984, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584530337792, 183258583545421824, 456777068936564736, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584542920704, 183258583545421824, 456501927287590912, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584559697920, 183258583545421824, 456777140973735936, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468191584576475136, 183258583545421824, 456777213631664128, '2018-07-15 23:06:12', '2018-07-15 23:06:12');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348534620160, 183258467749076992, 462713998572392448, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348551397376, 183258467749076992, 456500982487060480, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348568174592, 183258467749076992, 456502102538194944, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348580757504, 183258467749076992, 456777447669633024, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348597534720, 183258467749076992, 456777500740161536, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348610117632, 183258467749076992, 456777612006658048, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348626894848, 183258467749076992, 456777740671127552, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348639477760, 183258467749076992, 456777790402990080, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348656254976, 183258467749076992, 456777840029995008, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348673032192, 183258467749076992, 463295408647573504, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348685615104, 183258467749076992, 456501927287590912, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (468365348702392320, 183258467749076992, 456777213631664128, '2018-07-16 10:36:41', '2018-07-16 10:36:41');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572277960704, 464095291973439488, 456774917300555776, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572294737920, 464095291973439488, 456500982487060480, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572307320832, 464095291973439488, 456775137400852480, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572324098048, 464095291973439488, 456775253490798592, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572336680960, 464095291973439488, 456775205096919040, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572353458176, 464095291973439488, 456502102538194944, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572366041088, 464095291973439488, 456777447669633024, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572382818304, 464095291973439488, 456777500740161536, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572395401216, 464095291973439488, 456777612006658048, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572412178432, 464095291973439488, 456777740671127552, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572424761344, 464095291973439488, 456777790402990080, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572441538560, 464095291973439488, 456777840029995008, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572454121472, 464095291973439488, 463295408647573504, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469110572470898688, 464095291973439488, 456501927287590912, '2018-07-18 11:57:56', '2018-07-18 11:57:56');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318840672256, 464096328360792064, 456774917300555776, '2018-07-18 12:04:52', '2018-07-18 12:04:52');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318857449472, 464096328360792064, 456500982487060480, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318870032384, 464096328360792064, 456775137400852480, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318886809600, 464096328360792064, 456775253490798592, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318899392512, 464096328360792064, 456775205096919040, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318916169728, 464096328360792064, 456501286725095424, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318932946944, 464096328360792064, 456776041529217024, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318945529856, 464096328360792064, 464083165942779904, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318962307072, 464096328360792064, 456776123343310848, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318974889984, 464096328360792064, 456776214280015872, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112318991667200, 464096328360792064, 456776281212719104, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319004250112, 464096328360792064, 456501340840005632, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319021027328, 464096328360792064, 456776959213572096, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319037804544, 464096328360792064, 456776654958759936, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319050387456, 464096328360792064, 456776370471702528, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319067164672, 464096328360792064, 456776836307881984, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319079747584, 464096328360792064, 456777068936564736, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319096524800, 464096328360792064, 456501927287590912, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319109107712, 464096328360792064, 456777140973735936, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112319125884928, 464096328360792064, 456777213631664128, '2018-07-18 12:04:53', '2018-07-18 12:04:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112387555954688, 183259029018255360, 40004003, '2018-07-18 12:05:09', '2018-07-18 12:05:09');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112387568537600, 183259029018255360, 4000, '2018-07-18 12:05:09', '2018-07-18 12:05:09');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112387585314816, 183259029018255360, 400040031001, '2018-07-18 12:05:09', '2018-07-18 12:05:09');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112387602092032, 183259029018255360, 400040031002, '2018-07-18 12:05:09', '2018-07-18 12:05:09');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (469112387614674944, 183259029018255360, 400040031003, '2018-07-18 12:05:09', '2018-07-18 12:05:09');

/**
添加员工任务相关功能
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (40004005, '任务', '/employee', 2, 2, '', 4000, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040051001, '纪念日回访', '/employee/task/anniversary', 2, 2, 'static/images/menu/employee_icon_commemoration.png', 40004005, 1, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040051002, '生日回访', '/employee/task/birthday', 2, 2, 'static/images/menu/employee_icon_birthday.png', 40004005, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040051003, '第一次销售回访', '/employee/task/first', 2, 2, 'static/images/menu/employee_icon_marketHF1.png', 40004005, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040051004, '第二次销售回访', '/employee/task/second', 2, 2, 'static/images/menu/employee_icon_marketHF2.png', 40004005, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040051005, '第三次销售回访', '/employee/task/third', 2, 2, 'static/images/menu/employee_icon_marketHF3.png', 40004005, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040051006, '门店销售评价', '/employee/task/sale_comment', 2, 2, 'static/images/menu/employee_icon_marketComment.png', 40004005, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');


/**
导购角色添加会员分配功能
 */
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (474585385943568384, 183259005916028928, 400040051001, '2018-08-02 14:32:53', '2018-08-02 14:32:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (474585385956151296, 183259005916028928, 400040051002, '2018-08-02 14:32:53', '2018-08-02 14:32:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (474585385964539904, 183259005916028928, 400040051003, '2018-08-02 14:32:53', '2018-08-02 14:32:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (474585385972928512, 183259005916028928, 400040051004, '2018-08-02 14:32:53', '2018-08-02 14:32:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (474585385985511424, 183259005916028928, 400040051005, '2018-08-02 14:32:53', '2018-08-02 14:32:53');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (474585385993900032, 183259005916028928, 400040051006, '2018-08-02 14:32:53', '2018-08-02 14:32:53');

/*删除短信签名模块*/
delete from authorization_service.func where id=456774384166768640;

/*系统管理员用户id修改*/
update user_role set user_id=20180715 where id=183260035114344448;
update user_login_info set user_id=20180715 where id=183259332664893440;

-- 已执行
use `tenant`;
alter table erp_sales_detail modify column sales_index int;
desc erp_sales_detail;


-- 已执行
use authorization_service;
/**
添加员工信息相关功能
 */
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (40004006, '员工信息', '/employee', 2, 2, '', 4000, 4, '2018-07-11 14:58:36', '2018-07-11 14:58:40');
INSERT INTO authorization_service.func (id, func_name, func_path, func_app, func_type, logo_url, parent_id, func_index, create_time, update_time) VALUES (400040061001, '我的会员', '/employee/custom', 2, 2, 'static/images/menu/employee_icon_commemoration.png', 40004006, 1, '2018-07-11 14:58:36', '2018-07-11 14:58:40');


/*导购角色添加员工信息功能权限*/
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477116487249825792, 183259005916028928, 40004006, '2018-08-09 14:10:35', '2018-08-09 14:10:35');
INSERT INTO authorization_service.role_func (id, role_id, func_id, create_time, update_time) VALUES (477116487258214400, 183259005916028928, 400040061001, '2018-08-09 14:10:35', '2018-08-09 14:10:35');

-- 已执行
use user_service;
UPDATE user_service.user SET plat_openid = plat_unionid WHERE plat_unionid = 'system';
ALTER TABLE user_service.user
  DROP KEY uk_unionid,
  MODIFY COLUMN plat_unionid VARCHAR(64) COMMENT '平台unionid',
  MODIFY COLUMN plat_openid VARCHAR(64) NOT NULL UNIQUE COMMENT '平台openid';

-- 已执行
use wx_gateway;
INSERT INTO wx_gateway.wx_sys_template
VALUES (11, 'OPENTM202194461', 'IT科技 - IT软件与服务', '', '{{first.DATA}}
预约内容：{{keyword1.DATA}}
预约时间：{{keyword2.DATA}}
{{remark.DATA}}', '预约到期提醒', '', 1, now(), now());

INSERT INTO wx_gateway.wx_sys_template
VALUES (12, 'OPENTM410037016', 'IT科技 - IT软件与服务', '', '{{first.DATA}}
任务名称：{{keyword1.DATA}}
任务结果：{{keyword2.DATA}}
完成时间：{{keyword3.DATA}}
{{remark.DATA}}', '任务完成通知', '', 1, now(), now());

ALTER TABLE wx_gateway.wx_user
  MODIFY COLUMN union_id VARCHAR(128);
  
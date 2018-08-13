
USE authorization_service;
/**
角色添加字段 修改默认值  liuyu
 */
alter table role add role_app tinyint DEFAULT 1  COMMENT '1桌面端 2手机端';
update role set role_app=2 where id in(183259005916028928,183259029018255360);

-- liuyu
USE user_service;
DROP TABLE IF EXISTS user_employee;
CREATE TABLE user_employee
(
  id                  BIGINT NOT NULL COMMENT 'id',
  tenant_id           BIGINT NOT NULL COMMENT '租户id',
  tenant_wechatapp_id BIGINT NOT NULL COMMENT '服务号',
  user_id             BIGINT NOT NULL COMMENT '用户id',
  employee_user_id    BIGINT NOT NULL COMMENT '员工用户表id',
  employee_erp_id     BIGINT NOT NULL COMMENT '线下员工id',
  create_time         DATETIME COMMENT '创建时间',
  update_time         DATETIME COMMENT '更新时间',
  PRIMARY KEY (id),
  UNIQUE uk_app_user(tenant_wechatapp_id, user_id),
  INDEX idx_app_employee(tenant_wechatapp_id, employee_user_id)
) COMMENT '会员所属员工' CHARACTER SET utf8mb4;

INSERT INTO user_employee (id, tenant_id, tenant_wechatapp_id, user_id, employee_user_id, employee_erp_id, create_time, update_time)
  SELECT
    tu.id, tu.tenant_id, tu.tenant_app_id, tu.user_id, eu.id, em.employee_erp_id, now(), now()
  FROM user_service.tenant_user tu
    JOIN user_service.erp_member em
      ON tu.tenant_app_id = em.tenant_wechatapp_id AND tu.erp_member_id = em.member_erp_id
    JOIN tenant.employee_user eu
      ON eu.tenant_wechatapp_id = em.tenant_wechatapp_id AND eu.employee_erp_id = em.employee_erp_id
  WHERE em.employee_erp_id != 0 AND NOT exists(SELECT id
                                               FROM user_employee ue WHERE
                                                 ue.tenant_wechatapp_id = tu.tenant_app_id AND ue.user_id = tu.user_id);

-- heyy
ALTER TABLE user_service.tenant_user
  ADD COLUMN bind_time DATETIME AFTER interest;

UPDATE user_service.tenant_user SET bind_time = create_time WHERE mobile_no IS NOT NULL;                                                 


use user_service;
DROP TABLE IF EXISTS user_source;
CREATE TABLE user_source
(
  id                  BIGINT NOT NULL COMMENT 'id',
  tenant_id           BIGINT NOT NULL COMMENT '租户id',
  tenant_wechatapp_id BIGINT NOT NULL COMMENT '服务号',
  user_id             BIGINT NOT NULL COMMENT '用户id',
  from_id             BIGINT  COMMENT '来源id，例如门店id、员工id',
  busi_url            VARCHAR(128)     COMMENT '业务地址',
  source_type         VARCHAR(20) NOT NULL COMMENT '来源类型',
  UNIQUE uk_app_user(tenant_wechatapp_id,user_id),
  PRIMARY KEY (id)
) COMMENT '会员来源'CHARACTER SET utf8mb4;

USE  gift_mail;
ALTER TABLE partner ADD qrcode_image_url VARCHAR(512) NULL COMMENT '二维码';

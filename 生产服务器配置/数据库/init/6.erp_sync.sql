USE erp_sync;

DROP TABLE IF EXISTS synch_retries;
-- auto-generated definition
CREATE TABLE synch_retries (
  id       BIGINT AUTO_INCREMENT COMMENT '重试数据记录id' PRIMARY KEY,
  data     VARCHAR(4000) COMMENT '重试同步数据',
  put_time DATETIME COMMENT '发起同步时间',
  retries  INT    DEFAULT '0' COMMENT '重试次数',
  origin   INT    DEFAULT '0' COMMENT '数据来源，0：同步程序，1：同步程序同步队列，2：业务程序同步队列'
) COMMENT '同步重试记录表' CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS synch_log;
-- auto-generated definition
CREATE TABLE synch_log (
  id            BIGINT NOT NULL COMMENT '唯一编号，由业务传入' PRIMARY KEY,
  data          VARCHAR(4000) COMMENT '同步数据',
  synch_time    DATETIME COMMENT '同步成功时间',
  tenant_app_id BIGINT NULL
  COMMENT '租户公众号ID',
  tenant_id     BIGINT NULL
  COMMENT '租户id'
) COMMENT '同步日志表，记录同步的数据，防止重复同步' CHARACTER SET utf8mb4;

CREATE INDEX synch_log_tenant_id_tenant_app_id_index
  ON synch_log (tenant_id, tenant_app_id);

ALTER TABLE synch_log
  MODIFY synch_time DATETIME COMMENT '同步成功时间'; 
  
CREATE TABLE retry_data (
  id            BIGINT PRIMARY KEY,
  business_type VARCHAR(128),
  tenant_id     BIGINT,
  tenant_app_id BIGINT,
  user_id       BIGINT,
  erp_member_id BIGINT,
  data          TEXT,
  retry_times   INTEGER UNSIGNED,
  create_time   DATETIME
) COMMENT '重试数据表' DEFAULT CHARSET utf8mb4;

ALTER TABLE retry_data
  ADD COLUMN operation_type VARCHAR(16) AFTER business_type,
  ADD COLUMN need_erp_member_id TINYINT UNSIGNED AFTER erp_member_id;  
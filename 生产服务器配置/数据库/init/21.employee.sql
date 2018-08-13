use `employee`;
/*==============================================================*/
/* Table: backlog                                      */
/*==============================================================*/
DROP TABLE IF EXISTS employee.backlog;
CREATE TABLE employee.backlog (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT      NOT NULL,
  tenant_app_id BIGINT      NOT NULL,
  user_id       BIGINT      NOT null ,
  status               varchar(32) not null comment '开始start,完成finished,逾期中止,expire_stopped,主动中止stopped',
  scene                varchar(32) not null comment '生日待办birthday,纪念日memorial_day,评价回评sales_comment,销售第一次回访sales_first_call,销售第二次回访sales_second_call,销售第三次回访sales_third_call',
  data                 json comment '数据',
  expire_time          datetime comment '过期时间',
  create_time          datetime comment '创建时间',
  update_time          datetime comment '最后修改时间',
  UNIQUE KEY uk_all (tenant_id,tenant_app_id,user_id,status,scene)
) COMMENT '员工待办' DEFAULT CHARACTER SET utf8mb4;

/*==============================================================*/
/* Table: backlog_detail                               */
/*==============================================================*/
DROP TABLE IF EXISTS employee.backlog_detail;
CREATE TABLE employee.backlog_detail (
  id            BIGINT PRIMARY KEY,
  backlog_id           bigint not null comment '待办id',
  content              varchar(2048) not null comment '日志',
  create_time          datetime comment '创建时间',
  update_time          datetime comment '最后修改时间'
) COMMENT '员工待办明细' DEFAULT CHARACTER SET utf8mb4;

/*==============================================================*/
/* Table: backlog_statistics                                */
/*==============================================================*/
DROP TABLE IF EXISTS employee.backlog_statistics ;
CREATE TABLE employee.backlog_statistics (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT      NOT NULL,
  tenant_app_id BIGINT      NOT NULL,
  user_id       BIGINT      NOT null ,
  scene                varchar(32) not null comment '生日待办birthday,纪念日memorial_day,评价回评sales_comment,销售第一次回访sales_first_call,销售第二次回访sales_second_call,销售第三次回访sales_third_call',
  record        int  comment '当前场景下当前用户待办任务统计',
  create_time          datetime comment '创建时间',
  update_time          datetime comment '最后修改时间'
) COMMENT '员工待办任务统计' DEFAULT CHARACTER SET utf8mb4;

/*==============================================================*/
/* Table: backlog_setting                               */
/*==============================================================*/
DROP TABLE IF EXISTS employee.backlog_setting;
CREATE TABLE employee.backlog_setting (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT      NOT NULL,
  tenant_app_id BIGINT      NOT NULL,
  scene                varchar(32) not null comment '生日待办birthday,纪念日memorial_day,评价回评sales_comment,销售第一次回访sales_first_call,销售第二次回访sales_second_call,销售第三次回访sales_third_call',
  advance_day          int not null comment '提前天数',
  expire_day           int not null comment '期满天数',
  talk_count           int default 0 comment '话术数',
  status               bit  default 0 not null comment '设置状态，默认是0禁用,1启用',
  create_time          datetime comment '创建时间',
  update_time          datetime comment '最后修改时间',
  UNIQUE KEY uk_all (tenant_id,tenant_app_id,scene)
) COMMENT '员工待办设置' DEFAULT CHARACTER SET utf8mb4;

/*==============================================================*/
/* Table: backlog_talk                               */
/*==============================================================*/
DROP TABLE IF EXISTS employee.backlog_talk;
CREATE TABLE employee.backlog_talk (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT      NOT NULL,
  tenant_app_id BIGINT      NOT NULL,
  scene                varchar(32) not null comment '生日待办birthday,纪念日memorial_day,评价回评sales_comment,销售第一次回访sales_first_call,销售第二次回访sales_second_call,销售第三次回访sales_third_call',
  talk                 varchar(2048) not null comment '话术',
  create_time          datetime comment '创建时间',
  update_time          datetime comment '最后修改时间'
) COMMENT '员工待办话术' DEFAULT CHARACTER SET utf8mb4;
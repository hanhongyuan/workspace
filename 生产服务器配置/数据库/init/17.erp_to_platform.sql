USE erp_to_platform;
CREATE TABLE erp_department
(
  id          BIGINT                 NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id   BIGINT                 NOT NULL
  COMMENT '客户单位id',
  dept_name   VARCHAR(32)            NOT NULL
  COMMENT '部门名称',
  dept_erp_id BIGINT                 NOT NULL
  COMMENT '部门erpid',
  is_disable  TINYINT(1) DEFAULT '0' NULL
  COMMENT '是否停用',
  create_time DATETIME               NULL
  COMMENT '创建时间',
  update_time DATETIME               NULL
  COMMENT '最后修改时间',
  CONSTRAINT erp_department_tenant_id_dept_erp_id_uindex
  UNIQUE (tenant_id, dept_erp_id)
)
  COMMENT '部门'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_employee
(
  id              BIGINT                 NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id       BIGINT                 NOT NULL
  COMMENT '客户单位id',
  employee_erp_id BIGINT                 NOT NULL
  COMMENT '员工erpid',
  employee_name   VARCHAR(32)            NOT NULL
  COMMENT '员工名称',
  employee_jobno  VARCHAR(16)            NULL
  COMMENT '员工工号',
  mobile_no       VARCHAR(16)            NOT NULL
  COMMENT '手机号码',
  sex             VARCHAR(2)             NULL
  COMMENT '性别',
  employee_type   VARCHAR(20)            NULL
  COMMENT '员工类型',
  dept_erp_id     BIGINT                 NOT NULL
  COMMENT '所属部门erpid',
  is_disable      TINYINT(1) DEFAULT '0' NULL
  COMMENT '是否停用',
  create_time     DATETIME               NULL
  COMMENT '创建时间',
  update_time     DATETIME               NULL
  COMMENT '最后修改时间',
  CONSTRAINT erp_employee_tenant_id_employee_erp_id_uindex
  UNIQUE (tenant_id, employee_erp_id),
  CONSTRAINT erp_employee_tenant_id_mobile_no_uindex
  UNIQUE (tenant_id, mobile_no)
)
  COMMENT '员工'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_integral_log
(
  id                  BIGINT                 NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id           BIGINT                 NOT NULL
  COMMENT '客户单位id',
  tenant_wechatapp_id BIGINT                 NOT NULL
  COMMENT '服务号Id',
  integral_erp_id     BIGINT                 NULL
  COMMENT '积分异动erpid',
  member_erp_id       BIGINT                 NOT NULL
  COMMENT '会员erpid',
  note_erp_id         BIGINT                 NULL
  COMMENT '单据id',
  remark              VARCHAR(256)           NULL
  COMMENT '异动说明',
  integral            DECIMAL(10, 2)         NULL
  COMMENT '积分值',
  is_disable          TINYINT(1) DEFAULT '0' NULL
  COMMENT '是否停用',
  create_time         DATETIME               NULL
  COMMENT '创建时间',
  update_time         DATETIME               NULL
  COMMENT '最后修改时间',
  CONSTRAINT id_uindex
  UNIQUE (tenant_wechatapp_id, integral_erp_id, member_erp_id, note_erp_id)
)
  COMMENT '积分异动记录'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_member
(
  id                   BIGINT                        NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id            BIGINT                        NOT NULL
  COMMENT '客户单位id',
  tenant_wechatapp_id  BIGINT                        NOT NULL
  COMMENT '服务号id',
  member_erp_id        BIGINT                        NOT NULL
  COMMENT '会员erpid',
  employee_erp_id      BIGINT                        NULL
  COMMENT '所属员工id',
  grade_erp_id         BIGINT                        NULL
  COMMENT '会员级别id',
  card_no              VARCHAR(32)                   NULL
  COMMENT '会员卡号',
  dept_erp_id          BIGINT                        NOT NULL
  COMMENT '部门erpid',
  mobile_no            VARCHAR(16)                   NOT NULL
  COMMENT '手机号码',
  consumption_integral DECIMAL(10, 2) DEFAULT '0.00' NOT NULL
  COMMENT '累计消费积分',
  user_name            VARCHAR(64)                   NULL
  COMMENT '用户名称',
  create_time          DATETIME                      NULL
  COMMENT '创建时间',
  update_time          DATETIME                      NULL
  COMMENT '最后修改时间',
  CONSTRAINT erp_member_tenant_id_member_erp_id_uindex
  UNIQUE (tenant_id, member_erp_id),
  CONSTRAINT erp_member_tenant_wechatapp_id_mobile_no_uindex
  UNIQUE (tenant_wechatapp_id, mobile_no)
)
  COMMENT '会员'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_member_grade
(
  id           BIGINT      NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id    BIGINT      NOT NULL
  COMMENT '客户单位id',
  grade_erp_id BIGINT      NOT NULL
  COMMENT '会员级别erpid',
  grade_name   VARCHAR(32) NOT NULL
  COMMENT '会员级别名称',
  create_time  DATETIME    NULL
  COMMENT '创建时间',
  update_time  DATETIME    NULL
  COMMENT '最后修改时间',
  CONSTRAINT erp_member_grade_tenant_id_grade_erp_id_uindex
  UNIQUE (tenant_id, grade_erp_id)
)
  COMMENT '会员级别档案'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_member_info
(
  id                   BIGINT                        NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id            BIGINT                        NOT NULL
  COMMENT '商户id',
  tenant_wechatapp_id  BIGINT                        NOT NULL
  COMMENT '服务号id',
  erp_member_id        BIGINT                        NOT NULL
  COMMENT '会员id',
  mobile_no            VARCHAR(16)                   NOT NULL
  COMMENT '手机号码',
  user_name            VARCHAR(32)                   NOT NULL
  COMMENT '姓名',
  sex                  VARCHAR(8)                    NULL
  COMMENT '性别',
  birthday             VARCHAR(20)                   NULL
  COMMENT '生日',
  birthday_is_lunar    TINYINT(1)                    NULL
  COMMENT '生日是否农历',
  home_address         VARCHAR(128)                  NULL
  COMMENT '家庭住址',
  memorialday          VARCHAR(20)                   NULL
  COMMENT '纪念日',
  memorialday_name     VARCHAR(16)                   NULL
  COMMENT '纪念日名称',
  memorialday_is_lunar TINYINT(1)                    NULL
  COMMENT '纪念日是否农历',
  interested           VARCHAR(16)                   NULL
  COMMENT '感兴趣的',
  amount               DECIMAL(10, 2) DEFAULT '0.00' NULL
  COMMENT '累计消息金额',
  create_time          DATETIME                      NULL
  COMMENT '创建时间',
  update_time          DATETIME                      NULL
  COMMENT '最后修改时间',
  CONSTRAINT erp_member_info_tenant_id_erp_member_id_uindex
  UNIQUE (tenant_id, erp_member_id),
  CONSTRAINT erp_member_info_tenant_wechatapp_id_mobile_no_uindex
  UNIQUE (tenant_wechatapp_id, mobile_no)
)
  COMMENT '会员信息'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_pallet
(
  id            BIGINT                 NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id     BIGINT                 NOT NULL
  COMMENT '客户单位id',
  dept_erp_id   BIGINT                 NOT NULL
  COMMENT '部门erpid',
  pallet_erp_id BIGINT                 NOT NULL
  COMMENT '看货盘erpid',
  pallet_no     VARCHAR(20)            NOT NULL
  COMMENT '看货盘编号',
  is_disable    TINYINT(1) DEFAULT '0' NULL
  COMMENT '是否停用',
  create_time   DATETIME               NULL
  COMMENT '创建时间',
  update_time   DATETIME               NULL
  COMMENT '最后修改时间',
  CONSTRAINT erp_pallet_tenant_id_pallet_erp_id_uindex
  UNIQUE (tenant_id, pallet_erp_id)
)
  COMMENT '看货盘'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_pallet_product
(
  id                    BIGINT      NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id             BIGINT      NOT NULL
  COMMENT '客户单位id',
  pallet_product_erp_id BIGINT      NULL
  COMMENT '记录erpid',
  pallet_erp_id         BIGINT      NOT NULL
  COMMENT '看货盘erpid',
  product_erp_id        BIGINT      NOT NULL
  COMMENT '产品id',
  product_barcode       VARCHAR(32) NOT NULL
  COMMENT '产品条码',
  product_name          VARCHAR(64) NOT NULL
  COMMENT '产品名称',
  stone_weight          VARCHAR(16) NULL
  COMMENT '石重',
  gold_weight           VARCHAR(16) NULL
  COMMENT '金重',
  total_weight          VARCHAR(16) NULL
  COMMENT '总重',
  remark                VARCHAR(64) NULL
  COMMENT '其它备注信息',
  tag_price             DECIMAL     NOT NULL
  COMMENT '上柜价',
  create_time           DATETIME    NULL
  COMMENT '创建时间',
  update_time           DATETIME    NULL
  COMMENT '最后修改时间',
  CONSTRAINT tenant_id_pallet_product_erp_id
  UNIQUE (tenant_id, pallet_product_erp_id)
)
  COMMENT '看货盘看货记录'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_product_category
(
  id              BIGINT                 NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id       BIGINT                 NOT NULL
  COMMENT '客户单位id',
  category_name   VARCHAR(16)            NOT NULL
  COMMENT '产品分类名称',
  category_erp_id BIGINT                 NOT NULL
  COMMENT '产品分类erpid',
  is_disable      TINYINT(1) DEFAULT '0' NULL
  COMMENT '是否停用',
  create_time     DATETIME               NULL
  COMMENT '创建时间',
  update_time     DATETIME               NULL
  COMMENT '最后修改时间',
  CONSTRAINT uk_product_category
  UNIQUE (tenant_id, category_erp_id)
)
  COMMENT '产品分类'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_sales
(
  id                  BIGINT         NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id           BIGINT         NOT NULL
  COMMENT '客户单位id',
  tenant_wechatapp_id BIGINT         NOT NULL
  COMMENT '服务号Id',
  sales_erp_id        BIGINT         NOT NULL
  COMMENT '销售单erpid',
  sales_no            VARCHAR(32)    NOT NULL
  COMMENT '销售单单号',
  sales_date          VARCHAR(10)    NOT NULL
  COMMENT '入账日期',
  member_erp_id       BIGINT         NOT NULL
  COMMENT '会员erpid',
  employee_erp_id     BIGINT         NOT NULL
  COMMENT '导购erpid',
  employee_name       VARCHAR(32)    NOT NULL
  COMMENT '导购名称',
  dept_erp_id         BIGINT         NOT NULL
  COMMENT '部门erpid',
  amount              DECIMAL(10, 2) NOT NULL
  COMMENT '实收金额',
  sales_remark        VARCHAR(256)   NULL
  COMMENT '单据备注',
  receipts            VARCHAR(128)   NULL
  COMMENT '收款信息',
  sales_status        TINYINT        NOT NULL
  COMMENT '单据状态',
  busi_date           VARCHAR(10)    NULL
  COMMENT '录入系统的日期',
  create_time         DATETIME       NULL
  COMMENT '创建时间',
  update_time         DATETIME       NULL
  COMMENT '最后修改时间',
  CONSTRAINT uk_sales
  UNIQUE (tenant_id, sales_erp_id)
)
  COMMENT '销售单主表'
  ENGINE = InnoDB
  CHARSET = utf8mb4;

CREATE TABLE erp_sales_detail
(
  id                  BIGINT         NOT NULL
  COMMENT 'id'
    PRIMARY KEY,
  tenant_id           BIGINT         NOT NULL
  COMMENT '客户单位id',
  tenant_wechatapp_id BIGINT         NOT NULL
  COMMENT '服务号Id',
  sales_erp_id        BIGINT         NOT NULL
  COMMENT '销售单erpid',
  sales_index         TINYINT        NOT NULL
  COMMENT '单内序号',
  sales_type          VARCHAR(32)    NOT NULL
  COMMENT '销售类型',
  product_barcode     VARCHAR(32)    NOT NULL
  COMMENT '产品条码',
  product_name        VARCHAR(64)    NOT NULL
  COMMENT '产品名称',
  cert_no             VARCHAR(16)    NULL
  COMMENT '证书号',
  hand_size           VARCHAR(16)    NULL
  COMMENT '手寸',
  category_erp_id     BIGINT         NOT NULL
  COMMENT '产品分类erpid',
  category_name       VARCHAR(32)    NULL
  COMMENT '产品分类名称',
  stone_weight        VARCHAR(16)    NULL
  COMMENT '石重',
  gold_weight         VARCHAR(16)    NULL
  COMMENT '金重',
  total_weight        VARCHAR(16)    NULL
  COMMENT '总重',
  quantity            DECIMAL(10, 2) NOT NULL
  COMMENT '数量',
  amount_total        DECIMAL(10, 2) NOT NULL
  COMMENT '应付金额，包括了优惠金额，积分抵现等',
  amount_pay          DECIMAL(10, 2) NOT NULL
  COMMENT '实际支付的金额，不包括优惠金额',
  integral            DECIMAL(10, 2) NULL
  COMMENT '积分',
  remark              VARCHAR(1024)  NULL
  COMMENT '其它备注信息',
  create_time         DATETIME       NULL
  COMMENT '创建时间',
  update_time         DATETIME       NULL
  COMMENT '最后修改时间',
  CONSTRAINT uk_sales_detail
  UNIQUE (tenant_id, sales_erp_id, sales_index)
)
  COMMENT '销售从表'
  ENGINE = InnoDB
  CHARSET = utf8mb4;


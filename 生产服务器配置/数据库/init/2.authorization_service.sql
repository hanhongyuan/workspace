USE authorization_service;
DROP TABLE IF EXISTS func;
CREATE TABLE func (
  id          BIGINT PRIMARY KEY NOT NULL,
  func_name   VARCHAR(32) COMMENT '功能名称',
  func_path   VARCHAR(256) COMMENT '功能路径',
  func_app    TINYINT COMMENT '1手机端，2桌面端',
  func_type   TINYINT            NOT NULL COMMENT '桌面端时：1模块，2菜单，3按钮, 手机端时：1模块，2页面，3操作',
  logo_url    VARCHAR(512) COMMENT '图标url',
  parent_id   BIGINT DEFAULT 0 COMMENT '父节点id',
  func_index  TINYINT COMMENT '序号',
  create_time DATETIME COMMENT '创建时间',
  update_time DATETIME COMMENT '最后修改时间'
  --   UNIQUE uk_func_path_parent_id(func_path, parent_id)
) COMMENT '功能即系统业务块，如商城、礼品商城等' CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS role;
CREATE TABLE role (
  id          BIGINT      NOT NULL,
  role_name   VARCHAR(32) NOT NULL COMMENT '角色名称',
  role_code   VARCHAR(32) NOT NULL COMMENT '角色代码',
  role_type   TINYINT     NOT NULL COMMENT '1平台角色,2单位角色,3服务号角色',
  role_logo   VARCHAR(512) COMMENT '角色logo',
  role_remark VARCHAR(128) COMMENT '角色说明',
  create_time DATETIME COMMENT '创建时间',
  update_time DATETIME COMMENT '最后修改时间',
  PRIMARY KEY (id),
  UNIQUE uk_role_code(role_code)
) COMMENT '角色' CHARACTER SET utf8mb4;
;

DROP TABLE IF EXISTS role_func;
CREATE TABLE role_func (
  id          BIGINT NOT NULL,
  role_id     BIGINT NOT NULL COMMENT '角色id',
  func_id     BIGINT NOT NULL COMMENT '功能id',
  create_time DATETIME COMMENT '创建时间',
  update_time DATETIME COMMENT '最后修改时间',
  PRIMARY KEY (id),
  UNIQUE uk_role_id_func_id(role_id, func_id)
) COMMENT '角色和功能的关联' CHARACTER SET utf8mb4;


DROP TABLE IF EXISTS user_role;
CREATE TABLE user_role (
  id                  BIGINT NOT NULL COMMENT 'id',
  user_id             BIGINT NOT NULL COMMENT '用户id',
  role_id             BIGINT NOT NULL COMMENT '角色id',
  tenant_id           BIGINT NOT NULL COMMENT '系统角色时为0',
  tenant_wechatapp_id BIGINT NOT NULL COMMENT '系统角色时为0',
  create_time         DATETIME COMMENT '创建时间',
  update_time         DATETIME COMMENT '最后修改时间',
  PRIMARY KEY (id),
  INDEX idx_role_id(role_id),
  UNIQUE uk_user_tenant_app_id(user_id, tenant_id, tenant_wechatapp_id, role_id)
) COMMENT '用户与角色的关联' CHARACTER SET utf8mb4;

# 登录相关
DROP TABLE IF EXISTS user_login_info;
CREATE TABLE user_login_info (
  id             BIGINT      NOT NULL COMMENT 'id',
  user_id        BIGINT      NOT NULL COMMENT '用户id',
  login_way      TINYINT     NOT NULL COMMENT '1账号密码登录，2微信扫码登录',
  login_name     VARCHAR(32) NOT NULL COMMENT '登录账号,微信扫码登录时为unionId',
  login_password VARCHAR(512) COMMENT '账号密码',
  login_salt     VARCHAR(32) COMMENT '密码加盐',
  create_time    DATETIME COMMENT '创建时间',
  update_time    DATETIME COMMENT '最后修改时间',
  PRIMARY KEY (id),
  UNIQUE uk_user_id_login_type(user_id, login_way),
  UNIQUE uk_login_way_name(login_way, login_name)
) COMMENT '用户登录账号' CHARACTER SET utf8mb4;


DROP TABLE IF EXISTS user_login_token;
CREATE TABLE user_login_token (
  id               BIGINT       NOT NULL COMMENT 'id',
  user_id          BIGINT       NOT NULL COMMENT '用户id',
  tenant_id        BIGINT COMMENT '租户id',
  tenant_wx_app_id BIGINT COMMENT '租户微信服务号id',
  login_way        TINYINT      NOT NULL COMMENT '1账号密码登录，2微信扫码登录',
  login_token      VARCHAR(64) NOT NULL COMMENT '凭据',
  status           TINYINT UNSIGNED COMMENT '0：无效，1：有效',
  expire_time      DATETIME COMMENT '过期时间',
  create_time      DATETIME COMMENT '创建时间',
  update_time      DATETIME COMMENT '最后修改时间',
  login_ip         VARCHAR(32) COMMENT '登录ip地址',
  PRIMARY KEY (id),
  UNIQUE uk_token(login_token)
) COMMENT '用户登录凭据' CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS permission;
CREATE TABLE permission (
  id          BIGINT PRIMARY KEY,
  path        VARCHAR(512) NOT NULL COMMENT '请求url',
  method      VARCHAR(64)  NOT NULL COMMENT '请求方法：GET,POST,*',
  status      TINYINT      NOT NULL  DEFAULT 1 COMMENT '状态：1-生效，2-无效',
  update_time DATETIME     NOT NULL,
  create_time DATETIME     NOT NULL
) COMMENT '权限表' CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS role_permission;
CREATE TABLE role_permission (
  id            BIGINT PRIMARY KEY,
  role_id       BIGINT   NOT NULL,
  permission_id BIGINT   NOT NULL,
  update_time   DATETIME NOT NULL,
  create_time   DATETIME NOT NULL,
  UNIQUE (role_id, permission_id)
) COMMENT '角色-权限表' CHARACTER SET utf8mb4;

DROP TABLE IF EXISTS ignore_permission_url;
CREATE TABLE ignore_permission_url (
  id          BIGINT PRIMARY KEY,
  method      VARCHAR(16)   NOT NULL COMMENT '请求方法： *代表所有 ',
  url         VARCHAR(1024) NOT NULL COMMENT '请求地址： /xx/**',
  priority    TINYINT          DEFAULT 0 COMMENT '优先级',
  description VARCHAR(512) COMMENT '描述',
  status      TINYINT UNSIGNED DEFAULT 1 COMMENT '状态：0-无效，1-有效',
  create_time DATETIME,
  update_time DATETIME
) COMMENT '无需鉴权地址' CHARACTER SET utf8mb4;


/*删除短信签名模块*/
delete from authorization_service.func where id=456774384166768640;

/*系统管理员用户id修改*/
update user_role set user_id=20180715 where id=183260035114344448
update user_login_info set user_id=20180715 where id=183259332664893440

/**
角色添加字段 修改默认值
 */
alter table role add role_app tinyint DEFAULT 1  COMMENT '1桌面端 2手机端';
update role set role_app=2 where id in(183259005916028928,183259029018255360);
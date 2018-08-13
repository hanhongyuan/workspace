use wx_gateway;
CREATE TABLE wx_config (
  id           BIGINT PRIMARY KEY,
  config_key   VARCHAR(128) NOT NULL UNIQUE,
  config_value VARCHAR(512) NOT NULL,
  create_time  DATETIME,
  modify_time  DATETIME
) COMMENT '配置表' DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE wx_token (
  id                  BIGINT PRIMARY KEY,
  appid               VARCHAR(64) COMMENT '微信appId' NOT NULL UNIQUE,
  app_secret          VARCHAR(128) COMMENT '微信appSecrete',
  refresh_token       VARCHAR(256) COMMENT '刷新token',
  access_token        VARCHAR(512) COMMENT '访问token',
  access_token_expire DATETIME COMMENT '访问token过期时间',
  jsapi_ticket        VARCHAR(512) COMMENT 'js sdk 访问token',
  jsapi_ticket_expire DATETIME COMMENT 'js sdk 访问token过期时间',
  refresh_type        TINYINT UNSIGNED              NOT NULL COMMENT '状态：0-不刷新,1-服务号刷新，2-第三方平台刷新，3-授权服务号刷新',
  create_time         DATETIME,
  update_time         DATETIME
) COMMENT '授权信息表' DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE wx_app_info (
  id                 BIGINT PRIMARY KEY,
  tenant_id          BIGINT COMMENT '租户id',
  tenant_app_id      BIGINT COMMENT '租户appId',
  appid              VARCHAR(64) COMMENT '微信appId' NOT NULL UNIQUE,
  app_secret         VARCHAR(128) COMMENT '微信appSecrete',
  nick_name          VARCHAR(128) COMMENT '授权方昵称',
  head_image         VARCHAR(512) COMMENT '授权方头像',
  service_type_info  VARCHAR(16) COMMENT '授权方公众号类型，0代表订阅号，1代表由历史老帐号升级后的订阅号，2代表服务号',
  verify_type_info   VARCHAR(16) COMMENT '授权方认证类型,-1代表未认证，0代表微信认证',
  user_name          VARCHAR(128) COMMENT '授权方公众号原始id',
  principal_name     VARCHAR(128) COMMENT '公众号的主体名称',
  alias              VARCHAR(128) COMMENT '授权方公众号所设置的微信号，可能为空',
  business_info      VARCHAR(128) COMMENT '功能的开通状况',
  qrcode_url         VARCHAR(512) COMMENT '二维码图片的URL',
  funcscope_category VARCHAR(512) COMMENT '权限集列表',
  authorize_time     DATETIME COMMENT '最近一次授权时间',
  status             TINYINT UNSIGNED COMMENT '状态：0-未授权，1-已授权 ',
  create_time        DATETIME,
  update_time        DATETIME
) COMMENT '授权方信息表' DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE wx_auth_state (
  id          BIGINT PRIMARY KEY,
  params      VARCHAR(4096) COMMENT 'state对应参数',
  status      TINYINT UNSIGNED COMMENT '是否有效：0-失效，1-有效',
  create_time DATETIME,
  update_time DATETIME
) COMMENT '授权state参数表' DEFAULT CHARACTER SET utf8mb4;


CREATE TABLE wx_user (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT       NOT NULL,
  tenant_app_id BIGINT       NOT NULL,
  union_id      VARCHAR(128) NOT NULL,
  open_id       VARCHAR(128) NOT NULL,
  wx_app_id     VARCHAR(128) NOT NULL,
  cm_open_id    VARCHAR(128) NOT NULL,
  user_id       BIGINT       NOT NULL,
  create_time   DATETIME,
  UNIQUE uk_app_open(wx_app_id, cm_open_id)
) COMMENT '微信用户映射表' DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE wx_gateway.wx_sys_template (
  id          BIGINT PRIMARY KEY COMMENT 'id',
  template_no VARCHAR(32) UNIQUE NOT NULL COMMENT '模板编号',
  industry    VARCHAR(128)       NOT NULL COMMENT '行业',
  example     VARCHAR(512)       NOT NULL COMMENT '内容示例',
  content     VARCHAR(512)       NOT NULL COMMENT '详细内容',
  title       VARCHAR(128)       NOT NULL COMMENT '标题',
  remark      VARCHAR(256)       NOT NULL COMMENT '使用说明',
  status      TINYINT UNSIGNED COMMENT '1-有效,2-无效',
  create_time DATETIME COMMENT '创建时间',
  update_time DATETIME COMMENT '最后修改时间'
) COMMENT '微信模板库' DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE wx_gateway.wx_template (
  id                  BIGINT PRIMARY KEY COMMENT 'id',
  tenant_id           BIGINT      NOT NULL COMMENT '租户id',
  tenant_app_id       BIGINT      NOT NULL COMMENT '客户服务号id',
  template_id         BIGINT      NOT NULL COMMENT '模板id',
  template_no         VARCHAR(32) NOT NULL COMMENT '微信模板公众编号',
  template_private_no VARCHAR(64) NOT NULL COMMENT '微信模板编号',
  status              TINYINT UNSIGNED COMMENT '1-有效,2-无效',
  create_time         DATETIME COMMENT '创建时间',
  update_time         DATETIME COMMENT '最后修改时间',
  UNIQUE uk_app_template_no(tenant_id, tenant_app_id, template_id)
) COMMENT '商家微信模板' DEFAULT CHARACTER SET utf8mb4;

create table wx_template_msg
(
	tenant_id bigint not null,
	id bigint not null comment 'id'
		primary key,
	tenant_app_id bigint not null,
	user_id bigint not null comment '用户id',
	tenant_user_open_id varchar(128) not null comment '租户用户openId',
	template_id bigint not null comment '模板id',
	template_no varchar(64) not null comment '模板库编号',
	url varchar(512) null comment '链接地址',
	data varchar(1024) null comment '数据',
	msg_id varchar(64) not null comment '消息id',
	status int null comment '状态:1-成功,2-失败',
	err_msg varchar(512) null comment '错误描述',
	title varchar(128) not null comment '标题',
	content varchar(512) not null comment '详细内容',
	create_time datetime null comment '创建时间',
	update_time datetime null comment '最后修改时间',
	user_head_img_url varchar(255) null,
	user_name varchar(32) null,
	user_mobile_no varchar(11) null,
	tenant_app_name varchar(32) null,
	tenant_short_name varchar(16) null
)
comment '用户已发送微信模板消息' engine=InnoDB charset=utf8mb4;

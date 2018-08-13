USE wx_gateway;


/*********************测试环境************************/
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES (1, 'component_auth_callback_url', 'http://v3test.sjfx.com.cn/wxgateway/cm/auth/callback/%s', now(), now());
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES
  (2, 'mp_redirect_uri', 'http%3a%2f%2fv3test.sjfx.com.cn%2fwxgateway%2fmp%2fauth%2fcode%2fcallback', now(),
   now());
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES
  (3, 'cm_mp_redirect_uri', 'http%3a%2f%2fv3test.sjfx.com.cn%2fwxgateway%2fcm%2fauth%2fcode%2fcallback', now(),
   now());
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES
  (4, 'error_page', 'http://v3test.sjfx.com.cn/web/#/error', now(),
   now());
INSERT INTO wx_app_info VALUES (1, 0, 0, 'wx2b5661705f3ff6a8', '4f1b35460f31f30a0872702c3b30dfba',
                                   '金嘉龙珠宝', NULL, 2, 0, 'gh_cb900c638a58',
                                   '金嘉龙珠宝', 'xxx', NULL, NULL, NULL, NULL, 0, now(), now()
);

INSERT INTO wx_token (id, appid, app_secret, refresh_type, create_time, update_time)
VALUES (1, 'wx2b5661705f3ff6a8', '4f1b35460f31f30a0872702c3b30dfba', 1, now(), now());

INSERT INTO wx_token (id, appid, app_secret, refresh_type, create_time, update_time)
VALUES (2, 'wx590a8a9a8ec4183c', 'd6d5ffb8d0c563cb315f1e63bb841fc5', 2, now(), now());



/**************初始化微信公共模板****************/

INSERT INTO wx_gateway.wx_sys_template
VALUES (1, 'OPENTM207665167', '消费品 - 消费品', '', '', '积分通知', '', 1, now(), now()),
  (2, 'OPENTM207804704', '消费品 - 消费品', '', '', '兑换通知', '', 1, now(), now()),
  (3, 'TM00232', '消费品 - 消费品', '', '', '积分兑换成功通知', '', 1, now(), now()),
  (4, 'OPENTM207251323', '消费品 - 消费品', '', '', '产品即将到期提醒', '', 1, now(), now()),
  (5, 'OPENTM206215005', '消费品 - 消费品', '', '', '核销成功提醒', '', 1, now(), now()),
  (6, 'OPENTM411613106', '消费品 - 消费品', '', '', '礼品申领成功通知', '', 1, now(), now()),
  (7, 'OPENTM402063677', '消费品 - 消费品', '', '', '订单创建通知', '', 1, now(), now()),
  (8, 'OPENTM207940503', '消费品 - 消费品', '', '', '订单状态提醒', '', 1, now(), now()),
  (9, 'TM00504', '消费品 - 消费品', '', '', '消费成功通知', '', 1, now(), now());
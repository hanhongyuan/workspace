USE wx_gateway;


/*************************开发环境********************************/
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES (1, 'component_auth_callback_url', 'http://v3dev.sjfx.com.cn/wxgateway/cm/auth/callback/%s', now(), now());
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES
  (2, 'mp_redirect_uri', 'http%3a%2f%2fv3dev.sjfx.com.cn%2fwxgateway%2fmp%2fauth%2fcode%2fcallback', now(),
   now());
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES
  (3, 'cm_mp_redirect_uri', 'http%3a%2f%2fv3dev.sjfx.com.cn%2fwxgateway%2fcm%2fauth%2fcode%2fcallback', now(),
   now());
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES
  (4, 'error_page', 'http://v3dev.sjfx.com.cn/web/#/error', now(),
   now());
INSERT INTO wx_app_info VALUES (1, 0, 0, 'wxed16bd90c68476c7', '866bad353ebe6cfe008bf7e033f964e8',
                                   '世纪福星', NULL, 2, 0, 'gh_ee03bfd8f5bf',
                                   '湖南越翼网络科技有限公司', 'sjfxzbsoft', NULL, NULL, NULL, NULL, 0, now(), now()
);

INSERT INTO wx_token (id, appid, app_secret, refresh_type, create_time, update_time)
VALUES (1, 'wxed16bd90c68476c7', '866bad353ebe6cfe008bf7e033f964e8', 1, now(), now());

INSERT INTO wx_token (id, appid, app_secret, refresh_type, create_time, update_time)
VALUES (2, 'wx511c51039f561228', 'bffa2023e8e7e21bdcd7bcfe5a127951', 2, now(), now());

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


/*******************************正式环境**************************************/
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES (1, 'component_auth_callback_url', 'http://yun.sjfx.com.cn/wxgateway/cm/auth/callback/%s', now(), now());
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES
  (2, 'mp_redirect_uri', 'http%3a%2f%2fyun.sjfx.com.cn%2fwxgateway%2fmp%2fauth%2fcode%2fcallback', now(),
   now());
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES
  (3, 'cm_mp_redirect_uri', 'http%3a%2f%2fyun.sjfx.com.cn%2fwxgateway%2fcm%2fauth%2fcode%2fcallback', now(),
   now());
INSERT INTO wx_config (id, config_key, config_value, create_time, modify_time)
VALUES
  (4, 'error_page', 'http://yun.sjfx.com.cn/web/#/error', now(),
   now());
# 平台公众号info
INSERT INTO wx_app_info VALUES (1, 0, 0, 'wx85c2d9b9f6da6bdb', 'f395acce20a8991d105179264cc3ec49',
                                   '云智创', NULL, 2, 0, 'gh_0de6e7acf350',
                                   '云智创', '', NULL, NULL, NULL, NULL, 0, now(), now()
);
# 平台公众号token
INSERT INTO wx_token (id, appid, app_secret, refresh_type, create_time, update_time)
VALUES (1, 'wx85c2d9b9f6da6bdb', 'f395acce20a8991d105179264cc3ec49', 1, now(), now());
# 微信开放平台token
INSERT INTO wx_token (id, appid, app_secret, refresh_type, create_time, update_time)
VALUES (2, 'wxf151909972f3f5b8', '1c51f902346ff78c76354d56338af30a', 2, now(), now());


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
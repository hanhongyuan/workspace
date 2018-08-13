
use coupon_service;
ALTER TABLE coupon_template ADD  product_name VARCHAR(64) COMMENT '物品名称(兑换券)';
ALTER TABLE coupon_template ADD  exchange_shop VARCHAR(256) COMMENT '兑换门店(兑换券)';

ALTER TABLE coupon_user ADD  product_name VARCHAR(64) COMMENT '物品名称(兑换券)';
ALTER TABLE coupon_user ADD  exchange_shop VARCHAR(256) COMMENT '兑换门店(兑换券)';


ALTER TABLE coupon_template modify column face_value decimal(10) DEFAULT 0 COMMENT '礼券面值';
ALTER TABLE coupon_user modify column face_value decimal(10) DEFAULT 0 COMMENT '礼券面值';

ALTER TABLE coupon_template modify  scope int COMMENT '商品范围包括：全部商品、指定商品、指定商品小类';

use `employee`;
DROP INDEX `uk_all` ON backlog;



use coupon_service;
alter TABLE coupon_user ADD channel_id BIGINT COMMENT '渠道id';

use user_service;
ALTER TABLE user_service.user_source MODIFY COLUMN busi_url VARCHAR(1024) COMMENT '业务地址';

ALTER TABLE user_service.erp_member_info
    MODIFY COLUMN interested VARCHAR(256);

-- 已执行


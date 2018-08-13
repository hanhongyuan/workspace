USE position;

DROP TABLE IF EXISTS geo_position;
CREATE TABLE geo_position (
  id            BIGINT PRIMARY KEY,
  tenant_id     BIGINT COMMENT '租户id',
  tenant_app_id BIGINT COMMENT '租户appid',
  object_type   VARCHAR(64) NOT NULL COMMENT '物品类别：user-用户,shop-门店',
  object_id     BIGINT      NOT NULL COMMENT '物品id',
  geo_hash      VARCHAR(32) COMMENT '位置的geo_hash',
  latitude      DECIMAL(10, 7) COMMENT 'wgs84 纬度',
  longitude     DECIMAL(10, 7) COMMENT 'wgs84 经度',
  create_time   DATETIME,
  update_time   DATETIME
) COMMENT '地理位置表' DEFAULT CHARACTER SET utf8mb4;
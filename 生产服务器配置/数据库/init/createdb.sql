use mysql;

DROP DATABASE IF EXISTS `export`;
CREATE DATABASE export CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- 1
DROP DATABASE IF EXISTS `activity_service`;
CREATE DATABASE activity_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 2
DROP DATABASE IF EXISTS `authorization_service`;
CREATE DATABASE authorization_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 3
DROP DATABASE IF EXISTS `comment_service`;
CREATE DATABASE comment_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 4
DROP DATABASE IF EXISTS `coupon_service`;
CREATE DATABASE coupon_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 5
DROP DATABASE IF EXISTS `customize_page`;
CREATE DATABASE customize_page CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 6
DROP DATABASE IF EXISTS `erp_sync`;
CREATE DATABASE erp_sync CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 7
DROP DATABASE IF EXISTS `gift_mail`;
CREATE DATABASE `gift_mail` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 8
DROP DATABASE IF EXISTS `message_push`;
CREATE DATABASE message_push CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 9
DROP DATABASE IF EXISTS `oss`;
CREATE DATABASE oss CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 10
DROP DATABASE IF EXISTS `sms`;
CREATE DATABASE sms CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 11
DROP DATABASE IF EXISTS `tenant`;
CREATE DATABASE tenant CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 12
DROP DATABASE IF EXISTS `user_service`;
CREATE DATABASE user_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 13
DROP DATABASE IF EXISTS `warranty_service`;
CREATE DATABASE warranty_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 14
DROP DATABASE IF EXISTS `wx_gateway`;
CREATE DATABASE wx_gateway CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- 15
DROP DATABASE IF EXISTS `account`;
CREATE DATABASE account CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--16
DROP DATABASE IF EXISTS `position`;
CREATE DATABASE position CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--17
DROP DATABASE IF EXISTS `erp_to_platform`;
CREATE DATABASE erp_to_platform CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--18
DROP DATABASE IF EXISTS `value_added`;
CREATE DATABASE value_added CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--19
DROP DATABASE IF EXISTS h5link;
CREATE DATABASE h5link CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--20
DROP DATABASE IF EXISTS qrcode_service;
CREATE DATABASE qrcode_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--21
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--22
DROP DATABASE IF EXISTS `tag_service`;
CREATE DATABASE `tag_service` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--23
DROP DATABASE IF EXISTS `customer`;
CREATE DATABASE `customer` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--24
DROP DATABASE IF EXISTS `facepass_sync`;
CREATE DATABASE `facepass_sync` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--25
DROP DATABASE IF EXISTS `statistic`;
CREATE DATABASE `statistic` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;



--26
DROP DATABASE IF EXISTS `goods`;
CREATE DATABASE `goods` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--27
DROP DATABASE IF EXISTS `payment`;
CREATE DATABASE `payment` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;



--28
DROP DATABASE IF EXISTS `order`;
CREATE DATABASE `order` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--29
DROP DATABASE IF EXISTS `deliver`;
CREATE DATABASE `deliver` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--30
DROP DATABASE IF EXISTS `booking`;
CREATE DATABASE `booking` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--31
DROP DATABASE IF EXISTS `bespoke`;
CREATE DATABASE `bespoke` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


--32
DROP DATABASE IF EXISTS `agency`;
CREATE DATABASE `agency` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;



CREATE USER 'sjfx'@'%' IDENTIFIED BY '123456';
GRANT ALL ON *.* TO 'sjfx'@'%';


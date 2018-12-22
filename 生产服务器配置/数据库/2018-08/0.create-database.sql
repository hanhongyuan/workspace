use mysql;

--23
DROP DATABASE IF EXISTS `customer`;
CREATE DATABASE `customer` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'customeruser';
CREATE USER 'taguser'@'%' IDENTIFIED BY 'HQb5LUs4r7GX';
GRANT ALL ON customer.* TO 'taguser'@'%';

CREATE DATABASE `customer` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
GRANT ALL ON *.* TO 'sjfx'@'%';

use mysql;
CREATE DATABASE `facepass_sync` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
GRANT ALL ON *.* TO 'sjfx'@'%';
CREATE DATABASE `statistic` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
GRANT ALL ON *.* TO 'sjfx'@'%';
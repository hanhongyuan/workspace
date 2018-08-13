DROP DATABASE IF EXISTS qrcode_service;
CREATE DATABASE qrcode_service CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
DROP USER IF EXISTS 'qrcodeuser';
CREATE USER 'qrcodeuser'@'%' IDENTIFIED BY '6a932gdssKsT';
GRANT ALL ON qrcode_service.* TO 'qrcodeuser'@'%';

use qrcode_service;
drop unique uk_tenant_wechatpp_id_scene_id_data on qrcode;
drop table if exists qrcode;
/*==============================================================*/
/* Table: qrcode                                                */
/*==============================================================*/
create table qrcode
(
   id                   bigint not null comment 'id',
   tenant_id            bigint not null comment '租户id',
   tenant_wechatapp_id  bigint not null comment '服务号',
   scene_id             smallint not null comment '场景id',
   data                 varchar(64) not null comment '数据',
   action_name          varchar(20) not null comment '二维码类型',
   ticket               varchar(512) comment '二维码凭据',
   expire_time          datetime comment '过期时间',
   image_url            varchar(512) comment '图片url',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id),
   unique uk_tenant_wechatpp_id_scene_id_data(tenant_wechatapp_id,scene_id,`data`)
) comment '二维码定义' CHARACTER SET utf8mb4;

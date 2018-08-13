USE `h5link`;

/*==============================================================*/
/* Table: h5_link                                               */
/*==============================================================*/
DROP TABLE IF EXISTS `h5_link`;
create table h5_link
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   func_id              bigint not null comment '功能id',
   link_url             varchar(512) not null comment '链接地址',
   link_text            varchar(128) not null comment '链接文字',
   link_image_url       varchar(512) comment '链接图片',
   detail_id            bigint not null comment '明细id，如产品的id\活动id等',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '最后修改时间',
   primary key (id)
) comment 'h5链接'  CHARACTER SET utf8mb4;

alter table h5_link comment 'h5链接';

/*====================================================================*/
/* Index: uk_tenant_wechatappid_func_module_id_func_page_id_detail_id */
/*====================================================================*/
create unique index uk_tenant_wechatappid_func_module_id_func_page_id_detail_id on h5_link
(
   tenant_wechatapp_id,
   detail_id
);
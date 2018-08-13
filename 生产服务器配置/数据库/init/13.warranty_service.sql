use warranty_service;

/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/6/5 9:58:28                             */
/*==============================================================*/

drop table if exists warranty;

/*==============================================================*/
/* Table: warranty                                              */
/*==============================================================*/
create table warranty
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   user_id              bigint not null comment '用户id',
   erp_sales_id         bigint not null comment '销售单id',
   update_user_id       bigint not null comment '修改人',
   warranty_no          varchar(20) not null comment '质保单号',
   warranty_data        text not null comment '数据',
   is_disable           bool comment '停用',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '最后修改时间'
);

alter table warranty comment '质保单';

/*==============================================================*/
/* Index: uk_erp_sales_id                                       */
/*==============================================================*/
create unique index uk_erp_sales_id on warranty
(
   erp_sales_id
);

/*==============================================================*/
/* Index: idx_tenant_wechatapp_id_user_id                       */
/*==============================================================*/
create index idx_tenant_wechatapp_id_user_id on warranty
(
   tenant_wechatapp_id,
   user_id
);


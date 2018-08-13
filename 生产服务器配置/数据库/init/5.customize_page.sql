use customize_page;

CREATE TABLE IF NOT EXISTS `customize_page` (
  `id` bigint(20) NOT NULL COMMENT 'Id',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '商户Id',
  `tenant_wechatapp_id` bigint(20) DEFAULT NULL COMMENT '服务号Id',
  `page_name` varchar(128) NOT NULL COMMENT '页面名称',
  `title` varchar(256) NOT NULL COMMENT '标题',
  `modules` text COMMENT '模板内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_tenant_wechatapp_id_url_uindex` (`tenant_wechatapp_id`,`page_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='页面';


drop table if exists special_topic;

drop table if exists special_topic_collect;

/*==============================================================*/
/* Table: special_topic                                         */
/*==============================================================*/
create table special_topic
(
   id                   bigint not null comment 'id',
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   title                varchar(32) not null comment '标题',
   summary              varchar(128) comment '摘要',
   master_img    varchar(128) not null comment '列表主图',
   customize_page_id	        bigint comment '自定义页id',
   hits                  int default '0' comment '点击量',
   collect               int default '0' comment '收藏量',
   topping              bool default 0 comment '置顶',
   topping_time         datetime comment '置顶时间',
   puton_status         bool default 0 comment '上架状态',
   puton_time           datetime comment '上架时间',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '最后修改时间',
   primary key (id)
);

alter table special_topic comment '专题';

/*==============================================================*/
/* Table: special_topic_collect                                 */
/*==============================================================*/
create table special_topic_collect
(
   id                   bigint not null comment 'id',
   special_topic_id     bigint not null comment '专题id',
   user_id              bigint not null comment '用户id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '最后修改时间',
   primary key (id)
);

alter table special_topic_collect comment '专题收藏';



/*==============================================================*/
/* Index: uk_special_topic                                      */
/*==============================================================*/
create unique index uk_special_topic on special_topic_collect
(
   special_topic_id,
   user_id
);

alter table special_topic_collect add constraint fk_reference_2 foreign key (special_topic_id)
      references special_topic (id) on delete restrict on update restrict;


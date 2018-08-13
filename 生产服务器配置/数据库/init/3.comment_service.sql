use comment_service;

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   id                   bigint not null comment 'id',
	 tenant_id							BIGINT not null COMMENT '租户id',
	 tenant_wechatapp_id		BIGINT not NULL comment '客户服务号id',
   user_id              bigint not null comment '用户id',
   content              varchar(256) comment '评价内容',
   score                smallint not null comment '评分',
   primary_key_id       bigint not null comment '主键id,如订单id',
   foreign_key_id       bigint default 0 comment '外键id,如订单的商品的id',
   prize_id             bigint default 0 comment '评论奖励id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)CHARACTER SET utf8mb4;

alter table comment comment '评价内容';

/*==============================================================*/
/* Index: uk_comment                                            */
/*==============================================================*/
create unique index uk_comment on comment
(
   primary_key_id
);

/*==============================================================*/
/* Table: comment_image                                         */
/*==============================================================*/
create table comment_image
(
   id                   bigint not null comment 'id',
   comment_id           bigint not null comment '评价id',
   image_url            varchar(512) not null comment '图片url',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)CHARACTER SET utf8mb4;

alter table comment_image comment '评价图片';

/*==============================================================*/
/* Index: idx_comment_id                                        */
/*==============================================================*/
create index idx_comment_id on comment_image
(
   comment_id
);

/*==============================================================*/
/* Table: reply                                                 */
/*==============================================================*/
create table reply
(
   id                   bigint not null comment 'id',
	 tenant_id							BIGINT not null COMMENT '租户id',
	 tenant_wechatapp_id		BIGINT not NULL comment '客户服务号id',
   reply_user_id        bigint not null comment '回评用户id',
   content              varchar(256) not null comment '评价内容',
   comment_id           bigint not null comment '评价id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)CHARACTER SET utf8mb4;

alter table reply comment '回评内容';

/*==============================================================*/
/* Index: idx_reply_user_id                                     */
/*==============================================================*/
create index idx_reply_user_id on reply
(
   reply_user_id
);

/*==============================================================*/
/* Index: uk_comment_id                                         */
/*==============================================================*/
create unique index uk_comment_id on reply
(
   comment_id
);

/*==============================================================*/
/* Table: reply_image                                           */
/*==============================================================*/
create table reply_image
(
   id                   bigint not null comment 'id',
   reply_id             bigint not null comment '回评id',
   image_url            varchar(512) not null comment '图片url',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)CHARACTER SET utf8mb4;

alter table reply_image comment '回评图片';

/*==============================================================*/
/* Index: idx_comment_id                                        */
/*==============================================================*/
create index idx_comment_id on reply_image
(
   reply_id
);


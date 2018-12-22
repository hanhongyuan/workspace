use gift_mail;

/*==============================================================*/
/* Table: card 消费卡                                            */
/*==============================================================*/
drop table if exists card;
create table card
(
   id                   bigint not null comment 'ID',
   tenant_id            bigint not null comment '商家Id',
   name                 varchar(16) not null comment '商品分类名称,最小长度2',
   valid_starttime      datetime not null comment '有效开始时间',
   valid_endtime        datetime not null comment '有效结束时间',
   remark               varchar(512) comment '说明',
   status               int not null default 0 comment '状态0禁用、1启用',
   gifttotal            int default 0 comment '绑定礼品数量',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
) comment '消费卡' DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*==============================================================*/
/* Table: card 消费卡绑定礼品                                     */
/*==============================================================*/
drop table if exists card_gift;
create table card_gift
(
   id                   bigint not null comment 'ID',
   card_id              bigint not null comment '消费卡Id',
   gift_id              bigint not null comment '礼品Id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id),
   UNIQUE INDEX uk_card_gift_id (card_id, gift_id)
) comment '消费卡绑定礼品' DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*==============================================================*/
/* Table: card 消费卡发放会员                                     */
/*==============================================================*/
drop table if exists card_member;
create table card_member
(
   id                   bigint not null comment 'ID',
   card_id              bigint not null comment '消费卡Id',
   user_id              bigint not null comment '会员Id',
   user_name            varchar(16) comment '会员名称',
   mobile               varchar(16) comment '手机号码',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id),
   UNIQUE INDEX uk_card_user_id (card_id, user_id)
) comment '消费卡发放会员' DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*==============================================================*/
/* Table: card 消费卡会员礼品核销                                */
/*==============================================================*/
drop table if exists card_gift_writeoff;
create table card_gift_writeoff
(
   id                   bigint not null comment 'ID',
   card_id              bigint not null comment '消费卡Id',
   user_id              bigint not null comment '会员Id',
   gift_id              bigint not null comment '礼品Id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id),
   UNIQUE INDEX uk_card_user_id (card_id, user_id)
) comment '消费卡会员礼品核销表' DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

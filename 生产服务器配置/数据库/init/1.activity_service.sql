USE activity_service;
-- create table
drop table if exists activity;
create table activity
(
   id                   bigint not null,
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   activity_type        varchar(32) not null comment '活动类型(枚举值：lottery抽奖)',
   activity_main_pic_url varchar(512) not null comment '活动主图',
   activity_name        varchar(32) not null comment '活动名称',
   start_time           datetime not null comment '开始时间',
   end_time             datetime not null comment '结束时间',
   activity_remark      varchar(256) not null comment '活动说明',
   status               int not null comment '状态(0停用，1启用)',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
);
alter table activity comment '活动';
create index idx_activity_tenant_type on activity
(
   tenant_id,
   tenant_wechatapp_id,
   activity_type
);
create index idx_activity_type on activity
(
   activity_type
);

drop table if exists lottery_activity;
create table lottery_activity
(
   id                   bigint not null,
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   activity_id          bigint not null comment '活动id',
   lottery_type         varchar(32) comment '抽奖类型(枚举值：super_big_turntable超级大转盘,squared_up九宫格)',
   is_once              bool not null default 0 comment '仅限一次',
   times_per_day        int(5) not null comment '每天N次',
   failure_remark       varchar(1000) not null comment '失败提示',
   activity_data        json comment '活动数据',
   partake_num          bigint default 0 comment '参与人数',
   partake_count        bigint default 0 comment '参与人次',
   lottery_num          bigint default 0 comment '中奖人数',
   lottery_count        bigint default 0 comment '中奖人次',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   version              bigint not null default 0 comment '数据版本号',
   primary key (id)
);
alter table lottery_activity comment '抽奖活动';
create index idx_lottery_activity_tenant on lottery_activity
(
   tenant_id,
   tenant_wechatapp_id
);
create index idx_lottery_activity_id on lottery_activity
(
   activity_id
);


drop table if exists lottery_prize;
create table lottery_prize
(
   id                   bigint not null,
   tenant_wechatapp_id  bigint not null comment '服务号id',
   tenant_id            bigint not null comment '单位id',
   activity_id          bigint not null comment '活动id',
   lottery_activity_id  bigint not null comment '抽奖活动id',
   prize_type           varchar(32) not null comment '奖品类型(枚举值：coupon优惠券, integral积分)',
   prize_item_name      varchar(50) comment '奖项名称',
   prize_name           varchar(50) comment '奖品名称',
   prize_image_url      varchar(512) comment '奖品图片',
   prize_push           int not null comment '奖品数量',
   prize_get            int default '0' comment '中奖数量',
   winning_probability  int not null comment '中奖概率',
   prize_data           json not null comment '奖品数据',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   version              bigint not null default 0 comment '数据版本号',
   primary key (id)
);
alter table lottery_prize comment '抽奖奖品';
create index idx_lottery_prize on lottery_prize
(
   lottery_activity_id
);

drop table if exists lottery_user;
create table lottery_user
(
   id                   bigint not null,
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   activity_id          bigint not null comment '活动id',
   lottery_activity_id  bigint not null comment '抽奖活动id',
   user_id              bigint not null comment '用户id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
);
alter table lottery_user comment '抽奖活动参与明细';
create index idex_lottery_user on lottery_user
(
   lottery_activity_id,
   user_id
);


drop table if exists lottery_winner;
create table lottery_winner
(
   id                   bigint not null,
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   activity_id          bigint not null comment '活动id',
   lottery_activity_id  bigint not null comment '抽奖活动id',
   user_id              bigint not null comment '用户id',
   head_img_url         varchar(512) comment '头像URL',
   user_name            varchar(32) comment '用户姓名',
   mobile_no            varchar(16) comment '用户手机号',
   prize_type           varchar(32) not null comment '奖品类型(枚举值：coupon优惠券, integral积分)',
   prize_name           varchar(50) comment '奖品名称',
   prize_image_url      varchar(512)  comment '奖品图片',
   prize_data           json not null comment '奖品数据',
   winning_prize        json not null comment '中奖数据',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
);
alter table lottery_winner comment '抽奖活动中奖明细';
create index idx_lottery_winner on lottery_winner
(
   lottery_activity_id,
   user_id
);
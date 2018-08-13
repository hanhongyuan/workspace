use coupon_service;
drop table if exists coupon_get_center;
create table coupon_get_center
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   coupon_template_id   bigint not null comment '礼劵模板Id',
   put_quantity         int not null comment '投放数量，必须大于0',
   received_quantity    int default 0 comment '已领数量',
   remaining_quantity   int default 0 comment '剩余数量',
   get_limit_per_user   smallint not null comment '限领数量，必须大于等于0',
   state                tinyint not null comment '1已上架，2待上架',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id),
   INDEX idx_coupon_get_center(tenant_wechatapp_id,coupon_template_id),
   UNIQUE uk_tenant_wechatapp_id_coupon_template_id(tenant_wechatapp_id,coupon_template_id)
)comment '领券中心' CHARACTER SET utf8mb4;


drop table if exists coupon_give;
create table coupon_give
(
   id                   bigint not null comment 'id',
   coupon_template_id   bigint not null comment '礼劵模板Id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   user_id              bigint default 0  comment '用户id',
   get_token            varchar(32)  comment '领取时验证有效',
   coupon_user_id       bigint comment '已领取的券id',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id),
   INDEX idx_tenant_wechatapp_id_coupon_template_id_user_id(coupon_template_id,tenant_wechatapp_id,user_id)
) comment '礼券转赠' CHARACTER SET utf8mb4;


drop table if exists coupon_mall_order;
create table coupon_mall_order
(
   id                   bigint not null comment 'id',
   mall_product_id      bigint not null comment '产品id',
   price                decimal not null comment '价格',
   account_detail_id    bigint not null comment '账户明细id',
	 pay_type             tinyint comment '1积分，2现金',
   coupon_user_id       bigint comment '券id',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id)
) comment '券集市订单' CHARACTER SET utf8mb4;


drop table if exists coupon_mall_product;
create table coupon_mall_product
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   coupon_template_id   bigint not null comment '礼劵模板Id',
   put_quantity         int not null comment '投放数量，必须大于0',
   received_quantity    int default 0 comment '已领数量',
   remaining_quantity   int default 0 comment '剩余数量',
   get_limit_per_user   smallint comment '限领数量，必须大于等于0',
   state                tinyint not null comment '1已上架，2待上架',
   pay_type             tinyint comment '1积分，2现金',
   integral_price       int comment '积分价格',
   cash_price           decimal comment '现金价格',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
	 primary key (id),
	 INDEX idx_coupon_mall_product( tenant_wechatapp_id,coupon_template_id),
	 unique uk_tenant_wechatapp_id_coupon_template_id( tenant_wechatapp_id,coupon_template_id)
) comment '券集市商品' CHARACTER SET utf8mb4;


drop table if exists coupon_specify_category;
create table coupon_specify_category
(
   id                   bigint not null comment 'id',
   coupon_template_id   bigint not null comment '礼劵模板Id',
   category_id          bigint not null comment '商品类型Id',
   category_name        varchar(64) not null comment '商品小类名称',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id),
   unique uk_coupon_template_id_category_id( coupon_template_id,category_id)
) comment '礼劵模版指定商品小类关联' CHARACTER SET utf8mb4;


drop table if exists coupon_specify_product;
create table coupon_specify_product
(
   id                   bigint not null comment 'id',
   coupon_template_id   bigint not null comment '礼劵模板Id',
   product_id           bigint not null comment '商品Id',
   product_name         varchar(256) not null comment '商品名称',
   category_name        varchar(64) not null comment '商品类型名称',
   price                decimal not null comment '商品价格',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id)
) comment '礼劵模版指定商品关联' CHARACTER SET utf8mb4;


drop table if exists coupon_template;
create table coupon_template
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   coupon_name          varchar(64) not null comment '礼劵名称',
   face_value           decimal not null comment '礼劵面值',
   coupon_type          int not null comment '礼劵类型包括1线上礼劵（商城劵）、2线下礼劵（门店劵）、3通用券、4增值券',
   use_threshold        decimal not null comment '满多少元可以使用。0表示无限制（当礼劵类型为线上礼劵时才需要设置使用门槛）',
   begin_time           datetime not null comment '此时间表示此类礼劵总的有效开始时间和结束时间',
   end_time             datetime not null comment '有效期结束时间',
   create_channel       tinyint not null comment '创建渠道
            1领券中心
            2券集市
            3增值兑换
            4生日赠送
            5商家赠送
            6抽奖
            7绑定手机赠送

            ',
   scope                int not null comment '商品范围包括：全部商品、指定商品、指定商品小类',
   state                int not null comment '状态包括：启用、禁用',
   remark               varchar(256) comment '礼劵说明',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id),
   unique uk_tenant_wechatpp_id_coupon_name( tenant_wechatapp_id,coupon_name,create_channel),
   INDEX idx_coupon_type(coupon_type)
) comment '礼券模板' CHARACTER SET utf8mb4;


drop table if exists coupon_user;
create table coupon_user
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '客户服务号id',
   tenant_id            bigint not null comment '租户id',
   coupon_template_id   bigint not null comment '礼劵模板Id',
   coupon_no            bigint not null comment '礼劵编号',
   coupon_state         int not null comment '礼劵状态
            1已领取,2已核销,3已过期',
   owner_id             bigint not null comment '所属用户id,现在券的拥有者,随着赠券可能发生变化',
   creator_id           bigint not null comment '创建用户id,原始获得券的用户id,记录创建则值不再变化',
   creator_name         varchar(20) default '' comment '创建人姓名',
   user_name            varchar(20) default '' comment '拥有者姓名',
   mobile_no            varchar(11) default '' comment '拥有者手机号码',
   create_channel       tinyint not null comment '创建渠道
            1领券中心
            2券集市
            3增值兑换
            4生日赠送
            5商家赠送
            6抽奖
            7绑定手机赠送

            ',
   coupon_name          varchar(256) not null comment '礼劵名称',
   face_value           decimal(10,2) not null comment '礼劵面值',
   coupon_type          int not null comment '礼劵类型包括1线上礼劵（商城劵）、2线下礼劵（门店劵）3、通用券4、增值劵（预留类型限定接口创建）',
   use_threshold        decimal not null comment '满多少元可以使用。0表示无限制（当礼劵类型为线上礼劵时才需要设置使用门槛）',
   begin_time           datetime comment '此时间表示此类礼劵总的有效开始时间和结束时间',
   end_time             datetime comment '有效期结束时间',
   remark               varchar(256) comment '礼劵说明',
   create_time          datetime comment '创建时间',
   update_time          datetime  comment '最后修改时间',
   primary key (id),
   INDEX idx_tenant_wechatapp_id_user_id(tenant_wechatapp_id,owner_id)
) comment '用户礼劵' CHARACTER SET utf8mb4;

drop index uk_tenant_wechatpp_id_coupon_name on coupon_template;

alter table coupon_user add creator_mobile_no varchar(20) COMMENT '创建者手机号码';

alter table coupon_template add take_effect_way tinyint NOT NULL  COMMENT '生效方式';
alter table coupon_template add take_effect_day int COMMENT '领取后多少天有效';

alter table coupon_template modify column begin_time datetime DEFAULT NULL COMMENT '此时间表示此类礼劵总的有效开始时间和结束时间';
alter table coupon_template modify column end_time datetime DEFAULT NULL COMMENT '有效期结束时间';

alter table coupon_template modify column use_threshold decimal(10) DEFAULT 0 COMMENT '使用门槛';

alter table coupon_user modify column use_threshold decimal(10) DEFAULT 0 COMMENT '使用门槛';

ALTER  table coupon_give ADD transfer_user_id BIGINT COMMENT '转赠人id';








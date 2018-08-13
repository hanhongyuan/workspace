use gift_mail;

/*==============================================================*/
/* Table: category 商品分类                                    */
/*==============================================================*/
drop table if exists category;
create table category
(
   id                   bigint not null comment 'ID',
   tenant_wechatapp_id  bigint not null comment '商家Id',
   categroy_name        varchar(16) not null comment '商品分类名称,最小长度2',
   parent_id            bigint not null comment '父类id',
   image_url             varchar(512) comment '默认图片，最少10个字符',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
) DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table category comment '商品分类';

/*==============================================================*/
/* Index: uk_category_name                                      */
/*==============================================================*/
create unique index uk_category_name on category
(
   tenant_wechatapp_id,
   categroy_name,
   parent_id
);

/*==============================================================*/
/* Table: inventory  库存                                      */
/*==============================================================*/
drop table if exists inventory;
create table inventory
(
   id                   bigint not null comment 'ID',
   product_id           bigint not null comment '产品ID',
   product_name          varchar(64) comment '产品名称',
   quantity             int not null comment '剩余数量',
   volume               int default 0 comment '销量',
   barcode               varchar(64) comment '货号',
   specification        varchar(16) not null comment '规格1,最小长度2',
   price                int not null comment '价格',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table inventory comment '库存';

drop table if exists inventory_log;
create table inventory_log
(
   id                   bigint not null comment 'ID',
   inventory_id         bigint not null comment '库存ID',
   quantity_before      int not null comment '调整前数量',
   quantity_arfter      int not null comment '调整后数量',
   quantity_chage       int not null comment '调整数量',
   user_id              bigint not null comment '调整人编号',
   remark               varchar(512) comment '备注',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table inventory_log comment '库存修改记录';

/*==============================================================*/
/* Index: uk_inventory                                          */
/*==============================================================*/

create unique index uk_inventory on inventory
(
   product_id,
   specification
);

/*==============================================================*/
/* Table: 异业商家                                             */
/*==============================================================*/
drop table if exists partner;
create table partner
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   partner_name         varchar(32) not null comment '商家名称，最小4',
   contact              varchar(256) not null comment '联系方式，最小4',
   tel                  varchar(32) not null comment '电话号码，最小7',
   address              varchar(256) not null comment '地址，最小10',
   logo_url             varchar(512) not null comment '品牌logo',
   manager_mobile_no    varchar(16) not null comment '收款人手机号码最小11',
   manager_user_id      bigint comment '收款人OpenId',
   lon                  varchar(32) comment '经度',
   lat                  varchar(32) comment '纬度',
   shop_id              bigint not null comment '门店id',
   shop_name            varchar(32) not null comment '提货门店名称',
   remark               varchar(512) comment '备注',
   is_disable           bool comment '停用标志',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
alter table partner comment '异业商家';

/*==============================================================*/
/* Table: partner_product 异业商品                             */
/*==============================================================*/
drop table if exists partner_product;
create table partner_product
(
   id                   bigint not null comment 'id',
   product_id           bigint not null comment '产品ID',
   partner_id           bigint comment '异业商家id',
   settlement_price     decimal(10,2) comment '异业结算价',
   can_get_per_day      int default 0 comment '每天可兑换件数',
   integral_price       int comment '异业积分价',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table partner_product comment '异业商品';


/*==============================================================*/
/* Table: partner_trade_pay  异业商家订单付款                  */
/*==============================================================*/
drop table if exists partner_trade_pay;
create table partner_trade_pay
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   partner_id           bigint not null comment '异业商家ID',
   trade_id             bigint comment '订单Id',
   trade_no             varchar(32) not null comment '商户单号',
   transaction_id       varchar(32) not null comment '微信支付单号',
   manager_user_id      bigint comment '收款人id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table partner_trade_pay comment '异业商家订单付款';

/*==============================================================*/
/* Table: product  商品                                        */
/*==============================================================*/
drop table if exists product;
create table product
(
   id                   bigint not null comment 'id',
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   product_name          varchar(64) not null comment '商品名称，最少4个字符',
   product_type         int not null comment '商品类型，1自有商品 2异业商品',
   category_id          bigint not null comment '品类Id',
   product_status       int not null default 1 comment '商品状态，1，正常，0 下架',
   tag_price            decimal(10,2) default 0 comment '市场价',
   volume               int default 0 comment '销量',
   default_image_url     varchar(512) comment '图片，最少10个字符',
   is_disable           bool default 0 comment '停用标志',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table product comment '商品';

/*==============================================================*/
/* Index: idx_category_id                                       */
/*==============================================================*/

create index idx_category_id on product
(
   category_id
);

/*==============================================================*/
/* Table: product_status 商品上架状态                                       */
/*==============================================================*/
drop table if exists product_status;
create table product_status
(
   id                   bigint not null comment 'id',
   tenant_id            bigint not null comment '单位id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   product_id           bigint not null comment '商品id',
   price                int not null default 1 comment '价格',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
);

alter table product_status comment '商品上架状态';

/*==============================================================*/
/* Index: uk_product_status                                     */
/*==============================================================*/
create unique index uk_product_status on product_status
(
   tenant_wechatapp_id,
   product_id
);

/*==============================================================*/
/* Table: product_desc  商品详情                                */
/*==============================================================*/
drop table if exists product_desc;
create table product_desc
(
   id                   bigint not null comment 'ID',
   tenant_wechatapp_id  bigint not null comment '商家ID',
   product_id           bigint not null comment '产品Id',
   product_desc         text not null comment '详情',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table product_desc comment '商品详情';

/*==============================================================*/
/* Index: uk_product_id                                         */
/*==============================================================*/

create unique index uk_product_id on product_desc
(
   product_id
);

/*==============================================================*/
/* Table: product_image  产品图片                               */
/*==============================================================*/
drop table if exists product_image;
create table product_image
(
   id                   bigint not null comment 'ID',
   tenant_wechatapp_id  bigint not null comment '商家ID',
   product_id           bigint not null comment '产品ID',
   image_url            varchar(512) not null comment '图片url',
   image_index          SMALLINT not null comment '图片顺序',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table product_image comment '产品图片';

/*==============================================================*/
/* Index: idx_product_id                                        */
/*==============================================================*/

create index idx_product_id on product_image
(
   product_id
);

/*==============================================================*/
/* Index: uk_product_image                                      */
/*==============================================================*/

create index uk_product_image on product_image
(
   product_id,
   image_index
);

/*==============================================================*/
/* Table: self_product 自有商品                                */
/*==============================================================*/
drop table if exists self_product;
create table self_product
(
   id                   bigint not null comment 'id',
   product_id           bigint not null comment '产品Id',
   take_type            int not null default 0 comment '提货方式',
   lead_day             int default 0 comment '备货周期，最大100，最小0',
   price                NUMERIC(10,2) DEFAULT 0 COMMENT '价格',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table self_product comment '自有商品';

/*==============================================================*/
/* Table: take_shop    提货门店                                */
/*==============================================================*/
drop table if exists take_shop;
create table take_shop
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   shop_id              bigint not null comment '门店Id',
   shop_name            varchar(32) not null comment '提货门店名称',
   product_id           bigint not null comment '产品Id',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table take_shop comment '提货门店';

/*==============================================================*/
/* Index: uk_take_shop                                          */
/*==============================================================*/

create unique index uk_take_shop on take_shop
(
   tenant_wechatapp_id,
   shop_id,
   product_id
);

/*==============================================================*/
/* Table: trade    订单                                        */
/*==============================================================*/
drop table if exists trade;
create table trade
(
   id                   bigint not null comment 'id',
   tenant_id            bigint NOT NULL COMMENT '单位号',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   trade_no             varchar(32) not null comment '订单号为雪花算法生成，最小长度4',
   trade_type           int not null default 1 comment '订单类型  1自有商品 2异业商品',
   user_id              bigint not null comment '会员id',
   mobile_no             VARCHAR(16) not null comment '会员手机号码',
   product_id           bigint not null comment '产品id',
   product_name          varchar(64) not null comment '商品名称',
   price                int not null default 0 comment '价格',
   quantity             int not null default 1 comment '数量',
   remark                varchar(512) comment '订单备注',
   inventory_id         bigint comment '库存Id',
   order_status         int not null default 1 comment '订单状态',
   specification        varchar(16)  comment '规格最小长度2',
   delivered            bool default 0 comment '妥投状态',
   take_type            int default 0 comment '提货方式',
   expressid            bigint default 0 comment '快递发货Id',
   is_disable           bool comment '是否删除',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table trade comment '订单';

/*==============================================================*/
/* Table: trade_addr  订单收货信息                             */
/*==============================================================*/
drop table if exists trade_addr;
create table trade_addr
(
   id                   bigint not null comment 'ID',
   tenant_wechatapp_id  bigint not null comment '商家ID',
   user_id              bigint not null comment '会员ID',
   trade_id             bigint not null comment '订单ID',
   recipients            varchar(20) not null comment '收件人，最小2',
   user_tel              varchar(20) not null comment '联系电话,最小10，最大20',
   address               varchar(64) not null comment '收件地址，最小10',
   area                 varchar(32) not null comment '省市区',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table trade_addr comment '订单收货信息';

/*==============================================================*/
/* Table: trade_express  订单快递发货                          */
/*==============================================================*/
drop table if exists trade_express;
create table trade_express
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   trade_id             bigint not null comment '订单Id',
   express_company       varchar(32) not null comment '快递公司，最小4',
   express_no            varchar(32) not null comment '快递单号，最小8',
   remark                varchar(512) comment '备注',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table trade_express comment '订单快递发货';

drop table if exists trade_log;
/*==============================================================*/
/* Table: trade_log     订单日志                                */
/*==============================================================*/
create table trade_log
(
   id                   bigint not null comment 'id',
   trade_id  bigint not null comment '订单ID',
   remark               varchar(4000) comment '说明',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table trade_log comment '订单日志';

/*==============================================================*/
/* Table: trade_take  门店提货                                 */
/*==============================================================*/
drop table if exists trade_take;
create table trade_take
(
   id                   bigint not null comment 'id',
   tenant_wechatapp_id  bigint not null comment '服务号id',
   trade_id             bigint not null comment '订单Id',
   shop_id              bigint not null comment '提货门店',
   shop_name            varchar(32) not null comment '提货门店名称',
   can_take_date        datetime not null comment '可提货日期',
   remark               varchar(512) comment '备注',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   primary key (id)
)DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

alter table trade_take comment '门店提货';

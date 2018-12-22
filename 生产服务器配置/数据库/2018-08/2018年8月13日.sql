
-- 已执行
USE tenant;
ALTER TABLE erp_sales modify column amount decimal(10,2) NOT NULL COMMENT '实收金额';
ALTER TABLE erp_sales_detail modify column quantity decimal(10,2) NOT NULL COMMENT '数量';
ALTER TABLE erp_sales_detail modify column integral decimal(10,2)  COMMENT '积分';
ALTER TABLE erp_sales_detail modify column amount_total decimal(10,2) NOT NULL COMMENT '应付金额，包括了优惠金额，积分抵现等';
ALTER TABLE erp_sales_detail modify column amount_pay decimal(10,2) NOT NULL COMMENT '实际支付的金额，不包括优惠金额';

-- 已执行
use erp_to_platform;
ALTER TABLE erp_to_platform.import_data
  ADD COLUMN status TINYINT UNSIGNED COMMENT '状态: 0-新建,1-成功,2-失败,3-正在导入' AFTER file_size;

UPDATE erp_to_platform.import_data
SET status = 1 WHERE result IS NOT NULL;

use wx_gateway;
UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
用户积分：{{keyword1.DATA}}
通知类型：{{keyword2.DATA}}
{{remark.DATA}}'
WHERE template_no = 'OPENTM207665167';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
物品名称：{{keyword1.DATA}}
物品价格：{{keyword2.DATA}}
兑换时间：{{keyword3.DATA}}
{{remark.DATA}}'
WHERE template_no = 'OPENTM207804704';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
{{productType.DATA}}：{{name.DATA}}
兑换积分：{{points.DATA}}
兑换时间：{{date.DATA}}
{{remark.DATA}}'
WHERE template_no = 'TM00232';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
产品名称：{{keyword1.DATA}}
到期时间：{{keyword2.DATA}}
{{remark.DATA}}'
WHERE template_no = 'OPENTM207251323';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
核销凭证：{{keyword1.DATA}}
商品名称：{{keyword2.DATA}}
核销时间：{{keyword3.DATA}}
商家信息：{{keyword4.DATA}}
{{remark.DATA}}'
WHERE template_no = 'OPENTM407889520';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
礼品名称：{{keyword1.DATA}}
礼品详情：{{keyword2.DATA}}
时间：{{keyword3.DATA}}
{{remark.DATA}}'
WHERE template_no = 'OPENTM411613106';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
订单编号：{{keyword1.DATA}}
提货门店：{{keyword2.DATA}}
门店地址：{{keyword3.DATA}}
提货时间：{{keyword4.DATA}}
{{remark.DATA}}'
WHERE template_no = 'OPENTM414526462';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
商品名称：{{keyword1.DATA}}
快递公司：{{keyword2.DATA}}
快递单号：{{keyword3.DATA}}
收货地址：{{keyword4.DATA}}
{{remark.DATA}}'
WHERE template_no = 'OPENTM405848800';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
订单号：{{keyword1.DATA}}
下单时间：{{keyword2.DATA}}
创建内容：{{keyword3.DATA}}
{{remark.DATA}}'
WHERE template_no = 'OPENTM402063677';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
订单号：{{keyword1.DATA}}
订单状态：{{keyword2.DATA}}
商品名称：{{keyword3.DATA}}
{{remark.DATA}}'
WHERE template_no = 'OPENTM207940503';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
消费时间：{{time.DATA}}
消费门店：{{org.DATA}}
消费类型：{{type.DATA}}
消费金额：{{money.DATA}}
积分增加：{{point.DATA}}
{{remark.DATA}}'
WHERE template_no = 'TM00504';


UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
消费时间：{{time.DATA}}
消费门店：{{org.DATA}}
消费类型：{{type.DATA}}
消费金额：{{money.DATA}}
积分增加：{{point.DATA}}
{{remark.DATA}}'
WHERE template_no = 'TM00504';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
通知内容：{{keyword1.DATA}}
通知时间：{{keyword2.DATA}}
{{remark.DATA}}'
WHERE template_no = 'OPENTM207178317';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
预约内容：{{keyword1.DATA}}
预约时间：{{keyword2.DATA}}
{{remark.DATA}}'
WHERE template_no = 'OPENTM202194461';

UPDATE wx_gateway.wx_sys_template
SET content = '{{first.DATA}}
任务名称：{{keyword1.DATA}}
任务结果：{{keyword2.DATA}}
完成时间：{{keyword3.DATA}}
{{remark.DATA}}'
WHERE template_no = 'OPENTM410037016';


INSERT INTO wx_gateway.wx_sys_template
VALUES (13, 'OPENTM407889520', '消费品 - 消费品', '', '{{first.DATA}}
核销凭证：{{keyword1.DATA}}
商品名称：{{keyword2.DATA}}
核销时间：{{keyword3.DATA}}
商家信息：{{keyword4.DATA}}
{{remark.DATA}}', '核销成功提醒', '', 1, now(), now());



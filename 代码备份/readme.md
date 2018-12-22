
1. 获取所有项目地址：

```sql
SELECT 'sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/'  || p.project_key  ||  '/' || r.name || '.git '|| p.name || '-' || r.name
  FROM repository r INNER JOIN project p ON r.project_id = p.id
  WHERE p.project_type =0
  ORDER BY p.id,r.id
```
2. 备份


```
SELECT 'http://bit.sjfx.com.cn/projects/'  || p.project_key  ||  '/repos/' || r.name || '/browse/service/build.gradle'
  FROM repository r INNER JOIN project p ON r.project_id = p.id
  WHERE p.project_type =0 and p.project_key = 'MAR'
  ORDER BY p.id,r.id
```

http://bit.sjfx.com.cn/projects/MAR/repos/wx-gateway/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/db/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/authorization/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/commonlib/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/erp-sync/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/tenant/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/gateway/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/coupon/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/user-service/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/giftmall/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/sms/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/oss/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/warranty/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/product/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/erp_to_platform/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/h5link/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/comment/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/valueadded/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/position/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/message_push/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/account/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/activity/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/tag/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/custom-page/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/qrcode/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/employee/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/customer/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/sql-script/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/statistics/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/deliver/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/facepass-sync/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/goods/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/payment/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/order/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/booking/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/bespoke/browse/service/build.gradle
http://bit.sjfx.com.cn/projects/MAR/repos/monitor/browse/service/build.gradle
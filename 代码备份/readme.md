
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


sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BASE/id-generator.git base-id-generator
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BASE/eureka.git base-eureka
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BASE/spring-boot-admin.git base-spring-boot-admin
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BASE/config-service.git base-config-service
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BASE/publish-script.git base-publish-script
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BASE/zipkin.git base-zipkin
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BASE/timer.git base-timer
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BASE/mybatis-generator.git base-mybatis-generator
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BASE/proxy.git base-proxy
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BASE/front-statistic.git base-front-statistic
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/wxgateway.git market-wxgateway
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/db.git market-db
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/authorization.git market-authorization
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/commonlib.git market-commonlib
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/erp-sync.git market-erp-sync
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/tenant.git market-tenant
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/gateway.git market-gateway
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/coupon.git market-coupon
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/user.git market-user
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/giftmall.git market-giftmall
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/sms.git market-sms
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/oss.git market-oss
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/warranty.git market-warranty
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/product.git market-product
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/erp-to-platform.git market-erp-to-platform
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/h5link.git market-h5link
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/comment.git market-comment
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/valueadded.git market-valueadded
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/position.git market-position
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/message-push.git market-message-push
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/account.git market-account
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/activity.git market-activity
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/tag-service.git market-tag-service
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/customize-page.git market-customize-page
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/qrcode.git market-qrcode
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/employee.git market-employee
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/customer.git market-customer
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/sql-script.git market-sql-script
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/statistics.git market-statistics
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/deliver.git market-deliver
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/facepass-sync.git market-facepass-sync
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/goods.git market-goods
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/payment.git market-payment
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/order.git market-order
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/booking.git market-booking
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/bespoke.git market-bespoke
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/monitor.git market-monitor
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/agency.git market-agency
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/instant-messaging.git market-instant-messaging
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/corpwx.git market-corpwx
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/export.git market-export
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/MAR/oaflow.git market-oaflow
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/VUE/Portal.git vue-Portal
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/VUE/Mobile.git vue-Mobile
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/VUE/sjfx.git vue-sjfx
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/VUE/web-statistics.git vue-web-statistics
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/VUE/customer-mini-app.git vue-customer-mini-app
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/VUE/sjfx-website.git vue-sjfx-website
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/VUE/doc.git vue-doc
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/VUE/web-pay.git vue-web-pay
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/VUE/web-employee.git vue-web-employee
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/VUE/modules.git vue-modules
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/VUE/web-activity.git vue-web-activity
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/VUE/miniapp-flow.git vue-miniapp-flow
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CONFIG/market-dev-configs.git config-market-dev-configs
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CONFIG/market-configs.git config-market-configs
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CUSTOM/lubin-product-source.git customization-lubin-product-source
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CUSTOM/lubin-product-source-web.git customization-lubin-product-source-web
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CUSTOM/sjfx-website.git customization-sjfx-website
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CUSTOM/frseller_reward.git customization-frseller_reward
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CUSTOM/frseller_reward_mobile.git customization-frseller_reward_mobile
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CUSTOM/jpmcts.git customization-jpmcts
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CUSTOM/jpmcts-web.git customization-jpmcts-web
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CUSTOM/jjsj_task_web.git customization-jjsj_task_web
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CUSTOM/jjsj_task_sql.git customization-jjsj_task_sql
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CUSTOM/jjsj_partner.git customization-jjsj_partner
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/CUSTOM/oa-partner.git customization-oa-partner
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BIGDATA/docker-hadoop.git bigdata-docker-hadoop
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BIGDATA/docker-hbase.git bigdata-docker-hbase
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/BIGDATA/docker-spark.git bigdata-docker-spark
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/V/sjfx.platform.git v2-sjfx.platform
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/V/sjfx.sjono.git v2-sjfx.sjono
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/V/sjfx.oa.git v2-sjfx.oa
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/V/other.git v2-other
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/V/sjfx.platform.code.git v2-sjfx.platform.code
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/V/sjfx.sjono.code.git v2-sjfx.sjono.code
sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/V/sjfx.oa.code.git v2-sjfx.oa.code
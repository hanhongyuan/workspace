#/bin/sh
time=`date +%Y%m%d-%H%M%S`

databasestr="account activity_service authorization_service comment_service coupon_service customize_page employee erp_sync erp_to_platform gift_mail h5link message_push oss position qrcode_service sms tenant user_service value_added warranty_service wx_gateway"

mysqldump -hrm-bp1qn4bl8d8p9mnm4.mysql.rds.aliyuncs.com --skip-add-locks -ubackuper -psjfx@2018 --databases $databasestr | gzip > db-$time.sql.gz


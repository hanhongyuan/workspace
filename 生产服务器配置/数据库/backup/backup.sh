#/bin/sh
timedir=/opt/dbback/`date +%Y%m%d-%H%M%S`
databasestr=(account goods activity_service authorization_service comment_service coupon_service customer customize_page employee erp_sync erp_to_platform facepass_sync gift_mail goods h5link message_push oss payment position qrcode_service sms statistic tenant user_service value_added warranty_service wx_gateway)
mkdir -p $timedir
for dbname in ${databasestr[@]}
  do
    echo ">>> ${dbname}"
    bash /opt/dbback/backbydb.sh ${dbname} ${timedir}
  done

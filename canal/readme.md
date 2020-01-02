
run.sh -e canal.instance.master.address=rr-bp13k3q7292ce5t6k9o.mysql.rds.aliyuncs.com:3306 \
         -e canal.instance.dbUsername=sjfxadmin \
         -e canal.instance.dbPassword=f7na4ZQmCcXhx5gGKsr3 \
         -e canal.instance.connectionCharset=UTF-8 \
         -e canal.instance.tsdb.enable=true \
         -e canal.instance.gtidon=false \
         -e canal.instance.filter.regex=.*\\..* 
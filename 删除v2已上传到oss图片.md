select concat( 'rm -f ./',REPLACE(REPLACE(v2_img_url,'https://jwt.sjfx.com.cn/',''),'http://jwt.sjfx.com.cn/','')) from warranty_service.warranty where warranty_img_url is NOT NULL  and v2_img_url is not NULL
and v2_img_url LIKE '%upfiles/2019%'

# select concat( 'rm -f ./',REPLACE(REPLACE(v2_img_url,'https://jwt.sjfx.com.cn/',''),'http://jwt.sjfx.com.cn/','')) from warranty_service.warranty where warranty_img_url is NOT NULL  and v2_img_url is not NULL
# and v2_img_url LIKE '%upfiles/2017%'


# select v2_img_url from warranty_service.warranty where warranty_img_url is NOT NULL  and v2_img_url is not NULL
# and v2_img_url LIKE '%upfiles/20180101%'

vmware-vdiskmanager -R "E:\Virtual Machines\newdev\Ubuntu 64 位 harbor-cl1-000003.vmdk"
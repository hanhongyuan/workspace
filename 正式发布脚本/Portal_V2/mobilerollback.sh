# 回滚supervisord配置 重启supervisord
rm -rf /etc/supervisor/conf.d/Mobile.conf
cp /mnt/publish_Portal/$1/Mobile.conf.baksupervisord /etc/supervisor/conf.d/Mobile.conf
systemctl restart supervisor
# 修改nginx配置 重启nginx
rm -rf /etc/nginx/conf.d/Mobile.conf
cp /mnt/publish_Portal/$1/Mobile.conf.baknginx /etc/nginx/conf.d/Mobile.conf

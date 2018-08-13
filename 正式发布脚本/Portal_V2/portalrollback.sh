# 回滚supervisord配置 重启supervisord
rm -rf /etc/supervisor/conf.d/Portal.conf
cp /mnt/publish_Portal/$1/Portal.conf.baksupervisord /etc/supervisor/conf.d/Portal.conf
systemctl restart supervisor
# 修改nginx配置 重启nginx
rm -rf /etc/nginx/conf.d/Portal.conf
cp /mnt/publish_Portal/$1/Portal.conf.baknginx /etc/nginx/conf.d/Portal.conf

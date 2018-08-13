# 回滚supervisord配置 重启supervisord
rm -rf /etc/supervisor/conf.d/WebApi.conf
cp /mnt/publish_Portal/$1/WebApi.conf.baksupervisord /etc/supervisor/conf.d/WebApi.conf
systemctl restart supervisor
# 修改nginx配置 重启nginx
rm -rf /etc/nginx/conf.d/WebApi.conf
cp /mnt/publish_Portal/$1/WebApi.conf.baknginx /etc/nginx/conf.d/WebApi.conf
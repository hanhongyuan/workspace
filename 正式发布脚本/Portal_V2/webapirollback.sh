# �ع�supervisord���� ����supervisord
rm -rf /etc/supervisor/conf.d/WebApi.conf
cp /mnt/publish_Portal/$1/WebApi.conf.baksupervisord /etc/supervisor/conf.d/WebApi.conf
systemctl restart supervisor
# �޸�nginx���� ����nginx
rm -rf /etc/nginx/conf.d/WebApi.conf
cp /mnt/publish_Portal/$1/WebApi.conf.baknginx /etc/nginx/conf.d/WebApi.conf
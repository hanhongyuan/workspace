# �ع�supervisord���� ����supervisord
rm -rf /etc/supervisor/conf.d/Portal.conf
cp /mnt/publish_Portal/$1/Portal.conf.baksupervisord /etc/supervisor/conf.d/Portal.conf
systemctl restart supervisor
# �޸�nginx���� ����nginx
rm -rf /etc/nginx/conf.d/Portal.conf
cp /mnt/publish_Portal/$1/Portal.conf.baknginx /etc/nginx/conf.d/Portal.conf

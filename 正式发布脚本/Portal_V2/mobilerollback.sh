# �ع�supervisord���� ����supervisord
rm -rf /etc/supervisor/conf.d/Mobile.conf
cp /mnt/publish_Portal/$1/Mobile.conf.baksupervisord /etc/supervisor/conf.d/Mobile.conf
systemctl restart supervisor
# �޸�nginx���� ����nginx
rm -rf /etc/nginx/conf.d/Mobile.conf
cp /mnt/publish_Portal/$1/Mobile.conf.baknginx /etc/nginx/conf.d/Mobile.conf

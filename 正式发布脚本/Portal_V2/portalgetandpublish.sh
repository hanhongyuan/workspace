# 创建基本目录
mkdir -p /mnt/publish_Portal/$1/
cd /mnt/publish_Portal/$1/
# 连接FTP下载文件
HOST=47.94.47.162
USER=sjfxdev
PASSWD=VwAVVc%DcEA%^zCg

export SSHPASS=$PASSWD
sshpass -e sftp -oBatchMode=no -b - $USER@$HOST << !
   get /mnt/publish_Portal/$1/Portal.zip
   bye
!

# 解压
unzip /mnt/publish_Portal/$1/Portal.zip -d /
rm -rf /mnt/publish_Portal/$1/Portal.zip

# ???supervisord???? ????supervisord
rm -rf /mnt/publish_Portal/$1/Portal.conf.baksupervisord
cp /etc/supervisor/conf.d/Portal.conf /mnt/publish_Portal/$1/Portal.conf.baksupervisord
rm -rf /etc/supervisor/conf.d/Portal.conf
touch /etc/supervisor/conf.d/Portal.conf
echo  "[program:Portal]
command=/usr/share/dotnet/dotnet Portal.dll ; 杩愯绋嬪簭鐨勫懡浠?
directory=/mnt/publish_Portal/$1/Portal/ ; 鍛戒护鎵ц鐨勭洰褰?
autorestart=true ; 绋嬪簭鎰忓閫�鍑烘槸鍚﹁嚜鍔ㄩ噸鍚?
stderr_logfile=/var/log/Portal.err.log ; 閿欒鏃ュ織鏂囦欢
stdout_logfile=/var/log/Portal.out.log ; 杈撳嚭鏃ュ織鏂囦欢
environment=ASPNETCORE_ENVIRONMENT=Production ; 杩涚▼鐜鍙橀噺
user=root ; 杩涚▼鎵ц鐨勭敤鎴疯韩浠?
stopsignal=INT" >> /etc/supervisor/conf.d/Portal.conf

systemctl restart supervisor

# ???nginx???? ????nginx
rm -rf /mnt/publish_Portal/$1/Portal.conf.baknginx
cp /etc/nginx/conf.d/Portal.conf /mnt/publish_Portal/$1/Portal.conf.baknginx
rm -rf /etc/nginx/conf.d/Portal.conf
touch /etc/nginx/conf.d/Portal.conf

echo  "
server {
    server_name jwt.sjfx.com.cn;
    root /mnt/publish_Portal/$1/Portal;

    listen 443 ssl http2;
    listen  80;
    listen [::]:443 ssl http2;
    ssl_certificate /etc/nginx/ssl/jwt.cer;
    ssl_certificate_key /etc/nginx/ssl/jwt.key;
    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout  10m;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;   

    location / {
#    proxy_pass         http://Portalupstream; 
        proxy_pass http://localhost:5002;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection keep-alive;
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
	 location /upfiles {  
       root /mnt/www/;  
    } 
}" >> /etc/nginx/conf.d/Portal.conf


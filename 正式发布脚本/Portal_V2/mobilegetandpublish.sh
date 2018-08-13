# 创建基本目录
mkdir -p /mnt/publish_Portal/$1/
cd /mnt/publish_Portal/$1/
# 连接FTP下载文件
HOST=47.94.47.162
USER=sjfxdev
PASSWD=VwAVVc%DcEA%^zCg

export SSHPASS=$PASSWD
sshpass -e sftp -oBatchMode=no -b - $USER@$HOST << !
   get /mnt/publish_Portal/$1/Mobile.zip
   bye
!

# 解压
unzip /mnt/publish_Portal/$1/Mobile.zip -d /
rm -rf /mnt/publish_Portal/$1/Mobile.zip


# 修改supervisord配置 重启supervisord
rm -rf /mnt/publish_Portal/$1/Mobile.conf.baksupervisord
cp /etc/supervisor/conf.d/Mobile.conf /mnt/publish_Portal/$1/Mobile.conf.baksupervisord
rm -rf /etc/supervisor/conf.d/Mobile.conf
touch /etc/supervisor/conf.d/Mobile.conf
echo  "[program:Mobile]
command=/usr/share/dotnet/dotnet WX.Mobile.dll ; 杩愯绋嬪簭鐨勫懡浠?
directory=/mnt/publish_Portal/$1/Mobile/ ; 鍛戒护鎵ц鐨勭洰褰?
autorestart=true ; 绋嬪簭鎰忓閫�鍑烘槸鍚﹁嚜鍔ㄩ噸鍚?
stderr_logfile=/var/log/Mobile.err.log ; 閿欒鏃ュ織鏂囦欢
stdout_logfile=/var/log/Mobile.out.log ; 杈撳嚭鏃ュ織鏂囦欢
environment=ASPNETCORE_ENVIRONMENT=Production ; 杩涚▼鐜鍙橀噺
user=root ; 杩涚▼鎵ц鐨勭敤鎴疯韩浠?
stopsignal=INT" >> /etc/supervisor/conf.d/Mobile.conf

systemctl restart supervisor

# 修改nginx配置 重启nginx
rm -rf /mnt/publish_Portal/$1/Mobile.conf.baknginx
cp /etc/nginx/conf.d/Mobile.conf /mnt/publish_Portal/$1/Mobile.conf.baknginx
rm -rf /etc/nginx/conf.d/Mobile.conf
touch /etc/nginx/conf.d/Mobile.conf

echo  "
server {
    server_name mjwt.sjfx.com.cn *.mjwt.sjfx.com.cn;
    root /mnt/publish_Portal/$1/Mobile/;
    listen  80;
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    ssl_certificate "/etc/nginx/ssl/mjwt.cer";
    ssl_certificate_key "/etc/nginx/ssl/mjwt.key";
    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout  10m;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;      
    
    
    location / {
        proxy_pass http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection keep-alive;
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
    location /upfiles {  
       root /mnt/www/;  
    }  
}" >> /etc/nginx/conf.d/Mobile.conf


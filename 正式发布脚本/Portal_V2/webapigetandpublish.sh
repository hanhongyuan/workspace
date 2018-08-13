# 创建基本目录
mkdir -p /mnt/publish_Portal/$1/
cd /mnt/publish_Portal/$1/
# 连接FTP下载文件
HOST=47.94.47.162
USER=sjfxdev
PASSWD=VwAVVc%DcEA%^zCg

export SSHPASS=$PASSWD
sshpass -e sftp -oBatchMode=no -b - $USER@$HOST << !
   get /mnt/publish_Portal/$1/WebApi.zip
   bye
!

# 解压
unzip /mnt/publish_Portal/$1/WebApi.zip -d /
rm -rf /mnt/publish_Portal/$1/WebApi.zip

# 修改supervisord配置 重启supervisord
rm -rf /mnt/publish_Portal/$1/WebApi.conf.baksupervisord
cp /etc/supervisor/conf.d/WebApi.conf /mnt/publish_Portal/$1/WebApi.conf.baksupervisord
rm -rf /etc/supervisor/conf.d/WebApi.conf
touch /etc/supervisor/conf.d/WebApi.conf
echo  "[program:WebApi]
command=/usr/share/dotnet/dotnet SJFX.WebApi.dll ; 杩愯绋嬪簭鐨勫懡浠?
directory=/mnt/publish_Portal/$1/WebApi/ ; 鍛戒护鎵ц鐨勭洰褰?
autorestart=true ; 绋嬪簭鎰忓閫�鍑烘槸鍚﹁嚜鍔ㄩ噸鍚?
stderr_logfile=/var/log/WebApi.err.log ; 閿欒鏃ュ織鏂囦欢
stdout_logfile=/var/log/WebApi.out.log ; 杈撳嚭鏃ュ織鏂囦欢
environment=ASPNETCORE_ENVIRONMENT=Production ; 杩涚▼鐜鍙橀噺
user=root ; 杩涚▼鎵ц鐨勭敤鎴疯韩浠?stopsignal=INT" >> /etc/supervisor/conf.d/WebApi.conf

systemctl restart supervisor

# 修改nginx配置 重启nginx
rm -rf /mnt/publish_Portal/$1/WebApi.conf.baknginx
cp /etc/nginx/conf.d/WebApi.conf /mnt/publish_Portal/$1/WebApi.conf.baknginx
rm -rf /etc/nginx/conf.d/WebApi.conf
touch /etc/nginx/conf.d/WebApi.conf

echo  "
server {
    server_name api.sjfx.com.cn;
    root /mnt/publish_Portal/$1/WebApi;
    listen 80;
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    ssl_certificate "/etc/nginx/ssl/api.cer";
    ssl_certificate_key "/etc/nginx/ssl/api.key";
    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout  10m;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;      
    
    location / {
        proxy_pass http://localhost:8001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection keep-alive;
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
	location /upfiles {  
       root /mnt/www/;  
    }
}" >> /etc/nginx/conf.d/WebApi.conf


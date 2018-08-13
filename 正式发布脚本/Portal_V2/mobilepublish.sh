# �޸�supervisord���� ����supervisord
rm -rf /mnt/publish_Portal/$1/Mobile.conf.baksupervisord
cp /etc/supervisor/conf.d/Mobile.conf /mnt/publish_Portal/$1/Mobile.conf.baksupervisord
rm -rf /etc/supervisor/conf.d/Mobile.conf
touch /etc/supervisor/conf.d/Mobile.conf
echo  "[program:Mobile]
command=/usr/share/dotnet/dotnet WX.Mobile.dll ; 运行程序的命�?
directory=/mnt/publish_Portal/$1/Mobile/ ; 命令执行的目�?
autorestart=true ; 程序意外退出是否自动重�?
stderr_logfile=/var/log/Mobile.err.log ; 错误日志文件
stdout_logfile=/var/log/Mobile.out.log ; 输出日志文件
environment=ASPNETCORE_ENVIRONMENT=Production ; 进程环境变量
user=root ; 进程执行的用户身�?
stopsignal=INT" >> /etc/supervisor/conf.d/Mobile.conf

systemctl restart supervisor

# �޸�nginx���� ����nginx
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


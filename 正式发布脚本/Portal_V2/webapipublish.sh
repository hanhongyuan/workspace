# �޸�supervisord���� ����supervisord
rm -rf /mnt/publish_Portal/$1/WebApi.conf.baksupervisord
cp /etc/supervisor/conf.d/WebApi.conf /mnt/publish_Portal/$1/WebApi.conf.baksupervisord
rm -rf /etc/supervisor/conf.d/WebApi.conf
touch /etc/supervisor/conf.d/WebApi.conf
echo  "[program:WebApi]
command=/usr/share/dotnet/dotnet SJFX.WebApi.dll ; 运行程序的命�?
directory=/mnt/publish_Portal/$1/WebApi/ ; 命令执行的目�?
autorestart=true ; 程序意外退出是否自动重�?
stderr_logfile=/var/log/WebApi.err.log ; 错误日志文件
stdout_logfile=/var/log/WebApi.out.log ; 输出日志文件
environment=ASPNETCORE_ENVIRONMENT=Production ; 进程环境变量
user=root ; 进程执行的用户身�?stopsignal=INT" >> /etc/supervisor/conf.d/WebApi.conf

systemctl restart supervisor

# �޸�nginx���� ����nginx
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


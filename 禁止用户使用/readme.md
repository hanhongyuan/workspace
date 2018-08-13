# 禁止未续费用户继续使用平台

修改了服务器（120.27.248.112）nginx配置，在文件`Portal.conf`中添加了一个节点,不禁用可以删除

```conf
server {
    server_name wx01b12514bcedb671.mjwt.sjfx.com.cn;
    root /mnt/publish_Portal/12268/Portal;

    listen 443 ssl http2;
    listen  80;
    listen [::]:443 ssl http2;
    ssl_certificate /etc/nginx/ssl/jwt.cer;
    ssl_certificate_key /etc/nginx/ssl/jwt.key;
    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout  10m;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;   

    location = /40x.html
     {
        }
}
```

后续改进

1. 增加专门页面提示用户续费。

2. 单独出一个配置文件专门处理此类型需求。
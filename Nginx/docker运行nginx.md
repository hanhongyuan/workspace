1. docker pull nginx
2. docker run --name nginx -v /mnt/nginx/nginx.conf:/etc/nginx/nginx.conf:ro --restart=unless-stopped -d nginx
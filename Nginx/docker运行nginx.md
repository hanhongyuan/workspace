1. docker pull nginx
2. docker run --name nginx -v /mnt/nginx/nginx.conf:/etc/nginx/nginx.conf:ro --restart=unless-stopped -d nginx


docker run --name nginx -v /opt/nginx/conf:/etc/nginx:ro \
-v /web:/web -v /opt/nginx/logs:/var/log/nginx --restart=unless-stopped -d nginx

docker run --name some-nginx -d some-content-nginx

docker rm -f nginx
docker run --name nginx -v /opt/nginx/conf:/etc/nginx:ro --network=host \
-v /web:/web -v /opt/nginx/logs:/var/log/nginx --restart=unless-stopped -d nginx:1.17-perl

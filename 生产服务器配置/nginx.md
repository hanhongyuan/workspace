 1.主机
docker container run \
  -d \
  --name nginx \
  nginx:1.14.0

docker cp nginx:/etc/nginx /opt/
mkdir /web
mkdir -p /opt/nginx/logs
chmod 777 -R /opt/nginx
docker rm -f nginx
docker container run \
  --name nginx \
  -p 80:80 \
  --restart=unless-stopped \
  -v /web:/mnt \
  -v /opt/nginx:/etc/nginx \
  -v /opt/nginx/logs:/var/log/nginx \
  -d \
  nginx:1.14.0

2. 从机
docker container run \
  -d \
  --name nginx \
  nginx:1.14.0

docker cp nginx:/etc/nginx /opt/
mkdir /web
mkdir -p /opt/nginx/logs
chmod 777 -R /opt/nginx
docker rm -f nginx
docker container run \
  --name nginx \
  -p 10801:10801 \
  -v /web:/web \
  -v /opt/nginx:/etc/nginx \
  -v /opt/nginx/logs:/var/log/nginx \
  -d \
  nginx:1.14.0
docker stop nginx

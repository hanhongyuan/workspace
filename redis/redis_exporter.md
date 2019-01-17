redis_exporter

docker run -d --name redis_exporter \
-e "REDIS_ADDR=redis://172.16.250.149:16300" \
-e "REDIS_PASSWORD=Sjfx2176109" \
-p 19121:9121 oliver006/redis_exporter

docker rm -f redis_exporter && docker run -d --name redis_exporter \
-e "REDIS_ADDR=redis://192.168.1.22:16310" \
-e "REDIS_PASSWORD=123456" \
-p 19121:9121 oliver006/redis_exporter

docker rm -f redis_exporter
docker run --name redis-stat -p 19121:63790 -d insready/redis-stat --server 192.168.1.23:16300/123456

docker rm -f redis-live

docker rm -f redmon
docker run -p 19122:4567  --name redmon -d  vieux/redmon -r redis://:123456@192.168.1.23:16300 -s admin:sjfx123456

docker rm -f redmon
docker run -p 19122:4567  --name redmon -d  vieux/redmon -r redis://:Sjfx2176109@172.16.250.149:16300 -s admin:sjfx2019

docker rm -f redis-live
docker run --name redis-live -p 19123:8888 \
-v /root/redis-live.conf:/redislive/src/redis-live.conf:ro \
 -d snakeliwei/redislive


docker run --name redis-stat -p 19121:63790 -d insready/redis-stat --server 172.16.250.149:16300/Sjfx2176109 -v
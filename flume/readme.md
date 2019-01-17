
docker rm -f flume

docker run -d --name flume \
-v /root/conf/flume-conf.properties:/apache-flume/conf/flume-conf.properties \
-v /sjfxlogs:/sjfxlogs \
-v /flumeout:/apache-flume/logs \
 mengluo668/flume

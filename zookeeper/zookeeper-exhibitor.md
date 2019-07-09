docker run -p 8181:8181 -p 2181:2181 -p 2888:2888 -p 3888:3888 \

    -e HOSTNAME=<host> \
    mbabineau/zookeeper-exhibitor:latest

docker rm -f exhibitor
docker run -p 18181:8181 --name exhibitor axelspringer/exhibitor

docker rm -f zkmonitor
docker run -d -p 18181:80 --name zkmonitor -e ZOOKEEPER_HOST=192.168.1.22 -e ZOOKEEPER_PORT=15301  nextdoor/zkmonitor -z 192.168.1.22:15301
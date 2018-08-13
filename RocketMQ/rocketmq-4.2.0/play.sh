docker rm -f rmqnamesrv
docker rm -f rmqbroker

docker rmi sjfx/rocketmq-namesrv:4.2.0
docker rmi sjfx/rocketmq-broker:4.2.0

docker-compose -f docker-compose.yml build

docker-compose -f docker-compose.yml up -d

sudo docker build -t sjfx/rocketmq-namesrv:4.2.0 ./namesrv
sudo docker build -t sjfx/rocketmq-broker:4.2.0 ./broker


sudo docker run -d -p 9876:9876 --name rmqnamesrv  sjfx/rocketmq-namesrv:4.2.0
sudo docker run -d -p 10911:10911 -p 10909:10909 --name rmqbroker --link rmqnamesrv:rmqnamesrv -e "NAMESRV_ADDR=rmqnamesrv:9876" sjfx/rocketmq-broker:4.2.0


windows:

$env:NAMESRV_ADDR="192.168.181.181:9876"

ls env:*

bin/tools.cmd org.apache.rocketmq.example.quickstart.Producer


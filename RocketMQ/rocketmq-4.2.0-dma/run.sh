docker rm -f rmqnamesrv
docker rm -f rmqbroker
docker rm -f rmqconsole
docker rmi sjfx/rocketmq-namesrv:4.2.0
docker rmi sjfx/rocketmq-broker:4.2.0
docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up -d

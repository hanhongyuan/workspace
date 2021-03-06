docker build -t sjfx/rocketmq-namesrv:4.2.0 ./namesrv

docker build -t sjfx/rocketmq-broker:4.2.0 ./broker

docker run -d -p 9876:9876 --name rmqnamesrv  sjfx/rocketmq-namesrv:4.2.0

docker run -d -p 10911:10911 -p 10909:10909 --name rmqbroker --link rmqnamesrv:rmqnamesrv -e "NAMESRV_ADDR=rmqnamesrv:9876" sjfx/rocketmq-broker:4.2.0


https://rocketmq.apache.org/docs/quick-start/

mkdir rocketmq-all-4.2.0
cd rocketmq-all-4.2.0

wget http://apache.communilink.net/rocketmq/4.2.0/rocketmq-all-4.2.0-bin-release.zip
unzip rocketmq-all-4.2.0-bin-release.zip
rm -rf rocketmq-all-4.2.0-bin-release.zip

Start Name Server

nohup sh bin/mqnamesrv &

Start Broker

nohup sh bin/mqbroker -n localhost:9876 &


sh bin/mqshutdown broker

sh bin/mqshutdown namesrv

docker build -t sjfx/rocketmq:4.2.0 . 

mkdir -R /mnt/rocketmq/conf
mkdir -R /mnt/rocketmq/log
chmod 777 -R /mnt/rocketmq/

docker rm -f rocketmq
docker run -d -p 5432:9876 -v /mnt/rocketmq/conf:/opt/rocketmq-all-4.2.0/conf:ro -v /mnt/rocketmq/log:/root/logs/rocketmqlogs --name rocketmq sjfx/rocketmq:4.2.0

docker run -it --rm sjfx/rocketmq:4.2.0 bash

docker run -d  sjfx/rocketmq:4.2.0

curl https://dist.apache.org/repos/dist/release/rocketmq/4.2.0/rocketmq-all-4.2.0-bin-release.zip -o rocketmq.zip
curl https://dist.apache.org/repos/dist/release/rocketmq/4.2.0/rocketmq-all-4.2.0-bin-release.zip -o rocketmq.zip \
          && unzip rocketmq.zip \
          && rm rocketmq.zip

sh ./broker/bin/mqbroker -n 127.0.0.1:9876 -c  ./broker/conf/broker.properties

docker run -it --rm sjfx/rocketmq-broker:4.2.0 bash

rocketmq-console-ng

docker run -d --network 420incubating_default --restart=unless-stopped --link rmqbroker:rmqbroker --link rmqnamesrv:rmqnamesrv  -e "JAVA_OPTS=-Drocketmq.namesrv.addr=rmqnamesrv:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false" -p 9011:8080 -t styletang/rocketmq-console-ng

docker run -d --name rocketmq-console-dev --network 420incubating_default --link rmqnamesrv:rmqnamesrv  -e "JAVA_OPTS=-Drocketmq.namesrv.addr=rmqnamesrv:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false" -p 9011:8080 -t styletang/rocketmq-console-ng

docker run -d --name rocketmq-console-test --network 420incubatingtest_default --link namesrvtest:namesrvtest  -e "JAVA_OPTS=-Drocketmq.namesrv.addr=namesrvtest:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false" -p 9012:8080 -t styletang/rocketmq-console-ng 

docker run -d --name rocketmq-console-test --network 420incubating_default --link rmqnamesrv:rmqnamesrv  -e "JAVA_OPTS=-Drocketmq.namesrv.addr=rmqnamesrv:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false" -p 9011:8080 -t styletang/rocketmq-console-ng

curl https://dist.apache.org/repos/dist/release/rocketmq/4.2.0/rocketmq-all-4.2.0-bin-release.zip -o broker/rocketmq.zip
unzip broker/rocketmq.zip -d /root/4.2.0-incubating/broker
rm broker/rocketmq.zip

curl https://dist.apache.org/repos/dist/release/rocketmq/4.2.0/rocketmq-all-4.2.0-bin-release.zip -o namesrv/rocketmq.zip
unzip namesrv/rocketmq.zip -d /root/4.2.0-incubating/namesrv
rm namesrv/rocketmq.zip

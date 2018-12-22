sudo docker build -t registry-vpc.cn-hangzhou.aliyuncs.com/sjfxv3/redis-cluster-master:4.0.9 ./master
sudo docker build -t registry-vpc.cn-hangzhou.aliyuncs.com/sjfxv3/redis-cluster-slave:4.0.9 ./slave
sudo docker build -t registry-vpc.cn-hangzhou.aliyuncs.com/sjfxv3/redis-cluster-sentinels:4.0.9 ./sentinels
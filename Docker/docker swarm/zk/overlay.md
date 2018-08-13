1. 创建 overlay 网络

docker network create -d overlay zookeeper

2. 在机器1创建镜像
mkdir -p /opt/zookeeper/data
mkdir -p /opt/zookeeper/logs
mkdir -p /opt/zookeeper/conf
chmod 777 -R /opt/zookeeper
cat > /opt/zookeeper/conf/zoo.cfg << EOF
clientPort=2181
dataDir=/data
dataLogDir=/datalog
tickTime=2000
initLimit=5
syncLimit=2
maxClientCnxns=60
server.1=zoo1:2888:3888
server.2=zoo2:2888:3888
server.3=zoo3:2888:3888
EOF

echo 1 >/opt/zookeeper/data/myid

docker rm -f zoo
docker run -tid --restart=unless-stopped \
    -p 2181:2181 \
    -p 2888:2888 \
    -p 3888:3888 \
    --net=zookeeper \
    --hostname=zoo1 \
    -v /opt/zookeeper/data:/data \
    -v /opt/zookeeper/logs:/datalog \
    -v /opt/zookeeper/conf:/conf \
    --name=zoo \
   --privileged=true \
    zookeeper:3.4.12

2. 在机器1创建镜像
mkdir -p /opt/zookeeper/data
mkdir -p /opt/zookeeper/logs
mkdir -p /opt/zookeeper/conf
chmod 777 -R /opt/zookeeper
cat > /opt/zookeeper/conf/zoo.cfg << EOF
clientPort=2181
dataDir=/data
dataLogDir=/datalog
tickTime=2000
initLimit=5
syncLimit=2
maxClientCnxns=60
server.1=zoo1:2888:3888
server.2=zoo2:2888:3888
server.3=zoo3:2888:3888
EOF

echo 2 >/opt/zookeeper/data/myid

docker rm -f zoo
docker run -tid --restart=unless-stopped \
    -p 2181:2181 \
    -p 2888:2888 \
    -p 3888:3888 \
    --network=zookeeper \
    --host=zoo2 \
    -v /opt/zookeeper/data:/data \
    -v /opt/zookeeper/logs:/datalog \
    -v /opt/zookeeper/conf:/conf \
    --name=zoo \
   --privileged=true \
    zookeeper:3.4.12

2. 在机器1创建镜像
mkdir -p /opt/zookeeper/data
mkdir -p /opt/zookeeper/logs
mkdir -p /opt/zookeeper/conf
chmod 777 -R /opt/zookeeper
cat > /opt/zookeeper/conf/zoo.cfg << EOF
clientPort=2181
dataDir=/data
dataLogDir=/datalog
tickTime=2000
initLimit=5
syncLimit=2
maxClientCnxns=60
server.1=zoo1:2888:3888
server.2=zoo2:2888:3888
server.3=zoo3:2888:3888
EOF

echo 3 >/opt/zookeeper/data/myid

docker rm -f zoo
docker run -tid --restart=unless-stopped \
    -p 2181:2181 \
    -p 2888:2888 \
    -p 3888:3888 \
    --network=zookeeper \
    --host=zoo3 \
    -v /opt/zookeeper/data:/data \
    -v /opt/zookeeper/logs:/datalog \
    -v /opt/zookeeper/conf:/conf \
    --name=zoo \
   --privileged=true \
    zookeeper:3.4.12

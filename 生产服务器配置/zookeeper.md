1. 基本镜像
docker pull zookeeper:3.4.12
2. 在机器1创建镜像
mkdir -p /opt/zookeeper/data
mkdir -p /opt/zookeeper/logs
mkdir -p /opt/zookeeper/conf
chmod 777 -R /opt/zookeeper
cat > /opt/zookeeper/conf/zoo.cfg << EOF
clientPort=15300
dataDir=/data
dataLogDir=/datalog
tickTime=2000
initLimit=5
syncLimit=2
maxClientCnxns=60
server.1=172.16.224.160:2888:3888
server.2=172.16.224.161:2888:3888
server.3=172.16.84.200:2888:3888
EOF

echo 1 >/opt/zookeeper/data/myid

docker rm -f zoo
docker run -tid --restart=unless-stopped \
    --net=host \
    -v /opt/zookeeper/data:/data \
    -v /opt/zookeeper/logs:/datalog \
    -v /opt/zookeeper/conf:/conf \
    --name=zoo \
   --privileged=true \
    zookeeper:3.4.12

3. 在机器2创建镜像
mkdir -p /opt/zookeeper/data
mkdir -p /opt/zookeeper/logs
mkdir -p /opt/zookeeper/conf
chmod 777 -R /opt/zookeeper
cat > /opt/zookeeper/conf/zoo.cfg << EOF
clientPort=15300
dataDir=/data
dataLogDir=/datalog
tickTime=2000
initLimit=5
syncLimit=2
maxClientCnxns=60
server.1=172.16.224.160:2888:3888
server.2=172.16.224.161:2888:3888
server.3=172.16.84.200:2888:3888
EOF

echo 2 >/opt/zookeeper/data/myid

docker rm -f zoo
docker run -tid --restart=unless-stopped \
    --net=host \
    -v /opt/zookeeper/data:/data \
    -v /opt/zookeeper/logs:/datalog \
    -v /opt/zookeeper/conf:/conf \
    --name=zoo \
   --privileged=true \
    zookeeper:3.4.12

4. 在机器2创建镜像
mkdir -p /opt/zookeeper/data
mkdir -p /opt/zookeeper/logs
mkdir -p /opt/zookeeper/conf
chmod 777 -R /opt/zookeeper
cat > /opt/zookeeper/conf/zoo.cfg << EOF
clientPort=15300
dataDir=/data
dataLogDir=/datalog
tickTime=2000
initLimit=5
syncLimit=2
maxClientCnxns=60
server.1=172.16.224.160:2888:3888
server.2=172.16.224.161:2888:3888
server.3=172.16.84.200:2888:3888
EOF

echo 3 >/opt/zookeeper/data/myid

docker rm -f zoo
docker run -tid --restart=unless-stopped \
    --net=host \
    -v /opt/zookeeper/data:/data \
    -v /opt/zookeeper/logs:/datalog \
    -v /opt/zookeeper/conf:/conf \
    --name=zoo \
   --privileged=true \
    zookeeper:3.4.12




    echo stat|nc 192.168.181.190 2181

echo stat|nc 172.16.224.160 15300
echo stat|nc 172.16.224.161 15300
echo stat|nc 172.16.84.200 15300


    docker rm -f zoo
    
    docker run -tid --restart=unless-stopped \
    -p 2181:2181 \
    -p 2888:2888 \
    -p 3888:3888 \
    --net=host \
    -v /opt/zookeeper/data:/data \
    -v /opt/zookeeper/logs:/datalog \
    -v /opt/zookeeper/conf:/conf \
    --name=zoo \
   --privileged=true \
    zookeeper:3.4.12
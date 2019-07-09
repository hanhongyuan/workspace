mkdir zookeeper
cd zookeeper

cat > docker-compose.yaml << EOF
version: '2'

services:
    zoo1:
        image: zookeeper:3.4.11
        restart: unless-stopped
        hostname: zoo1
        ports:
            - 15300:2181
        environment:
            ZOO_MY_ID: 1
            ZOO_SERVERS: server.1=0.0.0.0:2888:3888 server.2=zoo2:2888:3888 server.3=zoo3:2888:3888
        volumes: 
            - $(pwd)/zk1/conf:/conf
            - $(pwd)/zk1/data:/data
            - $(pwd)/zk1/logs:/datalog
    zoo2:
        image: zookeeper:3.4.11
        restart: unless-stopped
        hostname: zoo2
        ports:
            - 15301:2181
        environment:
            ZOO_MY_ID: 2
            ZOO_SERVERS: server.1=zoo1:2888:3888 server.2=0.0.0.0:2888:3888 server.3=zoo3:2888:3888
        volumes: 
            - $(pwd)/zk2/conf:/conf
            - $(pwd)/zk2/data:/data
            - $(pwd)/zk2/logs:/datalog
    zoo3:
        image: zookeeper:3.4.11
        restart: unless-stopped
        hostname: zoo3
        ports:
            - 15303:2181
        environment:
            ZOO_MY_ID: 3
            ZOO_SERVERS: server.1=zoo1:2888:3888 server.2=zoo2:2888:3888 server.3=0.0.0.0:2888:3888
        volumes: 
            - $(pwd)/zk3/conf:/conf
            - $(pwd)/zk3/data:/data
            - $(pwd)/zk3/logs:/datalog
EOF

mkdir -p ./zk1/conf
mkdir -p ./zk1/data
mkdir -p ./zk1/logs
mkdir -p ./zk2/conf
mkdir -p ./zk2/data
mkdir -p ./zk2/logs
mkdir -p ./zk3/conf
mkdir -p ./zk3/data
mkdir -p ./zk3/logs
chmod 777 -R .

docker-compose up -d

firewall-cmd --zone=public --add-port=15181/tcp
firewall-cmd --zone=public --add-port=15182/tcp
firewall-cmd --zone=public --add-port=15183/tcp
#firewall-cmd --zone=public --add-port=15181/tcp --permanent

eureka-server:1.0.0.14

docker run -d -p 11000:11000 -p 11001:11001 -v /sjfxlogs:/app/logs --restart unless-stopped -e "JAR_ARGS=-Dspring.profiles.active=test -Dserver.port=11000 -Ddubbo.protocol.port=$tcpport -Xmx512m" --name sjfxeureka-server --hostname=192.168.1.14  --health-cmd "curl --fail http://localhost:11000/actuator/health || exit 1" --health-interval=30s 192.168.1.12:5000/sjfx/eureka-server:1.0.0.14

docker run -d -p 11010:11010 -p 11011:11011 -v /sjfxlogs:/app/logs --restart unless-stopped -e "JAR_ARGS=-Dspring.profiles.active=test -Dserver.port=11010 -Ddubbo.protocol.port=$tcpport -Xmx512m" --name sjfxspring-boot-admin --hostname=192.168.1.14  --health-cmd "curl --fail http://localhost:11010/actuator/health || exit 1" --health-interval=30s 192.168.1.12:5000/sjfx/spring-boot-admin:1.0.0.9


docker run -d -p 8000:8000 -p 8001:8001 -v /sjfxlogs:/app/logs --restart unless-stopped -e "JAR_ARGS=-Dspring.profiles.active=test -Dserver.port=8000 -Ddubbo.protocol.port=$tcpport -Xmx512m" --name sjfxgateway --hostname=192.168.1.14  --health-cmd "curl --fail http://localhost:8000/actuator/health || exit 1" --health-interval=30s 192.168.1.12:5000/sjfx/gateway:1.0.0.37

docker run -d -p 20010:20010 -p 20011:20011 -v /sjfxlogs:/app/logs --restart unless-stopped -e "JAR_ARGS=-Dspring.profiles.active=test -Dserver.port=20010 -Ddubbo.protocol.port=20011 -Xmx512m" --name sjfxwxgateway --hostname=192.168.1.14  --health-cmd "curl --fail http://localhost:20010/actuator/health || exit 1" --health-interval=30s 192.168.1.12:5000/sjfx/wxgateway:1.0.0.12

docker run -d -p 20000:20000 -p 20001:20001 -v /sjfxlogs:/app/logs --restart unless-stopped -e "JAR_ARGS=-Dspring.profiles.active=test -Dserver.port=20000 -Ddubbo.protocol.port=$tcpport -Xmx512m" --name sjfxauthorization --hostname=192.168.1.14  --health-cmd "curl --fail http://localhost:20000/actuator/health || exit 1" --health-interval=30s 192.168.1.12:5000/sjfx/authorization:1.0.0.48


docker run -d -p 20020:20020 -p 20021:20021 -v /sjfxlogs:/app/logs --restart unless-stopped -e "JAR_ARGS=-Dspring.profiles.active=test -Dserver.port=20020 -Ddubbo.protocol.port=$tcpport -Xmx512m" --name sjfxuser-service --hostname=192.168.1.14  --health-cmd "curl --fail http://localhost:20020/actuator/health || exit 1" --health-interval=30s 192.168.1.12:5000/sjfx/user-service:1.0.0.24

docker run -d -p 20040:20040 -p 20041:20041 -v /sjfxlogs:/app/logs --restart unless-stopped -e "JAR_ARGS=-Dspring.profiles.active=test -Dserver.port=20040 -Ddubbo.protocol.port=$tcpport -Xmx512m" --name sjfxtenant --hostname=192.168.1.14  --health-cmd "curl --fail http://localhost:20040/actuator/health || exit 1" --health-interval=30s 192.168.1.12:5000/sjfx/tenant:1.0.0.34

warranty

docker run -d -p 20120:20120 -p 20121:20121 -v /sjfxlogs:/app/logs --restart unless-stopped -e "JAR_ARGS=-Dspring.profiles.active=test -Dserver.port=20120 -Ddubbo.protocol.port=20121 -Xmx512m" --name sjfxwarranty --hostname=192.168.1.14  --health-cmd "curl --fail http://localhost:20120/actuator/health || exit 1" --health-interval=30s 192.168.1.12:5000/sjfx/warranty:1.0.0.5

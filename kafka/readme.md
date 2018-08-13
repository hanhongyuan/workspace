1.  下载镜像
    docker pull wurstmeister/zookeeper
    docker pull wurstmeister/kafka

2.  创建目录
    mkdir -p /syncdata/config
    mkdir -p /syncdata/kfkdata
    mkdir -p /syncdata/zkdata
    chmod 777 -R /syncdata/config
    chmod 777 -R /syncdata/kfkdata
    chmod 777 -R /syncdata/zkdata

3.  使用 docker-compose.yml 文件启动 kafka

    如果需要安装 docker-compose
    启动 docker
    docker-compose up -d

    compose 文件：

```conf
version: '2'
services:
  zookeeper:
    image: wurstmeister/zookeeper
    container_name: zookeeper
    restart: always
    ports:
      - "2181:2181"
    volumes:
      - /syncdata/zkdata:/opt/zookeeper-3.4.9/data/
  kafka:
    image: wurstmeister/kafka
    container_name: kafka
    restart: always
    ports:
      - "9092:9092"
    environment:
      KAFKA_ADVERTISED_HOST_NAME: 192.168.181.131
      KAFKA_PORT: 9092
      KAFKA_CREATE_TOPICS: "test001"
      KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /syncdata/kfkdata:/kafka
      - /syncdata/config:/opt/kafka/config
```

4.  开放端口
    
    firewall-cmd --zone=public --add-port=9092/tcp
    firewall-cmd --zone=public --add-port=9092/tcp --permanent
    firewall-cmd --zone=public --add-port=2181/tcp
    firewall-cmd --zone=public --add-port=2181/tcp --permanent

5.  修改配置，文件在/syncdata/kfkdata/server.properties
    增加 auto.create.topics.enable=true
6.  检查运行情况：

    停止 kafka
    nohup /usr/local/kafka/bin/kafka-server-stop.sh /usr/local/kafka/bin/config/server.properties > /tmp/kafka003.log 2>1 &
    /usr/local/kafka/bin/zookeeper-server-stop.sh

    启动 kafka
    /usr/local/kafka/bin/zookeeper-server-start.sh -daemon /usr/local/kafka/config/zookeeper.properties
    /usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties
    nohup /usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties > /tmp/kafka001.log 2>1 &

    重装 docker
    docker rm -f kafka
    docker rm -f zookeeper
    docker-compose up -d

    查看端口占用
    netstat -lnp|grep 9092

    进入容器
    docker exec -it kafka /bin/bash

    创建队列
    /usr/local/kafka/bin/kafka-topics.sh --create --zookeeper 120.27.248.112:2181 --replication-factor 1 --partitions 1 --topic test001

    /mnt/kafka/kafka_2.11-1.0.0/bin/kafka-topics.sh --create --zookeeper 127.0.0.1:2182 --replication-factor 1 --partitions 1 --topic test001

    /opt/kafka/bin/kafka-topics.sh --create --zookeeper 127.0.0.1:2181 --replication-factor 1 --partitions 1 --topic test002
    查询队列
    /usr/local/kafka/bin/kafka-topics.sh --list --zookeeper 127.0.0.1:2181

    /mnt/kafka/kafka_2.11-1.0.0/bin/kafka-topics.sh --list --zookeeper 127.0.0.1:2182

    发布
    /usr/local/kafka/bin/kafka-console-producer.sh --broker-list 120.27.248.112:9092 --topic V00042
/mnt/kafka/kafka_2.11-1.0.0/bin/kafka-console-producer.sh --broker-list 127.0.0.1:9093 --topic test001
    监听
    /usr/local/kafka/bin/kafka-console-consumer.sh --zookeeper 120.27.248.112:2181 --topic test001
 /opt/kafka/bin/kafka-console-consumer.sh --zookeeper 120.27.248.112:2181 --topic V00042
/mnt/kafka/kafka_2.11-1.0.0/bin/kafka-console-consumer.sh --zookeeper 127.0.0.1:2183 --topic test001
/mnt/kafka/kafka_2.11-1.0.0/bin/kafka-console-consumer.sh --broker-list 


/usr/local/kafka/bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic V00042 --time -1


/usr/local/kafka/bin/

docker run -d -e SA_PASSWORD=123456 -e SQLSERVER_DATABASE=testdb -e SQLSERVER_USER=dev -e SQLSERVER_PASSWORD=123456 -p 1433:1433 exoplatform/sqlserver:2014express

     firewall-cmd --zone=public --add-port=1433/tcp
    firewall-cmd --zone=public --add-port=1433/tcp --permanent


docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Sjfx@2018' -p 1433:1433 -d microsoft/mssql-server-linux

docker exec -it <container_id|container_name> /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P <your_password>

docker rm -f f1bec
docker rm -f a8f1
docker rmi -f b175
docker rmi -f 1716

 firewall-cmd --zone=public --add-port=9092/tcp
    firewall-cmd --zone=public --add-port=9092/tcp --permanent


/usr/local/kafka/bin/kafka-console-consumer.sh --bootstrap-server 120.27.248.112:9092 --topic test001 --from-beginning --new-consumer

/usr/local/kafka/bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list 120.27.248.112:9092 -topic test001 --time -2

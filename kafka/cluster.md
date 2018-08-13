1.  下载镜像
    docker pull wurstmeister/zookeeper
    docker pull wurstmeister/kafka

2.  创建目录
    mkdir -p /mnt/ks/docker-compose
    mkdir -p /mnt/ks/kfk1/config
    mkdir -p /mnt/ks/kfk2/config
    mkdir -p /mnt/ks/kfk3/config
    mkdir -p /mnt/ks/kfk1/kfkdata
    mkdir -p /mnt/ks/kfk2/kfkdata
    mkdir -p /mnt/ks/kfk3/kfkdata
    mkdir -p /mnt/ks/kfk1/zkdata
    mkdir -p /mnt/ks/kfk2/zkdata
    mkdir -p /mnt/ks/kfk3/zkdata
    chmod 777 -R /mnt/ks/kfk1/config
    chmod 777 -R /mnt/ks/kfk2/config
    chmod 777 -R /mnt/ks/kfk3/config
    chmod 777 -R /mnt/ks/kfk1/kfkdata
    chmod 777 -R /mnt/ks/kfk2/kfkdata
    chmod 777 -R /mnt/ks/kfk3/kfkdata
    chmod 777 -R /mnt/ks/kfk1/zkdata
    chmod 777 -R /mnt/ks/kfk2/zkdata
    chmod 777 -R /mnt/ks/kfk3/zkdata


3.  将docker-compose-cluster.yml 改名为 docker-compose.yml 文件启动 kafka cluster

    如果需要安装 docker-compose
    启动 docker
    docker-compose up -d

4.  开放端口
    
    firewall-cmd --zone=public --add-port=2182/tcp
    firewall-cmd --zone=public --add-port=2182/tcp --permanent
    firewall-cmd --zone=public --add-port=2183/tcp
    firewall-cmd --zone=public --add-port=2183/tcp --permanent
    firewall-cmd --zone=public --add-port=2184/tcp
    firewall-cmd --zone=public --add-port=2184/tcp --permanent
    firewall-cmd --zone=public --add-port=9093/tcp
    firewall-cmd --zone=public --add-port=9093/tcp --permanent
    firewall-cmd --zone=public --add-port=9094/tcp
    firewall-cmd --zone=public --add-port=9094/tcp --permanent
    firewall-cmd --zone=public --add-port=9095/tcp
    firewall-cmd --zone=public --add-port=9095/tcp --permanent

5.  修改配置，文件在server.properties
    增加 auto.create.topics.enable=true
    echo "auto.create.topics.enable=true" >> /mnt/ks/kfk1/config/server.properties
    echo "auto.create.topics.enable=true" >> /mnt/ks/kfk2/config/server.properties
    echo "auto.create.topics.enable=true" >> /mnt/ks/kfk3/config/server.properties

    docker restart kafka1
    docker restart kafka2
    docker restart kafka3 

6. 重装 docker
    docker rm -f kafka1
    docker rm -f kafka2
    docker rm -f kafka3 
    docker rm -f zk1
    docker rm -f zk2
    docker rm -f zk3
    rm -rf /mnt/ks/kfk1/kfkdata
    rm -rf /mnt/ks/kfk2/kfkdata
    rm -rf /mnt/ks/kfk3/kfkdata
    rm -rf /mnt/ks/kfk1/zkdata
    rm -rf /mnt/ks/kfk2/zkdata
    rm -rf /mnt/ks/kfk3/zkdata
    docker-compose up -d
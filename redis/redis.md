1.  安装官方镜像
    docker pull redis

2.  下载配置文件'redis.conf'并修改需要密码验证（去掉相关项注释并设置密码）
    requirepass 8J5NpTA4M4ZSsRTS

3.  修改配置文件访问 IP 限制
    bind 127.0.0.1 ::1

4.  创建相关目录
    mkdir -p /opt/redis/data
    chmod 777 -R /opt/redis/

5.  将配置文件复制到 redis 目录下

6.  运行镜像
    docker rm -f redis
    docker run -p 16300:6379 --name redis --restart=unless-stopped -v /opt/redis/data:/data -v  /opt/redis/redis.conf:/usr/local/etc/redis/redis.conf -d redis:4.0.9 redis-server /usr/local/etc/redis/redis.conf --appendonly yes

    docker rm -f sjfxredis
    docker run -p 16300:16300 --name sjfxredis --restart=unless-stopped -v /opt/redis/data:/data -v  /opt/redis/redis.conf:/usr/local/etc/redis/redis.conf -d redis:4.0.9 redis-server /usr/local/etc/redis/redis.conf --appendonly yes

-p 9379:6379 :将容器的 6379 端口映射到主机的 9379 端口

-v $PWD/redisdata:/data :将主机中当前目录下的 redisdata 挂载到容器的/data [容器重启或重装后不会丢失持久化数据]

redis-server /usr/local/etc/redis/redis.conf --appendonly yes :使用制定配置在容器执行 redis-server 启动命令，并打开 redis 持久化配置

$PWD/redisdata/redis.conf:/usr/local/etc/redis/redis.conf 使用已设置密码配置文件，

查看容器启动情况

参考文档： https://hub.docker.com/_/redis/


mkdir -p /mnt/redis/data
chmod 777 -R /mnt/redis

docker run -p 6379:6379 --restart=unless-stopped -v /mnt/redis/data:/data -v /mnt/redis/redis.conf:/usr/local/etc/redis/redis.conf -d redis:4.0.9


mkdir -p /mnt/redis/data
chmod 777 -R /mnt/redis

docker run -p 16300:6379 --restart=unless-stopped -v /mnt/redis/data:/data -v /mnt/redis/redis.conf:/usr/local/etc/redis/redis.conf -d redis:4.0.9




sed -i "s/spring.redis.host=172.16.250.149/spring.redis.host=\${server_host}/g" /root/market-configs/global-prod/application.properties


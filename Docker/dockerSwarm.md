
1. 我们使用 docker swarm init 在管理节点初始化一个 Swarm 集群。

 docker swarm init --advertise-addr 192.168.181.190

2. 创建成功后会返回创建工作节点的命令

 To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-5ycjf5do8tyuduhrx20elkushv06u2ck6zqwhorlk8i81ooc31-7wjfcm7if4pxn6zuzuov72wp8 192.168.181.190:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

3. 使用命令在（192.168.181.191和192.168.181.192）创建工作节点

4. 在管理节点使用 docker node ls 查看集群。
应该可以看到如下信息：
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
pzycspb80tqktp1lap3iovii3 *   mytest001           Ready               Active              Leader              18.03.1-ce
s9ffq07wk0cukmspcovzqtvww     mytest002           Ready               Active                                  18.03.1-ce
slpasz52b68ex0wy86efvefnf     mytest003           Ready               Active                                  18.03.1-ce

5. 在集群中创建服务

docker service create --replicas 3 -p 80:80 --name nginx nginx

6. 使用 docker service ls 来查看当前 Swarm 集群运行的服务

7. 使用 docker service ps 来查看某个服务的详情。

8. 服务伸缩
我们可以使用 docker service scale 对一个服务运行的容器数量进行伸缩。

当业务处于高峰期时，我们需要扩展服务运行的容器数量。

$ docker service scale nginx=5
当业务平稳时，我们需要减少服务运行的容器数量。

$ docker service scale nginx=2

9. 使用 docker service rm 来从 Swarm 集群移除某个服务。

docker service rm redis

docker service create --replicas 1 \
     --name redis \
     --config redis.conf \
     -p 16300:16300 \
     redis:latest \
     redis-server /redis.conf

10. 滚动升级

使用 docker service update 升级
使用 docker service rollback 回滚
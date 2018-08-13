cat > deploy-app-prod.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
tcpport=\$4
memsize=\$5
dockerhub=dockerhub.sjfx.com.cn
prodhost=172.16.84.200
prodhost2=172.16.224.160
prodhost3=172.16.224.161

docker service rm sjfx\$projectname

docker service create --replicas 3 -p \$httpport:\$httpport -p \$tcpport:\$tcpport \\
-e "JAR_ARGS=-Dspring.profiles.active=prod -Dserver.host=\$prodhost  -Dserver.host2=\$prodhost2  -Dserver.host3=\$prodhost3 -Dserver.port=\$httpport -Ddubbo.protocol.port=\$tcpport -Xmx\$memsize -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=\$prodhost:\$projectname:\$httpport -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=\$prodhost -Deureka.instance.prefer-ip-address=true -Dspring.datasource.hikari.maximum-pool-size=5" \\
--hostname=\$prodhost  --health-cmd "curl --fail http://localhost:\$httpport/actuator/health || exit 1" \\
--health-interval=30s --name sjfx\$projectname \$dockerhub/sjfx/\$projectname:\$tag

docker logout dockerhub.sjfx.com.cn
EOF

cat > deploy-tools-prod.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
dockerhub=dockerhub.sjfx.com.cn
prodhost=116.62.226.170
memsize=512m

docker login dockerhub.sjfx.com.cn -u sjfxdev -p Sjfx@2018

docker pull \$dockerhub/sjfx/\$projectname:\$tag
docker service rm sjfx\$projectname
docker service create --replicas 3 -p \$httpport:\$httpport \\
-e "JAR_ARGS=-Dspring.profiles.active=prod -Dserver.port=\$httpport -Ddubbo.protocol.port=\$tcpport -Xmx\$memsize -Drocketmq.client.log4j2.resource.fileName=log4j2-prod.xml -Deureka.instance.instance-id=\$prodhost:\$projectname:\$httpport -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=\$prodhost -Deureka.instance.prefer-ip-address=true -Dspring.datasource.hikari.maximum-pool-size=5" \\
--hostname=\$prodhost  --health-cmd "curl --fail http://localhost:\$httpport/actuator/health || exit 1" \\
--health-interval=30s --name sjfx\$projectname \$dockerhub/sjfx/\$projectname:\$tag

docker logout dockerhub.sjfx.com.cn
EOF

cat > deploy-web-prod-service.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
dockerhub=dockerhub.sjfx.com.cn

docker login \$dockerhub -u sjfxdev -p Sjfx@2018

docker rm -f sjfx\$projectname

docker service create --replicas 3  -p \$httpport:8080 --name sjfx\$projectname  \\
--health-cmd "curl --fail http://localhost:\$httpport/ || exit 1" --health-interval=30s \\
\$dockerhub/sjfx/\$projectname:\$tag

docker logout \$dockerhub
EOF

cat > deploy-web-prod-single.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
dockerhub=dockerhub.sjfx.com.cn

docker login \$dockerhub -u sjfxdev -p Sjfx@2018
docker pull \$dockerhub/sjfx/\$projectname:\$tag
docker rm -f sjfx\$projectname

docker run -d -p \$httpport:8080  -v /sjfxlogs/\$projectname:/app/logs --restart unless-stopped --name sjfx\$projectname  \\
--health-cmd "curl --fail http://localhost:\$httpport/ || exit 1" --health-interval=30s \\
\$dockerhub/sjfx/\$projectname:\$tag

docker logout \$dockerhub
EOF



cat > deploy-app-prod-wan.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
tcpport=\$4
memsize=\$5
dockerhub=dockerhub.sjfx.com.cn
prodhost=116.62.226.170
prodhost2=47.99.36.100
prodhost3=47.99.40.32
docker login \$dockerhub -u sjfxdev -p Sjfx@2018
docker service rm sjfx\$projectname

docker service create --replicas 3 -p \$httpport:\$httpport -p \$tcpport:\$tcpport \\
-e "JAR_ARGS=-Dspring.profiles.active=prod -Dserver.host=\$prodhost  -Dserver.host2=\$prodhost2  -Dserver.host3=\$prodhost3 -Dserver.port=\$httpport -Ddubbo.protocol.port=\$tcpport -Xmx\$memsize -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=\$prodhost:\$projectname:\$httpport -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=\$prodhost -Deureka.instance.prefer-ip-address=true -Dspring.datasource.hikari.maximum-pool-size=5" \\
--hostname=\$prodhost  --health-cmd "curl --fail http://localhost:\$httpport/actuator/health || exit 1" \\
--health-interval=30s --name sjfx\$projectname \$dockerhub/sjfx/\$projectname:\$tag

docker logout dockerhub.sjfx.com.cn
EOF

cat > deploy-app-prod-single.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
tcpport=\$4
memsize=\$5
dockerhub=dockerhub.sjfx.com.cn
prodhost=116.62.226.170
prodhost2=47.99.36.100
prodhost3=47.99.40.32
docker login \$dockerhub -u sjfxdev -p Sjfx@2018

docker pull \$dockerhub/sjfx/\$projectname:\$tag

docker rm -f sjfx\$projectname

docker run -d -v /sjfxlogs:/app/logs --restart unless-stopped -p \$httpport:\$httpport -p \$tcpport:\$tcpport \\
-e "JAR_ARGS=-Dspring.profiles.active=prod -Dspring.redis.host=\$prodhost -Dspring.redis.port=16300  -Dserver.host=\$prodhost  -Dserver.host2=\$prodhost2  -Dserver.host3=\$prodhost3 -Dserver.port=\$httpport -Ddubbo.protocol.port=\$tcpport -Xmx\$memsize -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=\$prodhost:\$projectname:\$httpport -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=\$prodhost -Deureka.instance.prefer-ip-address=true -Dspring.datasource.hikari.maximum-pool-size=5" \\
--hostname=\$prodhost  --health-cmd "curl --fail http://localhost:\$httpport/actuator/health || exit 1" \\
--health-interval=30s --name sjfx\$projectname \$dockerhub/sjfx/\$projectname:\$tag

docker logout dockerhub.sjfx.com.cn
EOF

cat > deploy-tools-prod-single.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
dockerhub=dockerhub.sjfx.com.cn
prodhost=116.62.226.170
prodhost2=47.99.36.100
prodhost3=47.99.40.32
memsize=512m

docker login dockerhub.sjfx.com.cn -u sjfxdev -p Sjfx@2018

docker rm -f sjfx\$projectname

docker run -d -v /sjfxlogs:/app/logs --restart unless-stopped -p \$httpport:\$httpport \\
-e "JAR_ARGS=-Dspring.profiles.active=prod -Deureka.instance.hostname=\$prodhost -Dserver.port=\$httpport -Ddubbo.protocol.port=\$tcpport -Xmx\$memsize -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=\$prodhost:\$projectname:\$httpport -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=\$prodhost -Deureka.instance.prefer-ip-address=true -Dspring.datasource.hikari.maximum-pool-size=5" \\
--hostname=\$prodhost  --health-cmd "curl --fail http://localhost:\$httpport/actuator/health || exit 1" \\
--health-interval=30s --name sjfx\$projectname \$dockerhub/sjfx/\$projectname:\$tag

docker logout dockerhub.sjfx.com.cn
EOF


cat > deploy-tools-prod-single.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
dockerhub=dockerhub.sjfx.com.cn
prodhost=47.99.36.100
prodhost2=116.62.226.170
prodhost3=47.99.40.32
memsize=512m

docker login dockerhub.sjfx.com.cn -u sjfxdev -p Sjfx@2018

docker rm -f sjfx\$projectname

docker run -d -v /sjfxlogs:/app/logs --restart unless-stopped -p \$httpport:\$httpport \\
-e "JAR_ARGS=-Dspring.profiles.active=prod -Deureka.instance.hostname=\$prodhost -Dserver.port=\$httpport -Ddubbo.protocol.port=\$tcpport -Xmx\$memsize -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=\$prodhost:\$projectname:\$httpport -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=\$prodhost -Deureka.instance.prefer-ip-address=true -Dspring.datasource.hikari.maximum-pool-size=5" \\
--hostname=\$prodhost  --health-cmd "curl --fail http://localhost:\$httpport/actuator/health || exit 1" \\
--health-interval=30s --name sjfx\$projectname \$dockerhub/sjfx/\$projectname:\$tag

docker logout dockerhub.sjfx.com.cn
EOF


cat > deploy-app-prod-single.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
tcpport=\$4
memsize=\$5
dockerhub=dockerhub.sjfx.com.cn
prodhost=47.99.36.100
prodhost2=116.62.226.170
prodhost3=47.99.40.32
docker login \$dockerhub -u sjfxdev -p Sjfx@2018

docker pull \$dockerhub/sjfx/\$projectname:\$tag

docker rm -f sjfx\$projectname

docker run -d -v /sjfxlogs:/app/logs --restart unless-stopped -p \$httpport:\$httpport -p \$tcpport:\$tcpport \\
-e "JAR_ARGS=-Dspring.profiles.active=prod -Dspring.redis.host=\$prodhost -Dspring.redis.port=16300  -Dserver.host=\$prodhost  -Dserver.host2=\$prodhost2  -Dserver.host3=\$prodhost3 -Dserver.port=\$httpport -Ddubbo.protocol.port=\$tcpport -Xmx\$memsize -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=\$prodhost:\$projectname:\$httpport -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=\$prodhost -Deureka.instance.prefer-ip-address=true -Dspring.datasource.hikari.maximum-pool-size=5" \\
--hostname=\$prodhost  --health-cmd "curl --fail http://localhost:\$httpport/actuator/health || exit 1" \\
--health-interval=30s --name sjfx\$projectname \$dockerhub/sjfx/\$projectname:\$tag

docker logout dockerhub.sjfx.com.cn
EOF


cat > deploy-app-prod-single-local.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
tcpport=\$4
memsize=\$5
dockerhub=dockerhub.sjfx.com.cn
prodhost=116.62.226.170
prodhost2=47.99.36.100
prodhost3=47.99.40.32

docker rm -f sjfx\$projectname

docker run -d -v /sjfxlogs:/app/logs --restart unless-stopped -p \$httpport:\$httpport -p \$tcpport:\$tcpport \\
-e "JAR_ARGS=-Dspring.profiles.active=prod -Dspring.redis.host=\$prodhost -Dspring.redis.port=16300  -Dserver.host=\$prodhost  -Dserver.host2=\$prodhost2  -Dserver.host3=\$prodhost3 -Dserver.port=\$httpport -Ddubbo.protocol.port=\$tcpport -Xmx\$memsize -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=\$prodhost:\$projectname:\$httpport -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=\$prodhost -Deureka.instance.prefer-ip-address=true -Dspring.datasource.hikari.maximum-pool-size=5" \\
--hostname=\$prodhost  --health-cmd "curl --fail http://localhost:\$httpport/actuator/health || exit 1" \\
--health-interval=30s --name sjfx\$projectname \$dockerhub/sjfx/\$projectname:\$tag
EOF
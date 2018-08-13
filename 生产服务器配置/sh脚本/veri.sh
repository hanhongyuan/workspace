cat > deploy-app-veri.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
tcpport=\$4
memsize=\$5
dockerhub=dockerhub.sjfx.com.cn
prodhost=172.16.250.149

docker login dockerhub.sjfx.com.cn -u sjfxdev -p Sjfx@2018

docker rm -f sjfx\$projectname

docker run -d -v /sjfxlogs:/app/logs --restart unless-stopped -p \$httpport:\$httpport -p \$tcpport:\$tcpport \\
-e "JAR_ARGS=-Dspring.profiles.active=pre -Dserver.host=\$prodhost -Dserver.port=\$httpport -Ddubbo.protocol.port=\$tcpport -Xmx\$memsize -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=\$prodhost:\$projectname:\$httpport -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=\$prodhost -Deureka.instance.prefer-ip-address=true -Dspring.datasource.hikari.maximum-pool-size=5" \\
--hostname=\$prodhost  --health-cmd "curl --fail http://localhost:\$httpport/actuator/health || exit 1" \\
--health-interval=30s --name sjfx\$projectname \$dockerhub/sjfx/\$projectname:\$tag

docker logout dockerhub.sjfx.com.cn
EOF

cat > deploy-tools-veri.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
dockerhub=dockerhub.sjfx.com.cn
prodhost=47.99.32.21
memsize=512m

docker login dockerhub.sjfx.com.cn -u sjfxdev -p Sjfx@2018

docker rm -f sjfx\$projectname

docker run -d -v /sjfxlogs:/app/logs --restart unless-stopped -p \$httpport:\$httpport \\
-e "JAR_ARGS=-Dspring.profiles.active=pre -Deureka.instance.hostname=\$prodhost -Dserver.port=\$httpport -Ddubbo.protocol.port=\$tcpport -Xmx\$memsize -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=\$prodhost:\$projectname:\$httpport -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=\$prodhost -Deureka.instance.prefer-ip-address=true -Dspring.datasource.hikari.maximum-pool-size=5" \\
--hostname=\$prodhost  --health-cmd "curl --fail http://localhost:\$httpport/actuator/health || exit 1" \\
--health-interval=30s --name sjfx\$projectname \$dockerhub/sjfx/\$projectname:\$tag

docker logout dockerhub.sjfx.com.cn
EOF

cat > deploy-web-veri.sh << EOF
#!/bin/sh
projectname=\$1
tag=\$2
httpport=\$3
dockerhub=dockerhub.sjfx.com.cn

docker login dockerhub.sjfx.com.cn -u sjfxdev -p Sjfx@2018

docker rm -f sjfx\$projectname

docker run -d -p \$httpport:8080 --restart unless-stopped --name sjfx\$projectname  \\
--health-cmd "curl --fail http://localhost:\$httpport/ || exit 1" --health-interval=30s \\
\$dockerhub/sjfx/\$projectname:\$tag

docker logout dockerhub.sjfx.com.cn
EOF

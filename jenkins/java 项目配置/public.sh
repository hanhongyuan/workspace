#!/bin/sh
#projectname=`cat build.gradle |egrep -o 'group.*'|awk -F ' ' '{print $2}'|sed "s/cn.com.sjfx.//g"|sed 's/ //g'|sed "s/'//g"`
#version=`cat build.gradle |egrep -o 'version.*'|awk -F ' ' '{print $2}'|sed "s/'//g"`
projectname=`cat service/install/properties | grep project.name | awk -F '=' '{print $2}'`
version=`cat service/install/properties | grep project.version | awk -F '=' '{print $2}'`
echo "publish>>>> " $projectname $version
sjfxdocker=192.168.1.12:5000
lastversion=`echo $version|sed "s/-SNAPSHOT//g"`
lastversion=$lastversion'.'${BUILD_ID}
httpport=$1
tcpport=$2
devhost=192.168.1.11
testhost=192.168.1.14
reshost=192.168.1.18

rm -rf docker
mkdir docker

cp ./service/build/libs/service-$version.jar ./docker/service.jar
cp /opt/Dockerfile ./docker/Dockerfile
git log --graph --pretty=format:'%h [%ci] -%cn %s %b %d ' --abbrev-commit --date=relative > ./docker/release.list

for i in  `docker images sjfx/$projectname* |grep sjfx|awk '{print $3}'`;do echo \ &&docker rmi -f $i; done

docker build -t sjfx/$projectname:$lastversion ./docker

docker tag sjfx/$projectname:$lastversion $sjfxdocker/sjfx/$projectname:$lastversion
docker tag sjfx/$projectname:$lastversion $sjfxdocker/sjfx/$projectname:latest

docker push $sjfxdocker/sjfx/$projectname:$lastversion
docker push $sjfxdocker/sjfx/$projectname:latest

export PATH=$PATH:/opt/rancher-v0.6.10/
export RANCHER_URL=http://192.168.1.18:8181
export RANCHER_ACCESS_KEY=EAE7852CE843043EC56C
export RANCHER_SECRET_KEY=RfseHfbsW3BveEuh37GsxBBf9CAuRQBm2QkbcQmR


# for i in `rancher -host sjfxtest docker ps -a|grep /$projectname|awk '{print $1}'`;do echo \ &&rancher -host sjfxtest docker rm -f $i; done
# for i in `rancher -host sjfxtest docker images|grep /$projectname|awk '{print $3}'`;do echo \ &&rancher -host sjfxtest docker rmi $i; done
# rancher -host sjfxtest docker run -d -p $httpport:$httpport -p $tcpport:$tcpport -v /sjfxlogs:/app/logs --restart unless-stopped -e "JAR_ARGS=-Dspring.profiles.active=test -Dserver.port=$httpport -Ddubbo.protocol.port=$tcpport -Xmx512m -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=${testhost}:${projectname}:$httpport -Deureka.instance.hostname=${testhost} -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=${testhost} -Deureka.instance.prefer-ip-address=true" --name sjfx$projectname --hostname=$testhost  --health-cmd "curl --fail http://localhost:$httpport/actuator/health || exit 1" --health-interval=30s $sjfxdocker/sjfx/$projectname:$lastversion
#rancher -host sjfxtest docker run -d -p $httpport:8080 -p $tcpport:20001  --restart unless-stopped -e "SPRING_PROFILES_ACTIVE=test" --name sjfx$projectname --hostname=$testhost $sjfxdocker/sjfx/$projectname:$lastversion
#rancher -host sjfxtest docker run -d -p $httpport:8080 -p $tcpport:20001 -v /sjfxlogs:/app/logs --restart unless-stopped -e "SPRING_PROFILES_ACTIVE=dev" --name sjfx$projectname --hostname=$testhost $sjfxdocker/sjfx/$projectname:$lastversion

for i in `rancher -host sjfxdev docker ps -a|grep /$projectname|awk '{print $1}'`;do echo \ &&rancher -host sjfxdev docker rm -f $i; done
for i in `rancher -host sjfxdev docker images|grep /$projectname|awk '{print $3}'`;do echo \ &&rancher -host sjfxdev docker rmi $i; done

#rancher -host sjfxdev docker run -d -p $httpport:8080 -p $tcpport:20001 -v /sjfxlogs:/app/logs --restart unless-stopped -e "SPRING_PROFILES_ACTIVE=dev" --name sjfx$projectname --hostname=$devhost $sjfxdocker/sjfx/$projectname:$lastversion
echo rancher -host sjfxdev docker run -d -p $httpport:$httpport -p $tcpport:$tcpport -v /sjfxlogs:/app/logs --restart unless-stopped -e "JAR_ARGS=-Dspring.profiles.active=dev -Dserver.port=$httpport -Ddubbo.protocol.port=$tcpport -Xmx512m -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=${devhost}:${projectname}:$httpport -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=${devhost} -Deureka.instance.prefer-ip-address=true" --name sjfx$projectname --hostname=$devhost  --health-cmd "curl --fail http://localhost:$httpport/actuator/health || exit 1" --health-interval=30s $sjfxdocker/sjfx/$projectname:$lastversion
rancher -host sjfxdev docker run -d -p $httpport:$httpport -p $tcpport:$tcpport -v /sjfxlogs:/app/logs --restart unless-stopped -e "JAR_ARGS=-Dspring.profiles.active=dev -Dserver.port=$httpport -Ddubbo.protocol.port=$tcpport -Xmx512m -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=${devhost}:${projectname}:$httpport -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=${devhost} -Deureka.instance.prefer-ip-address=true" --name sjfx$projectname --hostname=$devhost  --health-cmd "curl --fail http://localhost:$httpport/actuator/health || exit 1" --health-interval=30s $sjfxdocker/sjfx/$projectname:$lastversion
#添加通用发布脚本

export PATH=$PATH:/opt/rancher-v0.6.10/
export RANCHER_URL=http://192.168.1.18:8181
export RANCHER_ACCESS_KEY=EAE7852CE843043EC56C
export RANCHER_SECRET_KEY=RfseHfbsW3BveEuh37GsxBBf9CAuRQBm2QkbcQmR

projectname=$1
profile=test
testhost=192.168.1.14
sjfxdocker=192.168.1.12:5000

httpport=$2
tcpport=$3

lastversion=$4

if [ -z $lastversion ]; then
  lastversion=latest
fi

echo $lastversion
echo $httppor
echo $tcpport

for i in `rancher -host sjfxtest docker ps -a|grep /$projectname|awk '{print $1}'`;do echo \ && rancher -host sjfxtest docker rm -f $i; done
for i in `rancher -host sjfxtest docker images|grep /$projectname|awk '{print $3}'`;do echo \ && rancher -host sjfxtest docker rmi $i; done


rancher -host sjfxtest docker run -d -p $httpport:$httpport -p $tcpport:$tcpport -v /sjfxlogs:/app/logs --restart unless-stopped -e "JAR_ARGS=-Dspring.profiles.active=$profile -Dserver.port=$httpport -Ddubbo.protocol.port=$tcpport -Xmx512m -Drocketmq.client.log4j2.resource.fileName=log4j2-spring.xml -Deureka.instance.instance-id=${testhost}:${projectname}:$httpport -Deureka.instance.hostname=${testhost} -Deureka.client.healthcheck.enabled=true -Deureka.instance.ip-address=${testhost} -Deureka.instance.prefer-ip-address=true" --name sjfx$projectname --hostname=$testhost  --health-cmd "curl --fail http://localhost:$httpport/actuator/health || exit 1" --health-interval=30s $sjfxdocker/sjfx/$projectname:$lastversion


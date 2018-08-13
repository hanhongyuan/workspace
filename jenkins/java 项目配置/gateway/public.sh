projectname=gateway
sjfxdocker=192.168.1.12:5000
gradle build

vision=`cat build.gradle |egrep -o '^version.*'|awk -F ' ' '{print $2}'|sed "s/'//g"`
lastvision=`echo $vision|sed "s/-SNAPSHOT//g"`
lastvision=$lastvision'.'${BUILD_ID}
echo $vision
echo $lastvision

rm -rf docker
mkdir docker

cp ./build/libs/$projectname-$vision.jar ./docker/$projectname.jar
cp Dockerfile ./docker/Dockerfile
git log --graph --pretty=format:'%h [%ci] -%cn %s %b %d ' --abbrev-commit --date=relative > ./docker/release.list

for i in  `docker images sjfx/$projectname* |grep sjfx|awk '{print $3}'`;do echo \ &&docker rmi -f $i; done

docker build -t sjfx/$projectname:$lastvision ./docker

docker tag sjfx/$projectname:$lastvision $sjfxdocker/sjfx/$projectname:$lastvision
docker tag sjfx/$projectname:$lastvision $sjfxdocker/sjfx/$projectname:latest
docker push $sjfxdocker/sjfx/$projectname:$lastvision
docker push $sjfxdocker/sjfx/$projectname:latest

export PATH=$PATH:/opt/rancher-v0.6.10/
export RANCHER_URL=http://$reshost:8181
export RANCHER_ACCESS_KEY=E7D1B5A7FDE37F1C60B0
export RANCHER_SECRET_KEY=MDD94E9WYh9V8qdnELbR2p19PL68U3nFNLj6MCgM

#for i in `rancher -host sjfxtest docker ps -a|grep $projectname|awk '{print $1}'`;do echo \ &&rancher -host sjfxtest docker rm -f $i; done
#for i in `rancher -host sjfxtest docker images|grep $projectname|awk '{print $3}'`;do echo \ &&rancher -host sjfxtest docker rmi $i; done

#rancher -host sjfxtest docker run -d -p $httpport:8080 -p $tcpport:20001  --restart unless-stopped -e "SPRING_PROFILES_ACTIVE=test" --name sjfx$projectname --hostname=$testhost $sjfxdocker/sjfx/$projectname:$lastvision
#rancher -host sjfxtest docker run -d -p $httpport:8080 -p $tcpport:20001 -v /sjfxlogs:/app/logs --restart unless-stopped -e "SPRING_PROFILES_ACTIVE=dev" --name sjfx$projectname --hostname=$testhost $sjfxdocker/sjfx/$projectname:$lastvision

for i in `rancher -host sjfxdev docker ps -a|grep $projectname|awk '{print $1}'`;do echo \ &&rancher -host sjfxdev docker rm -f $i; done
for i in `rancher -host sjfxdev docker images|grep $projectname|awk '{print $3}'`;do echo \ &&rancher -host sjfxdev docker rmi $i; done

rancher -host sjfxdev docker run -d -p 8000:8080 -v /sjfxlogs:/app/logs --restart unless-stopped -e "SPRING_PROFILES_ACTIVE=dev" --name sjfx$projectname $sjfxdocker/sjfx/$projectname:$lastvision

#娣诲姞閫氱敤鍙戝竷鑴氭湰
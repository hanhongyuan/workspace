projectname=sms
sjfxdocker=192.168.1.12:5000
gradle build -xtest

vision=`cat ./service/build.gradle |egrep -o '^version.*'|awk -F ' ' '{print $2}'|sed "s/'//g"`
lastvision=`echo $vision|sed "s/-SNAPSHOT//g"`
lastvision=$lastvision'.'${BUILD_ID}
echo $vision
echo $lastvision

rm -rf docker
mkdir docker

cp ./service/build/libs/service-$vision.jar ./docker/$projectname.jar
cp Dockerfile ./docker/Dockerfile
git log --graph --pretty=format:'%h [%ci] -%cn %s %b %d ' --abbrev-commit --date=relative > ./docker/release.list

for i in  `docker images sjfx/$projectname* |grep sjfx|awk '{print $3}'`;do echo \ &&docker rmi -f $i; done

docker build -t sjfx/$projectname:$lastvision ./docker
docker tag sjfx/$projectname:$lastvision $sjfxdocker/sjfx/$projectname:$lastvision
docker push $sjfxdocker/sjfx/$projectname:$lastvision
projectname=snowid
sjfxdocker=192.168.1.12:5000
mvn assembly:assembly -f pom.xml

vision=`cat pom.xml |egrep -o '<version>.*</version>'|awk -F '>'  '{print $2}'|awk -F '<'  '{print $1}'|head -1`
lastvision=$vision'.'${BUILD_ID}
echo $vision
echo $lastvision

rm -rf docker
mkdir docker

cp ./target/distributedid-$vision-jar-with-dependencies.jar ./docker/$projectname.jar
cp Dockerfile ./docker/Dockerfile
cp run.sh ./docker/run.sh
git log --graph --pretty=format:'%h [%ci] -%cn %s %b %d ' --abbrev-commit --date=relative > ./docker/release.list

for i in  `docker images sjfx/$projectname* |grep sjfx|awk '{print $3}'`;do echo \ &&docker rmi -f $i; done

docker build -t sjfx/$projectname:$lastvision ./docker
docker tag sjfx/$projectname:$lastvision $sjfxdocker/sjfx/$projectname:$lastvision
docker push $sjfxdocker/sjfx/$projectname:$lastvision

# docker login -u sjfx -p sjfx2018
# docker push sjfx/snowid:$lastvision
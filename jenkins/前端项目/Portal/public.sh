projectname=web-portal

yarn install
yarn run build

vision=`cat package.json |egrep -o '"version".*'|awk -F ':' '{print $2}'|sed 's/"//g'|sed 's/,//g'`
lastvision=$lastvision'.'${BUILD_ID}
echo $vision
echo $lastvision

rm -rf docker
mkdir docker

git log --graph --pretty=format:'%h [%ci] -%cn %s %b %d ' --abbrev-commit --date=relative > ./docker/release.list

for i in  `docker images sjfx/$projectname* |grep sjfx|awk '{print $3}'`;do echo \ &&docker rmi -f $i; done

docker build -t sjfx/$projectname:$lastvision .
docker tag sjfx/$projectname:$lastvision $sjfxdocker/sjfx/$projectname:$lastvision
docker push $sjfxdocker/sjfx/$projectname:$lastvision

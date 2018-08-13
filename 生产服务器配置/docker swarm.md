 
 1. 在服务器produce303执行
 docker swarm init --advertise-addr 172.16.84.200

 2. 在其他两台机器执行
docker swarm join --token SWMTKN-1-3iifvbne9ln7u3o1lftswkg5hrynf3ejlw9oma04g8e6uo2l6s-454q79xfh36h2zhupijajje1i 116.62.226.170:2377
docker swarm join --token SWMTKN-1-00syqeatcfkpeitba93o0qdjhuqlbjezmaos3lz7xd9ulbzwnw-8ixwp6wdl1k24gc8qrbb2w6c5 116.62.226.170:2377
 3. 查看集群
 docker node ls 

4. 部署方法

 sh /opt/publish-script/deploy-prod-app-single.sh authorization 20000,20001 1g

sh /opt/publish-script/deploy-prod-app-single.sh erp-to-platform 20100,20101 2g

sh /opt/publish-script/publish.service.testcreate.sh config-service 1.0.0.8 20230


sh /opt/publish-script/publish.service.testcreate.sh eureka 1.0.0.54 11000

sh /opt/publish-script/publish.service.local.sh sjfxtest 1.0.0 17777

docker build -t 47.99.32.21/sjfx/sjfxtest:1.0.4 .

docker login 47.99.32.21 -u sjfxdev -p Sjfx@2018
docker build -t 47.99.32.21/sjfx/sjfxtest:1.0.8 .
docker push 47.99.32.21/sjfx/sjfxtest:1.0.8
docker logout  47.99.32.21

docker rmi 47.99.32.21/sjfx/sjfxtest:1.0.4

sh /opt/publish-script/publish.service.create.sh sjfxtest 1.0.4 17777

docker service update --image 47.99.32.21/sjfx/sjfxtest:1.0.8 sjfxtest

docker service rollback sjfxtest

可以
sh /opt/publish-script/publish.service.testcreate.sh eureka 1.1.0.49 11000
sh /opt/publish-script/publish.service.testcreate.sh config-service 1.1.0.10 20230
sh /opt/publish-script/publish.service.testcreate.sh spring-boot-admin 1.1.0.27 11010
sh /opt/publish-script/publish.service.testcreate.sh id-generator 1.1.0.2 16000,16001

未知




不可
sh /opt/publish-script/publish.service.testcreate.sh giftmall 1.1.0.5 20080,20081



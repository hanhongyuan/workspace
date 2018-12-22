

FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN mvn package -f dubbo-admin


FROM tomcat:8.0-jre8
RUN rm -rf /usr/local/tomcat/webapps/
COPY --from=0 /source/dubbo-admin/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080

FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN mvn package -f dubbo-admin
 
 
FROM tomcat:8.0-jre8
RUN rm -rf /usr/local/tomcat/webapps/
COPY --from=0 /source/dubbo-admin/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080


docker run -d -p 9000:8080 --restart=unless-stopped -e ZOOKEEPER_SERVER=192.168.1.22:15301 --name dubboadmin webuilder/dubboadmin

docker run -d -p 9000:8080 --restart=unless-stopped -e ZOOKEEPER_SERVER=192.168.1.14:15301 --name dubboadmin webuilder/dubboadmin

docker run -d -p 9000:8080 --restart=unless-stopped -e ZOOKEEPER_SERVER=192.168.1.11:15301 --name dubboadmin webuilder/dubboadmin


docker run -d -p 9001:8080 --restart=unless-stopped -e ZOOKEEPER_SERVER=172.16.84.200:15300 --name dubboadmin webuilder/dubboadmin

docker run -d -p 9001:8080 --restart=unless-stopped -e ZOOKEEPER_SERVER=172.16.250.149:15301 --name dubboadmin webuilder/dubboadmin

docker rm -f dubbomonitor
docker run -d -p 8084:8084 -p 7070:7070 --hostname=192.168.1.22 --name dubbomonitor  fireicewater/dubbo-monitor dubbo.registry.address=zookeeper://192.168.1.22:15301

docker run -d -p 8084:8084 -p 7070:7070 --name dubbomonitor --hostname=192.168.1.23   fireicewater/dubbo-monitor dubbo.registry.address=zookeeper://192.168.1.23:15301

docker rm -f dubbomonitor
docker run -d -p 8084:8084 -p 7070:7070 --name dubbomonitor --hostname=192.168.1.11   fireicewater/dubbo-monitor dubbo.registry.address=zookeeper://192.168.1.11:15301

docker rm -f dubbomonitor
docker run -d -p 8084:8084 -p 7070:7070 --name dubbomonitor --hostname=172.16.84.200  fireicewater/dubbo-monitor dubbo.registry.address=zookeeper://172.16.84.200:15300

docker run -v /var/run/docker.sock:/var/run/docker.sock \
   centurylink/dockerfile-from-image fireicewater/dubbo-monitor

   docker history fireicewater/dubbo-monitor | \
awk '{print $1}' | \
grep -v IMAGE | grep -v missing | \
tac | \
sed "s/\(.*\)/docker inspect \1 | \
jq -r \'.[0].ContainerConfig.Cmd[2] | tostring\'/" | \
sh | \
sed 's/^#(nop) //'

docker run -d -p 9001:8080 --restart=unless-stopped \
-e ZOOKEEPER_SERVER=172.16.84.200:15300 \
-m 1024M --name dubboadmin \
webuilder/dubboadmin

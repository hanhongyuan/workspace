docker rm -f confluence
docker run -d --name confluence -p 8031:8090 --restart=unless-stopped cptactionhank/atlassian-confluence:6.9.0

firewall-cmd --zone=public --add-port=8031/tcp
firewall-cmd --zone=public --add-port=8031/tcp --permanent

docker cp atlassian-extras-decoder-v2-3.3.0.jar confluence:/opt/atlassian/confluence/confluence/WEB-INF/lib/

docker cp atlassian-universal-plugin-manager-plugin-2.22.5.jar confluence:/opt/atlassian/confluence/confluence/WEB-INF/atlassian-bundled-plugins/
docker restart confluence

docker cp mysql-connector-java-5.1.42-bin.jar confluence:/opt/atlassian/confluence/confluence/WEB-INF/lib/
docker restart confluence


CREATE DATABASE sjfxconfluence  CHARACTER SET utf8 COLLATE utf8_bin;

CREATE USER 'confluence'@'%' IDENTIFIED BY 'sjfx@2018CONFluence';

GRANT ALL ON sjfxconfluence.* TO 'confluence'@'%';






docker rm -f bitbucket
docker run -d --name bitbucket -p 8032:7990 -p 7999:7999 --restart=unless-stopped blacklabelops/bitbucket:5.10.0

firewall-cmd --zone=public --add-port=7999/tcp
firewall-cmd --zone=public --add-port=7999/tcp --permanent
firewall-cmd --zone=public --add-port=8032/tcp
firewall-cmd --zone=public --add-port=8032/tcp --permanent

docker cp mysql-connector-java-5.1.42-bin.jar bitbucket:/opt/bitbucket/app/WEB-INF/lib/
docker restart bitbucket

docker cp atlassian-extras-decoder-v2-3.3.0.jar bitbucket:/opt/bitbucket/app/WEB-INF/lib/

docker cp atlassian-universal-plugin-manager-plugin-2.22.9.jar bitbucket:/opt/bitbucket/app/WEB-INF/atlassian-bundled-plugins/
docker restart bitbucket


docker rm -f bamboo
docker run -d --name bamboo -p 8033:8085 --restart=unless-stopped cptactionhank/atlassian-bamboo:6.5.0

firewall-cmd --zone=public --add-port=8033/tcp
firewall-cmd --zone=public --add-port=8033/tcp --permanent


docker run --name bit-postgres -p 12432:5432 -e POSTGRES_PASSWORD='Sjfx@2018' -d postgres:10.3
firewall-cmd --zone=public --add-port=12432/tcp
firewall-cmd --zone=public --add-port=12432/tcp --permanent

docker run --name wiki-postgres -p 12433:5432 -e POSTGRES_PASSWORD='Sjfx@2018' -d postgres:10.3
firewall-cmd --zone=public --add-port=12433/tcp
firewall-cmd --zone=public --add-port=12433/tcp --permanent
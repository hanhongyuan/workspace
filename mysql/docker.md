# mysql docker install

mkdir -p /mnt/mysqlconf && chmod 777 -R /mnt/mysqlconf && mkdir -p /mnt/mysqldata && chmod 777 -R /mnt/mysqldata

docker rm -f sjfx-mysql
docker run -p 13001:3306 -v /mnt/mysqlconf:/etc/mysql -v /mnt/mysqldata:/var/lib/mysql --name sjfx-mysql -e MYSQL_ROOT_PASSWORD=sjfx-123456 -d mysql:5.7.28


docker rm -f jira-mysql
docker run -p 13000:3306 -v /opt/mysqlconf:/etc/mysql -v /opt/mysqldata:/var/lib/mysql --name jira-mysql -e MYSQL_ROOT_PASSWORD=sjfx-123456 -d mysql:5.7.28

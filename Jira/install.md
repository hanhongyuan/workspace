

docker rm -f jira
docker run -d --name jira -p 8039:8080 -v /mnt/atall/jira/backup:/var/atlassian/jira/export --restart=unless-stopped blacklabelops/jira:7.9.0

firewall-cmd --zone=public --add-port=8039/tcp
firewall-cmd --zone=public --add-port=8039/tcp --permanent

docker cp atlassian-extras-3.2.jar jira:/opt/jira/atlassian-jira/WEB-INF/lib/
docker cp mysql-connector-java-5.1.42-bin.jar jira:/opt/jira/atlassian-jira/WEB-INF/lib/
docker cp atlassian-universal-plugin-manager-plugin-2.22.4.jar jira:/opt/jira/atlassian-jira/WEB-INF/atlassian-bundled-plugins/

docker restart jira

docker run -d --name jiranew -p 8039:8080 -v /mnt/atall/jira/backup:/var/atlassian/jira/export --restart=unless-stopped blacklabelops/jira:7.9.0

docker cp atlassian-extras-3.2.jar jiranew:/opt/jira/atlassian-jira/WEB-INF/lib/
docker cp mysql-connector-java-5.1.42-bin.jar jiranew:/opt/jira/atlassian-jira/WEB-INF/lib/
docker cp atlassian-universal-plugin-manager-plugin-2.22.4.jar jiranew:/opt/jira/atlassian-jira/WEB-INF/atlassian-bundled-plugins/

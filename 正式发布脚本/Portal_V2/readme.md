1. 获取发布文件，可以手动也可以使用脚本：
    getzip.sh 下载压缩文件后解压 例如`sh getzip.sh 11934 Mobile`（推荐）
2. 使用xxxxpublish.sh 发布 例如`sh mobilepublish.sh 11934`

3. 使用xxxxrollback.sh 回滚 例如`sh mobilerollback.sh 11934`

4. 脚本最好不要直接上传可能会有乱码

mkdir -p /mnt/teamcity/datadir
mkdir -p /mnt/teamcity/log
chmod 777 -R /mnt/teamcity/
docker run -it --name teamcity-server-instance  \
    -v /mnt/teamcity/datadir:/data/teamcity_server/datadir \
    -v /mnt/teamcity/log:/opt/teamcity/logs  \
    -p 8111:8111 \
    jetbrains/teamcity-server



tar -xzf jdk-8u111-linux-x64.tar.gz
 echo "JAVA_HOME=/mnt/jdk-10/" >> /etc/profile
 echo "PATH=$JAVA_HOME/bin:$PATH" >> /etc/profile
 echo "CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /etc/profile



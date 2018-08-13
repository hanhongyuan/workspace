# 服务器部署

## 本地测试环境

1. 下载
`wget --http-user=sjfxdev --http-password=Sjfx@2018 http://maven.sjfx.com.cn/repository/maven-releases/cn/com/sjfx/distributedid/1.0.1/distributedid-1.0.1.jar`

2. 运行
`java -jar distributedid-1.0.1.jar 1 1`

## docker

1.  创建docker

   下载，见上
   重命名：

   `mv  distributedid-1.0.1.jar distributedid.jar`

   创建[Dockerfile](Dockerfile)

   创建执行脚本[run.sh](run.sh)

   创建：

   `sudo docker build -t sjfx/snowid:1.0.1 .`

2. 运行docker容器

   `sudo docker run -d -p 16000:16830  -p 16001:16831 -e CENT_ID=2 -e PROCESS_ID=2 --name snowid01-01 sjfx/snowid:1.0.1`

3. 开启防火墙

   ```bash
   firewall-cmd --zone=public --add-port=16000/tcp
   
   firewall-cmd --zone=public --add-port=16000/tcp --permanent
   
   firewall-cmd --zone=public --add-port=16001/tcp
   
   firewall-cmd --zone=public --add-port=16001/tcp --permanent
   
   ```

   

4. 调试命令脚本

   ```bash
   sudo docker build -t sjfx/snowid:1.0.1 .
   
   sudo docker run -d -p 16000:16830  -p 16001:16831 -e CENT_ID=2 -e PROCESS_ID=2 --name snowid01-01 sjfx/snowid:1.0.1
   
   firewall-cmd --zone=public --add-port=16000/tcp
   
   firewall-cmd --zone=public --add-port=16000/tcp --permanent
   
   firewall-cmd --zone=public --add-port=16001/tcp
   
   firewall-cmd --zone=public --add-port=16001/tcp --permanent
   
   docker rm -f snowid01-01
   
   docker rmi sjfx/snowid:1.0.1
   
   sudo docker run -it --rm -p 16000:16830  -p 16001:16831 -e CENT_ID=1 -e PROCESS_ID=1 --name snowid01-01 sjfx/snowid:1.0.1
   
   docker rmi sjfx/snowid:1.0.1
   
   sudo docker build -t sjfx/snowid:1.0.1 .
   
   sudo docker run -it --rm -p 16000:16830  -p 16001:16831 -e CENT_ID=1 -e PROCESS_ID=2 --name snowid01-01 sjfx/snowid:1.0.1
   
   java -jar distributedid.jar 1 1
   
   docker login -u sjfx -p sjfx2018
   
   docker push sjfx/snowid:1.0.1
   
   ```

   


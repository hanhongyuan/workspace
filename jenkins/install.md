1.  安装 .NET Core 2.0 SDK
    参考 https://docs.microsoft.com/en-us/dotnet/core/linux-prerequisites?tabs=netcore2x
2.  安装 jenkins
    2.1 添加 jenkins 库
    wget -O /etc/yum.repos.d/jenkins.repo http://jenkins-ci.org/redhat/jenkins.repo
    rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
    2.2 使用 yum 命令来安装
    yum install jenkins -y
    2.3 运行
    sudo systemctl start jenkins.service
    sudo systemctl enable jenkins.service
    3.4 修改默认访问端口
    jenkins 的配置文件 jenkins 在/etc/sysconfig，我这里修改端口为 9191
    2.5 在防火墙打开端口
    firewall-cmd --zone=public --add-port=9191/tcp --permanent
    参考 https://segmentfault.com/a/1190000006751968
3.  安装 docker
    3.1 Docker 使用非 root 用户
    http://blog.csdn.net/kongxx/article/details/52413332
4.  安装其他工具
    4.1 svn
    yum install svn -y
    4.2 zip
    yum install zip -y

5.  配置编译脚本

# 导入配置

export PATH=$PATH:/usr/share/dotnet

# restore

dotnet restore

# publish

dotnet publish -c Release -o out #删除已存在 docker
for i in `docker ps -af name=webapi -f name=mobile -f name=portal |grep SJFX|awk '{print $1}'`;do echo \ &&docker rm -f $i; done

# Portal 添加额外引用文件

rm -f SJFX.Sjono.Portal/out/aliyun-net-sdk-core.dll
rm -f SJFX.Sjono.Portal/out/aliyun-net-sdk-dysmsapi.dll
rm -f SJFX.Sjono.Portal/out/SJFX.Sms.Aliyun.dll
rm -f SJFX.Sjono.Portal/out/SJFX.Sms.dll
rm -f SJFX.Sjono.Portal/out/SJFX.Sms.Yuntongxun.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-core.dll SJFX.Sjono.Portal/out/aliyun-net-sdk-core.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-dysmsapi.dll SJFX.Sjono.Portal/out/aliyun-net-sdk-dysmsapi.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Aliyun.dll SJFX.Sjono.Portal/out/SJFX.Sms.Aliyun.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.dll SJFX.Sjono.Portal/out/SJFX.Sms.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Yuntongxun.dll SJFX.Sjono.Portal/out/SJFX.Sms.Yuntongxun.dll #创建并运行 Portal docker
cd SJFX.Sjono.Portal/out
docker build -t portal .
docker run -d -p 5000:80 --name portal portal

# Mobile 添加额外引用文件

cd ../..
rm -f SJFX.Sjono.Mobile/out/aliyun-net-sdk-core.dll
rm -f SJFX.Sjono.Mobile/out/aliyun-net-sdk-dysmsapi.dll
rm -f SJFX.Sjono.Mobile/out/SJFX.Sms.Aliyun.dll
rm -f SJFX.Sjono.Mobile/out/SJFX.Sms.dll
rm -f SJFX.Sjono.Mobile/out/SJFX.Sms.Yuntongxun.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-core.dll SJFX.Sjono.Mobile/out/aliyun-net-sdk-core.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-dysmsapi.dll SJFX.Sjono.Mobile/out/aliyun-net-sdk-dysmsapi.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Aliyun.dll SJFX.Sjono.Mobile/out/SJFX.Sms.Aliyun.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.dll SJFX.Sjono.Mobile/out/SJFX.Sms.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Yuntongxun.dll SJFX.Sjono.Mobile/out/SJFX.Sms.Yuntongxun.dll

# 创建并运行 Mobile docker

cd SJFX.Sjono.Mobile/out
docker build -t mobile .
docker run -d -p 5001:80 --name mobile mobile

# WebApi 添加额外引用文件

cd ../..
rm -f SJFX.Sjono.WebApi/out/aliyun-net-sdk-core.dll
rm -f SJFX.Sjono.WebApi/out/aliyun-net-sdk-dysmsapi.dll
rm -f SJFX.Sjono.WebApi/out/SJFX.Sms.Aliyun.dll
rm -f SJFX.Sjono.WebApi/out/SJFX.Sms.dll
rm -f SJFX.Sjono.WebApi/out/SJFX.Sms.Yuntongxun.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-core.dll SJFX.Sjono.WebApi/out/aliyun-net-sdk-core.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-dysmsapi.dll SJFX.Sjono.WebApi/out/aliyun-net-sdk-dysmsapi.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Aliyun.dll SJFX.Sjono.WebApi/out/SJFX.Sms.Aliyun.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.dll SJFX.Sjono.WebApi/out/SJFX.Sms.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Yuntongxun.dll SJFX.Sjono.WebApi/out/SJFX.Sms.Yuntongxun.dll

# 创建并运行 WebApi docker

cd SJFX.Sjono.WebApi/out
docker build -t webapi .
docker run -d -p 5002:80 --name webapi webapi #将发布文件复制到用户的 publish\_项目目录下并压缩
cd ../..
svnv=`cat .svn/entries |head -n 4 | tail -n +4`
echo $svnv
mkdir -p ~/publish_Sjono/$svnv
rm -rf ~/publish_Sjono/$svnv/SJFX.Sjono.Portal
cp -R SJFX.Sjono.Portal/out ~/publish_Sjono/$svnv/SJFX.Sjono.Portal
zip -q -r ~/publish_Sjono/$svnv/SJFX.Sjono.Portal.zip ~/publish_Sjono/$svnv/SJFX.Sjono.Portal
rm -rf ~/publish_Sjono/$svnv/SJFX.Sjono.WebApi
cp -R SJFX.Sjono.WebApi/out ~/publish_Sjono/$svnv/SJFX.Sjono.WebApi
zip -q -r ~/publish_Sjono/$svnv/SJFX.Sjono.WebApi.zip ~/publish_Sjono/$svnv/SJFX.Sjono.WebApi
rm -rf ~/publish_Sjono/$svnv/SJFX.Sjono.Mobile
cp -R SJFX.Sjono.Mobile/out ~/publish_Sjono/$svnv/SJFX.Sjono.Mobile
zip -q -r ~/publish_Sjono/$svnv/SJFX.Sjono.Mobile.zip ~/publish_Sjono/$svnv/SJFX.Sjono.Mobile

rm -rf ~/publish_Sjono/
问题参考：http://blog.csdn.net/lihongzhai/article/details/79039160

6.  给发布项目添加 Dockerfile 文件参考：

     5.1.

FROM microsoft/aspnetcore-build:2.0 AS build-env
WORKDIR /app

#restore as distinct layers
COPY . ./
RUN dotnet restore

# copy everything else and build

RUN dotnet publish -c Release -o out

# build runtime image

FROM microsoft/aspnetcore:2.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "TestWebApplication.dll"]

    5.2

FROM microsoft/aspnetcore:2.0
WORKDIR /app
COPY . .
ENTRYPOINT ["dotnet", "SJFX.Sjono.Portal.dll"]

#构建 docker
docker build -t sjfx/platformportal:10576 ./Portal #启动 docker
docker rm -f platformportal
docker run -d -p 8210:5002 --name platformportal sjfx/platformportal:10576 #登陆服务器并将 docker 上传到服务器
docker login -u sjfx -p sjfx2018
docker push sjfx/platformportal:10576

for i in `docker ps -a |awk '{print $1}'`;do echo \ &&docker rm -f $i; done
sudo docker run -e CATTLE_AGENT_IP="192.168.79.151" --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.9 http://192.168.79.150:8080/v1/scripts/DDD4359AFEFCE849A570:1514678400000:ApTYNib8m9tyX29qK7pyV7GLFE

for i in `docker ps -a |awk '{print $1}'`;do echo \ &&docker rm -f $i; done
sudo docker run -e CATTLE_AGENT_IP="192.168.79.152" --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.9 http://192.168.79.150:8080/v1/scripts/DDD4359AFEFCE849A570:1514678400000:ApTYNib8m9tyX29qK7pyV7GLFE

for i in `docker ps -a |awk '{print $1}'`;do echo \ &&docker rm -f $i; done
sudo docker run -e CATTLE_AGENT_IP="192.168.79.153" --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.9 http://192.168.79.150:8080/v1/scripts/DDD4359AFEFCE849A570:1514678400000:ApTYNib8m9tyX29qK7pyV7GLFE

reboot

for i in `docker ps -a |awk '{print $1}'`;do echo \ &&docker rm -f $i; done

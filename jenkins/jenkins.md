1. 安装镜像
   docker pull jenkins

2. 创建相关目录
   mkdir jenkins
   cd jenkins
   mkdir home
   chmod 777 home
   cd ..

3. 启动镜像
   docker run -p 8080:8080 -p 50000:50000 -v $PWD/jenkins/home/:/var/jenkins_home jenkins

docker run --name core-jenkins -p 8080:8080 -p 50000:50000 \
 -v /home/jenkinscore/home:/var/jenkins_home \
 -v /usr/bin/docker:/bin/docker \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -d core-jenkins

4. 访问站点

5. 获取变更日志

https://twiceyuan.com/2017/02/21/jenkins-changelog/

安装成功以后，在项目配置的 Build Environment（构建环境） 环节，会多出一个选项：Add Changelog Information to Environment。下面有三个编辑框，分别是：Entry Format、File Item Format 和 Date Format。第一个就是填写提交日志输出格式的地方，采用的是 Java String.format 占位符的形式。其中可以使用四个参数，分别是：

提交的作者
提交的 ID
提交信息
提交时间(通过 Date Format 控制格式)

例如，我在 Entry Format 输入 `%3$s author %1$s  [at %4$s]\n`，同样时间格式编辑框填写的是：`yyyy-MM-dd`。




发布脚本：

<!-- rm -rf $PWD/app
dotnet restore
dotnet publish /nologo
mkdir app
cp Dockerfile $PWD/app
cp $PWD/bin/Debug/netcoreapp2.0/publish/*.*  $PWD/app
cd app -->

docker rm -f testweb
docker build -t testweb .
docker run -d -p 5000:80 --name testweb testweb

<!-- docker run -d -p 5000:5000 testweb -->

cd SJFX.Sjono.Portal/out
docker rm -f portal
docker build -t portal .
docker run -d -p 5000:80 --name portal portal

cp -r lib/SJFX.Sms/ SJFX.Sjono.Portal/out/

rm -f SJFX.Sjono.Portal/out/aliyun-net-sdk-core.dll
rm -f SJFX.Sjono.Portal/out/aliyun-net-sdk-dysmsapi.dll
rm -f SJFX.Sjono.Portal/out/SJFX.Sms.Aliyun.dll
rm -f SJFX.Sjono.Portal/out/SJFX.Sms.dll
rm -f SJFX.Sjono.Portal/out/SJFX.Sms.Yuntongxun.dll

cp -rf lib/SJFX.Sms/aliyun-net-sdk-core.dll SJFX.Sjono.Portal/out/aliyun-net-sdk-core.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-dysmsapi.dll SJFX.Sjono.Portal/out/aliyun-net-sdk-dysmsapi.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Aliyun.dll SJFX.Sjono.Portal/out/SJFX.Sms.Aliyun.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.dll SJFX.Sjono.Portal/out/SJFX.Sms.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Yuntongxun.dll SJFX.Sjono.Portal/out/SJFX.Sms.Yuntongxun.dll

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

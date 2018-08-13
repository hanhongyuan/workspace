# 导入配置
export PATH=$PATH:/usr/share/dotnet
# publish
dotnet restore ./SJFX.Pub/SJFX.Portal.Pub.sln
dotnet publish ./SJFX.Pub/SJFX.Portal.Pub.sln -c Release -o ../outPortal
dotnet restore ./SJFX.Pub/SJFX.Mobile.Pub.sln
dotnet publish ./SJFX.Pub/SJFX.Mobile.Pub.sln -c Release -o ../outMobile
dotnet restore ./SJFX.Pub/SJFX.WebApi.Pub.sln
dotnet publish ./SJFX.Pub/SJFX.WebApi.Pub.sln -c Release -o ../outWebApi

# WebApi 添加额外文件

# rm -f ./outWebApi/Hangfire.Core.dll
# rm -f ./outWebApi/Hangfire.AspNetCore.dll
# rm -f ./outWebApi/Hangfire.SqlServer.dll
# cp -rf lib/SJFX.Sms/Hangfire.SqlServer.dll ./outWebApi/Hangfire.SqlServer.dll
# cp -rf lib/SJFX.Sms/Hangfire.AspNetCore.dll ./outWebApi/Hangfire.AspNetCore.dll
# cp -rf lib/SJFX.Sms/Hangfire.Core.dll ./outWebApi/Hangfire.Core.dll
rm -f ./outMobile/librdkafka*.*
cp -rf lib/librdkafka*.* ./outMobile
rm -f ./outPortal/librdkafka*.*
cp -rf lib/librdkafka*.* ./outPortal

# 将发布文件复制到用户的 publish\_项目目录下并压缩

svnv=$SVN_REVISION
savePath='/mnt/publish_Portal/'$svnv
portalPath=$savePath'/Portal'
mobilePath=$savePath'/Mobile'
webaipPath=$savePath'/WebApi'
mkdir -p $savePath
rm -rf $portalPath
cp -R outPortal $portalPath
zip -q -r $portalPath.zip $portalPath
rm -rf $mobilePath
cp -R outMobile $mobilePath
zip -q -r $mobilePath.zip $mobilePath
rm -rf $webaipPath
cp -R outWebApi $webaipPath
zip -q -r $webaipPath.zip $webaipPath

# #删除原已运行容器
 for i in  `docker ps -af name=platform* |grep sjfx|awk '{print $1}'`;do echo \ &&docker rm -f $i; done
 for i in  `docker images sjfx/platform* |grep sjfx|awk '{print $3}'`;do echo \ &&docker rmi -f $i; done
# #登陆服务器
docker login -u sjfx -p sjfx2018
# #构建docker
 docker build -t sjfx/platformportal:$svnv $portalPath
 docker build -t sjfx/platformwebapi:$svnv $webaipPath
 docker build -t sjfx/platformmobile:$svnv $mobilePath
# #启动docker
 docker run -d -p 8210:5002 --name platformportal sjfx/platformportal:$svnv
 docker run -d -p 8220:8001 --name platformwebapi sjfx/platformwebapi:$svnv
 docker run -d -p 8230:5000 --name platformmobile sjfx/platformmobile:$svnv
# #将docker上传到服务器
#  docker push sjfx/platformportal:$svnv
#  docker push sjfx/platformwebapi:$svnv
#  docker push sjfx/platformmobile:$svnv

# 导入配置
export PATH=$PATH:/usr/share/dotnet
# publish
vision=`cat Sjfxsoft.AuthCenter/Sjfxsoft.AuthCenter.csproj |egrep -o '<Version>.*</Version>'|awk  -F '>'  '{print $2}'|awk -F '<'  '{print $1}'`
svnv=$vision'.'$SVN_REVISION
out='./'$svnv
dotnet restore Sjfxsoft.AuthCenter.sln
dotnet publish Sjfxsoft.AuthCenter.sln -c Release -o $out
# 将发布文件复制到用户的 publish\_项目目录下并压缩

rootPath='/mnt/publish_AuthCenter/'
savePath=$rootPath$svnv
mkdir -p $rootPath

cp -R './Sjfxsoft.AuthCenter/'$svnv $rootPath
zip -q -r $savePath.zip $savePath

# #删除原已运行容器
 for i in  `docker ps -af name=sjfxauthcenter* |grep sjfx|awk '{print $1}'`;do echo \ &&docker rm -f $i; done
 for i in  `docker images sjfx/authcenter* |grep sjfx|awk '{print $3}'`;do echo \ &&docker rmi -f $i; done
# #登陆服务器
 docker login -u sjfx -p sjfx2018
# #构建docker
 docker build -t sjfx/authcenter:$SVN_REVISION $savePath
# #启动docker
 docker run -d -p 8301:80 --name sjfxauthcenter sjfx/authcenter:$SVN_REVISION

# #将docker上传到服务器
 docker push sjfx/authcenter:$SVN_REVISION



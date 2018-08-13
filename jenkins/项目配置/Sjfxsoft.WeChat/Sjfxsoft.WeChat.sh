# 导入配置
export PATH=$PATH:/usr/share/dotnet
# publish
vision=`cat Sjfxsoft.WeChat.Host/Sjfxsoft.WeChat.Host.csproj |egrep -o '<Version>.*</Version>'|awk  -F '>'  '{print $2}'|awk -F '<'  '{print $1}'`
svnv=$vision'.'$SVN_REVISION
out='./'$svnv
dotnet restore Sjfxsoft.WeChat.sln
dotnet publish Sjfxsoft.WeChat.sln -c Release -o $out
# 将发布文件复制到用户的 publish\_项目目录下并压缩

rootPath='/mnt/publish_WeChat/'
savePath=$rootPath$svnv
mkdir -p $rootPath

cp -R './Sjfxsoft.WeChat.Host/'$svnv $rootPath
zip -q -r $savePath.zip $savePath

# #删除原已运行容器
 for i in  `docker ps -af name=sjfxwechat* |grep sjfx|awk '{print $1}'`;do echo \ &&docker rm -f $i; done
 for i in  `docker images sjfx/wechat* |grep sjfx|awk '{print $3}'`;do echo \ &&docker rmi -f $i; done
# #登陆服务器
 docker login -u sjfx -p sjfx2018
# #构建docker
 docker build -t sjfx/wechat:$SVN_REVISION $savePath
# #启动docker
 docker run -d -p 8302:80 --name sjfxwechat sjfx/wechat:$SVN_REVISION

# #将docker上传到服务器
 docker push sjfx/wechat:$SVN_REVISION



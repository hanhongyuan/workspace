# 导入配置
export PATH=$PATH:/usr/share/dotnet
# publish
vision=`cat Sjfxsofrt.Face/Sjfxsofrt.Face.csproj |egrep -o '<Version>.*</Version>'|awk  -F '>'  '{print $2}'|awk -F '<'  '{print $1}'`
svnv=$vision'.'$SVN_REVISION
out='./'$svnv
dotnet restore Sjfxsofrt.Face.sln
dotnet publish Sjfxsofrt.Face.sln -c Release -o $out
# 将发布文件复制到用户的 publish\_项目目录下并压缩

rootPath='/mnt/publish_SjfxsofrtFace/'
savePath=$rootPath$svnv
mkdir -p $rootPath

cp -R './Sjfxsofrt.Face/'$svnv $rootPath
zip -q -r $savePath.zip $savePath

# #删除原已运行容器
 for i in  `docker ps -af name=sjfxface* |grep sjfx|awk '{print $1}'`;do echo \ &&docker rm -f $i; done
 for i in  `docker images sjfx/face* |grep sjfx|awk '{print $3}'`;do echo \ &&docker rmi -f $i; done
# #登陆服务器
 docker login -u sjfx -p sjfx2018
# #构建docker
 docker build -t sjfx/face:$SVN_REVISION $savePath
# #启动docker
 docker run -d -p 8310:80 --name sjfxface sjfx/face:$SVN_REVISION

# #将docker上传到服务器
 docker push sjfx/face:$SVN_REVISION



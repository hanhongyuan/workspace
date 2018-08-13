# 导入配置
export PATH=$PATH:/usr/share/dotnet
# restore
dotnet restore
# publish
dotnet publish -c Release -o out
# Portal添加额外引用文件
rm -f SJFX.Sjono.Portal/out/aliyun-net-sdk-core.dll
rm -f SJFX.Sjono.Portal/out/aliyun-net-sdk-dysmsapi.dll
rm -f SJFX.Sjono.Portal/out/SJFX.Sms.Aliyun.dll
rm -f SJFX.Sjono.Portal/out/SJFX.Sms.dll
rm -f SJFX.Sjono.Portal/out/SJFX.Sms.Yuntongxun.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-core.dll     SJFX.Sjono.Portal/out/aliyun-net-sdk-core.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-dysmsapi.dll SJFX.Sjono.Portal/out/aliyun-net-sdk-dysmsapi.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Aliyun.dll         SJFX.Sjono.Portal/out/SJFX.Sms.Aliyun.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.dll                SJFX.Sjono.Portal/out/SJFX.Sms.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Yuntongxun.dll     SJFX.Sjono.Portal/out/SJFX.Sms.Yuntongxun.dll

# Mobile添加额外引用文件
rm -f SJFX.Sjono.Mobile/out/aliyun-net-sdk-core.dll
rm -f SJFX.Sjono.Mobile/out/aliyun-net-sdk-dysmsapi.dll
rm -f SJFX.Sjono.Mobile/out/SJFX.Sms.Aliyun.dll
rm -f SJFX.Sjono.Mobile/out/SJFX.Sms.dll
rm -f SJFX.Sjono.Mobile/out/SJFX.Sms.Yuntongxun.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-core.dll     SJFX.Sjono.Mobile/out/aliyun-net-sdk-core.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-dysmsapi.dll SJFX.Sjono.Mobile/out/aliyun-net-sdk-dysmsapi.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Aliyun.dll         SJFX.Sjono.Mobile/out/SJFX.Sms.Aliyun.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.dll                SJFX.Sjono.Mobile/out/SJFX.Sms.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Yuntongxun.dll     SJFX.Sjono.Mobile/out/SJFX.Sms.Yuntongxun.dll

# WebApi添加额外引用文件
rm -f SJFX.Sjono.WebApi/out/aliyun-net-sdk-core.dll
rm -f SJFX.Sjono.WebApi/out/aliyun-net-sdk-dysmsapi.dll
rm -f SJFX.Sjono.WebApi/out/SJFX.Sms.Aliyun.dll
rm -f SJFX.Sjono.WebApi/out/SJFX.Sms.dll
rm -f SJFX.Sjono.WebApi/out/SJFX.Sms.Yuntongxun.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-core.dll     SJFX.Sjono.WebApi/out/aliyun-net-sdk-core.dll
cp -rf lib/SJFX.Sms/aliyun-net-sdk-dysmsapi.dll SJFX.Sjono.WebApi/out/aliyun-net-sdk-dysmsapi.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Aliyun.dll         SJFX.Sjono.WebApi/out/SJFX.Sms.Aliyun.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.dll                SJFX.Sjono.WebApi/out/SJFX.Sms.dll
cp -rf lib/SJFX.Sms/SJFX.Sms.Yuntongxun.dll     SJFX.Sjono.WebApi/out/SJFX.Sms.Yuntongxun.dll

#将发布文件复制到用户的publish_项目目录下并压缩
svnv=$SVN_REVISION
savePath='/mnt/publish_Sjono/'$svnv
portalPath=$savePath'/Portal'
mobilePath=$savePath'/Mobile'
webaipPath=$savePath'/WebApi'
mkdir -p $savePath

rm -rf $portalPath
cp -R ./SJFX.Sjono.Portal/out/ $portalPath
zip -q -r $portalPath.zip $portalPath
rm -rf $mobilePath
cp -R ./SJFX.Sjono.Mobile/out/ $mobilePath
zip -q -r $mobilePath.zip $mobilePath
rm -rf $webaipPath
cp -R ./SJFX.Sjono.WebApi/out/ $webaipPath
zip -q -r $webaipPath.zip $webaipPath

echo BRANCH_NAME: $BRANCH_NAME >> $savePath'/readme.md'
echo CHANGE_URL: $CHANGE_URL >> $savePath'/readme.md'
echo CHANGE_TITLE: $CHANGE_TITLE >> $savePath'/readme.md'
echo CHANGE_TARGET: $CHANGE_TARGET >> $savePath'/readme.md'
echo BUILD_DISPLAY_NAME: $BUILD_DISPLAY_NAME >> $savePath'/readme.md'
echo BUILD_TAG: $BUILD_TAG >> $savePath'/readme.md'
echo SVN_REVISION: $SVN_REVISION >> $savePath'/readme.md'

#删除已存在docker
for i in  `docker ps -af name=webapi -f name=mobile -f name=portal |grep SJFX|awk '{print $1}'`;do echo \ &&docker rm -f $i; done
#创建并运行Portal docker 
docker build -t portal $portalPath
docker run -d -p 5000:80 --name portal  portal
# 创建并运行Mobile docker 
cd SJFX.Sjono.Mobile/out
docker build -t mobile $mobilePath
docker run -d -p 5001:80 --name mobile  mobile
# 创建并运行WebApi docker 
cd SJFX.Sjono.WebApi/out
docker build -t webapi $webaipPath
docker run -d -p 5002:80 --name webapi  webapi


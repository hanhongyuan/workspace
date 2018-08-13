
# restore
dotnet restore
# publish
dotnet publish -c Release -o out
# Portal添加额外引用文件
Copy-Item .\lib\SJFX.Sms\aliyun-net-sdk-core.dll     .\SJFX.Sjono.Portal\out\aliyun-net-sdk-core.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\aliyun-net-sdk-dysmsapi.dll .\SJFX.Sjono.Portal\out\aliyun-net-sdk-dysmsapi.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\SJFX.Sms.Aliyun.dll         .\SJFX.Sjono.Portal\out\SJFX.Sms.Aliyun.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\SJFX.Sms.dll                .\SJFX.Sjono.Portal\out\SJFX.Sms.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\SJFX.Sms.Yuntongxun.dll     .\SJFX.Sjono.Portal\out\SJFX.Sms.Yuntongxun.dll -Force -Confirm:$false

# Mobile添加额外引用文件
Copy-Item .\lib\SJFX.Sms\aliyun-net-sdk-core.dll     .\SJFX.Sjono.Mobile\out\aliyun-net-sdk-core.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\aliyun-net-sdk-dysmsapi.dll .\SJFX.Sjono.Mobile\out\aliyun-net-sdk-dysmsapi.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\SJFX.Sms.Aliyun.dll         .\SJFX.Sjono.Mobile\out\SJFX.Sms.Aliyun.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\SJFX.Sms.dll                .\SJFX.Sjono.Mobile\out\SJFX.Sms.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\SJFX.Sms.Yuntongxun.dll     .\SJFX.Sjono.Mobile\out\SJFX.Sms.Yuntongxun.dll -Force -Confirm:$false

# WebApi添加额外引用文件
Copy-Item .\lib\SJFX.Sms\aliyun-net-sdk-core.dll     .\SJFX.Sjono.WebApi\out\aliyun-net-sdk-core.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\aliyun-net-sdk-dysmsapi.dll .\SJFX.Sjono.WebApi\out\aliyun-net-sdk-dysmsapi.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\SJFX.Sms.Aliyun.dll         .\SJFX.Sjono.WebApi\out\SJFX.Sms.Aliyun.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\SJFX.Sms.dll                .\SJFX.Sjono.WebApi\out\SJFX.Sms.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\SJFX.Sms.Yuntongxun.dll     .\SJFX.Sjono.WebApi\out\SJFX.Sms.Yuntongxun.dll -Force -Confirm:$false

#将发布文件复制到用户的publish_项目目录下并压缩
$svnv = $SVN_REVISION
$savePath = 'D:\wwwroot\inside\dev\' + $svnv
$portalPath = $savePath + 'portal\'
$mobilePath = $savePath + 'mobile\'
$webaipPath = $savePath + 'api\'

md -f $savePath
md -f $portalPath
md -f $mobilePath
md -f $webaipPath

Remove-Item  $portalPath -Recurse -Force -Confirm:$false
Copy-Item ./SJFX.Sjono.Portal/out/ $portalPath -Recurse -Force -Confirm:$false

Remove-Item  $mobilePath -Recurse -Force -Confirm:$false
Copy-Item ./SJFX.Sjono.Mobile/out/ $mobilePath -Recurse -Force -Confirm:$false

Remove-Item  $webaipPath -Recurse -Force -Confirm:$false
Copy-Item ./SJFX.Sjono.WebApi/out/ $webaipPath -Recurse -Force -Confirm:$false

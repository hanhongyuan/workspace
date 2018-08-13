# restore
dotnet restore
# publish
dotnet publish -c Release -o out
# 添加额外引用文件
Copy-Item .\lib\SJFX.Sms\aliyun-net-sdk-core.dll     .\SJFX.Sjono.Mobile\out\aliyun-net-sdk-core.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\aliyun-net-sdk-dysmsapi.dll .\SJFX.Sjono.Mobile\out\aliyun-net-sdk-dysmsapi.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\SJFX.Sms.Aliyun.dll         .\SJFX.Sjono.Mobile\out\SJFX.Sms.Aliyun.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\SJFX.Sms.dll                .\SJFX.Sjono.Mobile\out\SJFX.Sms.dll -Force -Confirm:$false
Copy-Item .\lib\SJFX.Sms\SJFX.Sms.Yuntongxun.dll     .\SJFX.Sjono.Mobile\out\SJFX.Sms.Yuntongxun.dll -Force -Confirm:$false

# 基本变量
# 代码版本号
$SVN_REVISION = (Get-Content .\version) + (Get-Content .\.svn\entries)[3]
# 站点路径
$rootPath = 'D:\wwwroot\inside\dev\'
$appPath = $rootPath + 'mobile_' + $SVN_REVISION
#站点信息
$appname = 'dev/mobile'
$appclaername = 'mobile'
$apppool = 'inside_dev'
$sitename = 'inside\dev'
# 需要备份的配置文件
$config = $appPath + "\appsettings.json" 

# 删除老的目录并新建
Remove-Item  $appPath -Recurse -Force -Confirm:$false
md $appPath -f

# 将发布好的文件复制到站点目录
xcopy SJFX.Sjono.Mobile\out $appPath /E /Y

# 复制配置文件
C:\Windows\System32\WindowsPowerShell\v1.0\Powershell.exe -ExecutionPolicy ByPass -noprofile -file ".\copyconfig.ps1"  -appPath $appPath -configpath $config

# 切换站点到新版本
C:\Windows\System32\WindowsPowerShell\v1.0\Powershell.exe -ExecutionPolicy ByPass -noprofile -file ".\resetwebapplication.ps1" -appname $appclaername -sitename $sitename -path $appPath  -apppool $apppool
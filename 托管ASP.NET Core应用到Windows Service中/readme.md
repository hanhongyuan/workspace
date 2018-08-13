1. 在 ASP.NET Core 应用中 切换框架到.net 461
编辑项目文件
<TargetFramework>net461</TargetFramework>
2. 添加 Microsoft.AspNetCore.Hosting.WindowsServices 引用。
在Program.cs 中using Microsoft.AspNetCore.Hosting.WindowsServices;
3. Main方法中修改Run为RunAsService，如：
     BuildWebHost(args).RunAsService();
     具体参考：Program.cs
4. 重新编译生成。（坑1）请注意一定要使用命令行发布，命令
     dotnet publish --configuration Release --output 服务目录
    我使用VS发布死活不能用
5. cmd安装服务 （坑2）无论在哪个目录执行请输入完整目录：
    sc create 服务名 binPath=文件目录
    sc create MyWinService binPath="C:\Code\win7-x64\host.exe"
6. 设置服务自动执行及启动
    sc config 服务名 start=AUTO 
    sc config MyWinService start=AUTO 
    sc start 服务名
    sc start MyWinService
    sc delete 服务名
    sc delete MyWinService
7. 使用powershell 以管理员权限运行
    New-Service -Name "MyWinService" -BinaryPathName "C:\Code\win7-x64\host.exe" -StartupType AUTO
    Start-Service  "MyWinService"
    Stop-Service  "MyWinService"
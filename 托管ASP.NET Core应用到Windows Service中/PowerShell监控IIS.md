1. 查看是否有执行权限
启动Powershell，输入Get-ExecutionPolicy，查看结果，若输出值是Restricted，则表示执行受限制。
2. 设置执行权限
用管理员身份运行Powershell，输入Set-ExecutionPolicy RemoteSigned

3. 使用监控脚本监控服务及站点 文件 run.ps1 是1不是l
    3.1 监控windows服务 参数 -Services
        多个用","分隔例如：
        -Services 'W3SVC'
    3.2 监控IIS站点 参数-Sites
        多个用","分隔例如：
        -Sites 'Default Web Site,GraphiQLTest'
4. 使用autorun.bat 调用powershell文件
4. 添加计划任务，详情见截图
    注意：一定要以管理员（administrator或administrators）执行计划任务。
 
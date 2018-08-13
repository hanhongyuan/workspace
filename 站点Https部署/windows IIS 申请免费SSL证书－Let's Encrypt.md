此文档已过期，请参考 站点Https部署.md
此文档已过期，请参考 站点Https部署.md
此文档已过期，请参考 站点Https部署.md

windows iis 申请免费SSL证书－Let's Encrypt

1. 安装，以管理员权限运行打开PowerShell执行：
    Install-Module ACMESharp
    Install-Module ACMESharp.Providers.IIS
2. 导入ACMESharp模块
    Import-Module ACMESharp
    Enable-ACMEExtensionModule ACMESharp.Providers.IIS
    Get-ACMEExtensionModule | Select-Object -Expand Name
        output:ACMESharp.Providers.IIS
    2.1 如果报错，请查看执行策略并修改
        Get-ExecutionPolicy
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
4. 在LE填写注册信息，接受注册协议
    New-ACMERegistration -Contacts mailto:name@email.com -AcceptTos
5. 创建一个你要申请域名身份
    New-ACMEIdentifier -Dns myside.com -Alias www-myside-com
    -Alias 指定别名为 www-myside-com 后续多处使用该别名

     New-ACMEIdentifier -Dns sxqbtzb.sjfx.com.cn, -Alias sxqbtzbsjfx20180417

    检查
    Get-ACMEIdentifier insidesjono | select -expand Challenges | select Type
    Get-ACMEIdentifier insidesjono | select -expand Combinations
6. 认证域名所有权,是IIS web服务器执行：
    Complete-ACMEChallenge  insidesjono -ChallengeType http-01 -Handler iis -HandlerParameters @{ WebSiteRef = 'inside' }
    如果报错 Submit-ACMEChallenge : authorization is not in pending state; use Force flag to override this validation 使用 -f 参数
    Complete-ACMEChallenge -f insidesjono -ChallengeType http-01 -Handler iis -HandlerParameters @{ WebSiteRef = 'inside' }
7. 提交认证
    Submit-ACMEChallenge insidesjono -ChallengeType http-01
     如果报错 Submit-ACMEChallenge : authorization is not in pending state; use Force flag to override this validation 使用 -f 参数
     Submit-ACMEChallenge -f insidesjono -ChallengeType http-01
    7.1 提交之后我们接下来就需要等待LE服务器来验证了，我们可以通过命令查询结果：
    Update-ACMEIdentifier www-myside-com
    pedding 正在等待验证 
    valid 验证通过 
    invalid 验证失败

    如果验证失败需要重新申请一次，也就是我们的第5步开始重新做一次，当然alias名称需要更换，因为已经存在记录了。
8. 创建证书申请
    New-ACMECertificate www-myside-com -Generate -Alias cert1
    New-ACMECertificate insidesjono -Generate -Alias certinsidesjono
    -Alias cert1 指定证书别名，同样后面多处使用该别名
    Submit-ACMECertificate certinsidesjono
9. 下载证书文件
    9.1 下载私钥：
        Get-ACMECertificate certinsidesjono -ExportKeyPEM "D:\wwwroot\inside\myside.key.pem" 
        Get-ACMECertificate certinsidesjono -ExportCsrPEM "D:\wwwroot\inside\myside.csr.pem"
    9.2 下载LE证书： 
        Get-ACMECertificate certinsidesjono -ExportCertificatePEM "D:\wwwroot\inside\myside.crt.pem" -ExportCertificateDER "youpath\myside.crt" 
    9.3 下载IIS用的PFX文件：
        Update-ACMECertificate certinsidesjono
        不带密码
        Get-ACMECertificate certinsidesjono -ExportPkcs12 "D:\wwwroot\inside\myside.pfx" 
        带密码
        Get-ACMECertificate certinsidesjono -ExportPkcs12 "D:\wwwroot\inside\myside.pfx" -CertificatePassword 'password'

续订证书的步骤
1. 导入模块后重复第七部和第八步然后应用新证书。
    Import-Module ACMESharp
2. 创建证书申请
    New-ACMECertificate www-myside-com -Generate -Alias cert4
    Submit-ACMECertificate cert1
3. 下载证书文件
    3.1 下载私钥： 
        Get-ACMECertificate cert1 -ExportKeyPEM "youpath\myside.key.pem" 
        Get-ACMECertificate cert1 -ExportCsrPEM "youpath\myside.csr.pem"
    3.2 下载IIS用的PFX文件：
        Update-ACMECertificate cert1 
        Get-ACMECertificate cert1 -ExportPkcs12 "youpath\myside.pfx"

注意： cert1 如果已使用必须修改


请填写提交说明
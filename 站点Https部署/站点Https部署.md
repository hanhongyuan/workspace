安装
1. 安装 acme.sh

curl  https://get.acme.sh | sh

2. 把 acme.sh 安装到你的 home 目录下:

~/.acme.sh/

3. 并创建 一个 bash 的 alias, 方便你的使用:

alias acme.sh=~/.acme.sh/acme.sh

4. 设置自动升级 :

acme.sh  --upgrade  --auto-upgrade

具体可以参考：https://github.com/Neilpang/acme.sh/wiki/%E8%AF%B4%E6%98%8E

                         https://github.com/Neilpang/acme.sh/wiki/How-to-install

生成证书
1. 导入配置
export Ali_Key="QTNNCs8qa6HSSv8S"
export Ali_Secret="2FLtS0n4n0pEFBnTuHouyywCWxfzzA"

2.生成 证书

acme.sh --issue --dns dns_ali -d a.sjfx.com.cn -d www.a.sjfx.com.cn ...

acme.sh --issue --dns dns_ali -d face.sjfx.com.cn

acme.sh --issue --dns dns_ali -d mail.sjfx.com.cn

acme.sh --issue --dns dns_ali -d git.sjfx.com.cn
acme.sh --issue --dns dns_ali -d yun.sjfx.com.cn -d dockerhub.sjfx.com.cn

acme.sh --issue --dns dns_ali -d dockerhub.sjfx.com.cn

acme.sh --issue --dns dns_ali -d v3release.sjfx.com.cn

acme.sh --issue --dns dns_ali -d v3dev.sjfx.com.cn

acme.sh --issue --dns dns_ali -d v3test.sjfx.com.cn

acme.sh --issue --dns dns_ali -d produce301.sjfx.com.cn


这里给出的 配置会被自动记录下来, 将来你在使用的时候, 就不需要再次指定了. 直接生成就好了:

 重新生成使用：

  acme.sh --renew --force -d a.sjfx.com.cn

安装证书

acme.sh  --installcert  -d  a.sjfx.com.cn   \
    --key-file   /etc/pki/nginx/private/server.key \
    --fullchain-file /etc/pki/nginx/private/server.cer 

acme.sh  --installcert  -d  v3.sjfx.com.cn   \
    --key-file   /etc/pki/nginx/private/v3server.key \
    --fullchain-file /etc/pki/nginx/private/v3server.cer

acme.sh  --installcert  -d  git.sjfx.com.cn   \
 --key-file   /mnt/gitlab/ssl/gitserver.key \
 --fullchain-file /mnt/gitlab/ssl/gitserver.cer

acme.sh  --installcert  -d  yun.sjfx.com.cn -d dockerhub.sjfx.com.cn  \
 --key-file   /opt/harbor/common/config/nginx/cert/dockerhub.key \
 --fullchain-file  /opt/harbor/common/config/nginx/cert/dockerhub.cer

 acme.sh  --installcert -d dockerhub.sjfx.com.cn  \
 --key-file   /opt/harbor/common/config/nginx/cert/dockerhub.key \
 --fullchain-file /opt/harbor/common/config/nginx/cert/dockerhub.cer

 acme.sh  --installcert -d face.sjfx.com.cn  \
 --key-file   /etc/nginx/ssl/face.key \
 --fullchain-file /etc/nginx/ssl/face.cer

 acme.sh  --installcert -d produce301.sjfx.com.cn  \
 --key-file   /opt/sslkey/produce301.key \
 --fullchain-file  /opt/sslkey/produce301.cer


更新你的nginx配置

server {
    listen 80;
    server_name  a.sjfx.com.cn;
    
    #新增https配置
    listen       443 ssl http2 default_server;
    listen       [::]:443 ssl http2 default_server;
    ssl_certificate "/etc/pki/nginx/private/server.cer";
    ssl_certificate_key "/etc/pki/nginx/private/server.key";
    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout  10m;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;    
    
    location / {
        # ...
    }
}

重启nginx服务，ok。

acme.sh  --installcert  -d  jwt.sjfx.com.cn   \
    --key-file   /etc/nginx/ssl/jwt.key \
    --fullchain-file /etc/nginx/ssl/jwt.cer 


    acme.sh --issue --dns dns_ali -d sjfx.com.cn -d www.sjfx.com.cn

    acme.sh  --installcert  -d  a.sjfx.com.cn   \
    --key-file   /etc/pki/nginx/private/server.key \
    --fullchain-file /etc/pki/nginx/private/server.cer 

    acme.sh --issue --dns dns_ali -d sjfx.com.cn -d www.sjfx.com.cn \
    -d a.sjfx.com.cn -d api.sjfx.com.cn -d jwt.sjfx.com.cn -d mjwt.sjfx.com.cn 

    acme.sh  --installcert -d sjfx.com.cn -d www.sjfx.com.cn \
    -d a.sjfx.com.cn -d api.sjfx.com.cn -d jwt.sjfx.com.cn -d mjwt.sjfx.com.cn \
    --key-file   /etc/pki/nginx/private/server.key \
    --fullchain-file /etc/pki/nginx/private/server.cer 




windows申请免费SSL证书－Let's Encrypt

New
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
    New-ACMERegistration -Contacts mailto:zengzhizz@hotmail.com -AcceptTos
    如果报错：
        New-ACMERegistration : Vault root path does not contain vault data
    请执行
    if (!(Get-ACMEVault))
{
    Initialize-ACMEVault
}
5. 创建一个你要申请域名身份
    New-ACMEIdentifier -Dns inside.sjono.com -Alias www-inside-com

     New-ACMEIdentifier -Dns sxqbtzb.sjfx.com.cn -Alias sxqbtzb180417
    检查
    Get-ACMEIdentifier www-inside-com | select -expand Challenges | select Type
    Get-ACMEIdentifier www-inside-com | select -expand Combinations

    Get-ACMEIdentifier sxqbtzb180417 | select -expand Challenges | select Type
    Get-ACMEIdentifier sxqbtzb180417 | select -expand Combinations

    New-ACMEIdentifier -Dns inside.sjono.com -Alias inside20180807

6. 认证域名所有权,是IIS web服务器执行：
    Complete-ACMEChallenge dns1 -ChallengeType http-01 -Handler iis -HandlerParameters @{ WebSiteRef = 'inside' }

    Complete-ACMEChallenge certsjfx -ChallengeType http-01 -Handler iis -HandlerParameters @{ WebSiteRef = 'inside' }

    Complete-ACMEChallenge sxqbtzb180417 -ChallengeType http-01 -Handler iis -HandlerParameters @{ WebSiteRef = 'oa' }

    Complete-ACMEChallenge inside20180807 -ChallengeType http-01 -Handler iis -HandlerParameters @{ WebSiteRef = 'inside' }
7. 提交认证
    Submit-ACMEChallenge dns1 -ChallengeType http-01

    Submit-ACMEChallenge certsjfx -ChallengeType http-01
    7.1 提交之后我们接下来就需要等待LE服务器来验证了，我们可以通过命令查询结果：
    Update-ACMEIdentifier dns1
    pedding 正在等待验证 
    valid 验证通过 
    invalid 验证失败

    Update-ACMEIdentifier certsjfx

    如果验证失败需要重新申请一次，也就是我们的第四步开始重新做一次，当然alias名称需要更换，因为已经存在记录了。

    Submit-ACMEChallenge inside20180807 -ChallengeType http-01
    Update-ACMEIdentifier inside20180807

8. 创建证书申请
    New-ACMECertificate dns1 -Generate -Alias cert1
    Submit-ACMECertificate cert1

    New-ACMECertificate certsjfx -Generate -Alias certsjfx1805
    Submit-ACMECertificate certsjfx1805

    New-ACMECertificate sxqbtzb180417 -Generate -Alias certsxqbtzb180423
    Submit-ACMECertificate certsxqbtzb180423

    New-ACMECertificate inside20180807 -Generate -Alias cert20180807
    Submit-ACMECertificate cert20180807

9. 下载证书文件
    9.1 下载私钥： 
        Get-ACMECertificate cert1 -ExportKeyPEM "D:\wwwroot\inside\SSL\inside.key.pem" 
        Get-ACMECertificate cert1 -ExportCsrPEM "D:\wwwroot\inside\SSL\inside.csr.pem"

        历史记录：
        Get-ACMECertificate cert20180807 -ExportKeyPEM "D:\SSL\20180807\inside.key.pem" 
        Get-ACMECertificate cert20180807 -ExportCsrPEM "D:\SSL\20180807\inside.csr.pem"

    9.2 下载LE证书： 
        Get-ACMECertificate cert1 -ExportCertificatePEM "D:\wwwroot\inside\SSL\inside.crt.pem" -ExportCertificateDER "D:\wwwroot\inside\SSL\inside.crt" 

        历史记录：
        Get-ACMECertificate cert20180807 -ExportCertificatePEM "D:\SSL\20180807\inside.crt.pem" -ExportCertificateDER "D:\SSL\20180807\inside.crt"

    9.3 下载IIS用的PFX文件： 
        Get-ACMECertificate cert1 -ExportPkcs12 "D:\wwwroot\inside\SSL\inside.pfx" 
        Get-ACMECertificate cert1 -ExportPkcs12 "D:\wwwroot\inside\SSL\inside.pfx" -CertificatePassword 'Sjfx@2018'
        
        历史记录：
        Get-ACMECertificate certsxqbtzb180417 -ExportKeyPEM "D:\wwwroot\ssl\sxqbtzb180423.key.pem" 
        Get-ACMECertificate certsxqbtzb180417 -ExportCsrPEM "D:\wwwroot\ssl\sxqbtzb180423.csr.pem"
        Get-ACMECertificate certsxqbtzb180417 -ExportCertificatePEM "D:\wwwroot\ssl\sxqbtzb180423.crt.pem" -ExportCertificateDER "D:\wwwroot\ssl\sxqbtzb180423.crt"
        Get-ACMECertificate certsxqbtzb180417 -ExportPkcs12 "D:\wwwroot\ssl\sxqbtzb180423.pfx" 

        Get-ACMECertificate cert20180807 -ExportPkcs12 "D:\SSL\20180807\inside.pfx"
 

    9.4如果生成失败PFX文件，访问`https://www.identrust.com/certificates/trustid/root-download-x3.html`
    

续订证书的步骤
1. 导入模块后重复第七部和第八步然后应用新证书。
    Import-Module ACMESharp
2. 创建证书申请
    New-ACMECertificate dns1 -Generate -Alias cert1
    Submit-ACMECertificate cert1
3. 下载证书文件
    3.1 下载私钥： 
        Get-ACMECertificate cert1 -ExportKeyPEM "D:\wwwroot\inside\SSL\inside.key.pem" 
        Get-ACMECertificate cert1 -ExportCsrPEM "D:\wwwroot\inside\SSL\inside.csr.pem"
    3.2 下载IIS用的PFX文件： 
        Get-ACMECertificate cert1 -ExportPkcs12 "D:\wwwroot\inside\SSL\inside.pfx"

        Get-ACMECertificate certsjfx1805 -ExportKeyPEM "D:\SSL\inside.key.pem" 
        Get-ACMECertificate certsjfx1805 -ExportCsrPEM "D:\SSL\inside.csr.pem"
        Get-ACMECertificate certsjfx1805 -ExportCertificatePEM "D:\SSL\inside.crt.pem" -ExportCertificateDER "D:\SSL\inside.crt"
        Get-ACMECertificate certsjfx1805 -ExportPkcs12 "D:\SSL\inside.pfx"
        Get-ACMECertificate certsjfx1805 -ExportPkcs12 "D:\SSL\inside.pfx"
        Get-ACMECertificate certsjfx1805 -ExportPkcs12 "D:\SSL\inside.pfx" -CertificatePassword 'Sjfx@2018'

New-ACMECertificate dns1 -Generate -Alias cert18050801
Submit-ACMECertificate cert180508

Get-ACMECertificate cert180508 -ExportKeyPEM "D:\SSL\inside.key.pem" 
注意： cert1 必须修改

openssl pkcs12 -export -out sxqbtzb180423.pfx -inkey sxqbtzb180423.key.pem -in sxqbtzb180423.crt.pem

openssl pkcs12 -export -inkey server.key -in server.crt -out server.pfx

Get-ACMECertificate cert1 -ExportCsrPEM "D:\wwwroot\inside\SSL\inside.csr.pem"

New-ACMECertificate dns1 -Generate -Alias cert2
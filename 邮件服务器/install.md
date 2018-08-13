docker pull tvial/docker-mailserver

mkdir /mnt/mail
cd /mnt/mail

mkdir mail
mkdir mail-state
mkdir config
mkdir letsencrypt
chmod 777 -R .


cat > docker-compose.yaml << EOF
version: '2'

services:
 mail:
 image: tvial/docker-mailserver
 hostname: sjfxmail
 domainname: sjfx.com.cn
 container_name: mail
 ports:
 - "25:25"
 - "143:143"
 - "587:587"
 - "993:993"
 volumes:
 - /mnt/mail/mail:/var/mail
 - /mnt/mail/mail-state:/var/mail-state
 - /mnt/mail/config/:/tmp/docker-mailserver/
 - /mnt/mail/letsencrypt:/etc/letsencrypt
 environment:
 - ENABLE_SPAMASSASSIN=0
 - ENABLE_CLAMAV=0
 - ENABLE_FAIL2BAN=1
 - ONE_DIR=1
 - DMS_DEBUG=0
 - SSL_TYPE=letsencrypt
 cap_add:
 - NET_ADMIN
EOF

添加邮件账户

touch ./config/postfix-accounts.cf
docker run --rm \
 -e MAIL_USER=mailuser@sjfx.com.cn.tld \
 -e MAIL_PASS=Sjfx@2018 \
 -ti tvial/docker-mailserver \
 /bin/sh -c 'echo "$MAIL_USER|$(doveadm pw -s SHA512-CRYPT -u $MAIL_USER -p $MAIL_PASS)"' >> ./config/postfix-accounts.cf

创建DKIM key：

docker run --rm \
 -v /mnt/mail/config:/tmp/docker-mailserver \
 -ti tvial/docker-mailserver:latest generate-dkim-config


如果是自己搭建的bind，直接把这段塞进域名的hosts文件就行。如果使用的是第三方解析，就去后台添加一条TXT记录，记录名是mail._domainkey，记录值是将两段引号内的字符串拼接起来即可，如我的就是：


v=DKIM1; h=sha256; k=rsa;p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyo+9OZQDokjuANebsfueM979pIQzIDEMlDj39BCPXv8va3zNzFkI67C+hCa8A4jIcr2yxGe/wRC1x/a91Clmjnky8oza89jgJlvNCXgwxYjJmNCP96jMEFaQ9MY4xTMPqMi33kq/q1Zu+Kwr9xnbTKOzxfztk17V6nnXVp0Pg2k/CywgG2arYHEANrdEe6msjERdW/bTNym7jqKh7adza5ukrbAvCEKowIGgHYMVCstGQ2gTauVS/C3ZTG9EKHVsp79m/14VBssigm+mjaqcjTbI/b7pOxlpkFd/5oqb1yVX8drbFRlrJlm1RH/fKwoLmy24Km4cCbO7c+Kg7FdkcwIDAQAB

sudo yum install -y certbot

certbot certonly --webroot -d sjfxmail.sjfx.com.cn  --register-unsafely-without-email

Input the webroot for sjfxmail.sjfx.com.cn: (Enter 'c' to cancel): /mnt/mail



docker-compose up -d

firewall-cmd --zone=public --add-port=25/tcp
firewall-cmd --zone=public --add-port=25/tcp --permanent
firewall-cmd --zone=public --add-port=143/tcp
firewall-cmd --zone=public --add-port=143/tcp --permanent
firewall-cmd --zone=public --add-port=587/tcp
firewall-cmd --zone=public --add-port=587/tcp --permanent
firewall-cmd --zone=public --add-port=993/tcp
firewall-cmd --zone=public --add-port=993/tcp --permanent

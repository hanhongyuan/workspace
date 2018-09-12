firewalld 是 centos7 的一大特性，最大的好处有两个：支持动态更新，不用重启服务；

启动：
systemctl start firewalld
查看状态：
systemctl status firewalld
firewall-cmd --state
停止：
systemctl disable firewalld
禁用：
systemctl stop firewalld
重启：
systemctl restart firewalld
开机启动
systemctl enable firewalld.service

查看版本：
firewall-cmd --version
查看帮助：
firewall-cmd --help
显示状态：
firewall-cmd --state
查看所有打开的端口：
firewall-cmd --zone=public --list-ports
查看区域信息:
firewall-cmd --get-active-zones
查看指定接口所属区域：
firewall-cmd --get-zone-of-interface=eth0
拒绝所有包：
firewall-cmd --panic-on
取消拒绝状态：
firewall-cmd --panic-off
查看是否拒绝：
firewall-cmd --query-panic
更新防火墙规则：
firewall-cmd --reload #不重启
firewall-cmd --complete-reload #重启

打开端口加入一个端口到区域：
firewall-cmd --zone=public --add-port=8080/tcp
永久生效
firewall-cmd --zone=public --add-port=8080/tcp --permanent
编辑文件
/etc/sysconfig/iptables-config
在最后添加
-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT

firewall-cmd --zone=public --add-port=80/tcp
firewall-cmd --zone=public --add-port=80/tcp --permanent

patch -d /opt/gitlab/embedded/service/gitlab-rails < tmp/8.8.diff

sudo EXTERNAL_URL="http://localhost" yum install -y gitlab-ce
EXTERNAL_URL="http://gitlab.example.com" yum install -y gitlab-ce

sudo docker run -e CATTLE_AGENT_IP="192.168.79.151" --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.9 http://192.168.79.150:8080/v1/scripts/24B2C4DAA61E2C090DD2:1514678400000:UcN1ikhg4wcUpKrNlHftfUlEZYU

sudo docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.5 http://192.168.1.109:8080/v1/scripts/9F78F0DF10BCF4216AC7:1483142400000:hSv7KrbGnhQy3IJmJWYhWvxemF4

firewall-cmd --zone=public --add-port=8080/tcp
firewall-cmd --zone=public --add-port=8080/tcp --permanent

firewall-cmd --zone=public --add-port=8010/tcp
firewall-cmd --zone=public --add-port=8010/tcp --permanent

firewall-cmd --zone=public --add-port=8210/tcp
firewall-cmd --zone=public --add-port=8210/tcp --permanent

firewall-cmd --zone=public --add-port=8220/tcp
firewall-cmd --zone=public --add-port=8220/tcp --permanent

firewall-cmd --zone=public --add-port=8230/tcp
firewall-cmd --zone=public --add-port=8230/tcp --permanent

firewall-cmd --zone=public --add-port=8301/tcp
firewall-cmd --zone=public --add-port=8301/tcp --permanent

firewall-cmd --zone=public --add-port=8302/tcp
firewall-cmd --zone=public --add-port=8302/tcp --permanent


firewall-cmd --zone=public --add-port=9305/tcp
firewall-cmd --zone=public --add-port=9305/tcp --permanent

firewall-cmd --zone=public --add-port=2222/tcp
firewall-cmd --zone=public --add-port=2222/tcp --permanent

firewall-cmd --zone=public --add-port=5000/tcp
firewall-cmd --zone=public --add-port=5000/tcp --permanent

firewall-cmd --zone=public --add-port=8422/tcp
firewall-cmd --zone=public --add-port=8422/tcp --permanent

firewall-cmd --zone=public --add-port=21/tcp
firewall-cmd --zone=public --add-port=21/tcp --permanent

firewall-cmd --zone=public --add-port=22/tcp
firewall-cmd --zone=public --add-port=22/tcp --permanent

firewall-cmd --zone=public --add-port=5010/tcp

firewall-cmd --zone=public --add-port=12432/tcp
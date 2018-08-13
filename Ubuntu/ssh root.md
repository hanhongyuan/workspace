# ubuntu 服务器基础准备
1. 使用root身份登陆ssh

```bash
sudo apt-get update -y

sudo apt-get install openssh-server -y

sudo apt-get install vim -y

sudo passwd root

sudo vim /etc/ssh/sshd_config

change
`PermitRootLogin prohibit-password` 
to
`PermitRootLogin yes` 

add
`AllowUsers root sjfx`

sudo service ssh restart

```

2. 禁用cdrom更新源，更新
vim /etc/apt/sources.list
# deb cdrom:[Ubuntu-Server 16.04.4 LTS _Xenial Xerus_ - Release amd64 (20180228)]/ xenial main restricted

sudo apt-get update -y
sudo apt-get upgrade -y

3. 设置静态ip

cat > /etc/network/interfaces << EOF
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto ens33
iface ens33 inet static
address 192.168.1.19
netmask 255.255.255.0
gateway 192.168.1.1
dns-nameservers 192.168.1.1
EOF

sudo ip addr flush ens33
sudo systemctl restart networking.service


以上请在vm执行。

4. 安装好 docker

    apt-get update -y

    apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - apt-key fingerprint 0EBFCD88

     add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

    apt-get update -y

    apt-cache madison docker-ce

    apt-get install docker-ce=17.03.2~ce-0~ubuntu-xenial -y

    sudo systemctl start docker.service
    sudo systemctl enable docker.service
    cat > /etc/docker/daemon.json << EOF
{
"registry-mirrors": [
"https://registry.docker-cn.com",
"http://6dffe8f7.m.daocloud.io",
"https://hub-mirror.c.163.com",
"https://docker.mirrors.ustc.edu.cn"
],
"insecure-registries": [],
"debug": true,
"experimental": true,
"live-restore": false
}
EOF
sudo systemctl restart docker

apt install python-pip -y
pip install --upgrade pip

apt install docker-compose
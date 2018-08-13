1.  卸载老版本，没有可以跳过。
     yum remove docker \
     docker-common \
     docker-selinux \
     docker-engine

2.  安装依赖
     yum install -y yum-utils \
     device-mapper-persistent-data \
     lvm2

3.  基础配置
     yum-config-manager \
     --add-repo \
     https://download.docker.com/linux/centos/docker-ce.repo

     yum-config-manager --enable docker-ce-edge

4.  开始安装
     yum install docker-ce -y

        4.1 安装特定版本
        yum list docker-ce --showduplicates | sort -r 列出所有版本
         yum install <FULLY-QUALIFIED-PACKAGE-NAME>

         yum install -u https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-selinux-17.03.2.ce-1.el7.centos.noarch.rpm

         yum install -y docker-ce-17.03.2.ce-1.el7.centos.x86_64
        4.2 升级docker服务
         yum upgrade docker-ce

5.  启动 docker 服务
     systemctl start docker.service
     systemctl enable docker.service

参考文档： https://docs.docker.com/engine/installation/linux/docker-ce/centos/
http://blog.csdn.net/baidu_36342103/article/details/69357438

6.  -i docker0: iptables: No chain/target/match by that name. 问题解决重启防火墙
    systemctl restart firewalld
    重启 docker
     systemctl restart docker

7.  设置加速镜像地址
    touch /etc/docker/daemon.json

内容：
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
"live-restore": true
}
 systemctl restart docker

 yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2

 yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

 yum-config-manager --enable docker-ce-edge

 yum install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-selinux-17.03.2.ce-1.el7.centos.noarch.rpm

 yum install -y docker-ce-17.03.2.ce-1.el7.centos.x86_64

 systemctl start docker.service
 systemctl enable docker.service

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
"live-restore": true
}
EOF
 systemctl restart docker
echo '{' >> /etc/docker/daemon.json
echo '"registry-mirrors": [' >> /etc/docker/daemon.json
echo '"https://registry.docker-cn.com",' >> /etc/docker/daemon.json
echo '"http://6dffe8f7.m.daocloud.io",' >> /etc/docker/daemon.json
echo '"https://hub-mirror.c.163.com",' >> /etc/docker/daemon.json
echo '"https://docker.mirrors.ustc.edu.cn"' >> /etc/docker/daemon.json
echo '],' >> /etc/docker/daemon.json
echo '"insecure-registries": [],' >> /etc/docker/daemon.json
echo '"debug": true,' >> /etc/docker/daemon.json
echo '"experimental": true,' >> /etc/docker/daemon.json
echo '"live-restore": true' >> /etc/docker/daemon.json
echo '}' >> /etc/docker/daemon.json
 systemctl restart docker


kubeadm init \
  --kubernetes-version=v1.10.2 \
  --pod-network-cidr=10.244.0.0/16 \
  --apiserver-advertise-address=192.168.181.135

  kubeadm join 192.168.181.135:6443 --token lcamsq.qe6ed588ptmekqx2 --discovery-token-ca-cert-hash sha256:05a9d792c146e6539f8a045c409d0b7fc6e52781c14edde7ed8c8d325a7bda0d

kubeadm join 


## Ubuntu

     apt-get update -y

     apt-get upgrade -y

     apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add -

     apt-key fingerprint 0EBFCD88

     add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

     apt-get update -y

    apt-cache madison docker-ce

     apt-get install docker-ce -y

     systemctl start docker.service
     systemctl enable docker.service
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
 systemctl restart docker

 
# 克隆机修改

1. hostname
echo 'sjfxregistry' > /etc/hostname

2. 修改ip

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
address 192.168.1.208
netmask 255.255.255.0
gateway 192.168.1.1
dns-nameservers 192.168.1.1
EOF

sudo ip addr flush ens33
sudo systemctl restart networking.service

echo 'sjfxpublish' > /etc/hostname

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
address 192.168.1.18
netmask 255.255.255.0
gateway 192.168.1.1
dns-nameservers 192.168.1.1
EOF
sudo reboot

sudo ip addr flush ens33
sudo systemctl restart networking.service
sudo reboot


3. 安装java
apt-get install python-software-properties -y

add-apt-repository ppa:webupd8team/java

sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install launchpad-getkeys

apt-get install oracle-java8-installer -y
java -version

3.1 maven
apt-get install maven -y
mvn -v

3.2 gradle
wget https://services.gradle.org/distributions/gradle-4.9-bin.zip
unzip -d /opt/gradle gradle-4.9-bin.zip
ls /opt/gradle/gradle-4.9

cat >> /etc/profile << EOF

export GRADLE_HOME=/opt/gradle/gradle-4.9
export PATH=\$GRADLE_HOME/bin:\$PATH
EOF

source /etc/profile
cat /etc/profile
gradle -v

cat >> ~/.gradle/init.gradle << EOF
allprojects{
    repositories {
        def ALIYUN_REPOSITORY_URL = 'http://maven.aliyun.com/nexus/content/groups/public'
        def ALIYUN_JCENTER_URL = 'http://maven.aliyun.com/nexus/content/repositories/jcenter'
        all { ArtifactRepository repo ->
            if(repo instanceof MavenArtifactRepository){
                def url = repo.url.toString()
                if (url.startsWith('https://repo1.maven.org/maven2')) {
                    project.logger.lifecycle "Repository \${repo.url} replaced by \$ALIYUN_REPOSITORY_URL."
                    remove repo
                }
                if (url.startsWith('https://jcenter.bintray.com/')) {
                    project.logger.lifecycle "Repository \${repo.url} replaced by \$ALIYUN_JCENTER_URL."
                    remove repo
                }
            }
        }
        maven {
                url ALIYUN_REPOSITORY_URL
            url ALIYUN_JCENTER_URL
        }
    }
}
EOF

3.3 jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update -y
apt-get install jenkins -y

mkdir -p /var/lib/jenkins/.gradle/
cat > /var/lib/jenkins/.gradle/init.gradle << EOF
allprojects{
    repositories {
        def ALIYUN_REPOSITORY_URL = 'http://maven.aliyun.com/nexus/content/groups/public'
        def ALIYUN_JCENTER_URL = 'http://maven.aliyun.com/nexus/content/repositories/jcenter'
        all { ArtifactRepository repo ->
            if(repo instanceof MavenArtifactRepository){
                def url = repo.url.toString()
                if (url.startsWith('https://repo1.maven.org/maven2')) {
                    project.logger.lifecycle "Repository \${repo.url} replaced by \$ALIYUN_REPOSITORY_URL."
                    remove repo
                }
                if (url.startsWith('https://jcenter.bintray.com/')) {
                    project.logger.lifecycle "Repository \${repo.url} replaced by \$ALIYUN_JCENTER_URL."
                    remove repo
                }
            }
        }
        maven {
                url ALIYUN_REPOSITORY_URL
            url ALIYUN_JCENTER_URL
        }
    }
}
EOF





4. 非root使用docker
groupadd docker
sudo gpasswd -a sjfx docker
sudo gpasswd -a sjfxtest docker
sudo gpasswd -a jenkins docker
sudo service docker restart
newgrp - docker 

reboot

5. 设置时区
dpkg-reconfigure tzdata

Asia/Shanghai


SET PASSWORD FOR 'root'@'%' = PASSWORD('7KY7HWZpgAtSAhU5');

update mysql.user set authentication_string=password('7KY7HWZpgAtSAhU5') where user='root' and Host = 'localhost';
update mysql.user set authentication_string=password('7KY7HWZpgAtSAhU5') where user='root' and Host = '127.0.0.1';
update mysql.user set authentication_string=password('7KY7HWZpgAtSAhU5') where user='root' and Host = '%';




16.04版
echo 'sjfx-dev-2' > /etc/hostname
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
address 192.168.1.11
netmask 255.255.255.0
gateway 192.168.1.1
dns-nameservers 192.168.1.1
EOF
reboot
sudo ip addr flush ens33
sudo systemctl restart networking.service
reboot

18.04版
echo 'kube-node1' > /etc/hostname
cat > /etc/netplan/50-cloud-init.yaml << EOF
# This file is generated from information provided by
# the datasource.  Changes to it will not persist across an instance.
# To disable cloud-init's network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        ens33:
            addresses: [192.168.181.200/24]
            gateway4:  192.168.181.2
            dhcp4: no
            nameservers:
                addresses: [192.168.181.2]
    version: 2

EOF
reboot
netplan apply


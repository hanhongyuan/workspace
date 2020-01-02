apt-get update -y

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

    apt-get install docker-ce=18.06.3~ce~3-0~ubuntu -y

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
"insecure-registries": ["47.110.9.96","dhub.sjfx.com.cn","172.16.21.6"],
"debug": true,
"experimental": true,
"live-restore": false
}

EOF
 systemctl restart docker

apt install python-pip -y

pip install --upgrade pip 

pip install docker-compose

cd /elk
docker-compose up -d

#v3-base-mq001 base swarm
docker swarm init --advertise-addr 172.16.149.249

docker swarm join --token SWMTKN-1-2hx3kaw1803cjik68c238djv4915wfiamcb12ox1cnqdkwcqp2-5ipw7xqm4x4782f56edsgy7kh 172.16.149.249:2377

#v3-base-eureka001 bs swarm
docker swarm init --advertise-addr 172.16.84.206

docker swarm join --token SWMTKN-1-66qgrywn4kec7rs0fk2a363mj17trt9pxljof1xtgnb8flvi2g-bhdk0xz9rnobugraufos9yu6z 172.16.84.206:2377

#v3-gateway001 gw swarm
docker swarm init --advertise-addr 172.16.84.205

docker swarm join --token SWMTKN-1-3vizh4jvj7goe564rj2cmqyx6l7eo8v4w45zvm6cru2jrg4j1u-6s75h3fonc682t1sqd81ue1tl 172.16.84.205:2377

#v3-BS-F001 gw swarm
docker swarm init --advertise-addr 172.16.225.64

docker swarm join --token SWMTKN-1-4qtv7g2jj160dtbnf7k4dbzhu93mx53vjyvchq09okbkymdqzi-an5ttwoxqw65u7w0h8xo8wgf4 172.16.225.64:2377

cat >> ~/.ssh/authorized_keys << EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVaGEdD3WAJY2nYovynfG51eOwZRERKQfKwCWOO4UMbTtZB+3Ta4lQuTCMXkQAZWyFGeJPzGKklLZjVyjn39e1hXya3OBXyAhvZRMU+yRMt0y0GJqj2nrllDumODvLdJSebe6Ncq7UXuBsLRLJlnW7ZFlZWD6FVE0hg0Yxw/Bf4OXrm+rJDjVThLrEKQgR60tuFhLjpDRHEGMgpZr2uL96fPwkbwqrST9Bg1qFh6VO2LLJ3Z7w0xI1y9VolkpUBmCxFiv2TQlSIcLUs36pK/LoPVlRTTXqZs70035UlcmapuGKdSydOIwQ16ehe9fY7z1UD+n+wiNiO1ALVHJoZAmn root@v3-publish
EOF

cat ~/.ssh/authorized_keys


3 23 * * * journalctl --vacuum-size=500M

echo '15 0 * * * root bash /opt/publish-script/2019/logback.sh' >> /etc/crontab && service cron restart


https://jenkins.sjfx.com.cn/view/others/job/pub-requirement/build?token=1138a2e6a6f566886dee822ed3ea134069

cat >> ~/.ssh/authorized_keys << EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCriOuUoGzD4y2Y8LOGaYdomuS9c/r5a1sX/GA66gSX2tA5cCw0VoX/pNshsnFXQVECrngmmbUL5iZtdY+aJ6IyxyZTMstzhpYc6zPZ36oqtIILPuwmOE1sj60Y+qNKjQ5SLcMjeds3hWdTVnX1pC8oq24HJmfY2GNM8ghSYaoWoprsS0stNBDc0As6D8hmheImPqEBlgJmMx6H6COfRpCNivBv4qVsl6a6ZgHZ46mIRpxuyfzZva8oLuF6ecQeDdvr2QQtsz982Ee4MowqIX5HifMJBHvRl3TOn+/IGgdqDqchWdb9kE9/r6ubOuII30LvA7BzT1pAm9hGt4JhBTpx sjfxdev@v3-publish
EOF


# apache-airflow

Airflow 是 Airbnb 开发的用于工作流管理的开源项目，自带 web UI 和调度。简单来说就是管理和调度各种离线定时 Job ，可以替代 crontab。
当 cron job 规模达到数百上千时，其对人的要求将会非常高的，如果你的团队经历过这样的事情，应该能体会其中痛苦，所以使用类似 airflow 这样的工具代替 cron 来做定时任务将会极大提高工作效率。

## Airflow 安装

1. python和pip 的安装

python一般系统会自带，如果没有使用以下命令安装：

```sh
    yum install python
```

```sh
yum install wget gcc make
yum -y install python-devel.x86_64
yum -y install mariadb-devel python-devel
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
```

或 

```sh
yum install wget gcc make
 yum -y install python-devel.x86_64
yum -y install https://centos7.iuscommunity.org/ius-release.rpm
yum makecache
yum install python36u
yum -y install python36u-pip
yum -y install python36u-devel
```

2. 使用pip 安装 Airflow 

```sh
pip install apache-airflow[postgres]
```

`[postgres]`为数据存储类型，详细参考[官方文档](https://airflow.incubator.apache.org/installation.html#extra-packages)

3. 安装数据库

```sh
mkdir -p /mnt/airflow/pg/passwd
mkdir -p /mnt/airflow/pg/db
chmod 777 -R /mnt/airflow/pg/passwd
chmod 777 -R /mnt/airflow/pg/db
firewall-cmd --zone=public --add-port=5432/tcp
firewall-cmd --zone=public --add-port=5432/tcp --permanent
firewall-cmd --zone=public --add-port=8080/tcp
firewall-cmd --zone=public --add-port=8080/tcp --permanent
docker run -d -p 5432:5432 -v /mnt/airflow/pg/db:/var/lib/postgresql/data -e POSTGRES_PASSWORD=sjfx2018 --name=airflow-postgres --restart=unless-stopped postgres:10.3
```

4. docker安装

```sh
cd /mnt
git clone https://github.com/dlancerzz/docker-airflow.git
cd docker-airflow
mkdir -p /mnt/docker-airflow/pgdb
mkdir -p /mnt/docker-airflow/dags
mkdir -p /mnt/docker-airflow/plugins
chmod 777 -R /mnt/docker-airflow/pgdb
chmod 777 -R /mnt/docker-airflow/dags
chmod 777 -R /mnt/docker-airflow/plugins
docker login -u sjfx -p sjfx2018
docker build -t sjfx/docker-airflow:1.9.0 .
docker push sjfx/docker-airflow:1.9.0
firewall-cmd --zone=public --add-port=8020/tcp
firewall-cmd --zone=public --add-port=8020/tcp --permanent
docker-compose -f docker-compose-LocalExecutor.yml up -d
```
firewall-cmd --zone=public --add-port=8030/tcp
firewall-cmd --zone=public --add-port=8030/tcp --permanent
开启用户权限验证，

vim ./config/airflow.cfg

  
authenticate = true  
auth_backend = airflow.contrib.auth.backends.password_auth  


docker exec -it 6b5c bash
python

import airflow  
from airflow import models, settings  
from airflow.contrib.auth.backends.password_auth import PasswordUser  
user = PasswordUser(models.User())  
user.username = 'sjfx'  
user.email = 'zengzhi@sjfx.com.cn'  
user.password = 'sjfx2018'  
session = settings.Session()  
session.add(user)  
session.commit()  
session.close()  
exit()  
# yapi install

1. 创建目录下载容器代码并执行

    ```sh
    mkdir -p /mnt/yapi/
    git clone https://github.com/branchzero/yapi-docker.git
    docker-compose up -d

    md C:\Code\yapi\mongodb\data
    md C:\Code\yapi\mongodb\log
    md C:\Code\yapi\data
    ```
-v C:\Code\yapi\data:/my-yapi
1. 启动容器

    ```sh
    docker run -dit --name yapi -p 27017:27017 -p 9090:9090 -p 3000:3000 silsuer/yapi
    ```

1. 进入容器启动mongodb和安装程序

    ```sh
    docker exec -it yapi bash
    service mongodb start
    yapi server
    ```
1. 配置完成启动站点,保存容器并退出
    ```sh
    ctrl + c
    nohup node /my-yapi/vendors/server/app.js 2>&1 &
    ctrl + p ctrl + q
    ```
firewall-cmd --zone=public --add-port=2022/tcp
firewall-cmd --zone=public --add-port=2022/tcp --permanent

firewall-cmd --zone=public --add-port=3000/tcp
firewall-cmd --zone=public --add-port=3000/tcp --permanent

firewall-cmd --zone=public --add-port=9090/tcp
firewall-cmd --zone=public --add-port=9090/tcp --permanent
存储位置：
/var/lib/mongodb/

/var/lib/mongodb
mkdir -p /dbback
mongodump -h 127.0.0.1 -d yapi -o /dbback


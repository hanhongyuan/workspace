# 安装

* 创建数据库及用户

  ```sql
      CREATE DATABASE IF NOT EXISTS cattle COLLATE = 'utf8_general_ci' CHARACTER SET = 'utf8';
      GRANT ALL ON cattle.* TO 'cattle'@'%' IDENTIFIED BY 'cattle';
      GRANT ALL ON cattle.* TO 'cattle'@'localhost' IDENTIFIED BY 'cattle';

      CREATE USER 'cattleusr'@'%' IDENTIFIED BY 'sjfx@2018';

      GRANT ALL ON cattle.* TO 'cattleusr'@'%';

      DROP USER 'cattle'@'%';
  ```

* 启动一个 Rancher 连接一个外部数据库
  ```sh
  sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server \
  --db-host 192.168.79.151 --db-port 3306 --db-user root --db-pass Sjfx@2018 --db-name cattle
  ```
* 等待生成相关数据及站点，连接<http://192.168.79.150:8080>


  sudo docker run -d --restart=unless-stopped -p 8181:8080 rancher/server \
  --db-host 192.168.1.18 --db-port 3306 --db-user cattleusr --db-pass sjfx@2018 --db-name cattle


EAE7852CE843043EC56C 
RfseHfbsW3BveEuh37GsxBBf9CAuRQBm2QkbcQmR 
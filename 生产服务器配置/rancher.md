1. 正式环境

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
  --db-host rm-bp1qn4bl8d8p9mnm4.mysql.rds.aliyuncs.com --db-port 3306 --db-user cattleusr --db-pass sjfx@2018 --db-name cattle
  ```
* 等待生成相关数据及站点，连接<http://192.168.79.150:8080>

2. 验证环境

* 创建数据库及用户

  ```sql
      CREATE DATABASE IF NOT EXISTS cattle_val COLLATE = 'utf8_general_ci' CHARACTER SET = 'utf8';
      GRANT ALL ON cattle_val.* TO 'cattle'@'%' IDENTIFIED BY 'cattle';
      GRANT ALL ON cattle_val.* TO 'cattle'@'localhost' IDENTIFIED BY 'cattle';

      GRANT ALL ON cattle_val.* TO 'cattleusr'@'%';

      DROP USER 'cattle'@'%';
  ```

* 启动一个 Rancher 连接一个外部数据库
  ```sh
  sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server \
  --db-host rm-bp1qn4bl8d8p9mnm44o.mysql.rds.aliyuncs.com --db-port 3369 --db-user cattleusr --db-pass sjfx@2018 --db-name cattle_val
  ```
* 等待生成相关数据及站点，连接<http://192.168.79.150:8080>
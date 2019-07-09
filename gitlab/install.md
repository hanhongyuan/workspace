# gitlab 安装

* 获取镜像

  ```sh
  docker pull beginor/gitlab-ce:10.4.3-ce.0
  ```

* 运行

      通常会将 GitLab 的配置 (etc) 、 日志 (log) 、数据 (data) 放到容器之外， 便于日后升级， 因此请先准备这三个目录。
      ```sh
      sudo mkdir -p /mnt/gitlab/etc
      sudo mkdir -p /mnt/gitlab/log
      sudo mkdir -p /mnt/gitlab/data
      chmod 777 /mnt/gitlab/etc
      chmod 777 /mnt/gitlab/log
      chmod 777 /mnt/gitlab/data
      ```

  准备好这三个目录之后， 就可以开始运行 Docker 镜像了。 我的建议是使用 unless-stopped 作为重启策略， 因为这样可以手工停止容器， 方便维护。

  完整的运行命令如下：

      ```cmd
        docker run \
        --detach \
        --publish 8422:22 \
        --publish 8443:443 \
        --publish 8080:80 \
        --name gitlab \
        --restart unless-stopped \
        --volume /mnt/gitlab/etc:/etc/gitlab \
        --volume /mnt/gitlab/log:/var/log/gitlab \
        --volume /mnt/gitlab/data:/var/opt/gitlab \
        beginor/gitlab-ce:10.6.2-ce.0
       ```

       docker pull beginor/gitlab-ce:10.6.2-ce.0

docker rm -f gitlab

docker run \
        --detach \
        --publish 8422:22 \
        --publish 8443:443 \
        --publish 8080:80 \
        --name gitlab \
        --restart unless-stopped \
        --volume /opt/gitlab/etc:/etc/gitlab \
        --volume /opt/gitlab/log:/var/log/gitlab \
        --volume /opt/gitlab/data:/var/opt/gitlab \
        beginor/gitlab-ce:11.3.0-ce.0

chmod 777 -R /opt/gitlab



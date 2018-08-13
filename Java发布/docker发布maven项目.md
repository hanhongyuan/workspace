# 使用docker基于maven发布 Spring Boot 应用

1. 下载构建镜像
`docker pull maven:3.5.3-jdk-10-slim`

2. 创建临时容器构建项目
`docker run -it --rm --name api-oss -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven:3.5.3-jdk-10-slim mvn clean install`
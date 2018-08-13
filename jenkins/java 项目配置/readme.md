

今后项目参考authorization

1. 添加Dockerfile

```
FROM java:8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV APP_HOME=/app
WORKDIR  ${APP_HOME}
COPY . .
EXPOSE 8080
EXPOSE 20001
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -fs http://localhost:8080/ || exit 1
VOLUME  ${APP_HOME}/logs 
ENTRYPOINT [ "java", "-jar", "service.jar" ]
```
2. 修改项目`build.gradle`,增加

```
subprojects {
    group 'cn.com.sjfx.项目名称'
    version '1.0.0'
    def exphttp=20000
    def exptcp=20001
```

3. 在jenkins 添加自由风格项目

配置git地址

增加脚本发布内容：
```
gradle build -xtest
bash /opt/public.sh 20000 20001
```

已经将public.sh 放到 /opt 目录下
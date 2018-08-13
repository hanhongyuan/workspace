FROM java:8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV APP_HOME=/app
WORKDIR  ${APP_HOME}
COPY . .
ENV JAR_ARGS=""
# ARG HTTP_PORT=8080
# ARG TCP_PORT=20001
# EXPOSE ${HTTP_PORT}
# EXPOSE ${TCP_PORT}
# HEALTHCHECK --interval=30s --timeout=3s \
#   CMD curl --fs http://localhost:${HTTP_PORT} || exit 1
VOLUME  ${APP_HOME}/logs 
ENTRYPOINT java -jar $JAR_ARGS service.jar

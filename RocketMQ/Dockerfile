FROM  openjdk:8
EXPOSE 9876
USER root
WORKDIR /opt/rocketmq-all-4.2.0
COPY . .
VOLUME [ "/opt/rocketmq-all-4.2.0/conf/" ]
VOLUME [ "/root/logs/rocketmqlogs/" ]
RUN nohup sh bin/mqnamesrv &
RUN export NAMESRV_ADDR=localhost:9876
ENTRYPOINT [ "sh","bin/mqbroker -n localhost:9876" ]
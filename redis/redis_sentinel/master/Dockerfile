FROM redis:4.0.9
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENTRYPOINT ["redis-server","/usr/local/etc/redis/redis.conf"] 
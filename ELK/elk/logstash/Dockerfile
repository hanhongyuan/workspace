# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash:6.5.4

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone



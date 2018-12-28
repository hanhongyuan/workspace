# https://github.com/elastic/kibana-docker
FROM docker.elastic.co/kibana/kibana:6.5.4

# Add your kibana plugins setup here
# Example: RUN kibana-plugin install <name|url>
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
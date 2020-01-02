# https://github.com/elastic/elasticsearch-docker
FROM docker.elastic.co/elasticsearch/elasticsearch:7.5.0

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu
# RUN mkdir ./plugins/ik && cd ./plugins/ik && \
# wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.5.3/elasticsearch-analysis-ik-6.5.3.zip &&  \
# unzip elasticsearch-analysis-ik-6.5.3.zip && \
# rm -f elasticsearch-analysis-ik-6.5.3.zip
RUN elasticsearch-plugin install analysis-smartcn
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/ /etc/localtime && echo  > /etc/timezone

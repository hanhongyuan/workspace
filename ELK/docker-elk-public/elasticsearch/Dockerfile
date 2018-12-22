# https://github.com/elastic/elasticsearch-docker
FROM docker.elastic.co/elasticsearch/elasticsearch-basic:6.5.3

# RUN mkdir /usr/share/elasticsearch/plugins/ik
# COPY ../ik /usr/share/elasticsearch/plugins/ik
# Add your elasticsearch plugins setup here
RUN elasticsearch-plugin install analysis-icu

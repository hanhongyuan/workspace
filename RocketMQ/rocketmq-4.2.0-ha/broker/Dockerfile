#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Start from a Java image.
FROM java:8

ARG version

ARG runip="127.0.0.1"

# Rocketmq version
ENV ROCKETMQ_VERSION ${version}

# Rocketmq home
ENV ROCKETMQ_HOME  /opt/rocketmq-${ROCKETMQ_VERSION}

WORKDIR  ${ROCKETMQ_HOME}

RUN mkdir -p \
		/opt/logs \
	    /opt/store

COPY . .

RUN chmod +x ${ROCKETMQ_HOME}/bin/mqbroker

RUN echo "brokerIP1=${runip}" >>  ${ROCKETMQ_HOME}/conf/broker.properties

CMD cd ${ROCKETMQ_HOME}/bin && \
	export JAVA_OPT=" -Duser.home=/opt" && \
	sh mqbroker -n namesrv:9876 -c ${ROCKETMQ_HOME}/conf/broker.properties


EXPOSE 10909 10911
VOLUME /opt/logs \
		/opt/store

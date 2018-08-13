# 简单

log4j

<PatternLayout pattern="${sys:elk_name} %d{ISO8601} [%t] %-5level %logger{36} '%msg'%n"/>

logstash

%{NOTSPACE:microservice}\s*%{TIMESTAMP_ISO8601:time}\s*%{SYSLOG5424SD:thread}\s*%{LOGLEVEL:level}\s*%{NOTSPACE:menthod}\s*%{QUOTEDSTRING:content}


# 复杂

log4j

<PatternLayout pattern="${sys:elk_name} %d{ISO8601} [%t] %-5level %C %M %F %L '%m'%n"/>

logstash

%{NOTSPACE:microservice}\s*%{TIMESTAMP_ISO8601:time}\s*%{SYSLOG5424SD:thread}\s*%{LOGLEVEL:level}\s*%{JAVACLASS:javaclass}\s*%{WORD:menthod}\s*%{JAVAFILE:file}\s*%{BASE10NUM:rowcount}\s*%{QUOTEDSTRING:content}

有问题




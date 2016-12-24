FROM logstash:5.0.1

MAINTAINER Lei Zhu <lei.zhu.1017@gmail.com>

COPY config/* /etc/logstash/

RUN mkdir -p /opt/logstash/logs
VOLUME /opt/logstash/logs

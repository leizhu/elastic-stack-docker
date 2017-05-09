FROM logstash:5.2.2

MAINTAINER Lei Zhu <lei.zhu.1017@gmail.com>

# set timezone
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

COPY config/* /etc/logstash/
#COPY logstash-input-kafka-6.2.7.gem /opt/

RUN mkdir -p /opt/logstash/logs
VOLUME /opt/logstash/logs

#RUN /usr/share/logstash/bin/logstash-plugin uninstall logstash-input-kafka
#RUN /usr/share/logstash/bin/logstash-plugin install /opt/logstash-input-kafka-6.2.7.gem

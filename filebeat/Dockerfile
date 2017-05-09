FROM ubuntu:14.04

MAINTAINER Lei Zhu <lei.zhu.1017@gmail.com>

ENV FILEBEAT_VERSION 5.2.2

COPY sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get -y install wget 
RUN wget --no-check-certificate https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz
RUN tar xzf filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz && \
    mv filebeat-${FILEBEAT_VERSION}-linux-x86_64/filebeat /usr/local/bin && \
    rm -rf /filebeat* && \
    apt-get -y remove wget && \
    apt-get -y autoremove

RUN mkdir -p /etc/filebeat/
VOLUME /etc/filebeat

CMD ["/usr/local/bin/filebeat", "-e", "-c", "/etc/filebeat/filebeat.yml"]

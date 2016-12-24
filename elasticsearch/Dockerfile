FROM elasticsearch:5.0.1

MAINTAINER lei.zhu.1017@gmail.com

RUN echo "elasticsearch    soft    memlock        unlimited" >> /etc/security/limits.conf
RUN echo "elasticsearch    hard    memlock        unlimited" >> /etc/security/limits.conf

# Install Elasticsearch plug-ins
ADD do_not_use.yml /usr/share/elasticsearch/config/elasticsearch.yml

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install io.fabric8:elasticsearch-cloud-kubernetes:5.0.1

COPY plugins/elasticsearch-analysis-ik-5.0.1.zip /tmp/
RUN mkdir /usr/share/elasticsearch/plugins/ik
RUN unzip /tmp/elasticsearch-analysis-ik-5.0.1.zip -d /usr/share/elasticsearch/plugins/ik/

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install -b https://github.com/vvanholl/elasticsearch-prometheus-exporter/releases/download/5.0.1.0/elasticsearch-prometheus-exporter-5.0.1.0.zip

#COPY plugins/x-pack-5.0.1.zip /tmp/
#RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install file:/tmp/x-pack-5.0.1.zip

RUN rm -rf /tmp/*.zip

# RUN apt-get update && apt-get -y install nfs-common

WORKDIR /usr/share/elasticsearch
COPY ./config/* /usr/share/elasticsearch/config/

VOLUME /usr/share/elasticsearch/data
VOLUME /usr/share/elasticsearch/logs

RUN mkdir /backups
RUN chmod -R 777 /backups 
RUN chown -R elasticsearch:elasticsearch /backups
VOLUME /backups

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]

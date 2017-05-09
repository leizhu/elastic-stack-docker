FROM elasticsearch:5.2.2

MAINTAINER lei.zhu.1017@gmail.com

RUN echo "elasticsearch    soft    memlock        unlimited" >> /etc/security/limits.conf
RUN echo "elasticsearch    hard    memlock        unlimited" >> /etc/security/limits.conf

# Install Elasticsearch plug-ins
ADD do_not_use.yml /usr/share/elasticsearch/config/elasticsearch.yml

#COPY plugins/elasticsearch-cloud-kubernetes-5.1.1.zip /tmp/
#RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install file:///tmp/elasticsearch-cloud-kubernetes-5.1.1.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install io.fabric8:elasticsearch-cloud-kubernetes:5.2.2

COPY plugins/elasticsearch-analysis-ik-5.2.2.zip /tmp/
RUN mkdir /usr/share/elasticsearch/plugins/ik
RUN unzip /tmp/elasticsearch-analysis-ik-5.2.2.zip -d /usr/share/elasticsearch/plugins/ik/

COPY plugins/elasticsearch-prometheus-exporter-5.2.2.0.zip /tmp/
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install file:///tmp/elasticsearch-prometheus-exporter-5.2.2.0.zip

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

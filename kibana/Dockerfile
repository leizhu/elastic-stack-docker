FROM kibana:5.0.1

MAINTAINER lei.zhu.1017@gmail.com

COPY docker-entrypoint.sh /

#COPY ./plugins/x-pack-5.0.1.zip /tmp/
#RUN /usr/share/kibana/bin/kibana-plugin install file:///tmp/x-pack-5.0.1.zip
#RUN rm -rf /tmp/*.zip


EXPOSE 5601
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["kibana"]

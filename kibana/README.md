# How to run kibana with SSL
```
docker run --name kibana-ssl -e ELASTICSEARCH_URL=https://es-ssl.default:9200 -e ELASTICSEARCH_USERNAME=kibanaserver -e ELASTICSEARCH_PASSWORD=kibanaserver -e ELASTICSEARCH_SSL_CA=/opt/certs/root-ca.pem -e ELASTICSEARCH_SSL_VERIFY=true -p 5601:5601 -d kibana-kubernetes:1.0
```

# More dashboards
[Visualizing Your Data in Kibana](https://www.elastic.co/guide/en/beats/libbeat/1.2/visualizing-data.html), it provides more cool dashboards for end users.

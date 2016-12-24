# Running Elasticsearch with SSL enabled
```
docker run -d --privileged --name es -v /opt/es/data:/usr/share/elasticsearch/data -v /opt/es/logs:/usr/share/elasticsearch/logs --env-file ./env.list -p 9200:9200 elasticsearch-incidents:1.1
```

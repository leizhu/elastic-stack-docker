#!/bin/bash
set -ex

echo "Build version is "$BUILD_VERSION

# build docker images
echo "build elasticsearch image"
cd ./elasticsearch/
docker build -t 172.22.111.199:80/cloud/elasticsearch:$BUILD_VERSION ./
docker push 172.22.111.199:80/cloud/elasticsearch:$BUILD_VERSION
cd ../

echo "build logstash image"
cd ./logstash/
docker build -t 172.22.111.199:80/cloud/logstash:$BUILD_VERSION ./
docker push 172.22.111.199:80/cloud/logstash:$BUILD_VERSION
cd ../

echo "build kibana image"
cd ./kibana/
docker build -t 172.22.111.199:80/cloud/kibana:$BUILD_VERSION ./
docker push 172.22.111.199:80/cloud/kibana:$BUILD_VERSION
cd ../

echo "build filebeat image"
cd ./filebeat/
docker build -t 172.22.111.199:80/cloud/filebeat:$BUILD_VERSION ./
docker push 172.22.111.199:80/cloud/filebeat:$BUILD_VERSION
cd ../

echo "update README"                                                                                                                                   
echo "--------------------" >> ./README.md
echo "version: "$BUILD_VERSION >> ./README.md
echo "Notes: "$RELEASE_NOTE >> ./README.md
echo "\n" >> ./README.md

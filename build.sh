#!/bin/bash
set -ex

echo "Build version is "$BUILD_VERSION

# build docker images
echo "build elasticsearch image"
cd ./elasticsearch/
docker build -t elasticsearch:$BUILD_VERSION ./
cd ../

echo "build logstash image"
cd ./logstash/
docker build -t logstash:$BUILD_VERSION ./
cd ../

echo "build kibana image"
cd ./kibana/
docker build -t kibana:$BUILD_VERSION ./
cd ../

echo "build filebeat image"
cd ./filebeat/
docker build -t filebeat:$BUILD_VERSION ./
cd ../

echo "update RELEASENOTES"                                                                                                                                   
echo "--------------------" >> ./RELEASENOTES
echo "version: "$BUILD_VERSION >> ./RELEASENOTES
echo "Notes: "$RELEASE_NOTE >> ./RELEASENOTES

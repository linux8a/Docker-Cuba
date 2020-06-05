#!/bin/bash
# Script create for linux8a@gmail.com
mkdir -p images
for var in $(docker images --format '{{.Repository}}:{{.Tag}}');do
docker save $var > ./images/$var.tar.gz
done

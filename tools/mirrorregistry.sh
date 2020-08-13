#!/bin/bash
# Script create for linux8a@gmail.com
# This script ceate and push images docker automati in may private server
filelist="./tmp/dockerhub.conf"
filetemp="./tmp/tempdockerhub.conf"
tmp="./tmp/tmp"
server="registry:5000/" # Entry your name registry server
mkdir ./tmp -p
echo "Working ...."
curl -L -s 'https://registry.hub.docker.com/v2/repositories/library/?page_size=2049'|jq '."results"[]["name"]' > $filelist
sed -i 's/"//g' $filelist

###Download images form dockerHub
echo ""
echo "Waiting please.."

   for download in $(cat $filelist);do
       docker search --filter is-official=true $download >> $filetemp

    done

awk '{print $1}' $filetemp > $tmp
sed -i 's/NAME//g' $tmp
 
 ##Download
 for download in $(cat $tmp);do
       docker pull $download
    done 
rm ./tmp -R

# Create tag
    for tag in $(docker images --format '{{.Repository}}:{{.Tag}}');do
        docker tag $tag $server$tag
    done
echo "Preparing for push all images in your registry server: $server"
sleep 5

### Push images my private registry

    for push in $(docker images --format '{{.Repository}}:{{.Tag}}' |grep $server);do
        docker push $push
    done
sleep 3
echo "All images is upload your server $server"
sleep 1

### Remove tag imagen

echo "preparing for remove all tag (only tag)"
    for del in $(docker images --format '{{.Repository}}:{{.Tag}}' |grep $server);do
        docker rmi $del
    done

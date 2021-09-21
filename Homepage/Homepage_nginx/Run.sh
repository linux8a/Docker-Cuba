#!/bin/sh
latest=`curl --silent https://github.com/bastienwirtz/homer/releases/latest | cut -f 8 -d'/'|sort|uniq | sed 's/\(^........\).*/\1/'`
wget https://github.com/bastienwirtz/homer/releases/download/$latest/homer.zip
unzip -d homer homer.zip
cp ./assets ./homer/assets -Rv
sudo docker-compose up -d
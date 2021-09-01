#!/bin/ash
path=/data
#python -m cvdupdate clean all
python -m cvdupdate config set --dbdir /data/
python -m cvdupdate update
chmod -R 777 $path/*

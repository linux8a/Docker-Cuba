#!/bin/ash
#http://clamavdb.c3sl.ufpr.br/
path=/html/database
url="http://database.clamav.net/"
mkdir -p $path;rm -rf $path/*
for db in main.cvd daily.cvd bytecode.cvd safebrowsing.cvd;
    do
     wget -c $url$db -P $path
    done
chmod -R 755 $path/*
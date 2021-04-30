#!/bin/sh

exec python /usr/src/udemy-dl/udemy-dl.py \
            ${URL} \
           -u $USERNAME \
           -p ${PASSWORD} \
           -o "/data"
           --info
$ARGS

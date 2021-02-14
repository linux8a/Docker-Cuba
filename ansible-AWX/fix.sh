#!/bin/sh

docker-compose up -d
sleep 2
chmod 777 data/redis_socket -Rv
docker-compose exec web awx-manage migrate --noinput
sleep 2
docker-compose exec web awx-manage createsuperuser --username admin
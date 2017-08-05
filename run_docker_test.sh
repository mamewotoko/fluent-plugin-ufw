#! /bin/sh
set -e
docker-compose up --build -d
sleep 10
docker-compose exec fluent-plugin-ufw sh -c "cat /home/fluent/ufw.output.*" | grep SRC && echo ok
docker-compose logs
docker-compose down

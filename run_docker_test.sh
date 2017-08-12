#! /bin/sh

set -x

(
    set -e
    
    bundle exec rake build
    docker-compose up --build -d
    sleep 20
    docker-compose exec fluent-plugin-ufw sh -c "cat /home/fluent/ufw.output.*" | tee ufw.output.log | grep SRC
)
EXIT_CODE=$?
#docker-compose logs
docker-compose down

exit $EXIT_CODE

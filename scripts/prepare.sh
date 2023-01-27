#!/bin/sh

mkdir -p data/hestia

wait_till_run(){
    echo "Waiting for container to start"
    until (docker inspect -f {{.State.Running}} hestia.prepare 2> /dev/null); do
        sleep 1;
    done;
    echo "Container started"
}

# Run prepare container
docker-compose up hestia.prepare & wait_till_run

# Copy files
docker cp hestia.prepare:/home ./data
docker cp hestia.prepare:/usr/local/hestia/data ./data/hestia

# Delete container
docker stop hestia.prepare
docker wait hestia.prepare
# docker rm hestia.prepare

exit 0
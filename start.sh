#!/bin/sh

if [ ! -d data/home/admin ]; then
    ./prepare.sh
fi

docker-compose up -d hestia
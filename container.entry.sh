#!/bin/sh

if [ "$1" == "start" ]; then
    /etc/init.d/hestia start
    tail -f /dev/null
fi

if [ "$1" == "prepare" ]; then
    sleep 10
fi
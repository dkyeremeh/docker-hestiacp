#!/bin/sh

if [ "$1" == "start" ]; then
    /etc/init.d/hestia start
    tail -f /dev/null
fi
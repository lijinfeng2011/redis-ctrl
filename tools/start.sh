#!/bin/bash

UUID=$1

if [ "X$UUID" == "X" ];then
    echo $0 UUID
    exit 1 
fi

cd /data/redis/$UUID/ && docker-compose  up -d


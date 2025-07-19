#!/bin/bash

UUID=$1

if [ "X$UUID" == "X" ]; then
    echo "$0 UUID"
    exit 1
fi

PORT=$(echo 6379 + $UUID - 1 | bc)

exec docker exec -it redis-$UUID redis-cli -p 6379


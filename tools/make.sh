#!/bin/bash

VERSION=$1
UUID=$2

if [ "X$UUID" == "X" ]; then
    echo "$0 version UUID"
    exit 1
fi

mkdir -p /data/redis/$UUID
cp ../redis-$VERSION/* /data/redis/$UUID/

# 替换 _UUID_
sed -i "s/_UUID_/$UUID/" /data/redis/$UUID/docker-compose.yaml

# 计算端口（假设 Redis 起始端口为 6379）
PORT=$(echo 6379 + $UUID - 1 | bc)
echo PORT: $PORT

# 替换 _PORT_
sed -i "s/_PORT_/$PORT/" /data/redis/$UUID/docker-compose.yaml


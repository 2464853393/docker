#!/bin/bash
mkdir -p  /usr/src/redis 
tar -xzf /opt/soft/redis.tar.gz -C /usr/src/redis --strip-components=1
cd /usr/src/redis  
make -C /usr/src/redis -j "$(nproc)" && make -C /usr/src/redis install
rm -fr /usr/src/redis
mv /config/redis.conf /usr/src/redis/redis.conf
rm -rf /soft/redis.tar.gz
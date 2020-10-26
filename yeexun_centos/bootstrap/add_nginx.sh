#!/bin/bash
apt-get install -y libpcre3 libpcre3-dev openssl libssl-dev libperl-dev zlib
mkdir -p  /usr/src/nginx 
tar -xzf /soft/nginx.tar.gz -C /usr/src/nginx --strip-components=1
cd /usr/src/nginx  
./configure --prefix=/usr/local/nginx  
make -j "$(nproc)" && make install
mv /config/nginx.conf /usr/local/nginx/conf/nginx.conf
rm -rf /soft/nginx.tar.gz
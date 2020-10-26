#!/bin/bash
#change yum source
cd /etc/yum.repos.d && mv CentOS-Base.repo CentOS-Base.repo.bk 
mv /config/CentOS-Base.repo /etc/yum.repos.d/
#compile nginx and redis
yum -y install make zlib zlib-devel gcc-c++ libtool  openssl openssl-devel gcc pcre libaio.so.1 libnuma.so.1 net-tools initscripts libaio numactl
rpm -ivh /soft/dependency/pcre-7.8-7.el6.x86_64.rpm --force 
rpm -ivh /soft/dependency/pcre-devel-7.8-7.el6.x86_64.rpm 
rpm -ivh /soft/dependency/libstdc++-4.4.7-23.el6.x86_64.rpm  --force 
rpm -ivh /soft/dependency/libstdc++-devel-4.4.7-23.el6.x86_64.rpm --force

 
#mkdir -p  /usr/local/jre7 
#mkdir -p  /usr/src/nginx  
#mkdir -p  /usr/src/redis  
#mkdir -p  /usr/local/tomcat7
#tar -xzf /soft/redis.tar.gz -C /usr/src/redis --strip-components=1  
#tar -xzf /soft/nginx.tar.gz -C /usr/src/nginx --strip-components=1  
#tar -xzf /soft/jre7.tar.gz -C /usr/local/jre7 --strip-components=1
#tar -xf /soft/tomcat7.tar.gz -C /usr/local/tomcat7 --strip-components=1

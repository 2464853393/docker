#!/bin/bash

apt-get install -y --no-install-recommends pwgen openssl perl
rpm -ivh /soft/mysql/mysql-community-common-5.7.15-1.el6.x86_64.rpm 
rpm -ivh /soft/mysql/mysql-community-libs-5.7.15-1.el6.x86_64.rpm 
rpm -ivh /soft/mysql/mysql-community-client-5.7.15-1.el6.x86_64.rpm 
rpm -ivh /soft/mysql/mysql-community-server-5.7.15-1.el6.x86_64.rpm 
chkconfig mysqld on
#service mysqld start 
#export initpasswd=$(cat /var/log/mysqld.log | more | grep "A temporary password is generated for root@localhost"|awk -F ": " '{print $2}') 
#mysql -uroot -p${initpasswd} --connect-expired-password < /config/mysql_passwd.sql 
rm -rf /soft/mysql/*
mkdir /var/lib/mysql-data
rm -f /etc/my.cnf
#修改MySQL配置文件
mv /config/my.cnf /etc/
#rm -rf /config/mysql_passwd.sql

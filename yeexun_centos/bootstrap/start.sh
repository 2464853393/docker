#!/bin/bash
. /etc/rc.d/init.d/functions
# Start the first process
/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf &

# Start the second process
/usr/src/redis/src/redis-server /usr/src/redis/redis.conf &

/usr/local/tomcat7/bin/startup.sh &

# Start the second process
service mysqld start &
sleep 10
#判断是否存在/usr/bin/mysql.txt文件  存在就不用初始化mysql数据库
if [ ! -f /usr/bin/mysql.txt ]; then
  echo  "init:true" > /usr/bin/mysql.txt
  initpasswd=$(cat /var/log/mysqld.log | more | grep "A temporary password is generated for root@localhost"|awk -F ": " 'END {print $2}')
  mysql -uroot -p${initpasswd} --connect-expired-password < /config/mysql_passwd.sql 
fi
#mysql -uroot -p123456 < /config/dataxdb.sql
#mysql -uroot -p123456 < /config/datatools.sql

while true;do 
  tail -f /usr/local/tomcat7/logs/catalina.out >> /dev/null;
  sleep 500;
done

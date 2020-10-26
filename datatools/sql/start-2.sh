#!/bin/bash

. /etc/rc.d/init.d/functions

# Start the nginx
/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_first_process: $status"
  exit $status
fi

# Start the redis
/usr/src/redis/src/redis-server /usr/src/redis/redis.conf &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi
#start the tomcat
/usr/local/tomcat7/bin/startup.sh &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_first_process: $status"
  exit $status
fi

# Start the mysql and Determining whether MySQL is initialized
service mysqld start &
sleep 10
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi

if [ ! -f /usr/bin/mysql.txt ]; then
  echo  "init:true" > /usr/bin/mysql.txt
  initpasswd=$(cat /var/log/mysqld.log | more | grep "A temporary password is generated for root@localhost"|awk -F ": " 'END {print $2}')
  mysql -uroot -p${initpasswd} --connect-expired-password < /config/mysql_passwd.sql 
fi



mysql -uroot -p${initpasswd}
status=$?
if [ $status -eq 0 ]  ;then 
  echo "not inited";
  mysql -uroot -p${initpasswd} --connect-expired-password < /config/mysql_passwd.sql 
fi
mysql -uroot -p${initpasswd} --connect-expired-password < /config/mysql_passwd.sql 

while sleep 600; do

  ps aux |grep my_first_process |grep -q -v grep
  PROCESS_1_STATUS=$?
  
  ps aux |grep my_second_process |grep -q -v grep
  PROCESS_2_STATUS=$?
  
  ps aux |grep my_first_process |grep -q -v grep
  PROCESS_1_STATUS=$?
  
  ps aux |grep my_second_process |grep -q -v grep
  PROCESS_2_STATUS=$?
  
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit -1
  fi
done
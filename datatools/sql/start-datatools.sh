#!/bin/bash
. /etc/rc.d/init.d/functions & 

#启动nginx服务
/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf &

#启动redis服务
/usr/src/redis/src/redis-server /usr/src/redis/redis.conf &

#启动tomcat服务
/usr/local/tomcat7/bin/startup.sh &

#启动并初始化MySQL服务
service mysqld start 
wait
if [ ! -f /usr/bin/mysql-datatools.txt ]; then
  echo  "init:true" >> /usr/bin/mysql-datatools.txt
  initpasswd=$(cat /var/log/mysqld.log | more | grep "A temporary password is generated for root@localhost"|awk -F ": " 'END {print $2}')
  #初始化数据库密码和远程访问权限
  mysql -uroot -p${initpasswd} --connect-expired-password < /config/mysql_passwd.sql 
  
  #init datatools database
  mysql -uroot -p123456 < /home/sql/dataxdb.sql --default-character-set=utf8  
  mysql -uroot -p123456 < /home/sql/datatools.sql --default-character-set=utf8
fi
echo "mysql inited"


#生成license  输入时间戳
cd /sql && java -cp ls-0.0.1-SNAPSHOT.jar  com.yeexun.ls.LicenseGenerator start 1556640000000

#将时间戳放在应用配置文件里面


export MYSQL_PASSWORD=123456
while true;do 
  tail -f /usr/local/tomcat7/logs/catalina.out >> /dev/null
  sleep 500
done

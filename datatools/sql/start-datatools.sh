#!/bin/bash
. /etc/rc.d/init.d/functions & 

#����nginx����
/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf &

#����redis����
/usr/src/redis/src/redis-server /usr/src/redis/redis.conf &

#����tomcat����
/usr/local/tomcat7/bin/startup.sh &

#��������ʼ��MySQL����
service mysqld start 
wait
if [ ! -f /usr/bin/mysql-datatools.txt ]; then
  echo  "init:true" >> /usr/bin/mysql-datatools.txt
  initpasswd=$(cat /var/log/mysqld.log | more | grep "A temporary password is generated for root@localhost"|awk -F ": " 'END {print $2}')
  #��ʼ�����ݿ������Զ�̷���Ȩ��
  mysql -uroot -p${initpasswd} --connect-expired-password < /config/mysql_passwd.sql 
  
  #init datatools database
  mysql -uroot -p123456 < /home/sql/dataxdb.sql --default-character-set=utf8  
  mysql -uroot -p123456 < /home/sql/datatools.sql --default-character-set=utf8
fi
echo "mysql inited"


#����license  ����ʱ���
cd /sql && java -cp ls-0.0.1-SNAPSHOT.jar  com.yeexun.ls.LicenseGenerator start 1556640000000

#��ʱ�������Ӧ�������ļ�����


export MYSQL_PASSWORD=123456
while true;do 
  tail -f /usr/local/tomcat7/logs/catalina.out >> /dev/null
  sleep 500
done

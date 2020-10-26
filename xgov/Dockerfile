FROM yeexun-centos:1902
COPY webapps /usr/local/tomcat7/webapps
COPY dist /home/dist
COPY sql /home/sql

VOLUME /var/lib/mysql
RUN chmod 777 -R /home/*
RUN yum install -y dmidecode 
#RUN cd /home/sql && java -cp ls-0.0.1-SNAPSHOT.jar  com.yeexun.ls.LicenseGenerator start 1556640000000

EXPOSE 3306 80 33060 6379 6380 83 8005 8080 8009 8081	

CMD /home/sql/start-datatools.sh



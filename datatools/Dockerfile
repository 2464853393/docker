FROM yeexun-centos:1902
COPY webapps /usr/local/tomcat7/webapps
COPY dist /home/dist
COPY datax /home/datax
COPY sql /home/sql

VOLUME /var/lib/mysql
RUN chmod 777 -R /home/sql/
CMD /home/sql/start-datatools.sh

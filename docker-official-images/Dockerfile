FROM nginx:1.15.5 as nginxoo
#COPY --from=mysqloo / /
COPY . /home

FROM redis:4.0.2 as redisoo
COPY --from=nginxoo / /


FROM tomcat:7.0.70 as tomcatoo
COPY --from=redisoo / /

#FROM mysql:5.7
#COPY --from=tomcatoo / / 

#ENV MYSQL_ROOT_PASSWORD=123456


#FROM scratch
# copy tomcat,nginx,datatools to image
#COPY . /tmp
RUN cp /home/nginx.conf /etc/nginx/nginx.conf \
	&& mv /home/tools.war /usr/local/tomcat/webapps \
	&& mv /home/yeexunDatax.war /usr/local/tomcat/webapps \
	&& chomd 777 /home/* \
#	&& /bin/bash /tmp/bootstrap.sh
#	&& yum install -y vim 
#COPY --from=redis

#init
#RUN chmod 777 -R /tmp/tmp/bootstrap.sh
#export port

EXPOSE 6379 6380 80 8005 8080 8009 3306

CMD ["/bin/bash",/tmp/bootstrap.sh"]
FROM centos:6.8

COPY . /

#容器添加Java、tomcat、nginx、redis、MySQL服务
RUN chmod 777 -R /bootstrap/* \
 && /bootstrap/add-dependency.sh \
 && rm -rf /bootstrap/add-dependency.sh \
 \
 && /bootstrap/add_jre7.sh \
 && rm -rf /bootstrap/add_jre7.sh \
 \
 && /bootstrap/add_tomcat7.sh \
 && rm -rf /bootstrap/add_tomcat7.sh \
 \
 && /bootstrap/add_nginx.sh \
 && rm -rf /bootstrap/add_nginx.sh \
 \
 && /bootstrap/add_redis.sh \
 && rm -rf /bootstrap/add_redis.sh \
 \
 && /bootstrap/add_mysql.sh \
 && rm -rf /bootstrap/add_mysql.sh \
 #设置容器时区
 && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime



ENV JRE_HOME /usr/local/jre7 
ENV PATH $PATH:$JRE_HOME/bin:/usr/local/nginx/sbin/nginx

EXPOSE 3306 33060 6379 6380 83 8005 8080 8009 :8081

CMD /bootstrap/start.sh


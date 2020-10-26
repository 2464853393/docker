FROM centos:7
# 维护者信息
MAINTAINER yeexun_group

#安装nginx
COPY nginx.tar.gz /usr/src/nginx

#安装jdk
RUN mkdir -p /usr/local/soft/log
ADD jdk1.8.0_131 /usr/local/soft/jdk


ADD ini.sh /usr/local/soft/ini.sh
RUN chmod 777 /usr/local/soft/ini.sh

#设置zk环境变量
ENV JAVA_HOME /usr/local/soft/jdk
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:$JAVA_HOME/bin

#安装服务
ADD spring-0.0.1-SNAPSHOT.jar /opt/spring-0.0.1-SNAPSHOT.jar

EXPOSE 57321 


#设置启动环境变量



ENTRYPOINT /usr/local/soft/ini.sh

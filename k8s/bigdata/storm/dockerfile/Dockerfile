FROM centos

ADD apache-storm-1.1.0.tar.gz /usr/local/
ADD storm-config /etc/storm-config
ADD jdk1.8.0_151.tar.gz /usr/local

ENV JAVA_HOME /usr/local/jdk1.8.0_151
ENV STORM_HOME /usr/local/apache-storm-1.1.0

ENV PATH $PATH:$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$STORM_HOME/bin

RUN mkdir /usr/local/apache-storm-1.1.0/data && \
    chmod 777 -R /etc/storm-config/* && \
    mv /etc/storm-config/storm.yaml /usr/local/apache-storm-1.1.0/conf/storm.yaml 

EXPOSE 6700:6704 8087

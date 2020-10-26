FROM danisla/hadoop:2.7.3

ADD hadoop-config /etc/hadoop-config/
ADD jdk1.8.0_151.tar.gz /usr/lib/jvm/
ADD apache-hive-1.2.2-bin.tar.gz /usr/local/
ADD hbase-1.4.7-bin.tar.gz /usr/local/
ADD scala-2.12.5.tgz /usr/local/
ADD spark-2.3.0-bin-hadoop2.7.tgz /usr/local

ENV JAVA_HOME /usr/lib/jvm/jdk1.8.0_151
ENV JAVA_DEBIAN_VERSION 8u161-b14-2~bpo8+1
ENV HIVE_HOME /usr/local/apache-hive-1.2.2-bin
ENV HBASE_HOME /usr/local/hbase-1.4.7
ENV SCALA_HOME /usr/local/scala-2.12.5
ENV HADOOP_HOME /usr/local/hadoop-2.7.3
ENV SPARK_HOME /usr/local/spark-2.3.0-bin-hadoop2.7

ENV PATH $PATH:$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$HIVE_HOME/bin:$HBASE_HOME/bin:$SCALA_HOME/bin
ENV CLASSPATH $CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib


COPY mysql-connector-java-5.1.39-bin.jar $HIVE_HOME/lib


RUN (mkdir -p $HIVE_HOME/tmp; \
     apt-get update -y; \
     apt-get install -y openssh-server vim; \
     ssh-keygen -t rsa -f /root/.ssh/id_rsa; \
     cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys; \
     echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config; \
     apt-get remove openjdk* -y; \
     rm -rf /usr/lib/jvm/java-1.8.0-openjdk-amd64; \
     rm -rf /usr/lib/jvm/java-8-openjdk-amd64; \
     update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_151/bin/java 300; \
     update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_151/bin/javac 300; \
     update-alternatives --config java; )


EXPOSE 22 2122 8019 8020 8030:8033 8040:8042 8088 8480 8485 9000 9001 19888 49707 50010 50020 50070 50075 50090 10001 9083 60010 60030 7077 8080 8081 4040 18080 8020 

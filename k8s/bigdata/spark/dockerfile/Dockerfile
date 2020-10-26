FROM zhhray/hadoop:2.7.3

WORKDIR /opt/spark/spark-2.0.2-bin-hadoop2.6

ADD spark-config /etc/spark-config/
ADD spark-2.0.2-bin-hadoop2.6.tgz /opt/spark/
ADD scala-2.11.8.zip /opt/scala/

ENV HADOOP_HOME /usr/local/hadoop
ENV SCALA_HOME /opt/scala/scala-2.11.8
ENV SPARK_HOME /opt/spark/spark-2.0.2-bin-hadoop2.6
ENV PATH $PATH:$SPARK_HOME/bin:$SCALA_HOME/bin

EXPOSE 7077 8080 8081

 FROM zhhray/hadoop:2.7.3

WORKDIR /opt/spark/spark-2.3.0-bin-hadoop2.7

ADD spark-config /etc/spark-config/
ADD spark-2.3.0-bin-hadoop2.7.tgz /opt/spark/
ADD scala-2.12.4.tgz /opt/scala/

ENV HADOOP_HOME /usr/local/hadoop
ENV SCALA_HOME /opt/scala/scala-2.12.4
ENV SPARK_HOME /opt/spark/spark-2.3.0-bin-hadoop2.7
ENV PATH $PATH:$SPARK_HOME/bin:$SCALA_HOME/bin

EXPOSE 6700 6701 6702 8080

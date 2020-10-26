#!/bin/bash

# Directory to find config artifacts
HADOOP_BOOTSTRAP=/etc/hadoop-config/bootstrap.sh
SPARK_PREFIX=/opt/spark/spark-2.3.0-bin-hadoop2.7
SPARK_CONFIG_FILE=/tmp/spark/config.sh
SPARK_CONFIG_DIR=/etc/spark-config

if [ ! -f  $SPARK_CONFIG_FILE ]; then
  echo "ERROR: Could not find $SPARK_CONFIG_FILE"
  exit 1
fi

# Start hadoop 
chmod 755 $HADOOP_BOOTSTRAP
. $HADOOP_BOOTSTRAP -bash

# Get spark config from external
chmod 755 $SPARK_CONFIG_FILE
. $SPARK_CONFIG_FILE

cp $SPARK_PREFIX/conf/spark-env.sh.template $SPARK_PREFIX/conf/spark-env.sh
cp $SPARK_PREFIX/conf/slaves.template $SPARK_PREFIX/conf/slaves

# spark env configuration
echo "SPARK_MASTER_HOST=$SPARK_MASTER_HOST" >> $SPARK_PREFIX/conf/spark-env.sh; 

if [[ "${HOSTNAME}" =~ "${SPARK_MASTER_HOSTNAME}" ]]; then
  #change spark slaves
  chmod 755 $SPARK_CONFIG_DIR/slaves-change.sh
  $SPARK_CONFIG_DIR/slaves-change.sh &

  $SPARK_PREFIX/sbin/start-master.sh

elif [[ "${HOSTNAME}" =~ "${SPARK_SLAVE_HOSTNAME}" ]]; then

  echo "$SPARK_PREFIX/sbin/start-slave.sh spark://$SPARK_MASTER_HOST:$SPARK_MASTER_PORT"
  $SPARK_PREFIX/sbin/start-slave.sh "spark://$SPARK_MASTER_HOST:$SPARK_MASTER_PORT"

fi

until find ${SPARK_PREFIX}/logs -mmin -1 | egrep -q '.*'; echo "`date`: Waiting for logs..." ; do sleep 2 ; done
tail -F ${SPARK_PREFIX}/logs/* &
while true; do sleep 1000; done



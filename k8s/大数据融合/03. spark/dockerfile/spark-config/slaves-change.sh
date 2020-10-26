#!/bin/bash

SLAVES_PATH="/tmp/spark/slaves"

while true;
do
  cat /dev/null > /opt/spark/spark-2.3.0-bin-hadoop2.7/conf/slaves;

  for node in  `cat $SLAVES_PATH`
  do
   eval echo $node >> /opt/spark/spark-2.3.0-bin-hadoop2.7/conf/slaves;
  done

  sleep 5;
done

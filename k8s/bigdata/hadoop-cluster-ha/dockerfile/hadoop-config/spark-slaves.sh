#!/bin/bash

SLAVES_PATH="/tmp/hadoop/hdfs/slaves"
touch -p $SPARK_HOME/conf/slaves
  cat /dev/null > $SPARK_HOME/conf/slaves;

  cat $SLAVES_PATH|while read node
  do
   eval echo $node >> $SPARK_HOME/conf/slaves;
  done

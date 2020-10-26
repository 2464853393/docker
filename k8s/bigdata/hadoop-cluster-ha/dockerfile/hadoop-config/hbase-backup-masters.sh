#!/bin/bash

SLAVES_PATH="/tmp/hadoop/hdfs/slaves"

#while true;
#do
#  cat /dev/null > $HBASE_HOME/conf/backup-masters;

  #cat $SLAVES_PATH|while read node
  #do
   #eval echo $node >> $HBASE_HOME/conf/backup-masters;
   echo 'cluster2-hdfs-namenode-0.cluster2-namenode-headless.default.svc.cluster.local' >> $HBASE_HOME/conf/backup-masters
   echo 'cluster2-hdfs-namenode-1.cluster2-namenode-headless.default.svc.cluster.local' >> $HBASE_HOME/conf/backup-masters
  #done

#  sleep 10; 
#done

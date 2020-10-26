#!/bin/bash

# Directory to find config artifacts
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_HOME=/usr/local/hadoop
CONFIG_DIR=/etc/hadoop-config
JAVA_HOME_DIR=/usr/lib/jvm/jdk1.8.0_151
HDFS_CONFIG_FILE=/tmp/hadoop/hdfs/config.sh
RM_CONFIG_FILE=/tmp/hadoop/resourcemanager/config.sh
HIVE_HOME=/usr/local/apache-hive-1.2.2-bin
HBASE_HOME=/usr/local/hbase-1.4.7
SCALA_HOME=/usr/local/scala-2.11.8
SPARK_HOME=/usr/local/spark-2.3.0-bin-hadoop2.7


# Default values of configuration (can be configure from Pod env)
ZOOKEEPER_PORT=${ZOOKEEPER_PORT:-2181}
HADOOP_NAMENODE_DFS_PORT=${HADOOP_NAMENODE_DFS_PORT:-9000}
HADOOP_NAMENODE_WEBHDFS_PORT=${HADOOP_NAMENODE_WEBHDFS_PORT:-50070}
HADOOP_JOURNALNODE_RPC_PORT=${HADOOP_JOURNALNODE_RPC_PORT:-8485}
MY_NAMESPACE=${MY_NAMESPACE:-'default'}

chmod 777 -R $CONFIG_DIR/*
#config hive
#zk-servers   $ZOOKEEPER_SERVER_SERVICE_HOST:$ZOOKEEPER_SERVER_SERVICE_PORT_CLIENT
#mkdir $HIVE_HOME/tmp
#cp $HIVE_HOME/conf/hive-default.xml.template $HIVE_HOME/conf/hive-site.xml
cp $HIVE_HOME/conf/hive-env.sh.template $HIVE_HOME/conf/hive-env.sh
cp $CONFIG_DIR/hive-site.xml  $HIVE_HOME/conf/hive-site.xml
sed -i 's!${system:java.io.tmpdir}!'$HIVE_HOME'/tmp!g' $HIVE_HOME/conf/hive-site.xml
sed -i 's/${system:user.name}/root/g' $HIVE_HOME/conf/hive-site.xml
sed -i 's/ZOOKEEPER_SERVERS/'$ZOOKEEPER_SERVER_SERVICE_HOST:$ZOOKEEPER_SERVER_SERVICE_PORT_CLIENT'/' $HIVE_HOME/conf/hive-site.xml
echo 'HADOOP_HOME='$HADOOP_PREFIX'' >> $HIVE_HOME/conf/hive-env.sh


#config hbase
mkdir $HBASE_HOME/logs
mkdir $HBASE_HOME/zookeeper
mkdir -p /var/hbase
touch $HBASE_HOME/conf/backup-masters

chmod 755 $CONFIG_DIR/hbase-regionservers-change.sh
$CONFIG_DIR/hbase-regionservers-change.sh & 
chmod 755 $CONFIG_DIR/hbase-backup-masters.sh
$CONFIG_DIR/hbase-backup-masters.sh &

cp $CONFIG_DIR/hbase-site.xml $HBASE_HOME/conf/hbase-site.xml
cp $CONFIG_DIR/hbase-env.sh $HBASE_HOME/conf/hbase-env.sh
echo "export JAVA_HOME=$JAVA_HOME" >> $HBASE_HOME/conf/hbase-env.sh 
echo "export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib" >> $HBASE_HOME/conf/hbase-env.sh 
echo "export HADOOP_CONF_DI=$HADOOP_HOME/etc/hadoop" >> $HBASE_HOME/conf/hbase-env.sh 
echo "export HBASE_CLASSPATH=$HADOOP_HOME/etc/hadoop" >> $HBASE_HOME/conf/hbase-env.sh 
sed -i 's!HBASE_HOME!'$HBASE_HOME'!' $HBASE_HOME/conf/hbase-site.xml
sed -i 's!ZOOKEEPER_SERVERS!'$ZOOKEEPER_SERVER_SERVICE_HOST:$ZOOKEEPER_SERVER_SERVICE_PORT_CLIENT'!' $HBASE_HOME/conf/hbase-site.xml
sed -i 's!HADOOP_MASTER!cluster2!' $HBASE_HOME/conf/hbase-site.xml


#config spark
sed -i 's/8080/8085/' $SPARK_HOME/sbin/start-master.sh
cp $CONFIG_DIR/spark-env.sh $SPARK_HOME/conf/spark-env.sh
chmod 777 $CONFIG_DIR/spark-slaves.sh
$CONFIG_DIR/spark-slaves.sh


if [ ! -f  $HDFS_CONFIG_FILE ]; then
  echo "ERROR: Could not find $HDFS_CONFIG_FILE"
  exit 1
fi

service ssh restart
# Get config from external
chmod 755 $HDFS_CONFIG_FILE
. $HDFS_CONFIG_FILE
if [ -f  $RM_CONFIG_FILE ]; then
  . $RM_CONFIG_FILE
fi
chmod 755 $HADOOP_PREFIX/etc/hadoop/*.sh
sed -i 's:${JAVA_HOME}:'$JAVA_HOME_DIR':' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
. $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

# Copy config files to hadoop
for f in core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml; do
  if [[ -e $CONFIG_DIR/$f ]]; then
    cp $CONFIG_DIR/$f $HADOOP_PREFIX/etc/hadoop/$f
  else
    echo "ERROR: Could not find $f in $CONFIG_DIR"
    exit 1
  fi
done

# All node configuration
sed -i 's/DEFAULT_FS_NAME/'$DEFAULT_FS_NAME'/' $HADOOP_PREFIX/etc/hadoop/core-site.xml
sed -i "s:HADOOP_TMP_DIR:${HADOOP_TMP_DIR}:" $HADOOP_PREFIX/etc/hadoop/core-site.xml
sed -i 's/ZOOKEEPER_SERVERS/'$ZOOKEEPER_ADDRESSES'/' $HADOOP_PREFIX/etc/hadoop/core-site.xml

sed -i 's/DEFAULT_FS_NAME/'$DEFAULT_FS_NAME'/g' $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
sed -i 's/NAMENODE_MASTER_HOST/'$NAMENODE_MASTER_HOST'/g' $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
sed -i 's/NAMENODE_MASTER_RPC_PORT/'$HADOOP_NAMENODE_DFS_PORT'/' $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
sed -i 's/NAMENODE_MASTER_HTTP_PORT/'$HADOOP_NAMENODE_WEBHDFS_PORT'/' $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
sed -i 's/NAMENODE_STANDBY_HOST/'$NAMENODE_STANDBY_HOST'/g' $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
sed -i 's/NAMENODE_STANDBY_RPC_PORT/'$HADOOP_NAMENODE_DFS_PORT'/' $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
sed -i 's/NAMENODE_STANDBY_HTTP_PORT/'$HADOOP_NAMENODE_WEBHDFS_PORT'/' $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
sed -i 's/JOURNALNODE_HOST_0/'$JOURNALNODE_HOST_0'/' $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
sed -i 's/JOURNALNODE_HOST_1/'$JOURNALNODE_HOST_1'/' $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
sed -i 's/JOURNALNODE_HOST_2/'$JOURNALNODE_HOST_2'/' $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
sed -i 's/JOURNALNODE_PORT/'$HADOOP_JOURNALNODE_RPC_PORT'/g' $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
sed -i "s:JOURNAL_DATA_DIR:${JOURNAL_DATA_DIR}:" $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml 

if [ -f $RM_CONFIG_FILE ]; then
  sed -i 's/RM_HA_ID/'$RM_HA_ID'/' $HADOOP_PREFIX/etc/hadoop/yarn-site.xml
  sed -i 's/RESOURCE_MANAGER_HOST_0/'$RESOURCE_MANAGER_HOST_0'/' $HADOOP_PREFIX/etc/hadoop/yarn-site.xml
  sed -i 's/RESOURCE_MANAGER_HOST_1/'$RESOURCE_MANAGER_HOST_1'/' $HADOOP_PREFIX/etc/hadoop/yarn-site.xml
  sed -i 's/ZOOKEEPER_SERVERS/'$ZOOKEEPER_ADDRESSES'/' $HADOOP_PREFIX/etc/hadoop/yarn-site.xml
  sed -i "s:ZK_STATE_STORE_PATH:${ZK_STATE_STORE_PATH}:" $HADOOP_PREFIX/etc/hadoop/yarn-site.xml
fi

if [[ "${HOSTNAME}" =~ "${NAMENODE_MASTER_HOSTNAME}" ]]; then
  
  # slaves是指定子节点的位置，因为要在master上启动HDFS，slaves文件指定的是datanode的位置
  chmod 755 $CONFIG_DIR/slaves-change.sh
  $CONFIG_DIR/slaves-change.sh hdfs &
	
  if [ "`ls -A $HADOOP_TMP_DIR`" = "" ]; then
    # $HADOOP_TMP_DIR is empty
    $HADOOP_PREFIX/bin/hdfs namenode -format -force -nonInteractive
    $HADOOP_PREFIX/bin/hdfs zkfc -formatZK -force -nonInteractive
    $HADOOP_PREFIX/sbin/start-dfs.sh
  else
    $HADOOP_PREFIX/sbin/hadoop-daemon.sh start namenode
    $HADOOP_PREFIX/sbin/hadoop-daemon.sh start zkfc
  fi
  #在namenode上启动hbase
   $HBASE_HOME/bin/start-hbase.sh &
  #在namenode上启动hiveserver2
   $HIVE_HOME/bin/hiveserver2 &
  #启动spark的master 和webUI
   $SPARK_HOME/sbin/start-all.sh
   
  if [[ $1 == "-d" ]]; then
    until find ${HADOOP_PREFIX}/logs -mmin -1 | egrep -q '.*'; echo "`date`: Waiting for logs..." ; do sleep 2 ; done
    tail -F ${HADOOP_PREFIX}/logs/* &
    while true; do sleep 1000; done
  fi

elif [[ "${HOSTNAME}" =~ "${NAMENODE_STANDBY_HOSTNAME}" ]]; then
  # slaves是指定子节点的位置，因为要在namenode上启动HDFS，slaves文件指定的是datanode的位置
  chmod 755 $CONFIG_DIR/slaves-change.sh &
  $CONFIG_DIR/slaves-change.sh hdfs &

  if [ "`ls -A $HADOOP_TMP_DIR`" = "" ]; then
    scp -r $NAMENODE_MASTER_HOST:$HADOOP_TMP_DIR $HADOOP_TMP_DIR/../
  fi

  $HADOOP_PREFIX/sbin/hadoop-daemon.sh start namenode
  $HADOOP_PREFIX/sbin/hadoop-daemon.sh start zkfc

   #启动hive
   $HIVE_HOME/bin/hiveserver2 &
   #开启spark高可用
   echo 'export SPARK_DAEMON_JAVA_OPTS="-Dspark.deploy.recoveryMode=ZOOKEEPER -Dspark.deploy.zookeeper.url='$ZOOKEEPER_ADDRESSES' -Dspark.deploy.zookeeper.dir=/spark"' >> $SPARK_HOME/conf/spark-env.sh
  if [[ $1 == "-d" ]]; then
    until find ${HADOOP_PREFIX}/logs -mmin -1 | egrep -q '.*'; echo "`date`: Waiting for logs..." ; do sleep 2 ; done
    tail -F ${HADOOP_PREFIX}/logs/* &
    while true; do sleep 1000; done
  fi

elif [[ "${HOSTNAME}" =~ "${RESOURCE_MANAGER_HOSTNAME}" ]]; then

  # slaves是指定子节点的位置，因为要在resourcemanager启动yarn，所以resourcemanager上的slaves文件指定的是nodemanager的位置
  chmod 755 $CONFIG_DIR/slaves-change.sh
  $CONFIG_DIR/slaves-change.sh resourcemanager &

  # $HADOOP_PREFIX/sbin/start-yarn.sh
  $HADOOP_PREFIX/sbin/yarn-daemon.sh start resourcemanager
  
  if [[ $1 == "-d" ]]; then
    until find ${HADOOP_PREFIX}/logs -mmin -1 | egrep -q '.*'; echo "`date`: Waiting for logs..." ; do sleep 2 ; done
    tail -F ${HADOOP_PREFIX}/logs/* &
    while true; do sleep 1000; done
  fi

elif [[ "${HOSTNAME}" =~ "${JOURNALNODE_HOSTNAME}" ]]; then
  $HADOOP_PREFIX/sbin/hadoop-daemon.sh start journalnode

  if [[ $1 == "-d" ]]; then
    until find ${HADOOP_PREFIX}/logs -mmin -1 | egrep -q '.*'; echo "`date`: Waiting for logs..." ; do sleep 2 ; done
    tail -F ${HADOOP_PREFIX}/logs/* &
    while true; do sleep 1000; done
  fi

else
  # Datanode
  $HADOOP_PREFIX/sbin/hadoop-daemon.sh start datanode
  $HADOOP_PREFIX/sbin/yarn-daemon.sh start nodemanager
  
  if [[ $1 == "-d" ]]; then
    until find ${HADOOP_PREFIX}/logs -mmin -1 | egrep -q '.*'; echo "`date`: Waiting for logs..." ; do sleep 2 ; done
    tail -F ${HADOOP_PREFIX}/logs/* &
    while true; do sleep 1000; done
  fi  
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi

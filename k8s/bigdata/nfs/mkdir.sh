#!/bin/bash
rm -rf ./datanodedata-0
rm -rf ./datanodedata-1
rm -rf ./datanodedata-2
rm -rf ./datanodedata-3
rm -rf ./datanodedata-4
rm -rf ./datanodedata-5
rm -rf ./datanodedata-6

rm -rf ./journalnodedata-0
rm -rf ./journalnodedata-1
rm -rf ./journalnodedata-2
rm -rf ./namenodedata-master
rm -rf ./namenodedata-standby
rm -rf ./zkdata/zk-0
rm -rf ./zkdata/zk-1
rm -rf ./zkdata/zk-2

mkdir -p ./datanodedata-0
mkdir -p ./datanodedata-1
mkdir -p ./datanodedata-2
mkdir -p ./datanodedata-3
mkdir -p ./datanodedata-4
mkdir -p ./datanodedata-5
mkdir -p ./datanodedata-6

mkdir -p ./journalnodedata-0
mkdir -p ./journalnodedata-1
mkdir -p ./journalnodedata-2
mkdir -p ./namenodedata-master
mkdir -p ./namenodedata-standby
mkdir -p ./zkdata/zk-0
mkdir -p ./zkdata/zk-1
mkdir -p ./zkdata/zk-2
chmod 777 -R ../hadoopdata-cluster2



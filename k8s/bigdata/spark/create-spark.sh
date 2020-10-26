#!/bin/bash
kubectl create -f ./configmap/spark-configmap.yaml
kubectl create -f ./nfs-pv-pvc/spark-master-pv-pvc.yaml 
kubectl create -f ./nfs-pv-pvc/spark-slave-pv-pvc-0.yaml
kubectl create -f ./nfs-pv-pvc/spark-slave-pv-pvc-1.yaml
kubectl create -f ./nfs-pv-pvc/spark-slave-pv-pvc-2.yaml
kubectl create -f ./spark-master/spark-master-headless.yaml   
kubectl create -f ./spark-master/spark-master-service.yaml  
kubectl create -f ./spark-slave/spark-slave-headless.yaml
kubectl create -f ./spark-master/spark-master-statefulSet.yaml
kubectl create -f ./spark-slave/spark-slave-statefulSet.yaml


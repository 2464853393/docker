#!/bin/bash
kubectl delete -f ./configmap/spark-configmap.yaml
kubectl delete -f ./nfs-pv-pvc/spark-master-pv-pvc.yaml 
kubectl delete -f ./nfs-pv-pvc/spark-slave-pv-pvc-0.yaml
kubectl delete -f ./nfs-pv-pvc/spark-slave-pv-pvc-1.yaml
kubectl delete -f ./nfs-pv-pvc/spark-slave-pv-pvc-2.yaml
kubectl delete -f ./spark-master/spark-master-headless.yaml   
kubectl delete -f ./spark-master/spark-master-service.yaml  
kubectl delete -f ./spark-slave/spark-slave-headless.yaml
kubectl delete -f ./spark-master/spark-master-statefulSet.yaml
kubectl delete -f ./spark-slave/spark-slave-statefulSet.yaml




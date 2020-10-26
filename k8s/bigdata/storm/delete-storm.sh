#!/bin/bash
kubectl delete -f storm-slave/storm-slave-statefulSet.yaml
kubectl delete -f storm-master/storm-master-statefulSet.yaml

kubectl delete -f nfs-pv-pvc/storm-master-pv-pvc.yaml  
kubectl delete -f nfs-pv-pvc/storm-slave-pv-pvc-0.yaml
kubectl delete -f nfs-pv-pvc/storm-slave-pv-pvc-1.yaml
kubectl delete -f nfs-pv-pvc/storm-slave-pv-pvc-2.yaml
kubectl delete -f storm-master/storm-master-service.yaml
kubectl delete -f storm-master/storm-master-headless.yaml
kubectl delete -f storm-slave/storm-slave-headless.yaml

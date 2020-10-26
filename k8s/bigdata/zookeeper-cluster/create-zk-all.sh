#/bin/bash
kubectl create -f zk-pv-pvc-0.yaml
kubectl create -f zk-pv-pvc-1.yaml
kubectl create -f zk-pv-pvc-2.yaml
kubectl create -f zk-service-headless.yaml
kubectl create -f zk-service-server.yaml
kubectl create -f zk-statefulset.yaml

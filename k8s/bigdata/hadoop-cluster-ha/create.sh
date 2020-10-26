#/bin/bash
#cluster2 delete All by -f

kubectl create -f ./nfs-pv-pvc/datanode-pv-pvc-0.yaml
kubectl create -f ./nfs-pv-pvc/datanode-pv-pvc-1.yaml
kubectl create -f ./nfs-pv-pvc/datanode-pv-pvc-2.yaml
kubectl create -f ./nfs-pv-pvc/journalnode-pv-pvc-0.yaml
kubectl create -f ./nfs-pv-pvc/journalnode-pv-pvc-1.yaml
kubectl create -f ./nfs-pv-pvc/journalnode-pv-pvc-2.yaml
kubectl create -f ./nfs-pv-pvc/namenode-master-pv-pvc.yaml
kubectl create -f ./nfs-pv-pvc/namenode-standby-pv-pvc.yaml
kubectl create -f ./namenode/cluster2-namenode-master-service.yaml
kubectl create -f ./namenode/cluster2-namenode-standby-service.yaml
kubectl create -f ./resourcemanager/cluster2-resourcemanager-master-service.yaml
kubectl create -f ./resourcemanager/cluster2-resourcemanager-standby-service.yaml
kubectl create -f ./configmap/cluster2-hdfs-configmap.yaml
kubectl create -f ./configmap/cluster2-rm-configmap.yaml
kubectl create -f ./resourcemanager/cluster2-resourcemanager-headless.yaml
kubectl create -f ./datanode/cluster2-datanode-headless.yaml
kubectl create -f ./journalnode/cluster2-journalnode-headless.yaml
kubectl create -f ./namenode/cluster2-namenode-headless.yaml
kubectl create -f ./resourcemanager/cluster2-resourcemanager-statefulSet.yaml
kubectl create -f ./namenode/cluster2-namenode-statefulSet.yaml
kubectl create -f ./datanode/cluster2-datanode-statefulSet.yaml
kubectl create -f ./journalnode/cluster2-journalnode-statefulSet.yaml

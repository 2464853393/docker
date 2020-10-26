#/bin/bash
#cluster2 delete All by -f

kubectl delete -f ./resourcemanager/cluster2-resourcemanager-statefulSet.yaml
kubectl delete -f ./namenode/cluster2-namenode-statefulSet.yaml
kubectl delete -f ./datanode/cluster2-datanode-statefulSet.yaml
kubectl delete -f ./journalnode/cluster2-journalnode-statefulSet.yaml

kubectl delete -f ./nfs-pv-pvc/datanode-pv-pvc-0.yaml
kubectl delete -f ./nfs-pv-pvc/datanode-pv-pvc-1.yaml
kubectl delete -f ./nfs-pv-pvc/datanode-pv-pvc-2.yaml
kubectl delete -f ./nfs-pv-pvc/journalnode-pv-pvc-0.yaml
kubectl delete -f ./nfs-pv-pvc/journalnode-pv-pvc-1.yaml
kubectl delete -f ./nfs-pv-pvc/journalnode-pv-pvc-2.yaml
kubectl delete -f ./nfs-pv-pvc/namenode-master-pv-pvc.yaml
kubectl delete -f ./nfs-pv-pvc/namenode-standby-pv-pvc.yaml

kubectl delete -f ./configmap/cluster2-hdfs-configmap.yaml
kubectl delete -f ./configmap/cluster2-rm-configmap.yaml

kubectl delete -f ./namenode/cluster2-namenode-master-service.yaml
kubectl delete -f ./namenode/cluster2-namenode-standby-service.yaml
kubectl delete -f ./resourcemanager/cluster2-resourcemanager-master-service.yaml
kubectl delete -f ./resourcemanager/cluster2-resourcemanager-standby-service.yaml

kubectl delete -f ./resourcemanager/cluster2-resourcemanager-headless.yaml
kubectl delete -f ./datanode/cluster2-datanode-headless.yaml
kubectl delete -f ./journalnode/cluster2-journalnode-headless.yaml
kubectl delete -f ./namenode/cluster2-namenode-headless.yaml


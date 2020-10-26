kubectl delete -f zk-statefulset.yaml
kubectl delete -f zk-service-headless.yaml
kubectl delete -f zk-service-server.yaml
kubectl delete -f zk-pv-pvc-0.yaml
kubectl delete -f zk-pv-pvc-1.yaml
kubectl delete -f zk-pv-pvc-2.yaml


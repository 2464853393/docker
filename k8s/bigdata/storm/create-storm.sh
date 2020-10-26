#!/bin/bash
kubectl create -f nfs-pv-pvc/storm-master-pv-pvc.yaml  
kubectl create -f nfs-pv-pvc/storm-slave-pv-pvc-0.yaml
kubectl create -f nfs-pv-pvc/storm-slave-pv-pvc-1.yaml
kubectl create -f nfs-pv-pvc/storm-slave-pv-pvc-2.yaml
kubectl create -f storm-master/storm-master-service.yaml
kubectl create -f storm-master/storm-master-headless.yaml

kubectl create -f storm-slave/storm-slave-headless.yaml
kubectl create -f storm-slave/storm-slave-statefulSet.yaml
kubectl create -f storm-master/storm-master-statefulSet.yaml
#.
#├── configmap                                 
#│   └── storm-configmap.yaml                  
#├── create-storm.sh                           
#├── delete-storm.sh                           
#├── dockerfile                                
#│   ├── Dockerfile                            
#│   ├── spark.dockerfile                      
#│   └── storm-config                          
#│       ├── bootstrap.sh                      
#│       ├── slaves-change.sh                  
#│       └── storm.yaml                        
#├── nfs-pv-pvc                                
#│   ├── storm-master-pv-pvc.yaml              
#│   ├── storm-slave-pv-pvc-0.yaml
#│   ├── storm-slave-pv-pvc-1.yaml
#│   └── storm-slave-pv-pvc-2.yaml
#├── storm-master
#│   ├── sotrm-master-service.yaml
#│   ├── storm-master-headless.yaml
#│   └── storm-master-statefulSet.yaml
#└── storm-slave
#    ├── storm-slave-headless.yaml
#    └── storm-slave-statefulSet.yaml
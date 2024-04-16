[TOC]

# Google Kubernetes Engine (GKE)

**Create deployment**

```
$ kubectl create deployment hello-world-rest-api --image=in28min/hello-world-rest-api:0.0.1.RELEASE
```

**Expose deployment**

```
$ kubectl expose deployment hello-world-rest-api --type=LoadBalancer --port=8080
```

**Scale deployment**

```
$ kubectl scale deployment hello-world-rest-api --replicas=3
```

**Update image deployment**

```
$ kubectl set image deployment hello-world-rest-api hello-world-rest-api=in28min/hello-world-rest-api:0.0.2.RELEASE
```

**View component status**

```
kubectl get componentstatuses
Warning: v1 ComponentStatus is deprecated in v1.19+
NAME                 STATUS    MESSAGE   ERROR
controller-manager   Healthy   ok
scheduler            Healthy   ok
etcd-0               Healthy
etcd-1               Healthy
```

**View rollout history**

```
$ kubectl rollout history deployment hello-world-rest-api
deployment.apps/hello-world-rest-api
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
```

**Update image deployment**

```
$ kubectl set image deployment hello-world-rest-api hello-world-rest-api=in28min/hello-world-rest-api:0.0.3.RELEASE --record=true
```

```
kubectl rollout history deployment hello-world-rest-api
deployment.apps/hello-world-rest-api
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
3         kubectl set image deployment hello-world-rest-api hello-world-rest-api=in28min/hello-world-rest-api:0.0.3.RELEASE --record=true
```

```
curl http://34.42.154.237:8080/hello-world
Hello World  V3 zz4k2%
```

**Undo a previous rollout (rollback)**

```
$ kubectl rollout undo deployment hello-world-rest-api  --to-revision=1
deployment.apps/hello-world-rest-api rolled back
```

```
$ kubectl rollout history deployment hello-world-rest-api
deployment.apps/hello-world-rest-api
REVISION  CHANGE-CAUSE
2         <none>
3         kubectl set image deployment hello-world-rest-api hello-world-rest-api=in28min/hello-world-rest-api:0.0.3.RELEASE --record=true
4         <none>
```

```
$ curl http://34.42.154.237:8080/hello-world
Hello World  V1 zz4k2%
```

 **Print the logs for a container in a pod**

```
$ kubectl logs -f hello-world-rest-api-5b78b5c566-zz4k2
```

**Delete all with selector**

```
$ kubectl get all -o wide
NAME                                        READY   STATUS    RESTARTS   AGE   IP           NODE                                       NOMINATED NODE   READINESS GATES
pod/hello-world-rest-api-5b78b5c566-lsz7d   1/1     Running   0          77m   10.36.1.17   gke-cluster-1-default-pool-c1e05bf6-1b3l   <none>           <none>
pod/hello-world-rest-api-5b78b5c566-zz4k2   1/1     Running   0          77m   10.36.0.10   gke-cluster-1-default-pool-c1e05bf6-vs10   <none>           <none>

NAME                           TYPE           CLUSTER-IP    EXTERNAL-IP     PORT(S)          AGE    SELECTOR
service/hello-world-rest-api   LoadBalancer   10.70.68.23   34.42.154.237   8080:31069/TCP   168m   app=hello-world-rest-api
service/kubernetes             ClusterIP      10.70.64.1    <none>          443/TCP          3h8m   <none>

NAME                                   READY   UP-TO-DATE   AVAILABLE   AGE    CONTAINERS             IMAGES                                       SELECTOR
deployment.apps/hello-world-rest-api   2/2     2            2           171m   hello-world-rest-api   in28min/hello-world-rest-api:0.0.1.RELEASE   app=hello-world-rest-api

NAME                                              DESIRED   CURRENT   READY   AGE    CONTAINERS             IMAGES                                       SELECTOR
replicaset.apps/hello-world-rest-api-5b78b5c566   2         2         2       171m   hello-world-rest-api   in28min/hello-world-rest-api:0.0.1.RELEASE   app=hello-world-rest-api,pod-template-hash=5b78b5c566
replicaset.apps/hello-world-rest-api-7dc5897557   0         0         0       150m   hello-world-rest-api   in28min/hello-world-rest-api:0.0.2.RELEASE   app=hello-world-rest-api,pod-template-hash=7dc5897557
replicaset.apps/hello-world-rest-api-89577dcb8    0         0         0       87m    hello-world-rest-api   in28min/hello-world-rest-api:0.0.3.RELEASE   app=hello-world-rest-api,pod-template-hash=89577dcb8
```

```
$ kubectl delete all -l app=hello-world-rest-api
pod "hello-world-rest-api-5b78b5c566-lsz7d" deleted
pod "hello-world-rest-api-5b78b5c566-zz4k2" deleted
service "hello-world-rest-api" deleted
deployment.apps "hello-world-rest-api" deleted
```

deployment.yaml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: hello-world-rest-api
  name: hello-world-rest-api
  namespace: default
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hello-world-rest-api
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: hello-world-rest-api
    spec:
      containers:
      - image: in28min/hello-world-rest-api:0.0.1.RELEASE
        imagePullPolicy: IfNotPresent
        name: hello-world-rest-api
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app: hello-world-rest-api
  name: hello-world-rest-api
  namespace: default
spec:
  ports:
  - nodePort: 31069
    port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    app: hello-world-rest-api
  sessionAffinity: None
  type: LoadBalancer
```

**Apply a configuration to a resource by file name**

```
kubectl apply -f deployment.yaml
```

**Quick fix to reduce release downtime with minReadySeconds**

deployment.yaml 

```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: hello-world-rest-api
  name: hello-world-rest-api
  namespace: default
spec:
  replicas: 3
  minReadySeconds: 45
  selector:
    matchLabels:
      app: hello-world-rest-api
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: hello-world-rest-api
    spec:
      containers:
      - image: in28min/hello-world-rest-api:0.0.2.RELEASE
        imagePullPolicy: IfNotPresent
        name: hello-world-rest-api
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app: hello-world-rest-api
  name: hello-world-rest-api
  namespace: default
spec:
  ports:
  - nodePort: 31069
    port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    app: hello-world-rest-api
  sessionAffinity: None
  type: LoadBalancer
```

## Configure multiple kubernetes deployments wit one service

deployment.yaml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: hello-world-rest-api
    version: v1
  name: hello-world-rest-api-v1
  namespace: default
spec:
  replicas: 2
  minReadySeconds: 45
  selector:
    matchLabels:
      app: hello-world-rest-api
      version: v1
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: hello-world-rest-api
        version: v1
    spec:
      containers:
      - image: in28min/hello-world-rest-api:0.0.1.RELEASE
        imagePullPolicy: IfNotPresent
        name: hello-world-rest-api
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: hello-world-rest-api
    version: v2
  name: hello-world-rest-api-v2
  namespace: default
spec:
  replicas: 2
  minReadySeconds: 45
  selector:
    matchLabels:
      app: hello-world-rest-api
      version: v2
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: hello-world-rest-api
        version: v2
    spec:
      containers:
      - image: in28min/hello-world-rest-api:0.0.2.RELEASE
        imagePullPolicy: IfNotPresent
        name: hello-world-rest-api
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
---
apiVersion: v1
kind: Service 
metadata:
  labels:
    app: hello-world-rest-api
  name: hello-world-rest-api
  namespace: default
spec:
  ports:
  - nodePort: 31069
    port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    app: hello-world-rest-api
  sessionAffinity: None
  type: LoadBalancer

```

```
kubectl get all
NAME                                           READY   STATUS    RESTARTS   AGE
pod/hello-world-rest-api-v1-867f8bd649-69ptw   1/1     Running   0          32m
pod/hello-world-rest-api-v1-867f8bd649-x8nm9   1/1     Running   0          32m
pod/hello-world-rest-api-v2-5f4bdc6757-bf8vq   1/1     Running   0          32m
pod/hello-world-rest-api-v2-5f4bdc6757-xr4gg   1/1     Running   0          32m

NAME                           TYPE           CLUSTER-IP    EXTERNAL-IP     PORT(S)          AGE
service/hello-world-rest-api   LoadBalancer   10.70.76.13   34.136.96.135   8080:31069/TCP   49m
service/kubernetes             ClusterIP      10.70.64.1    <none>          443/TCP          7h53m

NAME                                      READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/hello-world-rest-api-v1   2/2     2            2           32m
deployment.apps/hello-world-rest-api-v2   2/2     2            2           32m

NAME                                                 DESIRED   CURRENT   READY   AGE
replicaset.apps/hello-world-rest-api-v1-867f8bd649   2         2         2       32m
replicaset.apps/hello-world-rest-api-v2-5f4bdc6757   2         2         2       32m
```



## Kubernetes commands top node and pod

**Show services | all namespace | sort by namespace**

```
$ kubectl get service --all-namespaces --sort-by=.metadata.namespace
NAMESPACE     NAME                   TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)            AGE
default       hello-world-rest-api   LoadBalancer   10.70.76.13    34.136.96.135   8080:31069/TCP     60m
default       kubernetes             ClusterIP      10.70.64.1     <none>          443/TCP            8h
gmp-system    alertmanager           ClusterIP      None           <none>          9093/TCP           8h
gmp-system    gmp-operator           ClusterIP      10.70.72.199   <none>          8443/TCP,443/TCP   8h
kube-system   default-http-backend   NodePort       10.70.68.235   <none>          80:32027/TCP       8h
kube-system   kube-dns               ClusterIP      10.70.64.10    <none>          53/UDP,53/TCP      8h
kube-system   metrics-server         ClusterIP      10.70.76.211   <none>          443/TCP
```

**Print the address of the control plane and cluster services**

```
$ kubectl cluster-info
Kubernetes control plane is running at https://34.28.54.91
GLBCDefaultBackend is running at https://34.28.54.91/api/v1/namespaces/kube-system/services/default-http-backend:http/proxy
KubeDNS is running at https://34.28.54.91/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://34.28.54.91/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

**Display resource (CPU/memory) usage of nodes**

```
$ kubectl top node
NAME                                       CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%
gke-cluster-1-default-pool-c1e05bf6-1b3l   79m          8%     1142Mi          40%
gke-cluster-1-default-pool-c1e05bf6-1t8k   84m          8%     1571Mi          55%
gke-cluster-1-default-pool-c1e05bf6-vs10   60m          6%     1543Mi          54%
```

**Display resource (CPU/memory) usage of pods**

```
$ kubectl top pods
NAME                                       CPU(cores)   MEMORY(bytes)
hello-world-rest-api-v1-867f8bd649-69ptw   2m           232Mi
hello-world-rest-api-v1-867f8bd649-x8nm9   2m           234Mi
hello-world-rest-api-v2-5f4bdc6757-bf8vq   2m           229Mi
hello-world-rest-api-v2-5f4bdc6757-xr4gg   2m           237Mi
```

**Delete hello world deployments**

```
$ kubectl delete all -l app=hello-world-rest-api
pod "hello-world-rest-api-v1-867f8bd649-69ptw" deleted
pod "hello-world-rest-api-v1-867f8bd649-x8nm9" deleted
pod "hello-world-rest-api-v2-5f4bdc6757-bf8vq" deleted
pod "hello-world-rest-api-v2-5f4bdc6757-xr4gg" deleted
service "hello-world-rest-api" deleted
deployment.apps "hello-world-rest-api-v1" deleted
deployment.apps "hello-world-rest-api-v2" deleted
```



# **Infrastructure as a Code (IAAS)**

- is the managing and provisioning of infrastructure through code instead of through manual processes.

![image-20240416120515159](images/image-20240416120515159-3240320-3240322.png)

**Provisioning Server Tools**

- AWS CloudFormation
- Terraform

**Configuration Management Tools**

- Ansible
- Chef
- Puppet

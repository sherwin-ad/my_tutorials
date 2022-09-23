# Mock Exam 2 Solution


  1. Take a backup of the etcd cluster and save it to `/opt/etcd-backup.db`.

     - Backup Completed

     Run the below command for solution:


     1. Search etcdctl backup in kubernetes documentation.
     2. etcdctl snapshot save command help


     ```
     ETCDCTL_API=3 etcdctl snapshot save -h
     ```

     3. Get the endpoint

     ```
     cat /etc/kubernetes/manifests/etcd.yaml | grep listen-client
         - --listen-client-urls=https://127.0.0.1:2379,https://10.56.60.3:2379
     ```

     4. Get the certificate file 

     ```
     cat /etc/kubernetes/manifests/etcd.yaml | grep file
     ```

     ```
     ETCDCTL_API=3 etcdctl snapshot save /opt/etcd-backup.db --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --endpoints=127.0.0.1:2379 
     ```

     5. Verify the snapshot:

     ```
     root@controlplane ~ ➜  ETCDCTL_API=3 etcdctl --write-out=table snapshot status /opt/etcd-backup.db
     +----------+----------+------------+------------+
     |   HASH   | REVISION | TOTAL KEYS | TOTAL SIZE |
     +----------+----------+------------+------------+
     | 5a06f92b |     3487 |        989 |     2.6 MB |
     +----------+----------+------------+------------+
     ```

     

  2. Create a Pod called `redis-storage` with image: `redis:alpine` with a Volume of type `emptyDir` that lasts for the life of the Pod.

     Specs on the below.

     - Pod named 'redis-storage' created
     - Pod 'redis-storage' uses Volume type of emptyDir
     - Pod 'redis-storage' uses volumeMount with mountPath = /data/redis

     Run the below command for solution:

     1. Create redis-storage.yaml


     ```
     k run redis-storage --image=redis:alpine --dry-run=client -o yaml > redis-storage.yaml
     ```

     2. Search for  volumes > emptydir
     3. Edit redis-storage.yaml add the volumes and volumeMount

     ```
     apiVersion: v1
     kind: Pod
     metadata:
       creationTimestamp: null
       labels:
         run: redis-storage
       name: redis-storage
     spec:
       containers:
       - image: redis:alpine
         name: redis-storage
         volumeMounts:
         - mountPath: /data/redis
           name: redis-storage
         resources: {}
       dnsPolicy: ClusterFirst
       volumes:
       - name: redis-storage
         emptyDir: {}
       restartPolicy: Always
     status: {}
     ```

     4. Create pod

     ```
     root@controlplane ~ ➜ k create -f redis-storage.yaml 
     pod/redis-storage created
     
     root@controlplane ~ ➜  k get pods
     NAME                    READY   STATUS    RESTARTS   AGE
     busybox                 1/1     Running   0          12m
     nginx-critical-node01   1/1     Running   0          4m22s
     nginx-resolver          1/1     Running   0          14m
     redis-storage           1/1     Running   0          7s
     
     root@controlplane ~ ➜  k describe pod redis-storage 
     Name:         redis-storage
     Namespace:    default
     Priority:     0
     Node:         node01/10.113.227.3
     Start Time:   Fri, 23 Sep 2022 00:45:34 +0000
     Labels:       run=redis-storage
     Annotations:  <none>
     Status:       Running
     IP:           10.50.192.4
     IPs:
       IP:  10.50.192.4
     Containers:
       redis-storage:
         Container ID:   docker://f1de0c3c18ea08464ceca27386cd986031c7cb1eec1c6bd6ce518eeb7e8157ff
         Image:          redis:alpine
         Image ID:       docker-pullable://redis@sha256:ce8c9df5ce70d6297ad361de9d0f8565cdd8f6679bd082f12c7db656153cc4bd
         Port:           <none>
         Host Port:      <none>
         State:          Running
           Started:      Fri, 23 Sep 2022 00:45:38 +0000
         Ready:          True
         Restart Count:  0
         Environment:    <none>
         Mounts:
           /data/redis from redis-storage (rw)
           /var/run/secrets/kubernetes.io/serviceaccount from default-token-ls8lq (ro)
     Conditions:
       Type              Status
       Initialized       True 
       Ready             True 
       ContainersReady   True 
       PodScheduled      True 
     Volumes:
       redis-storage:
         Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
         Medium:     
         SizeLimit:  <unset>
       default-token-ls8lq:
         Type:        Secret (a volume populated by a Secret)
         SecretName:  default-token-ls8lq
         Optional:    false
     QoS Class:       BestEffort
     Node-Selectors:  <none>
     Tolerations:     node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                      node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
     Events:
       Type    Reason     Age   From               Message
       ----    ------     ----  ----               -------
       Normal  Scheduled  26s   default-scheduler  Successfully assigned default/redis-storage to node01
       Normal  Pulling    25s   kubelet            Pulling image "redis:alpine"
       Normal  Pulled     23s   kubelet            Successfully pulled image "redis:alpine" in 2.610077136s
       Normal  Created    23s   kubelet            Created container redis-storage
       Normal  Started    22s   kubelet            Started container redis-storage
     ```

     

  3. Create a new pod called `super-user-pod` with image `busybox:1.28`. Allow the pod to be able to set `system_time`.

     The container should sleep for 4800 seconds.
     
     - Pod: super-user-pod
     - Container Image: busybox:1.28
     - SYS_TIME capabilities for the conatiner?
     
     Run the below command for solution:
     
     1. Create super-user-pod.yaml
     
     
     ```
     k run  super-user-pod --image=busybox:1.28 --dry-run=client -o yaml --command -- sleep 4800 > super-user-pod.yaml
     ```
     
     2. Search for   >  security context capabilities
     3. Edit super-user-pod.yaml add the securityContext > capabilities
     
     ```
     apiVersion: v1
     kind: Pod
     metadata:
       creationTimestamp: null
       labels:
         run: super-user-pod
       name: super-user-pod
     spec:
       containers:
       - command:
         - sleep
         - "4800"
         image: busybox:1.28
         name: super-user-pod
         securityContext:
           capabilities:
             add: ["SYS_TIME"]
         resources: {}
       dnsPolicy: ClusterFirst
       restartPolicy: Always
     status: {}
     ```
     
     4. Create pod
     
     ```
     kubectl create -f super-user-pod.yaml 
     pod/super-user-pod created
     
     k get pods
     NAME                    READY   STATUS    RESTARTS   AGE
     busybox                 1/1     Running   0          37m
     nginx-critical-node01   1/1     Running   0          21m
     nginx-resolver          1/1     Running   0          38m
     redis-storage           1/1     Running   0          5m53s
     super-user-pod          1/1     Running   0          2m13s
     ```
     
     

  4. A pod definition file is created at `/root/CKA/use-pv.yaml`. Make use of this manifest file and mount the persistent volume called `pv-1`. Ensure the pod is running and the PV is bound.

     mountPath: `/data`
     persistentVolumeClaim Name: `my-pvc`

     - persistentVolume Claim configured correctly
     - pod using the correct mountPath
     - pod using the persistent volume claim?

     Run the below command for solution:


     1. Show Persistent volume

     ```
     k get pv
     NAME   CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
     pv-1   10Mi       RWO            Retain           Available    
     ```

     2. Create Persistent volume claim  (Search pvc or persistent volume claim )

     ```
      apiVersion: v1
      kind: PersistentVolumeClaim
      metadata:
        name: my-pvc
      spec:
        accessModes:
          - ReadWriteOnce
        resources:
          requests:
            storage: 10Mi     
     ```

     ```
     k create -f pvc.yaml 
     persistentvolumeclaim/my-pvc created
     ```

     3.  edit use-pv.yaml

     ```
      apiVersion: v1
      kind: Pod
      metadata:
        creationTimestamp: null
        labels:
          run: use-pv
        name: use-pv
      spec:
        containers:
        - image: nginx
          name: use-pv
          volumeMounts:
          - mountPath: "/data"
            name: mypod
        volumes:
        - name: mypod
          persistentVolumeClaim:
            claimName: my-pvc
     ```

     4. Create pod

     ```
     k create -f /root/CKA/use-pv.yaml 
     pod/use-pv created
     ```

     

  5. Create a new deployment called `nginx-deploy`, with image `nginx:1.16` and `1` replica. Next upgrade the deployment to version `1.17` using rolling update.

     - Deployment : nginx-deploy. Image: nginx:1.16
     - Image: nginx:1.16
     - Task: Upgrade the version of the deployment to 1:17
     - Task: Record the changes for the image upgrade

     Run the below command for solution:

     1. Create deployment

     ```
     k create deployment nginx-deploy --image=nginx:1.16 --replicas=1 
     deployment.apps/nginx-deploy created
     
     k get deployments.apps 
     NAME           READY   UP-TO-DATE   AVAILABLE   AGE
     nginx-deploy   1/1     1            1           10s
     
     kubectl set image deployment/nginx-deploy nginx=nginx:1.17 --record
     deployment.apps/nginx-deploy image updated
     
     k rollout history deployment nginx-deploy 
     deployment.apps/nginx-deploy 
     REVISION  CHANGE-CAUSE
     1         <none>
     2         kubectl set image deployment/nginx-deploy nginx=nginx:1.17 --record=true
     
     k describe deployment nginx-deploy 
     Name:                   nginx-deploy
     Namespace:              default
     CreationTimestamp:      Thu, 22 Sep 2022 22:55:29 +0000
     Labels:                 app=nginx-deploy
     Annotations:            deployment.kubernetes.io/revision: 2
                             kubernetes.io/change-cause: kubectl set image deployment/nginx-deploy nginx=nginx:1.17 --record=true
     Selector:               app=nginx-deploy
     Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
     StrategyType:           RollingUpdate
     MinReadySeconds:        0
     RollingUpdateStrategy:  25% max unavailable, 25% max surge
     Pod Template:
       Labels:  app=nginx-deploy
       Containers:
        nginx:
         Image:        nginx:1.17
         Port:         <none>
         Host Port:    <none>
         Environment:  <none>
         Mounts:       <none>
       Volumes:        <none>
     Conditions:
       Type           Status  Reason
       ----           ------  ------
       Available      True    MinimumReplicasAvailable
       Progressing    True    NewReplicaSetAvailable
     OldReplicaSets:  <none>
     NewReplicaSet:   nginx-deploy-7c8d8c76bf (1/1 replicas created)
     Events:
       Type    Reason             Age    From                   Message
       ----    ------             ----   ----                   -------
       Normal  ScalingReplicaSet  3m14s  deployment-controller  Scaled up replica set nginx-deploy-6c858c4486 to 1
       Normal  ScalingReplicaSet  111s   deployment-controller  Scaled up replica set nginx-deploy-7c8d8c76bf to 1
       Normal  ScalingReplicaSet  102s   deployment-controller  Scaled down replica set nginx-deploy-6c858c4486 to 0
     ```

     


     For Kubernetes Version <=1.17
    
     ```
     kubectl run nginx-deploy --image=nginx:1.16 --replicas=1 --record
     kubectl rollout history deployment nginx-deploy
     kubectl set image deployment/nginx-deploy nginx=nginx:1.17 --record
     kubectl rollout history deployment nginx-deploy
     ```
    
     For Kubernetes Version >1.17
    
     ```
     kubectl create deployment nginx-deploy --image=nginx:1.16 --dry-run=client -o yaml > deploy.yaml
      
     apiVersion: apps/v1
     kind: Deployment
     metadata:
       name: nginx-deploy
     spec:
       replicas: 1
       selector:
         matchLabels:
           app: nginx-deploy
       strategy: {}
       template:
         metadata:
           creationTimestamp: null
           labels:
             app: nginx-deploy
         spec:
           containers:
           - image: nginx:1.16
             name: nginx
     ```
    
     ```
     kubectl create -f deploy.yaml --record
     kubectl rollout history deployment nginx-deploy
     kubectl set image deployment/nginx-deploy nginx=nginx:1.17 --record
     kubectl rollout history deployment nginx-deploy
     ```


  6. Create a new user called `john`. Grant him access to the cluster. John should have permission to `create, list, get, update and delete pods` in the `development` namespace . The private key exists in the location: `/root/CKA/john.key` and csr at `/root/CKA/john.csr`.

     `Important Note`: As of kubernetes 1.19, the CertificateSigningRequest object expects a `signerName`.

     Please refer the documentation to see an example. The documentation tab is available at the top right of terminal.

     - CSR: `john-developer`; Status: Approved
     - Role Name: `developer`; namespace: `development`; Resource: `Pods`
     - Access: User 'john' has appropriate permissions

     Run the below command for solution:
     
       1. Search create certificate signing request
       2. Create certificate signing request for john  John-csr.yaml
       3. cat john.csr | base64 | tr -d "\n"
     
     ```
     apiVersion: certificates.k8s.io/v1
     kind: CertificateSigningRequest
     metadata:
       name: john-developer
     spec:
       request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1ZEQ0NBVHdDQVFBd0R6RU5NQXNHQTFVRUF3d0VhbTlvYmpDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRApnZ0VQQURDQ0FRb0NnZ0VCQU9mczBMN2M1d3E3eGlYQzJIbzFrZGpNa2xBWkw2WXhkazB5QjFJbTUxSWp5a3Z6ClROaXdDWnhvQUpteUtBVG1EcHM1SVdCZ1h3MmRSRHlya05CZ3h0OEpPeEtxTDBwbW5ObWFtSjhlMVozbUtadUoKb2lxMWNsOVZISkZ0bzk2dGRFRzMxWVlaUlFISVRnU1Z2TTNlVStDd2JaQlEwek90OG5GdldGYXhQT014SWpnRApTOVpwVTZaWHdEMDZHMGJtZnNFMzNFVGJ0T0hSOS9ud2NXZkNuR3U3bmJSUTlOSUpuY3hwaGIxRW5zR1FQQjRFCkpzaW9NMEh2NFJtbjNjVERPTXNmRXBNKzFVSlNuaUZxcTJPcUpEektLc2J1UTNsczQwUy9CV3E2NG5ZNzN5NHAKcWtEa3ZBdWNvMHN1NDhRUUQyUWxvVm1GTmhxZEVxRHl3b0dycGZrQ0F3RUFBYUFBTUEwR0NTcUdTSWIzRFFFQgpDd1VBQTRJQkFRQXYrMnZTbDFEV3pSemU1dGZYN25aL08zd2JoMzdocW5ZR0FKTzgzeDVIdFlCaGhNR3V4SDlBCi9IOFNTV2xDeWVYRkg3dGU3WkE1Y2ZVam5OMyt3cjJRNFB5M0hmZXNQWnRZR0VINXdLZlVVUG1mdmhiM0IzbXkKdjJhbVhQZ1dSMzVMbGgwSk9xOGc5ZWtGbER6elpuN0RmUkEwMWxzcExTOHZKTDF2cld2d29ncnVPZ1NFQTJBdQpYV3MvTENsd1F1Vi9nUUpHeHRnWXhnMkhMZ01QaTNvUEpoL1IzTlEybnNLaklLdWZyd0xVVSszVXZqV2YvZGZqCk40aU4reXdrT21lSlYzTjBmdTE1M2xRb3VRbGRHdGxkSlFUTzRMQXFVbU56QjJwbHVOUlJwajlPSjkwUUorUGkKdnc1TXh2VTJ0Ynd5aWtuZFFxQk9KVlBuSUJVNUs4SjMKLS0tLS1FTkQgQ0VSVElGSUNBVEUgUkVRVUVTVC0tLS0tCg==
       signerName: kubernetes.io/kube-apiserver-client
       usages:
       - client auth
     ```
     
     4. Approve CSR 
     
     ```
     k create -f john-csr.yaml 
     certificatesigningrequest.certificates.k8s.io/john-developer created
     
     k get csr
     NAME             AGE     SIGNERNAME                                    REQUESTOR                  CONDITION
      csr-4bxsl        44m     kubernetes.io/kube-apiserver-client-kubelet   system:node:controlplane   Approved,Issued
      csr-56qwz        44m     kubernetes.io/kube-apiserver-client-kubelet   system:bootstrap:eh2ums    Approved,Issued
      john-developer   3m22s   kubernetes.io/kube-apiserver-client           kubernetes-admin           Approved,Issued
     ```
     
     5. Create role
     
     ```
     k create role -h
       
     k create role developer --resource=pods --verb=create,list,get,update,delete --namespace=development
     role.rbac.authorization.k8s.io/developer created
     
     k get role -n development 
     NAME        CREATED AT
     developer   2022-09-23T00:27:02Z
       
     k describe -n development role developer 
     Name:         developer
     Labels:       <none>
     Annotations:  <none>
     PolicyRule:
       Resources  Non-Resource URLs  Resource Names  Verbs
       ---------  -----------------  --------------  -----
       pods       []                 []              [create list get update delete]
       
     k auth can-i -h
       
     kubectl auth can-i get pods --namespace=development --as john
     no
     ```
     
     6. Create role bindings
     
     ```
     k create rolebinding -h
       
     kubectl create rolebinding developer-role-binding --role=developer --user=john --namespace=development
     rolebinding.rbac.authorization.k8s.io/developer-role-binding created
       
     k get rolebinding -n development 
     NAME                     ROLE             AGE
     developer-role-binding   Role/developer   35s
       
     k auth can-i get pods --namespace=development --as john
     yes
     
     k auth can-i watch pods --namespace=development --as john
     no
     ```
     
      

  7. Create a nginx pod called `nginx-resolver` using image `nginx`, expose it internally with a service called `nginx-resolver-service`.

     Test that you are able to look up the service and pod names from within the cluster. Use the image `busybox:1.28` to create a pod for dns lookup. Record results in `/root/CKA/nginx.svc` and `/root/CKA/nginx.pod` for service and pod name resolutions respectively
     
     - Pod: nginx-resolver created
     - Service DNS Resolution recorded correctly
     - Pod DNS resolution recorded correctly
     
     Run the below command for solution:
     
     1. Create pod
     
     ```
     k run nginx-resolver --image=nginx
     pod/nginx-resolver created
     
     k get pods
     NAME             READY   STATUS    RESTARTS   AGE
     nginx-resolver   1/1     Running   0          16s
     ```
     
     2. Create service
     
     ```
     root@controlplane ~ ➜  k expose pod nginx-resolver --name=nginx-resolver-service --port=80
     service/nginx-resolver-service exposed
     
     root@controlplane ~ ➜  k get service
     NAME                     TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
     kubernetes               ClusterIP   10.96.0.1       <none>        443/TCP   8m16s
     nginx-resolver-service   ClusterIP   10.109.22.187   <none>        80/TCP    16s
     
     root@controlplane ~ ➜  k describe service nginx-resolver-service 
     Name:              nginx-resolver-service
     Namespace:         default
     Labels:            run=nginx-resolver
     Annotations:       <none>
     Selector:          run=nginx-resolver
     Type:              ClusterIP
     IP Families:       <none>
     IP:                10.109.22.187
     IPs:               10.109.22.187
     Port:              <unset>  80/TCP
     TargetPort:        80/TCP
     Endpoints:         10.50.192.1:80
     Session Affinity:  None
     Events:            <none>
     ```
     
     3. Create busybox pod
     
     ```
     root@controlplane ~ ➜ k run busybox --image=busybox:1.28 -- sleep 4000
     pod/busybox created
     
     root@controlplane ~ ➜ k get pods
     NAME             READY   STATUS    RESTARTS   AGE
     busybox          1/1     Running   0          5s
     nginx-resolver   1/1     Running   0          8m43s
     ```
     
     Nslookup result for service
     
     ```
     root@controlplane ~ ➜  k exec busybox -- nslookup nginx-resolver-service
     Server:    10.96.0.10
     Address 1: 10.96.0.10 kube-dns.kube-system.svc.cluster.local
     
     Name:      nginx-resolver-service
     Address 1: 10.109.22.187 nginx-resolver-service.default.svc.cluster.local
     
     root@controlplane ~ ➜  k exec busybox -- nslookup nginx-resolver-service > /root/CKA/nginx.svc
     ```
     
     Nslookup for pod
     
     - Search for DNS in Kubernetes Documentation
     
     ```
     root@controlplane ~ ✖ k get pods -o wide
     NAME             READY   STATUS    RESTARTS   AGE     IP            NODE     NOMINATED NODE   READINESS GATES
     busybox          1/1     Running   0          3m28s   10.50.192.2   node01   <none>           <none>
     nginx-resolver   1/1     Running   0          4m30s   10.50.192.1   node01   <none>           <none>
     
     root@controlplane ~ ➜  k exec busybox -- nslookup 10-50-192-1.default.pod.cluster.local
     Server:    10.96.0.10
     Address 1: 10.96.0.10 kube-dns.kube-system.svc.cluster.local
     
     Name:      10-50-192-1.default.pod.cluster.local
     Address 1: 10.50.192.1 10-50-192-1.nginx-resolver-service.default.svc.cluster.local
     
     root@controlplane ~ ➜  k exec busybox -- nslookup 10-50-192-1.default.pod.cluster.local > /root/CKA/nginx.pod
     ```
     
     
     
8. Create a static pod on `node01` called `nginx-critical` with image `nginx` and make sure that it is recreated/restarted automatically in case of a failure.

   Use `/etc/kubernetes/manifests` as the Static Pod path for example.

   - static pod configured under /etc/kubernetes/manifests ?
   - Pod nginx-critical-node01 is up and running

   Run the below command for solution:




```
kubectl run nginx-critical --image=nginx --restart=Always --dry-run=client -o yaml > nginx-critical.yaml

cat static.yaml - Copy the contents of this file.
 
kubectl get nodes -o wide
ssh node01 
OR
ssh <IP of node01>
 
Check if static-pod directory is present which is /etc/kubernetes/manifests if not then create it.
mkdir -p /etc/kubernetes/manifests
 
Paste the contents of the file(static.yaml) copied in the first step to file nginx-critical.yaml.
 
Move/copy the nginx-critical.yaml to path /etc/kubernetes/manifests/
 
cp nginx-critical.yaml /etc/kubernetes/manifests
 
Go back to master node
 
kubectl get pods 
```

</details>

  


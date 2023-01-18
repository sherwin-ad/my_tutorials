# CKA Lab



# CORE CONCEPTS

## PRACTICE TEST – PODS

1. How many `pods` exist on the system?

   In the current(default) namespace.

   - 5
   - 4
   - 1
   - 3
   - 2
   - **0**

   ```
   kubectl get pods
   No resources found in default namespace.
   ```

2. Create a new pod with the `nginx` image.

   ```
   kubectl run nginx --image nginx
   
   kubectl get pods
   NAME    READY   STATUS    RESTARTS   AGE
   nginx   1/1     Running   0          61s
   ```

3. How many pods are created now?

   - 5
   - 2
   - 3
   - 0
   - 1
   - **4**

   ```
   kubectl get pods
   NAME            READY   STATUS    RESTARTS   AGE
   nginx           1/1     Running   0          2m40s
   newpods-58cgb   1/1     Running   0          24s
   newpods-b5vgs   1/1     Running   0          24s
   newpods-5mzs4   1/1     Running   0          24s
   ```

4. What is the image used to create the new pods?

   You must look at one of the new pods in detail to figure this out.

   - NGINX
   - **BUSYBOX**
   - JENKINS
   - NEWPOD

   ```
   kubectl describe pods newpods-58cgb 
   
   Name:         newpods-58cgb
   Namespace:    default
   Priority:     0
   Node:         controlplane/172.25.1.5
   Start Time:   Fri, 18 Nov 2022 10:00:17 +0000
   Labels:       tier=busybox
   Annotations:  <none>
   Status:       Running
   IP:           10.42.0.10
   IPs:
     IP:           10.42.0.10
   Controlled By:  ReplicaSet/newpods
   Containers:
     busybox:
       Container ID:  containerd://74dbfe183ad8d950dade94a9e0330528347c4bad92a66c3373675e0c2233211c
       Image:         busybox
       Image ID:      docker.io/library/busybox@sha256:fcd85228d7a25feb59f101ac3a955d27c80df4ad824d65f5757a954831450185
       Port:          <none>
       Host Port:     <none>
       Command:
         sleep
         1000
       State:          Running
         Started:      Fri, 18 Nov 2022 10:00:21 +0000
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-5bgz7 (ro)
   Conditions:
     Type              Status
     Initialized       True 
     Ready             True 
     ContainersReady   True 
     PodScheduled      True 
   Volumes:
     kube-api-access-5bgz7:
       Type:                    Projected (a volume that contains injected data from multiple sources)
       TokenExpirationSeconds:  3607
       ConfigMapName:           kube-root-ca.crt
   ```

5. Which nodes are these pods placed on?

   You must look at all the pods in detail to figure this out.

   - MASTER & NODE-1
   - NODE-1
   - MASTER
   - **CONTROLPLANE**
   - NODE-2

   ```
   kubectl get pod -o wide
   NAME            READY   STATUS    RESTARTS   AGE     IP           NODE           NOMINATED NODE   READINESS GATES
   nginx           1/1     Running   0          7m6s    10.42.0.9    controlplane   <none>           <none>
   newpods-58cgb   1/1     Running   0          4m50s   10.42.0.10   controlplane   <none>           <none>
   newpods-b5vgs   1/1     Running   0          4m50s   10.42.0.12   controlplane   <none>           <none>
   newpods-5mzs4   1/1     Running   0          4m50s   10.42.0.11   controlplane   <none>           <none>
   ```

6. How many containers are part of the pod `webapp`?

   Note: We just created a new POD. Ignore the state of the POD for now.

   - 1
   - 0
   - **2**
   - 3
   - 4

   ```
   kubectl describe pod webapp 
   Name:         webapp
   Namespace:    default
   Priority:     0
   Node:         controlplane/172.25.1.5
   Start Time:   Fri, 18 Nov 2022 10:06:27 +0000
   Labels:       <none>
   Annotations:  <none>
   Status:       Pending
   IP:           10.42.0.13
   IPs:
     IP:  10.42.0.13
   Containers:
     nginx:
       Container ID:   containerd://e49c21287257dcbb097913d59147372feaa55cd41dee07ca180a6e78beed4245
       Image:          nginx
       Image ID:       docker.io/library/nginx@sha256:e209ac2f37c70c1e0e9873a5f7231e91dcd83fdf1178d8ed36c2ec09974210ba
       Port:           <none>
       Host Port:      <none>
       State:          Running
         Started:      Fri, 18 Nov 2022 10:06:28 +0000
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-m9rbv (ro)
     agentx:
       Container ID:   
       Image:          agentx
       Image ID:       
       Port:           <none>
       Host Port:      <none>
       State:          Waiting
         Reason:       ErrImagePull
       Ready:          False
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-m9rbv (ro)
   Conditions:
     Type              Status
     Initialized       True 
     Ready             False 
     ContainersReady   False 
     PodScheduled      True 
   Volumes:
     kube-api-access-m9rbv:
       Type:                    Projected (a volume that contains injected data from multiple sources)
       TokenExpirationSeconds:  3607
       ConfigMapName:           kube-root-ca.crt
       ConfigMapOptional:       <nil>
       DownwardAPI:             true
   QoS Class:                   BestEffort
   Node-Selectors:              <none>
   Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                                node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
   Events:
     Type     Reason     Age                From               Message
     ----     ------     ----               ----               -------
     Normal   Scheduled  67s                default-scheduler  Successfully assigned default/webapp to controlplane
     Normal   Pulling    67s                kubelet            Pulling image "nginx"
     Normal   Pulled     66s                kubelet            Successfully pulled image "nginx" in 436.927046ms
     Normal   Created    66s                kubelet            Created container nginx
     Normal   Started    66s                kubelet            Started container nginx
     Normal   Pulling    27s (x3 over 66s)  kubelet            Pulling image "agentx"
     Warning  Failed     26s (x3 over 65s)  kubelet            Failed to pull image "agentx": rpc error: code = Unknown desc = failed to pull and unpack image "docker.io/library/agentx:latest": failed to resolve reference "docker.io/library/agentx:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
     Warning  Failed     26s (x3 over 65s)  kubelet            Error: ErrImagePull
     Normal   BackOff    14s (x3 over 65s)  kubelet            Back-off pulling image "agentx"
     Warning  Failed     14s (x3 over 65s)  kubelet            Error: ImagePullBackOff
   ```

7. What images are used in the new `webapp` pod?

   You must look at all the pods in detail to figure this out.

   - busybox
   - **nginx & agentx**
   - nginx & busybox
   - agentx
   - nginx

   ```
    kubectl describe pod webapp 
   Name:         webapp
   Namespace:    default
   Priority:     0
   Node:         controlplane/172.25.1.139
   Start Time:   Wed, 04 Jan 2023 11:37:43 +0000
   Labels:       <none>
   Annotations:  <none>
   Status:       Pending
   IP:           10.42.0.13
   IPs:
     IP:  10.42.0.13
   Containers:
     nginx:
       Container ID:   containerd://bb229adc4e2272beb053c7dd46949546f005b43a45cf674f427d4e3183e81a8b
       Image:          nginx
       Image ID:       docker.io/library/nginx@sha256:0047b729188a15da49380d9506d65959cce6d40291ccfb4e039f5dc7efd33286
       Port:           <none>
       Host Port:      <none>
       State:          Running
         Started:      Wed, 04 Jan 2023 11:37:44 +0000
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-zf64g (ro)
     agentx:
       Container ID:   
       Image:          agentx
       Image ID:       
       Port:           <none>
       Host Port:      <none>
       State:          Waiting
         Reason:       ImagePullBackOff
       Ready:          False
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-zf64g (ro)
   ```

8. What is the state of the container `agentx` in the pod `webapp`?

   Wait for it to finish the `ContainerCreating` state

   - **Error or Waiting**
   - Running
   - Ready
   - Success

   ```
   kubectl describe pod webapp 
   
   Name:         webapp
   Namespace:    default
   Priority:     0
   Node:         controlplane/172.25.1.139
   Start Time:   Wed, 04 Jan 2023 11:37:43 +0000
   Labels:       <none>
   Annotations:  <none>
   Status:       Pending
   IP:           10.42.0.13
   IPs:
     IP:  10.42.0.13
   Containers:
     nginx:
       Container ID:   containerd://bb229adc4e2272beb053c7dd46949546f005b43a45cf674f427d4e3183e81a8b
       Image:          nginx
       Image ID:       docker.io/library/nginx@sha256:0047b729188a15da49380d9506d65959cce6d40291ccfb4e039f5dc7efd33286
       Port:           <none>
       Host Port:      <none>
       State:          Running
         Started:      Wed, 04 Jan 2023 11:37:44 +0000
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-zf64g (ro)
     agentx:
       Container ID:   
       Image:          agentx
       Image ID:       
       Port:           <none>
       Host Port:      <none>
       State:          Waiting
         Reason:       ImagePullBackOff
       Ready:          False
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-zf64g (ro)
   ```

9. Why do you think the container `agentx` in pod `webapp` is in error?

   Try to figure it out from the events section of the pod.

   - The application inside this image is faulty
   - **A Docker image with this name doesn't exist on Docker Hub**
   - NGINX application isn't configured to communicate to this image
   - Faulty Kubernetes cluster

   

10. What does the `READY` column in the output of the `kubectl get pods` command indicate?

    - **Running Containers in POD/Total Containers in POD**

    - Total Pods/Running Pods

    - Running Pods/Total Pods

    - Total Containers in POD/Running Containers in POD

      

11. Delete the `webapp` Pod.

    Once deleted, wait for the pod to fully terminate.

    ```
    kubectl delete pod webapp 
    pod "webapp" deleted
    
    kubectl get pods
    NAME            READY   STATUS    RESTARTS        AGE
    nginx           1/1     Running   0               21m
    newpods-58cgb   1/1     Running   1 (2m36s ago)   19m
    newpods-b5vgs   1/1     Running   1 (2m36s ago)   19m
    newpods-5mzs4   1/1     Running   1 (2m36s ago)   19m
    ```

12. Create a new pod with the name `redis` and with the image `redis123`.

    Use a pod-definition YAML file. And yes the image name is wrong!

    - Name: redis
    - Image Name: redis123

    ```
    kubectl run redis --image=redis123 --dry-run=client -o yaml > redis-definition.yaml
    
    kubectl create -f redis-definition.yaml 
    pod/redis created
    
    kubectl get pods
    NAME            READY   STATUS             RESTARTS        AGE
    nginx           1/1     Running            0               25m
    newpods-58cgb   1/1     Running            1 (6m44s ago)   23m
    newpods-b5vgs   1/1     Running            1 (6m44s ago)   23m
    newpods-5mzs4   1/1     Running            1 (6m44s ago)   23m
    redis           0/1     ImagePullBackOff   0               19s
    ```

13. Now change the image on this pod to `redis`.

    Once done, the pod should be in a `running` state.

    CheckCompleteIncomplete

    - Name: redis
    - Image Name: redis

    Edit redis-definition.yaml

    ```
    apiVersion: v1
    kind: Pod
    metadata:
      creationTimestamp: null
      labels:
        run: redis
      name: redis
    spec:
      containers:
      - image: redis
        name: redis
        resources: {}
      dnsPolicy: ClusterFirst
      restartPolicy: Always
    status: {}
    ```

    ```
    kubectl apply -f redis-definition.yaml 
    Warning: resource pods/redis is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
    pod/redis configured
    
    kubectl get pods
    NAME            READY   STATUS    RESTARTS      AGE
    nginx           1/1     Running   0             36m
    newpods-58cgb   1/1     Running   2 (19s ago)   33m
    newpods-b5vgs   1/1     Running   2 (19s ago)   33m
    newpods-5mzs4   1/1     Running   2 (19s ago)   33m
    redis           1/1     Running   0             10m
    ```



## PRACTICE TEST – REPLICASETS

1. How many PODs exist on the system?

   In the current(default) namespace.

   - 4
   - **0**
   - 2
   - 1
   - 3

   ```
   kubectl get pods
   No resources found in default namespace.
   ```

2. How many ReplicaSets exist on the system?

   In the current(default) namespace.

   - **0**
   - 4
   - 3
   - 2
   - 1

   ```
   kubectl get rs
   No resources found in default namespace.
   ```

3. How about now? How many ReplicaSets do you see?

   We just made a few changes!

   - 0
   - 3
   - **1**
   - 2
   - 4

   ```
   kubectl get replicasets.apps 
   NAME              DESIRED   CURRENT   READY   AGE
   new-replica-set   4         4         0       34s
   ```

4. How many PODs are DESIRED in the `new-replica-set`?

   - 2
   - 0
   - 5
   - 1
   - **4**

   ```
   kubectl get rs
   NAME              DESIRED   CURRENT   READY   AGE
   new-replica-set   4         4         0       119s
   ```

5. What is the image used to create the pods in the `new-replica-set`?

   - BUSYBOX-POD
   - **BUSYBOX777**
   - NEWPOD
   - NGINX
   - BUSYBOX-CONTAINER

   ```
   kubectl describe replicaset new-replica-set 
   Name:         new-replica-set
   Namespace:    default
   Selector:     name=busybox-pod
   Labels:       <none>
   Annotations:  <none>
   Replicas:     4 current / 4 desired
   Pods Status:  0 Running / 4 Waiting / 0 Succeeded / 0 Failed
   Pod Template:
     Labels:  name=busybox-pod
     Containers:
      busybox-container:
       Image:      busybox777
       Port:       <none>
       Host Port:  <none>
       Command:
         sh
         -c
         echo Hello Kubernetes! && sleep 3600
       Environment:  <none>
       Mounts:       <none>
     Volumes:        <none>
   ```

6. How many PODs are READY in the `new-replica-set`?

   - **0**
   - 1
   - 5
   - 2
   - 4

   ```
   kubectl get rs
   NAME              DESIRED   CURRENT   READY   AGE
   new-replica-set   4         4         0       4m44s
   ```

7. Why do you think the PODs are not ready?

   - Kubernetes is faulty
   - **The image BUSYBOX777 doesn't exist**
   - Application has errors
   - Replicaset was not created correctly

8. Delete any one of the 4 PODs.

   ```
   kubectl get pods
   NAME                    READY   STATUS             RESTARTS   AGE
   new-replica-set-4gfdg   0/1     ImagePullBackOff   0          6m6s
   new-replica-set-8s4cb   0/1     ImagePullBackOff   0          6m6s
   new-replica-set-xgr6v   0/1     ErrImagePull       0          6m6s
   new-replica-set-wbb2t   0/1     ErrImagePull       0          6m6s
   
   kubectl delete pod new-replica-set-4gfdg 
   pod "new-replica-set-4gfdg" deleted
   ```

9. How many PODs exist now?

   - 0
   - 1
   - 5
   - **4**
   - 2
   - 3

   ```
   kubectl get pods
   NAME                    READY   STATUS             RESTARTS   AGE
   new-replica-set-xgr6v   0/1     ImagePullBackOff   0          8m5s
   new-replica-set-wbb2t   0/1     ImagePullBackOff   0          8m5s
   new-replica-set-8s4cb   0/1     ImagePullBackOff   0          8m5s
   new-replica-set-vj4tc   0/1     ImagePullBackOff   0          81s
   ```

10. Why are there still 4 PODs, even after you deleted one?

   - I didn't delete it properly
   - You cannot delete a POD from a ReplicaSet
   - **ReplicaSet ensures that desired number of PODs always run**\

11. Create a ReplicaSet using the `replicaset-definition-1.yaml` file located at `/root/`.

    There is an issue with the file, so try to fix it.

    Check

    - Name: replicaset-1

    ```
    kubectl create -f replicaset-definition-1.yaml 
    error: resource mapping not found for name: "replicaset-1" namespace: "" from "replicaset-definition-1.yaml": no matches for kind "ReplicaSet" in version "v1"
    ensure CRDs are installed first
    ```

    Run the command: `kubectl explain replicaset | grep VERSION` and correct the `apiVersion` for `ReplicaSet`.
    Then run the command: `kubectl create -f /root/replicaset-definition-1.yaml`

    ```
    kubectl explain replicaset | grep VERSION
    VERSION:  apps/v1
    ```

    ```\
    apiVersion: apps/v1
    kind: ReplicaSet
    metadata:
      name: replicaset-1
    spec:
      replicas: 2
      selector:
        matchLabels:
          tier: frontend
      template:
        metadata:
          labels:
            tier: frontend
        spec:
          containers:
          - name: nginx
            image: nginx
    ```

    ```
    kubectl create -f replicaset-definition-1.yaml 
    replicaset.apps/replicaset-1 created
    
    controlplane ~ ➜  kubectl get rs
    NAME              DESIRED   CURRENT   READY   AGE
    new-replica-set   4         4         0       14m
    replicaset-1      2         2         2       11s
    ```

12. Fix the issue in the `replicaset-definition-2.yaml` file and create a `ReplicaSet` using it.

    This file is located at `/root/`.

    Check

    - Name: replicaset-2

    ```
    kubectl create -f replicaset-definition-2.yaml 
    The ReplicaSet "replicaset-2" is invalid: spec.template.metadata.labels: Invalid value: map[string]string{"tier":"nginx"}: `selector` does not match template `labels`
    ```

    ```
    apiVersion: apps/v1
    kind: ReplicaSet
    metadata:
      name: replicaset-2
    spec:
      replicas: 2
      selector:
        matchLabels:
          tier: nginx
      template:
        metadata:
          labels:
            tier: nginx
        spec:
          containers:
          - name: nginx
            image: nginx
    ```

    ```
    kubectl create -f replicaset-definition-2.yaml 
    replicaset.apps/replicaset-2 created
    
    controlplane ~ ➜  kubectl get rs
    NAME              DESIRED   CURRENT   READY   AGE
    new-replica-set   4         4         0       17m
    replicaset-1      2         2         2       4m4s
    replicaset-2      2         2         2       8s
    ```

13. Delete the two newly created ReplicaSets - `replicaset-1` and `replicaset-2`

    Check

    - Delete: replicaset-2
    - Delete: replicaset-1

    ```
    $ kubectl delete rs replicaset-1 replicaset-2 
    replicaset.apps "replicaset-1" deleted
    replicaset.apps "replicaset-2" deleted
    ```

14. Fix the original replica set `new-replica-set` to use the correct `busybox` image.

    Either delete and recreate the ReplicaSet or Update the existing ReplicaSet and then delete all PODs, so new ones with the correct image will be created.

    Check

    - Replicas: 4

      

    Run the command: `kubectl edit replicaset new-replica-set`, modify the image name and then save the file.

    ```
    kubectl edit replicaset new-replica-set
    ```

    Delete the previous pods to get the new ones with the correct image.
    For this, run the command: 

    ```
    kubectl delete pods new-replica-set-wbb2t new-replica-set-xgr6v new-replica-set-8s4cb new-replica-set-vj4tc 
    pod "new-replica-set-wbb2t" deleted
    pod "new-replica-set-xgr6v" deleted
    pod "new-replica-set-8s4cb" deleted
    pod "new-replica-set-vj4tc" deleted
    ```

15. Scale the ReplicaSet to 5 PODs.

    Use `kubectl scale` command or edit the replicaset using `kubectl edit replicaset`.

    

    Run the command: `kubectl edit replicaset new-replica-set`, modify the `replicas` and then save the file OR run: `kubectl scale rs new-replica-set --replicas=5` to scale up to 5 PODs.

​    

16. Now scale the ReplicaSet down to 2 PODs.

    Use the `kubectl scale` command or edit the replicaset using `kubectl edit replicaset`.

    Check

    - Replicas: 2

      

    Run the command: `kubectl edit replicaset new-replica-set`, modify the `replicas` and then save the file OR run: `kubectl scale rs new-replica-set --replicas=2` to scale down to 2 PODs.

    

    ```
    kubectl scale rs new-replica-set --replicas=2
    replicaset.apps/new-replica-set scaled
    
    controlplane ~ ➜  kubectl get rs
    NAME              DESIRED   CURRENT   READY   AGE
    new-replica-set   2         2         2       57m
    ```



## PRACTICE TESTS – DEPLOYMENTS



1. How many PODs exist on the system?

   In the current(default) namespace.

   - 1
   - 3
   - 4
   - **0**
   - 2

   ```
   kubectl get pods
   No resources found in default namespace.
   ```

2. How many ReplicaSets exist on the system?

   In the current(default) namespace.

   - 4
   - 3
   - 1
   - **0**
   - 2

   ```
   kubectl get rs
   No resources found in default namespace.
   ```

3. How many Deployments exist on the system?

   In the current(default) namespace.

   - 3
   - 4
   - 2
   - **0**
   - 1

   ```
    kubectl get deployments
   No resources found in default namespace.
   ```

4. How many Deployments exist on the system now?

   We just created a Deployment! Check again!

   - 0
   - **1**
   - 2
   - 3
   - 4

   ```
   kubectl get deployments
   NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
   frontend-deployment   0/4     4            0           43s
   ```

5. How many ReplicaSets exist on the system now?

   - 3
   - 4
   - **1**
   - 2
   - 0

   ```
   kubectl get rs
   NAME                             DESIRED   CURRENT   READY   AGE
   frontend-deployment-6d8c45b946   4         4         0       94s
   ```

6. How many PODs exist on the system now?

   - 0
   - 2
   - 3
   - 1
   - **4**

   ```
   kubectl get pods
   NAME                                   READY   STATUS             RESTARTS   AGE
   frontend-deployment-6d8c45b946-zvvm7   0/1     ImagePullBackOff   0          2m35s
   frontend-deployment-6d8c45b946-qg6vq   0/1     ImagePullBackOff   0          2m35s
   frontend-deployment-6d8c45b946-4jtjt   0/1     ImagePullBackOff   0          2m35s
   frontend-deployment-6d8c45b946-jsrxq   0/1     ImagePullBackOff   0          2m35s
   ```

7. Out of all the existing PODs, how many are ready?

   - 2
   - 3
   - 1
   - **0**
   - 4

   ```
   kubectl get pods
   NAME                                   READY   STATUS             RESTARTS   AGE
   frontend-deployment-6d8c45b946-zvvm7   0/1     ImagePullBackOff   0          2m35s
   frontend-deployment-6d8c45b946-qg6vq   0/1     ImagePullBackOff   0          2m35s
   frontend-deployment-6d8c45b946-4jtjt   0/1     ImagePullBackOff   0          2m35s
   frontend-deployment-6d8c45b946-jsrxq   0/1     ImagePullBackOff   0          2m35s
   ```

8. What is the image used to create the pods in the new deployment?

   - BUSYBOX777
   - NGINX
   - **BUSYBOX888**
   - BUSYBOX-CONTAINER
   - BUSYBOX-POD

   ```
   kubectl describe deployments.apps frontend-deployment 
   Name:                   frontend-deployment
   Namespace:              default
   CreationTimestamp:      Thu, 05 Jan 2023 00:58:30 +0000
   Labels:                 <none>
   Annotations:            deployment.kubernetes.io/revision: 1
   Selector:               name=busybox-pod
   Replicas:               4 desired | 4 updated | 4 total | 0 available | 4 unavailable
   StrategyType:           RollingUpdate
   MinReadySeconds:        0
   RollingUpdateStrategy:  25% max unavailable, 25% max surge
   Pod Template:
     Labels:  name=busybox-pod
     Containers:
      busybox-container:
       Image:      busybox888
       Port:       <none>
       Host Port:  <none>
       Command:
         sh
         -c
         echo Hello Kubernetes! && sleep 3600
       Environment:  <none>
       Mounts:       <none>
     Volumes:        <none>
   Conditions:
     Type           Status  Reason
     ----           ------  ------
     Available      False   MinimumReplicasUnavailable
     Progressing    True    ReplicaSetUpdated
   OldReplicaSets:  <none>
   NewReplicaSet:   frontend-deployment-6d8c45b946 (4/4 replicas created)
   Events:
     Type    Reason             Age    From                   Message
     ----    ------             ----   ----                   -------
     Normal  ScalingReplicaSet  5m20s  deployment-controller  Scaled up replica set frontend-deployment-6d8c45b946 to 4
   ```

9. Why do you think the deployment is not ready?

   - **The image BUSYBOX888 doesn't exist**
   - Deployment was not created correctly
   - Kubernetes is faulty
   - Application has errors

10. Create a new Deployment using the `deployment-definition-1.yaml` file located at `/root/`.

   There is an issue with the file, so try to fix it.

   Check

   - Name: deployment-1

   ```
kubectl create -f deployment-definition-1.yaml 
Error from server (BadRequest): error when creating "deployment-definition-1.yaml": deployment in version "v1" cannot be handled as a Deployment: no kind "deployment" is registered for version "apps/v1" in scheme "k8s.io/apimachinery@v1.24.1-k3s1/pkg/runtime/scheme.go:100"
   ```

   

   Run the command: `kubectl explain deployment | head -n1` and correct the value of `kind`.

   ```
kubectl explain deployment | head -n1
KIND:     Deployment
   ```

   ```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-1
spec:
  replicas: 2
  selector:
    matchLabels:
      name: busybox-pod
  template:
    metadata:
      labels:
        name: busybox-pod
    spec:
      containers:
      - name: busybox-container
        image: busybox888
        command:
        - sh
        - "-c"
        - echo Hello Kubernetes! && sleep 3600
   ```

   ```
kubectl create -f deployment-definition-1.yaml 
deployment.apps/deployment-1 created
   ```

11. Create a new Deployment with the below attributes using your own deployment definition file.

    Name: `httpd-frontend`;
    Replicas: `3`;
    Image: `httpd:2.4-alpine`

    Check

    - Name: httpd-frontend
    - Replicas: 3
    - Image: httpd:2.4-alpine

    ```
    kubectl create deployment httpd-frontend --image httpd:2.4-alpine --replicas=3 --dry-run=client -o yaml > deployment-definition-httpd.yaml
    ```

    deployment-definition-httpd.yaml

    ```
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      creationTimestamp: null
      labels:
        app: httpd-frontend
      name: httpd-frontend
    spec:
      replicas: 3
      selector:
        matchLabels:
          app: httpd-frontend
      strategy: {}
      template:
        metadata:
          creationTimestamp: null
          labels:
            app: httpd-frontend
        spec:
          containers:
          - image: httpd:2.4-alpine
            name: httpd
            resources: {}
    status: {}
    ```

    ```
    kubectl create -f deployment-definition-httpd.yaml 
    deployment.apps/httpd-frontend created
    ```

    ```
    kubectl get deployments.apps 
    NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
    frontend-deployment   0/4     4            0           27m
    httpd-frontend        3/3     3            3           3m19s
    deployment-1          0/2     2            0           10m
    ```



## PRACTICE TEST NAMESPACES

1. How many Namespaces exist on the system?

   - 1
   - 0
   - 5
   - 4
   - 3
   - **10**

   ```
   kubectl get namespaces 
   NAME              STATUS   AGE
   default           Active   8m2s
   kube-system       Active   8m2s
   kube-public       Active   8m1s
   kube-node-lease   Active   8m1s
   finance           Active   54s
   marketing         Active   54s
   dev               Active   54s
   prod              Active   54s
   manufacturing     Active   54s
   research          Active   54s
   
   kubectl get namespaces --no-headers | wc -l
   10
   ```

2. How many pods exist in the `research` namespace?

   - 1
   - 5
   - 0
   - **2**
   - 4
   - 3

   ```
   kubectl get pods --namespace=research
   NAME    READY   STATUS             RESTARTS        AGE
   dna-2   0/1     CrashLoopBackOff   5 (2m35s ago)   5m47s
   dna-1   1/1     Running            6 (2m49s ago)   5m47s
   ```

3. Create a POD in the `finance` namespace.

   Use the spec given below.

   Check

   - Name: redis
   - Image Name: redis

   ```
   kubectl run redis --image=redis -n finance
   pod/redis created
   ```

4. Which namespace has the `blue` pod in it?

   - manufacturing
   - **marketing**
   - research
   - default

   ```
   kubectl get pods --all-namespaces | grep blue
   marketing       blue                                      1/1     Running            0               13m
   ```

   

5. Access the `Blue` web application using the link above your terminal!!

   From the UI you can ping other services.

   Ok

6. What DNS name should the `Blue` application use to access the database `db-service` in its own namespace - `marketing`?

   You can try it in the web application UI. Use port `6379`.

   - **db-service**
   - blue-db-service
   - db
   - redis

7. What DNS name should the `Blue` application use to access the database `db-service` in the `dev` namespace?

   You can try it in the web application UI. Use port `6379`.

   - db-service

   - db-service.dev.pod.cluster.local

   - redis

   - **db-service.dev.svc.cluster.local**

     

   Since the blue application and the `db-service` are in different namespaces. In this case, we need to use the service name along with the namespace to access the database. The `FQDN (fully Qualified Domain Name)` for the `db-service` in this example would be `db-service.dev.svc.cluster.local`.

   Note:` You can also access it using the service name and namespace like this: `db-service.dev



# SCHEDULING

## PRACTICE TEST MANUAL SCHEDULING



1. A pod definition file `nginx.yaml` is given. Create a pod using the file.

   Only create the POD for now. We will inspect its status next.

   Check

   - Pod nginx Created

   nginx.yaml 

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     name: nginx
   spec:
     containers:
     -  image: nginx
        name: nginx
   ```

   ```
   kubectl create -f nginx.yaml 
   pod/nginx created
   ```

2. What is the status of the created POD?

   - Scheduled
   - Running
   - **Pending**
   - Error

   ```
   kubectl get pod
   NAME    READY   STATUS    RESTARTS   AGE
   nginx   0/1     Pending   0          3m26s
   ```

3. Why is the POD in a pending state?

   Inspect the environment for various kubernetes control plane components.

   - No nodes available
   - Taints & Tolerations
   - **No Scheduler Present**
   - Incorrect Label

   ````
   kubectl get pods --namespace kube-system 
   NAME                                   READY   STATUS    RESTARTS   AGE
   coredns-6d4b75cb6d-2k8c4               1/1     Running   0          27m
   coredns-6d4b75cb6d-hbg2r               1/1     Running   0          27m
   etcd-controlplane                      1/1     Running   0          28m
   kube-apiserver-controlplane            1/1     Running   0          28m
   kube-controller-manager-controlplane   1/1     Running   0          28m
   kube-flannel-ds-4zbgr                  1/1     Running   0          27m
   kube-flannel-ds-tdxkx                  1/1     Running   0          27m
   kube-proxy-l4gch                       1/1     Running   0          27m
   kube-proxy-xpb6h                       1/1     Running   0          27m
   ````

4. Manually schedule the pod on `node01`.

   Delete and recreate the POD if necessary.

   CheckCompleteIncomplete

   - Status: Running
   - Pod: nginx

   nginx.yaml

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     name: nginx
   spec:
     nodeName: node01
     containers:
     -  image: nginx
        name: nginx
   ```

   ```
   kubectl delete pods nginx 
   pod "nginx" deleted
   
   controlplane ~ ➜  kubectl create -f nginx.yaml 
   pod/nginx created
   
   controlplane ~ ➜  kubectl get pods
   NAME    READY   STATUS    RESTARTS   AGE
   nginx   1/1     Running   0          8s
   
   kubectl get pods -o wide
   NAME    READY   STATUS    RESTARTS   AGE     IP           NODE     NOMINATED NODE   READINESS GATES
   nginx   1/1     Running   0          2m27s   10.244.1.3   node01   <none>           <none>
   ```

   

5. Now schedule the same pod on the `controlplane` node.

   Delete and recreate the POD if necessary.

   Check

   - Status: Running
   - Pod: nginx
   - Node: controlplane?

   nginx.yaml

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     name: nginx
   spec:
     nodeName: controlplane
     containers:
     -  image: nginx
        name: nginx
   ```

   ```
   kubectl delete pod nginx 
   pod "nginx" deleted
   
   kubectl create -f nginx.yaml 
   pod/nginx created
   
   kubectl get pods -o wide
   NAME    READY   STATUS    RESTARTS   AGE   IP           NODE           NOMINATED NODE   READINESS GATES
   nginx   1/1     Running   0          18s   10.244.0.4   controlplane   <none>           <none>
   ```



## PRACTICE TEST LABELS AND SELECTORS



1. We have deployed a number of PODs. They are labelled with `tier`, `env` and `bu`. How many PODs exist in the `dev` environment (`env`)?

   Use selectors to filter the output

   - 3
   - **7**
   - 5
   - 2
   - 1

   ```
   kubectl get pods --selector env=dev
   NAME          READY   STATUS    RESTARTS   AGE
   app-1-dsd8d   1/1     Running   0          8m28s
   app-1-csfhg   1/1     Running   0          8m28s
   app-1-cht9z   1/1     Running   0          8m28s
   db-1-wcfvf    1/1     Running   0          8m27s
   db-1-mfrmc    1/1     Running   0          8m27s
   db-1-82bvv    1/1     Running   0          8m27s
   db-1-qs658    1/1     Running   0          8m27s
   
   kubectl get pods --selector env=dev --no-headers | wc -l
   7
   ```

2. How many PODs are in the `finance` business unit (`bu`)?

   - 7
   - 2
   - 6
   - 1
   - 5

   ```
   kubectl get pods --selector bu=finance --no-headers 
   app-1-dsd8d   1/1   Running   0     17m
   app-1-csfhg   1/1   Running   0     17m
   app-1-cht9z   1/1   Running   0     17m
   auth          1/1   Running   0     17m
   app-1-zzxdf   1/1   Running   0     17m
   db-2-7x7z4    1/1   Running   0     17m
   
   kubectl get pods --selector bu=finance --no-headers | wc -l
   6
   ```

3. How many objects are in the `prod` environment including PODs, ReplicaSets and any other objects?

   - 4
   - 7
   - 1
   - 2
   - 6
   - 5

   ```
   $ kubectl get all --selector env=prod
   NAME              READY   STATUS    RESTARTS   AGE
   pod/app-2-hrgz8   1/1     Running   0          25m
   pod/auth          1/1     Running   0          25m
   pod/app-1-zzxdf   1/1     Running   0          25m
   pod/db-2-7x7z4    1/1     Running   0          25m
   
   NAME            TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
   service/app-1   ClusterIP   10.43.116.90   <none>        3306/TCP   25m
   
   NAME                    DESIRED   CURRENT   READY   AGE
   replicaset.apps/app-2   1         1         1       25m
   replicaset.apps/db-2    1         1         1       25m
   
   $ kubectl get all --selector env=prod --no-headers | wc -l
   7
   ```

4. Identify the POD which is part of the `prod` environment, the `finance` BU and of `frontend` tier?

   - auth
   - **app-1-zzxdf**
   - app-2-8zn86
   - app-1-zk988
   - db-2-c4qnn

   ```
   kubectl get all --selector env=prod,bu=finance,tier=frontend
   NAME              READY   STATUS    RESTARTS   AGE
   pod/app-1-zzxdf   1/1     Running   0          45m
   ```

5. A ReplicaSet definition file is given `replicaset-definition-1.yaml`. Try to create the replicaset. There is an issue with the file. Try to fix it.

   Check

   - ReplicaSet: replicaset-1
   - Replicas: 2

   ```
   $ kubectl create -f replicaset-definition-1.yaml 
   The ReplicaSet "replicaset-1" is invalid: spec.template.metadata.labels: Invalid value: map[string]string{"tier":"nginx"}: `selector` does not match template `labels`
   ```

   ```
   apiVersion: apps/v1
   kind: ReplicaSet
   metadata:
      name: replicaset-1
   spec:
      replicas: 2
      selector:
         matchLabels:
           tier: nginx
      template:
        metadata:
          labels:
           tier: nginx
        spec:
          containers:
          - name: nginx
            image: nginx
   ```

   ```
   kubectl create -f replicaset-definition-1.yaml 
   replicaset.apps/replicaset-1 created
   ```



## PRACTICE TEST – TAINTS AND TOLERATIONS

1. How many `nodes` exist on the system?

   Including the `controlplane` node.

   - 4
   - 3
   - 1
   - 5
   - 0
   - **2**

   ```
   kubectl get nodes
   NAME           STATUS   ROLES           AGE   VERSION
   controlplane   Ready    control-plane   14m   v1.24.0
   node01         Ready    <none>          13m   v1.24.0
   ```

2. Do any taints exist on `node01` node?

   - Yes - NoExecute
   - Yes - NoSchedule
   - **No**

   ```
   kubectl describe node node01 | grep -i taints
   Taints:             <none>
   ```

3. Create a taint on `node01` with key of `spray`, value of `mortein` and effect of `NoSchedule`

   Check

   - Key = spray
   - Value = mortein
   - Effect = NoSchedule

   ```
   $ kubectl taint nodes node01 spray=mortein:NoSchedule
   node/node01 tainted
   ```

4. Create a new pod with the `nginx` image and pod name as `mosquito`.

   Check

   - Image name: nginx

   ```
   kubectl run mosquito --image=nginx --dry-run=client -o yaml > mosquito.yaml
   ```

   mosquito.yaml

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     creationTimestamp: null
     labels:
       run: mosquito
     name: mosquito
   spec:
     containers:
     - image: nginx
       name: mosquito
       resources: {}
     dnsPolicy: ClusterFirst
     restartPolicy: Always
   status: {}
   ```

   ```
   kubectl create -f mosquito.yaml 
   pod/mosquito created
   ```

5. What is the state of the POD?

   - Ready
   - Error
   - Pending

   ```
   $ kubectl get pods
   NAME       READY   STATUS    RESTARTS   AGE
   mosquito   0/1     Pending   0          2m46s
   ```

6. Why do you think the pod is in a pending state?

   - Application Error
   - **POD Mosquito cannot tolerate taint Mortein**
   - Image is not available

7. Create another pod named `bee` with the `nginx` image, which has a toleration set to the taint `mortein`.

   Check

   - Image name: nginx
   - Key: spray
   - Value: mortein
   - Effect: NoSchedule
   - Status: Running

   bee.yaml

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     name: bee
   spec:
     containers:
     - image: nginx
       name: bee
     tolerations:
     - key: spray
       value: mortein
       effect: NoSchedule
       operator: Equal
   ```

   ```
   kubectl create -f bee.yaml 
   pod/bee created
   
   kubectl get pods
   NAME       READY   STATUS    RESTARTS   AGE
   bee        1/1     Running   0          14s
   mosquito   0/1     Pending   0          12m
   ```

8. Notice the `bee` pod was scheduled on node `node01` despite the taint.

9. Do you see any taints on `controlplane` node?

   - No
   - Yes - NoExecute
   - **Yes - NoSchedule**

   ```
   $ kubectl describe node controlplane | grep -i taints
   Taints:             node-role.kubernetes.io/control-plane:NoSchedule
   ```

10. Remove the taint on `controlplane`, which currently has the taint effect of `NoSchedule`.

   Check

   - Node name: controlplane

   ```
   kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-
   node/controlplane untainted
   
   kubectl describe nodes controlplane | grep -i taintsTaints:             <none>
   ```



11. What is the state of the pod `mosquito` now?

    - Pending
    - **Running**
    - Error

    ```
    kubectl get pods
    NAME       READY   STATUS    RESTARTS   AGE
    bee        1/1     Running   0          9m6s
    mosquito   1/1     Running   0          21m
    ```

12. Which node is the POD `mosquito` on now?

    - node02
    - node01
    - **controlplane**

    ```
    kubectl get pods -o wide
    NAME       READY   STATUS    RESTARTS   AGE     IP           NODE           NOMINATED NODE   READINESS GATES
    bee        1/1     Running   0          5m19s   10.244.1.2   node01         <none>           <none>
    mosquito   1/1     Running   0          9m10s   10.244.0.4   controlplane   <none>           <none>
    ```
    



## PRACTICE TEST – NODE AFFINITY



1. How many Labels exist on node node01?

   - **5**
   - 1
   - 0
   - 4
   - 3
   - 2

   ```
   kubectl describe nodes node01 | grep -i label -A 10
   Labels:             beta.kubernetes.io/arch=amd64
                       beta.kubernetes.io/os=linux
                       kubernetes.io/arch=amd64
                       kubernetes.io/hostname=node01
                       kubernetes.io/os=linux
   Annotations:        flannel.alpha.coreos.com/backend-data: {"VNI":1,"VtepMAC":"a6:12:04:76:a4:a0"}
                       flannel.alpha.coreos.com/backend-type: vxlan
                       flannel.alpha.coreos.com/kube-subnet-manager: true
                       flannel.alpha.coreos.com/public-ip: 10.36.139.6
   ```

2. What is the value set to the label key `beta.kubernetes.io/arch` on `node01`?

   - amd32
   - amd
   - linux
   - **amd64**
   - node01

   ```
   kubectl describe nodes node01 | grep -i label -A 10
   Labels:             beta.kubernetes.io/arch=amd64
                       beta.kubernetes.io/os=linux
                       kubernetes.io/arch=amd64
                       kubernetes.io/hostname=node01
                       kubernetes.io/os=linux
   Annotations:        flannel.alpha.coreos.com/backend-data: {"VNI":1,"VtepMAC":"a6:12:04:76:a4:a0"}
                       flannel.alpha.coreos.com/backend-type: vxlan
                       flannel.alpha.coreos.com/kube-subnet-manager: true
                       flannel.alpha.coreos.com/public-ip: 10.36.139.6
   ```

3. Apply a label `color=blue` to node `node01`

   Check

   - color = blue

   ```
   kubectl label nodes node01 color=blue
   node/node01 labeled
   
   kubectl describe nodes node01 | grep -i labels -A 10
   Labels:             beta.kubernetes.io/arch=amd64
                       beta.kubernetes.io/os=linux
                       color=blue
                       kubernetes.io/arch=amd64
                       kubernetes.io/hostname=node01
                       kubernetes.io/os=linux
   Annotations:        flannel.alpha.coreos.com/backend-data: {"VNI":1,"VtepMAC":"a6:12:04:76:a4:a0"}
                       flannel.alpha.coreos.com/backend-type: vxlan
                       flannel.alpha.coreos.com/kube-subnet-manager: true
                       flannel.alpha.coreos.com/public-ip: 10.36.139.6
                       kubeadm.alpha.kubernetes.io/cri-socket: unix:///var/run/containerd/containerd.sock
   ```

4. Create a new deployment named `blue` with the `nginx` image and 3 replicas.

   Check

   - Name: blue
   - Replicas: 3
   - Image: nginx

   ```
   kubectl create deployment blue --image nginx --replicas=3
   deployment.apps/blue created
   
   kubectl get deployments.apps 
   NAME   READY   UP-TO-DATE   AVAILABLE   AGE
   blue   3/3     3            3           39s
   ```

5. Which nodes `can` the pods for the `blue` deployment be placed on?

   Make sure to check taints on both nodes!

   - **controlplane and node01**
   - node01
   - controlplane

   ```
   kubectl get pods -o wide
   NAME                    READY   STATUS    RESTARTS   AGE     IP           NODE           NOMINATED NODE   READINESS GATES
   blue-795455cfcb-h9bdj   1/1     Running   0          3m59s   10.244.1.2   node01         <none>           <none>
   blue-795455cfcb-n6g9h   1/1     Running   0          3m59s   10.244.1.3   node01         <none>           <none>
   blue-795455cfcb-nt7t7   1/1     Running   0          3m59s   10.244.0.4   controlplane   <none>           <none>
   ```

6. Set Node Affinity to the deployment to place the pods on `node01` only.

   Check

   - Name: blue
   - Replicas: 3
   - Image: nginx
   - NodeAffinity: requiredDuringSchedulingIgnoredDuringExecution
   - Key: color
   - value: blue

   ```
   kubectl edit deployment blue
   ```

   ```
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: blue
   spec:
     replicas: 3
     selector:
       matchLabels:
         run: nginx
     template:
       metadata:
         labels:
           run: nginx
       spec:
         containers:
         - image: nginx
           imagePullPolicy: Always
           name: nginx
         affinity:
           nodeAffinity:
             requiredDuringSchedulingIgnoredDuringExecution:
               nodeSelectorTerms:
               - matchExpressions:
                 - key: color
                   operator: In
                   values:
                   - blue
   ```

7. Which nodes are the pods placed on now?

   - controlplane
   - controlplane and node01
   - **node01**
   - Master

   ```
   kubectl get pods -o wide
   NAME                    READY   STATUS    RESTARTS   AGE   IP           NODE     NOMINATED NODE   READINESS GATES
   blue-6d7486c96b-6kfsb   1/1     Running   0          24s   10.244.1.6   node01   <none>           <none>
   blue-6d7486c96b-82k85   1/1     Running   0          29s   10.244.1.4   node01   <none>           <none>
   blue-6d7486c96b-br6gp   1/1     Running   0          27s   10.244.1.5   node01   <none>           <none>
   ```

8. Create a new deployment named `red` with the `nginx` image and `2` replicas, and ensure it gets placed on the `controlplane` node only.

   Use the label key - `node-role.kubernetes.io/control-plane` - which is already set on the `controlplane` node.

   Check

   - Name: red
   - Replicas: 2
   - Image: nginx
   - NodeAffinity: requiredDuringSchedulingIgnoredDuringExecution
   - Key: node-role.kubernetes.io/control-plane
   - Use the right operator

   Create the file **reddeploy.yaml** file as follows:

   ```
   kubectl create deployment red --image nginx --replicas=2 --dry-run=client -o yaml > reddeploy.yaml
   ```

   ```yaml
   ---
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: red
   spec:
     replicas: 2
     selector:
       matchLabels:
         run: nginx
     template:
       metadata:
         labels:
           run: nginx
       spec:
         containers:
         - image: nginx
           imagePullPolicy: Always
           name: nginx
         affinity:
           nodeAffinity:
             requiredDuringSchedulingIgnoredDuringExecution:
               nodeSelectorTerms:
               - matchExpressions:
                 - key: node-role.kubernetes.io/control-plane
                   operator: Exists
   ```


   Then run **kubectl create -f reddeploy.yaml**

   

## PRACTICE TEST RESOURCE LIMITS



1. A pod called `rabbit` is deployed. Identify the CPU requirements set on the Pod

   in the current(default) namespace

   - **1**
   - 4
   - 2
   - 3
   - 0

   ```
   kubectl describe pod rabbit | grep -i cpu -A 5
     cpu-stress:
       Container ID:  containerd://51990f7cbcd8a6d36d277d574569019f513a04815b9233e1a298f002acbe5ea9
       Image:         ubuntu
       Image ID:      docker.io/library/ubuntu@sha256:27cb6e6ccef575a4698b66f5de06c7ecd61589132d5a91d098f7f3f9285415a9
       Port:          <none>
       Host Port:     <none>
   --
         Message:      failed to create containerd task: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: error during container init: error setting cgroup config for procHooks process: failed to write "200000": write /sys/fs/cgroup/cpu,cpuacct/kubepods/burstable/pod225546b9-b0e8-483f-b556-451e28be2753/51990f7cbcd8a6d36d277d574569019f513a04815b9233e1a298f002acbe5ea9/cpu.cfs_quota_us: invalid argument: unknown
         Exit Code:    128
         Started:      Thu, 01 Jan 1970 00:00:00 +0000
         Finished:     Thu, 05 Jan 2023 10:38:27 +0000
       Ready:          False
       Restart Count:  5
   --
         cpu:  2
       Requests:
         cpu:        1
       Environment:  <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-rz4m5 (ro)
   Conditions:
     Type              Status
   --
     Normal   Created    3m39s (x4 over 4m24s)  kubelet            Created container cpu-stress
     Warning  Failed     3m39s (x4 over 4m24s)  kubelet            Error: failed to create containerd task: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: error during container init: error setting cgroup config for procHooks process: failed to write "200000": write /sys/fs/cgroup/cpu,cpuacct/kubepods/burstable/pod225546b9-b0e8-483f-b556-451e28be2753/cpu-stress/cpu.cfs_quota_us: invalid argument: unknown
     Warning  BackOff    3m (x8 over 4m22s)     kubelet            Back-off restarting failed container
     Normal   Pulling    2m45s (x5 over 4m39s)  kubelet            Pulling image "ubuntu"
   ```

2. Delete the `rabbit` Pod.

   Once deleted, wait for the pod to fully terminate.

   Check

   - Delete Pod rabbit

   ```
   kubectl delete pod rabbit 
   pod "rabbit" deleted
   ```

3. Another pod called `elephant` has been deployed in the default namespace. It fails to get to a running state. Inspect this pod and identify the `Reason` why it is not running.

   - **OOMKilled**
   - Ready
   - Running
   - CrashLoopBackOff

   ```
   kubectl describe pod elephant | grep -i state -A 5
       State:          Waiting
         Reason:       CrashLoopBackOff
       Last State:     Terminated
         Reason:       OOMKilled
         Exit Code:    1
         Started:      Thu, 05 Jan 2023 10:43:06 +0000
         Finished:     Thu, 05 Jan 2023 10:43:06 +0000
       Ready:          False
   ```

4. The status `OOMKilled` indicates that it is failing because the pod ran out of memory. Identify the memory limit set on the POD.

   Ok

5. The `elephant` pod runs a process that consumes 15Mi of memory. Increase the limit of the `elephant` pod to 20Mi.

   Delete and recreate the pod if required. Do not modify anything other than the required fields.

   Check

   - Pod Name: elephant
   - Image Name: polinux/stress
   - Memory Limit: 20Mi

   

   Create the file `elephant.yaml` by running command `kubectl get po elephant -o yaml > elephant.yaml` and edit the file such as memory limit is set to `20Mi` as follows:

   ```yaml
   ---
   apiVersion: v1
   kind: Pod
   metadata:
     name: elephant
     namespace: default
   spec:
     containers:
     - args:
       - --vm
       - "1"
       - --vm-bytes
       - 15M
       - --vm-hang
       - "1"
       command:
       - stress
       image: polinux/stress
       name: mem-stress
       resources:
         limits:
           memory: 20Mi
         requests:
           memory: 5Mi
   ```

   then run `kubectl replace -f elephant.yaml --force`. This

   ```
   kubectl describe pod elephant | grep -i state -A 5
       State:          Running
         Started:      Thu, 05 Jan 2023 10:53:41 +0000
       Ready:          True
       Restart Count:  0
       Limits:
         memory:  20Mi
   ```

6. Inspect the status of POD. Make sure it's running

   ```
   kubectl get pods
   NAME       READY   STATUS    RESTARTS   AGE
   elephant   1/1     Running   0          4m31s
   ```

7. Delete the `elephant` Pod.

   Once deleted, wait for the pod to fully terminate.

   Check

   - Delete Pod elephant

   ```
   kubectl delete pod elephant 
   pod "elephant" deleted
   
   kubectl get pods
   No resources found in default namespace.
   ```



## PRACTICE TEST DAEMONSETS

1. How many `DaemonSets` are created in the cluster in all namespaces?

   Check all namespaces

   - **2**
   - 4
   - 3
   - 1

   ```
   kubectl get daemonsets --all-namespaces 
   NAMESPACE     NAME              DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
   kube-system   kube-flannel-ds   1         1         1       1            1           <none>                   5m47s
   kube-system   kube-proxy        1         1         1       1            1           kubernetes.io/os=linux   5m49s
   ```

2. Which namespace are the `DaemonSets` created in?

   - **kube-system**
   - kube-proxy
   - default
   - kube-public
   - weave-net

   ```
   kubectl get daemonsets --all-namespaces 
   NAMESPACE     NAME              DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
   kube-system   kube-flannel-ds   1         1         1       1            1           <none>                   5m47s
   kube-system   kube-proxy        1         1         1       1            1           kubernetes.io/os=linux   5m49s
   ```

3. Which of the below is a `DaemonSet`?

   - **kube-flannel-ds**
   - scheduler
   - etcd-master
   - coredns

   ```
   kubectl get daemonsets --all-namespaces 
   NAMESPACE     NAME              DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
   kube-system   kube-flannel-ds   1         1         1       1            1           <none>                   5m47s
   kube-system   kube-proxy        1         1         1       1            1           kubernetes.io/os=linux   5m49s
   ```

4. On how many nodes are the pods scheduled by the **DaemonSet** `kube-proxy`

   - **1**
   - 0
   - 2
   - 3

   ```
   kubectl describe daemonsets.apps kube-proxy --namespace=kube-system 
   Name:           kube-proxy
   Selector:       k8s-app=kube-proxy
   Node-Selector:  kubernetes.io/os=linux
   Labels:         k8s-app=kube-proxy
   Annotations:    deprecated.daemonset.template.generation: 1
   Desired Number of Nodes Scheduled: 1
   Current Number of Nodes Scheduled: 1
   Number of Nodes Scheduled with Up-to-date Pods: 1
   Number of Nodes Scheduled with Available Pods: 1
   Number of Nodes Misscheduled: 0
   Pods Status:  1 Running / 0 Waiting / 0 Succeeded / 0 Failed
   Pod Template:
     Labels:           k8s-app=kube-proxy
     Service Account:  kube-proxy
     Containers:
      kube-proxy:
       Image:      k8s.gcr.io/kube-proxy:v1.24.0
       Port:       <none>
       Host Port:  <none>
       Command:
         /usr/local/bin/kube-proxy
         --config=/var/lib/kube-proxy/config.conf
         --hostname-override=$(NODE_NAME)
       Environment:
         NODE_NAME:   (v1:spec.nodeName)
       Mounts:
         /lib/modules from lib-modules (ro)
         /run/xtables.lock from xtables-lock (rw)
         /var/lib/kube-proxy from kube-proxy (rw)
     Volumes:
      kube-proxy:
       Type:      ConfigMap (a volume populated by a ConfigMap)
       Name:      kube-proxy
       Optional:  false
      xtables-lock:
       Type:          HostPath (bare host directory volume)
       Path:          /run/xtables.lock
       HostPathType:  FileOrCreate
      lib-modules:
       Type:               HostPath (bare host directory volume)
       Path:               /lib/modules
       HostPathType:       
     Priority Class Name:  system-node-critical
   Events:
     Type    Reason            Age   From                  Message
     ----    ------            ----  ----                  -------
     Normal  SuccessfulCreate  10m   daemonset-controller  Created pod: kube-proxy-5njf9
   ```

5. What is the image used by the POD deployed by the `kube-flannel-ds` **DaemonSet**?

   - **quay.io/coreos/flannel:v0.13.1-rc1**
   - nginx
   - weave-kube:2.0
   - weave-kube:2.4

   ```
   kubectl describe daemonsets.apps kube-flannel-ds --namespace=kube-system | grep  -i image -A 5
       Image:      quay.io/coreos/flannel:v0.13.1-rc1
       Port:       <none>
       Host Port:  <none>
       Command:
         cp
       Args:
   --
       Image:      quay.io/coreos/flannel:v0.13.1-rc1
       Port:       <none>
       Host Port:  <none>
       Command:
         /opt/bin/flanneld
       Args:
   ```

6. Deploy a **DaemonSet** for `FluentD` Logging.

   Use the given specifications.

   Check

   - Name: elasticsearch
   - Namespace: kube-system
   - Image: k8s.gcr.io/fluentd-elasticsearch:1.20
   
   ```
   kubectl create deployment elasticsearch --image=k8s.gcr.io/fluentd-elasticsearch:1.20 --namespace kube-system --dry-run=client -o yaml > fluentd.yaml
   ```
   
   fluentd.yaml
   
   ```
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     creationTimestamp: null
     labels:
       app: elasticsearch
     name: elasticsearch
     namespace: kube-system
   spec:
     replicas: 1
     selector:
       matchLabels:
         app: elasticsearch
     strategy: {}
     template:
       metadata:
         creationTimestamp: null
         labels:
           app: elasticsearch
       spec:
         containers:
         - image: k8s.gcr.io/fluentd-elasticsearch:1.20
           name: fluentd-elasticsearch
           resources: {}
   status: {}
   ```
   
   Edit fluentd.yaml to this
   
   ```
   apiVersion: apps/v1
   kind: DaemonSet
   metadata:
     labels:
       app: elasticsearch
     name: elasticsearch
     namespace: kube-system
   spec:
     selector:
       matchLabels:
         app: elasticsearch
     template:
       metadata:
         creationTimestamp: null
         labels:
           app: elasticsearch
       spec:
         containers:
         - image: k8s.gcr.io/fluentd-elasticsearch:1.20
           name: fluentd-elasticsearch
   ```
   
   ```
   $ kubectl create -f fluentd.yaml 
   daemonset.apps/elasticsearch created
   ```



## PRACTICE TEST – STATIC PODS



1. How many static pods exist in this cluster in all namespaces?

   - 3
   - 2
   - **4**
   - 1

   Run the command `kubectl get pods --all-namespaces` and look for those with `-controlplane` appended in the name

   ```
   kubectl get pods --all-namespaces 
   NAMESPACE     NAME                                   READY   STATUS    RESTARTS   AGE
   kube-system   coredns-6d4b75cb6d-m2pl8               1/1     Running   0          19m
   kube-system   coredns-6d4b75cb6d-pjgwx               1/1     Running   0          19m
   kube-system   etcd-controlplane                      1/1     Running   0          19m
   kube-system   kube-apiserver-controlplane            1/1     Running   0          19m
   kube-system   kube-controller-manager-controlplane   1/1     Running   0          19m
   kube-system   kube-flannel-ds-qm8mt                  1/1     Running   0          19m
   kube-system   kube-flannel-ds-qmx5j                  1/1     Running   0          19m
   kube-system   kube-proxy-56xvv                       1/1     Running   0          19m
   kube-system   kube-proxy-7bf62                       1/1     Running   0          19m
   kube-system   kube-scheduler-controlplane            1/1     Running   0          19m
   ```

2. Which of the below components is NOT deployed as a static pod?

   - kube-controller-manager
   - kube-apiserver
   - etcd
   - **coredns**

   Run `kubectl get pods --all-namespaces` and look for the pod from the list that does not end with `-controlplane`

   The `coredns` pods are created as part of the `coredns` deployment and hence, it is not a static pod.

   ```
    kubectl get pods --all-namespaces 
   NAMESPACE     NAME                                   READY   STATUS    RESTARTS   AGE
   kube-system   coredns-6d4b75cb6d-m2pl8               1/1     Running   0          19m
   kube-system   coredns-6d4b75cb6d-pjgwx               1/1     Running   0          19m
   kube-system   etcd-controlplane                      1/1     Running   0          19m
   kube-system   kube-apiserver-controlplane            1/1     Running   0          19m
   kube-system   kube-controller-manager-controlplane   1/1     Running   0          19m
   kube-system   kube-flannel-ds-qm8mt                  1/1     Running   0          19m
   kube-system   kube-flannel-ds-qmx5j                  1/1     Running   0          19m
   kube-system   kube-proxy-56xvv                       1/1     Running   0          19m
   kube-system   kube-proxy-7bf62                       1/1     Running   0          19m
   kube-system   kube-scheduler-controlplane            1/1     Running   0          19m
   ```

3. Which of the below components is NOT deployed as a static POD?

   - kube-scheduler
   - **kube-proxy**
   - kube-controller-manager
   - kube-apiserver

   Run `kubectl get pods --all-namespaces` and look for the pod from the list that does not end with `-controlplane`

   `kube-proxy` is deployed as a `DaemonSet` and hence, it is not a staic pod.

   ```
    kubectl get pods --all-namespaces 
   NAMESPACE     NAME                                   READY   STATUS    RESTARTS   AGE
   kube-system   coredns-6d4b75cb6d-m2pl8               1/1     Running   0          19m
   kube-system   coredns-6d4b75cb6d-pjgwx               1/1     Running   0          19m
   kube-system   etcd-controlplane                      1/1     Running   0          19m
   kube-system   kube-apiserver-controlplane            1/1     Running   0          19m
   kube-system   kube-controller-manager-controlplane   1/1     Running   0          19m
   kube-system   kube-flannel-ds-qm8mt                  1/1     Running   0          19m
   kube-system   kube-flannel-ds-qmx5j                  1/1     Running   0          19m
   kube-system   kube-proxy-56xvv                       1/1     Running   0          19m
   kube-system   kube-proxy-7bf62                       1/1     Running   0          19m
   kube-system   kube-scheduler-controlplane            1/1     Running   0          19m
   ```

4. On which nodes are the static pods created currently?

   - controlplane & node01
   - node01
   - All Nodes
   - **controlplane**

   Run the `kubectl get pods --all-namespaces -o wide` and identify the node in which static pods are deployed.

   By default, `static pods` are created for the controlplane components and hence, they are only created in the `controlplane` node.

   ```
   kubectl get pods --all-namespaces -o wide
   NAMESPACE     NAME                                   READY   STATUS    RESTARTS   AGE   IP            NODE           NOMINATED NODE   READINESS GATES
   kube-system   coredns-6d4b75cb6d-m2pl8               1/1     Running   0          28m   10.244.0.2    controlplane   <none>           <none>
   kube-system   coredns-6d4b75cb6d-pjgwx               1/1     Running   0          28m   10.244.0.3    controlplane   <none>           <none>
   kube-system   etcd-controlplane                      1/1     Running   0          29m   10.16.72.12   controlplane   <none>           <none>
   kube-system   kube-apiserver-controlplane            1/1     Running   0          29m   10.16.72.12   controlplane   <none>           <none>
   kube-system   kube-controller-manager-controlplane   1/1     Running   0          29m   10.16.72.12   controlplane   <none>           <none>
   kube-system   kube-flannel-ds-qm8mt                  1/1     Running   0          28m   10.16.72.3    node01         <none>           <none>
   kube-system   kube-flannel-ds-qmx5j                  1/1     Running   0          28m   10.16.72.12   controlplane   <none>           <none>
   kube-system   kube-proxy-56xvv                       1/1     Running   0          28m   10.16.72.3    node01         <none>           <none>
   kube-system   kube-proxy-7bf62                       1/1     Running   0          28m   10.16.72.12   controlplane   <none>           <none>
   kube-system   kube-scheduler-controlplane            1/1     Running   0          29m   10.16.72.12   controlplane   <none>           <none>
   ```

   

5. What is the path of the directory holding the static pod definition files?

   - /etc/kubelet/manifests
   - **/etc/kubernetes/manifests**
   - /etc/kubernetes/pods
   - /var/kubelet/manifests

   First idenity the kubelet config file:

   ```
   controlplane ~ ➜ ps -aux | grep /usr/bin/kubelet
   root        2359  0.0  0.0 4301928 101892 ?      Ssl  02:39   0:51 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config=/var/lib/kubelet/config.yaml --container-runtime=remote --container-runtime-endpoint=unix:///var/run/containerd/containerd.sock --pod-infra-container-image=k8s.gcr.io/pause:3.7
   root        9216  0.0  0.0  13448  1072 pts/0    S+   03:13   0:00 grep /usr/bin/kubelet
   ```

   From the output we can see that the kubelet config file used is `/var/lib/kubelet/config.yaml`

   Next, lookup the value assigned for `staticPodPath`:

   ```
   controlplane ~ ➜ grep -i staticpod /var/lib/kubelet/config.yaml 
   staticPodPath: /etc/kubernetes/manifests
   ```

   

6. How many pod definition files are present in the manifests folder?

   - 2
   - 1
   - 4
   - 3

   Count the number of files under `/etc/kubernetes/manifests`

   ```
   controlplane ~ ➜  ls -l /etc/kubernetes/manifests/
   total 16
   -rw------- 1 root root 2263 Jan  6 02:39 etcd.yaml
   -rw------- 1 root root 3849 Jan  6 02:39 kube-apiserver.yaml
   -rw------- 1 root root 3365 Jan  6 02:39 kube-controller-manager.yaml
   -rw------- 1 root root 1435 Jan  6 02:39 kube-scheduler.yaml
   ```

   

7. What is the docker image used to deploy the kube-api server as a static pod?

   - **k8s.gcr.io/kube-apiserver:v1.24.0**
   - docker.io/kube-apiserver-amd64:v1.11.3
   - k8s.gcr.io/kube-apiserver-amd64:v1.10.3

   Check the image defined in the `/etc/kubernetes/manifests/kube-apiserver.yaml` manifest file.

   ```
   cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep -i image -A 10
       image: k8s.gcr.io/kube-apiserver:v1.24.0
       imagePullPolicy: IfNotPresent
       livenessProbe:
         failureThreshold: 8
         httpGet:
           host: 10.16.72.12
           path: /livez
           port: 6443
           scheme: HTTPS
         initialDelaySeconds: 10
         periodSeconds: 10
         timeoutSeconds: 15
   ```

8. Create a static pod named `static-busybox` that uses the `busybox` image and the command `sleep 1000`

   Check

   - Name: static-busybox
   - Image: busybox

   ```
   kubectl run --restart=Never --image=busybox static-busybox --dry-run=client -o yaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml
   ```

   

9. Edit the image on the static pod to use `busybox:1.28.4`

   Check

   - Name: static-busybox
   - Image: busybox:1.28.4

   Edit  /etc/kubernetes/manifests/static-busybox.yaml

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     creationTimestamp: null
     labels:
       run: static-busybox
     name: static-busybox
   spec:
     containers:
     - command:
       - sleep
       - "1000"
       image: busybox:1.28.4
       name: static-busybox
       resources: {}
     dnsPolicy: ClusterFirst
     restartPolicy: Never
   status: {}
   ```

10. We just created a new static pod named **static-greenbox**. Find it and delete it.

   This question is a bit tricky. But if you use the knowledge you gained in the previous questions in this lab, you should be able to find the answer to it.

   Check

   - Static pod deleted

   First, let's identify the node in which the pod called **static-greenbox** is created. To do this, run:

   ```
   root@controlplane:~# kubectl get pods --all-namespaces -o wide  | grep static-greenbox
   default       static-greenbox-node01                 1/1     Running   0          19s     10.244.1.2   node01       <none>           <none>
   root@controlplane:~#
   ```

   From the result of this command, we can see that the pod is running on node01.

   

   Next, SSH to `node01` and identify the path configured for static pods in this node.
   `Important`: The path need not be `/etc/kubernetes/manifests`. Make sure to check the path configured in the kubelet configuration file.

   ```
   root@controlplane:~# ssh node01 
   root@node01:~# ps -ef |  grep /usr/bin/kubelet 
   root       752   654  0 00:30 pts/0    00:00:00 grep --color=auto /usr/bin/kubelet
   root     28567     1  0 00:22 ?        00:00:11 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config=/var/lib/kubelet/config.yaml --network-plugin=cni --pod-infra-container-image=k8s.gcr.io/pause:3.2
   root@node01:~# grep -i staticpod /var/lib/kubelet/config.yaml
   staticPodPath: /etc/just-to-mess-with-you
   root@node01:~# 
   ```

   Here the staticPodPath is `/etc/just-to-mess-with-you`

   Navigate to this directory and delete the YAML file:

   ```
   root@node01:/etc/just-to-mess-with-you# ls
   greenbox.yaml
   root@node01:/etc/just-to-mess-with-you# rm -rf greenbox.yaml 
   root@node01:/etc/just-to-mess-with-you#
   ```

   Exit out of node01 using `CTRL + D` or type `exit`. You should return to the `controlplane` node. Check if the `static-greenbox` pod has been deleted:

   ```
   root@controlplane:~# kubectl get pods --all-namespaces -o wide  | grep static-greenbox
   root@controlplane:~# 
   ```



## PRACTICE TEST MULTIPLE SCHEDULERS



1. What is the name of the POD that deploys the default kubernetes scheduler in this environment?

   - etcd-master
   - **kube-scheduler-controlplane**
   - scheduler
   - kube-scheduler

   ```
   ➜  kubectl get pods --namespace=kube-system
   NAME                                   READY   STATUS    RESTARTS   AGE
   coredns-6d4b75cb6d-8n6vr               1/1     Running   0          7m9s
   coredns-6d4b75cb6d-chspc               1/1     Running   0          7m9s
   etcd-controlplane                      1/1     Running   0          7m21s
   kube-apiserver-controlplane            1/1     Running   0          7m21s
   kube-controller-manager-controlplane   1/1     Running   0          7m21s
   kube-flannel-ds-l27d2                  1/1     Running   0          7m9s
   kube-proxy-bxv8h                       1/1     Running   0          7m9s
   kube-scheduler-controlplane            1/1     Running   0          7m21s
   ```

2. What is the image used to deploy the kubernetes scheduler?

   Inspect the kubernetes scheduler pod and identify the image

   - scheduler:1.0
   - kube-scheduler:1.13
   - **k8s.gcr.io/kube-scheduler:v1.24.0**

   ```
   kubectl describe pod --namespace kube-system kube-scheduler-controlplane | grep -i image
       Image:         k8s.gcr.io/kube-scheduler:v1.24.0
       Image ID:      k8s.gcr.io/kube-scheduler@sha256:db842a7c431fd51db7e1911f6d1df27a7b6b6963ceda24852b654d2cd535b776
   ```

3. We have already created the `ServiceAccount` and `ClusterRoleBinding` that our custom scheduler will make use of.

   Checkout the following Kubernetes objects:

   `ServiceAccount`: my-scheduler (kube-system namespace)
   `ClusterRoleBinding`: my-scheduler-as-kube-scheduler
   `ClusterRoleBinding`: my-scheduler-as-volume-scheduler

   Run the command: `kubectl get serviceaccount -n kube-system` and `kubectl get clusterrolebinding`

   **Note: -** Don't worry if you are not familiar with these resources. We will cover it later on.

   Ok

4. Let's create a configmap that the new scheduler will employ using the concept of `ConfigMap as a volume`.
   We have already given a configMap definition file called `my-scheduler-configmap.yaml` at `/root/` path that will create a configmap with name `my-scheduler-config` using the content of file `/root/my-scheduler-config.yaml`.

   Check

   - ConfigMap my-scheduler-config created ?

   my-scheduler-configmap.yaml

   ```
   apiVersion: v1
   data:
     my-scheduler-config.yaml: |
       apiVersion: kubescheduler.config.k8s.io/v1beta2
       kind: KubeSchedulerConfiguration
       profiles:
         - schedulerName: my-scheduler
       leaderElection:
         leaderElect: false
   kind: ConfigMap
   metadata:
     creationTimestamp: null
     name: my-scheduler-config
     namespace: kube-system
   ```

   ```
   kubectl create -f my-scheduler-configmap.yaml 
   configmap/my-scheduler-config created
   ```

5. Deploy an additional scheduler to the cluster following the given specification.

   Use the manifest file provided at `/root/my-scheduler.yaml`. Use the same image as used by the default kubernetes scheduler.

   Check

   - Name: my-scheduler
   - Status: Running
   - Correct image used?

   Use the file at `/root/my-scheduler.yaml` to create your own scheduler with correct image.

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     labels:
       run: my-scheduler
     name: my-scheduler
     namespace: kube-system
   spec:
     serviceAccountName: my-scheduler
     containers:
     - command:
       - /usr/local/bin/kube-scheduler
       - --config=/etc/kubernetes/my-scheduler/my-scheduler-config.yaml
       image: k8s.gcr.io/kube-scheduler:v1.24.0
       livenessProbe:
         httpGet:
           path: /healthz
           port: 10259
           scheme: HTTPS
         initialDelaySeconds: 15
       name: kube-second-scheduler
       readinessProbe:
         httpGet:
           path: /healthz
           port: 10259
           scheme: HTTPS
       resources:
         requests:
           cpu: '0.1'
       securityContext:
         privileged: false
       volumeMounts:
         - name: config-volume
           mountPath: /etc/kubernetes/my-scheduler
     hostNetwork: false
     hostPID: false
     volumes:
       - name: config-volume
         configMap:
           name: my-scheduler-config
   ```

   ```
   kubectl create -f my-scheduler.yaml 
   pod/my-scheduler created
   ```

6. A POD definition file is given. Use it to create a POD with the new custom scheduler.

   File is located at `/root/nginx-pod.yaml`

   Check

   - Uses custom scheduler
   - Status: Running

   Edit nginx-pod.yaml and "schedulerName: my-scheduler" 

   ```
   apiVersion: v1 
   kind: Pod 
   metadata:
     name: nginx 
   spec:
     schedulerName: my-scheduler	
     containers:
     - image: nginx
       name: nginx
   ```

   ```
   kubectl create -f nginx-pod.yaml 
   pod/nginx created
   ```



# LOGGING & MONITORING

## PRACTICE TEST MONITOR CLUSTER COMPONENTS



1. We have deployed a few PODs running workloads. Inspect them.

   Wait for the pods to be ready before proceeding to the next question.

   Ok

2. Let us deploy metrics-server to monitor the PODs and Nodes. Pull the git repository for the deployment files.

   Run: `git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git`

   Ok

3. Deploy the metrics-server by creating all the components downloaded.

   Run the `kubectl create -f .` command from within the downloaded repository.

   Check

   - Metrics server deployed?

   ```
   # cd kubernetes-metrics-server/
   # kubectl create -f .
   clusterrole.rbac.authorization.k8s.io/system:aggregated-metrics-reader created
   clusterrolebinding.rbac.authorization.k8s.io/metrics-server:system:auth-delegator created
   rolebinding.rbac.authorization.k8s.io/metrics-server-auth-reader created
   apiservice.apiregistration.k8s.io/v1beta1.metrics.k8s.io created
   serviceaccount/metrics-server created
   deployment.apps/metrics-server created
   service/metrics-server created
   clusterrole.rbac.authorization.k8s.io/system:metrics-server created
   clusterrolebinding.rbac.authorization.k8s.io/system:metrics-server created
   ```

   

4. It takes a few minutes for the metrics server to start gathering data.

   Run the `kubectl top node` command and wait for a valid output.

   Ok

   ```
   kubectl top node
   NAME           CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
   controlplane   297m         0%     1189Mi          0%        
   node01         55m          0%     300Mi           0%        
   ```

5. Identify the node that consumes the `most` CPU.

   - node03
   - node02
   - node01
   - **controlplane**

   ```
   kubectl top node --sort-by='cpu' --no-headers | head -1               
   controlplane   330m   0%    1195Mi   0%    
   ```

6. Identify the node that consumes the `most` Memory.

   - node03
   - node01
   - node02
   - **controlplane**

   ```
   kubectl top node --sort-by='memory' --no-headers | head -1               
   controlplane   314m   0%    1197Mi   0%    
   ```

7. Identify the POD that consumes the `most` Memory.

   - lion
   - **rabbit**
   - tiger
   - elephant

   ```
   kubectl top pod --sort-by='memory' --no-headers | head -1               
   rabbit     132m   252Mi   
   ```

8. Identify the POD that consumes the `least` CPU.

   - rabbit
   - elephant
   - tiger
   - **lion**

   ```
   kubectl top pod --sort-by='cpu' --no-headers | tail -1               
   lion       1m     18Mi    
   ```




## PRACTICE TEST MANAGING APPLICATION LOGS

1. We have deployed a POD hosting an application. Inspect it. Wait for it to start.

   Ok

2. A user - `USER5` - has expressed concerns accessing the application. Identify the cause of the issue.

   Inspect the logs of the POD

   - Application Crashed
   - Account does not exist
   - Item Out of Stock
   - **Account Locked due to Many Failed Attempts**

   Run: `kubectl logs webapp-1` and identify the log recorded for `USER5`

   ```
   kubectl logs webapp-1 | grep USER5 
   [2023-01-06 08:43:34,588] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   ```

3. We have deployed a new POD - `webapp-2` - hosting an application. Inspect it. Wait for it to start.

   Ok

4. A user is reporting issues while trying to purchase an item. Identify the user and the cause of the issue.

   Inspect the logs of the webapp in the POD

   - USER2 - Application Crashed
   - USER1 - Item Out of Stock
   - USER4 - Account does not exist
   - **USER30 - Item Out of Stock**

   ```
    kubectl logs webapp-2 -c simple-webapp
   [2023-01-06 08:58:45,636] INFO in event-simulator: USER2 logged in
   [2023-01-06 08:58:46,637] INFO in event-simulator: USER3 logged out
   [2023-01-06 08:58:47,638] INFO in event-simulator: USER4 is viewing page3
   [2023-01-06 08:58:48,639] INFO in event-simulator: USER1 logged in
   [2023-01-06 08:58:49,641] INFO in event-simulator: USER3 is viewing page2
   [2023-01-06 08:58:50,642] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-06 08:58:50,642] INFO in event-simulator: USER3 is viewing page1
   [2023-01-06 08:58:51,643] INFO in event-simulator: USER1 is viewing page3
   [2023-01-06 08:58:52,643] INFO in event-simulator: USER3 logged out
   [2023-01-06 08:58:53,645] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
   ```



# APPLICATION LIFECYCLE MANAGEMENT

## PRACTICE TEST ROLLING UPDATES AND ROLLBACKS



1. We have deployed a simple web application. Inspect the PODs and the Services


   Wait for the application to fully deploy and view the application using the link called `Webapp Portal` above your terminal.

   Ok

   frontend.yaml

   ```
   apiVersion: v1
   items:
   - apiVersion: apps/v1
     kind: Deployment
     metadata:
       annotations:
         deployment.kubernetes.io/revision: "1"
       creationTimestamp: "2023-01-06T09:19:01Z"
       generation: 1
       name: frontend
       namespace: default
       resourceVersion: "806"
       uid: 69c243b9-6a14-464a-b36a-643085fb2721
     spec:
       minReadySeconds: 20
       progressDeadlineSeconds: 600
       replicas: 4
       revisionHistoryLimit: 10
       selector:
         matchLabels:
           name: webapp
       strategy:
         rollingUpdate:
           maxSurge: 25%
           maxUnavailable: 25%
         type: RollingUpdate
       template:
         metadata:
           creationTimestamp: null
           labels:
             name: webapp
         spec:
           containers:
           - image: kodekloud/webapp-color:v1
             imagePullPolicy: IfNotPresent
             name: simple-webapp
             ports:
             - containerPort: 8080
               protocol: TCP
             resources: {}
             terminationMessagePath: /dev/termination-log
             terminationMessagePolicy: File
           dnsPolicy: ClusterFirst
           restartPolicy: Always
           schedulerName: default-scheduler
           securityContext: {}
           terminationGracePeriodSeconds: 30
     status:
       availableReplicas: 4
       conditions:
       - lastTransitionTime: "2023-01-06T09:20:04Z"
         lastUpdateTime: "2023-01-06T09:20:04Z"
         message: Deployment has minimum availability.
         reason: MinimumReplicasAvailable
         status: "True"
         type: Available
       - lastTransitionTime: "2023-01-06T09:19:01Z"
         lastUpdateTime: "2023-01-06T09:20:04Z"
         message: ReplicaSet "frontend-6fb456676" has successfully progressed.
         reason: NewReplicaSetAvailable
         status: "True"
         type: Progressing
       observedGeneration: 1
       readyReplicas: 4
       replicas: 4
       updatedReplicas: 4
   kind: List
   metadata:
     resourceVersion: ""
   ```

   ```
   kubectl create -f frontend.yaml 
   ```

   

2. What is the current color of the web application?

   Access the Webapp Portal.

   - red
   - green
   - **blue**
   - yellow
   - orange

3. Run the script named `curl-test.sh` to send multiple requests to test the web application. Take a note of the output.

   Execute the script at `/root/curl-test.sh`.

   Ok

   curl-test.sh 

   ```
   for i in {1..35}; do
      kubectl exec --namespace=kube-public curl -- sh -c 'test=`wget -qO- -T 2  http://webapp-service.default.svc.cluster.local:8080/info 2>&1` && echo "$test OK" || echo "Failed"';
      echo ""
   done
   ```

4. Inspect the deployment and identify the number of PODs deployed by it

   - 2
   - 5
   - **4**
   - 1
   - 3

   Run the command `kubectl describe deployment` and look at `Desired Replicas`

   ```
   kubectl describe deployments.apps frontend 
   Name:                   frontend
   Namespace:              default
   CreationTimestamp:      Fri, 06 Jan 2023 09:19:01 +0000
   Labels:                 <none>
   Annotations:            deployment.kubernetes.io/revision: 1
   Selector:               name=webapp
   Replicas:               4 desired | 4 updated | 4 total | 4 available | 0 unavailable
   StrategyType:           RollingUpdate
   MinReadySeconds:        20
   RollingUpdateStrategy:  25% max unavailable, 25% max surge
   Pod Template:
     Labels:  name=webapp
     Containers:
      simple-webapp:
       Image:        kodekloud/webapp-color:v1
       Port:         8080/TCP
       Host Port:    0/TCP
       Environment:  <none>
       Mounts:       <none>
     Volumes:        <none>
   Conditions:
     Type           Status  Reason
     ----           ------  ------
     Available      True    MinimumReplicasAvailable
     Progressing    True    NewReplicaSetAvailable
   OldReplicaSets:  <none>
   NewReplicaSet:   frontend-6fb456676 (4/4 replicas created)
   Events:
     Type    Reason             Age   From                   Message
     ----    ------             ----  ----                   -------
     Normal  ScalingReplicaSet  47m   deployment-controller  Scaled up replica set frontend-6fb456676 to 4
   ```

5. What container image is used to deploy the applications?

   - kodekloud/webapp-color:v2
   - kodekloud
   - simple-webapp
   - webapp
   - **kodekloud/webapp-color:v1**

   Run the command `kubectl describe deployment` and look for `Images`

   ```
   kubectl describe deployments.apps frontend 
   Name:                   frontend
   Namespace:              default
   CreationTimestamp:      Fri, 06 Jan 2023 09:19:01 +0000
   Labels:                 <none>
   Annotations:            deployment.kubernetes.io/revision: 1
   Selector:               name=webapp
   Replicas:               4 desired | 4 updated | 4 total | 4 available | 0 unavailable
   StrategyType:           RollingUpdate
   MinReadySeconds:        20
   RollingUpdateStrategy:  25% max unavailable, 25% max surge
   Pod Template:
     Labels:  name=webapp
     Containers:
      simple-webapp:
       Image:        kodekloud/webapp-color:v1
       Port:         8080/TCP
       Host Port:    0/TCP
       Environment:  <none>
       Mounts:       <none>
     Volumes:        <none>
   Conditions:
     Type           Status  Reason
     ----           ------  ------
     Available      True    MinimumReplicasAvailable
     Progressing    True    NewReplicaSetAvailable
   OldReplicaSets:  <none>
   NewReplicaSet:   frontend-6fb456676 (4/4 replicas created)
   Events:
     Type    Reason             Age   From                   Message
     ----    ------             ----  ----                   -------
     Normal  ScalingReplicaSet  47m   deployment-controller  Scaled up replica set frontend-6fb456676 to 4
   ```

6. Inspect the deployment and identify the current strategy

   - RollBack
   - RollOut
   - **RollingUpdate**
   - ReCreate

   Run the command `kubectl describe deployment` and look at `StrategyType`

   ```
   kubectl describe deployments.apps frontend 
   Name:                   frontend
   Namespace:              default
   CreationTimestamp:      Fri, 06 Jan 2023 09:19:01 +0000
   Labels:                 <none>
   Annotations:            deployment.kubernetes.io/revision: 1
   Selector:               name=webapp
   Replicas:               4 desired | 4 updated | 4 total | 4 available | 0 unavailable
   StrategyType:           RollingUpdate
   MinReadySeconds:        20
   RollingUpdateStrategy:  25% max unavailable, 25% max surge
   Pod Template:
     Labels:  name=webapp
     Containers:
      simple-webapp:
       Image:        kodekloud/webapp-color:v1
       Port:         8080/TCP
       Host Port:    0/TCP
       Environment:  <none>
       Mounts:       <none>
     Volumes:        <none>
   Conditions:
     Type           Status  Reason
     ----           ------  ------
     Available      True    MinimumReplicasAvailable
     Progressing    True    NewReplicaSetAvailable
   OldReplicaSets:  <none>
   NewReplicaSet:   frontend-6fb456676 (4/4 replicas created)
   Events:
     Type    Reason             Age   From                   Message
     ----    ------             ----  ----                   -------
     Normal  ScalingReplicaSet  47m   deployment-controller  Scaled up replica set frontend-6fb456676 to 4
   ```

7. If you were to upgrade the application now what would happen?

   - All PODs are taken down before upgrading any
   - **PODs are upgraded few at a time**

8. Let us try that. Upgrade the application by setting the image on the deployment to `kodekloud/webapp-color:v2`

   Do not delete and re-create the deployment. Only set the new image name for the existing deployment.

   Check

   - Deployment Name: frontend
   - Deployment Image: kodekloud/webapp-color:v2

   Run the command `kubectl edit deployment frontend` and modify the image to `kodekloud/webapp-color:v2`.
   Next, save and exit. The pods should be recreated with the new image.

9. Run the script `curl-test.sh` again. Notice the requests now hit both the old and newer versions. However none of them fail.

   Execute the script at `/root/curl-test.sh`.

   Ok

10. Up to how many PODs can be down for upgrade at a time

    Consider the current strategy settings and number of PODs - 4

    - 3
    - 4
    - **1**
    - 2

    Look at the Max Unavailable value under RollingUpdateStrategy in deployment details

    ```
    kubectl describe deployments.apps frontend 
    Name:                   frontend
    Namespace:              default
    CreationTimestamp:      Fri, 06 Jan 2023 09:19:01 +0000
    Labels:                 <none>
    Annotations:            deployment.kubernetes.io/revision: 2
    Selector:               name=webapp
    Replicas:               4 desired | 4 updated | 5 total | 3 available | 2 unavailable
    StrategyType:           RollingUpdate
    MinReadySeconds:        20
    RollingUpdateStrategy:  25% max unavailable, 25% max surge
    Pod Template:
      Labels:  name=webapp
      Containers:
       simple-webapp:
        Image:        kodekloud/webapp-color:v2
        Port:         8080/TCP
        Host Port:    0/TCP
        Environment:  <none>
        Mounts:       <none>
      Volumes:        <none>
    Conditions:
      Type           Status  Reason
      ----           ------  ------
      Available      True    MinimumReplicasAvailable
      Progressing    True    ReplicaSetUpdated
    OldReplicaSets:  frontend-6fb456676 (1/1 replicas created)
    NewReplicaSet:   frontend-6566d7d589 (4/4 replicas created)
    Events:
      Type    Reason             Age   From                   Message
      ----    ------             ----  ----                   -------
      Normal  ScalingReplicaSet  58m   deployment-controller  Scaled up replica set frontend-6fb456676 to 4
      Normal  ScalingReplicaSet  112s  deployment-controller  Scaled up replica set frontend-6566d7d589 to 1
      Normal  ScalingReplicaSet  112s  deployment-controller  Scaled down replica set frontend-6fb456676 to 3 from 4
      Normal  ScalingReplicaSet  112s  deployment-controller  Scaled up replica set frontend-6566d7d589 to 2 from 1
      Normal  ScalingReplicaSet  52s   deployment-controller  Scaled down replica set frontend-6fb456676 to 1 from 3
      Normal  ScalingReplicaSet  52s   deployment-controller  Scaled up replica set frontend-6566d7d589 to 4 from 2
    ```

11. Change the deployment strategy to `Recreate`

    Delete and re-create the deployment if necessary. Only update the strategy type for the existing deployment.

    Check

    - Deployment Name: frontend
    - Deployment Image: kodekloud/webapp-color:v2
    - Strategy: Recreate

    Run the command `kubectl edit deployment frontend` and modify the required field. Make sure to delete the properties of rollingUpdate as well, set at `strategy.rollingUpdate`.

    ```
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: frontend
      namespace: default
    spec:
      replicas: 4
      selector:
        matchLabels:
          name: webapp
      strategy:
        type: Recreate
      template:
        metadata:
          labels:
            name: webapp
        spec:
          containers:
          - image: kodekloud/webapp-color:v2
            name: simple-webapp
            ports:
            - containerPort: 8080
              protocol: TCP
    ```

12. Upgrade the application by setting the image on the deployment to `kodekloud/webapp-color:v3`

    Do not delete and re-create the deployment. Only set the new image name for the existing deployment.

    Check

    - Deployment Name: frontend
    - Deployment Image: kodekloud/webapp-color:v3

    Run the command: `kubectl edit deployment frontend` and modify the image to `kodekloud/webapp-color:v3`.
    Next, save and exit. The pods should be recreated with the new image.

    Note that all pods will be terminated and recreated simultaneously this time.

    ```
    kubectl get pods --watch
    NAME                        READY   STATUS        RESTARTS   AGE
    frontend-6566d7d589-662g7   1/1     Terminating   0          5m19s
    frontend-6566d7d589-fgqm4   1/1     Terminating   0          4m56s
    frontend-6566d7d589-9j8pm   1/1     Terminating   0          5m19s
    frontend-6566d7d589-xj489   1/1     Terminating   0          4m56s
    frontend-6566d7d589-662g7   0/1     Terminating   0          5m35s
    frontend-6566d7d589-662g7   0/1     Terminating   0          5m35s
    frontend-6566d7d589-662g7   0/1     Terminating   0          5m35s
    frontend-6566d7d589-fgqm4   0/1     Terminating   0          5m13s
    frontend-6566d7d589-fgqm4   0/1     Terminating   0          5m13s
    frontend-6566d7d589-fgqm4   0/1     Terminating   0          5m13s
    frontend-6566d7d589-9j8pm   0/1     Terminating   0          5m36s
    frontend-6566d7d589-9j8pm   0/1     Terminating   0          5m36s
    frontend-6566d7d589-9j8pm   0/1     Terminating   0          5m36s
    frontend-6566d7d589-xj489   0/1     Terminating   0          5m13s
    frontend-6566d7d589-xj489   0/1     Terminating   0          5m13s
    frontend-6566d7d589-xj489   0/1     Terminating   0          5m13s
    frontend-544dfbd8bb-48wdg   0/1     Pending       0          0s
    frontend-544dfbd8bb-qn9rs   0/1     Pending       0          0s
    frontend-544dfbd8bb-lvnpb   0/1     Pending       0          0s
    frontend-544dfbd8bb-48wdg   0/1     Pending       0          0s
    frontend-544dfbd8bb-96nwz   0/1     Pending       0          0s
    frontend-544dfbd8bb-qn9rs   0/1     Pending       0          0s
    frontend-544dfbd8bb-lvnpb   0/1     Pending       0          0s
    frontend-544dfbd8bb-96nwz   0/1     Pending       0          0s
    frontend-544dfbd8bb-48wdg   0/1     ContainerCreating   0          1s
    frontend-544dfbd8bb-lvnpb   0/1     ContainerCreating   0          2s
    frontend-544dfbd8bb-qn9rs   0/1     ContainerCreating   0          2s
    frontend-544dfbd8bb-96nwz   0/1     ContainerCreating   0          3s
    frontend-544dfbd8bb-48wdg   1/1     Running             0          4s
    frontend-544dfbd8bb-lvnpb   1/1     Running             0          5s
    frontend-544dfbd8bb-qn9rs   1/1     Running             0          5s
    frontend-544dfbd8bb-96nwz   1/1     Running             0          5s
    ```

13. Run the script `curl-test.sh` again. Notice the failures. Wait for the new application to be ready. Notice that the requests now do not hit both the versions

    Execute the script at `/root/curl-test.sh`.

    Ok



## PRACTICE TEST COMMANDS AND ARGUMENTS

1. How many PODs exist on the system?

   In the current(default) namespace

   - 5
   - 2
   - 0
   - 3
   - **1**
   - 4

   ```
   kubectl get pods
   NAME             READY   STATUS    RESTARTS   AGE
   ubuntu-sleeper   1/1     Running   0          3m7s
   ```

2. What is the command used to run the pod `ubuntu-sleeper`?

   - sleep 3600
   - sleep
   - **sleep 4800**
   - No Command
   - scrip1.sh

   ```
   kubectl describe pod ubuntu-sleeper 
   Name:             ubuntu-sleeper
   Namespace:        default
   Priority:         0
   Service Account:  default
   Node:             controlplane/172.25.1.121
   Start Time:       Fri, 06 Jan 2023 10:31:05 +0000
   Labels:           <none>
   Annotations:      <none>
   Status:           Running
   IP:               10.42.0.9
   IPs:
     IP:  10.42.0.9
   Containers:
     ubuntu:
       Container ID:  containerd://67879040eb3788dff8b5988c72098e98acad6ec6b947aeb4b93494df69784070
       Image:         ubuntu
       Image ID:      docker.io/library/ubuntu@sha256:27cb6e6ccef575a4698b66f5de06c7ecd61589132d5a91d098f7f3f9285415a9
       Port:          <none>
       Host Port:     <none>
       Command:
         sleep
         4800
       State:          Running
         Started:      Fri, 06 Jan 2023 10:31:12 +0000
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-hdwp9 (ro)
   Conditions:
     Type              Status
     Initialized       True 
     Ready             True 
     ContainersReady   True 
     PodScheduled      True 
   Volumes:
     kube-api-access-hdwp9:
       Type:                    Projected (a volume that contains injected data from multiple sources)
       TokenExpirationSeconds:  3607
       ConfigMapName:           kube-root-ca.crt
       ConfigMapOptional:       <nil>
       DownwardAPI:             true
   QoS Class:                   BestEffort
   Node-Selectors:              <none>
   Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                                node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
   Events:
     Type    Reason     Age    From               Message
     ----    ------     ----   ----               -------
     Normal  Scheduled  5m18s  default-scheduler  Successfully assigned default/ubuntu-sleeper to controlplane
     Normal  Pulling    5m17s  kubelet            Pulling image "ubuntu"
     Normal  Pulled     5m12s  kubelet            Successfully pulled image "ubuntu" in 4.931847663s (4.931871827s including waiting)
     Normal  Created    5m12s  kubelet            Created container ubuntu
     Normal  Started    5m12s  kubelet            Started container ubuntu
   ```

   

3. Create a pod with the ubuntu image to run a container to sleep for 5000 seconds. Modify the file `ubuntu-sleeper-2.yaml`.

   Note: Only make the necessary changes. Do not modify the name.

   Check

   - Pod Name: ubuntu-sleeper-2
   - Command: sleep 5000

   ```
   kubectl run ubuntu-sleeper-2 --image ubuntu --dry-run=client -o yaml --command -- sleep 5000 > ubuntu-sleeper-2.yaml
   ```

   ubuntu-sleeper-2.yaml

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     creationTimestamp: null
     labels:
       run: ubuntu-sleeper-2
     name: ubuntu-sleeper-2
   spec:
     containers:
     - command:
       - sleep
       - "5000"
       image: ubuntu
       name: ubuntu-sleeper-2
       resources: {}
     dnsPolicy: ClusterFirst
     restartPolicy: Always
   status: {}
   ```

   ```
   kubectl create -f ubuntu-sleeper-2.yaml 
   pod/ubuntu-sleeper-2 created
   ```

4. Create a pod using the file named `ubuntu-sleeper-3.yaml`. There is something wrong with it. Try to fix it!

   Note: Only make the necessary changes. Do not modify the name.

   Check

   - Pod Name: ubuntu-sleeper-3
   - Command: sleep 1200

   Both `sleep` and `1200` should be defined as a string.

   ubuntu-sleeper-3.yaml

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     creationTimestamp: null
     labels:
       run: ubuntu-sleeper-3
     name: ubuntu-sleeper-3
   spec:
     containers:
     - command:
       - "sleep"
       - "1200"
       image: ubuntu
       name: ubuntu-sleeper-3
       resources: {}
     dnsPolicy: ClusterFirst
     restartPolicy: Always
   status: {}
   ```

   ```
   kubectl create -f ubuntu-sleeper-3.yaml 
   pod/ubuntu-sleeper-3 created
   
   controlplane ~ ➜  kubectl get pods
   NAME               READY   STATUS    RESTARTS   AGE
   ubuntu-sleeper     1/1     Running   0          41m
   ubuntu-sleeper-2   1/1     Running   0          30m
   ubuntu-sleeper-3   1/1     Running   0          15s
   
   controlplane ~ ➜  kubectl describe pod ubuntu-sleeper-3
   Name:             ubuntu-sleeper-3
   Namespace:        default
   Priority:         0
   Service Account:  default
   Node:             controlplane/172.25.1.121
   Start Time:       Fri, 06 Jan 2023 11:12:20 +0000
   Labels:           run=ubuntu-sleeper-3
   Annotations:      <none>
   Status:           Running
   IP:               10.42.0.11
   IPs:
     IP:  10.42.0.11
   Containers:
     ubuntu-sleeper-3:
       Container ID:  containerd://ff7b366d6243e6f722863e14b4d91a69586b241818f1551409d67b831835d070
       Image:         ubuntu
       Image ID:      docker.io/library/ubuntu@sha256:27cb6e6ccef575a4698b66f5de06c7ecd61589132d5a91d098f7f3f9285415a9
       Port:          <none>
       Host Port:     <none>
       Command:
         sleep
         1200
       State:          Running
         Started:      Fri, 06 Jan 2023 11:12:23 +0000
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-dvfzn (ro)
   Conditions:
     Type              Status
     Initialized       True 
     Ready             True 
     ContainersReady   True 
     PodScheduled      True 
   Volumes:
     kube-api-access-dvfzn:
       Type:                    Projected (a volume that contains injected data from multiple sources)
       TokenExpirationSeconds:  3607
       ConfigMapName:           kube-root-ca.crt
       ConfigMapOptional:       <nil>
       DownwardAPI:             true
   QoS Class:                   BestEffort
   Node-Selectors:              <none>
   Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                                node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
   Events:
     Type    Reason     Age   From               Message
     ----    ------     ----  ----               -------
     Normal  Scheduled  38s   default-scheduler  Successfully assigned default/ubuntu-sleeper-3 to controlplane
     Normal  Pulling    36s   kubelet            Pulling image "ubuntu"
     Normal  Pulled     36s   kubelet            Successfully pulled image "ubuntu" in 412.184509ms (412.207605ms including waiting)
     Normal  Created    36s   kubelet            Created container ubuntu-sleeper-3
     Normal  Started    35s   kubelet            Started container ubuntu-sleeper-3
   ```

5. Update pod `ubuntu-sleeper-3` to sleep for 2000 seconds.

   Note: Only make the necessary changes. Do not modify the name of the pod. Delete and recreate the pod if necessary.

   Check

   - Pod Name: ubuntu-sleeper-3
   - Command: sleep 2000

   ubuntu-sleeper-3.yaml

   ```
   piVersion: v1
   kind: Pod
   metadata:
     creationTimestamp: null
     labels:
       run: ubuntu-sleeper-3
     name: ubuntu-sleeper-3
   spec:
     containers:
     - command:
       - "sleep"
       - "2000"
       image: ubuntu
       name: ubuntu-sleeper-3
       resources: {}
     dnsPolicy: ClusterFirst
     restartPolicy: Always
   status: {}
   ```

   ```
   kubectl replace -f ubuntu-sleeper-3.yaml --force 
   pod "ubuntu-sleeper-3" deleted
   pod/ubuntu-sleeper-3 replaced
   ```

6. Inspect the file `Dockerfile` given at `/root/webapp-color` directory. What command is run at container startup?

   - sleep 4800
   - Flask run
   - **python app.py**
   - nginx
   - mysqld

   Inspect the `ENTRYPOINT` in the `Dockerfile`.

   /root/webapp-color/Dockerfile

   ```
   FROM python:3.6-alpine
   
   RUN pip install flask
   
   COPY . /opt/
   
   EXPOSE 8080
   
   WORKDIR /opt
   
   ENTRYPOINT ["python", "app.py"]
   ```

7. Inspect the file `Dockerfile2` given at `/root/webapp-color` directory. What command is run at container startup?

   - **python app.py --color red**
   - python app.py
   - python app.py --color blue

   Inspect the `ENTRYPOINT` and `CMD` in `Dockerfile2`.

   /root/webapp-color/Dockerfile2

   ```
   FROM python:3.6-alpine
   
   RUN pip install flask
   
   COPY . /opt/
   
   EXPOSE 8080
   
   WORKDIR /opt
   
   ENTRYPOINT ["python", "app.py"]
   
   CMD ["--color", "red"]
   ```

8. Inspect the two files under directory `webapp-color-2`. What command is run at container startup?

   Assume the image was created from the `Dockerfile` in this directory.

   - python app.py --color red
   - **--color green**
   - python app.py
   - python app.py --color green

   Since the `entrypoint` is overridden in the pod definition, the `command` that will be run is just `--color green`.

   webapp-color-2/Dockerfile2 

   ```
   FROM python:3.6-alpine
   
   RUN pip install flask
   
   COPY . /opt/
   
   EXPOSE 8080
   
   WORKDIR /opt
   
   ENTRYPOINT ["python", "app.py"]
   
   CMD ["--color", "red"]
   ```

   webapp-color-2/webapp-color-pod.yaml 

   ```
   apiVersion: v1 
   kind: Pod 
   metadata:
     name: webapp-green
     labels:
         name: webapp-green 
   spec:
     containers:
     - name: simple-webapp
       image: kodekloud/webapp-color
       command: ["--color","green"]
   ```

   Since the `entrypoint` is overridden in the pod definition, the `command` that will be run is just `--color green`.

9. Inspect the two files under directory `webapp-color-3`. What command is run at container startup?

   Assume the image was created from the `Dockerfile` in this directory.

   - python app.py --color green
   - --color pink
   - python app.py
   - **python app.py --color pink**

   Inspect the `command` and `args` in the pod definition file.

   webapp-color-3/Dockerfile2 

   ```
   FROM python:3.6-alpine
   
   RUN pip install flask
   
   COPY . /opt/
   
   EXPOSE 8080
   
   WORKDIR /opt
   
   ENTRYPOINT ["python", "app.py"]
   
   CMD ["--color", "red"]
   ```

   webapp-color-3/webapp-color-pod-2.yaml 

   ```
   apiVersion: v1 
   kind: Pod 
   metadata:
     name: webapp-green
     labels:
         name: webapp-green 
   spec:
     containers:
     - name: simple-webapp
       image: kodekloud/webapp-color
       command: ["python", "app.py"]
       args: ["--color", "pink"]
   ```

10. Create a pod with the given specifications. By default it displays a `blue` background. Set the given command line arguments to change it to `green`.

   Check

   - Pod Name: webapp-green
   - Image: kodekloud/webapp-color
   - Command line arguments: --color=green

   webapp-green.yaml

   ```
   apiVersion: v1 
   kind: Pod 
   metadata:
     name: webapp-green
     labels:
         name: webapp-green 
   spec:
     containers:
     - name: simple-webapp
       image: kodekloud/webapp-color
       args: ["--color=green"]
   ```

   ```
   kubectl create -f webapp-green.yaml 
   pod/webapp-green created
   ```

   

## PRACTICE TEST ENV VARIABLES

1. How many PODs exist on the system?

   in the current(default) namespace

   - **1**
   - 3
   - 0
   - 5
   - 2
   - 4

   ```
   kubectl get pods
   NAME           READY   STATUS    RESTARTS   AGE
   webapp-color   1/1     Running   0          52s
   ```

2. What is the environment variable name set on the container in the pod?

   - **APP_COLOR**
   - APP
   - APP-COLOR
   - Sleep
   - pink
   - COLOR

   Run the command `kubectl describe pod` and look for ENV option

   ```
   kubectl describe pod webapp-color | grep -i environment -A 5
       Environment:
         APP_COLOR:  pink
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-ghmf9 (ro)
   Conditions:
     Type              Status
   ```

3. What is the value set on the environment variable `APP_COLOR` on the container in the pod?

   - blue
   - pink
   - APP-COLOR
   - Sleep
   - COLOR
   - green

   Run the command `kubectl describe pod` and look for ENV option

   ```
   kubectl describe pod webapp-color | grep -i environment -A 5
       Environment:
         APP_COLOR:  pink
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-ghmf9 (ro)
   Conditions:
     Type              Status
   ```

4. View the web application UI by clicking on the `Webapp Color` Tab above your terminal.

   This is located on the right side.

   Ok

5. Update the environment variable on the POD to display a `green` background

   Note: Delete and recreate the POD. Only make the necessary changes. Do not modify the name of the Pod.

   Check

   - Pod Name: webapp-color
   - Label Name: webapp-color
   - Env: APP_COLOR=green

   Replace the env variable value to `green`.

   ```
   kubectl edit pods webapp-color 
   ```

   ```
   kubectl replace -f /tmp/kubectl-edit-3810724720.yaml --force 
   pod "webapp-color" deleted
   pod/webapp-color replaced
   ```

6. View the changes to the web application UI by clicking on the `Webapp Color` Tab above your terminal.

   If you already have it open, simply refresh the browser.

   Ok

7. How many `ConfigMaps` exists in the `default` namespace?

   - 0
   - 4
   - **2**
   - 5
   - 1
   - 3

   ```
   kubectl get configmaps 
   NAME               DATA   AGE
   kube-root-ca.crt   1      28m
   db-config          3      35s
   ```

8. Identify the database host from the config map `db-config`

   - 3306
   - DB-Host-01
   - SQL01
   - MY-SQL-SERVER
   - **SQL01.example.com**

   ```
   kubectl describe configmaps db-config 
   Name:         db-config
   Namespace:    default
   Labels:       <none>
   Annotations:  <none>
   
   Data
   ====
   DB_HOST:
   ----
   SQL01.example.com
   DB_NAME:
   ----
   SQL01
   DB_PORT:
   ----
   3306
   
   BinaryData
   ====
   
   Events:  <none>
   ```

9. Create a new ConfigMap for the `webapp-color` POD. Use the spec given below.

   Check

   - ConfigName Name: webapp-config-map
   - Data: APP_COLOR=darkblue

   ```
   kubectl create configmap webapp-config-map --from-literal=APP_COLOR=darkblue
   configmap/webapp-config-map created
   
   controlplane ~ ➜  kubectl get configmaps
   NAME                DATA   AGE
   kube-root-ca.crt    1      34m
   db-config           3      6m31s
   webapp-config-map   1      9s
   ```

10. Update the environment variable on the POD to use the newly created ConfigMap

    Note: Delete and recreate the POD. Only make the necessary changes. Do not modify the name of the Pod.

    Check

    - Pod Name: webapp-color
    - EnvFrom: webapp-config-map

    Update the Pod spec to use the configMap as below:

    ```
    kubectl edit pod webapp-color 
    ```

    ```
    apiVersion: v1
    kind: Pod
    metadata:
      labels:
        name: webapp-color
      name: webapp-color
      namespace: default
    spec:
      containers:
      - envFrom:
        - configMapRef:
             name: webapp-config-map
        image: kodekloud/webapp-color
        name: webapp-color
    ```

    ```
    kubectl replace -f /tmp/kubectl-edit-3565703807.yaml --force 
    pod "webapp-color" deleted
    pod/webapp-color replaced
    ```

11. View the changes to the web application UI by clicking on the `Webapp Color` Tab above your terminal.

    If you already have it open, simply refresh the browser.

    Ok




=======
## PRACTICE TEST SECRETS

1. How many `Secrets` exist on the system?

   In the current(default) namespace.

   - 0
   - 4
   - 3
   - **1**
   - 2

   ```
   kubectl get secrets 
   NAME              TYPE                                  DATA   AGE
   dashboard-token   kubernetes.io/service-account-token   3      63s
   ```

2. How many secrets are defined in the `dashboard-token` secret?

   - **3**
   - 0
   - 1
   - 5
   - 2
   - 4

   ```
   kubectl describe secrets dashboard-token 
   Name:         dashboard-token
   Namespace:    default
   Labels:       <none>
   Annotations:  kubernetes.io/service-account.name: dashboard-sa
                 kubernetes.io/service-account.uid: 70abd0bc-9976-4fd5-ba99-a2bd27562768
   
   Type:  kubernetes.io/service-account-token
   
   Data
   ====
   ca.crt:     566 bytes
   namespace:  7 bytes
   token:      eyJhbGciOiJSUzI1NiIsImtpZCI6Im90YU9PQ2JOY1FNakZYX1lHZzhNUlBrYXk1V2gyMjlYenQ4ZWRXOURrVFEifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImRhc2hib2FyZC10b2tlbiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJkYXNoYm9hcmQtc2EiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiI3MGFiZDBiYy05OTc2LTRmZDUtYmE5OS1hMmJkMjc1NjI3NjgiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6ZGVmYXVsdDpkYXNoYm9hcmQtc2EifQ.klpodtmbTe1NV5YRjec7B9xnWy_rKbkUbXuLe-GT4-gju_-W5WMWyqv6NguzkAhJMh5cZBr2-DQdDK3IajpgHAF_hiybp51_3fEP4l4keVJeS73mSAjlmdoyVUcQA9_s8rdMbKTv3wGhJoeHgsYmg1EoUkNOALkoV5kTD5b7YuEGHtaxa2TztDwb_BqUvduKVn1Uju0G17ODfSotYyN2AjjDfOnJHiDi09L0HvtC5W-p9KkBI_Q6QHdnKSlx0Zwx3qfHXmv7Nj7r3UHnCUvTBauMs0QQPXFM56OXSHdKOO2ERnTOho9q6S0FrTWtLYgHWYjFg6zNxedhcf-7uOAHOw
   ```

3. What is the type of the `dashboard-token` secret?

   - **kubernetes.io/service-account-token**
   - Opaque
   - Secret

   ```
   kubectl describe secrets dashboard-token 
   Name:         dashboard-token
   Namespace:    default
   Labels:       <none>
   Annotations:  kubernetes.io/service-account.name: dashboard-sa
                 kubernetes.io/service-account.uid: 70abd0bc-9976-4fd5-ba99-a2bd27562768
   
   Type:  kubernetes.io/service-account-token
   ```

4. Which of the following is not a secret data defined in `dashboard-token` secret?

   - **type**
   - ca.crt
   - namespace
   - token

   Run the command `kubectl describe secrets dashboard-token` and look at the `data` field.
   There are three secrets - `ca.crt`, `namespace` and `token`.
   `type` is not a secret data.

5. We are going to deploy an application with the below architecture

   We have already deployed the required pods and services. Check out the pods and services created. Check out the web application using the `Webapp MySQL` link above your terminal, next to the Quiz Portal Link.

   Ok

   ![image-20230107093732545](images/image-20230107093732545.png)

6. The reason the application is failed is because we have not created the secrets yet. Create a new secret named `db-secret` with the data given below.

   You may follow any one of the methods discussed in lecture to create the secret.

   Check

   - Secret Name: db-secret
   - Secret 1: DB_Host=sql01
   - Secret 2: DB_User=root
   - Secret 3: DB_Password=password123

   ```
   $ kubectl create secret generic db-secret --from-literal=DB_Host=sql01 --from-literal=DB_User=root --from-literal=DB_Password=password123
   secret/db-secret created
   
   $ kubectl get secrets 
   NAME              TYPE                                  DATA   AGE
   db-secret         Opaque                                3      58s
   
   $ kubectl describe secrets db-secret 
   Name:         db-secret
   Namespace:    default
   Labels:       <none>
   Annotations:  <none>
   
   Type:  Opaque
   
   Data
   ====
   DB_Host:      5 bytes
   DB_Password:  11 bytes
   DB_User:      4 bytes
   ```

7. Configure `webapp-pod` to load environment variables from the newly created secret.

   Delete and recreate the pod if required.

   Check

   - Pod name: webapp-pod
   - Image name: kodekloud/simple-webapp-mysql
   - Env From: Secret=db-secret

   ```
   $ kubectl edit pod webapp-pod 
   ```

   

   Add the secret in the pod spec as below:

   ```yaml
   apiVersion: v1 
   kind: Pod 
   metadata:
     labels:
       name: webapp-pod
     name: webapp-pod
     namespace: default 
   spec:
     containers:
     - image: kodekloud/simple-webapp-mysql
       imagePullPolicy: Always
       name: webapp
       envFrom:
       - secretRef:
           name: db-secret
   ```

   Recreate the pod.

   ```
   $ kubectl replace -f /tmp/kubectl-edit-240172369.yaml --force 
   pod "webapp-pod" deleted
   pod/webapp-pod replaced
   ```

8. View the web application to verify it can successfully connect to the database

   Ok



## PRACTICE TEST – MULTI CONTAINER PODS

1. Identify the number of containers created in the `red` pod.

   - 2
   - 3
   - 1
   - 4

   ```
   kubectl get pods
   NAME        READY   STATUS    RESTARTS   AGE
   app         1/1     Running   0          4m31s
   fluent-ui   1/1     Running   0          4m31s
   red         3/3     Running   0          85s
   ```

2. Identify the name of the containers running in the `blue` pod.

   - **teal & navy**
   - orange & yellow
   - Red & green
   - grey & white

   ```
   ubectl describe pod blue 
   Name:             blue
   Namespace:        default
   Priority:         0
   Service Account:  default
   Node:             controlplane/10.12.230.6
   Start Time:       Fri, 06 Jan 2023 21:21:22 -0500
   Labels:           <none>
   Annotations:      <none>
   Status:           Running
   IP:               10.244.0.10
   IPs:
     IP:  10.244.0.10
   Containers:
     teal:
       Container ID:  containerd://ab79c23dd906a18756c2b5ac1c1326ce9f025e277578207029a8302c12c2394d
       Image:         busybox
       Image ID:      docker.io/library/busybox@sha256:7b3ccabffc97de872a30dfd234fd972a66d247c8cfc69b0550f276481852627c
       Port:          <none>
       Host Port:     <none>
       Command:
         sleep
         4500
       State:          Running
         Started:      Fri, 06 Jan 2023 21:21:24 -0500
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-64v98 (ro)
     navy:
       Container ID:  containerd://43fe098af1ba45bd560ef8d02b53072ba9c7cc9c109898ecf75d3a822cbad917
       Image:         busybox
       Image ID:      docker.io/library/busybox@sha256:7b3ccabffc97de872a30dfd234fd972a66d247c8cfc69b0550f276481852627c
       Port:          <none>
       Host Port:     <none>
       Command:
         sleep
         4500
       State:          Running
         Started:      Fri, 06 Jan 2023 21:21:25 -0500
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-64v98 (ro)
   ```

3. Create a multi-container pod with 2 containers.

   Use the spec given below.
   If the pod goes into the `crashloopbackoff` then add the command `sleep 1000` in the `lemon` container.

   Check

   - Name: yellow
   - Container 1 Name: lemon
   - Container 1 Image: busybox
   - Container 2 Name: gold
   - Container 2 Image: redis

   ```
   kubectl run yellow --image=busybox --dry-run=client  -o yaml --command -- sleep 1000 > yellow-pod.yaml
   ```

   yellow-pod.yaml

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     labels:
       run: yellow
     name: yellow
   spec:
     containers:
     - command:
       - sleep
       - "1000"
       image: busybox
       name: lemon
   
     - name: gold
       image: redis
   ```

   ```
   kubectl create -f yellow-pod.yaml 
   pod/yellow created
   ```

4. We have deployed an application logging stack in the `elastic-stack` namespace. Inspect it.

   Before proceeding with the next set of questions, please wait for all the pods in the `elastic-stack` namespace to be ready. This can take a few minutes.

   Ok

   ![image-20230107103937335](images/image-20230107103937335.png)

5. Once the pod is in a ready state, inspect the Kibana UI using the link above your terminal. There shouldn't be any logs for now.

   We will configure a sidecar container for the application to send logs to Elastic Search.

   NOTE: It can take a couple of minutes for the `Kibana` UI to be ready after the `Kibana` pod is ready.

   You can inspect the `Kibana` logs by running:
   `kubectl -n elastic-stack logs kibana`

   Ok

6. Inspect the `app` pod and identify the number of containers in it.

   It is deployed in the `elastic-stack` namespace.

   - 2
   - 4
   - **1**
   - 3

   ```
   kubectl describe pod app -n elastic-stack 
   Name:             app
   Namespace:        elastic-stack
   Priority:         0
   Service Account:  default
   Node:             controlplane/10.12.230.6
   Start Time:       Fri, 06 Jan 2023 21:16:28 -0500
   Labels:           name=app
   Annotations:      <none>
   Status:           Running
   IP:               10.244.0.4
   IPs:
     IP:  10.244.0.4
   Containers:
     app:
       Container ID:   containerd://f9a3aacd2eadaa662d754efa377654cab31c5f4c000af551ad9a64bbb1896d67
       Image:          kodekloud/event-simulator
       Image ID:       docker.io/kodekloud/event-simulator@sha256:1e3e9c72136bbc76c96dd98f29c04f298c3ae241c7d44e2bf70bcc209b030bf9
       Port:           <none>
       Host Port:      <none>
       State:          Running
         Started:      Fri, 06 Jan 2023 21:17:07 -0500
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /log from log-volume (rw)
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-tt6q6 (ro)
   Conditions:
     Type              Status
     Initialized       True 
     Ready             True 
     ContainersReady   True 
     PodScheduled      True 
   Volumes:
     log-volume:
       Type:          HostPath (bare host directory volume)
       Path:          /var/log/webapp
       HostPathType:  DirectoryOrCreate
     kube-api-access-tt6q6:
       Type:                    Projected (a volume that contains injected data from multiple sources)
       TokenExpirationSeconds:  3607
       ConfigMapName:           kube-root-ca.crt
       ConfigMapOptional:       <nil>
       DownwardAPI:             true
   QoS Class:                   BestEffort
   Node-Selectors:              <none>
   Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                                node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
   Events:
     Type    Reason     Age   From               Message
     ----    ------     ----  ----               -------
     Normal  Scheduled  29m   default-scheduler  Successfully assigned elastic-stack/app to controlplane
     Normal  Pulling    29m   kubelet            Pulling image "kodekloud/event-simulator"
     Normal  Pulled     29m   kubelet            Successfully pulled image "kodekloud/event-simulator" in 7.275455698s (36.402436092s including waiting)
     Normal  Created    29m   kubelet            Created container app
     Normal  Started    29m   kubelet            Started container app
   ```

7. The application outputs logs to the file `/log/app.log`. View the logs and try to identify the user having issues with Login.

   Inspect the log file inside the pod.

   - USER7
   - USER1
   - **USER5**
   - USER3

   ```
   $ kubectl -n elastic-stack exec -it app -- cat /log/app.log | tail
   [2023-01-07 02:49:03,969] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
   [2023-01-07 02:49:03,969] INFO in event-simulator: USER1 is viewing page1
   [2023-01-07 02:49:04,254] INFO in event-simulator: USER4 logged out
   [2023-01-07 02:49:04,971] INFO in event-simulator: USER3 is viewing page3
   [2023-01-07 02:49:05,254] INFO in event-simulator: USER3 is viewing page1
   [2023-01-07 02:49:05,972] INFO in event-simulator: USER4 is viewing page3
   [2023-01-07 02:49:06,256] INFO in event-simulator: USER4 logged out
   [2023-01-07 02:49:06,973] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-07 02:49:06,974] INFO in event-simulator: USER2 is viewing page1
   [2023-01-07 02:49:07,257] INFO in event-simulator: USER1 is viewing page2
   ```

8. Edit the pod to add a sidecar container to send logs to Elastic Search. Mount the log volume to the sidecar container.

   Only add a new container. Do not modify anything else. Use the spec provided below.

   

   > Note: State persistence concepts are discussed in detail later in this course. For now please make use of the below documentation link for updating the concerning pod.

   
   `https://kubernetes.io/docs/tasks/access-application-cluster/communicate-containers-same-pod-shared-volume/`

   Check

   - Name: app
   - Container Name: sidecar
   - Container Image: kodekloud/filebeat-configured
   - Volume Mount: log-volume
   - Mount Path: /var/log/event-simulator/
   - Existing Container Name: app
   - Existing Container Image: kodekloud/event-simulator

   ```
   kubectl edit -n elastic-stack pod app
   ```

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     name: app
     namespace: elastic-stack
     labels:
       name: app
   spec:
     containers:
     - name: app
       image: kodekloud/event-simulator
       volumeMounts:
       - mountPath: /log
         name: log-volume
   
     - name: sidecar
       image: kodekloud/filebeat-configured
       volumeMounts:
       - mountPath: /var/log/event-simulator/
         name: log-volume
   
     volumes:
     - name: log-volume
       hostPath:
         # directory location on host
         path: /var/log/webapp
         # this field is optional
         type: DirectoryOrCreate
   ```

   ```
   kubectl replace -f /tmp/kubectl-edit-2134590203.yaml --force 
   pod "app" deleted
   pod/app replaced
   ```

9. Inspect the Kibana UI. You should now see logs appearing in the `Discover` section.

   You might have to wait for a couple of minutes for the logs to populate. You might have to create an index pattern to list the logs. If not sure check this video: `https://bit.ly/2EXYdHf`



## PRACTICE TEST – INIT CONTAINERS

1. Identify the pod that has an `initContainer` configured.

   - green
   - **blue**
   - red
   - pink

   ```
   controlplane ~ ➜  kubectl get pods
   NAME    READY   STATUS    RESTARTS   AGE
   green   2/2     Running   0          2m57s
   red     1/1     Running   0          2m57s
   blue    1/1     Running   0          2m57s
   
   controlplane ~ ✖ kubectl describe pod red | grep -i "init containers" -A 10
   
   controlplane ~ ✖ kubectl describe pod green | grep -i "init containers" -A 10
   
   controlplane ~ ✖ kubectl describe pod blue | grep -i "init containers" -A 10
   Init Containers:
     init-myservice:
       Container ID:  containerd://9553c62d34a8b2092bff85ac1b3f4ee40f380be9aed26d26be0bad0bfa2c0d25
       Image:         busybox
       Image ID:      docker.io/library/busybox@sha256:7b3ccabffc97de872a30dfd234fd972a66d247c8cfc69b0550f276481852627c
       Port:          <none>
       Host Port:     <none>
       Command:
         sh
         -c
         sleep 5
   ```

2. What is the image used by the `initContainer` on the `blue` pod?

   - busybox:1.28
   - **busybox**
   - nginx
   - alpine
   - busybox:1.1

   ```
   controlplane ~ ✖ kubectl describe pod blue | grep -i "init containers" -A 10
   Init Containers:
     init-myservice:
       Container ID:  containerd://9553c62d34a8b2092bff85ac1b3f4ee40f380be9aed26d26be0bad0bfa2c0d25
       Image:         busybox
       Image ID:      docker.io/library/busybox@sha256:7b3ccabffc97de872a30dfd234fd972a66d247c8cfc69b0550f276481852627c
       Port:          <none>
       Host Port:     <none>
       Command:
         sh
         -c
         sleep 5
   ```

3. What is the state of the `initContainer` on pod `blue`?

   - Alive
   - Running
   - **Terminated**
   - Completed

   ```
   controlplane ~ ➜  kubectl describe pod blue | grep -i "init containers" -A 20
   Init Containers:
     init-myservice:
       Container ID:  containerd://9553c62d34a8b2092bff85ac1b3f4ee40f380be9aed26d26be0bad0bfa2c0d25
       Image:         busybox
       Image ID:      docker.io/library/busybox@sha256:7b3ccabffc97de872a30dfd234fd972a66d247c8cfc69b0550f276481852627c
       Port:          <none>
       Host Port:     <none>
       Command:
         sh
         -c
         sleep 5
       State:          Terminated
         Reason:       Completed
         Exit Code:    0
         Started:      Sat, 07 Jan 2023 03:15:29 +0000
         Finished:     Sat, 07 Jan 2023 03:15:34 +0000
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-vrhmd (ro)
   ```

4. Why is the `initContainer` terminated? What is the reason?

   - **The process completed successfully**
   - The process cannot start
   - The process crashed

   ```
   controlplane ~ ➜  kubectl describe pod blue | grep -i "init containers" -A 20
   Init Containers:
     init-myservice:
       Container ID:  containerd://9553c62d34a8b2092bff85ac1b3f4ee40f380be9aed26d26be0bad0bfa2c0d25
       Image:         busybox
       Image ID:      docker.io/library/busybox@sha256:7b3ccabffc97de872a30dfd234fd972a66d247c8cfc69b0550f276481852627c
       Port:          <none>
       Host Port:     <none>
       Command:
         sh
         -c
         sleep 5
       State:          Terminated
         Reason:       Completed
         Exit Code:    0
         Started:      Sat, 07 Jan 2023 03:15:29 +0000
         Finished:     Sat, 07 Jan 2023 03:15:34 +0000
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-vrhmd (ro)
   ```

5. We just created a new app named `purple`. How many `initContainers` does it have?

   - 1
   - 3
   - 4
   - **2**

   ```
   kubectl describe pod purple 
   Name:             purple
   Namespace:        default
   Priority:         0
   Service Account:  default
   Node:             controlplane/172.25.0.85
   Start Time:       Sat, 07 Jan 2023 03:25:05 +0000
   Labels:           <none>
   Annotations:      <none>
   Status:           Pending
   IP:               10.42.0.12
   IPs:
     IP:  10.42.0.12
   Init Containers:
     warm-up-1:
       Container ID:  containerd://0af6104853e313c67cc3b6b41fc48e01f1e5fb2058553c75f879703dfe508f35
       Image:         busybox:1.28
       Image ID:      docker.io/library/busybox@sha256:141c253bc4c3fd0a201d32dc1f493bcf3fff003b6df416dea4f41046e0f37d47
       Port:          <none>
       Host Port:     <none>
       Command:
         sh
         -c
         sleep 600
       State:          Running
         Started:      Sat, 07 Jan 2023 03:25:05 +0000
       Ready:          False
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-5q6c8 (ro)
     warm-up-2:
       Container ID:  
       Image:         busybox:1.28
       Image ID:      
       Port:          <none>
       Host Port:     <none>
       Command:
         sh
         -c
         sleep 1200
       State:          Waiting
         Reason:       PodInitializing
       Ready:          False
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-5q6c8 (ro)
   ```

6. What is the state of the POD?

   - Terminated
   - **Pending**
   - Running

   ```
   kubectl describe pod purple 
   Name:             purple
   Namespace:        default
   Priority:         0
   Service Account:  default
   Node:             controlplane/172.25.0.85
   Start Time:       Sat, 07 Jan 2023 03:25:05 +0000
   Labels:           <none>
   Annotations:      <none>
   Status:           Pending
   IP:               10.42.0.12
   IPs:
     IP:  10.42.0.12
   ```

7. How long after the creation of the POD will the application come up and be available to users?

   - 10 Minutes
   - 600 Seconds
   - 20 Minutes
   - 30 Minutes

   sleep 600 + 1200 = 1800 OR 30 minutes

   ```
   kubectl describe pod purple 
   Name:             purple
   Namespace:        default
   Priority:         0
   Service Account:  default
   Node:             controlplane/172.25.0.85
   Start Time:       Sat, 07 Jan 2023 03:25:05 +0000
   Labels:           <none>
   Annotations:      <none>
   Status:           Pending
   IP:               10.42.0.12
   IPs:
     IP:  10.42.0.12
   Init Containers:
     warm-up-1:
       Container ID:  containerd://0af6104853e313c67cc3b6b41fc48e01f1e5fb2058553c75f879703dfe508f35
       Image:         busybox:1.28
       Image ID:      docker.io/library/busybox@sha256:141c253bc4c3fd0a201d32dc1f493bcf3fff003b6df416dea4f41046e0f37d47
       Port:          <none>
       Host Port:     <none>
       Command:
         sh
         -c
         sleep 600
       State:          Running
         Started:      Sat, 07 Jan 2023 03:25:05 +0000
       Ready:          False
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-5q6c8 (ro)
     warm-up-2:
       Container ID:  
       Image:         busybox:1.28
       Image ID:      
       Port:          <none>
       Host Port:     <none>
       Command:
         sh
         -c
         sleep 1200
   ```

8. Update the pod `red` to use an `initContainer` that uses the `busybox` image and `sleeps for 20` seconds

   Delete and re-create the pod if necessary. But make sure no other configurations change.

   Check

   - Pod: red
   - initContainer Configured Correctly

   ```
   kubectl edit pod red
   ```

   Add initContainers section in the pod spec as below:

   ```yaml
   ---
   apiVersion: v1
   kind: Pod
   metadata:
     name: red
     namespace: default
   spec:
     containers:
     - command:
       - sh
       - -c
       - echo The app is running! && sleep 3600
       image: busybox:1.28
       name: red-container
     initContainers:
     - image: busybox
       name: red-initcontainer
       command: 
         - "sleep"
         - "20"
   ```

   Recreate the pod.

   ```
   kubectl replace -f /tmp/kubectl-edit-1318669784.yaml --force 
   pod "red" deleted
   pod/red replaced
   ```

9. A new application `orange` is deployed. There is something wrong with it. Identify and fix the issue.

   Once fixed, wait for the application to run before checking solution.

   Check

   - Issue fixed

   ```
   kubectl get pod orange -o yaml > orange.yaml
   ```

   Check sleep command

   ```
   piVersion: v1
   kind: Pod
   metadata:
     creationTimestamp: "2023-01-07T03:38:39Z"
     name: orange
     namespace: default
     resourceVersion: "1519"
     uid: 4437e91a-e73e-4d63-a9c9-0ccd3ff01cdc
   spec:
     containers:
     - command:
       - sh
       - -c
       - echo The app is running! && sleep 3600
       image: busybox:1.28
       imagePullPolicy: IfNotPresent
       name: orange-container
       resources: {}
       terminationMessagePath: /dev/termination-log
       terminationMessagePolicy: File
       volumeMounts:
       - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
         name: kube-api-access-gq2nc
         readOnly: true
     dnsPolicy: ClusterFirst
     enableServiceLinks: true
     initContainers:
     - command:
       - sh
       - -c
       - sleep 2;
       image: busybox
       imagePullPolicy: Always
       name: init-myservice
       resources: {}
       terminationMessagePath: /dev/termination-log
       terminationMessagePolicy: File
       volumeMounts:
       - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
         name: kube-api-access-gq2nc
         readOnly: true
   ```

   ```
   controlplane ~ ➜  kubectl replace -f orange.yaml --force
   pod "orange" deleted
   pod/orange replaced
   
   controlplane ~ ➜  kubectl get pods
   NAME     READY   STATUS     RESTARTS   AGE
   green    2/2     Running    0          28m
   blue     1/1     Running    0          28m
   purple   0/1     Init:1/2   0          18m
   red      1/1     Running    0          5m18s
   orange   1/1     Running    0          13s
   ```



# CLUSTER MAINTENANCE

## PRACTICE TEST OS UPGRADES

1. Let us explore the environment first. How many nodes do you see in the cluster?

   Including the controlplane and worker nodes.

   - 1
   - **2**
   - 3

   ```
   controlplane ~ ➜  kubectl get nodes
   NAME           STATUS   ROLES           AGE   VERSION
   controlplane   Ready    control-plane   23m   v1.24.0
   node01         Ready    <none>          23m   v1.24.0
   ```

2. How many applications do you see hosted on the cluster?

   Check the number of deployments in the `default` namespace.

   - **1**
   - 5
   - 0
   - 2
   - 3

   ```
   controlplane ~ ➜  kubectl get deployments.apps 
   NAME   READY   UP-TO-DATE   AVAILABLE   AGE
   blue   3/3     3            3           56s
   ```

3. Which nodes are the applications hosted on?

   - node01,node02
   - controlplane,node03
   - **controlplane,node01**

   ```
   $ kubectl get pods -o wide
   NAME                    READY   STATUS    RESTARTS   AGE    IP           NODE           NOMINATED NODE   READINESS GATES
   blue-797fc567b4-8xnmd   1/1     Running   0          2m7s   10.244.1.3   node01         <none>           <none>
   blue-797fc567b4-bhcsg   1/1     Running   0          2m7s   10.244.1.2   node01         <none>           <none>
   blue-797fc567b4-wk5r7   1/1     Running   0          2m7s   10.244.0.4   controlplane   <none>           <none>
   ```

4. We need to take `node01` out for maintenance. Empty the node of all applications and mark it unschedulable.

   Check

   - Node node01 Unschedulable
   - Pods evicted from node01

   ```
   controlplane ~ ➜  kubectl drain node01 --ignore-daemonsets 
   node/node01 cordoned
   WARNING: ignoring DaemonSet-managed Pods: kube-system/kube-flannel-ds-8vj5x, kube-system/kube-proxy-cz5h5
   evicting pod default/blue-797fc567b4-bhcsg
   evicting pod default/blue-797fc567b4-8xnmd
   pod/blue-797fc567b4-8xnmd evicted
   pod/blue-797fc567b4-bhcsg evicted
   node/node01 drained
   ```

5. What nodes are the apps on now?

   - controlplane,node01
   - **controlplane**
   - node01,node02
   - controlplane,node02

   ```
   controlplane ~ ➜  kubectl get pods -o wide
   NAME                    READY   STATUS    RESTARTS   AGE     IP           NODE           NOMINATED NODE   READINESS GATES
   blue-797fc567b4-rmjcm   1/1     Running   0          13s     10.244.0.6   controlplane   <none>           <none>
   blue-797fc567b4-vfvjz   1/1     Running   0          13s     10.244.0.5   controlplane   <none>           <none>
   blue-797fc567b4-wk5r7   1/1     Running   0          4m22s   10.244.0.4   controlplane   <none>           <none>
   ```

6. The maintenance tasks have been completed. Configure the node `node01` to be schedulable again.

   Check

   - Node01 is Schedulable

   ```
   $ kubectl uncordon node01 
   node/node01 uncordoned
   ```

7. How many pods are scheduled on `node01` now?

   - 2
   - **0**
   - 3
   - 1

   ```
   kubectl get pods -o wide
   NAME                    READY   STATUS    RESTARTS   AGE     IP           NODE           NOMINATED NODE   READINESS GATES
   blue-797fc567b4-rmjcm   1/1     Running   0          6m48s   10.244.0.6   controlplane   <none>           <none>
   blue-797fc567b4-vfvjz   1/1     Running   0          6m48s   10.244.0.5   controlplane   <none>           <none>
   blue-797fc567b4-wk5r7   1/1     Running   0          10m     10.244.0.4   controlplane   <none>           <none>
   ```

8. Why are there no pods on `node01`?

   - node01 is faulty
   - **Only when new pods are created they will be scheduled**
   - node01 is cordoned
   - node01 did not upgrade successfully

9. Why are the pods placed on the `controlplane` node?

   Check the controlplane node details.

   - you can never have pods on master nodes
   - controlplane node is cordoned
   - **controlplane node does not have any taints**
   - controlplane node has taints set on it
   - controlplane node is faulty

   ```
   $ kubectl describe nodes controlplane | grep Taints
   Taints:             <none>
   ```

10. Time travelling to the next maintenance window…

   Ok

11. We need to carry out a maintenance activity on `node01` again. Try draining the node again using the same command as before: `kubectl drain node01 --ignore-daemonsets`

    Did that work?

    - **NO**

    - YES

    ```
    kubectl drain node01 --ignore-daemonsets 
    node/node01 cordoned
    error: unable to drain node "node01" due to error:cannot delete Pods declare no controller (use --force to override): default/hr-app, continuing command...
    There are pending nodes to be drained:
     node01
    cannot delete Pods declare no controller (use --force to override): default/hr-app
    ```

12. Why did the drain command fail on `node01`? It worked the first time!

    - **there is a pod in node01 which is not part of a replicaset**
    - no pods on node01
    - node01 was not upgraded correctly the last time
    - node01 tainted

    ```
    $ kubectl get pods -o wide
    NAME                    READY   STATUS    RESTARTS   AGE   IP           NODE           NOMINATED NODE   READINESS GATES
    blue-797fc567b4-rmjcm   1/1     Running   0          13m   10.244.0.6   controlplane   <none>           <none>
    blue-797fc567b4-vfvjz   1/1     Running   0          13m   10.244.0.5   controlplane   <none>           <none>
    blue-797fc567b4-wk5r7   1/1     Running   0          17m   10.244.0.4   controlplane   <none>           <none>
    hr-app                  1/1     Running   0          75s   10.244.1.4   node01         <none>           <none>
    ```

    

13. What is the name of the POD hosted on `node01` that is not part of a replicaset?

    - simple-webapp-1
    - redis
    - **hr-app**
    - red
    - blue

    ```
    $ kubectl get pods -o wide
    NAME                    READY   STATUS    RESTARTS   AGE   IP           NODE           NOMINATED NODE   READINESS GATES
    blue-797fc567b4-rmjcm   1/1     Running   0          13m   10.244.0.6   controlplane   <none>           <none>
    blue-797fc567b4-vfvjz   1/1     Running   0          13m   10.244.0.5   controlplane   <none>           <none>
    blue-797fc567b4-wk5r7   1/1     Running   0          17m   10.244.0.4   controlplane   <none>           <none>
    hr-app                  1/1     Running   0          75s   10.244.1.4   node01         <none>           <none>
    ```

14. What would happen to `hr-app` if `node01` is drained forcefully?

    Try it and see for yourself.

    - hr-app will be recreated on other nodes
    - hr-app will continue to run as a Docker container
    - hr-app will be re-created on master
    - **hr-app will be lost forever**

    ```
    kubectl drain node01 --ignore-daemonsets --force 
    node/node01 already cordoned
    WARNING: deleting Pods that declare no controller: default/hr-app; ignoring DaemonSet-managed Pods: kube-system/kube-flannel-ds-8vj5x, kube-system/kube-proxy-cz5h5
    evicting pod default/hr-app
    pod/hr-app evicted
    node/node01 drained
    
    kubectl get pods -o wide
    NAME                    READY   STATUS    RESTARTS   AGE   IP           NODE           NOMINATED NODE   READINESS GATES
    blue-797fc567b4-rmjcm   1/1     Running   0          25m   10.244.0.6   controlplane   <none>           <none>
    blue-797fc567b4-vfvjz   1/1     Running   0          25m   10.244.0.5   controlplane   <none>           <none>
    blue-797fc567b4-wk5r7   1/1     Running   0          29m   10.244.0.4   controlplane   <none>           <none>
    ```

15. Oops! We did not want to do that! `hr-app` is a critical application that should not be destroyed. We have now reverted back to the previous state and re-deployed `hr-app` as a deployment.

    OK

16. `hr-app` is a critical app and we do not want it to be removed and we do not want to schedule any more pods on `node01`.
    Mark `node01` as `unschedulable` so that no new pods are scheduled on this node.

    Make sure that `hr-app` is not affected.

    Check

    - Node01 Unschedulable
    - hr-app still running on node01?

    ```
    kubectl cordon node01 
    node/node01 cordoned
    ```



## PRACTICE TEST CLUSTER UPGRADE PROCESS

1. This lab tests your skills on **upgrading a kubernetes cluster**. We have a production cluster with applications running on it. Let us explore the setup first.

   What is the current version of the cluster?

   - v1.20.0
   - v1.19.1
   - **v1.25.0**
   - v1.21.0

   ```
   ➜  kubectl get nodes
   NAME           STATUS   ROLES           AGE    VERSION
   controlplane   Ready    control-plane   175m   v1.25.0
   node01         Ready    <none>          174m   v1.25.0
   ```

2. How many nodes are part of this cluster?

   Including controlplane and worker nodes

   - 1
   - **2**
   - 0
   - 3
   - 4

   ```
   ➜  kubectl get nodes
   NAME           STATUS   ROLES           AGE    VERSION
   controlplane   Ready    control-plane   176m   v1.25.0
   node01         Ready    <none>          175m   v1.25.0
   ```

3. How many nodes can host workloads in this cluster?

   Inspect the applications and taints set on the nodes.

   - **2**
   - 3
   - 4
   - 1

   By running the `kubectl describe node` command, we can see that neither nodes have taints.

   ```
   controlplane ~ ✖ kubectl describe nodes controlplane | grep -i taints
   Taints:             <none>
   
   controlplane ~ ➜  kubectl describe nodes node01 | grep -i taints
   Taints:             <none>
   ```

   This means that both nodes have the ability to schedule workloads on them.

4. How many applications are hosted on the cluster?

   Count the number of deployments in the `default` namespace.

   - 3
   - 2
   - 0
   - **1**

   ```
   controlplane ~ ➜  kubectl get deployments.apps 
   NAME   READY   UP-TO-DATE   AVAILABLE   AGE
   blue   5/5     5            5           5m35s
   ```

5. What nodes are the pods hosted on?

   - node01,node02
   - node02
   - controlplane
   - **controlplane,node01**
   - node01

   ```
   ➜  kubectl get pods -o wide
   NAME                    READY   STATUS    RESTARTS   AGE     IP           NODE           NOMINATED NODE   READINESS GATES
   blue-5db6db69f7-48ht6   1/1     Running   0          8m55s   10.244.1.4   node01         <none>           <none>
   blue-5db6db69f7-9brkw   1/1     Running   0          8m55s   10.244.1.3   node01         <none>           <none>
   blue-5db6db69f7-kmsjd   1/1     Running   0          8m55s   10.244.0.5   controlplane   <none>           <none>
   blue-5db6db69f7-r6gsl   1/1     Running   0          8m55s   10.244.1.2   node01         <none>           <none>
   blue-5db6db69f7-wjddq   1/1     Running   0          8m55s   10.244.0.4   controlplane   <none>           <none>
   ```

6. You are tasked to upgrade the cluster. Users accessing the applications must not be impacted, and you cannot provision new VMs. What strategy would you use to upgrade the cluster?

   - Users will be impacted since there is only one worker node
   - **Upgrade one node at a time while moving the workloads to the other**
   - Upgrade all nodes at once
   - Add new nodes with newer versions while taking down existing nodes

7. What is the latest stable version of Kubernetes as of today?

   Look at the `remote version` in the output of the `kubeadm upgrade plan` command.

   - 1.22.5
   - 1.23.0
   - **1.26.0**
   - 1.21.0

   ```
    ➜  kubeadm upgrade plan
   [upgrade/config] Making sure the configuration is correct:
   [upgrade/config] Reading configuration from the cluster...
   [upgrade/config] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -o yaml'
   [preflight] Running pre-flight checks.
   [upgrade] Running cluster health checks
   [upgrade] Fetching available versions to upgrade to
   [upgrade/versions] Cluster version: v1.25.0
   [upgrade/versions] kubeadm version: v1.25.0
   I0107 20:05:25.032336   31014 version.go:256] remote version is much newer: v1.26.0; falling back to: stable-1.25
   [upgrade/versions] Target version: v1.25.5
   [upgrade/versions] Latest version in the v1.25 series: v1.25.5
   
   Components that must be upgraded manually after you have upgraded the control plane with 'kubeadm upgrade apply':
   COMPONENT   CURRENT       TARGET
   kubelet     2 x v1.25.0   v1.25.5
   
   Upgrade to the latest version in the v1.25 series:
   
   COMPONENT                 CURRENT   TARGET
   kube-apiserver            v1.25.0   v1.25.5
   kube-controller-manager   v1.25.0   v1.25.5
   kube-scheduler            v1.25.0   v1.25.5
   kube-proxy                v1.25.0   v1.25.5
   CoreDNS                   v1.9.3    v1.9.3
   etcd                      3.5.4-0   3.5.4-0
   
   You can now apply the upgrade by executing the following command:
   
           kubeadm upgrade apply v1.25.5
   
   Note: Before you can perform this upgrade, you have to update kubeadm to v1.25.5.
   
   _____________________________________________________________________
   
   
   The table below shows the current state of component configs as understood by this version of kubeadm.
   Configs that have a "yes" mark in the "MANUAL UPGRADE REQUIRED" column require manual config upgrade or
   resetting to kubeadm defaults before a successful upgrade can be performed. The version to manually
   upgrade to is denoted in the "PREFERRED VERSION" column.
   
   API GROUP                 CURRENT VERSION   PREFERRED VERSION   MANUAL UPGRADE REQUIRED
   kubeproxy.config.k8s.io   v1alpha1          v1alpha1            no
   kubelet.config.k8s.io     v1beta1           v1beta1             no
   _____________________________________________________________________
   ```

8. What is the latest version available for an upgrade with the current version of the kubeadm tool installed?

   Use the `kubeadm` tool

   - v1.21.0
   - **v1.25.5**
   - v1.20.0
   - v1.22.1

   ```
   ➜  kubeadm upgrade plan
   [upgrade/config] Making sure the configuration is correct:
   [upgrade/config] Reading configuration from the cluster...
   [upgrade/config] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -o yaml'
   [preflight] Running pre-flight checks.
   [upgrade] Running cluster health checks
   [upgrade] Fetching available versions to upgrade to
   [upgrade/versions] Cluster version: v1.25.0
   [upgrade/versions] kubeadm version: v1.25.0
   I0107 20:08:30.523113   31498 version.go:256] remote version is much newer: v1.26.0; falling back to: stable-1.25
   [upgrade/versions] Target version: v1.25.5
   [upgrade/versions] Latest version in the v1.25 series: v1.25.5
   
   Components that must be upgraded manually after you have upgraded the control plane with 'kubeadm upgrade apply':
   COMPONENT   CURRENT       TARGET
   kubelet     2 x v1.25.0   v1.25.5
   
   Upgrade to the latest version in the v1.25 series:
   
   COMPONENT                 CURRENT   TARGET
   kube-apiserver            v1.25.0   v1.25.5
   kube-controller-manager   v1.25.0   v1.25.5
   kube-scheduler            v1.25.0   v1.25.5
   kube-proxy                v1.25.0   v1.25.5
   CoreDNS                   v1.9.3    v1.9.3
   etcd                      3.5.4-0   3.5.4-0
   
   You can now apply the upgrade by executing the following command:
   
           kubeadm upgrade apply v1.25.5
   
   Note: Before you can perform this upgrade, you have to update kubeadm to v1.25.5.
   
   _____________________________________________________________________
   
   
   The table below shows the current state of component configs as understood by this version of kubeadm.
   Configs that have a "yes" mark in the "MANUAL UPGRADE REQUIRED" column require manual config upgrade or
   resetting to kubeadm defaults before a successful upgrade can be performed. The version to manually
   upgrade to is denoted in the "PREFERRED VERSION" column.
   
   API GROUP                 CURRENT VERSION   PREFERRED VERSION   MANUAL UPGRADE REQUIRED
   kubeproxy.config.k8s.io   v1alpha1          v1alpha1            no
   kubelet.config.k8s.io     v1beta1           v1beta1             no
   _____________________________________________________________________
   ```

9. We will be upgrading the controlplane node first. Drain the controlplane node of workloads and mark it `UnSchedulable`

   Check

   - Controlplane Node: SchedulingDisabled

   ```
   ➜  kubectl drain controlplane --ignore-daemonsets 
   node/controlplane cordoned
   Warning: ignoring DaemonSet-managed Pods: kube-flannel/kube-flannel-ds-m5jps, kube-system/kube-proxy-2jdz5
   evicting pod kube-system/coredns-565d847f94-m74rb
   evicting pod default/blue-5db6db69f7-wjddq
   evicting pod default/blue-5db6db69f7-kmsjd
   evicting pod kube-system/coredns-565d847f94-5w2q2
   pod/blue-5db6db69f7-kmsjd evicted
   pod/blue-5db6db69f7-wjddq evicted
   pod/coredns-565d847f94-5w2q2 evicted
   pod/coredns-565d847f94-m74rb evicted
   node/controlplane drained
   ```

10. Upgrade the `controlplane` components to exact version `v1.26.0`

   Upgrade the kubeadm tool (if not already), then the controlplane components, and finally the kubelet. Practice referring to the Kubernetes documentation page.
   **Note:** While upgrading kubelet, if you hit dependency issues while running the `apt-get upgrade kubelet` command, use the `apt install kubelet=1.26.0-00` command instead.

   Check

   - Controlplane Node Upgraded to v1.26.0
   - Controlplane Kubelet Upgraded to v1.26.0

   On the `controlplane` node, run the following commands:

   This will update the package lists from the software repository.

   ```sh
   apt update
   ```

   This will install the kubeadm version 1.26.0

   ```sh
   apt-get install kubeadm=1.26.0-00
   ```

   This will upgrade Kubernetes controlplane node.

   ```sh
   kubeadm upgrade apply v1.26.0
   ```

   > Note that the above steps can take a few minutes to complete.

   This will update the `kubelet` with the version `1.26.0`.

   ```sh
   apt-get install kubelet=1.26.0-00 
   ```

   You may need to reload the `daemon` and restart `kubelet` service after it has been upgraded.

   ```sh
   systemctl daemon-reload
   systemctl restart kubelet
   ```

11. Mark the `controlplane` node as "Schedulable" again

    Check

    - Controlplane Node: Ready & Schedulable

    ```
    $ kubectl uncordon controlplane 
    node/controlplane uncordoned
    ```

12. Next is the worker node. `Drain` the worker node of the workloads and mark it `UnSchedulable`

    Check

    - Worker node: Unschedulable

    ```
    ➜  kubectl drain node01 --ignore-daemonsets
    node/node01 cordoned
    Warning: ignoring DaemonSet-managed Pods: kube-flannel/kube-flannel-ds-wl2m4, kube-system/kube-proxy-cdzpv
    evicting pod kube-system/coredns-787d4945fb-vzb68
    evicting pod default/blue-5db6db69f7-r6gsl
    evicting pod default/blue-5db6db69f7-48ht6
    evicting pod default/blue-5db6db69f7-gvrzr
    evicting pod kube-system/coredns-787d4945fb-sprnr
    evicting pod default/blue-5db6db69f7-v5nrh
    evicting pod default/blue-5db6db69f7-9brkw
    pod/blue-5db6db69f7-9brkw evicted
    pod/blue-5db6db69f7-gvrzr evicted
    pod/blue-5db6db69f7-v5nrh evicted
    pod/blue-5db6db69f7-r6gsl evicted
    pod/blue-5db6db69f7-48ht6 evicted
    pod/coredns-787d4945fb-vzb68 evicted
    pod/coredns-787d4945fb-sprnr evicted
    node/node01 drained
    ```

13. Upgrade the worker node to the exact version `v1.26.0`

    Check

    - Worker Node Upgraded to v1.26.0
    - Worker Node Ready

    On the `node01` node, run the following commands:

    > If you are on the `controlplane` node, run `ssh node01` to log in to the `node01`.

    This will update the package lists from the software repository.

    ```sh
    apt-get update
    ```

    This will install the kubeadm version 1.26.0.

    ```sh
    apt-get install kubeadm=1.26.0-00
    ```

    This will upgrade the `node01` configuration.

    ```sh
    kubeadm upgrade node
    ```

    This will update the `kubelet` with the version `1.26.0`.

    ```sh
    apt-get install kubelet=1.26.0-00 
    ```

    You may need to reload the `daemon` and restart `kubelet` service after it has been upgraded.

    ```sh
    systemctl daemon-reload
    systemctl restart kubelet
    ```

    > Type `exit` or `logout` or enter `CTRL + d` to go back to the `controlplane` node.

14. Remove the restriction and mark the worker node as schedulable again.

    Check

    - Worker Node: Schedulable

    ```
     ➜  kubectl uncordon node01 
    node/node01 uncordoned
    ```



## PRACTICE TEST BACKUP AND RESTORE METHODS

1. We have a working kubernetes cluster with a set of applications running. Let us first explore the setup.

   How many deployments exist in the cluster?

   - 0
   - 1
   - **2**
   - 6
   - 4
   - 3
   - 5

   ```
   ➜  kubectl get deployments.apps 
   NAME   READY   UP-TO-DATE   AVAILABLE   AGE
   blue   3/3     3            3           28s
   red    2/2     2            2           28s
   ```

2. What is the version of ETCD running on the cluster?

   Check the ETCD Pod or Process

   - "2.1.0"
   - "3.5.6"
   - "3.4.13"
   - "2.3.4"

   Look at the ETCD Logs using the command `kubectl logs etcd-controlplane -n kube-system` or check the image used by the ETCD pod: `kubectl describe pod etcd-controlplane -n kube-system`

   ```
   $ kubectl describe pod etcd-controlplane -n kube-system 
   Name:                 etcd-controlplane
   Namespace:            kube-system
   Priority:             2000001000
   Priority Class Name:  system-node-critical
   Node:                 controlplane/10.10.231.3
   Start Time:           Sat, 07 Jan 2023 20:45:40 -0500
   Labels:               component=etcd
                         tier=control-plane
   Annotations:          kubeadm.kubernetes.io/etcd.advertise-client-urls: https://10.10.231.3:2379
                         kubernetes.io/config.hash: 0da57a5682dc024e6ce819d0074b20e0
                         kubernetes.io/config.mirror: 0da57a5682dc024e6ce819d0074b20e0
                         kubernetes.io/config.seen: 2023-01-07T20:45:40.194241313-05:00
                         kubernetes.io/config.source: file
   Status:               Running
   IP:                   10.10.231.3
   IPs:
     IP:           10.10.231.3
   Controlled By:  Node/controlplane
   Containers:
     etcd:
       Container ID:  containerd://4bb52e16aa320113d46f2e3853ae69cb3ad8f15545b8656c917bf271fb43de7f
       Image:         registry.k8s.io/etcd:3.5.6-0
       Image ID:      registry.k8s.io/etcd@sha256:dd75ec974b0a2a6f6bb47001ba09207976e625db898d1b16735528c009cb171c
       Port:          <none>
       Host Port:     <none>
   ```

   OR

   ```
   $ kubectl -n kube-system logs etcd-controlplane | grep -i 'etcd-version'
   {"level":"info","ts":"2023-01-08T01:45:43.825Z","caller":"embed/etcd.go:306","msg":"starting an etcd server","etcd-version":"3.5.6","git-sha":"cecbe35ce","go-version":"go1.16.15","go-os":"linux","go-arch":"amd64","max-cpu-set":36,"max-cpu-available":36,"member-initialized":false,"name":"controlplane","data-dir":"/var/lib/etcd","wal-dir":"","wal-dir-dedicated":"","member-dir":"/var/lib/etcd/member","force-new-cluster":false,"heartbeat-interval":"100ms","election-timeout":"1s","initial-election-tick-advance":true,"snapshot-count":10000,"max-wals":5,"max-snapshots":5,"snapshot-catchup-entries":5000,"initial-advertise-peer-urls":["https://10.10.231.3:2380"],"listen-peer-urls":["https://10.10.231.3:2380"],"advertise-client-urls":["https://10.10.231.3:2379"],"listen-client-urls":["https://10.10.231.3:2379","https://127.0.0.1:2379"],"listen-metrics-urls":["http://127.0.0.1:2381"],"cors":["*"],"host-whitelist":["*"],"initial-cluster":"controlplane=https://10.10.231.3:2380","initial-cluster-state":"new","initial-cluster-token":"etcd-cluster","quota-backend-bytes":2147483648,"max-request-bytes":1572864,"max-concurrent-streams":4294967295,"pre-vote":true,"initial-corrupt-check":true,"corrupt-check-time-interval":"0s","compact-check-time-enabled":false,"compact-check-time-interval":"1m0s","auto-compaction-mode":"periodic","auto-compaction-retention":"0s","auto-compaction-interval":"0s","discovery-url":"","discovery-proxy":"","downgrade-check-interval":"5s"}
   ```

3. At what address can you reach the ETCD cluster from the controlplane node?

   Check the ETCD Service configuration in the ETCD POD

   - https://10.96.0.1:2379
   - **https://127.0.0.1:2379**
   - https://10.96.0.1:8080
   - https://127.0.0.1:2380

   ```
   $ kubectl -n kube-system describe pod etcd-controlplane | grep '\--listen-client-urls'
         --listen-client-urls=https://127.0.0.1:2379,https://10.10.231.3:2379
   ```

   This means that ETCD is reachable on localhost (127.0.0.1) at port 2379.

4. Where is the ETCD server certificate file located?

   Note this path down as you will need to use it later

   - /etc/kubernetes/pki/etcd/ca.crt
   - /etc/kubernetes/pki/etcd/peer.crt
   - /etc/kubernetes/pki/server.crt
   - **/etc/kubernetes/pki/etcd/server.crt**

   ```
   $ kubectl -n kube-system describe pod etcd-controlplane | grep '\--cert-file'
         --cert-file=/etc/kubernetes/pki/etcd/server.crt
   ```

5. Where is the ETCD CA Certificate file located?

   Note this path down as you will need to use it later.

   - /etc/kubernetes/pki/etcd/ca.key
   - /etc/kubernetes/pki/ca.crt
   - **/etc/kubernetes/pki/etcd/ca.crt**
   - /etc/kubernetes/pki/etcd/peer.crt

   ```
   $ kubectl -n kube-system describe pod etcd-controlplane | grep '\--trusted-ca-file'
         --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
   ```

6. The master node in our cluster is planned for a regular maintenance reboot tonight. While we do not anticipate anything to go wrong, we are required to take the necessary backups. Take a snapshot of the **ETCD** database using the built-in **snapshot** functionality.

   Store the backup file at location `/opt/snapshot-pre-boot.db`

   Check

   - Backup ETCD to /opt/snapshot-pre-boot.db

   ```
   ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 \
   > --cacert=/etc/kubernetes/pki/etcd/ca.crt \
   > --cert=/etc/kubernetes/pki/etcd/server.crt \
   > --key=/etc/kubernetes/pki/etcd/server.key \
   > snapshot save /opt/snapshot-pre-boot.db
   Snapshot saved at /opt/snapshot-pre-boot.db
   ```

7. Great! Let us now wait for the maintenance window to finish. Go get some sleep. (Don't go for real)

   Click `Ok` to Continue

   Ok

8. Wake up! We have a conference call! After the reboot the master nodes came back online, but none of our applications are accessible. Check the status of the applications on the cluster. What's wrong?

   - Deployments are not present
   - Pods are not present
   - **All of the above**
   - Services are not present

9. Luckily we took a backup. Restore the original state of the cluster using the backup file.

   Check

   - Deployments: 2
   - Services: 3

   **First Restore the snapshot:**

   ```sh
   root@controlplane:~# ETCDCTL_API=3 etcdctl --data-dir /var/lib/etcd-from-backup \
   > snapshot restore /opt/snapshot-pre-boot.db 
   2023-01-07 21:26:57.971050 I | mvcc: restore compact to 2452
   2023-01-07 21:26:57.977491 I | etcdserver/membership: added member 8e9e05c52164694d [http://localhost:2380] to cluster cdf818194e3a8c32
   ```

   Note: In this case, we are restoring the snapshot to a different directory but in the same server where we took the backup **(the controlplane node)** As a result, the only required option for the restore command is the `--data-dir`.

   Next, update the `/etc/kubernetes/manifests/etcd.yaml`:

   We have now restored the etcd snapshot to a new path on the controlplane - `/var/lib/etcd-from-backup`, so, the only change to be made in the YAML file, is to change the hostPath for the volume called `etcd-data` from old directory (`/var/lib/etcd`) to the new directory (`/var/lib/etcd-from-backup`).

   ```sh
     volumes:
     - hostPath:
         path: /var/lib/etcd-from-backup
         type: DirectoryOrCreate
       name: etcd-data
   ```

   With this change, `/var/lib/etcd` on the container points to `/var/lib/etcd-from-backup` on the `controlplane` (which is what we want).

   When this file is updated, the `ETCD` pod is automatically re-created as this is a static pod placed under the `/etc/kubernetes/manifests` directory.

   > Note 1: As the ETCD pod has changed it will automatically restart, and also `kube-controller-manager` and `kube-scheduler`. Wait 1-2 to mins for this pods to restart. You can run the command: `watch "crictl ps | grep etcd"` to see when the ETCD pod is restarted.
   >
   > Note 2: If the etcd pod is not getting `Ready 1/1`, then restart it by `kubectl delete pod -n kube-system etcd-controlplane` and wait 1 minute.
   >
   > Note 3: This is the simplest way to make sure that ETCD uses the restored data after the ETCD pod is recreated. You **don't** have to change anything else.

   If you do change `--data-dir` to `/var/lib/etcd-from-backup` in the ETCD YAML file, make sure that the `volumeMounts` for `etcd-data` is updated as well, with the mountPath pointing to `/var/lib/etcd-from-backup` **(THIS COMPLETE STEP IS OPTIONAL AND NEED NOT BE DONE FOR COMPLETING THE RESTORE)**

   ```
   controlplane ~ ➜  kubectl get deployments.apps 
   NAME   READY   UP-TO-DATE   AVAILABLE   AGE
   blue   3/3     3            3           38m
   red    2/2     2            2           38m
   
   controlplane ~ ➜  kubectl get service
   NAME           TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
   blue-service   NodePort    10.104.69.24   <none>        80:30082/TCP   38m
   kubernetes     ClusterIP   10.96.0.1      <none>        443/TCP        53m
   red-service    NodePort    10.99.41.19    <none>        80:30080/TCP   38m
   ```



## PRACTICE TEST BACKUP AND RESTORE METHODS 2

1. In this lab environment, you will get to work with `multiple` kubernetes clusters where we will practice backing up and restoring the `ETCD` database.

2. You will notice that, you are logged in to the `student-node` (instead of the `controlplane`).

   The `student-node` has the `kubectl` client and has access to all the `Kubernetes` clusters that are configured in the lab environment.

   Before proceeding to the next question, explore the `student-node` and the clusters it has access to.

   Ok

3. How many `clusters` are defined in the kubeconfig on the `student-node`?

   You can make use of the `kubectl config` command.

   - 4
   - **2**
   - 0
   - 1
   - 3

   ```
   
   apiVersion: v1
   clusters:
   - cluster:
       certificate-authority-data: DATA+OMITTED
       server: https://cluster1-controlplane:6443
     name: cluster1
   - cluster:
       certificate-authority-data: DATA+OMITTED
       server: https://10.6.187.9:6443
     name: cluster2
   contexts:
   - context:
       cluster: cluster1
       user: cluster1
     name: cluster1
   - context:
       cluster: cluster2
       user: cluster2
     name: cluster2
   current-context: cluster1
   kind: Config
   preferences: {}
   users:
   - name: cluster1
     user:
       client-certificate-data: REDACTED
       client-key-data: REDACTED
   - name: cluster2
     user:
       client-certificate-data: REDACTED
       client-key-data: REDACTED
   ```

4. How many nodes (both controlplane and worker) are part of `cluster1`?

   Make sure to switch the context to `cluster1`:

   ```sh
   kubectl config use-context cluster1
   ```

   - 0
   - 3
   - **2**
   - 1
   - 4

   ```
   student-node ~ ➜  kubectl config use-context cluster1
   Switched to context "cluster1".
   
   student-node ~ ➜  kubectl get nodes 
   NAME                    STATUS   ROLES           AGE   VERSION
   cluster1-controlplane   Ready    control-plane   22m   v1.24.0
   cluster1-node01         Ready    <none>          22m   v1.24.0
   ```

5. What is the name of the controlplane node in `cluster2`?

   Make sure to switch the context to `cluster2`:

   ```sh
   kubectl config use-context cluster2
   ```

   - cluster1-controlplane
   - **cluster2-controlplane**
   - cluster2controlplane
   - controlplane-cluster2
   - cluster2-master
   - controlplane

   ```
   student-node ~ ➜  kubectl config use-context cluster2
   Switched to context "cluster2".
   
   student-node ~ ➜  kubectl get nodes
   NAME                    STATUS   ROLES           AGE   VERSION
   cluster2-controlplane   Ready    control-plane   26m   v1.24.0
   cluster2-node01         Ready    <none>          25m   v1.24.0
   ```

6. You can SSH to all the nodes (of both clusters) from the `student-node`.

   For example:

   ```sh
   student-node ~ ➜  ssh cluster1-controlplane
   Welcome to Ubuntu 18.04.6 LTS (GNU/Linux 5.4.0-1086-gcp x86_64)
   
    * Documentation:  https://help.ubuntu.com
    * Management:     https://landscape.canonical.com
    * Support:        https://ubuntu.com/advantage
   This system has been minimized by removing packages and content that are
   not required on a system that users do not log into.
   
   To restore this content, you can run the 'unminimize' command.
   
   cluster1-controlplane ~ ➜ 
   ```

   To get back to the `student` node, use the `logout` or `exit` command, or, hit `Control +D`

   ```sh
   cluster1-controlplane ~ ➜  logout
   Connection to cluster1-controlplane closed.
   
   student-node ~ ➜  
   ```

   Ok

7. How is `ETCD` configured for `cluster1`?

   Remember, you can access the clusters from `student-node` using the `kubectl` tool. You can also `ssh` to the cluster nodes from the `student-node`.

   Make sure to switch the context to `cluster1`:

   ```sh
   kubectl config use-context cluster1
   ```

   - External ETCD
   - **Stacked ETCD**
   - No ETCD

   If you check out the pods running in the `kube-system` namespace in `cluster1`, you will notice that `etcd` is running as a pod:

   ```
   student-node ~ ➜  kubectl config use-context cluster1 
   Switched to context "cluster1".
   
   student-node ~ ➜  kubectl get pods -n kube-system 
   NAME                                            READY   STATUS    RESTARTS      AGE
   coredns-6d4b75cb6d-8pwt7                        1/1     Running   0             31m
   coredns-6d4b75cb6d-gsrzf                        1/1     Running   0             31m
   etcd-cluster1-controlplane                      1/1     Running   0             31m
   kube-apiserver-cluster1-controlplane            1/1     Running   0             31m
   kube-controller-manager-cluster1-controlplane   1/1     Running   0             31m
   kube-proxy-vfp62                                1/1     Running   0             30m
   kube-proxy-x57t8                                1/1     Running   0             31m
   kube-scheduler-cluster1-controlplane            1/1     Running   0             31m
   weave-net-hldk6                                 2/2     Running   0             30m
   weave-net-kwhc7                                 2/2     Running   1 (31m ago)   31m
   
   OR
   
   student-node ~ ➜  kubectl get pods -n kube-system | grep etcd
   etcd-cluster1-controlplane                      1/1     Running   0             32m
   ```

   This means that ETCD is set up as a `Stacked ETCD Topology` where the distributed data storage cluster provided by `etcd` is stacked on top of the cluster formed by the nodes managed by kubeadm that run control plane components.

8. How is `ETCD` configured for `cluster2`?

   Remember, you can access the clusters from `student-node` using the `kubectl` tool. You can also `ssh` to the cluster nodes from the `student-node`.

   Make sure to switch the context to `cluster2`:

   ```sh
   kubectl config use-context cluster2
   ```

   - No ETCD
   - **External ETCD**
   - Stacked ETCD

   ```
   ```

   If you check out the pods running in the `kube-system` namespace in `cluster1`, you will notice that there are **NO** `etcd` pods running in this cluster!

   ```sh
   student-node ~ ➜  kubectl config use-context cluster2
   Switched to context "cluster2".
   
   student-node ~ ➜  kubectl get pods -n kube-system  | grep etcd
   
   student-node ~ ✖ 
   ```

   Also, there is **NO** static pod configuration for `etcd` under the static pod path: (no etcd.yaml)

   ```sh
   student-node ~ ✖ ssh cluster2-controlplane
   Welcome to Ubuntu 18.04.6 LTS (GNU/Linux 5.4.0-1086-gcp x86_64)
   
    * Documentation:  https://help.ubuntu.com
    * Management:     https://landscape.canonical.com
    * Support:        https://ubuntu.com/advantage
   This system has been minimized by removing packages and content that are
   not required on a system that users do not log into.
   
   To restore this content, you can run the 'unminimize' command.
   Last login: Wed Aug 31 05:05:04 2022 from 10.1.127.14
   
   cluster2-controlplane ~ ➜  ls /etc/kubernetes/manifests/ | grep -i etcd
   
   cluster2-controlplane ~ ✖ 
   ```

   However, if you inspect the process on the controlplane for cluster2, you will see that that the process for the `kube-apiserver` is referencing an external etcd datastore:

   ```sh
   cluster2-controlplane ~ ✖ ps -ef | grep etcd
   root        1705    1320  0 05:03 ?        00:00:31 kube-apiserver --advertise-address=10.1.127.3 --allow-privileged=true --authorization-mode=Node,RBAC --client-ca-file=/etc/kubernetes/pki/ca.crt --enable-admission-plugins=NodeRestriction --enable-bootstrap-token-auth=true --etcd-cafile=/etc/kubernetes/pki/etcd/ca.pem --etcd-certfile=/etc/kubernetes/pki/etcd/etcd.pem --etcd-keyfile=/etc/kubernetes/pki/etcd/etcd-key.pem --etcd-servers=https://10.1.127.10:2379 --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key --requestheader-allowed-names=front-proxy-client --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --requestheader-extra-headers-prefix=X-Remote-Extra- --requestheader-group-headers=X-Remote-Group --requestheader-username-headers=X-Remote-User --secure-port=6443 --service-account-issuer=https://kubernetes.default.svc.cluster.local --service-account-key-file=/etc/kubernetes/pki/sa.pub --service-account-signing-key-file=/etc/kubernetes/pki/sa.key --service-cluster-ip-range=10.96.0.0/12 --tls-cert-file=/etc/kubernetes/pki/apiserver.crt --tls-private-key-file=/etc/kubernetes/pki/apiserver.key
   root        5754    5601  0 05:15 pts/0    00:00:00 grep etcd
   
   cluster2-controlplane ~ ➜  
   ```

   You can see the same information by inspecting the `kube-apiserver` pod (which runs as a static pod in the kube-system namespace):

   ```sh
   kubectl -n kube-system describe pod kube-apiserver-cluster2-controlplane 
   Name:                 kube-apiserver-cluster2-controlplane
   Namespace:            kube-system
   Priority:             2000001000
   Priority Class Name:  system-node-critical
   Node:                 cluster2-controlplane/10.6.187.9
   Start Time:           Sun, 08 Jan 2023 23:43:29 +0000
   Labels:               component=kube-apiserver
                         tier=control-plane
   Annotations:          kubeadm.kubernetes.io/kube-apiserver.advertise-address.endpoint: 10.6.187.9:6443
                         kubernetes.io/config.hash: 2cd013c2af46430a2a11ceff45701856
                         kubernetes.io/config.mirror: 2cd013c2af46430a2a11ceff45701856
                         kubernetes.io/config.seen: 2023-01-08T23:43:28.115612990Z
                         kubernetes.io/config.source: file
                         seccomp.security.alpha.kubernetes.io/pod: runtime/default
   Status:               Running
   IP:                   10.6.187.9
   IPs:
     IP:           10.6.187.9
   Controlled By:  Node/cluster2-controlplane
   Containers:
     kube-apiserver:
       Container ID:  containerd://f3b86a287f6bdad9c832180798db6a70f62a5b4adcf57da8994a0f8a26a99903
       Image:         k8s.gcr.io/kube-apiserver:v1.24.0
       Image ID:      k8s.gcr.io/kube-apiserver@sha256:a04522b882e919de6141b47d72393fb01226c78e7388400f966198222558c955
       Port:          <none>
       Host Port:     <none>
       Command:
         kube-apiserver
         --advertise-address=10.6.187.9
         --allow-privileged=true
         --authorization-mode=Node,RBAC
         --client-ca-file=/etc/kubernetes/pki/ca.crt
         --enable-admission-plugins=NodeRestriction
         --enable-bootstrap-token-auth=true
         --etcd-cafile=/etc/kubernetes/pki/etcd/ca.pem
         --etcd-certfile=/etc/kubernetes/pki/etcd/etcd.pem
         --etcd-keyfile=/etc/kubernetes/pki/etcd/etcd-key.pem
         --etcd-servers=https://10.6.187.20:2379
   --------- End of Snippet---------
   ```

9. What is the IP address of the `External ETCD` datastore used in `cluster2`?

   - 10.0.0.6
   - **10.9.65.15**
   - 192.168.1.1
   - 10.16.56.33

   ```
   cluster2-controlplane ~ ➜  ps -ef | grep etcd
   root        1735    1369  0 00:49 ?        00:02:02 kube-apiserver --advertise-address=10.9.65.3 --allow-privileged=true --authorization-mode=Node,RBAC --client-ca-file=/etc/kubernetes/pki/ca.crt --enable-admission-plugins=NodeRestriction --enable-bootstrap-token-auth=true --etcd-cafile=/etc/kubernetes/pki/etcd/ca.pem --etcd-certfile=/etc/kubernetes/pki/etcd/etcd.pem --etcd-keyfile=/etc/kubernetes/pki/etcd/etcd-key.pem --etcd-servers=https://10.9.65.15:2379 --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key --requestheader-allowed-names=front-proxy-client --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --requestheader-extra-headers-prefix=X-Remote-Extra- --requestheader-group-headers=X-Remote-Group --requestheader-username-headers=X-Remote-User --secure-port=6443 --service-account-issuer=https://kubernetes.default.svc.cluster.local --service-account-key-file=/etc/kubernetes/pki/sa.pub --service-account-signing-key-file=/etc/kubernetes/pki/sa.key --service-cluster-ip-range=10.96.0.0/12 --tls-cert-file=/etc/kubernetes/pki/apiserver.crt --tls-private-key-file=/etc/kubernetes/pki/apiserver.key
   root        7654    7479  0 01:27 pts/0    00:00:00 grep etcd
   ```
   
10. What is the default data directory used the for `ETCD` datastore used in `cluster1`?
      Remember, this cluster uses a `Stacked ETCD` topology.

   Make sure to switch the context to `cluster1`:

   ```sh
   kubectl config use-context cluster1
   ```

   - /etc/etcd/data-dir
   - /etc/etcd
   - /var/lib/etcd-data
   - **/var/lib/etcd**

   Inspect the value assigned to data-dir on the etcd pod:

   ```
   student-node ~ ➜  kubectl config use-context cluster1
   Switched to context "cluster1".
   
   student-node ~ ➜  kubectl describe pods -n kube-system etcd-cluster1-controlplane | grep data-dir
         --data-dir=/var/lib/etcd
   ```

11. For the subsequent questions, you would need to login to the `External ETCD` server.

    To do this, open a new terminal (using the `+` button located above the default terminal).

    From the new terminal you can now `SSH` from the `student-node` to either the `IP` of the ETCD datastore (that you identified in the previous questions) OR the hostname `etcd-server`:

    ![image-20230109083914009](images/image-20230109083914009.png)

12. What is the default data directory used the for `ETCD` datastore used in `cluster2`?
    Remember, this cluster uses an `External ETCD` topology.

    - /etc/etcd
    - /var/lib/etcd
    - /etc/etcd/data-dir
    - **/var/lib/etcd-data**

    ```
    student-node ~ ➜  ssh etcd-server
    Welcome to Ubuntu 18.04.6 LTS (GNU/Linux 5.4.0-1093-gcp x86_64)
    
     * Documentation:  https://help.ubuntu.com
     * Management:     https://landscape.canonical.com
     * Support:        https://ubuntu.com/advantage
    This system has been minimized by removing packages and content that are
    not required on a system that users do not log into.
    
    To restore this content, you can run the 'unminimize' command.
    
    etcd-server ~ ➜  ps -f | grep etcd
    root        1046     969  0 00:43 pts/0    00:00:00 grep etcd
    
    etcd-server ~ ➜  ps -ef | grep etcd
    etcd         855       1  0 Jan08 ?        00:01:04 /usr/local/bin/etcd --name etcd-server --data-dir=/var/lib/etcd-data --cert-file=/etc/etcd/pki/etcd.pem --key-file=/etc/etcd/pki/etcd-key.pem --peer-cert-file=/etc/etcd/pki/etcd.pem --peer-key-file=/etc/etcd/pki/etcd-key.pem --trusted-ca-file=/etc/etcd/pki/ca.pem --peer-trusted-ca-file=/etc/etcd/pki/ca.pem --peer-client-cert-auth --client-cert-auth --initial-advertise-peer-urls https://10.6.187.20:2380 --listen-peer-urls https://10.6.187.20:2380 --advertise-client-urls https://10.6.187.20:2379 --listen-client-urls https://10.6.187.20:2379,https://127.0.0.1:2379 --initial-cluster-token etcd-cluster-1 --initial-cluster etcd-server=https://10.6.187.20:2380 --initial-cluster-state new
    root        1103     969  0 00:43 pts/0    00:00:00 grep etcd
    ```

13. How many nodes are part of the `ETCD` cluster that `etcd-server` is a part of?

    - **1**
    - 4
    - 0
    - 2

    Check the members of the cluster:

    ```
    etcd-server ~ ➜  ETCDCTL_API=3 etcdctl \
     --endpoints=https://127.0.0.1:2379 \
     --cacert=/etc/etcd/pki/ca.pem \
     --cert=/etc/etcd/pki/etcd.pem \
     --key=/etc/etcd/pki/etcd-key.pem \
      member list
    defa974a89b844aa, started, etcd-server, https://10.6.187.20:2380, https://10.6.187.20:2379, false
    ```

    This shows that there is only one member in this cluster.

14. Take a backup of `etcd` on `cluster1` and save it on the `student-node` at the path `/opt/cluster1.db`

    

    If needed, make sure to set the context to `cluster1` (on the student-node):

    ```
    student-node ~ ➜  kubectl config use-context cluster1
    Switched to context "cluster1".
    
    student-node ~ ➜  
    ```

    Check

    - task completed?

    On the `student-node`:

    First set the context to `cluster1`:

    ```sh
    student-node ~ ➜  kubectl config use-context cluster1
    Switched to context "cluster1".
    ```

    
    Next, inspect the endpoints and certificates used by the `etcd` pod. We will make use of these to take the backup.

    ```sh
    student-node ~ ➜  student-node ~ ➜  kubectl config use-context cluster1
    Switched to context "cluster1".
    
    student-node ~ ➜  kubectl describe  pods -n kube-system etcd-cluster1-controlplane  | grep advertise-client-urls
    Annotations:          kubeadm.kubernetes.io/etcd.advertise-client-urls: https://10.9.65.23:2379
          --advertise-client-urls=https://10.9.65.23:2379
    
    student-node ~ ➜  
    
    student-node ~ ➜  kubectl describe  pods -n kube-system etcd-cluster1-controlplane  | grep advertise-client-urls
    Annotations:          kubeadm.kubernetes.io/etcd.advertise-client-urls: https://10.9.65.23:2379
          --advertise-client-urls=https://10.9.65.23:2379
    
    student-node ~ ➜  kubectl describe  pods -n kube-system etcd-cluster1-controlplane  | grep pki
          --cert-file=/etc/kubernetes/pki/etcd/server.crt
          --key-file=/etc/kubernetes/pki/etcd/server.key
          --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt
          --peer-key-file=/etc/kubernetes/pki/etcd/peer.key
          --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
          --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
          /etc/kubernetes/pki/etcd from etcd-certs (rw)
        Path:          /etc/kubernetes/pki/etcd
    
    student-node ~ ➜  
    ```

    
    SSH to the `controlplane` node of `cluster1` and then take the backup using the endpoints and certificates we identified above:

    ```
    cluster1-controlplane ~ ➜  ETCDCTL_API=3 etcdctl \
    > --endpoints=https://10.9.65.23:2379 \
    > --cacert=/etc/kubernetes/pki/etcd/ca.crt \
    > --cert=/etc/kubernetes/pki/etcd/server.crt \
    > --key=/etc/kubernetes/pki/etcd/server.key \
    > snapshot save /opt/cluster1.db
    Snapshot saved at /opt/cluster1.db
    ```

    
    Finally, copy the backup to the `student-node`. To do this, go back to the `student-node` and use `scp` as shown below:

    ```sh
    student-node ~ ➜  scp cluster1-controlplane:/opt/cluster1.db /opt
    cluster1.db                                                       100% 2104KB 146.0MB/s   00:00    
    ```

15. An `ETCD` backup for `cluster2` is stored at `/opt/cluster2.db`. Use this snapshot file to carryout a restore on `cluster2` to a new path `/var/lib/etcd-data-new`.

    Once the restore is complete, ensure that the controlplane components on `cluster2` are running.

    The snapshot was taken when there were objects created in the `critical` namespace on `cluster2`. These objects should be available post restore.

    If needed, make sure to set the context to `cluster2` (on the student-node):

    ```
    student-node ~ ➜  kubectl config use-context cluster2
    Switched to context "cluster2".
    
    student-node ~ ➜  
    ```

    Check

    - etcd restored to the new directory ?

    - kube-apiserver running on cluster2?

    - objects restored?

      

    Step 1. Copy the snapshot file from the student-node to the etcd-server. In the example below, we are copying it to the /root directory:

    ```sh
    student-node ~  scp /opt/cluster2.db etcd-server:/root
    cluster2.db                                                                                                        100% 1108KB 178.5MB/s   00:00    
    
    student-node ~ ➜  
    ```

    
    Step 2: Restore the snapshot on the `cluster2`. Since we are restoring directly on the `etcd-server`, we can use the endpoint `https:/127.0.0.1`. Use the same certificates that were identified earlier. Make sure to use the `data-dir` as `/var/lib/etcd-data-new`:

    ```sh
    etcd-server ~ ➜  ETCDCTL_API=3 etcdctl \
    > --endpoints=https://127.0.0.1:2379 \
    > --cacert=/etc/etcd/pki/ca.pem \
    > --cert=/etc/etcd/pki/etcd.pem \
    > --key=/etc/etcd/pki/etcd-key.pem \
    > snapshot restore /root/cluster2.db \
    > --data-dir /var/lib/etcd-data-new
    {"level":"info","ts":1673228688.6840649,"caller":"snapshot/v3_snapshot.go:296","msg":"restoring snapshot","path":"/root/cluster2.db","wal-dir":"/var/lib/etcd-data-new/member/wal","data-dir":"/var/lib/etcd-data-new","snap-dir":"/var/lib/etcd-data-new/member/snap"}
    {"level":"info","ts":1673228688.7015152,"caller":"mvcc/kvstore.go:388","msg":"restored last compact revision","meta-bucket-name":"meta","meta-bucket-name-key":"finishedCompactRev","restored-compact-revision":3643}
    {"level":"info","ts":1673228688.7087736,"caller":"membership/cluster.go:392","msg":"added member","cluster-id":"cdf818194e3a8c32","local-member-id":"0","added-peer-id":"8e9e05c52164694d","added-peer-peer-urls":["http://localhost:2380"]}
    {"level":"info","ts":1673228688.7211502,"caller":"snapshot/v3_snapshot.go:309","msg":"restored snapshot","path":"/root/cluster2.db","wal-dir":"/var/lib/etcd-data-new/member/wal","data-dir":"/var/lib/etcd-data-new","snap-dir":"/var/lib/etcd-data-new/member/snap"}
    ```

    Step 3: Update the systemd service unit file for `etcd`by running `vi /etc/systemd/system/etcd.service` and add the new value for `data-dir`:

    ```sh
    [Unit]
    Description=etcd key-value store
    Documentation=https://github.com/etcd-io/etcd
    After=network.target
    
    [Service]
    User=etcd
    Type=notify
    ExecStart=/usr/local/bin/etcd \
      --name etcd-server \
      --data-dir=/var/lib/etcd-data-new \
    ---End of Snippet---
    ```

    
    Step 4: make sure the permissions on the new directory is correct (should be owned by `etcd` user):

    ```sh
    etcd-server /var/lib ➜  chown -R etcd:etcd /var/lib/etcd-data-new
    
    etcd-server /var/lib ➜ 
    
    
    etcd-server /var/lib ➜  ls -ld /var/lib/etcd-data-new/
    drwx------ 3 etcd etcd 4096 Sep  1 02:41 /var/lib/etcd-data-new/
    etcd-server /var/lib ➜ 
    ```

    
    Step 5: Finally, reload and restart the etcd service.

    ```sh
    etcd-server ~/default.etcd ➜  systemctl daemon-reload 
    etcd-server ~ ➜  systemctl restart etcd
    etcd-server ~ ➜  
    ```


    Step 6 (optional): It is recommended to restart controlplane components (e.g. kube-scheduler, kube-controller-manager, kubelet) to ensure that they don't rely on some stale data.



# SECURITY

## PRACTICE TEST VIEW CERTIFICATE DETAILS

1. Identify the certificate file used for the `kube-api server`

   - /etc/kubernetes/pki/kube-apiserver.crt
   - /etc/apiserver.crt
   - /etc/apiserver.key
   - /tmp/kube-apiserver.crt
   - **/etc/kubernetes/pki/apiserver.crt**

   Run the command `cat /etc/kubernetes/manifests/kube-apiserver.yaml` and look for the line --tls-cert-file

   ```
   controlplane ~ ➜  cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep tls-cert-file
       - --tls-cert-file=/etc/kubernetes/pki/apiserver.crt
   ```

   

2. Identify the Certificate file used to authenticate `kube-apiserver` as a client to `ETCD` Server

   - **/etc/kubernetes/pki/apiserver-etcd-client.crt**
   - /etc/kubernetes/pki/apiserver.crt
   - /etc/kubernetes/pki/apiserver-kubelet-client.crt
   - /etc/kubernetes/pki/apiserver-etcd-client.key
   - /etc/kubernetes/pki/apiserver-etcd.crt

   Look for etcd-certfile option in the file `/etc/kubernetes/manifests/kube-apiserver.yaml`

   ```
   controlplane ~ ➜  cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep etcd-certfile
       - --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt
   ```

3. Identify the key used to authenticate `kubeapi-server` to the `kubelet` server

   - **/etc/kubernetes/pki/apiserver-kubelet-client.key**
   - /etc/kubernetes/pki/apiserver-etcd-client.key
   - /etc/kubernetes/pki/front-proxy-client.key
   - /etc/kubernetes/pki/apiserver.key
   - /etc/kubernetes/pki/apiserver-kubelet-client.crt

   Look for kubelet-client-key option in the file `/etc/kubernetes/manifests/kube-apiserver.yaml`

   ```
   controlplane ~ ➜  cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep kubelet-client-key
       - --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key
   ```

4. Identify the ETCD Server Certificate used to host ETCD server

   - **/etc/kubernetes/pki/etcd/server.crt**
   - /etc/kubernetes/pki/apiserver.crt
   - /etc/kubernetes/pki/apiserver-etcd-client.crt
   - /etc/kubernetes/pki/etcd/ca.crt

   Look for `cert-file` option in the file `/etc/kubernetes/manifests/etcd.yaml`

   ```
   controlplane ~ ➜  cat /etc/kubernetes/manifests/etcd.yaml | grep cert-file
       - --cert-file=/etc/kubernetes/pki/etcd/server.crt
       - --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt
   ```

5. Identify the ETCD Server CA Root Certificate used to serve ETCD Server

   ETCD can have its own CA. So this may be a different CA certificate than the one used by kube-api server.

   - /etc/kubernetes/pki/etcd/server.crt
   - /etc/kubernetes/pki/apiserver-kubelet-client.crt
   - **/etc/kubernetes/pki/etcd/ca.crt**
   - /etc/kubernetes/pki/ca.crt

   Look for CA Certificate (`trusted-ca-file`) in file `/etc/kubernetes/manifests/etcd.yaml`

   ```
   controlplane ~ ➜  cat /etc/kubernetes/manifests/etcd.yaml | grep trusted-ca-file
       - --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
       - --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
   ```

6. What is the Common Name (CN) configured on the Kube API Server Certificate?

   **OpenSSL Syntax:** `openssl x509 -in file-path.crt -text -noout`

   - api-server
   - kube-api-server
   - kubernetes
   - **kube-apiserver**
   - kubeapi-server

   Run the command `openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text` and look for Subject CN.

   ```
   controlplane ~ ➜  openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text 
   Certificate:
       Data:
           Version: 3 (0x2)
           Serial Number: 4648182497223116912 (0x4081a95aa62c0870)
           Signature Algorithm: sha256WithRSAEncryption
           Issuer: CN = kubernetes
           Validity
               Not Before: Jan  9 01:36:28 2023 GMT
               Not After : Jan  9 01:36:28 2024 GMT
           Subject: CN = kube-apiserver
           Subject Public Key Info:
               Public Key Algorithm: rsaEncryption
                   RSA Public-Key: (2048 bit)
                   Modulus:
                       00:c2:35:1c:d8:58:51:32:91:b2:80:c7:96:92:be:
                       fa:9d:0c:b5:69:26:c7:38:1b:3b:c0:4d:ed:8f:b6:
                       0a:ad:4d:ca:52:24:6e:e5:37:20:1d:74:5e:06:17:
                       e1:a2:95:39:9f:18:fe:14:f3:3b:9f:74:01:ef:c1:
                       8a:6e:4b:58:7b:83:79:8f:f9:53:d5:ee:0d:66:58:
                       b6:16:35:25:c7:90:08:ed:9c:21:b4:49:50:75:14:
                       ca:01:3b:fb:e0:08:37:92:1f:1c:6c:cb:45:fb:a9:
                       e0:69:15:bc:39:be:e6:ce:46:0e:99:4d:79:3e:13:
                       6f:a1:fa:22:10:34:e5:0a:86:5a:a1:4d:f1:aa:2c:
                       10:33:7c:38:34:df:e3:99:9a:a9:66:07:f1:23:20:
                       c0:f6:8e:4f:1b:c9:a9:2e:05:42:e7:30:d5:bb:63:
                       87:f8:db:c7:8d:6d:bd:3e:f1:8f:de:5e:31:9b:03:
                       e3:99:c0:b5:b4:bb:bb:42:60:59:fc:1a:e3:02:b3:
                       ab:5b:45:6b:a1:ec:98:46:59:79:7c:98:01:15:c8:
                       e0:af:a2:e3:f3:40:5c:98:c9:c0:cd:74:28:a3:5e:
                       75:92:50:ad:8f:8e:74:ff:bf:82:c1:9a:5b:1c:31:
                       4d:0a:d8:cf:eb:df:69:87:af:ad:c3:3a:6f:6d:74:
                       1d:5f
                   Exponent: 65537 (0x10001)
   ```

7. What is the name of the CA who issued the Kube API Server Certificate?

   - kubernetes-ca
   - ca
   - **kubernetes**
   - kube-apiserver

   Run the command `openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text` and look for issuer

   ```'
   controlplane ~ ➜  openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text 
   Certificate:
       Data:
           Version: 3 (0x2)
           Serial Number: 4648182497223116912 (0x4081a95aa62c0870)
           Signature Algorithm: sha256WithRSAEncryption
           Issuer: CN = kubernetes
           Validity
               Not Before: Jan  9 01:36:28 2023 GMT
               Not After : Jan  9 01:36:28 2024 GMT
           Subject: CN = kube-apiserver
           Subject Public Key Info:
   ```

8. Which of the below alternate names is not configured on the Kube API Server Certificate?

   - kubernetes.default.svc
   - kubernetes
   - controlplane
   - **kube-master**

   Run the command `openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text` and look at Alternative Names

   ```
   controlplane ~ ➜  openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text 
   Certificate:
       Data:
           Version: 3 (0x2)
           Serial Number: 4648182497223116912 (0x4081a95aa62c0870)
           Signature Algorithm: sha256WithRSAEncryption
           Issuer: CN = kubernetes
           Validity
               Not Before: Jan  9 01:36:28 2023 GMT
               Not After : Jan  9 01:36:28 2024 GMT
           Subject: CN = kube-apiserver
           Subject Public Key Info:
               Public Key Algorithm: rsaEncryption
                   RSA Public-Key: (2048 bit)
                   Modulus:
                       00:c2:35:1c:d8:58:51:32:91:b2:80:c7:96:92:be:
                       fa:9d:0c:b5:69:26:c7:38:1b:3b:c0:4d:ed:8f:b6:
                       0a:ad:4d:ca:52:24:6e:e5:37:20:1d:74:5e:06:17:
                       e1:a2:95:39:9f:18:fe:14:f3:3b:9f:74:01:ef:c1:
                       8a:6e:4b:58:7b:83:79:8f:f9:53:d5:ee:0d:66:58:
                       b6:16:35:25:c7:90:08:ed:9c:21:b4:49:50:75:14:
                       ca:01:3b:fb:e0:08:37:92:1f:1c:6c:cb:45:fb:a9:
                       e0:69:15:bc:39:be:e6:ce:46:0e:99:4d:79:3e:13:
                       6f:a1:fa:22:10:34:e5:0a:86:5a:a1:4d:f1:aa:2c:
                       10:33:7c:38:34:df:e3:99:9a:a9:66:07:f1:23:20:
                       c0:f6:8e:4f:1b:c9:a9:2e:05:42:e7:30:d5:bb:63:
                       87:f8:db:c7:8d:6d:bd:3e:f1:8f:de:5e:31:9b:03:
                       e3:99:c0:b5:b4:bb:bb:42:60:59:fc:1a:e3:02:b3:
                       ab:5b:45:6b:a1:ec:98:46:59:79:7c:98:01:15:c8:
                       e0:af:a2:e3:f3:40:5c:98:c9:c0:cd:74:28:a3:5e:
                       75:92:50:ad:8f:8e:74:ff:bf:82:c1:9a:5b:1c:31:
                       4d:0a:d8:cf:eb:df:69:87:af:ad:c3:3a:6f:6d:74:
                       1d:5f
                   Exponent: 65537 (0x10001)
           X509v3 extensions:
               X509v3 Key Usage: critical
                   Digital Signature, Key Encipherment
               X509v3 Extended Key Usage: 
                   TLS Web Server Authentication
               X509v3 Basic Constraints: critical
                   CA:FALSE
               X509v3 Authority Key Identifier: 
                   keyid:EC:BA:AF:DE:EF:B9:C3:B6:F0:C3:3A:5A:A0:84:74:ED:C5:9A:03:E4
   
               X509v3 Subject Alternative Name: 
                   DNS:controlplane, DNS:kubernetes, DNS:kubernetes.default, DNS:kubernetes.default.svc, DNS:kubernetes.default.svc.cluster.local, IP Address:10.96.0.1, IP Address:10.10.217.3
       Signature Algorithm: sha256WithRSAEncryption
   ```

9. What is the Common Name (CN) configured on the ETCD Server certificate?

   - etcd-server
   - kubernetes
   - etcd
   - **controlplane**

   Run the command `openssl x509 -in /etc/kubernetes/pki/etcd/server.crt -text` and look for Subject CN.

   ```
   controlplane ~ ➜  openssl x509 -in /etc/kubernetes/pki/etcd/server.crt -text 
   Certificate:
       Data:
           Version: 3 (0x2)
           Serial Number: 5353748666609261462 (0x4a4c560c01f75b96)
           Signature Algorithm: sha256WithRSAEncryption
           Issuer: CN = etcd-ca
           Validity
               Not Before: Jan  9 01:36:29 2023 GMT
               Not After : Jan  9 01:36:29 2024 GMT
           Subject: CN = controlplane
           Subject Public Key Info:
   ```

10. How long, from the issued date, is the Kube-API Server Certificate valid for?

   File: `/etc/kubernetes/pki/apiserver.crt`

   - 2 Years
   - **1 Year**
   - 6 months
   - 10 years

   Run the command `openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text` and check on the Expiry date.

   ```
   controlplane ~ ➜  openssl x509 -in /etc/kubernetes/pki/etcd/server.crt -text 
   Certificate:
       Data:
           Version: 3 (0x2)
           Serial Number: 5353748666609261462 (0x4a4c560c01f75b96)
           Signature Algorithm: sha256WithRSAEncryption
           Issuer: CN = etcd-ca
           Validity
               Not Before: Jan  9 01:36:29 2023 GMT
               Not After : Jan  9 01:36:29 2024 GMT
   ```

11. How long, from the issued date, is the Root CA Certificate valid for?

    File: `/etc/kubernetes/pki/ca.crt`

    - **10 years**
    - 6 Months
    - 1 Year
    - 2 Years

    Run the command `openssl x509 -in /etc/kubernetes/pki/ca.crt -text` and look for validity

    ```
    controlplane ~ ➜  openssl x509 -in /etc/kubernetes/pki/ca.crt -text 
    Certificate:
        Data:
            Version: 3 (0x2)
            Serial Number: 0 (0x0)
            Signature Algorithm: sha256WithRSAEncryption
            Issuer: CN = kubernetes
            Validity
                Not Before: Jan  9 01:36:28 2023 GMT
                Not After : Jan  6 01:36:28 2033 GMT
    ```

12. Kubectl suddenly stops responding to your commands. Check it out! Someone recently modified the `/etc/kubernetes/manifests/etcd.yaml` file

    You are asked to investigate and fix the issue. Once you fix the issue wait for sometime for kubectl to respond. Check the logs of the ETCD container.

    Check

    - Fix the kube-api server

    The certificate file used here is incorrect. It is set to `/etc/kubernetes/pki/etcd/server-certificate.crt` which does not exist. As we saw in the previous questions the correct path should be `/etc/kubernetes/pki/etcd/server.crt`.

    ```
    controlplane ~ ➜  ls -l /etc/kubernetes/pki/etcd/server*
    -rw-r--r-- 1 root root 1208 Jan  8 20:36 /etc/kubernetes/pki/etcd/server.crt
    -rw------- 1 root root 1675 Jan  8 20:36 /etc/kubernetes/pki/etcd/server.key
    ```

    Update the YAML file with the correct certificate path and wait for the ETCD pod to be recreated. wait for the `kube-apiserver` to get to a `Ready` state.

    ```
    apiVersion: v1
    kind: Pod
    metadata:
      annotations:
        kubeadm.kubernetes.io/etcd.advertise-client-urls: https://10.10.217.3:2379
      creationTimestamp: null
      labels:
        component: etcd
        tier: control-plane
      name: etcd
      namespace: kube-system
    spec:
      containers:
      - command:
        - etcd
        - --advertise-client-urls=https://10.10.217.3:2379
        - --cert-file=/etc/kubernetes/pki/etcd/server.crt
    ```

    **NOTE**: It may take a few minutes for the kubectl commands to work again so please be patient.

13. The kube-api server stopped again! Check it out. Inspect the kube-api server logs and identify the root cause and fix the issue.

    Run `crictl ps -a` command to identify the kube-api server container. Run `crictl logs container-id` command to view the logs.

    Check

    - Fix the kube-api server

    

    If we inspect the `kube-apiserver` container on the `controlplane`, we can see that it is frequently exiting.

    ```sh
    controlplane ~ ➜  crictl ps -a
    CONTAINER           IMAGE               CREATED              STATE               NAME                      ATTEMPT             POD ID              POD
    649683ee12cf3       a31e1d84401e6       4 seconds ago        Running             kube-apiserver            2                   2877a141236c3       kube-apiserver-controlplane
    d4a916dd08bbb       a31e1d84401e6       47 seconds ago       Exited              kube-apiserver            1                   2877a141236c3       kube-apiserver-controlplane
    de432709238aa       5d7c5dfd3ba18       About a minute ago   Running             kube-controller-manager   2                   66b1436f4ef8d       kube-controller-manager-controlplane
    1d9251fff3dcf       dafd8ad70b156       About a minute ago   Running             kube-scheduler            2                   3a87331c73489       kube-scheduler-controlplane
    e992e23f1738a       fce326961ae2d       2 minutes ago        Running             etcd                      0                   f5b9f298d0000       etcd-controlplane
    7a9bc39d91501       dafd8ad70b156       9 minutes ago        Exited              kube-scheduler            1                   3a87331c73489       kube-scheduler-controlplane
    75f3760beea14       5d7c5dfd3ba18       9 minutes ago        Exited              kube-controller-manager   1                   66b1436f4ef8d       kube-controller-manager-controlplane
    7e25a4326e1e1       5185b96f0becf       About an hour ago    Running             coredns                   0                   22355cead5172       coredns-787d4945fb-s2vq5
    b9f7a5e80eedc       5185b96f0becf       About an hour ago    Running             coredns                   0                   f7ae9b34b2d6a       coredns-787d4945fb-qvgkv
    781d365505277       8b675dda11bb1       About an hour ago    Running             kube-flannel              0                   6ac4f35b7ecab       kube-flannel-ds-6rdjn
    fbae98f0c75e8       8b675dda11bb1       About an hour ago    Exited              install-cni               0                   6ac4f35b7ecab       kube-flannel-ds-6rdjn
    ad04494f631b8       fcecffc7ad4af       About an hour ago    Exited              install-cni-plugin        0                   6ac4f35b7ecab       kube-flannel-ds-6rdjn
    4f0e813d56329       556768f31eb1d       About an hour ago    Running             kube-proxy                0                   39fe85c8d8c6a       kube-proxy-hshll
    
    OR
    
    controlplane ~ ➜  crictl ps -a | grep kube-apiserver
    0bb356c08c5be       a31e1d84401e6       About a minute ago   Exited              kube-apiserver            5                   2877a141236c3       kube-apiserver-controlplane
    ```

    If we now inspect the logs of this exited container, we would see the following errors:

    ```sh
    controlplane ~ ➜  crictl logs --tail=2 0bb356c08c5be
    }. Err: connection error: desc = "transport: authentication handshake failed: x509: certificate signed by unknown authority"
    E0109 02:43:05.692397       1 run.go:74] "command failed" err="context deadline exceeded"
    ```

    This indicates an issue with the ETCD CA certificate used by the `kube-apiserver`. Correct it to use the file `/etc/kubernetes/pki/etcd/ca.crt`.

    ```
    apiVersion: v1
    kind: Pod
    metadata:
      annotations:
        kubeadm.kubernetes.io/kube-apiserver.advertise-address.endpoint: 10.10.217.3:6443
      creationTimestamp: null
      labels:
        component: kube-apiserver
        tier: control-plane
      name: kube-apiserver
      namespace: kube-system
    spec:
      containers:
      - command:
        - kube-apiserver
        - --advertise-address=10.10.217.3
        - --allow-privileged=true
        - --authorization-mode=Node,RBAC
        - --client-ca-file=/etc/kubernetes/pki/ca.crt
        - --enable-admission-plugins=NodeRestriction
        - --enable-bootstrap-token-auth=true
        - --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt
    ```

    Once the YAML file has been saved, wait for the `kube-apiserver` pod to be `Ready`. This can take a couple of minutes.



## PRACTICE TEST CERTIFICATES API

1. A new member `akshay` joined our team. He requires access to our cluster. The Certificate Signing Request is at the `/root` location.

   Inspect it

   Ok

   ```
   controlplane ~ ➜  ls
   akshay.csr  akshay.key
   ```

2. Create a **CertificateSigningRequest** object with the name `akshay` with the contents of the `akshay.csr` file

   As of kubernetes 1.19, the API to use for CSR is `certificates.k8s.io/v1`.

   Please note that an additional field called `signerName` should also be added when creating CSR. For client authentication to the API server we will use the built-in signer `kubernetes.io/kube-apiserver-client`.

   Check

   - CSR akshay created
   - Right CSR is used


   Use this command to generate the base64 encoded format as following: -

   ```sh
   controlplane ~ ➜  cat akshay.csr | base64 -w 0
   LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1ZqQ0NBVDRDQVFBd0VURVBNQTBHQTFVRUF3d0dZV3R6YUdGNU1JSUJJakFOQmdrcWhraUc5dzBCQVFFRgpBQU9DQVE4QU1JSUJDZ0tDQVFFQTJhRFpuZW1JMzJUNzB2a2hWT1BHMytlKzVpTk9SeGUwZTlwbEVVZ3pwcldZClZ1UzhDTjM0S1NsV0hWNDRRbWtuU3YrMTdNUGJsTUVZNm9jQmJKUFJrYmZBSlVjOVhhVnVLcGN1VkJ1WDRVbmwKMmlRZkQ5NnB3TjkxbVVkWCsxcUNXbzYxVWNpRUV3SjR6N0FBMFlOb05nNkRaY1lwMW5BZWhkNUVhUTd2Rjl2UQp3emFxcy9VbTBYdlBpazRHYU5tZDZNSU5LdzdNT2IyYmNCQ3RrR0s5emc1aTJNZ2g5UDBkcThlWkNwSVQ1c3FXCndMQ3FnaUltbkMyMnliamVVTnk0dEJsVXhDR1liaW1KWnB3K2ljZUJoVUI2bmVsRFVnN3J3ZWN6dkVUbklLbnAKUkhOU09hYnBVN3g3MG5JZDhpSlByTWg0NDJONk5DK0dyR3VLVVF5dVpRSURBUUFCb0FBd0RRWUpLb1pJaHZjTgpBUUVMQlFBRGdnRUJBRzRGbEF4Y0tnSVh2S2FiWDh4VDgyUzBEWmN0R3VUQUFXQmZJSWFOd2h2WVpyaGJWTWJ5CkU2U0pyWVpHWjRhNlVINnBGdnB5K2VVYmhNSGVPSUpobThBMHpCSXltNlFpaG9rMmlPZCtYVk5RekJiY0lFeWkKQ0VTcURleURrMGhWYm0zUWdJeEFpMDVRRTFQSmQ4aXlLbjB4NlowNHRtNzduYWZyaWdHMDBhWGpmekNOMlc3UwpxZ3dtUE1vZVdHV01NUXkwSDI1ZSszNXBaMTNoeFEzbEtJbEZ4b1p5NXZLWjN3NkZ0M1JBTStmSEpVcXd2UHNICjlMSGpYSy9BbldncmRab1VUUThWaFRDTitES0pjNlBNYmMxSzJnSUxHcWRBM0xsUWZJMHFiQ1E2aktnMnYrcE8KV0ZpSzFwdWhkM0V6QzM2VzZSMHh5ZWwwcXlPWDJScjhrdFU9Ci0tLS0tRU5EIENFUlRJRklDQVRFIFJFUVVFU1QtLS0tLQo=
   ```

   -w 0 - prints in a single line

   and finally, create a CSR name `akshay` as follows: -

   Create akshay.yaml

   akshay.yaml

   ```yaml
   apiVersion: certificates.k8s.io/v1
   kind: CertificateSigningRequest
   metadata:
     name: akshay
   spec:
     request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1ZqQ0NBVDRDQVFBd0VURVBNQTBHQTFVRUF3d0dZV3R6YUdGNU1JSUJJakFOQmdrcWhraUc5dzBCQVFFRgpBQU9DQVE4QU1JSUJDZ0tDQVFFQTJhRFpuZW1JMzJUNzB2a2hWT1BHMytlKzVpTk9SeGUwZTlwbEVVZ3pwcldZClZ1UzhDTjM0S1NsV0hWNDRRbWtuU3YrMTdNUGJsTUVZNm9jQmJKUFJrYmZBSlVjOVhhVnVLcGN1VkJ1WDRVbmwKMmlRZkQ5NnB3TjkxbVVkWCsxcUNXbzYxVWNpRUV3SjR6N0FBMFlOb05nNkRaY1lwMW5BZWhkNUVhUTd2Rjl2UQp3emFxcy9VbTBYdlBpazRHYU5tZDZNSU5LdzdNT2IyYmNCQ3RrR0s5emc1aTJNZ2g5UDBkcThlWkNwSVQ1c3FXCndMQ3FnaUltbkMyMnliamVVTnk0dEJsVXhDR1liaW1KWnB3K2ljZUJoVUI2bmVsRFVnN3J3ZWN6dkVUbklLbnAKUkhOU09hYnBVN3g3MG5JZDhpSlByTWg0NDJONk5DK0dyR3VLVVF5dVpRSURBUUFCb0FBd0RRWUpLb1pJaHZjTgpBUUVMQlFBRGdnRUJBRzRGbEF4Y0tnSVh2S2FiWDh4VDgyUzBEWmN0R3VUQUFXQmZJSWFOd2h2WVpyaGJWTWJ5CkU2U0pyWVpHWjRhNlVINnBGdnB5K2VVYmhNSGVPSUpobThBMHpCSXltNlFpaG9rMmlPZCtYVk5RekJiY0lFeWkKQ0VTcURleURrMGhWYm0zUWdJeEFpMDVRRTFQSmQ4aXlLbjB4NlowNHRtNzduYWZyaWdHMDBhWGpmekNOMlc3UwpxZ3dtUE1vZVdHV01NUXkwSDI1ZSszNXBaMTNoeFEzbEtJbEZ4b1p5NXZLWjN3NkZ0M1JBTStmSEpVcXd2UHNICjlMSGpYSy9BbldncmRab1VUUThWaFRDTitES0pjNlBNYmMxSzJnSUxHcWRBM0xsUWZJMHFiQ1E2aktnMnYrcE8KV0ZpSzFwdWhkM0V6QzM2VzZSMHh5ZWwwcXlPWDJScjhrdFU9Ci0tLS0tRU5EIENFUlRJRklDQVRFIFJFUVVFU1QtLS0tLQo=
     signerName: kubernetes.io/kube-apiserver-client
     usages:
     - client auth
   ```

   ```
   controlplane ~ ➜  kubectl create -f akshay.yaml 
   certificatesigningrequest.certificates.k8s.io/akshay created
   ```

   

3. What is the Condition of the newly created Certificate Signing Request object?

   - Approved
   - **Pending**
   - Issued

   ```
   controlplane ~ ➜  kubectl get csr
   NAME        AGE   SIGNERNAME                                    REQUESTOR                  REQUESTEDDURATION   CONDITION
   akshay      74s   kubernetes.io/kube-apiserver-client           kubernetes-admin           <none>              Pending
   ```

4. Approve the CSR Request

   Check

   - CSR Approved

   ```
   controlplane ~ ➜  kubectl certificate approve akshay
   certificatesigningrequest.certificates.k8s.io/akshay approved
   
   controlplane ~ ➜  kubectl get csr
   NAME        AGE     SIGNERNAME                                    REQUESTOR                  REQUESTEDDURATION   CONDITION
   akshay      2m26s   kubernetes.io/kube-apiserver-client           kubernetes-admin           <none>              Approved,Issued
   ```

5. How many CSR requests are available on the cluster?

   Including approved and pending

   - 1
   - 4
   - **2**
   - 5
   - 3

   ```
   controlplane ~ ➜  kubectl get csr
   NAME        AGE     SIGNERNAME                                    REQUESTOR                  REQUESTEDDURATION   CONDITION
   akshay      3m20s   kubernetes.io/kube-apiserver-client           kubernetes-admin           <none>              Approved,Issued
   csr-trkc6   23m     kubernetes.io/kube-apiserver-client-kubelet   system:node:controlplane   <none>              Approved,Issued
   ```

6. During a routine check you realized that there is a new CSR request in place. What is the name of this request?

   - administrator
   - master
   - node
   - admin-user
   - **agent-smith**

   ```
   controlplane ~ ➜  kubectl get csr
   NAME          AGE     SIGNERNAME                                    REQUESTOR                  REQUESTEDDURATION   CONDITION
   agent-smith   45s     kubernetes.io/kube-apiserver-client           agent-x                    <none>              Pending
   akshay        4m13s   kubernetes.io/kube-apiserver-client           kubernetes-admin           <none>              Approved,Issued
   csr-trkc6     23m     kubernetes.io/kube-apiserver-client-kubelet   system:node:controlplane   <none>              Approved,Issued
   ```

7. Hmmm.. You are not aware of a request coming in. What groups is this CSR requesting access to?

   Check the details about the request. Preferebly in YAML.

   - system:apiserver
   - certificateapprovals
   - system:nodes
   - **system:masters**

   ```
   controlplane ~ ➜  kubectl get csr agent-smith -o yaml
   apiVersion: certificates.k8s.io/v1
   kind: CertificateSigningRequest
   metadata:
     creationTimestamp: "2023-01-09T04:06:08Z"
     name: agent-smith
     resourceVersion: "2250"
     uid: 56abc4c7-8ea5-43c9-a4cb-99de4f1d6009
   spec:
     groups:
     - system:masters
     - system:authenticated
     request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1dEQ0NBVUFDQVFBd0V6RVJNQThHQTFVRUF3d0libVYzTFhWelpYSXdnZ0VpTUEwR0NTcUdTSWIzRFFFQgpBUVVBQTRJQkR3QXdnZ0VLQW9JQkFRRE8wV0pXK0RYc0FKU0lyanBObzV2UklCcGxuemcrNnhjOStVVndrS2kwCkxmQzI3dCsxZUVuT041TXVxOTlOZXZtTUVPbnJEVU8vdGh5VnFQMncyWE5JRFJYall5RjQwRmJtRCs1eld5Q0sKeTNCaWhoQjkzTUo3T3FsM1VUdlo4VEVMcXlhRGtuUmwvanYvU3hnWGtvazBBQlVUcFdNeDRCcFNpS2IwVSt0RQpJRjVueEF0dE1Wa0RQUTdOYmVaUkc0M2IrUVdsVkdSL3o2RFdPZkpuYmZlek90YUF5ZEdMVFpGQy93VHB6NTJrCkVjQ1hBd3FDaGpCTGt6MkJIUFI0Sjg5RDZYYjhrMzlwdTZqcHluZ1Y2dVAwdEliT3pwcU52MFkwcWRFWnB3bXcKajJxRUwraFpFV2trRno4MGxOTnR5VDVMeE1xRU5EQ25JZ3dDNEdaaVJHYnJBZ01CQUFHZ0FEQU5CZ2txaGtpRwo5dzBCQVFzRkFBT0NBUUVBUzlpUzZDMXV4VHVmNUJCWVNVN1FGUUhVemFsTnhBZFlzYU9SUlFOd0had0hxR2k0CmhPSzRhMnp5TnlpNDRPT2lqeWFENnRVVzhEU3hrcjhCTEs4S2czc3JSRXRKcWw1ckxaeTlMUlZyc0pnaEQ0Z1kKUDlOTCthRFJTeFJPVlNxQmFCMm5XZVlwTTVjSjVURjUzbGVzTlNOTUxRMisrUk1uakRRSjdqdVBFaWM4L2RoawpXcjJFVU02VWF3enlrcmRISW13VHYybWxNWTBSK0ROdFYxWWllKzBIOS9ZRWx0K0ZTR2poNUw1WVV2STFEcWl5CjRsM0UveTNxTDcxV2ZBY3VIM09zVnBVVW5RSVNNZFFzMHFXQ3NiRTU2Q0M1RGhQR1pJcFVibktVcEF3a2ErOEUKdndRMDdqRytocGtueG11RkFlWHhnVXdvZEFMYUo3anUvVERJY3c9PQotLS0tLUVORCBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0K
     signerName: kubernetes.io/kube-apiserver-client
     usages:
     - digital signature
     - key encipherment
     - server auth
     username: agent-x
   status: {}
   ```

8. That doesn't look very right. Reject that request.

   Check

   - Request Denied

   ```
   controlplane ~ ➜  kubectl certificate deny agent-smith
   certificatesigningrequest.certificates.k8s.io/agent-smith denied
   
   controlplane ~ ➜  kubectl get csr
   NAME          AGE     SIGNERNAME                                    REQUESTOR                  REQUESTEDDURATION   CONDITION
   agent-smith   4m47s   kubernetes.io/kube-apiserver-client           agent-x                    <none>              Denied
   ```

9. Let's get rid of it. Delete the new CSR object

   Check

   - CSR agent-smith deleted

   ```
   controlplane ~ ➜  kubectl delete csr agent-smith 
   certificatesigningrequest.certificates.k8s.io "agent-smith" deleted
   ```



## PRACTICE TEST KUBECONFIG

1. Where is the default kubeconfig file located in the current environment?

   Find the current home directory by looking at the HOME environment variable.

   - /root/,kube/kubeconfig
   - /home/packer/.kube/config
   - /root/kubeconfig
   - **/root/.kube/config**

   ```
   controlplane ~ ➜  ls -la .kube/
   total 24
   drwxr-xr-x 3 root root 4096 Jan  9 02:19 .
   drwx------ 1 root root 4096 Jan  9 02:19 ..
   drwxr-x--- 4 root root 4096 Jan  9 02:19 cache
   -rw------- 1 root root 5640 Jan  9 02:10 config
   ```

2. How many clusters are defined in the default kubeconfig file?

   - 0
   - 3
   - **1**
   - 2

   ```
   controlplane ~ ➜  kubectl config view
   apiVersion: v1
   clusters:
   - cluster:
       certificate-authority-data: DATA+OMITTED
       server: https://controlplane:6443
     name: kubernetes
   contexts:
   - context:
       cluster: kubernetes
       user: kubernetes-admin
     name: kubernetes-admin@kubernetes
   current-context: kubernetes-admin@kubernetes
   kind: Config
   preferences: {}
   users:
   - name: kubernetes-admin
     user:
       client-certificate-data: DATA+OMITTED
       client-key-data: DATA+OMITTED
   ```

3. How many Users are defined in the default kubeconfig file?

   - 3
   - 0
   - **1**
   - 2

   ```
   controlplane ~ ➜  kubectl config view
   apiVersion: v1
   clusters:
   - cluster:
       certificate-authority-data: DATA+OMITTED
       server: https://controlplane:6443
     name: kubernetes
   contexts:
   - context:
       cluster: kubernetes
       user: kubernetes-admin
     name: kubernetes-admin@kubernetes
   current-context: kubernetes-admin@kubernetes
   kind: Config
   preferences: {}
   users:
   - name: kubernetes-admin
     user:
       client-certificate-data: DATA+OMITTED
       client-key-data: DATA+OMITTED
   ```

4. How many contexts are defined in the default kubeconfig file?

   - 4
   - 2
   - 3
   - **1**

   ```
   controlplane ~ ➜  kubectl config view
   apiVersion: v1
   clusters:
   - cluster:
       certificate-authority-data: DATA+OMITTED
       server: https://controlplane:6443
     name: kubernetes
   contexts:
   - context:
       cluster: kubernetes
       user: kubernetes-admin
     name: kubernetes-admin@kubernetes
   current-context: kubernetes-admin@kubernetes
   kind: Config
   preferences: {}
   users:
   - name: kubernetes-admin
     user:
       client-certificate-data: DATA+OMITTED
       client-key-data: DATA+OMITTED
   ```

5. What is the user configured in the current context?

   - sysadmin
   - kube-admin
   - root
   - **kubernetes-admin**
   - admin

   ```
   controlplane ~ ➜  kubectl config view
   apiVersion: v1
   clusters:
   - cluster:
       certificate-authority-data: DATA+OMITTED
       server: https://controlplane:6443
     name: kubernetes
   contexts:
   - context:
       cluster: kubernetes
       user: kubernetes-admin
     name: kubernetes-admin@kubernetes
   current-context: kubernetes-admin@kubernetes
   kind: Config
   preferences: {}
   users:
   - name: kubernetes-admin
     user:
       client-certificate-data: DATA+OMITTED
       client-key-data: DATA+OMITTED
   ```

6. What is the name of the cluster configured in the default kubeconfig file?

   - kube
   - kube-cluster
   - default-cluster
   - **kubernetes**

   ```
   controlplane ~ ➜  kubectl config view
   apiVersion: v1
   clusters:
   - cluster:
       certificate-authority-data: DATA+OMITTED
       server: https://controlplane:6443
     name: kubernetes
   contexts:
   - context:
       cluster: kubernetes
       user: kubernetes-admin
     name: kubernetes-admin@kubernetes
   current-context: kubernetes-admin@kubernetes
   kind: Config
   preferences: {}
   users:
   - name: kubernetes-admin
     user:
       client-certificate-data: DATA+OMITTED
       client-key-data: DATA+OMITTED
   ```

7. A new kubeconfig file named `my-kube-config` is created. It is placed in the `/root` directory. How many clusters are defined in that kubeconfig file?

   - 3
   - 2
   - 5
   - **4**
   - 1

   ```
   controlplane ~ ➜  kubectl config view --kubeconfig my-kube-config
   apiVersion: v1
   clusters:
   - cluster:
       certificate-authority: /etc/kubernetes/pki/ca.crt
       server: https://controlplane:6443
     name: development
   - cluster:
       certificate-authority: /etc/kubernetes/pki/ca.crt
       server: https://controlplane:6443
     name: kubernetes-on-aws
   - cluster:
       certificate-authority: /etc/kubernetes/pki/ca.crt
       server: https://controlplane:6443
     name: production
   - cluster:
       certificate-authority: /etc/kubernetes/pki/ca.crt
       server: https://controlplane:6443
     name: test-cluster-1
   contexts:
   - context:
       cluster: kubernetes-on-aws
       user: aws-user
     name: aws-user@kubernetes-on-aws
   - context:
       cluster: test-cluster-1
       user: dev-user
     name: research
   - context:
       cluster: development
       user: test-user
     name: test-user@development
   - context:
       cluster: production
       user: test-user
     name: test-user@production
   current-context: test-user@development
   kind: Config
   preferences: {}
   users:
   - name: aws-user
     user:
       client-certificate: /etc/kubernetes/pki/users/aws-user/aws-user.crt
       client-key: /etc/kubernetes/pki/users/aws-user/aws-user.key
   - name: dev-user
     user:
       client-certificate: /etc/kubernetes/pki/users/dev-user/developer-user.crt
       client-key: /etc/kubernetes/pki/users/dev-user/dev-user.key
   - name: test-user
     user:
       client-certificate: /etc/kubernetes/pki/users/test-user/test-user.crt
       client-key: /etc/kubernetes/pki/users/test-user/test-user.key
   ```

8. How many contexts are configured in the `my-kube-config` file?

   - 3
   - 2
   - 1
   - 5
   - **4**

   ```
   controlplane ~ ➜  kubectl config view --kubeconfig my-kube-config
   apiVersion: v1
   clusters:
   - cluster:
       certificate-authority: /etc/kubernetes/pki/ca.crt
       server: https://controlplane:6443
     name: development
   - cluster:
       certificate-authority: /etc/kubernetes/pki/ca.crt
       server: https://controlplane:6443
     name: kubernetes-on-aws
   - cluster:
       certificate-authority: /etc/kubernetes/pki/ca.crt
       server: https://controlplane:6443
     name: production
   - cluster:
       certificate-authority: /etc/kubernetes/pki/ca.crt
       server: https://controlplane:6443
     name: test-cluster-1
   contexts:
   - context:
       cluster: kubernetes-on-aws
       user: aws-user
     name: aws-user@kubernetes-on-aws
   - context:
       cluster: test-cluster-1
       user: dev-user
     name: research
   - context:
       cluster: development
       user: test-user
     name: test-user@development
   - context:
       cluster: production
       user: test-user
     name: test-user@production
   current-context: test-user@development
   kind: Config
   preferences: {}
   users:
   - name: aws-user
     user:
       client-certificate: /etc/kubernetes/pki/users/aws-user/aws-user.crt
       client-key: /etc/kubernetes/pki/users/aws-user/aws-user.key
   - name: dev-user
     user:
       client-certificate: /etc/kubernetes/pki/users/dev-user/developer-user.crt
       client-key: /etc/kubernetes/pki/users/dev-user/dev-user.key
   - name: test-user
     user:
       client-certificate: /etc/kubernetes/pki/users/test-user/test-user.crt
       client-key: /etc/kubernetes/pki/users/test-user/test-user.key
   ```

9. What user is configured in the `research` context?

   - admin-user
   - **Dev-user**
   - aws-user
   - test-user

   ```
   controlplane ~ ➜  kubectl config view --kubeconfig my-kube-config
   apiVersion: v1
   clusters:
   - cluster:
       certificate-authority: /etc/kubernetes/pki/ca.crt
       server: https://controlplane:6443
     name: development
   - cluster:
       certificate-authority: /etc/kubernetes/pki/ca.crt
       server: https://controlplane:6443
     name: kubernetes-on-aws
   - cluster:
       certificate-authority: /etc/kubernetes/pki/ca.crt
       server: https://controlplane:6443
     name: production
   - cluster:
       certificate-authority: /etc/kubernetes/pki/ca.crt
       server: https://controlplane:6443
     name: test-cluster-1
   contexts:
   - context:
       cluster: kubernetes-on-aws
       user: aws-user
     name: aws-user@kubernetes-on-aws
   - context:
       cluster: test-cluster-1
       user: dev-user
     name: research
   - context:
       cluster: development
       user: test-user
     name: test-user@development
   - context:
       cluster: production
       user: test-user
     name: test-user@production
   current-context: test-user@development
   kind: Config
   preferences: {}
   users:
   - name: aws-user
     user:
       client-certificate: /etc/kubernetes/pki/users/aws-user/aws-user.crt
       client-key: /etc/kubernetes/pki/users/aws-user/aws-user.key
   - name: dev-user
     user:
       client-certificate: /etc/kubernetes/pki/users/dev-user/developer-user.crt
       client-key: /etc/kubernetes/pki/users/dev-user/dev-user.key
   - name: test-user
     user:
       client-certificate: /etc/kubernetes/pki/users/test-user/test-user.crt
       client-key: /etc/kubernetes/pki/users/test-user/test-user.key
   ```

10. What is the name of the client-certificate file configured for the `aws-user`?

       - aws-certificate.crt

       - ca.crt

       - aws-user.key

       - **aws-user.crt**

    ```
    controlplane ~ ➜  kubectl config view --kubeconfig my-kube-config
    apiVersion: v1
    clusters:
    - cluster:
        certificate-authority: /etc/kubernetes/pki/ca.crt
        server: https://controlplane:6443
      name: development
    - cluster:
        certificate-authority: /etc/kubernetes/pki/ca.crt
        server: https://controlplane:6443
      name: kubernetes-on-aws
    - cluster:
        certificate-authority: /etc/kubernetes/pki/ca.crt
        server: https://controlplane:6443
      name: production
    - cluster:
        certificate-authority: /etc/kubernetes/pki/ca.crt
        server: https://controlplane:6443
      name: test-cluster-1
    contexts:
    - context:
        cluster: kubernetes-on-aws
        user: aws-user
      name: aws-user@kubernetes-on-aws
    - context:
        cluster: test-cluster-1
        user: dev-user
      name: research
    - context:
        cluster: development
        user: test-user
      name: test-user@development
    - context:
        cluster: production
        user: test-user
      name: test-user@production
    current-context: test-user@development
    kind: Config
    preferences: {}
    users:
    - name: aws-user
      user:
        client-certificate: /etc/kubernetes/pki/users/aws-user/aws-user.crt
        client-key: /etc/kubernetes/pki/users/aws-user/aws-user.key
    - name: dev-user
      user:
        client-certificate: /etc/kubernetes/pki/users/dev-user/developer-user.crt
        client-key: /etc/kubernetes/pki/users/dev-user/dev-user.key
    - name: test-user
      user:
        client-certificate: /etc/kubernetes/pki/users/test-user/test-user.crt
        client-key: /etc/kubernetes/pki/users/test-user/test-user.key
    ```

11. What is the current context set to in the `my-kube-config` file?

    - test-user@production
    - **test-user@development**
    - research
    - aws-user@kubernetes

    ```
    controlplane ~ ➜  kubectl config current-context --kubeconfig my-kube-config
    test-user@development
    ```

12. I would like to use the `dev-user` to access `test-cluster-1`. Set the current context to the right one so I can do that.

    Once the right context is identified, use the `kubectl config use-context` command.

    Check

    - Current context set

    

    To use that context, run the command: `kubectl config --kubeconfig=/root/my-kube-config use-context research`
    To know the current context, run the command: `kubectl config --kubeconfig=/root/my-kube-config current-context`

13. We don't want to have to specify the kubeconfig file option on each command. Make the `my-kube-config` file the default kubeconfig.

    Check

    - Default kubeconfig file configured

    Replace the contents in the `default` kubeconfig file with the content from `my-kube-config` file.

    

14. With the current-context set to `research`, we are trying to access the cluster. However something seems to be wrong. Identify and fix the issue.

    Try running the `kubectl get pods` command and look for the error. All users certificates are stored at `/etc/kubernetes/pki/users`.

    Check

    - Issue fixed

    The path to certificate is incorrect in the kubeconfig file. Correct the certificate name which is available at `/etc/kubernetes/pki/users/`.



## PRACTICE TEST ROLE BASED ACCESS CONTROLS

1. Inspect the environment and identify the authorization modes configured on the cluster.

   Check the `kube-apiserver` settings.

   - RBAC
   - **Node,RBAC**
   - ABAC
   - Node

   Use the command `kubectl describe pod kube-apiserver-controlplane -n kube-system` and look for `--authorization-mode`.

   ```
   controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS    RESTARTS   AGE
   coredns-787d4945fb-jfblj               1/1     Running   0          4m54s
   coredns-787d4945fb-l7wpz               1/1     Running   0          4m54s
   etcd-controlplane                      1/1     Running   0          5m8s
   kube-apiserver-controlplane            1/1     Running   0          5m8s
   kube-controller-manager-controlplane   1/1     Running   0          5m8s
   kube-proxy-kjblb                       1/1     Running   0          4m54s
   kube-scheduler-controlplane            1/1     Running   0          5m8s
   ```

   ```
   controlplane ~ ➜  kubectl describe pod kube-apiserver-controlplane -n kube-system | grep authorization-mode
         --authorization-mode=Node,RBAC
   ```

   OR

   Look for authorization-mode

   ```
   controlplane ~ ➜  cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep authorization-mode
       - --authorization-mode=Node,RBAC
   ```

   OR

   ```
   controlplane ~ ➜  ps -aux | grep authorization-mode
   root        2779  0.0  0.1 1125140 370508 ?      Ssl  21:26   0:14 kube-apiserver --advertise-address=10.0.108.8 --allow-privileged=true --authorization-mode=Node,RBAC --client-ca-file=/etc/kubernetes/pki/ca.crt --enable-admission-plugins=NodeRestriction --enab
   ```

   

2. How many roles exist in the `default` namespace?

   - 1
   - **0**
   - 3
   - 2

   ```
   controlplane ~ ➜  kubectl get roles
   No resources found in default namespace.
   ```

3. How many roles exist in all namespaces together?

   - **12**
   - 5
   - 15
   - 10
   - 1
   - 2
   - 0

   ```
   controlplane ~ ➜  kubectl get roles --all-namespaces --no-headers | wc -l
   12
   ```

   OR

   ```
   controlplane ~ ➜  kubectl get roles --all-namespaces
   NAMESPACE     NAME                                             CREATED AT
   blue          developer                                        2023-01-09T08:08:51Z
   kube-public   kubeadm:bootstrap-signer-clusterinfo             2023-01-09T08:00:59Z
   kube-public   system:controller:bootstrap-signer               2023-01-09T08:00:58Z
   kube-system   extension-apiserver-authentication-reader        2023-01-09T08:00:58Z
   kube-system   kube-proxy                                       2023-01-09T08:01:00Z
   kube-system   kubeadm:kubelet-config                           2023-01-09T08:00:58Z
   kube-system   kubeadm:nodes-kubeadm-config                     2023-01-09T08:00:58Z
   kube-system   system::leader-locking-kube-controller-manager   2023-01-09T08:00:58Z
   kube-system   system::leader-locking-kube-scheduler            2023-01-09T08:00:58Z
   kube-system   system:controller:bootstrap-signer               2023-01-09T08:00:58Z
   kube-system   system:controller:cloud-provider                 2023-01-09T08:00:58Z
   kube-system   system:controller:token-cleaner                  2023-01-09T08:00:58Z
   ```

4. What are the resources the `kube-proxy` role in the `kube-system` namespace is given access to?

   - deployments
   - secrets
   - **configmaps**
   - pods

   List roles

   ```
   controlplane ~ ➜  kubectl get roles -n kube-system 
   NAME                                             CREATED AT
   extension-apiserver-authentication-reader        2023-01-12T02:26:59Z
   kube-proxy                                       2023-01-12T02:27:02Z
   kubeadm:kubelet-config                           2023-01-12T02:26:59Z
   kubeadm:nodes-kubeadm-config                     2023-01-12T02:26:59Z
   system::leader-locking-kube-controller-manager   2023-01-12T02:26:59Z
   system::leader-locking-kube-scheduler            2023-01-12T02:26:59Z
   system:controller:bootstrap-signer               2023-01-12T02:26:59Z
   system:controller:cloud-provider                 2023-01-12T02:26:59Z
   system:controller:token-cleaner                  2023-01-12T02:26:59Z
   ```

   ```
   controlplane ~ ➜  kubectl describe roles -n kube-system kube-proxy 
   Name:         kube-proxy
   Labels:       <none>
   Annotations:  <none>
   PolicyRule:
     Resources   Non-Resource URLs  Resource Names  Verbs
     ---------   -----------------  --------------  -----
     configmaps  []                 [kube-proxy]    [get]
   ```

5. What actions can the `kube-proxy` role perform on `configmaps`?

   - List
   - Delete
   - Update
   - **Get**

   Run the command: `kubectl describe role -n kube-system kube-proxy` and check under the `Verbs` column.

   ```
   controlplane ~ ➜  kubectl describe role -n kube-system kube-proxy
   Name:         kube-proxy
   Labels:       <none>
   Annotations:  <none>
   PolicyRule:
     Resources   Non-Resource URLs  Resource Names  Verbs
     ---------   -----------------  --------------  -----
     configmaps  []                 [kube-proxy]    [get]
   ```

6. Which of the following statements are true?

   - kube-proxy role can get details of all configmap objects in the default namespace
   - **kube-proxy role can get details of configmap object by the name kube-proxy only**
   - kube-proxy role can get details of all configmap objects in the cluster
   - kube-proxy role can delete the configmap it created
   - kube-proxy role can only view and update configmap object by the name kube-proxy

7. Which account is the `kube-proxy` role assigned to?

   - kube-system
   - ServiceAccount: kube-proxy
   - User: kube-proxy
   - **Group: system:bootstrappers:kubeadm:default-node-token**
   - admin user

   List rolebindings

   ```
   controlplane ~ ➜  kubectl get rolebindings -n kube-system 
   NAME                                                ROLE                                                  AGE
   kube-proxy                                          Role/kube-proxy                                       10m
   kubeadm:kubelet-config                              Role/kubeadm:kubelet-config                           10m
   kubeadm:nodes-kubeadm-config                        Role/kubeadm:nodes-kubeadm-config                     10m
   system::extension-apiserver-authentication-reader   Role/extension-apiserver-authentication-reader        10m
   system::leader-locking-kube-controller-manager      Role/system::leader-locking-kube-controller-manager   10m
   system::leader-locking-kube-scheduler               Role/system::leader-locking-kube-scheduler            10m
   system:controller:bootstrap-signer                  Role/system:controller:bootstrap-signer               10m
   system:controller:cloud-provider                    Role/system:controller:cloud-provider                 10m
   system:controller:token-cleaner                     Role/system:controller:token-cleaner                  10m
   ```

   ```
   controlplane ~ ➜  kubectl describe rolebindings -n kube-system kube-proxy 
   Name:         kube-proxy
   Labels:       <none>
   Annotations:  <none>
   Role:
     Kind:  Role
     Name:  kube-proxy
   Subjects:
     Kind   Name                                             Namespace
     ----   ----                                             ---------
     Group  system:bootstrappers:kubeadm:default-node-token  
   ```

8. A user `dev-user` is created. User's details have been added to the `kubeconfig` file. Inspect the permissions granted to the user. Check if the user can list pods in the `default` namespace.

   Use the `--as dev-user` option with `kubectl` to run commands as the `dev-user`.

   - **dev-user does not have permissions to list pods**
   - dev-user has permissions to list pods

   Check if the dev-user added to the config

   ```
   controlplane ~ ➜  kubectl config view 
   apiVersion: v1
   clusters:
   - cluster:
       certificate-authority-data: DATA+OMITTED
       server: https://controlplane:6443
     name: kubernetes
   contexts:
   - context:
       cluster: kubernetes
       user: kubernetes-admin
     name: kubernetes-admin@kubernetes
   current-context: kubernetes-admin@kubernetes
   kind: Config
   preferences: {}
   users:
   - name: dev-user
     user:
       client-certificate-data: DATA+OMITTED
       client-key-data: DATA+OMITTED
   - name: kubernetes-admin
     user:
       client-certificate-data: DATA+OMITTED
       client-key-data: DATA+OMITTED
   ```

   Check if the user dev-user can list pods in the `default` namespace

   ```
   controlplane ~ ✖ kubectl get pods --as dev-user
   Error from server (Forbidden): pods is forbidden: User "dev-user" cannot list resource "pods" in API group "" in the namespace "default"
   ```

9. Create the necessary roles and role bindings required for the `dev-user` to create, list and delete pods in the `default` namespace.

   Use the given spec:

   Check

   - Role: developer
   - Role Resources: pods
   - Role Actions: list
   - Role Actions: create
   - Role Actions: delete
   - RoleBinding: dev-user-binding
   - RoleBinding: Bound to dev-user

   To create a Role:

   ```
   controlplane ~ ➜  kubectl create role developer --namespace=default --verb=list,create,delete --resource=pods
   role.rbac.authorization.k8s.io/developer created
   ```
   
   Check if role is created
   
   ```
   controlplane ~ ✖ kubectl get roles
   NAME        CREATED AT
   developer   2023-01-12T02:58:43Z
   
   controlplane ~ ➜  kubectl describe role developer 
   Name:         developer
   Labels:       <none>
   Annotations:  <none>
   PolicyRule:
     Resources  Non-Resource URLs  Resource Names  Verbs
     ---------  -----------------  --------------  -----
     pods       []                 []              [list create delete]
   ```
   
   
   
   To create a RoleBinding:
   
   ```
   controlplane ~ ➜  kubectl create rolebinding dev-user-binding --namespace=default --role=developer --user=dev-user
   rolebinding.rbac.authorization.k8s.io/dev-user-binding created
   ```
   
   ```
   controlplane ~ ➜  kubectl get rolebindings
   NAME               ROLE             AGE
   dev-user-binding   Role/developer   17s
   
   controlplane ~ ➜  kubectl describe rolebindings dev-user-binding 
   Name:         dev-user-binding
   Labels:       <none>
   Annotations:  <none>
   Role:
     Kind:  Role
     Name:  developer
   Subjects:
     Kind  Name      Namespace
     ----  ----      ---------
     User  dev-user  
   ```
   
      OR
   
   Solution manifest file to create a role and rolebinding in the `default` namespace:
   ```yaml
   kind: Role
   apiVersion: rbac.authorization.k8s.io/v1
   metadata:
     namespace: default
     name: developer
   rules:
   - apiGroups: [""]
     resources: ["pods"]
     verbs: ["list", "create","delete"]
   
   ---
   kind: RoleBinding
   apiVersion: rbac.authorization.k8s.io/v1
   metadata:
     name: dev-user-binding
   subjects:
   - kind: User
     name: dev-user
     apiGroup: rbac.authorization.k8s.io
   roleRef:
     kind: Role
     name: developer
     apiGroup: rbac.authorization.k8s.io
   ```


10. A set of new roles and role-bindings are created in the `blue` namespace for the `dev-user`. However, the `dev-user` is unable to get details of the `dark-blue-app` pod in the `blue` namespace. Investigate and fix the issue.

    We have created the required roles and rolebindings, but something seems to be wrong.

    Check

    - Issue Fixed

    Test if dev-user can do "get pods dark-blue-app"

    ```
    controlplane ~ ➜  kubectl --as dev-user get pods dark-blue-app -n blue
    Error from server (Forbidden): pods "dark-blue-app" is forbidden: User "dev-user" cannot get resource "pods" in API group "" in the namespace "blue"
    ```

    Check role developer

    - found out that Resource Names is "blue-app"

    ```
    controlplane ~ ✖ kubectl get roles -n blue 
    NAME        CREATED AT
    developer   2023-01-12T02:27:28Z
    
    controlplane ~ ➜  kubectl describe role -n blue developer 
    Name:         developer
    Labels:       <none>
    Annotations:  <none>
    PolicyRule:
      Resources  Non-Resource URLs  Resource Names  Verbs
      ---------  -----------------  --------------  -----
      pods       []                 [blue-app]      [get watch create delete]
    ```

    Edit role developer and change the resource name to from "blue-app" to "dark-blue-app"

    ```
    controlplane ~ ➜  kubectl edit role -n blue developer 
    ```

    Test if dev-user can do "get pods dark-blue-app"

    ```
    controlplane ~ ➜  kubectl --as dev-user get pods dark-blue-app -n blue
    NAME            READY   STATUS    RESTARTS   AGE
    dark-blue-app   1/1     Running   0          53m
    ```

    

11. Add a new rule in the existing role `developer` to grant the `dev-user` permissions to create deployments in the `blue` namespace.

    Remember to add api group `"apps"`.

    Check

    - Permission added to create deployment

    Check if dev-user can create deployment in namespace "blue"

    ```
    controlplane ~ ➜  kubectl --as dev-user create deployment nginx --image=-nginx -n blue
    error: failed to create deployment: deployments.apps is forbidden: User "dev-user" cannot create resource "deployments" in API group "apps" in the namespace "blue"
    ```
    
    
    
    Edit the `developer` role in the `blue` namespace to add a new rule under the `rules` section.
    
    Append the below rule to the end of the file
    
    ```
    controlplane ~ ✖ kubectl edit role developer -n blue
    ```
    
    ```
    - apiGroups:
      - apps
      resources:
      - deployments
      verbs:
      - get
      - watch
      - create
      - delete
    ```
    
    So it looks like this:
    
    ```
    apiVersion: rbac.authorization.k8s.io/v1
    kind: Role
    metadata:
      creationTimestamp: "2023-01-12T03:40:00Z"
      name: developer
      namespace: blue
      resourceVersion: "2898"
      uid: e8ea28fb-7e37-45d9-a9b9-3c2e2e9c2e49
    rules:
    - apiGroups:
      - ""
      resourceNames:
      - dark-blue-app
      resources:
      - pods
      verbs:
      - get
      - watch
      - create
      - delete
    - apiGroups:
      - apps
      resources:
      - deployments
      verbs:
      - get
      - watch
      - create
      - delete
    ```
    
    Check the role developer policy
    
    ```
    controlplane ~ ➜  kubectl describe role developer -n blue 
    Name:         developer
    Labels:       <none>
    Annotations:  <none>
    PolicyRule:
      Resources         Non-Resource URLs  Resource Names   Verbs
      ---------         -----------------  --------------   -----
      pods              []                 [dark-blue-app]  [get watch create delete]
      deployments.apps  []                 []               [get watch create delete]
    
    controlplane ~ ➜  kubectl edit role developer -n blue 
    Edit cancelled, no changes made.
    ```
    
    Check if dev-user can create deployment in namespace "blue"
    
    ```
    controlplane ~ ✖ kubectl --as dev-user create deployment nginx --image=nginx -n blue
    deployment.apps/nginx created
    ```
    
    



## PRACTICE TEST CLUSTER ROLES

1. For the first few questions of this lab, you would have to inspect the existing `ClusterRoles` and `ClusterRoleBindings` that have been created in this cluster.

   Ok

2. How many `ClusterRoles` do you see defined in the cluster?

   - 34
   - 119
   - 0
   - **69**
   - 10

   ```
   controlplane ~ ➜  kubectl get clusterroles --no-headers | wc -l
   69
   
   controlplane ~ ➜  kubectl get clusterroles --no-headers -o json | jq '.items | length'
   69
   ```

3. How many `ClusterRoleBindings` exist on the cluster?

   - 43
   - 19
   - **54**
   - 0
   - 119

   ```
   controlplane ~ ➜  kubectl get clusterrolebindings --no-headers | wc -l
   54
   
   controlplane ~ ➜  kubectl get clusterrolebindings --no-headers -o json | jq '.items | length'
   54
   ```

4. What namespace is the `cluster-admin` clusterrole part of?

   - default
   - **Cluster Roles are cluster wide and not part of any namespace**
   - kube-system
   - kube-public



5. What user/groups are the `cluster-admin` role bound to?

   The ClusterRoleBinding for the role is with the same name.

   - **system:masters**
   - cluster-admin
   - system:nodes
   - kube-admin

   Check clusterrolebindings associated the clusterrole "cluster-admin"

   ```
   controlplane ~ ➜  kubectl get clusterrolebindings | grep cluster-admincluster-admin                                          ClusterRole/cluster-admin                                          13m
   helm-kube-system-traefik-crd                           ClusterRole/cluster-admin                                          13m
   helm-kube-system-traefik                               ClusterRole/cluster-admin                                          13m
   ```

   

   ```
   controlplane ~ ➜  kubectl describe clusterrolebinding cluster-admin
   Name:         cluster-admin
   Labels:       kubernetes.io/bootstrapping=rbac-defaults
   Annotations:  rbac.authorization.kubernetes.io/autoupdate: true
   Role:
     Kind:  ClusterRole
     Name:  cluster-admin
   Subjects:
     Kind   Name            Namespace
     ----   ----            ---------
     Group  system:masters  
   ```

6. What level of permission does the `cluster-admin` role grant?

   Inspect the `cluster-admin` role's privileges.

   - **Perform any action on any resource in the cluster**
   - Security related tasks only
   - Pod level tasks only
   - Node level tasks only

   ```
   controlplane ~ ➜  kubectl describe clusterrole cluster-admin
   Name:         cluster-admin
   Labels:       kubernetes.io/bootstrapping=rbac-defaults
   Annotations:  rbac.authorization.kubernetes.io/autoupdate: true
   PolicyRule:
     Resources  Non-Resource URLs  Resource Names  Verbs
     ---------  -----------------  --------------  -----
     *.*        []                 []              [*]
                [*]                []              [*]
   ```

7. A new user `michelle` joined the team. She will be focusing on the `nodes` in the cluster. Create the required `ClusterRoles` and `ClusterRoleBindings` so she gets access to the `nodes`.

   Check

   - Grant permission to access nodes

   Check if michelle has access to the nodes

   ```
   controlplane ~ ✖ kubectl get nodes --as michelle
   Error from server (Forbidden): nodes is forbidden: User "michelle" cannot list resource "nodes" in API group "" at the cluster scope
   ```

   Create clusterrole

   ```
   controlplane ~ ➜  kubectl create clusterrole michelle-role --verb=get,list,create --resource=nodes
   clusterrole.rbac.authorization.k8s.io/michelle-role created
   
   controlplane ~ ➜  kubectl describe clusterrole michelle-role 
   Name:         michelle-role
   Labels:       <none>
   Annotations:  <none>
   PolicyRule:
     Resources  Non-Resource URLs  Resource Names  Verbs
     ---------  -----------------  --------------  -----
     nodes      []                 []              [get list create]
   ```

   Create clusterrolebinding

   ```
   controlplane ~ ➜  kubectl create clusterrolebinding michelle-role-binding --clusterrole=michelle-role --user=michelle
   clusterrolebinding.rbac.authorization.k8s.io/michelle-role-binding created
   
   controlplane ~ ➜  kubectl describe clusterrolebinding michelle-role-binding Name:         michelle-role-binding
   Labels:       <none>
   Annotations:  <none>
   Role:
     Kind:  ClusterRole
     Name:  michelle-role
   Subjects:
     Kind  Name      Namespace
     ----  ----      ---------
     User  michelle  
   ```

   Check if michelle has access to the nodes

   ```
   controlplane ~ ➜  kubectl get nodes --as michelleNAME           STATUS   ROLES                  AGE   VERSION
   controlplane   Ready    control-plane,master   34m   v1.26.0+k3s1
   ```

   

   Solution manifest file to create a clusterrole and clusterrolebinding for `michelle` user:

   ```yaml
   ---
   kind: ClusterRole
   apiVersion: rbac.authorization.k8s.io/v1
   metadata:
     name: node-admin
   rules:
   - apiGroups: [""]
     resources: ["nodes"]
     verbs: ["get", "watch", "list", "create", "delete"]
   
   ---
   kind: ClusterRoleBinding
   apiVersion: rbac.authorization.k8s.io/v1
   metadata:
     name: michelle-binding
   subjects:
   - kind: User
     name: michelle
     apiGroup: rbac.authorization.k8s.io
   roleRef:
     kind: ClusterRole
     name: node-admin
     apiGroup: rbac.authorization.k8s.io
   ```

   After save into a file, run the command `kubectl create -f <file-name>.yaml` to create a resources from definition file.

8. `michelle`'s responsibilities are growing and now she will be responsible for storage as well. Create the required `ClusterRoles` and `ClusterRoleBindings` to allow her access to Storage.

   Get the API groups and resource names from command `kubectl api-resources`. Use the given spec:

   Check

   - ClusterRole: storage-admin

   - Resource: persistentvolumes

   - Resource: storageclasses

   - ClusterRoleBinding: michelle-storage-admin

   - ClusterRoleBinding Subject: michelle

   - ClusterRoleBinding Role: storage-admin

   Create clusterrole
   
   ```
   controlplane ~ ➜  kubectl create clusterrole storage-admin --resource=persistentvolumes,storageclasses --verb=get,list,create,watch 
   clusterrole.rbac.authorization.k8s.io/storage-admin created
   
   controlplane ~ ➜  kubectl describe clusterrole storage-admin 
   Name:         storage-admin
   Labels:       <none>
   Annotations:  <none>
   PolicyRule:
     Resources                      Non-Resource URLs  Resource Names  Verbs
     ---------                      -----------------  --------------  -----
     persistentvolumes              []                 []              [get list create watch]
     storageclasses.storage.k8s.io  []                 []              [get list create watch]
   ```
   
   Create clusterrolebinding
   
   ```
   controlplane ~ ➜  kubectl create clusterrolebinding michelle-storage-admin --clusterrole=storage-admin --user=michelle
   clusterrolebinding.rbac.authorization.k8s.io/michelle-storage-admin created
   
   controlplane ~ ➜  kubectl describe clusterrolebinding michelle-storage-admin 
   Name:         michelle-storage-admin
   Labels:       <none>
   Annotations:  <none>
   Role:
     Kind:  ClusterRole
     Name:  storage-admin
   Subjects:
     Kind  Name      Namespace
     ----  ----      ---------
     User  michelle  
   ```
   
   Check if it is working
   
   ```
   controlplane ~ ➜  kubectl get storageclasses --as michelle
   NAME                   PROVISIONER             RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
   local-path (default)   rancher.io/local-path   Delete          WaitForFirstConsumer   false                  52m
   ```
   
   
   
   
   Solution manifest file to create a clusterrole and clusterrolebinding for `michelle` user:
   
   ```yaml
   ---
   kind: ClusterRole
   apiVersion: rbac.authorization.k8s.io/v1
   metadata:
     name: storage-admin
   rules:
   - apiGroups: [""]
     resources: ["persistentvolumes"]
     verbs: ["get", "watch", "list", "create", "delete"]
   - apiGroups: ["storage.k8s.io"]
     resources: ["storageclasses"]
     verbs: ["get", "watch", "list", "create", "delete"]
   
   ---
   kind: ClusterRoleBinding
   apiVersion: rbac.authorization.k8s.io/v1
   metadata:
     name: michelle-storage-admin
   subjects:
   - kind: User
     name: michelle
     apiGroup: rbac.authorization.k8s.io
   roleRef:
     kind: ClusterRole
     name: storage-admin
     apiGroup: rbac.authorization.k8s.io
   ```
   
   After save into a file, run the command `kubectl create -f <file-name>.yaml` to create a resources from definition file.



## PRACTICE TEST SERVICE ACCOUNTS

1. How many Service Accounts exist in the default namespace?

   - 0
   - 4
   - **2**
   - 1
   - 3

   ```
   controlplane ~ ➜  kubectl get serviceaccounts
   NAME      SECRETS   AGE
   default   0         3m56s
   dev       0         62s
   ```

   

2. What is the secret token used by the default service account?

   - default-token-zf6x9
   - default-token-j4hkv
   - default-token-87x8w
   - **none**

   Run the command `kubectl describe serviceaccount default` and look at the `Tokens` field.

   ```
   controlplane ~ ➜  kubectl describe serviceaccount default
   Name:                default
   Namespace:           default
   Labels:              <none>
   Annotations:         <none>
   Image pull secrets:  <none>
   Mountable secrets:   <none>
   Tokens:              <none>
   Events:              <none>
   ```

3. We just deployed the Dashboard application. Inspect the deployment. What is the image used by the deployment?

   - **gcr.io/kodekloud/customimage/my-kubernetes-dashboard**
   - web-dashboard
   - kodekloud/my-kubernetes-dashboard
   - kubernetes-dashboard

   ```
   controlplane ~ ➜  kubectl describe deployments.apps web-dashboard 
   Name:                   web-dashboard
   Namespace:              default
   CreationTimestamp:      Mon, 09 Jan 2023 09:16:48 +0000
   Labels:                 <none>
   Annotations:            deployment.kubernetes.io/revision: 1
   Selector:               name=web-dashboard
   Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
   StrategyType:           RollingUpdate
   MinReadySeconds:        0
   RollingUpdateStrategy:  25% max unavailable, 25% max surge
   Pod Template:
     Labels:  name=web-dashboard
     Containers:
      web-dashboard:
       Image:      gcr.io/kodekloud/customimage/my-kubernetes-dashboard
       Port:       8080/TCP
       Host Port:  0/TCP
       Environment:
         PYTHONUNBUFFERED:  1
       Mounts:              <none>
     Volumes:               <none>
   Conditions:
     Type           Status  Reason
     ----           ------  ------
     Available      True    MinimumReplicasAvailable
     Progressing    True    NewReplicaSetAvailable
   OldReplicaSets:  <none>
   NewReplicaSet:   web-dashboard-65b9cf6cbb (1/1 replicas created)
   Events:
     Type    Reason             Age    From                   Message
     ----    ------             ----   ----                   -------
     Normal  ScalingReplicaSet  2m15s  deployment-controller  Scaled up replica set web-dashboard-65b9cf6cbb to 1
   ```

4. Wait for the deployment to be ready. Access the custom-dashboard by clicking on the link to dashboard portal.

   Ok

5. What is the state of the dashboard? Have the pod details loaded successfully?

   - **Failed**
   - Success

6. What type of account does the Dashboard application use to query the Kubernetes API?

   - **Service Account**
   - OAuth Account
   - User Account
   - LDAP Account

   As evident from the error in the `web-dashboard` UI, the pod makes use of a service account to query the Kubernetes API.

7. Which account does the Dashboard application use to query the Kubernetes API?

   - Admin
   - Kube-admin
   - **Default**
   - Administrator

   Again, the name of the Service Account is displayed in the error message on the dashboard. The deployment makes use of the `default` service account which we inspected earlier.

8. Inspect the Dashboard Application POD and identify the Service Account mounted on it.

   - service-account
   - **default**
   - dashboard-sa

   Run the command `kubectl get po -o yaml` and inspect serviceAccount.

   ```
   controlplane ~ ➜  kubectl get pods -o yaml | grep serviceAccount
       serviceAccount: default
       serviceAccountName: default
           - serviceAccountToken:
   ```
   
9. At what location is the ServiceAccount credentials available within the pod?

   - **/var/run/secrets**
   - /var/run/token
   - /etc/run/secrets
   - /opt/run/secrets

   Run the command `kubectl describe pod` and look for volume mount path.

   ```
   controlplane ~ ➜  kubectl describe pod web-dashboard-65b9cf6cbb-7fxv9 | grep -i mount -A 5
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-fdhxl (ro)
   Conditions:
     Type              Status
     Initialized       True 
     Ready             True 
   ```
   
10. The application needs a ServiceAccount with the Right permissions to be created to authenticate to Kubernetes. The `default` ServiceAccount has limited access. Create a new ServiceAccount named `dashboard-sa`.

   Check

   - Service Account Name: dashboard-sa

   ```
   controlplane ~ ➜  kubectl create serviceaccount dashboard-sa
   serviceaccount/dashboard-sa created
   
   controlplane ~ ➜  kubectl get serviceaccounts 
   NAME           SECRETS   AGE
   default        0         17m
   dev            0         15m
   dashboard-sa   0         16s
   ```

11. We just added additional permissions for the newly created `dashboard-sa` account using RBAC.

    If you are interested checkout the files used to configure RBAC at `/var/rbac`. We will discuss RBAC in a separate section.

    Ok

    ```
    controlplane ~ ➜  ls -l /var/rbac/
    total 8
    -rw-rw-rw-    1 root     root           399 Jan  6 14:24 dashboard-sa-role-binding.yaml
    -rw-rw-rw-    1 root     root           191 Jan  6 14:24 pod-reader-role.yaml
    
    controlplane ~ ➜  cat /var/rbac/dashboard-sa-role-binding.yaml 
    ---
    kind: RoleBinding
    apiVersion: rbac.authorization.k8s.io/v1
    metadata:
      name: read-pods
      namespace: default
    subjects:
    - kind: ServiceAccount
      name: dashboard-sa # Name is case sensitive
      namespace: default
    roleRef:
      kind: Role #this must be Role or ClusterRole
      name: pod-reader # this must match the name of the Role or ClusterRole you wish to bind to
      apiGroup: rbac.authorization.k8s.io
    ```

12. Enter the access token in the UI of the dashboard application. Click `Load Dashboard` button to load Dashboard

    Create an authorization token for the newly created service account, copy the generated token and paste it into the `token` field of the UI.

    To do this, run `kubectl create token dashboard-sa` for the `dashboard-sa` service account, copy the token and paste it in the UI.

    ```
    controlplane ~ ➜  kubectl create token dashboard-sa
    eyJhbGciOiJSUzI1NiIsImtpZCI6IldWRmp0Rm9aREZOZE5TRWVKem1kcm52akxvZGZzRGFVaFRhQm42b1BhUkUifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiLCJrM3MiXSwiZXhwIjoxNjczMjYyNTUyLCJpYXQiOjE2NzMyNTg5NTIsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJkZWZhdWx0Iiwic2VydmljZWFjY291bnQiOnsibmFtZSI6ImRhc2hib2FyZC1zYSIsInVpZCI6ImFkYjU5ZDkxLWY1YjgtNDc3Yy04M2VlLTI0ZDIyMzVmNTNiYyJ9fSwibmJmIjoxNjczMjU4OTUyLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6ZGVmYXVsdDpkYXNoYm9hcmQtc2EifQ.XlpfiDfF7Kle_UvWYujf18A7OIwMtZTKMVC0BdbPv_OsJ2OWY-K17X2D7HnRpTkoCrP_tu6iBtl-p2hrbvCuJ7Hax1X9np3aXW7Be892rSTifLcJJMMkKf5_6GWBVg8St6ItCW3m_JkVfqtsjvBmR_AjOaSji9qYXSEdx7m5sJWiaA76b3sDGnn-ucRtXIaeqhw7mpM4T1cqn9hvSif32J2Kif-8Q_yj35wIsHD6yKBKEcqLXf-Ky-DL2-Zg_Bqu4ZZFkdeV-4_VMmWyzUw8ObiF1kwKdwxAh80lAtB9txFwbjOX3pkTPVQ-sR4_8sWl-n-d9gOGp04Bs0Kd3srdug
    ```

13. You shouldn't have to copy and paste the token each time. The Dashboard application is programmed to read token from the secret mount location. However currently, the `default` service account is mounted. Update the deployment to use the newly created ServiceAccount

    Edit the deployment to change ServiceAccount from `default` to `dashboard-sa`.

    Check

    - Deployment name: web-dashboard
    - Service Account: dashboard-sa
    - Deployment Ready

    Use the `kubectl edit` command for the deployment and specify the `serviceAccountName` field inside the pod spec.

    OR

    Make use of the `kubectl set` command. Run the following command to use the newly created service account: - `kubectl set serviceaccount deploy/web-dashboard dashboard-sa`

    Use following `YAML` file:

    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: web-dashboard
      namespace: default
    spec:
      replicas: 1
      selector:
        matchLabels:
          name: web-dashboard
      strategy:
        rollingUpdate:
          maxSurge: 25%
          maxUnavailable: 25%
        type: RollingUpdate
      template:
        metadata:
          creationTimestamp: null
          labels:
            name: web-dashboard
        spec:
          serviceAccountName: dashboard-sa
          containers:
          - image: gcr.io/kodekloud/customimage/my-kubernetes-dashboard
            imagePullPolicy: Always
            name: web-dashboard
            ports:
            - containerPort: 8080
              protocol: TCP
    ```

    Then run the command: `kubectl apply -f <FILE-NAME>.yaml`

14. Refresh the Dashboard application UI and you should now see the PODs listed automatically.

    This time you shouldn't have to put in the token manually.

    Ok



## PRACTICE TEST IMAGE SECURITY



1. What secret type must we choose for `docker registry`?

   - generic
   - docker-registry
   - tls
   - registry-docker
   - registry

   Run the command `kubectl create secret --help` and identify it.

   ```
   root@controlplane ~ ➜  kubectl create secret 
   Create a secret using specified subcommand.
   
   Available Commands:
     docker-registry   Create a secret for use with a Docker registry
     generic           Create a secret from a local file, directory, or literal value
     tls               Create a TLS secret
   
   Usage:
     kubectl create secret [flags] [options]
   
   Use "kubectl <command> --help" for more information about a given command.
   Use "kubectl options" for a list of global command-line options (applies to all
   commands).
   ```

2. We have an application running on our cluster. Let us explore it first. What image is the application using?

   - webapp
   - busybox
   - nginx:alpine
   - nginx

   ```
   root@controlplane ~ ➜  kubectl describe deployments.apps web 
   Name:                   web
   Namespace:              default
   CreationTimestamp:      Thu, 12 Jan 2023 08:36:13 +0000
   Labels:                 app=web
   Annotations:            deployment.kubernetes.io/revision: 1
   Selector:               app=web
   Replicas:               2 desired | 2 updated | 2 total | 2 available | 0 unavailable
   StrategyType:           RollingUpdate
   MinReadySeconds:        0
   RollingUpdateStrategy:  25% max unavailable, 25% max surge
   Pod Template:
     Labels:  app=web
     Containers:
      nginx:
       Image:        nginx:alpine
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
   NewReplicaSet:   web-fd5cb786 (2/2 replicas created)
   Events:
     Type    Reason             Age   From                   Message
     ----    ------             ----  ----                   -------
     Normal  ScalingReplicaSet  4m9s  deployment-controller  Scaled up replica set web-fd5cb786 to 2
   ```

3. We decided to use a modified version of the application from an internal private registry. Update the image of the deployment to use a new image from `myprivateregistry.com:5000`

   The registry is located at `myprivateregistry.com:5000`. Don't worry about the credentials for now. We will configure them in the upcoming steps.

   Check

   - Use Image from private registry

   Use the `kubectl edit deployment` command to edit the image name to `myprivateregistry.com:5000/nginx:alpine`.

   ```
   root@controlplane ~ ➜  kubectl edit deployments.apps web 
   ```

4. Are the new PODs created with the new images successfully running?

   - Yes
   - **No**

   ```
   root@controlplane ~ ➜  kubectl get pods
   NAME                  READY   STATUS             RESTARTS   AGE
   web-87bb989dc-w6gzr   0/1     ImagePullBackOff   0          90s
   web-fd5cb786-2wljg    1/1     Running            0          8m2s
   web-fd5cb786-llxss    1/1     Running            0          8m2s
   ```

5. Create a secret object with the credentials required to access the registry.

   Name: `private-reg-cred`
   Username: `dock_user`
   Password: `dock_password`
   Server: `myprivateregistry.com:5000`
   Email: `dock_user@myprivateregistry.com`

   Check

   - Secret: private-reg-cred
   - Secret Type: docker-registry
   - Secret Data

   Run the command: `kubectl create secret docker-registry private-reg-cred --docker-username=dock_user --docker-password=dock_password --docker-server=myprivateregistry.com:5000 --docker-email=dock_user@myprivateregistry.com`

   ```
   root@controlplane ~ ➜  kubectl create secret docker-registry private-reg-cred --docker-username=dock_user --docker-password=dock_password --docker-server=myprivateregistry.com:5000 --docker-email=dock_user@myprivateregistry.com
   secret/private-reg-cred created
   
   root@controlplane ~ ➜  kubectl get secrets 
   NAME               TYPE                             DATA   AGE
   private-reg-cred   kubernetes.io/dockerconfigjson   1      21s
   
   root@controlplane ~ ➜  kubectl describe secrets private-reg-cred 
   Name:         private-reg-cred
   Namespace:    default
   Labels:       <none>
   Annotations:  <none>
   
   Type:  kubernetes.io/dockerconfigjson
   
   Data
   ====
   .dockerconfigjson:  176 bytes
   ```

6. Configure the deployment to use credentials from the new secret to pull images from the private registry

   Check

   - Image Pull Secret: private-reg-cred

   Edit deployment using `kubectl edit deploy web` command and add imagePullSecrets section. Use `private-reg-cred`.

   ```
   root@controlplane ~ ➜  kubectl edit deployments.apps web 
   ```

   ```
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     annotations:
       deployment.kubernetes.io/revision: "3"
     creationTimestamp: "2023-01-12T08:36:13Z"
     generation: 3
     labels:
       app: web
     name: web
     namespace: default
     resourceVersion: "2037"
     uid: 7ec0b184-5cca-4b83-9278-f8716212fd13
   spec:
     progressDeadlineSeconds: 600
     replicas: 2
     revisionHistoryLimit: 10
     selector:
       matchLabels:
         app: web
     strategy:
       rollingUpdate:
         maxSurge: 25%
         maxUnavailable: 25%
       type: RollingUpdate
     template:
       metadata:
         creationTimestamp: null
         labels:
           app: web
       spec:
         containers:
         - image: myprivateregistry.com:5000/nginx:alpine
           imagePullPolicy: IfNotPresent
           name: nginx
           resources: {}
           terminationMessagePath: /dev/termination-log
           terminationMessagePolicy: File
         dnsPolicy: ClusterFirst
         imagePullSecrets:
         - name: private-reg-cred
         restartPolicy: Always
         schedulerName: default-scheduler
         securityContext: {}
         terminationGracePeriodSeconds: 30
   ```

7. Check the status of PODs. Wait for them to be running. You have now successfully configured a Deployment to pull images from the private registry.

   Ok

   ```
   root@controlplane ~ ➜  kubectl get pods
   NAME                   READY   STATUS    RESTARTS   AGE
   web-844574b8cd-5b7j5   1/1     Running   0          97s
   web-844574b8cd-q2g94   1/1     Running   0          80s
   ```



## PRACTICE TEST SECURITY CONTEXTS



1. What is the user used to execute the sleep process within the `ubuntu-sleeper` pod?

   In the current(default) namespace.

   - test-user
   - my-user
   - user2
   - root
   - user1

   Run the command: `kubectl exec ubuntu-sleeper -- whoami` and check the user that is running the container.

   ```
   controlplane ~ ➜  kubectl get pods
   NAME             READY   STATUS    RESTARTS   AGE
   ubuntu-sleeper   1/1     Running   0          81s
   
   controlplane ~ ➜  kubectl exec ubuntu-sleeper -- whoami
   root
   ```

   

2. Edit the pod `ubuntu-sleeper` to run the sleep process with user ID `1010`.

   Note: Only make the necessary changes. Do not modify the name or image of the pod.

   Check

   - Pod Name: ubuntu-sleeper
   - Image Name: ubuntu
   - SecurityContext: User 1010

   ```
   controlplane ~ ✖ kubectl edit pod ubuntu-sleeper 
   ```

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     name: ubuntu-sleeper
     namespace: default
   spec:
     securityContext:
       runAsUser: 1010
     containers:
     - command:
       - sleep
       - "4800"
       image: ubuntu
       name: ubuntu-sleeper
   ```

   ```
   kubectl apply -f <file-name>.yaml --force
   ```

3. A Pod definition file named `multi-pod.yaml` is given. With what user are the processes in the `web` container started?

   The pod is created with multiple containers and security contexts defined at the `Pod` and `Container` level.

   - root
   - **1002**
   - 1000
   - 1001

   The User ID defined in the securityContext of the container overrides the User ID in the POD.

   multi-pod.yaml

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     name: multi-pod
   spec:
     securityContext:
       runAsUser: 1001
     containers:
     -  image: ubuntu
        name: web
        command: ["sleep", "5000"]
        securityContext:
         runAsUser: 1002
   
     -  image: ubuntu
        name: sidecar
        command: ["sleep", "5000"]
   ```

4. With what user are the processes in the `sidecar` container started?

   The pod is created with multiple containers and security contexts defined at the `Pod` and `Container` level.

   - root
   - **1001**
   - 1000
   - 1002

   The User ID defined in the securityContext of the POD is carried over to all the containers in the Pod.

   multi-pod.yaml

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     name: multi-pod
   spec:
     securityContext:
       runAsUser: 1001
     containers:
     -  image: ubuntu
        name: web
        command: ["sleep", "5000"]
        securityContext:
         runAsUser: 1002
   
     -  image: ubuntu
        name: sidecar
        command: ["sleep", "5000"]
   ```

5. Update pod `ubuntu-sleeper` to run as Root user and with the `SYS_TIME` capability.

   Note: Only make the necessary changes. Do not modify the name of the pod.

   Check

   - Pod Name: ubuntu-sleeper
   - Image Name: ubuntu
   - SecurityContext: Capability SYS_TIME

   Add `SYS_TIME` capability to the container's Security Context.

   To delete the existing pod:

   ```sh
   $ kubectl delete po ubuntu-sleeper
   ```

   After that apply solution manifest file to add capabilities in `ubuntu-sleeper` pod:

   ubuntu-sleeper.yaml

   ```yaml
   ---
   apiVersion: v1
   kind: Pod
   metadata:
     name: ubuntu-sleeper
     namespace: default
   spec:
     containers:
     - command:
       - sleep
       - "4800"
       image: ubuntu
       name: ubuntu-sleeper
       securityContext:
         capabilities:
           add: ["SYS_TIME"]
   ```

   then run the command `kubectl apply -f ubuntu-sleeper.yaml` to create a pod from given definition file.

6. Now update the pod to also make use of the `NET_ADMIN` capability.

   Note: Only make the necessary changes. Do not modify the name of the pod.

   Check

   - Pod Name: ubuntu-sleeper
   - Image Name: ubuntu
   - SecurityContext: Capability SYS_TIME
   - SecurityContext: Capability NET_ADMIN

   Add `NET_ADMIN` capability to the container's Security Context.

   To delete the existing pod:

   ```sh
   $ kubectl delete po ubuntu-sleeper
   ```

   After that apply solution manifest file to add capabilities in `ubuntu-sleeper` pod:

   ubuntu-sleeper.yaml

   ```yaml
   ---
   apiVersion: v1
   kind: Pod
   metadata:
     name: ubuntu-sleeper
     namespace: default
   spec:
     containers:
     - command:
       - sleep
       - "4800"
       image: ubuntu
       name: ubuntu-sleeper
       securityContext:
         capabilities:
           add: ["SYS_TIME", "NET_ADMIN"]
   ```

   then run the command `kubectl apply -f <file-name>.yaml` to create a pod from given definition file.



## PRACTICE TEST NETWORK POLICIES

![image-20230112172302835](images/Certified Kubernetes Administrator Laboratory.md)

1. How many network policies do you see in the environment?

   We have deployed few web applications, services and network policies. Inspect the environment.

   - 1
   - 4
   - 5
   - 3

   ```
   controlplane ~ ➜  kubectl get networkpolicies
   NAME             POD-SELECTOR   AGE
   payroll-policy   name=payroll   4m15s
   ```

2. What is the name of the Network Policy?

   - policy-1
   - **payroll-policy**
   - deny-policy
   - network-policy

   ```
   controlplane ~ ➜  kubectl get networkpolicies
   NAME             POD-SELECTOR   AGE
   payroll-policy   name=payroll   4m15s
   ```

3. Which pod is the Network Policy applied on?

   - payroll-service
   - external
   - internal
   - **payroll**

   ```
   controlplane ~ ➜  kubectl get networkpolicies
   NAME             POD-SELECTOR   AGE
   payroll-policy   name=payroll   4m15s
   ```

4. What type of traffic is this Network Policy configured to handle?

   - Egress
   - None
   - Both Ingress and Egress
   - Ingress

   Run the command: `kubectl describe networkpolicy` and look under the `Policy Types` section.

   ```
   controlplane ~ ➜  kubectl describe networkpolicies payroll-policy 
   Name:         payroll-policy
   Namespace:    default
   Created on:   2023-01-12 04:20:34 -0500 EST
   Labels:       <none>
   Annotations:  <none>
   Spec:
     PodSelector:     name=payroll
     Allowing ingress traffic:
       To Port: 8080/TCP
       From:
         PodSelector: name=internal
     Not affecting egress traffic
     Policy Types: Ingress
   ```

5. What is the impact of the rule configured on this Network Policy?

   - **Traffic From Internal to Payroll POD is allowed**
   - Traffic To and From Internal POD is Blocked
   - Traffic To and From Payroll POD is Blocked
   - Traffic From Internal to Payroll POD is blocked

6. What is the impact of the rule configured on this Network Policy?

   - Internal POD can ping Payroll POD
   - External POD can ping Payroll POD
   - External POD can access port 8080 on Payroll POD
   - **Internal POD can access port 8080 on Payroll POD**

   Use the command `kubectl describe netpol`.

   ```
   controlplane ~ ➜  kubectl describe networkpolicies payroll-policy 
   Name:         payroll-policy
   Namespace:    default
   Created on:   2023-01-12 04:20:34 -0500 EST
   Labels:       <none>
   Annotations:  <none>
   Spec:
     PodSelector:     name=payroll
     Allowing ingress traffic:
       To Port: 8080/TCP
       From:
         PodSelector: name=internal
     Not affecting egress traffic
     Policy Types: Ingress
   ```

7. Access the UI of these applications using the link given above the terminal.

   Ok

8. Perform a connectivity test using the User Interface in these Applications to access the payroll-service at port 8080.

   - Both internal and external applications can access the payroll service
   - **Only Internal application can access payroll service**

9. Perform a connectivity test using the User Interface of the Internal Application to access the `external-service` at port `8080`.\

   - **Successful**
   - Failed

10. Create a network policy to allow traffic from the `Internal` application only to the `payroll-service` and `db-service`.

   Use the spec given below. You might want to enable ingress traffic to the pod to test your rules in the UI.

   Check

   - Policy Name: internal-policy
   - Policy Type: Egress
   - Egress Allow: payroll
   - Payroll Port: 8080
   - Egress Allow: mysql
   - MySQL Port: 3306

   ![image-20230112174814700](images/image-20230107093732549.png)

   Solution manifest file for a network policy `internal-policy` as follows:

   internal-policy.yaml

   ```yaml
   apiVersion: networking.k8s.io/v1
   kind: NetworkPolicy
   metadata:
     name: internal-policy
     namespace: default
   spec:
     podSelector:
       matchLabels:
         name: internal
     policyTypes:
     - Egress
     - Ingress
     ingress:
       - {}
     egress:
     - to:
       - podSelector:
           matchLabels:
             name: mysql
       ports:
       - protocol: TCP
         port: 3306
   
     - to:
       - podSelector:
           matchLabels:
             name: payroll
       ports:
       - protocol: TCP
         port: 8080
   
     - ports:
       - port: 53
         protocol: UDP
       - port: 53
         protocol: TCP
   ```

   Note: We have also allowed Egress traffic to TCP and UDP port. This has been added to ensure that the internal DNS resolution works from the internal pod. Remember: The kube-dns service is exposed on port 53:

   ```
   root@controlplane:~# kubectl get svc -n kube-system 
   NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
   kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   93m
   root@controlplane:~#
   ```

   ```
   controlplane ~ ➜  kubectl get netpol
   NAME              POD-SELECTOR    AGE
   internal-policy   name=internal   13m
   payroll-policy    name=payroll    57m
   
   controlplane ~ ➜  kubectl describe netpol internal-policy 
   Name:         internal-policy
   Namespace:    default
   Created on:   2023-01-12 05:05:08 -0500 EST
   Labels:       <none>
   Annotations:  <none>
   Spec:
     PodSelector:     name=internal
     Allowing ingress traffic:
       To Port: <any> (traffic allowed to all ports)
       From: <any> (traffic not restricted by source)
     Allowing egress traffic:
       To Port: 3306/TCP
       To:
         PodSelector: name=mysql
       ----------
       To Port: 8080/TCP
       To:
         PodSelector: name=payroll
       ----------
       To Port: 53/UDP
       To Port: 53/TCP
       To: <any> (traffic not restricted by destination)
     Policy Types: Egress, Ingress
   ```



# STORAGE



## PRACTICE TEST PERSISTENT VOLUME CLAIMS



1. We have deployed a POD. Inspect the POD and wait for it to start running.

   In the current(default) namespace.

   Ok

   ```
   controlplane ~ ➜  kubectl get pods
   NAME     READY   STATUS    RESTARTS   AGE
   webapp   1/1     Running   0          24s
   ```

   

2. The application stores logs at location `/log/app.log`. View the logs.

   You can exec in to the container and open the file:
   `kubectl exec webapp -- cat /log/app.log`

   Ok

   ```
   controlplane ~ ✖ kubectl exec webapp -- cat /log/app.log
   [2023-01-12 10:23:34,477] INFO in event-simulator: USER2 is viewing page2
   [2023-01-12 10:23:35,478] INFO in event-simulator: USER3 logged out
   [2023-01-12 10:23:36,478] INFO in event-simulator: USER1 is viewing page2
   [2023-01-12 10:23:37,480] INFO in event-simulator: USER4 is viewing page3
   [2023-01-12 10:23:38,481] INFO in event-simulator: USER3 is viewing page1
   [2023-01-12 10:23:39,482] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:23:39,482] INFO in event-simulator: USER3 is viewing page2
   [2023-01-12 10:23:40,483] INFO in event-simulator: USER3 is viewing page1
   [2023-01-12 10:23:41,484] INFO in event-simulator: USER1 is viewing page2
   [2023-01-12 10:23:42,485] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
   [2023-01-12 10:23:42,485] INFO in event-simulator: USER2 logged in
   [2023-01-12 10:23:43,486] INFO in event-simulator: USER4 is viewing page2
   [2023-01-12 10:23:44,488] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:23:44,488] INFO in event-simulator: USER2 is viewing page3
   [2023-01-12 10:23:45,489] INFO in event-simulator: USER2 is viewing page1
   [2023-01-12 10:23:46,490] INFO in event-simulator: USER4 is viewing page3
   [2023-01-12 10:23:47,491] INFO in event-simulator: USER1 is viewing page1
   [2023-01-12 10:23:48,492] INFO in event-simulator: USER1 logged in
   [2023-01-12 10:23:49,494] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:23:49,494] INFO in event-simulator: USER2 is viewing page1
   [2023-01-12 10:23:50,495] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
   [2023-01-12 10:23:50,495] INFO in event-simulator: USER4 logged out
   [2023-01-12 10:23:51,497] INFO in event-simulator: USER1 is viewing page3
   [2023-01-12 10:23:52,498] INFO in event-simulator: USER1 is viewing page3
   [2023-01-12 10:23:53,499] INFO in event-simulator: USER3 logged in
   [2023-01-12 10:23:54,499] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:23:54,499] INFO in event-simulator: USER3 is viewing page1
   [2023-01-12 10:23:55,501] INFO in event-simulator: USER4 is viewing page2
   [2023-01-12 10:23:56,502] INFO in event-simulator: USER3 is viewing page2
   [2023-01-12 10:23:57,503] INFO in event-simulator: USER4 logged out
   [2023-01-12 10:23:58,505] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
   [2023-01-12 10:23:58,505] INFO in event-simulator: USER4 logged in
   [2023-01-12 10:23:59,506] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:23:59,506] INFO in event-simulator: USER4 is viewing page2
   [2023-01-12 10:24:00,508] INFO in event-simulator: USER1 is viewing page1
   [2023-01-12 10:24:01,509] INFO in event-simulator: USER3 is viewing page3
   [2023-01-12 10:24:02,509] INFO in event-simulator: USER1 is viewing page1
   [2023-01-12 10:24:03,511] INFO in event-simulator: USER2 is viewing page3
   [2023-01-12 10:24:04,512] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:24:04,512] INFO in event-simulator: USER2 is viewing page3
   [2023-01-12 10:24:05,513] INFO in event-simulator: USER1 logged in
   [2023-01-12 10:24:06,514] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
   [2023-01-12 10:24:06,514] INFO in event-simulator: USER2 logged out
   [2023-01-12 10:24:07,516] INFO in event-simulator: USER1 is viewing page1
   [2023-01-12 10:24:08,517] INFO in event-simulator: USER3 is viewing page1
   [2023-01-12 10:24:09,518] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:24:09,518] INFO in event-simulator: USER1 logged in
   [2023-01-12 10:24:10,519] INFO in event-simulator: USER2 logged out
   [2023-01-12 10:24:11,520] INFO in event-simulator: USER1 is viewing page3
   [2023-01-12 10:24:12,522] INFO in event-simulator: USER1 is viewing page3
   [2023-01-12 10:24:13,523] INFO in event-simulator: USER2 is viewing page2
   [2023-01-12 10:24:14,524] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:24:14,524] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
   [2023-01-12 10:24:14,525] INFO in event-simulator: USER2 is viewing page2
   [2023-01-12 10:24:15,526] INFO in event-simulator: USER1 is viewing page3
   [2023-01-12 10:24:16,527] INFO in event-simulator: USER1 logged out
   [2023-01-12 10:24:17,528] INFO in event-simulator: USER2 is viewing page3
   [2023-01-12 10:24:18,529] INFO in event-simulator: USER3 is viewing page1
   [2023-01-12 10:24:19,530] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:24:19,530] INFO in event-simulator: USER2 is viewing page1
   [2023-01-12 10:24:20,531] INFO in event-simulator: USER4 is viewing page3
   [2023-01-12 10:24:21,532] INFO in event-simulator: USER2 is viewing page3
   [2023-01-12 10:24:22,533] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
   [2023-01-12 10:24:22,533] INFO in event-simulator: USER1 is viewing page1
   [2023-01-12 10:24:23,533] INFO in event-simulator: USER4 is viewing page2
   [2023-01-12 10:24:24,535] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:24:24,535] INFO in event-simulator: USER3 is viewing page1
   [2023-01-12 10:24:25,536] INFO in event-simulator: USER4 logged in
   [2023-01-12 10:24:26,537] INFO in event-simulator: USER1 logged out
   [2023-01-12 10:24:27,538] INFO in event-simulator: USER3 is viewing page3
   [2023-01-12 10:24:28,539] INFO in event-simulator: USER3 logged in
   [2023-01-12 10:24:29,540] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:24:29,540] INFO in event-simulator: USER4 is viewing page3
   [2023-01-12 10:24:30,541] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
   [2023-01-12 10:24:30,541] INFO in event-simulator: USER4 logged out
   [2023-01-12 10:24:31,542] INFO in event-simulator: USER3 is viewing page2
   [2023-01-12 10:24:32,544] INFO in event-simulator: USER3 logged in
   [2023-01-12 10:24:33,545] INFO in event-simulator: USER1 is viewing page3
   [2023-01-12 10:24:34,545] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:24:34,545] INFO in event-simulator: USER1 is viewing page2
   [2023-01-12 10:24:35,547] INFO in event-simulator: USER4 is viewing page2
   [2023-01-12 10:24:36,548] INFO in event-simulator: USER2 is viewing page1
   [2023-01-12 10:24:37,549] INFO in event-simulator: USER1 is viewing page1
   [2023-01-12 10:24:38,550] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
   [2023-01-12 10:24:38,550] INFO in event-simulator: USER3 logged out
   [2023-01-12 10:24:39,552] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:24:39,552] INFO in event-simulator: USER2 logged out
   [2023-01-12 10:24:40,553] INFO in event-simulator: USER1 logged in
   [2023-01-12 10:24:41,554] INFO in event-simulator: USER1 logged in
   [2023-01-12 10:24:42,555] INFO in event-simulator: USER1 logged out
   [2023-01-12 10:24:43,557] INFO in event-simulator: USER1 logged out
   ```

3. If the POD was to get deleted now, would you be able to view these logs.

   - **No**
   - Yes

   ```
   controlplane ~ ➜  kubectl delete pod webapp 
   pod "webapp" deleted
   
   controlplane ~ ➜  kubectl exec webapp -- cat /log/app.log
   Error from server (NotFound): pods "webapp" not found
   ```

4. Configure a volume to store these logs at `/var/log/webapp` on the host.

   Use the spec provided below.

   Check

   - Name: webapp
   - Image Name: kodekloud/event-simulator
   - Volume HostPath: /var/log/webapp
   - Volume Mount: /log

   First delete the existing pod by running the following command: -

   ```shell
   kubectl delete po webapp
   ```

   then use the below manifest file to create a `webapp` pod with given properties as follows:

   webapp.yaml

   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: webapp
   spec:
     containers:
     - name: event-simulator
       image: kodekloud/event-simulator
       env:
       - name: LOG_HANDLERS
         value: file
       volumeMounts:
       - mountPath: /log
         name: log-volume
   
     volumes:
     - name: log-volume
       hostPath:
         # directory location on host
         path: /var/log/webapp
         # this field is optional
         type: Directory
   ```

   Check the log

   ```
   controlplane ~ ➜  ls -l /var/log/webapp/
   total 112
   -rw-r--r-- 1 root root 107084 Jan 12 05:45 app.log
   ```

   ```
   controlplane ~ ➜  cat /var/log/webapp/app.log | tail
   [2023-01-12 10:50:03,347] INFO in event-simulator: USER1 logged out
   [2023-01-12 10:50:04,348] INFO in event-simulator: USER2 logged in
   [2023-01-12 10:50:05,349] INFO in event-simulator: USER1 is viewing page3
   [2023-01-12 10:50:06,350] INFO in event-simulator: USER2 logged in
   [2023-01-12 10:50:07,352] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
   [2023-01-12 10:50:07,352] INFO in event-simulator: USER3 is viewing page2
   [2023-01-12 10:50:08,353] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
   [2023-01-12 10:50:08,353] INFO in event-simulator: USER1 is viewing page1
   [2023-01-12 10:50:09,354] INFO in event-simulator: USER2 logged out
   [2023-01-12 10:50:10,356] INFO in event-simulator: USER2 is viewing page1
   ```

   

   Then run the command `kubectl create -f webapp.yaml` to create a pod.

   ```
   controlplane ~ ➜  kubectl get pods
   NAME     READY   STATUS    RESTARTS   AGE
   webapp   1/1     Running   0          9s
   
   controlplane ~ ➜  kubectl describe pod webapp 
   Name:             webapp
   Namespace:        default
   Priority:         0
   Service Account:  default
   Node:             controlplane/10.28.154.9
   Start Time:       Thu, 12 Jan 2023 05:29:08 -0500
   Labels:           <none>
   Annotations:      <none>
   Status:           Running
   IP:               10.244.0.5
   IPs:
     IP:  10.244.0.5
   Containers:
     event-simulator:
       Container ID:   containerd://6a1db84dbffdb8a314e136d386726a25214bff480d4bbda190eda35c88749011
       Image:          kodekloud/event-simulator
       Image ID:       docker.io/kodekloud/event-simulator@sha256:1e3e9c72136bbc76c96dd98f29c04f298c3ae241c7d44e2bf70bcc209b030bf9
       Port:           <none>
       Host Port:      <none>
       State:          Running
         Started:      Thu, 12 Jan 2023 05:29:10 -0500
       Ready:          True
       Restart Count:  0
       Environment:
         LOG_HANDLERS:  file
       Mounts:
         /log from log-volume (rw)
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-k8qjj (ro)
   Conditions:
     Type              Status
     Initialized       True 
     Ready             True 
     ContainersReady   True 
     PodScheduled      True 
   Volumes:
     log-volume:
       Type:          HostPath (bare host directory volume)
       Path:          /var/log/webapp
       HostPathType:  Directory
     kube-api-access-k8qjj:
       Type:                    Projected (a volume that contains injected data from multiple sources)
       TokenExpirationSeconds:  3607
       ConfigMapName:           kube-root-ca.crt
       ConfigMapOptional:       <nil>
       DownwardAPI:             true
   QoS Class:                   BestEffort
   Node-Selectors:              <none>
   Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                                node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
   Events:
     Type    Reason     Age   From               Message
     ----    ------     ----  ----               -------
     Normal  Scheduled  20s   default-scheduler  Successfully assigned default/webapp to controlplane
     Normal  Pulling    19s   kubelet            Pulling image "kodekloud/event-simulator"
     Normal  Pulled     19s   kubelet            Successfully pulled image "kodekloud/event-simulator" in 321.812926ms (321.8237ms including waiting)
     Normal  Created    19s   kubelet            Created container event-simulator
     Normal  Started    18s   kubelet            Started container event-simulator
   
   ```

5. Create a `Persistent Volume` with the given specification.

   Check

   - Volume Name: pv-log
   - Storage: 100Mi
   - Access Modes: ReadWriteMany
   - Host Path: /pv/log
   - Reclaim Policy: Retain

   Use the following manifest file to create a `pv-log` persistent volume:

   pv.yaml

   ```yaml
   apiVersion: v1
   kind: PersistentVolume
   metadata:
     name: pv-log
   spec:
     persistentVolumeReclaimPolicy: Retain
     accessModes:
       - ReadWriteMany
     capacity:
       storage: 100Mi
     hostPath:
       path: /pv/log
   ```

   Then run the command `kubectl create -f pv.yaml` to create a PV from manifest file.

   ```
   controlplane ~ ➜  kubectl get persistentvolume
   NAME     CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
   pv-log   100Mi      RWX            Retain           Available                                   18s
   
   controlplane ~ ➜  kubectl describe persistentvolume pv-log 
   Name:            pv-log
   Labels:          <none>
   Annotations:     <none>
   Finalizers:      [kubernetes.io/pv-protection]
   StorageClass:    
   Status:          Available
   Claim:           
   Reclaim Policy:  Retain
   Access Modes:    RWX
   VolumeMode:      Filesystem
   Capacity:        100Mi
   Node Affinity:   <none>
   Message:         
   Source:
       Type:          HostPath (bare host directory volume)
       Path:          /pv/log
       HostPathType:  
   Events:            <none>
   ```

6. Let us claim some of that storage for our application. Create a `Persistent Volume Claim` with the given specification.

   Check

   - Volume Name: claim-log-1
   - Storage Request: 50Mi
   - Access Modes: ReadWriteOnce

   Solution manifest file to create a `claim-log-1` PVC with given properties as follows:

   pvc.yaml

   ```yaml
   kind: PersistentVolumeClaim
   apiVersion: v1
   metadata:
     name: claim-log-1
   spec:
     accessModes:
       - ReadWriteOnce
     resources:
       requests:
         storage: 50Mi
   ```

   Then run `kubectl create -f pvc.yaml` to create a PVC from the manifest file.

   ```
   ontrolplane ~ ➜  kubectl create -f pvc.yaml 
   persistentvolumeclaim/claim-log-1 created
   
   controlplane ~ ➜  kubectl get pvc
   NAME          STATUS    VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
   claim-log-1   Pending                                                     29s
   
   controlplane ~ ➜  kubectl describe pvc claim-log-1 
   Name:          claim-log-1
   Namespace:     default
   StorageClass:  
   Status:        Pending
   Volume:        
   Labels:        <none>
   Annotations:   <none>
   Finalizers:    [kubernetes.io/pvc-protection]
   Capacity:      
   Access Modes:  
   VolumeMode:    Filesystem
   Used By:       <none>
   Events:
     Type    Reason         Age               From                         Message
     ----    ------         ----              ----                         -------
     Normal  FailedBinding  5s (x4 over 41s)  persistentvolume-controller  no persistent volumes available for this claim and no storage class is set
   ```

7. What is the state of the `Persistent Volume Claim`?

   - BOUND
   - CREATED
   - **PENDING**
   - AVAILABLE

   ```
   controlplane ~ ➜  kubectl get pvc
   NAME          STATUS    VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
   claim-log-1   Pending                                                     29s
   ```

8. What is the state of the `Persistent Volume`?

   - **AVAILABLE**
   - BOUND
   - PENDING
   - CREATED

   ```
   controlplane ~ ➜  kubectl get pvAVAILABLE
   NAME     CAPACITY   ACCESS MODES   RECLAIAVAILABLEM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
   pv-log   100Mi      RWX            Retain           Available                                   9m3s
   ```

9. Why is the claim not bound to the available `Persistent Volume`?

   - Reclaim Policy not set correctly
   - PV and PVC name mismatch
   - **Access Modes Mismatch**
   - Capacity Mismatch

   Run the command: `kubectl get pv,pvc` and look under the `Access Modes` section. The Access Modes set on the PV and the PVC do not match.

   ```
   controlplane ~ ➜  kubectl get pv,pvc
   NAME                      CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
   persistentvolume/pv-log   100Mi      RWX            Retain           Available                                   10m
   
   NAME                                STATUS    VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
   persistentvolumeclaim/claim-log-1   Pending                                                     4m52s
   
   ```

10. Update the Access Mode on the claim to bind it to the PV.

   Delete and recreate the `claim-log-1`.

   Check

   - Volume Name: claim-log-1
   - Storage Request: 50Mi
   - PVol: pv-log
   - Status: Bound

   To delete the existing pvc:

   ```sh
   $ kubectl delete pvc claim-log-1
   ```

   Solution manifest file to create a `claim-log-1` PVC with correct `Access Modes` as follows:

   pvc.yaml

   ```yaml
   kind: PersistentVolumeClaim
   apiVersion: v1
   metadata:
     name: claim-log-1
   spec:
     accessModes:
       - ReadWriteMany
     resources:
       requests:
         storage: 50Mi
   ```

   Then run `kubectl create -f pvc.yaml`

   ```
   controlplane ~ ➜  kubectl create -f pvc.yaml 
   persistentvolumeclaim/claim-log-1 created
   
   controlplane ~ ➜  kubectl get pv,pvc
   NAME                      CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                 STORAGECLASS   REASON   AGE
   persistentvolume/pv-log   100Mi      RWX            Retain           Bound    default/claim-log-1                           14m
   
   NAME                                STATUS   VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
   persistentvolumeclaim/claim-log-1   Bound    pv-log   100Mi      RWX                           16s
   ```

11. You requested for `50Mi`, how much capacity is now available to the PVC?

    - 1Gi
    - 0
    - 50Mi
    - **100Mi**

    ```
    controlplane ~ ➜  kubectl get pvc
    NAME          STATUS   VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
    claim-log-1   Bound    pv-log   100Mi      RWX                           2m31s
    ```

12. Update the `webapp` pod to use the persistent volume claim as its storage.

    Replace `hostPath` configured earlier with the newly created `PersistentVolumeClaim`.

    Check

    - Name: webapp
    - Image Name: kodekloud/event-simulator
    - Volume: PersistentVolumeClaim=claim-log-1
    - Volume Mount: /log

    To delete the `webapp` pod first:

    ```sh
    $ kubectl delete po webapp
    ```

    Add `--force` flag in above command, if you would like to delete the pod without any delay.

    To create a new `webapp` pod with given properties as follows:

    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: webapp
    spec:
      containers:
      - name: event-simulator
        image: kodekloud/event-simulator
        env:
        - name: LOG_HANDLERS
          value: file
        volumeMounts:
        - mountPath: /log
          name: log-volume
    
      volumes:
      - name: log-volume
        persistentVolumeClaim:
          claimName: claim-log-1
    ```

    ```
    controlplane ~ ➜  ls -l /pv/log/
    total 48
    -rw-r--r-- 1 root root 43453 Jan 12 17:52 app.log
    ```

    ```
    controlplane ~ ➜  cat /pv/log/app.log | tail -n 10
    [2023-01-12 22:54:26,292] INFO in event-simulator: USER3 is viewing page1
    [2023-01-12 22:54:27,293] INFO in event-simulator: USER3 is viewing page2
    [2023-01-12 22:54:28,294] INFO in event-simulator: USER4 logged out
    [2023-01-12 22:54:29,295] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
    [2023-01-12 22:54:29,296] INFO in event-simulator: USER3 is viewing page2
    [2023-01-12 22:54:30,297] INFO in event-simulator: USER4 is viewing page3
    [2023-01-12 22:54:31,298] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
    [2023-01-12 22:54:31,298] INFO in event-simulator: USER1 logged in
    [2023-01-12 22:54:32,299] INFO in event-simulator: USER1 is viewing page2
    [2023-01-12 22:54:33,300] INFO in event-simulator: USER2 is viewing page1
    ```

    

13. What is the `Reclaim Policy` set on the Persistent Volume `pv-log`?

    - **Retain**
    - Recycle
    - Delete
    - Scrub

    Run the command: `kubectl get pv` and look under the `Reclaim Policy` column.

    ```
    controlplane ~ ➜  kubectl get pv
    NAME     CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                 STORAGECLASS   REASON   AGE
    pv-log   100Mi      RWX            Retain           Bound    default/claim-log-1                           16m
    ```

14. What would happen to the PV if the PVC was destroyed?

    - The PV is deleted as well
    - **The PV is not deleted but not available**
    - The PV is scrubbed
    - The PV is made available again

15. Try deleting the PVC and notice what happens.

    If the command hangs, you can use CTRL + C to get back to the bash prompt OR check the status of the pvc from another terminal

    - **The PVC is stuck in 'terminating' state**
    - The PVC is deleted

    Run the command: `kubectl delete pvc claim-log-1` and `kubectl get pvc`. If the command hangs, you can use CTRL + C to get back to the bash prompt OR check the status of the pvc from another terminal.

    ```
    controlplane ~ ➜  kubectl get pvc
    NAME          STATUS   VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
    claim-log-1   Bound    pv-log   100Mi      RWX                           23m
    
    controlplane ~ ➜  kubectl delete pvc claim-log-1 
    persistentvolumeclaim "claim-log-1" deleted
    ^C
    
    controlplane ~ ✖ kubectl get pvc
    NAME          STATUS        VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
    claim-log-1   Terminating   pv-log   100Mi      RWX                           23m
    ```

16. Why is the PVC stuck in `Terminating` state?

    - The PVC is waiting for the PV to be deleted
    - **The PVC is being used by a POD**
    - The PVC is in the process of scrubbing

    The PVC was still being used by the `webapp` pod when we issued the delete command. Until the pod is deleted, the PVC will remain in a `terminating` state.

17. Let us now delete the `webapp` Pod.

    Once deleted, wait for the pod to fully terminate.

    Check

    - Name: webapp

    ```
    controlplane ~ ➜  kubectl delete pod webapp --force 
    Warning: Immediate deletion does not wait for confirmation that the running resource has been terminated. The resource may continue to run on the cluster indefinitely.
    pod "webapp" force deleted
    
    controlplane ~ ➜  kubectl get pod
    No resources found in default namespace.
    ```

18. What is the state of the PVC now?

    - **Deleted**
    - Pending
    - Available
    - Bound

    ```
    controlplane ~ ➜  kubectl get pvc
    No resources found in default namespace.
    ```

19. What is the state of the Persistent Volume now?

    - Deleted
    - Available
    - Bound
    - Pending
    - **Released**

    ```
    controlplane ~ ➜  kubectl get pv
    NAME     CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS     CLAIM                 STORAGECLASS   REASON   AGE
    pv-log   100Mi      RWX            Retain           Released   default/claim-log-1                           32m
    ```



## PRACTICE TEST – STORAGE CLASS



1. How many `StorageClasses` exist in the cluster right now?

   - 2
   - 3
   - 4
   - **1**
   - 7

   ```
   controlplane ~ ➜  kubectl get sc
   NAME                   PROVISIONER             RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
   local-path (default)   rancher.io/local-path   Delete          WaitForFirstConsumer   false                  7m55s
   
   ```

2. How about now? How many Storage Classes exist in the cluster?

   We just created a few new Storage Classes. Inspect them.

   - 4
   - 0
   - 5
   - **3**
   - 1

   ```
   controlplane ~ ➜  kubectl get sc
   NAME                        PROVISIONER                     RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
   local-path (default)        rancher.io/local-path           Delete          WaitForFirstConsumer   false                  9m13s
   local-storage               kubernetes.io/no-provisioner    Delete          WaitForFirstConsumer   false                  59s
   portworx-io-priority-high   kubernetes.io/portworx-volume   Delete          Immediate              false                  59s
   ```

3. What is the name of the `Storage Class` that does not support `dynamic` volume provisioning?

   - local-storage
   - nfs-sc
   - portWorx-Storageclass
   - glusterfs-sc'

   Look for the storage class name that uses `no-provisioner`

   ```
   controlplane ~ ➜  kubectl get sc
   NAME                        PROVISIONER                     RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
   local-path (default)        rancher.io/local-path           Delete          WaitForFirstConsumer   false                  9m13s
   local-storage               kubernetes.io/no-provisioner    Delete          WaitForFirstConsumer   false                  59s
   portworx-io-priority-high   kubernetes.io/portworx-volume   Delete          Immediate              false                  59s
   ```

   ```
   controlplane ~ ➜  kubectl describe sc local-storage 
   Name:            local-storage
   IsDefaultClass:  No
   Annotations:     kubectl.kubernetes.io/last-applied-configuration={"apiVersion":"storage.k8s.io/v1","kind":"StorageClass","metadata":{"annotations":{},"name":"local-storage"},"provisioner":"kubernetes.io/no-provisioner","volumeBindingMode":"WaitForFirstConsumer"}
   
   Provisioner:           kubernetes.io/no-provisioner
   Parameters:            <none>
   AllowVolumeExpansion:  <unset>
   MountOptions:          <none>
   ReclaimPolicy:         Delete
   VolumeBindingMode:     WaitForFirstConsumer
   Events:                <none>
   ```

   

4. What is the `Volume Binding Mode` used for this storage class (the one identified in the previous question)?

   - **WaitForFirstConsumer**
   - Immediate

   Run the command: `kubectl describe sc local-storage` or `kubectl get sc` and look under the `Volume Binding Mode` section.

   ```
   controlplane ~ ➜  kubectl describe sc local-storage 
   Name:            local-storage
   IsDefaultClass:  No
   Annotations:     kubectl.kubernetes.io/last-applied-configuration={"apiVersion":"storage.k8s.io/v1","kind":"StorageClass","metadata":{"annotations":{},"name":"local-storage"},"provisioner":"kubernetes.io/no-provisioner","volumeBindingMode":"WaitForFirstConsumer"}
   
   Provisioner:           kubernetes.io/no-provisioner
   Parameters:            <none>
   AllowVolumeExpansion:  <unset>
   MountOptions:          <none>
   ReclaimPolicy:         Delete
   VolumeBindingMode:     WaitForFirstConsumer
   Events:                <none>
   ```

5. What is the `Provisioner` used for the storage class called `portworx-io-priority-high`?

   - local-volume
   - no-provisioner
   - ceph-volue
   - **portworx-volume**

   Run the command: `kubectl describe sc portworx-io-priority-high` or `kubectl get sc portworx-io-priority-high` and look under the `PROVISIONER` section.

   ```
   controlplane ~ ➜  kubectl get sc portworx-io-priority-high 
   NAME                        PROVISIONER                     RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
   portworx-io-priority-high   kubernetes.io/portworx-volume   Delete          Immediate           false                  8m4s
   
   OR 
   
   controlplane ~ ➜  kubectl describe sc portworx-io-priority-high 
   Name:            portworx-io-priority-high
   IsDefaultClass:  No
   Annotations:     kubectl.kubernetes.io/last-applied-configuration={"apiVersion":"storage.k8s.io/v1","kind":"StorageClass","metadata":{"annotations":{},"name":"portworx-io-priority-high"},"parameters":{"priority_io":"high","repl":"1","snap_interval":"70"},"provisioner":"kubernetes.io/portworx-volume"}
   
   Provisioner:           kubernetes.io/portworx-volume
   Parameters:            priority_io=high,repl=1,snap_interval=70
   AllowVolumeExpansion:  <unset>
   MountOptions:          <none>
   ReclaimPolicy:         Delete
   VolumeBindingMode:     Immediate
   Events:                <none>
   ```

6. Is there a `PersistentVolumeClaim` that is consuming the `PersistentVolume` called `local-pv`?

   - YES
   - **NO**

   Run the command: `kubectl get pvc` and inspect it.

   ```
   controlplane ~ ➜  kubectl get pvc
   No resources found in default namespace.
   ```

7. Let's fix that. Create a new `PersistentVolumeClaim` by the name of `local-pvc` that should bind to the volume `local-pv`.

   Inspect the pv `local-pv` for the specs.

   Check

   - PVC: local-pvc
   - Correct Access Mode?
   - Correct StorageClass Used?
   - PVC requests volume size = 500Mi?

   Use the below YAML file to create the PersistentVolumeClaim **local-pvc**:

   Inspect the pv `local-pv` for the specs.

   ```
   controlplane ~ ➜  kubectl get pv
   NAME       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS    REASON   AGE
   local-pv   500Mi      RWO            Retain           Available           local-storage            11m
   ```

   ```
   controlplane ~ ➜  kubectl describe  pv local-pv 
   Name:              local-pv
   Labels:            <none>
   Annotations:       <none>
   Finalizers:        [kubernetes.io/pv-protection]
   StorageClass:      local-storage
   Status:            Available
   Claim:             
   Reclaim Policy:    Retain
   Access Modes:      RWO
   VolumeMode:        Filesystem
   Capacity:          500Mi
   Node Affinity:     
     Required Terms:  
       Term 0:        kubernetes.io/hostname in [controlplane]
   Message:           
   Source:
       Type:  LocalVolume (a persistent volume backed by local storage on a node)
       Path:  /opt/vol1
   Events:    <none>
   ```

   local-pvc.yaml

   ```yaml
   kind: PersistentVolumeClaim
   apiVersion: v1
   metadata:
     name: local-pvc
   spec:
     accessModes:
     - ReadWriteOnce
     storageClassName: local-storage
     resources:
       requests:
         storage: 500Mi
   ```

   ```
   controlplane ~ ➜  kubectl create -f local-pvc.yaml 
   persistentvolumeclaim/local-pvc created
   
   controlplane ~ ➜  kubectl get pv,pvc
   NAME                        CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS    REASON   AGE
   persistentvolume/local-pv   500Mi      RWO            Retain           Available           local-storage            17m
   
   NAME                              STATUS    VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS    AGE
   persistentvolumeclaim/local-pvc   Pending                                      local-storage   2m20s
   ```

8. What is the status of the newly created Persistent Volume Claim?

   - Available
   - Error
   - Bound
   - **Pending**

   Run the command: `kubectl get pvc local-pvc` and look under the `status` section.

   ```
   controlplane ~ ➜  kubectl get pvc local-pvc 
   NAME        STATUS    VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS    AGE
   local-pvc   Pending                                      local-storage   3m36s
   ```

9. Why is the PVC in a pending state despite making a valid request to claim the volume called `local-pv`?

   Inspect the PVC events.

   - Persistent Volume and Claim mismatch
   - PVC Specs are Incorrect
   - **A Pod consuming the volume is not scheduled**
   - Storage Class not found

   Run the command: `kubectl describe pvc local-pvc` and look under the `Events` section.

   ```
   controlplane ~ ➜  kubectl describe pvc local-pvc | grep Events -A 3
   Events:
     Type    Reason                Age                   From                         Message
     ----    ------                ----                  ----                         -------
     Normal  WaitForFirstConsumer  27s (x26 over 6m33s)  persistentvolume-controller  waiting for first consumer to be created before binding
   ```

10. The Storage Class called `local-storage` makes use of `VolumeBindingMode` set to `WaitForFirstConsumer`. This will delay the binding and provisioning of a PersistentVolume until a Pod using the PersistentVolumeClaim is created.

   Ok



11. Create a new pod called `nginx` with the image `nginx:alpine`. The Pod should make use of the PVC `local-pvc` and mount the volume at the path `/var/www/html`.

    The PV `local-pv` should in a bound state.

    Check

    - Pod created with the correct Image?
    - Pod uses PVC called local-pvc?
    - local-pv bound?
    - nginx pod running?
    - Volume mounted at the correct path?

    Use the command `kubectl run` to create a pod definition file for `nginx` pod with image `nginx:alpine`. Add mount volume path `/var/www/html` and pvc given in the details.
    Alternatively, run the command:
    `kubectl run nginx --image=nginx:alpine --dry-run=client -o yaml > nginx.yaml`

    Solution manifest file to create a pod called **nginx** is as follows:

    ```yaml
    ---
    apiVersion: v1
    kind: Pod
    metadata:
      name: nginx
      labels:
        name: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:alpine
        volumeMounts:
          - name: local-persistent-storage
            mountPath: /var/www/html
      volumes:
        - name: local-persistent-storage
          persistentVolumeClaim:
            claimName: local-pvc
    ```

    ```
    controlplane ~ ➜  kubectl create -f nginx.yaml 
    pod/nginx created
    ```

12. What is the status of the `local-pvc` Persistent Volume Claim now?

    - **BOUND**
    - PENDING
    - TERMINATING
    - AVAILABLE
    - ERROR

    ```
    controlplane ~ ➜  kubectl get pvc
    NAME        STATUS   VOLUME     CAPACITY   ACCESS MODES   STORAGECLASS    AGE
    local-pvc   Bound    local-pv   500Mi      RWO            local-storage   34m
    ```

13. Create a new Storage Class called `delayed-volume-sc` that makes use of the below specs:

    `provisioner`: kubernetes.io/no-provisioner
    `volumeBindingMode`: WaitForFirstConsumer

    Check

    - Storage Class uses: kubernetes.io/no-provisioner ?
    - Storage Class volumeBindingMode set to WaitForFirstConsumer ?'

    Solution manifest file to create a storage class **delayed-volume-sc** as follows:

    delayed-volume-sc.yaml

    ```yaml
    apiVersion: storage.k8s.io/v1
    kind: StorageClass
    metadata:
      name: delayed-volume-sc
    provisioner: kubernetes.io/no-provisioner
    volumeBindingMode: WaitForFirstConsumer
    ```

    ```
    controlplane ~ ➜  kubectl create -f delayed-volume-sc.yaml 
    storageclass.storage.k8s.io/delayed-volume-sc created
    
    controlplane ~ ➜  kubectl get sc delayed-volume-sc 
    NAME                PROVISIONER                    RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
    delayed-volume-sc   kubernetes.io/no-provisioner   Delete          WaitForFirstConsumer   false                  40s
    ```



# NETWORKING 



## PRACTICE TEST – EXPLORE ENVIRONMENT

1. How many nodes are part of this cluster?

   Including the controlplane and worker nodes.

   - **2**
   - 3
   - 1
   - 4

   ```
   controlplane ~ ➜  kubectl get nodes
   NAME           STATUS   ROLES           AGE     VERSION
   controlplane   Ready    control-plane   8m7s    v1.26.0
   node01         Ready    <none>          7m40s   v1.26.0
   ```

2. What is the Internal IP address of the `controlplane` node in this cluster?

   - **10.80.205.3**
   - 172.18.0.1
   - 172.17.1.28
   - 172.18.0.12

   ```
   controlplane ~ ➜  kubectl get nodes -o wide
   NAME           STATUS   ROLES           AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION   CONTAINER-RUNTIME
   controlplane   Ready    control-plane   8m57s   v1.26.0   10.80.205.3   <none>        Ubuntu 20.04.5 LTS   5.4.0-1093-gcp   containerd://1.6.6
   node01         Ready    <none>          8m30s   v1.26.0   10.80.205.6   <none>        Ubuntu 20.04.5 LTS   5.4.0-1093-gcp   containerd://1.6.6
   ```

3. What is the network interface configured for cluster connectivity on the `controlplane` node?

   node-to-node communication

   - eth1
   - weave
   - **eth0**
   - docker0
   - ens3
   - enp0s8

   ```
   controlplane ~ ➜  kubectl get nodes -o wide
   NAME           STATUS   ROLES           AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION   CONTAINER-RUNTIME
   controlplane   Ready    control-plane   8m57s   v1.26.0   10.80.205.3   <none>        Ubuntu 20.04.5 LTS   5.4.0-1093-gcp   containerd://1.6.6
   node01         Ready    <none>          8m30s   v1.26.0   10.80.205.6   <none>        Ubuntu 20.04.5 LTS   5.4.0-1093-gcp   containerd://1.6.6
   
   controlplane ~ ➜  ip addr | grep 10.80.205.3 -B 2
   21027: eth0@if21028: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default 
       link/ether 02:42:0a:50:cd:03 brd ff:ff:ff:ff:ff:ff link-netnsid 0
       inet 10.80.205.3/24 brd 10.80.205.255 scope global eth0
   ```

4. What is the MAC address of the interface on the `controlplane` node?

   - ee:2c:5b:5b:af:b7
   - 3e:6c:c4:2d:11:5a
   - **02:42:0a:50:cd:03**
   - 02:42:c2:46:1a:0f
   - ce:13:79:1a:ed:6c

   ```
   controlplane ~ ➜  ip link show eth0
   21027: eth0@if21028: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP mode DEFAULT group default 
       link/ether 02:42:0a:50:cd:03 brd ff:ff:ff:ff:ff:ff link-netnsid 0
   ```

5. What is the IP address assigned to `node01`?

   - 255.255.255.0
   - **10.80.205.6**
   - 192.168.1.2
   - 172.17.0.1
   - 172.18.0.5

   ```
   controlplane ~ ➜  kubectl get nodes -o wide
   NAME           STATUS   ROLES           AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION   CONTAINER-RUNTIME
   controlplane   Ready    control-plane   15m   v1.26.0   10.80.205.3   <none>        Ubuntu 20.04.5 LTS   5.4.0-1093-gcp   containerd://1.6.6
   node01         Ready    <none>          15m   v1.26.0   10.80.205.6   <none>        Ubuntu 20.04.5 LTS   5.4.0-1093-gcp   containerd://1.6.6
   ```

6. What is the MAC address assigned to `node01`?

   - 02:42:ac:11:00:25
   - 06:fe:89:17:1d:2c
   - 02:42:ac:11:00:23
   - fe:58:ad:aa:bb:dc
   - **02:42:0a:50:cd:06**

   `SSH` to the `node01` node and run the command: `ip link show eth0`.

   ```
   root@node01 ~ ➜  ip add | grep 10.80.205.6 -B 2
   1675: eth0@if1676: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default 
       link/ether 02:42:0a:50:cd:06 brd ff:ff:ff:ff:ff:ff link-netnsid 0
       inet 10.80.205.6/24 brd 10.80.205.255 scope global eth0
   
   root@node01 ~ ➜  ip link show eth0
   1675: eth0@if1676: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP mode DEFAULT group default 
       link/ether 02:42:0a:50:cd:06 brd ff:ff:ff:ff:ff:ff link-netnsid 0
   ```

7. We use `Containerd` as our container runtime. What is the interface/bridge created by `Containerd` on this host?

   - bridge
   - docker0
   - ens3
   - **cni0**
   - eth0

   Run the command: `ip link` and look for a bridge interface created by `containerd`.

   ```
   controlplane ~ ➜  ip link
   1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
       link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   2: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UNKNOWN mode DEFAULT group default 
       link/ether 0e:34:f5:90:54:71 brd ff:ff:ff:ff:ff:ff
   3: cni0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP mode DEFAULT group default qlen 1000
       link/ether ba:53:b3:3f:0b:b5 brd ff:ff:ff:ff:ff:ff
   4: vethcdee35cb@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue master cni0 state UP mode DEFAULT group default 
       link/ether b2:67:a4:62:91:98 brd ff:ff:ff:ff:ff:ff link-netns cni-b2a4c0ab-ef9e-8127-0db0-867cd255424a
   5: vethdbcd56c5@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue master cni0 state UP mode DEFAULT group default 
       link/ether 8a:fa:cd:6e:da:6e brd ff:ff:ff:ff:ff:ff link-netns cni-f24e706c-db6b-808d-2287-d7217c50e723
   21027: eth0@if21028: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP mode DEFAULT group default 
       link/ether 02:42:0a:50:cd:03 brd ff:ff:ff:ff:ff:ff link-netnsid 0
   21029: eth1@if21030: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
       link/ether 02:42:ac:19:00:19 brd ff:ff:ff:ff:ff:ff link-netnsid 1
   ```

8. What is the state of the interface `cni0`?

   - **UP**
   - DOWN
   - UNKNOWN

   ```
   controlplane ~ ➜  ip link show cni0
   3: cni0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP mode DEFAULT group default qlen 1000
       link/ether ba:53:b3:3f:0b:b5 brd ff:ff:ff:ff:ff:ff
   ```

9. If you were to ping google from the `controlplane` node, which route does it take?

   What is the IP address of the Default Gateway?

   - 8.8.8.8
   - 192.168.1.1
   - **172.25.0.1**
   - 255.255.255.0
   - 172.18.0.1

   ```
   controlplane ~ ➜  ip route show default
   default via 172.25.0.1 dev eth1 
   ```

10. What is the port the `kube-scheduler` is listening on in the `controlplane` node?

   - 2380
   - **10259**
   - 6443
   - 8080

   ```
   controlplane ~ ✖ netstat -nplt | grep scheduler
   tcp        0      0 127.0.0.1:10259         0.0.0.0:*               LISTEN      2694/kube-scheduler 
   
   OR
   
   controlplane ~ ➜  netstat -nplt 
   Active Internet connections (only servers)
   Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
   tcp        0      0 127.0.0.1:10248         0.0.0.0:*               LISTEN      3704/kubelet        
   tcp        0      0 127.0.0.1:10249         0.0.0.0:*               LISTEN      4273/kube-proxy     
   tcp        0      0 127.0.0.1:2379          0.0.0.0:*               LISTEN      2687/etcd           
   tcp        0      0 10.80.205.3:2379        0.0.0.0:*               LISTEN      2687/etcd           
   tcp        0      0 10.80.205.3:2380        0.0.0.0:*               LISTEN      2687/etcd           
   tcp        0      0 127.0.0.1:2381          0.0.0.0:*               LISTEN      2687/etcd           
   tcp        0      0 0.0.0.0:8080            0.0.0.0:*               LISTEN      1014/ttyd           
   tcp        0      0 127.0.0.1:10257         0.0.0.0:*               LISTEN      2696/kube-controlle 
   tcp        0      0 127.0.0.1:44465         0.0.0.0:*               LISTEN      1015/containerd     
   tcp        0      0 127.0.0.11:36625        0.0.0.0:*               LISTEN      -                   
   tcp        0      0 127.0.0.1:10259         0.0.0.0:*               LISTEN      2694/kube-scheduler 
   tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      621/systemd-resolve 
   tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1018/sshd: /usr/sbi 
   tcp6       0      0 :::10250                :::*                    LISTEN      3704/kubelet        
   tcp6       0      0 :::6443                 :::*                    LISTEN      2692/kube-apiserver 
   tcp6       0      0 :::10256                :::*                    LISTEN      4273/kube-proxy     
   tcp6       0      0 :::22                   :::*                    LISTEN      1018/sshd: /usr/sbi 
   tcp6       0      0 :::8888                 :::*                    LISTEN      3869/kubectl   
   ```



11. Notice that ETCD is listening on two ports. Which of these have more client connections established?

    - 2350
    - 2380
    - 6443
    - **2379**

    ```
    controlplane ~ ➜  netstat -apn | grep 2379 | wc -l
    128
    
    controlplane ~ ➜  netstat -apn | grep 2380 | wc -l
    1
    ```

12. Correct! That's because `2379` is the port of ETCD to which all control plane components connect to. `2380` is only for etcd peer-to-peer connectivity. When you have multiple controlplane nodes. In this case we don't.

    Ok



## PRACTICE TEST CNI

1. Inspect the kubelet service and identify the container runtime endpoint value is set for Kubernetes.

   - **unix:///var/run/containerd/containerd.sock**
   - NONE
   - unix:///var/run/runtime.sock
   - unix:///var/run/cri-dockerd.sock

   ```
   controlplane ~ ➜  ps -aux | grep kubelet | grep --color container-runtime-endpoint
   root        3699  0.0  0.0 3939144 92468 ?       Ssl  20:37   0:12 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config=/var/lib/kubelet/config.yaml --container-runtime-endpoint=unix:///var/run/containerd/containerd.sock --pod-infra-container-image=registry.k8s.io/pause:3.9
   ```

2. What is the path configured with all binaries of CNI supported plugins?

   - /var/lib/kubenet
   - /etc/cni/bin
   - /etc/cni/net.d
   - **/opt/cni/bin**

   The CNI binaries are located under `/opt/cni/bin` by default.

3. Identify which of the below plugins is not available in the list of available CNI plugins on this host?

   - dhcp
   - vlan
   - bridge
   - **cisco**

   Run the command: `ls /opt/cni/bin` and identify the one not present at that directory.

   ```
   controlplane ~ ➜  ls /opt/cni/bin/
   bandwidth  dhcp      flannel      host-local  loopback  portmap  sbr     tuning
   bridge     firewall  host-device  ipvlan      macvlan   ptp      static  vlan
   ```

4. What is the CNI plugin configured to be used on this kubernetes cluster?

   - calico
   - bridge
   - **flannel**
   - weave

   Run the command: `ls /etc/cni/net.d/` and identify the name of the plugin.

   ```
   controlplane ~ ➜  ls /etc/cni/net.d/
   10-flannel.conflist
   ```

5. What binary executable file will be run by kubelet after a container and its associated namespace are created?

   - bridge
   - calico
   - weave-net
   - **flannel**
   - weave

   Look at the `type` field in file `/etc/cni/net.d/10-flannel.conflist`.

   ```
   controlplane ~ ➜  cat /etc/cni/net.d/10-flannel.conflist 
   {
     "name": "cbr0",
     "cniVersion": "0.3.1",
     "plugins": [
       {
         "type": "flannel",
         "delegate": {
           "hairpinMode": true,
           "isDefaultGateway": true
         }
       },
       {
         "type": "portmap",
         "capabilities": {
           "portMappings": true
         }
       }
     ]
   }
   ```



## PRACTICE TEST – DEPLOY NETWORK SOLUTION

1. In this practice test we will install `weave-net` POD networking solution to the cluster. Let us first inspect the setup.

   We have deployed an application called `app` in the default namespace. What is the state of the pod?

   - NotRunning
   - Running

   ```
   controlplane ~ ➜  kubectl get pod
   NAME   READY   STATUS              RESTARTS   AGE
   app    0/1     ContainerCreating   0          104s
   ```

2. Inspect why the POD is not running.

   - **No Network Configured**
   - Faulty start command
   - Wrong image
   - Node failed

   ```
   controlplane ~ ➜  kubectl describe pod app | grep Events -A 5
   Events:
     Type     Reason                  Age                 From               Message
     ----     ------                  ----                ----               -------
     Normal   Scheduled               3m41s               default-scheduler  Successfully assigned default/app to controlplane
     Warning  FailedCreatePodSandBox  3m40s               kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to setup network for sandbox "fb8a58ccb4f666908a5773b48ea7c50e30767879ac7279eecb5862074aebb878": plugin type="weave-net" name="weave" failed (add): unable to allocate IP address: Post "http://127.0.0.1:6784/ip/fb8a58ccb4f666908a5773b48ea7c50e30767879ac7279eecb5862074aebb878": dial tcp 127.0.0.1:6784: connect: connection refused
     Warning  FailedCreatePodSandBox  3m25s               kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to setup network for sandbox "f0882104fa855ad0618dc4c3107f108454408ad64af3e373b0c1a106d354882e": plugin type="weave-net" name="weave" failed (add): unable to allocate IP address: Post "http://127.0.0.1:6784/ip/f0882104fa855ad0618dc4c3107f108454408ad64af3e373b0c1a106d354882e": dial tcp 127.0.0.1:6784: connect: connection refused
   ```

3. Deploy `weave-net` networking solution to the cluster.

   **NOTE: -** We already have provided a weave manifest file under the `/root/weave` directory.

   Check

   - Deploy weave
   - Wait for the app to run

   Run the below command to deploy the `weave` on the cluster: -

   ```sh
   kubectl apply -f /root/weave/weave-daemonset-k8s.yaml
   ```

   Now check if the weave pods are created **and** let's also check the status of our `app` pod now:

   ```sh
   controlplane ~ ➜  kubectl get pods
   NAME   READY   STATUS    RESTARTS   AGE
   app    1/1     Running   0          21m
   
   controlplane ~ ➜  kubectl get pods -A
   NAMESPACE     NAME                                   READY   STATUS    RESTARTS   AGE
   default       app                                    1/1     Running   0          21m
   kube-system   coredns-787d4945fb-nddfq               1/1     Running   0          91m
   kube-system   coredns-787d4945fb-qfjg4               1/1     Running   0          91m
   kube-system   etcd-controlplane                      1/1     Running   0          92m
   kube-system   kube-apiserver-controlplane            1/1     Running   0          92m
   kube-system   kube-controller-manager-controlplane   1/1     Running   0          92m
   kube-system   kube-proxy-rfn8t                       1/1     Running   0          91m
   kube-system   kube-scheduler-controlplane            1/1     Running   0          92m
   kube-system   weave-net-2fgk8                        2/2     Running   0          40s
   ```

   weave-daemonset-k8s.yaml

   ```
   apiVersion: v1
   kind: List
   items:
     - apiVersion: v1
       kind: ServiceAccount
       metadata:
         name: weave-net
         labels:
           name: weave-net
         namespace: kube-system
     - apiVersion: rbac.authorization.k8s.io/v1
       kind: ClusterRole
       metadata:
         name: weave-net
         labels:
           name: weave-net
       rules:
         - apiGroups:
             - ''
           resources:
             - pods
             - namespaces
             - nodes
           verbs:
             - get
             - list
             - watch
         - apiGroups:
             - extensions
           resources:
             - networkpolicies
           verbs:
             - get
             - list
             - watch
         - apiGroups:
             - 'networking.k8s.io'
           resources:
             - networkpolicies
           verbs:
             - get
             - list
             - watch
         - apiGroups:
           - ''
           resources:
           - nodes/status
           verbs:
           - patch
           - update
     - apiVersion: rbac.authorization.k8s.io/v1
       kind: ClusterRoleBinding
       metadata:
         name: weave-net
         labels:
           name: weave-net
       roleRef:
         kind: ClusterRole
         name: weave-net
         apiGroup: rbac.authorization.k8s.io
       subjects:
         - kind: ServiceAccount
           name: weave-net
           namespace: kube-system
     - apiVersion: rbac.authorization.k8s.io/v1
       kind: Role
       metadata:
         name: weave-net
         namespace: kube-system
         labels:
           name: weave-net
       rules:
         - apiGroups:
             - ''
           resources:
             - configmaps
           resourceNames:
             - weave-net
           verbs:
             - get
             - update
         - apiGroups:
             - ''
           resources:
             - configmaps
           verbs:
             - create
     - apiVersion: rbac.authorization.k8s.io/v1
       kind: RoleBinding
       metadata:
         name: weave-net
         namespace: kube-system
         labels:
           name: weave-net
       roleRef:
         kind: Role
         name: weave-net
         apiGroup: rbac.authorization.k8s.io
       subjects:
         - kind: ServiceAccount
           name: weave-net
           namespace: kube-system
     - apiVersion: apps/v1
       kind: DaemonSet
       metadata:
         name: weave-net
         labels:
           name: weave-net
         namespace: kube-system
       spec:
         # Wait 5 seconds to let pod connect before rolling next pod
         selector:
           matchLabels:
             name: weave-net
         minReadySeconds: 5
         template:
           metadata:
             labels:
               name: weave-net
           spec:
             initContainers:
               - name: weave-init
                 image: 'weaveworks/weave-kube:2.8.1'
                 command:
                   - /home/weave/init.sh
                 env:
                 securityContext:
                   privileged: true
                 volumeMounts:
                   - name: cni-bin
                     mountPath: /host/opt
                   - name: cni-bin2
                     mountPath: /host/home
                   - name: cni-conf
                     mountPath: /host/etc
                   - name: lib-modules
                     mountPath: /lib/modules
                   - name: xtables-lock
                     mountPath: /run/xtables.lock
                     readOnly: false
             containers:
               - name: weave
                 command:
                   - /home/weave/launch.sh
                 env:
                   - name: IPALLOC_RANGE
                     value: 10.32.1.0/24
                   - name: INIT_CONTAINER
                     value: "true"
                   - name: HOSTNAME
                     valueFrom:
                       fieldRef:
                         apiVersion: v1
                         fieldPath: spec.nodeName
                 image: 'weaveworks/weave-kube:2.8.1'
                 readinessProbe:
                   httpGet:
                     host: 127.0.0.1
                     path: /status
                     port: 6784
                 resources:
                   requests:
                     cpu: 50m
                 securityContext:
                   privileged: true
                 volumeMounts:
                   - name: weavedb
                     mountPath: /weavedb
                   - name: dbus
                     mountPath: /host/var/lib/dbus
                     readOnly: true
                   - mountPath: /host/etc/machine-id
                     name: cni-machine-id
                     readOnly: true
                   - name: xtables-lock
                     mountPath: /run/xtables.lock
                     readOnly: false
               - name: weave-npc
                 env:
                   - name: HOSTNAME
                     valueFrom:
                       fieldRef:
                         apiVersion: v1
                         fieldPath: spec.nodeName
                 image: 'weaveworks/weave-npc:2.8.1'
   #npc-args
                 resources:
                   requests:
                     cpu: 50m
                 securityContext:
                   privileged: true
                 volumeMounts:
                   - name: xtables-lock
                     mountPath: /run/xtables.lock
                     readOnly: false
             hostNetwork: true
             dnsPolicy: ClusterFirstWithHostNet
             hostPID: false
             restartPolicy: Always
             securityContext:
               seLinuxOptions: {}
             serviceAccountName: weave-net
             tolerations:
               - effect: NoSchedule
                 operator: Exists
               - effect: NoExecute
                 operator: Exists
             volumes:
               - name: weavedb
                 hostPath:
                   path: /var/lib/weave
               - name: cni-bin
                 hostPath:
                   path: /opt
               - name: cni-bin2
                 hostPath:
                   path: /home
               - name: cni-conf
                 hostPath:
                   path: /etc
               - name: cni-machine-id
                 hostPath:
                   path: /etc/machine-id
               - name: dbus
                 hostPath:
                   path: /var/lib/dbus
               - name: lib-modules
                 hostPath:
                   path: /lib/modules
               - name: xtables-lock
                 hostPath:
                   path: /run/xtables.lock
                   type: FileOrCreate
             priorityClassName: system-node-critical
         updateStrategy:
           type: RollingUpdate
   ```



## PRACTICE TEST – NETWORKING WEAVE

1. How many Nodes are part of this cluster?

   Including master and worker nodes

   - 3
   - **2**
   - 1

   ```
   controlplane ~ ➜  kubectl get nodes
   NAME           STATUS   ROLES           AGE   VERSION
   controlplane   Ready    control-plane   96m   v1.26.0
   node01         Ready    <none>          95m   v1.26.0
   ```

2. What is the Networking Solution used by this cluster?

   - calico
   - **weave**
   - flannel
   - cilium

   Check the config file located at `/etc/cni/net.d/`

   ```
   controlplane ~ ➜  ls -l /etc/cni/net.d/
   total 4
   -rw-r--r-- 1 root root 318 Jan 12 20:46 10-weave.conflist
   
   controlplane ~ ➜  cat /etc/cni/net.d/10-weave.conflist 
   {
       "cniVersion": "0.3.0",
       "name": "weave",
       "plugins": [
           {
               "name": "weave",
               "type": "weave-net",
               "hairpinMode": true
           },
           {
               "type": "portmap",
               "capabilities": {"portMappings": true},
               "snat": true
           }
       ]
   }
   ```



3. How many weave agents/peers are deployed in this cluster?

   - 1
   - 3
   - **2**

   Run the command `kubectl get pods -n kube-system` and count weave pods

   ```
   controlplane ~ ➜  kubectl get pods -n kube-system
   NAME                                   READY   STATUS    RESTARTS       AGE
   coredns-787d4945fb-92sws               1/1     Running   0              104m
   coredns-787d4945fb-c95bm               1/1     Running   0              104m
   etcd-controlplane                      1/1     Running   0              104m
   kube-apiserver-controlplane            1/1     Running   0              104m
   kube-controller-manager-controlplane   1/1     Running   0              104m
   kube-proxy-kztkz                       1/1     Running   0              104m
   kube-proxy-n8vbb                       1/1     Running   0              104m
   kube-scheduler-controlplane            1/1     Running   0              104m
   weave-net-b27z9                        2/2     Running   1 (104m ago)   104m
   weave-net-th5xw                        2/2     Running   1 (104m ago)   104m
   ```

4. On which nodes are the weave peers present?

   - **One on every node**
   - All on the master node
   - All on node01
   - On worker nodes only
   - 2 on master 2 on worker

   ```
   controlplane ~ ➜  kubectl get pods -n kube-system -o wide
   NAME                                   READY   STATUS    RESTARTS       AGE    IP             NODE           NOMINATED NODE   READINESS GATES
   coredns-787d4945fb-92sws               1/1     Running   0              125m   10.244.0.3     node01         <none>           <none>
   coredns-787d4945fb-c95bm               1/1     Running   0              125m   10.244.0.2     node01         <none>           <none>
   etcd-controlplane                      1/1     Running   0              125m   10.81.252.9    controlplane   <none>           <none>
   kube-apiserver-controlplane            1/1     Running   0              125m   10.81.252.9    controlplane   <none>           <none>
   kube-controller-manager-controlplane   1/1     Running   0              125m   10.81.252.9    controlplane   <none>           <none>
   kube-proxy-kztkz                       1/1     Running   0              124m   10.81.252.12   node01         <none>           <none>
   kube-proxy-n8vbb                       1/1     Running   0              125m   10.81.252.9    controlplane   <none>           <none>
   kube-scheduler-controlplane            1/1     Running   0              125m   10.81.252.9    controlplane   <none>           <none>
   weave-net-b27z9                        2/2     Running   1 (124m ago)   125m   10.81.252.9    controlplane   <none>           <none>
   weave-net-th5xw                        2/2     Running   1 (124m ago)   124m   10.81.252.12   node01         <none>           <none>
   ```

   

5. Identify the name of the bridge network/interface created by weave on each node.

   - **weave**
   - lo
   - docker0
   - ens3

   Run the command `ip link`

   ```
   controlplane ~ ➜  ip link 
   1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
       link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   2: datapath: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1376 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
       link/ether 56:1f:0a:9f:2a:b4 brd ff:ff:ff:ff:ff:ff
   4: weave: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1376 qdisc noqueue state UP mode DEFAULT group default qlen 1000
       link/ether 2e:0d:80:34:92:52 brd ff:ff:ff:ff:ff:ff
   6: vethwe-datapath@vethwe-bridge: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1376 qdisc noqueue master datapath state UP mode DEFAULT group default 
       link/ether 06:a3:52:de:e5:0a brd ff:ff:ff:ff:ff:ff
   7: vethwe-bridge@vethwe-datapath: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1376 qdisc noqueue master weave state UP mode DEFAULT group default 
       link/ether 46:b9:81:09:d3:b0 brd ff:ff:ff:ff:ff:ff
   8: vxlan-6784: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 65535 qdisc noqueue master datapath state UNKNOWN mode DEFAULT group default qlen 1000
       link/ether 5e:1c:ad:9f:67:96 brd ff:ff:ff:ff:ff:ff
   22310: eth0@if22311: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP mode DEFAULT group default 
       link/ether 02:42:0a:51:fc:09 brd ff:ff:ff:ff:ff:ff link-netnsid 0
   22312: eth1@if22313: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
       link/ether 02:42:ac:19:01:34 brd ff:ff:ff:ff:ff:ff link-netnsid 1
   ```

6. What is the POD IP address range configured by `weave`?

   - **10.X.X.X**
   - 192.68.X.X
   - 172.17.X.X
   - 172.18.X.X

   ```
   controlplane ~ ➜  ip addr show weave 
   4: weave: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1376 qdisc noqueue state UP group default qlen 1000
       link/ether 2e:0d:80:34:92:52 brd ff:ff:ff:ff:ff:ff
       inet 10.244.192.0/16 brd 10.244.255.255 scope global weave
          valid_lft forever preferred_lft forever
   ```

7. What is the default gateway configured on the PODs scheduled on `node01`?

   Try scheduling a pod on `node01` and check `ip route` output

   - 192.168.1.1
   - 10.244.0.1
   - 172.17.0.1
   - 172.18.1.1

   SSH to the `node01` by running the command: `ssh node01` and then run the `ip route` command and look at the `weave` line.

   ```
   controlplane ~ ➜  ssh node01
   
   root@node01 ~ ➜  ip route 
   default via 172.25.0.1 dev eth1 
   10.81.252.0/24 dev eth0 proto kernel scope link src 10.81.252.12 
   10.244.0.0/16 dev weave proto kernel scope link src 10.244.0.1 
   172.25.0.0/24 dev eth1 proto kernel scope link src 172.25.0.3 
   ```



## PRACTICE TEST SERVICE NETWORKING

1. What network range are the nodes in the cluster part of?

   - 10.0.0.0/24
   - 10.32.0.0/12
   - 172.17.0.0/16
   - 192.168.0.0/16
   - 10.96.0.0/12
   - **10.81.253.0/24**
   - 172.18.0.0/16

   one way to do this is to make use of the `ipcalc` utility. If it is not installed, you can install it by running: `apt update` and the `apt install ipcalc`

   Then use it to determine the network range as shown below:

   First, find the Internal IP of the nodes.

   

   ```sh
   controlplane ~ ➜  ip addr show eth0
   1031: eth0@if1032: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default 
       link/ether 02:42:0a:51:fd:03 brd ff:ff:ff:ff:ff:ff link-netnsid 0
       inet 10.81.253.3/24 brd 10.81.253.255 scope global eth0
          valid_lft forever preferred_lft forever
   ```

   

   Next, use the `ipcalc` tool to see the network details:

   ```sh
   root@controlplane:~> ipcalc -b 10.33.39.8
   Address:   10.33.39.8           
   Netmask:   255.255.255.0 = 24   
   Wildcard:  0.0.0.255            
   =>
   Network:   10.33.39.0/24        
   HostMin:   10.33.39.1           
   HostMax:   10.33.39.254         
   Broadcast: 10.33.39.255         
   Hosts/Net: 254                   Class A, Private Internet
   
   root@controlplane:~>
   ```

   In this example, the network is `10.33.39.0/24`. Note, this may vary for your lab so make sure to check for yourself.

2. What is the range of IP addresses configured for PODs on this cluster?

   - 10.0.0.0/12
   - 172.18.0.0/24
   - 172.17.0.0/16
   - **10.244.0.0/16**

   The network is configured with `weave`. Check the `weave` pods logs using the command `kubectl logs <weave-pod-name> weave -n kube-system` and look for `ipalloc-range`.

   ```
   controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS    RESTARTS       AGE
   coredns-787d4945fb-956dx               1/1     Running   0              155m
   coredns-787d4945fb-vnrmk               1/1     Running   0              155m
   etcd-controlplane                      1/1     Running   0              156m
   kube-apiserver-controlplane            1/1     Running   0              156m
   kube-controller-manager-controlplane   1/1     Running   0              156m
   kube-proxy-jwfmq                       1/1     Running   0              155m
   kube-proxy-nb9pl                       1/1     Running   0              155m
   kube-scheduler-controlplane            1/1     Running   0              156m
   weave-net-twmgf                        2/2     Running   1 (155m ago)   155m
   weave-net-zrcpx                        2/2     Running   0              155m
   ```

   ```
   controlplane ~ ✖ kubectl logs -n kube-system weave-net-twmgf weave | grep ipalloc-range
   INFO: 2023/01/13 01:46:09.141664 Command line options: map[conn-limit:200 datapath:datapath db-prefix:/weavedb/weave-net docker-api: expect-npc:true http-addr:127.0.0.1:6784 ipalloc-init:consensus=0 ipalloc-range:10.244.0.0/16 metrics-addr:0.0.0.0:6782 name:52:c7:a5:11:80:0e nickname:controlplane no-dns:true no-masq-local:true port:6783]
   ```

3. What is the IP Range configured for the services within the cluster?

   - **10.96.0.0/12**
   - 10.96.0.0/24
   - 10.32.0.0/12
   - 172.17.0.0/16

   Inspect the setting on kube-api server by running on command `cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep cluster-ip-range`

   ```
   controlplane ~ ➜  cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep cluster-ip-range
       - --service-cluster-ip-range=10.96.0.0/12
   ```

4. How many kube-proxy pods are deployed in this cluster?

   - 4
   - 1
   - **2**
   - 3

   Run the command: `kubectl get pods -n kube-system` and look for kube-proxy pods.

   ```
   controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS    RESTARTS       AGE
   coredns-787d4945fb-956dx               1/1     Running   0              163m
   coredns-787d4945fb-vnrmk               1/1     Running   0              163m
   etcd-controlplane                      1/1     Running   0              163m
   kube-apiserver-controlplane            1/1     Running   0              163m
   kube-controller-manager-controlplane   1/1     Running   0              163m
   kube-proxy-jwfmq                       1/1     Running   0              163m
   kube-proxy-nb9pl                       1/1     Running   0              163m
   kube-scheduler-controlplane            1/1     Running   0              163m
   weave-net-twmgf                        2/2     Running   1 (163m ago)   163m
   weave-net-zrcpx                        2/2     Running   0              163m
   ```

5. What type of proxy is the `kube-proxy` configured to use?

   - **iptables**
   - firewalld
   - ipvs
   - userspace

   Check the logs of the `kube-proxy` pods. Run the command: `kubectl logs <kube-proxy-pod-name> -n kube-system`

   ```
   controlplane ~ ➜  kubectl logs -n kube-system kube-proxy-wbqmn 
   I0113 07:18:04.849557       1 node.go:163] Successfully retrieved node IP: 10.97.51.12
   I0113 07:18:04.849681       1 server_others.go:109] "Detected node IP" address="10.97.51.12"
   I0113 07:18:04.849703       1 server_others.go:535] "Using iptables proxy"
   I0113 07:18:04.963093       1 server_others.go:176] "Using iptables Proxier"
   I0113 07:18:04.963137       1 server_others.go:183] "kube-proxy running in dual-stack mode" ipFamily=IPv4
   I0113 07:18:04.963148       1 server_others.go:184] "Creating dualStackProxier for iptables"
   I0113 07:18:04.963180       1 server_others.go:465] "Detect-local-mode set to ClusterCIDR, but no IPv6 cluster CIDR defined, , defaulting to no-op detect-local for IPv6"
   I0113 07:18:04.963223       1 proxier.go:242] "Setting route_localnet=1 to allow node-ports on localhost; to change this either disable iptables.localhostNodePorts (--iptables-localhost-nodeports) or set nodePortAddresses (--nodeport-addresses) to filter loopback addresses"
   I0113 07:18:05.056361       1 server.go:655] "Version info" version="v1.26.0"
   I0113 07:18:05.056384       1 server.go:657] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
   I0113 07:18:05.131887       1 conntrack.go:52] "Setting nf_conntrack_max" nf_conntrack_max=1179648
   I0113 07:18:05.135113       1 config.go:317] "Starting service config controller"
   I0113 07:18:05.135144       1 shared_informer.go:273] Waiting for caches to sync for service config
   I0113 07:18:05.135155       1 config.go:226] "Starting endpoint slice config controller"
   I0113 07:18:05.135174       1 shared_informer.go:273] Waiting for caches to sync for endpoint slice config
   I0113 07:18:05.135251       1 config.go:444] "Starting node config controller"
   I0113 07:18:05.135266       1 shared_informer.go:273] Waiting for caches to sync for node config
   I0113 07:18:05.235256       1 shared_informer.go:280] Caches are synced for endpoint slice config
   I0113 07:18:05.235305       1 shared_informer.go:280] Caches are synced for service config
   I0113 07:18:05.235340       1 shared_informer.go:280] Caches are synced for node config
   ```

6. How does this Kubernetes cluster ensure that a `kube-proxy` pod runs on all nodes in the cluster?

   Inspect the `kube-proxy` pods and try to identify how they are deployed.

   - Using deployments
   - kubelet ensures this is done
   - Using a custom script
   - **using daemonset**

   Run the command: `kubectl get ds -n kube-system`

   ```
   
   controlplane ~ ➜  kubectl get ds -n kube-system 
   NAME         DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
   kube-proxy   2         2         2       2            2           kubernetes.io/os=linux   136m
   weave-net    2         2         2       2            2           <none>                   136m
   ```





## PRACTICE TEST COREDNS IN KUBERNETES

1. Identify the DNS solution implemented in this cluster.

   - kube-dns
   - **CoreDNS**
   - OpenDNS
   - google DNS
   - bind

   Run the command: `kubectl get pods -n kube-system` and look for the DNS pods.

   ```
   controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS    RESTARTS   AGE
   coredns-787d4945fb-282ms               1/1     Running   0          3m22s
   coredns-787d4945fb-5t8kr               1/1     Running   0          3m22s
   etcd-controlplane                      1/1     Running   0          3m37s
   kube-apiserver-controlplane            1/1     Running   0          3m37s
   kube-controller-manager-controlplane   1/1     Running   0          3m34s
   kube-proxy-mrbfx                       1/1     Running   0          3m22s
   kube-scheduler-controlplane            1/1     Running   0          3m34s
   ```

2. How many pods of the DNS server are deployed?

   - 3
   - 4
   - 1
   - **2**

   ```
   controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS    RESTARTS   AGE
   coredns-787d4945fb-282ms               1/1     Running   0          3m22s
   coredns-787d4945fb-5t8kr               1/1     Running   0          3m22s
   etcd-controlplane                      1/1     Running   0          3m37s
   kube-apiserver-controlplane            1/1     Running   0          3m37s
   kube-controller-manager-controlplane   1/1     Running   0          3m34s
   kube-proxy-mrbfx                       1/1     Running   0          3m22s
   kube-scheduler-controlplane            1/1     Running   0          3m34s
   ```

3. What is the name of the service created for accessing CoreDNS?

   - core-service
   - kube-service
   - dns-service
   - kubernetes
   - **kube-dns**

   ```
   controlplane ~ ➜  kubectl get service -n kube-system 
   NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
   kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   5m46s
   ```

4. What is the IP of the CoreDNS server that should be configured on PODs to resolve services?

   - 192.168.1.1
   - 10.244.1.2
   - **10.96.0.10**
   - 8.8.8.8

   Look for ClUSTER-IP addres

   ```
   controlplane ~ ➜  kubectl get service -n kube-system
   NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
   kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   7m2s
   ```

5. Where is the configuration file located for configuring the CoreDNS service?

   - /var/coredns/Corefile
   - /etc/Corefile
   - /etc/kubedns/Corefile
   - **/etc/coredns/Corefile**
   - /root/Corefile

   Run the command: `kubectl -n kube-system describe deployments.apps coredns | grep -A2 Args

   ```
   controlplane ~ ➜  kubectl -n kube-system describe deployments.apps coredns | grep -A 2 Args
       Args:
         -conf
         /etc/coredns/Corefile
   ```

   

6. How is the Corefile passed in to the CoreDNS POD?

   - pulled from git
   - **Configured as a ConfigMap object**
   - Stored on the kube master
   - Corefile comes built-in with CoreDNS pod

   ```
   controlplane ~ ➜  kubectl get cm -n kube-system 
   NAME                                 DATA   AGE
   coredns                              1      25m
   extension-apiserver-authentication   6      25m
   kube-proxy                           2      25m
   kube-root-ca.crt                     1      25m
   kubeadm-config                       1      25m
   kubelet-config                       1      25m
   ```

7. What is the name of the ConfigMap object created for Corefile?

   - corefile-config
   - dns-config
   - kube-proxy
   - **coredns**

   Run the command: `kubectl get configmap -n kube-system` and identify the name.

   ```
   controlplane ~ ✖ kubectl get configmap -n kube-system 
   NAME                                 DATA   AGE
   coredns                              1      27m
   extension-apiserver-authentication   6      27m
   kube-proxy                           2      27m
   kube-root-ca.crt                     1      27m
   kubeadm-config                       1      27m
   kubelet-config                       1      27m
   ```

8. What is the root domain/zone configured for this kubernetes cluster?

   - kubernetes
   - root
   - **cluster.local**
   - cluster-a.local

   Run the command: `kubectl describe configmap coredns -n kube-system` and look for the entry after kubernetes.

   ```
   controlplane ~ ➜  kubectl describe -n kube-system configmaps coredns 
   Name:         coredns
   Namespace:    kube-system
   Labels:       <none>
   Annotations:  <none>
   
   Data
   ====
   Corefile:
   ----
   .:53 {
       errors
       health {
          lameduck 5s
       }
       ready
       kubernetes cluster.local in-addr.arpa ip6.arpa {
          pods insecure
          fallthrough in-addr.arpa ip6.arpa
          ttl 30
       }
       prometheus :9153
       forward . /etc/resolv.conf {
          max_concurrent 1000
       }
       cache 30
       loop
       reload
       loadbalance
   }
   
   
   BinaryData
   ====
   
   Events:  <none>
   ```

9. We have deployed a set of PODs and Services in the `default` and `payroll` namespaces. Inspect them and go to the next question.

   Ok

   ```
   controlplane ~ ➜  kubectl get pods,svc
   NAME                    READY   STATUS    RESTARTS   AGE
   pod/hr                  1/1     Running   0          34m
   pod/simple-webapp-1     1/1     Running   0          34m
   pod/simple-webapp-122   1/1     Running   0          34m
   pod/test                1/1     Running   0          34m
   
   NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
   service/kubernetes     ClusterIP   10.96.0.1        <none>        443/TCP        35m
   service/test-service   NodePort    10.96.15.162     <none>        80:30080/TCP   34m
   service/web-service    ClusterIP   10.102.110.143   <none>        80/TCP         34m
   
   controlplane ~ ➜  kubectl get pods,svc -n payroll 
   NAME      READY   STATUS    RESTARTS   AGE
   pod/web   1/1     Running   0          34m
   
   NAME                  TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)   AGE
   service/web-service   ClusterIP   10.99.28.79   <none>        80/TCP    34m
   ```

10. What name can be used to access the `hr` web server from the `test` Application?

   You can execute a curl command on the `test` pod to test. Alternatively, the test Application also has a UI. Access it using the tab at the top of your terminal named `test-app`.

   - web-service.payroll
   - test-service
   - **web-service**
   - web

   Use the command `kubectl get svc` after viewing the available services, write the correct service name and port.

   ```
   controlplane ~ ✖ kubectl get svc
   NAME           TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
   kubernetes     ClusterIP   10.96.0.1        <none>        443/TCP        40m
   test-service   NodePort    10.96.15.162     <none>        80:30080/TCP   39m
   web-service    ClusterIP   10.102.110.143   <none>        80/TCP         39m
   
   controlplane ~ ➜  kubectl describe svc web-service 
   Name:              web-service
   Namespace:         default
   Labels:            <none>
   Annotations:       <none>
   Selector:          name=hr
   Type:              ClusterIP
   IP Family Policy:  SingleStack
   IP Families:       IPv4
   IP:                10.102.110.143
   IPs:               10.102.110.143
   Port:              <unset>  80/TCP
   TargetPort:        80/TCP
   Endpoints:         10.244.0.5:80
   Session Affinity:  None
   Events:            <none>
   ```

   ```
   controlplane ~ ➜  kubectl exec pods/test -- curl http://web-service
     % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                    Dload  Upload   Total   Spent    Left  Speed
   100    24    0    24    0     0  12000      0 --:--:-- --:--:-- --:--:-- 12000
    This is the HR server!
   ```

   

11. Which of the names CANNOT be used to access the HR service from the test pod?

    - **web-service.default.pod**
    - web-service.default
    - web-service
    - web-service.default.svc

    ```
    controlplane ~ ➜  kubectl exec pods/test -- curl http://web-service
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
      0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0 This is the HR server!
    100    24    0    24    0     0  24000      0 --:--:-- --:--:-- --:--:-- 24000
    
    controlplane ~ ➜  kubectl exec pods/test -- curl http://web-service.default
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
      0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0 This is the HR server!
    100    24    0    24    0     0  24000      0 --:--:-- --:--:-- --:--:-- 24000
    
    controlplane ~ ➜  kubectl exec pods/test -- curl http://web-service.default.svc
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    100    24    0    24    0     0   4800      0 --:--:-- --:--:-- --:--:--  4800
     This is the HR server!
    
    controlplane ~ ➜  kubectl exec pods/test -- curl http://web-service.default.pod
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
      0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: web-service.default.pod
    command terminated with exit code 6
    ```

    

12. Which of the below name can be used to access the `payroll` service from the test application?

    - web-service.default
    - web
    - web-service
    - **web-service.payroll**

    ```
    controlplane ~ ➜  kubectl get pods -n payroll 
    NAME   READY   STATUS    RESTARTS   AGE
    web    1/1     Running   0          15m
    
    controlplane ~ ➜  kubectl get svc -n payroll 
    NAME          TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
    web-service   ClusterIP   10.111.63.64   <none>        80/TCP    15m
    
    controlplane ~ ➜  kubectl describe svc web-service -n payroll 
    Name:              web-service
    Namespace:         payroll
    Labels:            <none>
    Annotations:       <none>
    Selector:          name=web
    Type:              ClusterIP
    IP Family Policy:  SingleStack
    IP Families:       IPv4
    IP:                10.111.63.64
    IPs:               10.111.63.64
    Port:              <unset>  80/TCP
    TargetPort:        80/TCP
    Endpoints:         10.244.0.4:80
    Session Affinity:  None
    Events:            <none>
    ```

    ```
    controlplane ~ ➜  kubectl exec pods/test -- curl http://web-service.payroll
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
      0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0 This is the PayRoll server!
    100    29    0    29    0     0  29000      0 --:--:-- --:--:-- --:--:-- 29000
    ```

    

    

13. Which of the below name CANNOT be used to access the `payroll` service from the test application?

    - web-service.payroll.svc.cluster
    - web-service.payroll.svc
    - web-service.payroll.svc.cluster.local
    - web-service.payroll

    ```
    controlplane ~ ➜  kubectl exec pods/test -- curl http://web-service.payroll
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
      0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0 This is the PayRoll server!
    100    29    0    29    0     0  14500      0 --:--:-- --:--:-- --:--:-- 14500
    
    controlplane ~ ➜  kubectl exec pods/test -- curl http://web-service.payroll.svc
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
      0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0 This is the PayRoll server!
    100    29    0    29    0     0  14500      0 --:--:-- --:--:-- --:--:-- 14500
    
    controlplane ~ ➜  kubectl exec pods/test -- curl http://web-service.payroll.svc.cluster.local
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    100    29    0    29    0     0  14500      0 --:--:-- --:--:-- --:--:-- 14500
     This is the PayRoll server!
    
    controlplane ~ ➜  kubectl exec pods/test -- curl http://web-service.payroll.svc.cluster  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
      0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: web-service.payroll.svc.cluster
    command terminated with exit code 6
    ```

14. We just deployed a web server - `webapp` - that accesses a database `mysql` - server. However the web server is failing to connect to the database server. Troubleshoot and fix the issue.

    They could be in different namespaces. First locate the applications. The web server interface can be seen by clicking the tab `Web Server` at the top of your terminal.

    Check

    - Web Server: webapp
    - Uses the right DB_Host name

    ```
    controlplane ~ ✖ kubectl get pods -A
    NAMESPACE      NAME                                   READY   STATUS    RESTARTS   AGE
    default        hr                                     1/1     Running   0          6m10s
    default        simple-webapp-1                        1/1     Running   0          5m52s
    default        simple-webapp-122                      1/1     Running   0          5m52s
    default        test                                   1/1     Running   0          6m10s
    default        webapp-578c778d58-9wwrt                1/1     Running   0          2m24s
    kube-flannel   kube-flannel-ds-zdxw7                  1/1     Running   0          8m24s
    kube-system    coredns-787d4945fb-wmwtm               1/1     Running   0          8m24s
    kube-system    coredns-787d4945fb-xvpmm               1/1     Running   0          8m24s
    kube-system    etcd-controlplane                      1/1     Running   0          8m34s
    kube-system    kube-apiserver-controlplane            1/1     Running   0          8m34s
    kube-system    kube-controller-manager-controlplane   1/1     Running   0          8m34s
    kube-system    kube-proxy-pcc6q                       1/1     Running   0          8m24s
    kube-system    kube-scheduler-controlplane            1/1     Running   0          8m34s
    payroll        mysql                                  1/1     Running   0          2m24s
    payroll        web                                    1/1     Running   0          6m10
    ```

    ```
    controlplane ~ ➜  kubectl get service -n payroll 
    NAME          TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
    mysql         ClusterIP   10.106.198.240   <none>        3306/TCP   5m10s
    web-service   ClusterIP   10.107.235.40    <none>        80/TCP     8m56s
    ```

    ```
    controlplane ~ ➜  kubectl edit deployment webapp
    ```

    Edit dbhost to "mysql.payroll"

    ```
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      annotations:
        deployment.kubernetes.io/revision: "1"
      creationTimestamp: "2023-01-13T11:57:11Z"
      generation: 1
      labels:
        name: webapp
      name: webapp
      namespace: default
      resourceVersion: "2426"
      uid: cec455e3-29ab-4f7d-9a3c-f71dfc2bb96d
    spec:
      progressDeadlineSeconds: 600
      replicas: 1
      revisionHistoryLimit: 10
      selector:
        matchLabels:
          name: webapp
      strategy:
        rollingUpdate:
          maxSurge: 25%
          maxUnavailable: 25%
        type: RollingUpdate
      template:
        metadata:
          creationTimestamp: null
          labels:
            name: webapp
        spec:
          containers:
          - env:
            - name: DB_Host
              value: mysql
            - name: DB_User
              value: root
            - name: DB_Password
              value: paswrd
    ```

    

15. From the `hr` pod `nslookup` the `mysql` service and redirect the output to a file `/root/CKA/nslookup.out`

    Check

    - nslookup output redirected

    ```
    controlplane ~ ➜  kubectl exec hr -- nslookup mysql
    Server:         10.96.0.10
    Address:        10.96.0.10#53
    
    ** server can't find mysql: NXDOMAIN
    
    command terminated with exit code 1
    
    controlplane ~ ✖ kubectl exec hr -- nslookup mysql.payroll
    Server:         10.96.0.10
    Address:        10.96.0.10#53
    
    Name:   mysql.payroll.svc.cluster.local
    Address: 10.106.198.240
    
    
    controlplane ~ ➜  kubectl exec hr -- nslookup mysql.payroll > /root/CKA/nslookup.out
    
    controlplane ~ ➜  cat /root/CKA/nslookup.out
    Server:         10.96.0.10
    Address:        10.96.0.10#53
    
    Name:   mysql.payroll.svc.cluster.local
    Address: 10.106.198.240
    ```



## PRACTICE TEST – CKA – INGRESS NETWORKING – 1

1. We have deployed Ingress Controller, resources and applications. Explore the setup.

   Note: They are in different namespaces.

   Ok

   ```
   controlplane ~ ➜  kubectl get nodes
   NAME           STATUS   ROLES           AGE     VERSION
   controlplane   Ready    control-plane   9m18s   v1.26.0
   
   controlplane ~ ➜  kubectl get deployments -A
   NAMESPACE       NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
   app-space       default-backend            1/1     1            1           4m20s
   app-space       webapp-video               1/1     1            1           4m20s
   app-space       webapp-wear                1/1     1            1           4m20s
   ingress-nginx   ingress-nginx-controller   1/1     1            1           4m16s
   kube-system     coredns                    2/2     2            2           10m
   ```

2. Which namespace is the `Ingress Controller` deployed in?

   - kube-system
   - nginx-ingress
   - default
   - **ingress-nginx**

   ```
   controlplane ~ ➜  kubectl get deployments -A
   NAMESPACE       NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
   app-space       default-backend            1/1     1            1           4m20s
   app-space       webapp-video               1/1     1            1           4m20s
   app-space       webapp-wear                1/1     1            1           4m20s
   ingress-nginx   ingress-nginx-controller   1/1     1            1           4m16s
   kube-system     coredns                    2/2     2            2           10m
   ```

3. What is the name of the Ingress Controller Deployment?

   - ingress-nginx
   - nginx-ingress
   - ingress-controller
   - **ingress-nginx-controller**
   - nginx-ingress-controller

   ```
   controlplane ~ ➜  kubectl get deployments.apps -n ingress-nginx 
   NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
   ingress-nginx-controller   1/1     1            1           30m
   ```
   
4. Which namespace are the applications deployed in?

   - **app-space**
   - kube-system
   - application
   - default

   ```
   controlplane ~ ➜  kubectl get deployments.apps -A
   NAMESPACE       NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
   app-space       default-backend            1/1     1            1           8m29s
   app-space       webapp-video               1/1     1            1           8m29s
   app-space       webapp-wear                1/1     1            1           8m29s
   ingress-nginx   ingress-nginx-controller   1/1     1            1           8m25s
   kube-system     coredns                    2/2     2            2           14m
   ```

5. How many applications are deployed in the `app-space` namespace?

   Count the number of deployments in this namespace.

   - 2
   - 1
   - 4
   - **3**

   ```
   controlplane ~ ➜  kubectl get deployments.apps -A
   NAMESPACE       NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
   app-space       default-backend            1/1     1            1           8m29s
   app-space       webapp-video               1/1     1            1           8m29s
   app-space       webapp-wear                1/1     1            1           8m29s
   ingress-nginx   ingress-nginx-controller   1/1     1            1           8m25s
   kube-system     coredns                    2/2     2            2           14m
   ```

6. Which namespace is the Ingress Resource deployed in?

   - default
   - kube-system
   - **app-space**
   - application

   ```
   controlplane ~ ➜  kubectl get ingress -A
   NAMESPACE   NAME                 CLASS    HOSTS   ADDRESS         PORTS   AGE
   app-space   ingress-wear-watch   <none>   *       10.111.99.161   80      11m
   ```

7. What is the name of the Ingress Resource?

   - app-space
   - default
   - **ingress-wear-watch**
   - ingress-wear

   ```
   controlplane ~ ➜  kubectl get ingress -A
   NAMESPACE   NAME                 CLASS    HOSTS   ADDRESS         PORTS   AGE
   app-space   ingress-wear-watch   <none>   *       10.111.99.161   80      11m
   ```

8. What is the `Host` configured on the `Ingress Resource`?

   The host entry defines the domain name that users use to reach the application like `www.google.com`

   - default
   - my-online-store.com
   - **All Hosts (*)**
   - wear.app.com

   Run the command: `kubectl describe ingress --namespace app-space` and look at `Host` under the `Rules` section.

   ```
   controlplane ~ ➜  kubectl get ingress -A
   NAMESPACE   NAME                 CLASS    HOSTS   ADDRESS         PORTS   AGE
   app-space   ingress-wear-watch   <none>   *       10.111.99.161   80      33m
   
   OR 
   
   controlplane ~ ➜  kubectl describe -n app-space ingress ingress-wear-watch 
   Name:             ingress-wear-watch
   Labels:           <none>
   Namespace:        app-space
   Address:          10.111.99.161
   Ingress Class:    <none>
   Default backend:  <default>
   Rules:
     Host        Path  Backends
     ----        ----  --------
     *           
                 /wear    wear-service:8080 (10.244.0.4:8080)
                 /watch   video-service:8080 (10.244.0.5:8080)
   Annotations:  nginx.ingress.kubernetes.io/rewrite-target: /
                 nginx.ingress.kubernetes.io/ssl-redirect: false
   Events:
     Type    Reason  Age                From                      Message
     ----    ------  ----               ----                      -------
     Normal  Sync    14m (x2 over 14m)  nginx-ingress-controller  Scheduled for sync
   ```

9. What backend is the `/wear` path on the Ingress configured with?

   - default-backend
   - **wear-service**
   - apparel-service
   - video-service

   Run the command: `kubectl describe ingress --namespace app-space` and look under the `Rules` section.

   ```
   controlplane ~ ➜  kubectl describe -n app-space ingress ingress-wear-watch 
   Name:             ingress-wear-watch
   Labels:           <none>
   Namespace:        app-space
   Address:          10.111.99.161
   Ingress Class:    <none>
   Default backend:  <default>
   Rules:
     Host        Path  Backends
     ----        ----  --------
     *           
                 /wear    wear-service:8080 (10.244.0.4:8080)
                 /watch   video-service:8080 (10.244.0.5:8080)
   Annotations:  nginx.ingress.kubernetes.io/rewrite-target: /
                 nginx.ingress.kubernetes.io/ssl-redirect: false
   Events:
     Type    Reason  Age                From                      Message
     ----    ------  ----               ----                      -------
     Normal  Sync    14m (x2 over 14m)  nginx-ingress-controller  Scheduled for sync
   ```

10. At what path is the video streaming application made available on the `Ingress`?

   - **/watch**
   - /stream
   - /video
   - /

   Run the command: `kubectl describe ingress --namespace app-space` and look under the `Rules` section.

```
   controlplane ~ ➜  kubectl describe -n app-space ingress ingress-wear-watch 
   Name:             ingress-wear-watch
   Labels:           <none>
   Namespace:        app-space
   Address:          10.111.99.161
   Ingress Class:    <none>
   Default backend:  <default>
   Rules:
     Host        Path  Backends
     ----        ----  --------
     *           
                 /wear    wear-service:8080 (10.244.0.4:8080)
                 /watch   video-service:8080 (10.244.0.5:8080)
   Annotations:  nginx.ingress.kubernetes.io/rewrite-target: /
                 nginx.ingress.kubernetes.io/ssl-redirect: false
   Events:
     Type    Reason  Age                From                      Message
     ----    ------  ----               ----                      -------
     Normal  Sync    14m (x2 over 14m)  nginx-ingress-controller  Scheduled for sync
```



11. If the requirement does not match any of the configured paths what service are the requests forwarded to?

    - **No Service**
    - The last service configured
    - default-backend-service
    - default-backend

    Run the command: `kubectl describe ingress --namespace app-space` and look at the `Default` backend field.

    ```
    controlplane ~ ➜  kubectl describe -n app-space ingress ingress-wear-watch 
    Name:             ingress-wear-watch
    Labels:           <none>
    Namespace:        app-space
    Address:          10.111.99.161
    Ingress Class:    <none>
    Default backend:  <default>
    Rules:
      Host        Path  Backends
      ----        ----  --------
      *           
                  /wear    wear-service:8080 (10.244.0.4:8080)
                  /watch   video-service:8080 (10.244.0.5:8080)
    Annotations:  nginx.ingress.kubernetes.io/rewrite-target: /
                  nginx.ingress.kubernetes.io/ssl-redirect: false
    Events:
      Type    Reason  Age                From                      Message
      ----    ------  ----               ----                      -------
      Normal  Sync    14m (x2 over 14m)  nginx-ingress-controller  Scheduled for sync
    ```

12. Now view the Ingress Service using the tab at the top of the terminal. Which page do you see?

    Click on the tab named `Ingress`.

    - Video Service
    - Apparel Service
    - **404 Error page**
    - Blank

13. View the applications by appending `/wear` and `/watch` to the URL you opened in the previous step.

    Ok

14. You are requested to change the URLs at which the applications are made available.

    Make the video application available at `/stream`.

    Check

    - Ingress: ingress-wear-watch
    - Path: /stream
    - Backend Service: video-service
    - Backend Service Port: 8080

    Run the command: `kubectl edit ingress --namespace app-space` and change the path to the video streaming application to `/stream`.

    ```
    controlplane ~ ➜  kubectl edit -n app-space ingress ingress-wear-watch
    ```

    Solution manifest file to change the path to the video streaming application to `/stream` as follows:

    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      annotations:
        nginx.ingress.kubernetes.io/rewrite-target: /
        nginx.ingress.kubernetes.io/ssl-redirect: "false"
      name: ingress-wear-watch
      namespace: app-space
    spec:
      rules:
      - http:
          paths:
          - backend:
              service:
                name: wear-service
                port: 
                  number: 8080
            path: /wear
            pathType: Prefix
          - backend:
              service:
                name: video-service
                port: 
                  number: 8080
            path: /stream
            pathType: Prefix
    ```

15. View the Video application using the `/stream` URL in your browser.

    Click on the `Ingress` tab above your terminal, if its not open already, and append `/stream` to the URL in the browser.

    Ok

16. A user is trying to view the `/eat` URL on the Ingress Service. Which page would he see?

    If not open already, click on the `Ingress` tab above your terminal, and append `/eat` to the URL in the browser.

    - Apparel Service
    - Video Service
    - Blank
    - **404 Error page**

17. Due to increased demand, your business decides to take on a new venture. You acquired a food delivery company. Their applications have been migrated over to your cluster.

    Inspect the new deployments in the `app-space` namespace.

    Ok

    ```
    controlplane ~ ➜  kubectl get deployments -n app-space 
    NAME              READY   UP-TO-DATE   AVAILABLE   AGE
    default-backend   1/1     1            1           15m
    webapp-food       1/1     1            1           97s
    webapp-video      1/1     1            1           15m
    webapp-wear       1/1     1            1           15m
    ```

18. You are requested to add a new path to your ingress to make the food delivery application available to your customers.

    Make the new application available at `/eat`.

    Check

    - Ingress: ingress-wear-watch
    - Path: /eat
    - Backend Service: food-service
    - Backend Service Port: 8080

    Run the command: `kubectl edit ingress --namespace app-space` and add a new Path entry for the new service.

    ```
    controlplane ~ ➜  kubectl edit -n app-space ingress ingress-wear-watch
    ```

    Solution manifest file to add a new path to our ingress service to make the application available at `/eat` as follows:

    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      annotations:
        nginx.ingress.kubernetes.io/rewrite-target: /
        nginx.ingress.kubernetes.io/ssl-redirect: "false"
      name: ingress-wear-watch
      namespace: app-space
    spec:
      rules:
      - http:
          paths:
          - backend:
              service:
                name: wear-service
                port: 
                  number: 8080
            path: /wear
            pathType: Prefix
          - backend:
              service:
                name: video-service
                port: 
                  number: 8080
            path: /stream
            pathType: Prefix
          - backend:
              service:
                name: food-service
                port: 
                  number: 8080
            path: /eat
            pathType: Prefix
    ```

19. View the Food delivery application using the `/eat` URL in your browser.

    Click on the `Ingress` tab above your terminal, if its not open already, and append `/eat` to the URL in the browser.

    Ok

20. A new payment service has been introduced. Since it is critical, the new application is deployed in its own namespace.

    Identify the namespace in which the new application is deployed.

    - easy-pay
    - **critical-space**
    - pay-space
    - kube-public
    - default

    Run the command: `kubectl get deploy --all-namespaces` and inspect the newly created namespace and deployment.

    ```
    controlplane ~ ➜  kubectl get deploy --all-namespaces
    NAMESPACE        NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
    app-space        default-backend            1/1     1            1           22m
    app-space        webapp-food                1/1     1            1           8m56s
    app-space        webapp-video               1/1     1            1           22m
    app-space        webapp-wear                1/1     1            1           22m
    critical-space   webapp-pay                 1/1     1            1           112s
    ingress-nginx    ingress-nginx-controller   1/1     1            1           22m
    kube-system      coredns                    2/2     2            2           35m
    ```

21. What is the name of the deployment of the new application?

    - **webapp-pay**
    - easy-pay
    - payment-gateway
    - pay-service

    ```
    controlplane ~ ➜  kubectl get deploy --all-namespaces
    NAMESPACE        NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
    app-space        default-backend            1/1     1            1           22m
    app-space        webapp-food                1/1     1            1           8m56s
    app-space        webapp-video               1/1     1            1           22m
    app-space        webapp-wear                1/1     1            1           22m
    critical-space   webapp-pay                 1/1     1            1           112s
    ingress-nginx    ingress-nginx-controller   1/1     1            1           22m
    kube-system      coredns                    2/2     2            2           35m
    ```

22. You are requested to make the new application available at `/pay`.

    Identify and implement the best approach to making this application available on the ingress controller and test to make sure its working. Look into annotations: rewrite-target as well.

    Check

    - Ingress Created
    - Path: /pay
    - Configure correct backend service
    - Configure correct backend port

    Create a new Ingress for the new pay application in the `critical-space` namespace.
    Use the command `kubectl get svc -n critical-space` to know the service and port details.

    ```
    controlplane ~ ➜  kubectl get svc -n critical-space 
    NAME          TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
    pay-service   ClusterIP   10.111.27.144   <none>        8282/TCP   12m
    ```

    ```
    controlplane ~ ➜  kubectl create ingress ingress-pay --namespace=critical-space --rule="/pay=pay-service:8282"
    ingress.networking.k8s.io/ingress-pay created
    ```

    ```
    controlplane ~ ➜  kubectl get ingress -n critical-space 
    NAME          CLASS    HOSTS   ADDRESS   PORTS   AGE
    ingress-pay   <none>   *                 80      16s
    
    controlplane ~ ➜  kubectl describe -n critical-space ingress ingress-pay Name:             ingress-pay
    Labels:           <none>
    Namespace:        critical-space
    Address:          10.102.93.123
    Ingress Class:    <none>
    Default backend:  <default>
    Rules:
      Host        Path  Backends
      ----        ----  --------
      *           
                  /pay   pay-service:8282 (10.244.0.11:8080)
    Annotations:  <none>
    Events:
      Type    Reason  Age                 From                      Message
      ----    ------  ----                ----                      -------
      Normal  Sync    98s (x2 over 2m2s)  nginx-ingress-controller  Scheduled for sync
    ```

    **Check logs for error**

    ```
    controlplane ~ ➜  kubectl get pods -n critical-space 
    NAME                          READY   STATUS    RESTARTS   AGE
    webapp-pay-58cdc69889-f9t46   1/1     Running   0          27m
    
    controlplane ~ ➜  kubectl logs webapp-pay-58cdc69889-f9t46 -n critical-space 
     * Serving Flask app 'app' (lazy loading)
     * Environment: production
       WARNING: This is a development server. Do not use it in a production deployment.
       Use a production WSGI server instead.
     * Debug mode: off
     * Running on all addresses.
       WARNING: This is a development server. Do not use it in a production deployment.
     * Running on http://10.244.0.11:8080/ (Press CTRL+C to quit)
    10.244.0.9 - - [16/Jan/2023 02:00:25] "GET /pay HTTP/1.1" 404 -
    10.244.0.9 - - [16/Jan/2023 02:03:16] "GET /pay HTTP/1.1" 404 -
    ```

    

    Solution manifest file to create a new ingress service to make the application available at `/pay` as follows:

    ```
    controlplane ~ ➜  kubectl edit -n critical-space ingress ingress-pay 
    ```

    Add annotations

    ```yaml
    ---
    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      name: test-ingress
      namespace: critical-space
      annotations:
        nginx.ingress.kubernetes.io/rewrite-target: /
        nginx.ingress.kubernetes.io/ssl-redirect: "false"
    spec:
      rules:
      - http:
          paths:
          - path: /pay
            pathType: Prefix
            backend:
              service:
               name: pay-service
               port:
                number: 8282
    ```

23. View the Payment application using the `/pay` URL in your browser.

    Click on the `Ingress` tab above your terminal, if its not open already, and append `/pay` to the URL in the browser.

    Ok



## PRACTICE TEST – CKA – INGRESS NETWORKING – 2

1. We have deployed two applications. Explore the setup.

   Note: They are in a different namespace.

   Ok

   ```
   root@controlplane ~ ➜  kubectl get pods -A
   NAMESPACE     NAME                                   READY   STATUS    RESTARTS   AGE
   app-space     default-backend-5cf9bfb9d-7hfx7        1/1     Running   0          9m8s
   app-space     webapp-video-84f8655bd8-w7ltq          1/1     Running   0          9m8s
   app-space     webapp-wear-6ff9445955-ht2lq           1/1     Running   0          9m8s
   kube-system   coredns-74ff55c5b-pvklj                1/1     Running   0          69m
   kube-system   coredns-74ff55c5b-r8wtk                1/1     Running   0          69m
   kube-system   etcd-controlplane                      1/1     Running   0          70m
   kube-system   kube-apiserver-controlplane            1/1     Running   0          70m
   kube-system   kube-controller-manager-controlplane   1/1     Running   0          70m
   kube-system   kube-flannel-ds-mcnlk                  1/1     Running   0          69m
   kube-system   kube-proxy-vxj2t                       1/1     Running   0          69m
   kube-system   kube-scheduler-controlplane            1/1     Running   0          70m
   ```

   ```
   root@controlplane ~ ➜  kubectl get deployments -A
   NAMESPACE     NAME              READY   UP-TO-DATE   AVAILABLE   AGE
   app-space     default-backend   1/1     1            1           9m23s
   app-space     webapp-video      1/1     1            1           9m23s
   app-space     webapp-wear       1/1     1            1           9m23s
   kube-system   coredns           2/2     2            2           70m
   ```

2. Let us now deploy an Ingress Controller. First, create a namespace called `ingress-space`.

   We will isolate all ingress related objects into its own namespace.

   Check

   - Name: ingress-space

   ##### ![image-20230116103111877](images/image-20230116103111877.png)

   ```
   root@controlplane ~ ➜  kubectl create namespace ingress-space
   namespace/ingress-space created
   ```

3. The NGINX Ingress Controller requires a ConfigMap object. Create a ConfigMap object in the `ingress-space`.

   Use the spec given below. No data needs to be configured in the ConfigMap.

   Check

   - Name: nginx-configuration

   ![image-20230116103347056](images/image-20230116103347056.png)

   ```
   root@controlplane ~ ➜  kubectl create configmap nginx-configuration -n ingress-space 
   configmap/nginx-configuration created
   ```

4. The NGINX Ingress Controller requires a ServiceAccount. Create a ServiceAccount in the `ingress-space` namespace.

   Use the spec provided below.

   Check

   - Name: ingress-serviceaccount

   ```
   root@controlplane ~ ➜  kubectl create serviceaccount ingress-serviceaccount -n ingress-space 
   serviceaccount/ingress-serviceaccount created
   ```

5. We have created the Roles and RoleBindings for the ServiceAccount. Check it out!!

   Ok

   ```
   root@controlplane ~ ➜  kubectl get role -n ingress-space 
   NAME           CREATED AT
   ingress-role   2023-01-16T02:43:42Z
   
   root@controlplane ~ ➜  kubectl get rolebindings -n ingress-space 
   NAME                   ROLE                AGE
   ingress-role-binding   Role/ingress-role   4m38s
   
   root@controlplane ~ ➜  kubectl describe -n ingress-space role ingress-role 
   Name:         ingress-role
   Labels:       app.kubernetes.io/name=ingress-nginx
                 app.kubernetes.io/part-of=ingress-nginx
   Annotations:  <none>
   PolicyRule:
     Resources   Non-Resource URLs  Resource Names                     Verbs
     ---------   -----------------  --------------                     -----
     configmaps  []                 []                                 [get create]
     configmaps  []                 [ingress-controller-leader-nginx]  [get update]
     endpoints   []                 []                                 [get]
     namespaces  []                 []                                 [get]
     pods        []                 []                                 [get]
     secrets     []                 []                                 [get]
   
   root@controlplane ~ ➜  kubectl describe -n ingress-space rolebindings ingress-role-binding 
   Name:         ingress-role-binding
   Labels:       app.kubernetes.io/name=ingress-nginx
                 app.kubernetes.io/part-of=ingress-nginx
   Annotations:  <none>
   Role:
     Kind:  Role
     Name:  ingress-role
   Subjects:
     Kind            Name                    Namespace
     ----            ----                    ---------
     ServiceAccount  ingress-serviceaccount  
   ```

6. Let us now deploy the Ingress Controller. Create a deployment using the file given.

   The Deployment configuration is given at `/root/ingress-controller.yaml`. There are several issues with it. Try to fix them.

   Check

   - Deployed in the correct namespace.
   - Replicas: 1
   - Use the right image
   - Namespace: ingress-space

   ingress-controller.yaml

   ```
   ---
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: ingress-controller
     namespace: ingress-
   spec:
     replicas: 1
     selector:
       matchLabels:
         name: nginx-ingress
     template:
       metadata:
         labels:
           name: nginx-ingress
       spec:
         serviceAccountName: ingress-serviceaccount
         containers:
           - name: nginx-ingress-controller
             image: quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.21.0
             args:
               - /nginx-ingress-controller
               - --configmap=$(POD_NAMESPACE)/nginx-configuration
               - --default-backend-service=app-space/default-http-backend
             env:
               - name: POD_NAME
                 valueFrom:
                   fieldRef:
                     fieldPath: metadata.name
               - name: POD_NAMESPACE
                 valueFrom:
                   fieldRef:
                     fieldPath: metadata.namespace
             ports:
               - name: http
                   containerPort: 80
               - name: https
                 containerPort: 443
   ```

   Create the deployment

   ```
   root@controlplane ~ ➜  kubectl create -f ingress-controller.yaml 
   error: error parsing ingress-controller.yaml: error converting YAML to JSON: yaml: line 36: mapping values are not allowed in this context
   ```

   Edit ingress-controller.yaml 

   ingress-controller.yaml 

   ```
   ---
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: ingress-controller
     namespace: ingress-space
   spec:
     replicas: 1
     selector:
       matchLabels:
         name: nginx-ingress
     template:
       metadata:
         labels:
           name: nginx-ingress
       spec:
         serviceAccountName: ingress-serviceaccount
         containers:
           - name: nginx-ingress-controller
             image: quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.21.0
             args:
               - /nginx-ingress-controller
               - --configmap=$(POD_NAMESPACE)/nginx-configuration
               - --default-backend-service=app-space/default-http-backend
             env:
               - name: POD_NAME
                 valueFrom:
                   fieldRef:
                     fieldPath: metadata.name
               - name: POD_NAMESPACE
                 valueFrom:
                   fieldRef:
                     fieldPath: metadata.namespace
             ports:
               - name: http
                 containerPort: 80
               - name: https
                 containerPort: 443
   ```

   ```
   root@controlplane ~ ➜  kubectl create -f ingress-controller.yaml 
   deployment.apps/ingress-controller created
   ```

7. Let us now create a service to make Ingress available to external users.

   Create a service following the given specs.

   Check

   - Name: ingress
   - Type: NodePort
   - Port: 80
   - TargetPort: 80
   - NodePort: 30080
   - Namespace: ingress-space
   - Use the right selector

   Use the command `kubectl expose -n ingress-space deployment ingress-controller --type=NodePort --port=80 --name=ingress --dry-run=client -o yaml > ingress.yaml` and manually add the given `node port` and `namespace`.

   ```
   root@controlplane ~ ➜  kubectl expose -n ingress-space deployment ingress-controller --name=ingress --port=80 --target-port=80 --type=NodePort  
   service/ingress exposed
   
   root@controlplane ~ ➜  kubectl get svc -n ingress-space 
   NAME      TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
   ingress   NodePort   10.102.106.213   <none>        80:30025/TCP   16s
   
   root@controlplane ~ ➜  kubectl describe -n ingress-space svc ingress 
   Name:                     ingress
   Namespace:                ingress-space
   Labels:                   <none>
   Annotations:              <none>
   Selector:                 name=nginx-ingress
   Type:                     NodePort
   IP Families:              <none>
   IP:                       10.102.106.213
   IPs:                      10.102.106.213
   Port:                     <unset>  80/TCP
   TargetPort:               80/TCP
   NodePort:                 <unset>  30025/TCP
   Endpoints:                10.244.0.7:80
   Session Affinity:         None
   External Traffic Policy:  Cluster
   Events:                   <none>
   ```

   Edit Nodeport number

   ```
   root@controlplane ~ ➜  kubectl edit -n ingress-space svc ingress 
   ```

   ```
   apiVersion: v1
   kind: Service
   metadata:
     creationTimestamp: "2023-01-16T06:45:09Z"
     name: ingress
     namespace: ingress-space
     resourceVersion: "5361"
     uid: 509dcff0-b4f9-4bb5-82da-02f4a944e3f7
   spec:
     clusterIP: 10.102.106.213
     clusterIPs:
     - 10.102.106.213
     externalTrafficPolicy: Cluster
     ports:
     - nodePort: 30080
       port: 80
       protocol: TCP
       targetPort: 80
     selector:
       name: nginx-ingress
     sessionAffinity: None
     type: NodePort
   status:
     loadBalancer: {}
   ```

8. Create the ingress resource to make the applications available at `/wear` and `/watch` on the Ingress service.

   Create the ingress in the `app-space` namespace.

   Check

   - Ingress Created
   - Path: /wear
   - Path: /watch
   - Configure correct backend service for /wear
   - Configure correct backend service for /watch
   - Configure correct backend port for /wear service
   - Configure correct backend port for /watch service

   ```
   root@controlplane ~ ➜  kubectl get svc -n app-space 
   NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
   default-http-backend   ClusterIP   10.107.178.167   <none>        80/TCP     30m
   video-service          ClusterIP   10.110.144.189   <none>        8080/TCP   30m
   wear-service           ClusterIP   10.109.5.71      <none>        8080/TCP   30m
   ```

   Edit ingress "ingres-wear-watch" and add annotations

   ```
   root@controlplane ~ ➜  kubectl edit -n app-space ingress ingres-wear-watch 
   ```

   ```
   apiVersion: networking.k8s.io/v1
   kind: Ingress
   metadata:
     name: ingress-wear-watch
     namespace: app-space
     annotations:
       nginx.ingress.kubernetes.io/rewrite-target: /
       nginx.ingress.kubernetes.io/ssl-redirect: "false"
   spec:
     rules:
     - http:
         paths:
         - path: /wear
           pathType: Prefix
           backend:
             service:
              name: wear-service
              port: 
               number: 8080
         - path: /watch
           pathType: Prefix
           backend:
             service:
              name: video-service
              port:
               number: 8080
   ```

9. Access the application using the `Ingress` tab on top of your terminal.

   Make sure you can access the right applications at `/wear` and `/watch` paths.

   Ok



# INSTALL “KUBERNETES THE KUBEADM WAY”, PRACTICE TEST – DEPLOY A KUBERNETES CLUSTER USING KUBEADM

1. Install the `kubeadm` and `kubelet` packages on the `controlplane` and `node01`.

   Use the exact version of `1.26.0-00` for both.

   Check

   - kubeadm installed on controlplane ?
   - kubelet installed on controlplane?
   - Kubeadm installed on worker node01 ?
   - Kubelet installed on worker node01 ?

   Refer to the official k8s documentation - `https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/`
   and follow the installation steps.

   **Do it on botn the Controlplane and Node01**

   1. Verify the MAC address and product_uuid are unique for every node 

      **Controlplane**

      ```
      controlplane ~ ➜  ip addr
      1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
          link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
          inet 127.0.0.1/8 scope host lo
             valid_lft forever preferred_lft forever
      2: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UNKNOWN group default 
          link/ether 52:41:28:8e:4c:42 brd ff:ff:ff:ff:ff:ff
          inet 10.244.0.0/32 scope global flannel.1
             valid_lft forever preferred_lft forever
      3: cni0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
          link/ether f6:95:da:af:a8:c0 brd ff:ff:ff:ff:ff:ff
          inet 10.244.0.1/24 brd 10.244.0.255 scope global cni0
             valid_lft forever preferred_lft forever
      6491: eth0@if6492: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default 
          link/ether 02:42:0a:21:d9:09 brd ff:ff:ff:ff:ff:ff link-netnsid 0
          inet 10.33.217.9/24 brd 10.33.217.255 scope global eth0
             valid_lft forever preferred_lft forever
      6493: eth1@if6494: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
          link/ether 02:42:ac:19:00:42 brd ff:ff:ff:ff:ff:ff link-netnsid 1
          inet 172.25.0.66/24 brd 172.25.0.255 scope global eth1
             valid_lft forever preferred_lft forever
      ```

      ```
      controlplane ~ ➜  cat /sys/class/dmi/id/product_uuid
      47c0ebaa-a153-fb7f-9dd2-5e3a7bd0e4ce
      ```

      **Node01**

      ```
      root@node01 ~ ➜  ip add
      1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
          link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
          inet 127.0.0.1/8 scope host lo
             valid_lft forever preferred_lft forever
      2: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UNKNOWN group default 
          link/ether 0e:c8:ee:63:2d:8a brd ff:ff:ff:ff:ff:ff
          inet 10.244.1.0/32 scope global flannel.1
             valid_lft forever preferred_lft forever
      9914: eth0@if9915: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default 
          link/ether 02:42:0a:21:d9:0c brd ff:ff:ff:ff:ff:ff link-netnsid 0
          inet 10.33.217.12/24 brd 10.33.217.255 scope global eth0
             valid_lft forever preferred_lft forever
      9916: eth1@if9917: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
          link/ether 02:42:ac:19:00:44 brd ff:ff:ff:ff:ff:ff link-netnsid 1
          inet 172.25.0.68/24 brd 172.25.0.255 scope global eth1
             valid_lft forever preferred_lft forever
      ```

      ```
      root@node01 ~ ➜  cat /sys/class/dmi/id/product_uuid
      dc79c641-18a0-2e2b-0ab4-a3e11a52c0ac
      ```

   2. Forwarding IPv4 and letting iptables see bridged traffic

      Execute the below mentioned instructions:

      ```bash
      cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
      overlay
      br_netfilter
      EOF
      
      sudo modprobe overlay
      sudo modprobe br_netfilter
      
      # sysctl params required by setup, params persist across reboots
      cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
      net.bridge.bridge-nf-call-iptables  = 1
      net.bridge.bridge-nf-call-ip6tables = 1
      net.ipv4.ip_forward                 = 1
      EOF
      
      # Apply sysctl params without reboot
      sudo sysctl --system
      ```

   3. Check required ports 
      These required ports need to be open in order for Kubernetes components to communicate with each other. You can use tools like netcat to check if a port is open. For example:

      ```
      nc 127.0.0.1 6443
      ```

   4. Installing a container runtime

      - Install docker

   5. Installing kubeadm, kubelet and kubectl

      1. Update the `apt` package index and install packages needed to use the Kubernetes `apt` repository:

         ```shell
         sudo apt-get update
         sudo apt-get install -y apt-transport-https ca-certificates curl
         ```

      2. Download the Google Cloud public signing key:

         ```shell
         sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
         ```

      3. Add the Kubernetes `apt` repository:

         ```shell
         echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
         ```

      4. Update `apt` package index, install kubelet, kubeadm and kubectl, and pin their version:

         ```shell
         sudo apt-get update
         sudo apt-get install -y kubelet=1.26.0-00 kubeadm=1.26.0-00 kubectl=1.26.0-00
         sudo apt-mark hold kubelet kubeadm kubectl
         ```

2. What is the version of `kubelet` installed?

   - 1.20
   - 1.22.5
   - **1.26.0**
   - 1.23

   ```
   controlplane ~ ➜  kubelet --version
   Kubernetes v1.26.0
   ```

3. How many nodes are part of kubernetes cluster currently?

   Are you able to run `kubectl get nodes`?

   - 2
   - 4
   - 1
   - **0**

   ```
   controlplane ~ ➜  kubectl get nodes
   E0116 04:36:50.215388   30328 memcache.go:238] couldn't get current server API group list: <nil>
   E0116 04:36:50.217399   30328 memcache.go:238] couldn't get current server API group list: <nil>
   E0116 04:36:50.219167   30328 memcache.go:238] couldn't get current server API group list: <nil>
   E0116 04:36:50.220607   30328 memcache.go:238] couldn't get current server API group list: <nil>
   error: the server doesn't have a resource type "nodes"
   ```

4. Lets now bootstrap a `kubernetes` cluster using `kubeadm`.

   The latest version of Kubernetes will be installed.

   Ok

5. Initialize `Control Plane Node (Master Node)`. Use the following options:

   

   1. `apiserver-advertise-address` - Use the IP address allocated to eth0 on the controlplane node

      

   2. `apiserver-cert-extra-sans` - Set it to `controlplane`

      

   3. `pod-network-cidr` - Set to `10.244.0.0/16`

   Once done, set up the `default kubeconfig` file and wait for node to be part of the cluster.

   Check

   - Controlplane node initialized

   Kubernetes Documentation

   https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

   ```
   controlplane ~ ➜  kubeadm init --apiserver-advertise-address 10.38.99.9 --apiserver-cert-extra-sans=controlplane --pod-network-cidr=10.244.0.0/16
   
   Your Kubernetes control-plane has initialized successfully!
   
   To start using your cluster, you need to run the following as a regular user:
   
     mkdir -p $HOME/.kube
     sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
     sudo chown $(id -u):$(id -g) $HOME/.kube/config
   
   Alternatively, if you are the root user, you can run:
   
     export KUBECONFIG=/etc/kubernetes/admin.conf
   
   You should now deploy a pod network to the cluster.
   Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
     https://kubernetes.io/docs/concepts/cluster-administration/addons/
   
   Then you can join any number of worker nodes by running the following on each as root:
   
   kubeadm join 10.38.99.9:6443 --token kfxidw.4aqakvucc58sjhit \
           --discovery-token-ca-cert-hash sha256:bec7ee658363620b3c92cc6d23c643511eb6a9b50ba9719660ffc754d2ac389b 
   ```

   ```
   controlplane ~ ➜  mkdir -p $HOME/.kube
   
   controlplane ~ ➜    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   
   controlplane ~ ➜    sudo chown $(id -u):$(id -g) $HOME/.kube/config
   ```

6. Generate a kubeadm join token

   Or copy the one that was generated by `kubeadm init` command

   Ok

   ```
   controlplane ~ ➜  kubeadm token create --print-join-command
   kubeadm join 10.38.99.9:6443 --token p51dhw.gj4a8kqap6262865 --discovery-token-ca-cert-hash sha256:bec7ee658363620b3c92cc6d23c643511eb6a9b50ba9719660ffc754d2ac389b 
   ```

7. Join `node01` to the cluster using the join token

   Check

   - Node01 joined the cluster?

   ```
   controlplane ~ ➜  ssh node01
   Last login: Mon Jan 16 04:28:48 2023 from 10.38.99.10
   
   root@node01 ~ ➜  kubeadm join 10.38.99.9:6443 --token p51dhw.gj4a8kqap6262865 --discovery-token-ca-cert-hash sha256:bec7ee658363620b3c92cc6d23c643511eb6a9b50ba9719660ffc754d2ac389b 
   [preflight] Running pre-flight checks
   [preflight] Reading configuration from the cluster...
   [preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -o yaml'
   [kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
   [kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
   [kubelet-start] Starting the kubelet
   [kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap...
   
   This node has joined the cluster:
   * Certificate signing request was sent to apiserver and a response was received.
   * The Kubelet was informed of the new secure connection details.
   
   Run 'kubectl get nodes' on the control-plane to see this node join the cluster.
   ```

   ```
   
   ```

   

8. Install a Network Plugin. As a default, we will go with `flannel`

   Refer to the official documentation for the procedure.

   Check

   - Network Plugin deployed?

   ```
   controlplane ~ ➜  kubectl get nodes
   NAME           STATUS     ROLES           AGE    VERSION
   controlplane   NotReady   control-plane   15m    v1.26.0
   node01         NotReady   <none>          105s   v1.26.0
   ```

   Kubernetes Documentation

   https://kubernetes.io/docs/concepts/cluster-administration/addons/

   On the `controlplane` node, run the following command to deploy the network plugin: 

   ```
   controlplane ~ ➜  kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/v0.20.2/Documentation/kube-flannel.yml
   
   namespace/kube-flannel created
   clusterrole.rbac.authorization.k8s.io/flannel created
   clusterrolebinding.rbac.authorization.k8s.io/flannel created
   serviceaccount/flannel created
   configmap/kube-flannel-cfg created
   daemonset.apps/kube-flannel-ds created
   ```

   ```
   controlplane ~ ✖ kubectl get pods -A
   NAMESPACE      NAME                                   READY   STATUS    RESTARTS   AGE
   kube-flannel   kube-flannel-ds-btcsq                  1/1     Running   0          90s
   kube-flannel   kube-flannel-ds-kw7jd                  1/1     Running   0          90s
   kube-system    coredns-787d4945fb-n6cng               1/1     Running   0          20m
   kube-system    coredns-787d4945fb-zsk6w               1/1     Running   0          20m
   kube-system    etcd-controlplane                      1/1     Running   1          20m
   kube-system    kube-apiserver-controlplane            1/1     Running   1          20m
   kube-system    kube-controller-manager-controlplane   1/1     Running   1          20m
   kube-system    kube-proxy-ft8mk                       1/1     Running   0          20m
   kube-system    kube-proxy-qtqng                       1/1     Running   0          6m49s
   kube-system    kube-scheduler-controlplane            1/1     Running   1          20m
   ```

   ```
   controlplane ~ ✖ kubectl get nodes 
   NAME           STATUS   ROLES           AGE     VERSION
   controlplane   Ready    control-plane   20m     v1.26.0
   node01         Ready    <none>          7m14s   v1.26.0
   ```

   

   
# TROUBLESHOOTING



## PRACTICE TEST APPLICATION FAILURE

### Troubleshooting Test 1

1. **Troubleshooting Test 1:** A simple 2 tier application is deployed in the `alpha` namespace. It must display a green web page on success. Click on the `App` tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.

   Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.

   Check

   - Fix Issue

   ![image-20230116181650653](images/image-20230116181650653-1673864213647-4.png)

   **Set the default namespace to alpha**

   ```
   controlplane ~ ➜  kubectl config set-context --current --namespace alpha
   Context "default" modified.
   ```

   ```
   controlplane ~ ➜  kubectl get pods
   NAME                            READY   STATUS    RESTARTS   AGE
   webapp-mysql-7cc9dcdffd-r5zml   1/1     Running   0          10m
   mysql                           1/1     Running   0          10m
   
   controlplane ~ ➜  kubectl get deploy
   NAME           READY   UP-TO-DATE   AVAILABLE   AGE
   webapp-mysql   1/1     1            1           11m
   
   controlplane ~ ➜  kubectl get svc
   NAME          TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
   mysql         ClusterIP   10.43.239.228   <none>        3306/TCP         11m
   web-service   NodePort    10.43.150.222   <none>        8080:30081/TCP   11m
   
   controlplane ~ ➜  curl http://localhost:30081
   <!doctype html>
   <title>Hello from Flask</title>
   <body style="background: #ff3f3f;"></body>
   <div style="color: #e4e4e4;
       text-align:  center;
       height: 90px;
       vertical-align:  middle;">
   
     
       <img src="/static/img/failed.png">
       <!-- <h1> DATABASE CONNECTION FAILED !!</h1> -->
     
   
     
       <h2> Environment Variables: DB_Host=mysql-service; DB_Database=Not Set; DB_User=root; DB_Password=paswrd; 2003: Can&#39;t connect to MySQL server on &#39;mysql-service:3306&#39; (-2 Name does not resolve) </h2>
     
   
     
       <p> From webapp-mysql-7cc9dcdffd-r5zml!</p>
     
   
     
   
   </div>
   ```

   **Check if the dbhost name is correct**

   ```
   controlplane ~ ➜  kubectl describe deployments.apps webapp-mysql 
   Name:                   webapp-mysql
   Namespace:              alpha
   CreationTimestamp:      Mon, 16 Jan 2023 10:15:53 +0000
   Labels:                 name=webapp-mysql
   Annotations:            deployment.kubernetes.io/revision: 1
   Selector:               name=webapp-mysql
   Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
   StrategyType:           RollingUpdate
   MinReadySeconds:        0
   RollingUpdateStrategy:  25% max unavailable, 25% max surge
   Pod Template:
     Labels:  name=webapp-mysql
     Containers:
      webapp-mysql:
       Image:      mmumshad/simple-webapp-mysql
       Port:       8080/TCP
       Host Port:  0/TCP
       Environment:
         DB_Host:      mysql-service
         DB_User:      root
         DB_Password:  paswrd
       Mounts:         <none>
     Volumes:          <none>
   Conditions:
     Type           Status  Reason
     ----           ------  ------
     Available      True    MinimumReplicasAvailable
     Progressing    True    NewReplicaSetAvailable
   OldReplicaSets:  <none>
   NewReplicaSet:   webapp-mysql-7cc9dcdffd (1/1 replicas created)
   Events:
     Type    Reason             Age   From                   Message
     ----    ------             ----  ----                   -------
     Normal  ScalingReplicaSet  16m   deployment-controller  Scaled up replica set webapp-mysql-7cc9dcdffd to 1
   
   controlplane ~ ➜  kubectl get svc
   NAME          TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
   mysql         ClusterIP   10.43.239.228   <none>        3306/TCP         16m
   web-service   NodePort    10.43.150.222   <none>        8080:30081/TCP   16m
   ```

   **Change the service name to mysql-service**

   ```
   controlplane ~ ➜  kubectl edit svc mysql 
   ```

   ```
   apiVersion: v1
   kind: Service
   metadata:
     creationTimestamp: "2023-01-16T10:15:53Z"
     name: mysql-service
     namespace: alpha
     resourceVersion: "681"
     uid: d0dd58e2-490e-4418-8ec4-7eb057b44a2a
   spec:
     clusterIP: 10.43.239.228
     clusterIPs:
     - 10.43.239.228
     internalTrafficPolicy: Cluster
     ipFamilies:
     - IPv4
     ipFamilyPolicy: SingleStack
     ports:
     - port: 3306
       protocol: TCP
       targetPort: 3306
     selector:
       name: mysql
     sessionAffinity: None
     type: ClusterIP
   status:
     loadBalancer: {}
   ```

   ```
   controlplane ~ ✖ kubectl delete svc 
   mysql        web-service  
   
   controlplane ~ ✖ kubectl delete svc mysql 
   service "mysql" deleted
   
   controlplane ~ ➜  kubectl create -f /tmp/kubectl-edit-4276134165.yaml
   service/mysql-service created
   
   controlplane ~ ➜  kubectl get svc
   NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
   web-service     NodePort    10.43.150.222   <none>        8080:30081/TCP   20m
   mysql-service   ClusterIP   10.43.239.228   <none>        3306/TCP         9s
   ```

   **Check if connection is successful**

   ```
   controlplane ~ ➜  curl http://localhost:30081
   <!doctype html>
   <title>Hello from Flask</title>
   <body style="background: #39b54b;"></body>
   <div style="color: #e4e4e4;
       text-align:  center;
       height: 90px;
       vertical-align:  middle;">
   
     
       <!-- <h1> DATABASE CONNECTION SUCCESSFUL !</h1> -->
       <img src="/static/img/success.jpg">
     
   
     
       <h2> Environment Variables: DB_Host=mysql-service; DB_Database=Not Set; DB_User=root; DB_Password=paswrd;  </h2>
     
   
     
       <p> From webapp-mysql-7cc9dcdffd-r5zml!</p>
     
   
     
   
   </div>
   ```

### Troubleshooting Test 2

2. **Troubleshooting Test 2:** The same 2 tier application is deployed in the `beta` namespace. It must display a green web page on success. Click on the `App` tab at the top of your terminal to view your 

​	application. It is currently failed. Troubleshoot and fix the issue.

​	Stick to the given architecture. Use the same names and port numbers as given in the below 

​	architecture diagram. Feel free to edit, delete or recreate objects as necessary.

​	Check

- Fix Issue

**Set the default namespace to beta**

```
controlplane ~ ➜  kubectl config set-context --current --namespace=beta
Context "default" modified.
```

```
controlplane ~ ➜  kubectl get pods
NAME                            READY   STATUS    RESTARTS   AGE
mysql                           1/1     Running   0          5m18s
webapp-mysql-7cc9dcdffd-98cp2   1/1     Running   0          5m18s

controlplane ~ ➜  kubectl get svc
NAME            TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
mysql-service   ClusterIP   10.43.5.176    <none>        3306/TCP         6m54s
web-service     NodePort    10.43.93.131   <none>        8080:30081/TCP   6m54s
```

**Browse web service**

```
controlplane ~ ➜  curl http://localhost:30081
<!doctype html>
<title>Hello from Flask</title>
<body style="background: #ff3f3f;"></body>
<div style="color: #e4e4e4;
    text-align:  center;
    height: 90px;
    vertical-align:  middle;">

  
    <img src="/static/img/failed.png">
    <!-- <h1> DATABASE CONNECTION FAILED !!</h1> -->
  

  
    <h2> Environment Variables: DB_Host=mysql-service; DB_Database=Not Set; DB_User=root; DB_Password=paswrd; 2003: Can&#39;t connect to MySQL server on &#39;mysql-service:3306&#39; (111 Connection refused) </h2>
  

  
    <p> From webapp-mysql-7cc9dcdffd-98cp2!</p>
  

  

</div>
```

**Check if the port of the service is correct** (check the Endpoints)

```
controlplane ~ ➜  kubectl describe svc mysql-service 
Name:              mysql-service
Namespace:         beta
Labels:            <none>
Annotations:       <none>
Selector:          name=mysql
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.43.5.176
IPs:               10.43.5.176
Port:              <unset>  3306/TCP
TargetPort:        8080/TCP
Endpoints:         10.42.0.11:8080
Session Affinity:  None
Events:            <none>

controlplane ~ ➜  kubectl get pods -o wide
NAME                            READY   STATUS    RESTARTS   AGE   IP           NODE           NOMINATED NODE   READINESS GATES
mysql                           1/1     Running   0          12m   10.42.0.11   controlplane   <none>           <none>
webapp-mysql-7cc9dcdffd-98cp2   1/1     Running   0          12m   10.42.0.12   controlplane   <none>           <none>
```

**Edit service "mysql-service" TargetPort from "8080" to "3306"**

```
controlplane ~ ➜  kubectl edit svc mysql-service
```

```
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: "2023-01-16T10:38:35Z"
  name: mysql-service
  namespace: beta
  resourceVersion: "1184"
  uid: be9c75ec-3e0c-4132-9eef-a9069618c6ac
spec:
  clusterIP: 10.43.5.176
  clusterIPs:
  - 10.43.5.176
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - port: 3306
    protocol: TCP
    targetPort: 3306
  selector:
    name: mysql
  sessionAffinity: None
  type: ClusterIP
status:
  loadBalancer: {}
```

**Check service**

```
controlplane ~ ➜  kubectl describe svc mysql-service 
Name:              mysql-service
Namespace:         beta
Labels:            <none>
Annotations:       <none>
Selector:          name=mysql
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.43.5.176
IPs:               10.43.5.176
Port:              <unset>  3306/TCP
TargetPort:        3306/TCP
Endpoints:         10.42.0.11:3306
Session Affinity:  None
Events:            <none>
```

**Browse web service**

```
controlplane ~ ➜  curl http://localhost:30081
<!doctype html>
<title>Hello from Flask</title>
<body style="background: #39b54b;"></body>
<div style="color: #e4e4e4;
    text-align:  center;
    height: 90px;
    vertical-align:  middle;">

  
    <!-- <h1> DATABASE CONNECTION SUCCESSFUL !<Browse web service/h1> -->
    <img src="/static/img/success.jpg">
  

  
    <h2> Environment Variables: DB_Host=mysql-service; DB_Database=Not Set; DB_User=root; DB_Password=paswrd;  </h2>
  

  
    <p> From webapp-mysql-7cc9dcdffd-98cp2!</p>
  

  

</div>
```

### Troubleshooting Test 3

3. **Troubleshooting Test 3:** The same 2 tier application is deployed in the `gamma` namespace. It must display a green web page on success. Click on the `App` tab at the top of your terminal to view your application. It is currently failed or unresponsive. Troubleshoot and fix the issue.

Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.

Check

- Fix Issue

**Set the default namespace to gamma**

```
controlplane ~ ➜  kubectl config set-context --current --namespace=gamma
Context "default" modified.
```

```
controlplane ~ ➜  kubectl get pods
NAME                            READY   STATUS    RESTARTS   AGE
mysql                           1/1     Running   0          8m41s
webapp-mysql-7cc9dcdffd-mt4tr   1/1     Running   0          8m41s

controlplane ~ ➜  kubectl get svc
NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
mysql-service   ClusterIP   10.43.158.242   <none>        3306/TCP         8m47s
web-service     NodePort    10.43.196.180   <none>        8080:30081/TCP   8m46s
```

**Check Endpoint of web-service**

```
controlplane ~ ➜  kubectl describe svc web-service 
Name:                     web-service
Namespace:                gamma
Labels:                   <none>
Annotations:              <none>
Selector:                 name=webapp-mysql
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.226.145
IPs:                      10.43.226.145
Port:                     <unset>  8080/TCP
TargetPort:               8080/TCP
NodePort:                 <unset>  30081/TCP
Endpoints:                10.42.0.14:8080
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>
```

```
controlplane ~ ➜  kubectl describe deployments webapp-mysql 
Name:                   webapp-mysql
Namespace:              gamma
CreationTimestamp:      Mon, 16 Jan 2023 13:20:07 +0000
Labels:                 name=webapp-mysql
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               name=webapp-mysql
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  name=webapp-mysql
  Containers:
   webapp-mysql:
    Image:      mmumshad/simple-webapp-mysql
    Port:       8080/TCP
    Host Port:  0/TCP
    Environment:
      DB_Host:      mysql-service
      DB_User:      root
      DB_Password:  paswrd
    Mounts:         <none>
  Volumes:          <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   webapp-mysql-7cc9dcdffd (1/1 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  5m51s  deployment-controller  Scaled up replica set webapp-mysql-7cc9dcdffd to 1

```

**Check Endpoint of mysql-service**

- no endpoints
- Selector name is wrong

```
controlplane ~ ➜  kubectl get svc
NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
mysql-service   ClusterIP   10.43.185.132   <none>        3306/TCP         9m24s
web-service     NodePort    10.43.226.145   <none>        8080:30081/TCP   9m24s

controlplane ~ ➜  kubectl describe svc mysql-service 
Name:              mysql-service
Namespace:         gamma
Labels:            <none>
Annotations:       <none>
Selector:          name=sql00001
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.43.185.132
IPs:               10.43.185.132
Port:              <unset>  3306/TCP
TargetPort:        3306/TCP
Endpoints:         <none>
Session Affinity:  None
Events:            <none>

controlplane ~ ➜  kubectl get pods
NAME                            READY   STATUS    RESTARTS   AGE
mysql                           1/1     Running   0          10m
webapp-mysql-7cc9dcdffd-lb5fc   1/1     Running   0          10m
```

Edit mysql-service

- Change the selector name to "mysql" from "sql00001"

```
controlplane ~ ➜  kubectl edit svc mysql-service 
```

```
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: "2023-01-16T13:20:07Z"
  name: mysql-service
  namespace: gamma
  resourceVersion: "870"
  uid: b596f25a-d8b6-4f2f-857c-07ab47c94fe8
spec:
  clusterIP: 10.43.185.132
  clusterIPs:
  - 10.43.185.132
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - port: 3306
    protocol: TCP
    targetPort: 3306
  selector:
    name: mysql
  sessionAffinity: None
  type: ClusterIP
status:
  loadBalancer: {}
```

```
controlplane ~ ➜  kubectl describe svc mysql-service 
Name:              mysql-service
Namespace:         gamma
Labels:            <none>
Annotations:       <none>
Selector:          name=mysql
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.43.185.132
IPs:               10.43.185.132
Port:              <unset>  3306/TCP
TargetPort:        3306/TCP
Endpoints:         10.42.0.13:3306
Session Affinity:  None
Events:            <none>
```

```
controlplane ~ ➜  curl http://localhost:30081
<!doctype html>
<title>Hello from Flask</title>
<body style="background: #39b54b;"></body>
<div style="color: #e4e4e4;
    text-align:  center;
    height: 90px;
    vertical-align:  middle;">

  
    <!-- <h1> DATABASE CONNECTION SUCCESSFUL !</h1> -->
    <img src="/static/img/success.jpg">
  

  
    <h2> Environment Variables: DB_Host=mysql-service; DB_Database=Not Set; DB_User=root; DB_Password=paswrd;  </h2>
  

  
    <p> From webapp-mysql-7cc9dcdffd-lb5fc!</p>
  

  

</div>
```



### Troubleshooting Test 4

4. **Troubleshooting Test 4:** The same 2 tier application is deployed in the `delta` namespace. It must display a green web page on success. Click on the `App` tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.

Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.

​	Check

- Fix Issue

![image-20230116214258460](images/image-20230116214258460.png)

```
controlplane ~ ➜  curl http://localhost:30081
<!doctype html>
<title>Hello from Flask</title>
<body style="background: #ff3f3f;"></body>
<div style="color: #e4e4e4;
    text-align:  center;
    height: 90px;
    vertical-align:  middle;">

  
    <img src="/static/img/failed.png">
    <!-- <h1> DATABASE CONNECTION FAILED !!</h1> -->
  

  
    <h2> Environment Variables: DB_Host=mysql-service; DB_Database=Not Set; DB_User=sql-user; DB_Password=paswrd; 1045 (28000): Access denied for user &#39;sql-user&#39;@&#39;10.42.0.16&#39; (using password: YES) </h2>
  

  
    <p> From webapp-mysql-78c8f7998b-qvf6d!</p>
  

  

</div>
```

**Set the default namespace to delta**

```
controlplane ~ ➜  kubectl config set-context --current --namespace delta
Context "default" modified.
```

```
controlplane ~ ➜  kubectl describe deployment webapp-mysql 
Name:                   webapp-mysql
Namespace:              delta
CreationTimestamp:      Mon, 16 Jan 2023 13:40:21 +0000
Labels:                 name=webapp-mysql
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               name=webapp-mysql
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  name=webapp-mysql
  Containers:
   webapp-mysql:
    Image:      mmumshad/simple-webapp-mysql
    Port:       8080/TCP
    Host Port:  0/TCP
    Environment:
      DB_Host:      mysql-service
      DB_User:      sql-user
      DB_Password:  paswrd
    Mounts:         <none>
  Volumes:          <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   webapp-mysql-78c8f7998b (1/1 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  11m   deployment-controller  Scaled up replica set webapp-mysql-78c8f7998b to 1
```

**Edit deployment webapp-mysql**

- Change DB_USER to "root" from "sql-user"

```
controlplane ~ ➜  kubectl edit deployment webapp-mysql 
```

```
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "1"
  creationTimestamp: "2023-01-16T13:40:21Z"
  generation: 1
  labels:
    name: webapp-mysql
  name: webapp-mysql
  namespace: delta
  resourceVersion: "1360"
  uid: 9f96c46d-757e-4e63-b4ac-dcfcb14a2dfd
spec:
  progressDeadlineSeconds: 600
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      name: webapp-mysql
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        name: webapp-mysql
      name: webapp-mysql
    spec:
      containers:
      - env:
        - name: DB_Host
          value: mysql-service
        - name: DB_User
          value: root
        - name: DB_Password
          value: paswrd
```



### Troubleshooting Test 5

5. **Troubleshooting Test 5:** The same 2 tier application is deployed in the `epsilon` namespace. It must display a green web page on success. Click on the `App` tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.

   Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.

   Check

   - Fix Issue
   - Fix Issue

   ![image-20230116215811963](images/image-20230116215811963.png)

   ```
   controlplane ~ ➜  curl http://localhost:30081
   <!doctype html>
   <title>Hello from Flask</title>
   <body style="background: #ff3f3f;"></body>
   <div style="color: #e4e4e4;
       text-align:  center;
       height: 90px;
       vertical-align:  middle;">
   
     
       <img src="/static/img/failed.png">
       <!-- <h1> DATABASE CONNECTION FAILED !!</h1> -->
     
   
     
       <h2> Environment Variables: DB_Host=mysql-service; DB_Database=Not Set; DB_User=sql-user; DB_Password=paswrd; 1045 (28000): Access denied for user &#39;sql-user&#39;@&#39;10.42.0.18&#39; (using password: YES) </h2>
     
   
     
       <p> From webapp-mysql-78c8f7998b-rgmjn!</p>
     
   
     
   
   </div>
   ```

   **Set the default namespace to epsilon**

   ```
   controlplane ~ ➜  kubectl config set-context --current --namespace epsilon
   Context "default" modified.
   ```

   ```
   controlplane ~ ➜  kubectl get pods
   NAME                            READY   STATUS    RESTARTS   AGE
   mysql                           1/1     Running   0          6m29s
   webapp-mysql-78c8f7998b-rgmjn   1/1     Running   0          6m29s
   
   controlplane ~ ➜  kubectl get deployments.apps 
   NAME           READY   UP-TO-DATE   AVAILABLE   AGE
   webapp-mysql   1/1     1            1           7m21s
   ```

   **Edit deployment "webapp-mysql"**

   - **Change DB_User from "sql-user" to "root"**

   ```
   controlplane ~ ➜  kubectl edit deployment webapp-mysql 
   ```

   ```
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     annotations:
       deployment.kubernetes.io/revision: "1"
     creationTimestamp: "2023-01-17T07:41:16Z"
     generation: 1
     labels:
       name: webapp-mysql
     name: webapp-mysql
     namespace: epsilon
     resourceVersion: "1041"
     uid: 13a4c834-62f2-4e76-b5ba-03c183df302c
   spec:
     progressDeadlineSeconds: 600
     replicas: 1
     revisionHistoryLimit: 10
     selector:
       matchLabels:
         name: webapp-mysql
     strategy:
       rollingUpdate:
         maxSurge: 25%
         maxUnavailable: 25%
       type: RollingUpdate
     template:
       metadata:
         creationTimestamp: null
         labels:
           name: webapp-mysql
         name: webapp-mysql
       spec:
         containers:
         - env:
           - name: DB_Host
             value: mysql-service
           - name: DB_User
             value: root
           - name: DB_Password
             value: paswrd
   ```

   **Check pod "mysql"**

   ```
   controlplane ~ ➜  kubectl describe pod mysql 
   Name:             mysql
   Namespace:        epsilon
   Priority:         0
   Service Account:  default
   Node:             controlplane/172.25.0.73
   Start Time:       Tue, 17 Jan 2023 07:41:16 +0000
   Labels:           name=mysql
   Annotations:      <none>
   Status:           Running
   IP:               10.42.0.17
   IPs:
     IP:  10.42.0.17
   Containers:
     mysql:
       Container ID:   containerd://5646fa321258503390bbe4500487bc03d99422065a9f7d41f37cab0ad7ae2791
       Image:          mysql:5.6
       Image ID:       docker.io/library/mysql@sha256:20575ecebe6216036d25dab5903808211f1e9ba63dc7825ac20cb975e34cfcae
       Port:           3306/TCP
       Host Port:      0/TCP
       State:          Running
         Started:      Tue, 17 Jan 2023 07:41:20 +0000
       Ready:          True
       Restart Count:  0
       Environment:
         MYSQL_ROOT_PASSWORD:  passwooooorrddd
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-zzthf (ro)
   ```

   **Edit pod "mysql"**

   - **Change Environment "MYSQL_ROOT_PASSWORD" from "passwooooorrddd" to "paswrd"**

   ```
   controlplane ~ ➜  kubectl edit pod mysql 
   ```

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     creationTimestamp: "2023-01-17T07:41:16Z"
     labels:
       name: mysql
     name: mysql
     namespace: epsilon
     resourceVersion: "1032"
     uid: 96e2da4a-70f5-4020-bab8-989c3fc232a7
   spec:
     containers:
     - env:
       - name: MYSQL_ROOT_PASSWORD
         value: paswrd
   ```

   ```
   controlplane ~ ✖ kubectl replace --force -f /tmp/kubectl-edit-1473806788.yaml
   pod "mysql" deleted
   pod/mysql replaced
   ```

   **Check web application**

   ```
   controlplane ~ ➜  curl http://localhost:30081
   <!doctype html>
   <title>Hello from Flask</title>
   <body style="background: #39b54b;"></body>
   <div style="color: #e4e4e4;
       text-align:  center;
       height: 90px;
       vertical-align:  middle;">
   
     
       <!-- <h1> DATABASE CONNECTION SUCCESSFUL !</h1> -->
       <img src="/static/img/success.jpg">
     
   
     
       <h2> Environment Variables: DB_Host=mysql-service; DB_Database=Not Set; DB_User=root; DB_Password=paswrd;  </h2>
     
   
     
       <p> From webapp-mysql-7cc9dcdffd-8fphn!</p>
     
   
     
   
   </div>
   ```

### Troubleshooting Test 6

6. **Troubleshooting Test 6:** The same 2 tier application is deployed in the `zeta` namespace. It must display a green web page on success. Click on the `App` tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.

   Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.

   CheckCompleteIncomplete

   - Fix Issue
   - Fix Issue
   - Fix Issue
   
   ![image-20230117160444272](images/image-20230117160444272.png)
   
   **Set the default namespace to epsilon**
   
   ```
   controlplane ~ ➜  kubectl config set-context --current --namespace zeta
   Context "default" modified.
   ```
   
   **Check web application**
   
   ```
   controlplane ~ ➜  curl http://localhost:30081
   curl: (7) Failed to connect to localhost port 30081 after 0 ms: Connection refused
   ```
   
   ```
   kubectl get svc
   NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
   mysql-service   ClusterIP   10.43.220.39    <none>        3306/TCP         4m53s
   web-service     NodePort    10.43.116.130   <none>        8080:30088/TCP   4m53s
   ```
   
   **Edit service "web-service"**
   
   - **Change nodePort from "30088" to "30081"**
   
   ```
   controlplane ~ ➜  kubectl edit svc web-service 
   ```
   
   ```
   apiVersion: v1
   kind: Service
   metadata:
     creationTimestamp: "2023-01-17T08:03:32Z"
     name: web-service
     namespace: zeta
     resourceVersion: "1108"
     uid: df787569-5a81-48ff-b7ef-9cd4b82f9e66
   spec:
     clusterIP: 10.43.116.130
     clusterIPs:
     - 10.43.116.130
     externalTrafficPolicy: Cluster
     internalTrafficPolicy: Cluster
     ipFamilies:
     - IPv4
     ipFamilyPolicy: SingleStack
     ports:
     - nodePort: 30088
       port: 8080
       protocol: TCP
       targetPort: 8080
     selector:
       name: webapp-mysql
     sessionAffinity: None
     type: NodePort
   status:
     loadBalancer: {}
   ```
   
   **Check web application**
   
   ```
   controlplane ~ ✖ curl http://localhost:30081
   <!doctype html>
   <title>Hello from Flask</title>
   <body style="background: #ff3f3f;"></body>
   <div style="color: #e4e4e4;
       text-align:  center;
       height: 90px;
       vertical-align:  middle;">
   
     
       <img src="/static/img/failed.png">
       <!-- <h1> DATABASE CONNECTION FAILED !!</h1> -->
     
   
     
       <h2> Environment Variables: DB_Host=mysql-service; DB_Database=Not Set; DB_User=sql-user; DB_Password=paswrd; 1045 (28000): Access denied for user &#39;sql-user&#39;@&#39;10.42.0.21&#39; (using password: YES) </h2>
     
   
     
       <p> From webapp-mysql-78c8f7998b-2qc5m!</p>
     
   
     
   
   </div>
   ```
   
   **Edit deployment "webapp-mysql"**
   
   - **Change DB_User from "sql-user" to "root"**
   
   ```
   controlplane ~ ➜  kubectl edit deployment webapp-mysql 
   ```
   
   ```
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     annotations:
       deployment.kubernetes.io/revision: "1"
     creationTimestamp: "2023-01-17T07:41:16Z"
     generation: 1
     labels:
       name: webapp-mysql
     name: webapp-mysql
     namespace: epsilon
     resourceVersion: "1041"
     uid: 13a4c834-62f2-4e76-b5ba-03c183df302c
   spec:
     progressDeadlineSeconds: 600
     replicas: 1
     revisionHistoryLimit: 10
     selector:
       matchLabels:
         name: webapp-mysql
     strategy:
       rollingUpdate:
         maxSurge: 25%
         maxUnavailable: 25%
       type: RollingUpdate
     template:
       metadata:
         creationTimestamp: null
         labels:
           name: webapp-mysql
         name: webapp-mysql
       spec:
         containers:
         - env:
           - name: DB_Host
             value: mysql-service
           - name: DB_User
             value: root
           - name: DB_Password
             value: paswrd
   ```
   
   **Check pod "mysql"**
   
   - **Change Environment "MYSQL_ROOT_PASSWORD" from "passwooooorrddd" to "paswrd"**
   
   ```
   controlplane ~ ➜  kubectl edit pod mysql 
   ```
   
   ```
   apiVersion: v1
   kind: Pod
   metadata:
     creationTimestamp: "2023-01-17T07:41:16Z"
     labels:
       name: mysql
     name: mysql
     namespace: epsilon
     resourceVersion: "1032"
     uid: 96e2da4a-70f5-4020-bab8-989c3fc232a7
   spec:
     containers:
     - env:
       - name: MYSQL_ROOT_PASSWORD
         value: paswrd
   ```
   
   ```
   controlplane ~ ✖ kubectl replace --force -f /tmp/kubectl-edit-1473806788.yaml
   pod "mysql" deleted
   pod/mysql replaced
   ```
   
   **Check web application**
   
   ```
   controlplane ~ ➜  curl http://localhost:30081
   <!doctype html>
   <title>Hello from Flask</title>
   <body style="background: #39b54b;"></body>
   <div style="color: #e4e4e4;
       text-align:  center;
       height: 90px;
       vertical-align:  middle;">
   
     
       <!-- <h1> DATABASE CONNECTION SUCCESSFUL !</h1> -->
       <img src="/static/img/success.jpg">
     
   
     
       <h2> Environment Variables: DB_Host=mysql-service; DB_Database=Not Set; DB_User=root; DB_Password=paswrd;  </h2>
     
   
     
       <p> From webapp-mysql-7cc9dcdffd-qchw6!</p>
     
   
     
   
   </div>
   ```



## PRACTICE TEST CONTROL PLANE FAILURE



1. The cluster is broken. We tried deploying an application but it's not working. Troubleshoot and fix the issue.

   Start looking at the deployments.

   Check

   - Fix the cluster

   ```
   controlplane ~ ➜  kubectl get nodes
   NAME           STATUS   ROLES           AGE     VERSION
   controlplane   Ready    control-plane   5m53s   v1.26.0
   ```

   ```
   controlplane ~ ➜  kubectl get deployments
   NAME   READY   UP-TO-DATE   AVAILABLE   AGE
   app    0/1     1            0           2m46s
   ```

   **Check the pod "app"**

   - **Status is "Pending" and it is not assigned to any node**
   - **Scheduler job is to assign pods to nodes**

   ```
   controlplane ~ ➜  kubectl describe pod app-865fdf7bbf-prbmc 
   Name:             app-865fdf7bbf-prbmc
   Namespace:        default
   Priority:         0
   Service Account:  default
   Node:             <none>
   Labels:           app=app
                     pod-template-hash=865fdf7bbf
   Annotations:      <none>
   Status:           Pending
   IP:               
   IPs:              <none>
   Controlled By:    ReplicaSet/app-865fdf7bbf
   Containers:
     nginx:
       Image:        nginx:alpine
       Port:         <none>
       Host Port:    <none>
       Environment:  <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-25vgq (ro)
   Volumes:
     kube-api-access-25vgq:
       Type:                    Projected (a volume that contains injected data from multiple sources)
       TokenExpirationSeconds:  3607
       ConfigMapName:           kube-root-ca.crt
       ConfigMapOptional:       <nil>
       DownwardAPI:             true
   QoS Class:                   BestEffort
   Node-Selectors:              <none>
   Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                                node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
   Events:                      <none>
   ```

   **Check scheduler status**

   ```
   controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS             RESTARTS        AGE
   coredns-787d4945fb-blk8g               1/1     Running            0               22m
   coredns-787d4945fb-z4gh6               1/1     Running            0               22m
   etcd-controlplane                      1/1     Running            0               23m
   kube-apiserver-controlplane            1/1     Running            0               23m
   kube-controller-manager-controlplane   1/1     Running            0               23m
   kube-proxy-m5ljc                       1/1     Running            0               22m
   kube-scheduler-controlplane            0/1     CrashLoopBackOff   8 (3m57s ago)   19m
   ```

   **Check the "events" and "commands part"**

   - The command is misspelled to "kube-schedulerrrr" 

   ```
   controlplane ~ ➜  kubectl describe -n kube-system pods kube-scheduler-controlplane 
   Name:                 kube-scheduler-controlplane
   Namespace:            kube-system
   Priority:             2000001000
   Priority Class Name:  system-node-critical
   Node:                 controlplane/10.35.231.6
   Start Time:           Tue, 17 Jan 2023 03:19:20 -0500
   Labels:               component=kube-scheduler
                         tier=control-plane
   Annotations:          kubernetes.io/config.hash: ba87dfc82718067f5aa1792d603e49fb
                         kubernetes.io/config.mirror: ba87dfc82718067f5aa1792d603e49fb
                         kubernetes.io/config.seen: 2023-01-17T03:22:13.408231849-05:00
                         kubernetes.io/config.source: file
   Status:               Running
   IP:                   10.35.231.6
   IPs:
     IP:           10.35.231.6
   Controlled By:  Node/controlplane
   Containers:
     kube-scheduler:
       Container ID:  containerd://00d75c769de7b53b0fb1f0ac82171245052e66e840c01db557414dc967e6968f
       Image:         registry.k8s.io/kube-scheduler:v1.26.0
       Image ID:      registry.k8s.io/kube-scheduler@sha256:34a142549f94312b41d4a6cd98e7fddabff484767a199333acb7503bf46d7410
       Port:          <none>
       Host Port:     <none>
       Command:
         kube-schedulerrrr
         --authentication-kubeconfig=/etc/kubernetes/scheduler.conf
         --authorization-kubeconfig=/etc/kubernetes/scheduler.conf
         --bind-address=127.0.0.1
         --kubeconfig=/etc/kubernetes/scheduler.conf
         --leader-elect=true
       State:          Waiting
         Reason:       CrashLoopBackOff
       Last State:     Terminated
         Reason:       StartError
         Message:      failed to create containerd task: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: exec: "kube-schedulerrrr": executable file not found in $PATH: unknown
         Exit Code:    128
         Started:      Wed, 31 Dec 1969 19:00:00 -0500
         Finished:     Tue, 17 Jan 2023 03:38:27 -0500
       Ready:          False
       Restart Count:  8
       Requests:
         cpu:        100m
       Liveness:     http-get https://127.0.0.1:10259/healthz delay=10s timeout=15s period=10s #success=1 #failure=8
       Startup:      http-get https://127.0.0.1:10259/healthz delay=10s timeout=15s period=10s #success=1 #failure=24
       Environment:  <none>
       Mounts:
         /etc/kubernetes/scheduler.conf from kubeconfig (ro)
   Conditions:
     Type              Status
     Initialized       True 
     Ready             False 
     ContainersReady   False 
     PodScheduled      True 
   Volumes:
     kubeconfig:
       Type:          HostPath (bare host directory volume)
       Path:          /etc/kubernetes/scheduler.conf
       HostPathType:  FileOrCreate
   QoS Class:         Burstable
   Node-Selectors:    <none>
   Tolerations:       :NoExecute op=Exists
   Events:
     Type     Reason   Age                  From     Message
     ----     ------   ----                 ----     -------
     Normal   Created  19m (x4 over 20m)    kubelet  Created container kube-scheduler
     Warning  Failed   19m (x4 over 20m)    kubelet  Error: failed to create containerd task: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: exec: "kube-schedulerrrr": executable file not found in $PATH: unknown
     Normal   Pulled   19m (x5 over 20m)    kubelet  Container image "registry.k8s.io/kube-scheduler:v1.26.0" already present on machine
     Warning  BackOff  40s (x106 over 20m)  kubelet  Back-off restarting failed container kube-scheduler in pod kube-scheduler-controlplane_kube-system(ba87dfc82718067f5aa1792d603e49fb)
   ```

   **Edit the kube-sheduler yaml manifest file**

   - edit the command from "kube-schedulerrrr" to  "kube-scheduler"

   ```
   controlplane ~ ➜  vi /etc/kubernetes/manifests/kube-scheduler.yaml 
   ```

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     creationTimestamp: null
     labels:
       component: kube-scheduler
       tier: control-plane
     name: kube-scheduler
     namespace: kube-system
   spec:
     containers:
     - command:
       - kube-scheduler
       - --authentication-kubeconfig=/etc/kubernetes/scheduler.conf
       - --authorization-kubeconfig=/etc/kubernetes/scheduler.conf
       - --bind-address=127.0.0.1
       - --kubeconfig=/etc/kubernetes/scheduler.conf
       - --leader-elect=true
       image: registry.k8s.io/kube-scheduler:v1.26.0
       imagePullPolicy: IfNotPresent
       livenessProbe:
         failureThreshold: 8
         httpGet:
           host: 127.0.0.1
           path: /healthz
           port: 10259
           scheme: HTTPS
         initialDelaySeconds: 10
         periodSeconds: 10
         timeoutSeconds: 15
       name: kube-scheduler
       resources:
         requests:
           cpu: 100m
       startupProbe:
         failureThreshold: 24
         httpGet:
           host: 127.0.0.1
           path: /healthz
           port: 10259
           scheme: HTTPS
         initialDelaySeconds: 10
         periodSeconds: 10
         timeoutSeconds: 15
       volumeMounts:
       - mountPath: /etc/kubernetes/scheduler.conf
         name: kubeconfig
         readOnly: true
     hostNetwork: true
     priorityClassName: system-node-critical
     securityContext:
       seccompProfile:
         type: RuntimeDefault
     volumes:
     - hostPath:
         path: /etc/kubernetes/scheduler.conf
         type: FileOrCreate
       name: kubeconfig
   status: {}
   ```

   **Check kube-scheduler pod status**

   ```
   controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS    RESTARTS   AGE
   coredns-787d4945fb-blk8g               1/1     Running   0          30m
   coredns-787d4945fb-z4gh6               1/1     Running   0          30m
   etcd-controlplane                      1/1     Running   0          30m
   kube-apiserver-controlplane            1/1     Running   0          30m
   kube-controller-manager-controlplane   1/1     Running   0          30m
   kube-proxy-m5ljc                       1/1     Running   0          30m
   kube-scheduler-controlplane            1/1     Running   0          85s
   ```

   ```
   controlplane ~ ➜  kubectl get pods 
   NAME                   READY   STATUS    RESTARTS   AGE
   app-865fdf7bbf-prbmc   1/1     Running   0          29m
   ```

2. Scale the deployment `app` to 2 pods.

   Check

   - Scale Deployment to 2 PODs

   ```
   controlplane ~ ➜  kubectl get deployment
   NAME   READY   UP-TO-DATE   AVAILABLE   AGE
   app    1/1     1            1           31m
   ```

   ```
   controlplane ~ ➜  kubectl scale deployment app --replicas=2
   deployment.apps/app scaled
   ```

3. Even though the deployment was scaled to 2, the number of `PODs` does not seem to increase. Investigate and fix the issue.

   Inspect the component responsible for managing `deployments` and `replicasets`.

   Check

   - Fix issue
   - Wait for deployment to actually scale

   Check the status of all control plane components and identify the component's pod which has an issue.

   ```
   controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS             RESTARTS      AGE
   coredns-787d4945fb-blk8g               1/1     Running            0             37m
   coredns-787d4945fb-z4gh6               1/1     Running            0             37m
   etcd-controlplane                      1/1     Running            0             37m
   kube-apiserver-controlplane            1/1     Running            0             37m
   kube-controller-manager-controlplane   0/1     CrashLoopBackOff   5 (57s ago)   4m21s
   kube-proxy-m5ljc                       1/1     Running            0             37m
   kube-scheduler-controlplane            1/1     Running            0             7m58s
   ```

   Check the logs of `kube-controller-manager` pod to know the failure reason

   ```
   controlplane ~ ➜  kubectl logs -n kube-system kube-controller-manager-controlplane 
   I0117 08:55:43.025320       1 serving.go:348] Generated self-signed cert in-memory
   E0117 08:55:43.025490       1 run.go:74] "command failed" err="stat /etc/kubernetes/controller-manager-XXXX.conf: no such file or directory"
   ```

   Check the kube-controller-manager configuration file

   - Edit "--kubeconfig=/etc/kubernetes/controller-manager-XXXX.conf" to ""--kubeconfig=/etc/kubernetes/controller-manager.conf"

   ```
   controlplane ~ ➜  vim /etc/kubernetes/manifests/kube-controller-manager.yaml 
   ```

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     creationTimestamp: null
     labels:
       component: kube-controller-manager
       tier: control-plane
     name: kube-controller-manager
     namespace: kube-system
   spec:
     containers:
     - command:
       - kube-controller-manager
       - --allocate-node-cidrs=true
       - --authentication-kubeconfig=/etc/kubernetes/controller-manager.conf
       - --authorization-kubeconfig=/etc/kubernetes/controller-manager.conf
       - --bind-address=127.0.0.1
       - --client-ca-file=/etc/kubernetes/pki/ca.crt
       - --cluster-cidr=10.244.0.0/16
       - --cluster-name=kubernetes
       - --cluster-signing-cert-file=/etc/kubernetes/pki/ca.crt
       - --cluster-signing-key-file=/etc/kubernetes/pki/ca.key
       - --controllers=*,bootstrapsigner,tokencleaner
       - --kubeconfig=/etc/kubernetes/controller-manager.conf
       - --leader-elect=true
       - --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt
       - --root-ca-file=/etc/kubernetes/pki/ca.crt
       - --service-account-private-key-file=/etc/kubernetes/pki/sa.key
       - --service-cluster-ip-range=10.96.0.0/12
       - --use-service-account-credentials=true
   ```

   ```
   controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS    RESTARTS   AGE
   coredns-787d4945fb-blk8g               1/1     Running   0          44m
   coredns-787d4945fb-z4gh6               1/1     Running   0          44m
   etcd-controlplane                      1/1     Running   0          44m
   kube-apiserver-controlplane            1/1     Running   0          44m
   kube-controller-manager-controlplane   1/1     Running   0          23s
   kube-proxy-m5ljc                       1/1     Running   0          44m
   kube-scheduler-controlplane            1/1     Running   0          15m
   ```

   Check the deployments

   ```
   controlplane ~ ➜  kubectl get deployments.apps 
   NAME   READY   UP-TO-DATE   AVAILABLE   AGE
   app    2/2     2            2           41m
   ```

4. Something is wrong with scaling again. We just tried scaling the deployment to 3 replicas. But it's not happening.

   Investigate and fix the issue.

   Check

   - Fix Issue
   - Wait for deployment to actually scale

   ```
   controlplane ~ ➜  kubectl get deployments.apps 
   NAME   READY   UP-TO-DATE   AVAILABLE   AGE
   app    2/3     2            2           44m
   ```

   Check the status of all control plane components and identify the component's pod which has an issue.

   ```
   controlplane ~ ➜  kubectl get pod -n kube-system 
   NAME                                   READY   STATUS             RESTARTS        AGE
   coredns-787d4945fb-blk8g               1/1     Running            0               51m
   coredns-787d4945fb-z4gh6               1/1     Running            0               51m
   etcd-controlplane                      1/1     Running            0               51m
   kube-apiserver-controlplane            1/1     Running            0               51m
   kube-controller-manager-controlplane   0/1     CrashLoopBackOff   5 (2m32s ago)   5m47s
   kube-proxy-m5ljc                       1/1     Running            0               51m
   kube-scheduler-controlplane            1/1     Running            0               22m
   ```

   Check the logs of `kube-controller-manager` pod to know the failure reason

   ```
   controlplane ~ ✖ kubectl logs -n kube-system kube-controller-manager-controlplane
   I0117 09:11:23.382065       1 serving.go:348] Generated self-signed cert in-memory
   E0117 09:11:23.909007       1 run.go:74] "command failed" err="unable to load client CA provider: open /etc/kubernetes/pki/ca.crt: no such file or directory"
   ```

   Inspect the pod manifest file, we can see that the incorrect hostPath is used for the volume:

   `WRONG`:

   ```yaml
   - hostPath:
         path: /etc/kubernetes/WRONG-PKI-DIRECTORY
         type: DirectoryOrCreate
   ```

   `CORRECT`:

   ```yaml
   - hostPath: 
       path: /etc/kubernetes/pki 
       type: DirectoryOrCreate 
   ```

   Edit kube-controller-manager manifest file

   ```
   controlplane ~ ➜  vim /etc/kubernetes/manifests/kube-controller-manager.yaml 
   ```

   ```
   controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS    RESTARTS   AGE
   coredns-787d4945fb-blk8g               1/1     Running   0          58m
   coredns-787d4945fb-z4gh6               1/1     Running   0          58m
   etcd-controlplane                      1/1     Running   0          58m
   kube-apiserver-controlplane            1/1     Running   0          58m
   kube-controller-manager-controlplane   1/1     Running   0          43s
   kube-proxy-m5ljc                       1/1     Running   0          58m
   kube-scheduler-controlplane            1/1     Running   0          29m
   ```

   ```
   controlplane ~ ➜  kubectl get deployments.apps 
   NAME   READY   UP-TO-DATE   AVAILABLE   AGE
   app    3/3     3            3           55m
   ```



## PRACTICE TEST WORKER NODE FAILURE

1. Fix the broken cluster

   Check

   - Fix node01

   **Step1:** Check the status of the nodes:

   ```sh
   controlplane ~ ➜  kubectl get nodes
   NAME           STATUS     ROLES           AGE   VERSION
   controlplane   Ready      control-plane   12m   v1.26.0
   node01         NotReady   <none>          11m   v1.26.0
   ```

   **Step 2:** SSH to `node01` and check the status of the `kubelet` service.

   ```sh
   root@node01 ~ ➜  systemctl status kubelet.service 
   ● kubelet.service - kubelet: The Kubernetes Node Agent
        Loaded: loaded (/lib/systemd/system/kubelet.service; enabled; vendor preset: enabled)
       Drop-In: /etc/systemd/system/kubelet.service.d
                └─10-kubeadm.conf
        Active: inactive (dead) since Tue 2023-01-17 04:54:20 EST; 7min ago
          Docs: https://kubernetes.io/docs/home/
       Process: 2048 ExecStart=/usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_CONFIG_ARGS $KUBEL>
      Main PID: 2048 (code=exited, status=0/SUCCESS)
   
   Jan 17 04:46:54 node01 kubelet[2048]: I0117 04:46:54.027920    2048 reconciler_common.go:253] "op>
   Jan 17 04:46:54 node01 kubelet[2048]: I0117 04:46:54.027958    2048 reconciler.go:41] "Reconciler>
   Jan 17 04:46:55 node01 kubelet[2048]: I0117 04:46:55.208930    2048 request.go:682] Waited for 1.>
   Jan 17 04:46:56 node01 kubelet[2048]: E0117 04:46:56.536426    2048 gcpcredential.go:74] while re>
   Jan 17 04:46:59 node01 kubelet[2048]: I0117 04:46:59.556949    2048 pod_startup_latency_tracker.g>
   Jan 17 04:47:02 node01 kubelet[2048]: I0117 04:47:02.855807    2048 transport.go:135] "Certificat>
   Jan 17 04:47:03 node01 kubelet[2048]: I0117 04:47:03.218478    2048 kubelet_node_status.go:493] ">
   Jan 17 04:47:04 node01 kubelet[2048]: E0117 04:47:04.441334    2048 cadvisor_stats_provider.go:44>
   Jan 17 04:47:04 node01 kubelet[2048]: I0117 04:47:04.936550    2048 pod_startup_latency_tracker.g>
   Jan 17 04:54:20 node01 kubelet[2048]: I0117 04:54:20.287375    2048 dynamic_cafile_content.go:171>
   ```

   Since the `kubelet` is not running, attempt to start it by running the following command:

   ```sh
   root@node01 ~ ✖ systemctl start kubelet.service 
   
   root@node01 ~ ➜  systemctl status kubelet.service 
   ● kubelet.service - kubelet: The Kubernetes Node Agent
        Loaded: loaded (/lib/systemd/system/kubelet.service; enabled; vendor preset: enabled)
       Drop-In: /etc/systemd/system/kubelet.service.d
                └─10-kubeadm.conf
        Active: active (running) since Tue 2023-01-17 05:03:26 EST; 8s ago
          Docs: https://kubernetes.io/docs/home/
      Main PID: 5449 (kubelet)
         Tasks: 24 (limit: 541680)
        Memory: 43.7M
        CGroup: /system.slice/kubelet.service
                └─5449 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.con>
   ```

   `node01` should go back to ready state now.

   ```
   controlplane ~ ✖ kubectl get nodes
   NAME           STATUS   ROLES           AGE   VERSION
   controlplane   Ready    control-plane   18m   v1.26.0
   node01         Ready    <none>          17m   v1.26.0
   ```

2. The cluster is broken again. Investigate and fix the issue.

   Check

   - Fix cluster

   ```
   controlplane ~ ➜  kubectl get nodes
   NAME           STATUS     ROLES           AGE   VERSION
   controlplane   Ready      control-plane   20m   v1.26.0
   node01         NotReady   <none>          20m   v1.26.0
   ```

   ```
   controlplane ~ ➜  ssh node01
   Last login: Tue Jan 17 05:01:25 2023 from 10.42.184.12
   
   root@node01 ~ ➜  systemctl status kubelet.service 
   ● kubelet.service - kubelet: The Kubernetes Node Agent
        Loaded: loaded (/lib/systemd/system/kubelet.service; enabled; vendor preset: enabled)
       Drop-In: /etc/systemd/system/kubelet.service.d
                └─10-kubeadm.conf
        Active: activating (auto-restart) (Result: exit-code) since Tue 2023-01-17 05:09:53 EST; 8s >
          Docs: https://kubernetes.io/docs/home/
       Process: 7230 ExecStart=/usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_CONFIG_ARGS $KUBEL>
      Main PID: 7230 (code=exited, status=1/FAILURE)
   lines 1-8/8 (END)
   ```

   

   `kubelet` has stopped running on `node01` again. Since this is a systemd managed system, we can check the `kubelet` log by running `journalctl` command. Here is a snippet showing the error with `kubelet`:

   ```sh
   root@node01 ~ ➜  journalctl -u kubelet
   -- Logs begin at Tue 2023-01-17 04:45:57 EST, end at Tue 2023-01-17 05:10:44 EST. --
   Jan 17 04:45:59 node01 kubelet[969]: E0117 04:45:59.832554     969 run.go:74] "command failed" err="failed to validate kubelet flags: the c>
   ...
   Jan 17 05:05:25 node01 kubelet[6046]: E0117 05:05:25.257368    6046 run.go:74] "command failed" err="failed to construct kubelet dependencies: unable to load client CA file /etc/kubernetes/pki/WRONG-CA-FILE.crt: open /etc>
   
   ```

   There appears to be a mistake path used for the CA certificate in the `kubelet` configuration. This can be corrected by updating the file `/var/lib/kubelet/config.yaml`.

   Once this is fixed, restart the `kubelet` service, (like we did in the previous question) and `node01` should return back to a working state.

   ```
   root@node01 ~ ➜  vim /var/lib/kubelet/config.yaml 
   ```

   ```
   apiVersion: kubelet.config.k8s.io/v1beta1
   authentication:
     anonymous:
       enabled: false
     webhook:
       cacheTTL: 0s
       enabled: true
     x509:
       clientCAFile: /etc/kubernetes/pki/ca.crt
   ```

   ```
   root@node01 ~ ➜  systemctl status kubelet.service 
   ● kubelet.service - kubelet: The Kubernetes Node Agent
        Loaded: loaded (/lib/systemd/system/kubelet.service; enabled; vendor preset: enabled)
       Drop-In: /etc/systemd/system/kubelet.service.d
                └─10-kubeadm.conf
        Active: active (running) since Tue 2023-01-17 05:24:12 EST; 21s ago
          Docs: https://kubernetes.io/docs/home/
      Main PID: 10832 (kubelet)
         Tasks: 25 (limit: 541680)
        Memory: 44.8M
        CGroup: /system.slice/kubelet.service
                └─10832 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubern>
   ```

   ```
   controlplane ~ ✖ kubectl get nodes
   NAME           STATUS   ROLES           AGE   VERSION
   controlplane   Ready    control-plane   38m   v1.26.0
   node01         Ready    <none>          38m   v1.26.0
   ```

3. The cluster is broken again. Investigate and fix the issue.

   Check

   - Fix Cluster

     

   ```
   controlplane ~ ➜  kubectl get nodes
   NAME           STATUS     ROLES           AGE   VERSION
   controlplane   Ready      control-plane   41m   v1.26.0
   node01         NotReady   <none>          40m   v1.26.0
   ```

   Once again the `kubelet` service has stopped working. Checking the logs, we can see that this time, it is not able to reach the `kube-apiserver`.

   ```
   root@node01 ~ ➜  systemctl status kubelet.service 
   ● kubelet.service - kubelet: The Kubernetes Node Agent
        Loaded: loaded (/lib/systemd/system/kubelet.service; enabled; vendor preset: enabled)
       Drop-In: /etc/systemd/system/kubelet.service.d
                └─10-kubeadm.conf
        Active: active (running) since Tue 2023-01-17 05:25:48 EST; 5min ago
          Docs: https://kubernetes.io/docs/home/
      Main PID: 11337 (kubelet)
         Tasks: 37 (limit: 541680)
        Memory: 59.9M
        CGroup: /system.slice/kubelet.service
                └─11337 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubern>
   ```

   Check the logs of kubelet

   ```sh
   root@node01:~# journalctl -u kubelet 
   .
   .
   .
   Jan 17 05:42:01 node01 kubelet[11337]: E0117 05:42:01.676726   11337 reflector.go:140] vendor/k8s.io/client-go/informers/factory.go:150: Failed to watch *v1.Node: failed to list *v1.Node: Get "https://controlplane:6553/api/v1/nodes?fieldSelector=metadata.name%3Dnode01&limit=500&resourceVersion=0": dial tcp 10.42.184.12:6553: connect: connection refused
   .
   .
   .
   ```

   As we can clearly see, `kubelet` is trying to connect to the API server on the `controlplane` node on port `6553`. This is incorrect. To fix, correct the port on the `kubeconfig` file used by the `kubelet`. 

   Chage port to 6443

   ```
   root@node01 ~ ➜  vi /etc/kubernetes/kubelet.conf 
   ```

   ```sh
   apiVersion: v1
   clusters:
   - cluster:
       certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJek1ERXhOekE1TkRVME9Gb1hEVE16TURFeE5EQTVORFUwT0Zvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTnl0Ck4rTmQvcmVBR1hsMDYyM3FkNndhZnkvMEQwVXZGeXU5endvM1dlaC8rMC9Nd2R2VGsycVFLMW5DVmpzV2RYTjcKbk01U3ltZ1FKeG8zU2t6VW9CSW0wb3IxemlCMzF1VzlCVThEZ3RBbVNmZFFzUHBTblo1cFA1cmc4amFXMzU0LwplR2tXaWg2OFpXeDF6QmtlVFlqYW52K1BhUUlRZkhRSWhacnB2ZU00dTFkUWREN1dFMlFXU3NnZCtiMHJidmJYClZva2xjY1I1ODFQelVTVFBid0ZjZkc5QjFMOERwV3pEWE5CemtYSmdkQlJ6R1JkYjh0Q3BuclBKemgrRFduWXMKYUZXMEJTWE1lVEloaTRGcDNUZUp4cDhEUTNFSFJXdm9yRityMHF0KzR1QWpVUEw5OCs1K0EvZWVlc3k1NmJwVwpCdWF0cEtmSUlVMXROaThGWmZNQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZJcnZYQkhaZW15YjdSMC9PSmZNRHY5T2xXRGhNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBR1Zud0lIeDZJZlpHSHlNT1Q1egp1c2p3UGUwTU92aDVESXBiZFF1M1dJNlhiZVhWSXcvSS9VbXB1R0R0VVl6RlpiNnhIbEF2bTh6c1ZoSHNlOC82CmFlOXYrMDdxMElWMGxTNEdQRGhRZDk3aC9ZVk1LcXVLeGI3aEUzSHFNWTRLQjNBZXZCazd3bGlnZTdoTUk4c24KOWRIaThsc1o5NHN5blRWTWtTUE5TVTRLa29ocXlaVE1WUi9HRWNOc1NxWCtwUjgvMVFpTEhrL2M3eVI5Ykl4QgpEQTRKVVJON21oeWVVakRrWEZGVm50eGVqMVNuUnlEckkwMjJsOXozQ2VseEpZUmxiSFJWUExhREE5WXIrbFZHCkI3VU13K21nRG5GaWpSMWUrVVVib05ITFNXUjRXMWJUQnEzdjNyVlQwMVd0dXlVQVl3NEpVdDdQUFZ5N2c1QlYKYS9vPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
       server: https://controlplane:6443
   ```

   Restart the `kubelet` service after this change.

   ```sh
   root@node01 ~ ➜  systemctl restart kubelet.service 
   ```

   ```\
   controlplane ~ ✖ kubectl get nodes
   NAME           STATUS   ROLES           AGE   VERSION
   controlplane   Ready    control-plane   60m   v1.26.0
   node01         Ready    <none>          60m   v1.26.0
   ```



## PRACTICE TEST – TROUBLESHOOT NETWORK

1. `**Troubleshooting Test 1:**` A simple 2 tier application is deployed in the `triton` namespace. It must display a green web page on success. Click on the app tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.

   Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.

   Check

   - DB Service working?
   - WebApp Service working?

   ![image-20230117195740131](images/image-20230117195740131.png)

   **Set the default namespace to triton**

   ```
   root@controlplane ~ ➜  kubectl config set-context --current --namespace=triton
   Context "kubernetes-admin@kubernetes" modified.
   ```

   ```
   root@controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS    RESTARTS   AGE
   coredns-787d4945fb-dnvsw               1/1     Running   0          72m
   coredns-787d4945fb-hnnzv               1/1     Running   0          72m
   etcd-controlplane                      1/1     Running   0          73m
   kube-apiserver-controlplane            1/1     Running   0          73m
   kube-controller-manager-controlplane   1/1     Running   0          73m
   kube-proxy-r89d4                       1/1     Running   0          72m
   kube-scheduler-controlplane            1/1     Running   0          73m
   ```

   

   Do the services in `triton` namespace have a valid endpoint? If they do, check the `kube-proxy` and the `weave` logs.
   Does the cluster have a Network Addon installed?

   Install Weave using the link: `https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/#pod-network`

   For example: `curl -L https://github.com/weaveworks/weave/releases/download/latest_release/weave-daemonset-k8s-1.11.yaml | kubectl apply -f -`

   ```
   root@controlplane ~ ➜  wget https://github.com/weaveworks/weave/releases/download/latest_release/weave-daemonset-k8s-1.11.yaml
   ```

   ```
   root@controlplane ~ ➜  kubectl apply -f weave-daemonset-k8s-1.11.yaml 
   serviceaccount/weave-net created
   clusterrole.rbac.authorization.k8s.io/weave-net created
   clusterrolebinding.rbac.authorization.k8s.io/weave-net created
   role.rbac.authorization.k8s.io/weave-net created
   rolebinding.rbac.authorization.k8s.io/weave-net created
   daemonset.apps/weave-net created
   ```

   ```
   root@controlplane ~ ➜  kubectl get pods -n kube-system NAME                                   READY   STATUS    RESTARTS   AGE
   coredns-787d4945fb-dnvsw               1/1     Running   0          80m
   coredns-787d4945fb-hnnzv               1/1     Running   0          80m
   etcd-controlplane                      1/1     Running   0          80m
   kube-apiserver-controlplane            1/1     Running   0          80m
   kube-controller-manager-controlplane   1/1     Running   0          80m
   kube-proxy-r89d4                       1/1     Running   0          80m
   kube-scheduler-controlplane            1/1     Running   0          80m
   weave-net-tgvbw                        2/2     Running   0          20s
   ```

   ```
   root@controlplane ~ ➜  kubectl get pods -o wideNAME                            READY   STATUS    RESTARTS   AGE   IP          NODE           NOMINATED NODE   READINESS GATES
   mysql                           1/1     Running   0          20m   10.32.0.2   controlplane   <none>           <none>
   webapp-mysql-74fc8f4448-tzklj   1/1     Running   0          20m   10.32.0.3   controlplane   <none>           <none>
   
   root@controlplane ~ ➜  kubectl get svc
   NAME          TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
   mysql         ClusterIP   10.109.53.116    <none>        3306/TCP         20m
   web-service   NodePort    10.105.194.170   <none>        8080:30081/TCP   20m
   
   root@controlplane ~ ➜  kubectl describe svc web-service 
   Name:                     web-service
   Namespace:                triton
   Labels:                   <none>
   Annotations:              <none>
   Selector:                 name=webapp-mysql
   Type:                     NodePort
   IP Family Policy:         SingleStack
   IP Families:              IPv4
   IP:                       10.105.194.170
   IPs:                      10.105.194.170
   Port:                     <unset>  8080/TCP
   TargetPort:               8080/TCP
   NodePort:                 <unset>  30081/TCP
   Endpoints:                10.32.0.3:8080
   Session Affinity:         None
   External Traffic Policy:  Cluster
   Events:                   <none>
   ```

2. `**Troubleshooting Test 2:**` The same 2 tier application is having issues again. It must display a green web page on success. Click on the app tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.

   Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.

   Check

   - Fixed Issue?

   The `kube-proxy` pod is not running. As a result the rules needed to allow connectivity to the services have not been created.

   Check the logs of the `kube-proxy` pod as follows: -

   ```
   root@controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS             RESTARTS      AGE
   coredns-787d4945fb-dnvsw               1/1     Running            0             87m
   coredns-787d4945fb-hnnzv               1/1     Running            0             87m
   etcd-controlplane                      1/1     Running            0             87m
   kube-apiserver-controlplane            1/1     Running            0             88m
   kube-controller-manager-controlplane   1/1     Running            0             87m
   kube-proxy-p7bf6                       0/1     CrashLoopBackOff   4 (34s ago)   2m12s
   kube-scheduler-controlplane            1/1     Running            0             88m
   weave-net-tgvbw                        2/2     Running            0             7m36s
   ```

   ```sh
   root@controlplane ~ ➜  kubectl logs -n kube-system kube-proxy-p7bf6 
   E0117 12:21:39.228283       1 run.go:74] "command failed" err="failed complete: open /var/lib/kube-proxy/configuration.conf: no such file or directory"
   ```

   

   The configuration file `/var/lib/kube-proxy/configuration.conf` is not valid. The configuration path does not match the data in the ConfigMap.

   `kubectl -n kube-system describe configmap kube-proxy` shows that the file name used is `config.conf` which is mounted in the `kube-proxy` **daemonset pod** at the path `/var/lib/kube-proxy/config.conf`.
   However in the DaemonSet, for kube-proxy, the command used to start the `kube-proxy` pod makes use of the path `/var/lib/kube-proxy/configuration.conf`.

   Correct this path to `/var/lib/kube-proxy/config.conf` as per the ConfigMap and recreate the `kube-proxy` pod.

   Here is the snippet of the correct command to be run by the `kube-proxy` pod:

   ```
   root@controlplane ~ ➜  kubectl edit daemonsets.apps -n kube-system kube-proxy 
   daemonset.apps/kube-proxy edited
   ```

   ```yaml
   spec:
       containers:
       - command:
           - /usr/local/bin/kube-proxy
           - --config=/var/lib/kube-proxy/config.conf
           - --hostname-override=$(NODE_NAME)
   ```

   This should get the `kube-proxy` pod back in a running state.

   ```
   root@controlplane ~ ➜  kubectl get pods -n kube-system 
   NAME                                   READY   STATUS    RESTARTS   AGE
   coredns-787d4945fb-dnvsw               1/1     Running   0          114m
   coredns-787d4945fb-hnnzv               1/1     Running   0          114m
   etcd-controlplane                      1/1     Running   0          114m
   kube-apiserver-controlplane            1/1     Running   0          114m
   kube-controller-manager-controlplane   1/1     Running   0          114m
   kube-proxy-mtdpb                       1/1     Running   0          5s
   kube-scheduler-controlplane            1/1     Running   0          114m
   weave-net-tgvbw                        2/2     Running   0          34m
   ```

   You can list the config file within a `kube-proxy` pod as follows: -

   ```sh
   kubectl exec -n kube-system -it kube-proxy-hb7n9 -- ls  /var/lib/kube-proxy/
   ```

   > Note: - In your lab, the kube-proxy pod name could be different.
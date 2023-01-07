# CKA Lab



# CORE CONCEPTS, PRACTICE TEST – PODS

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



# CORE CONCEPTS, PRACTICE TEST – REPLICASETS

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



# CORE CONCEPTS, PRACTICE TESTS – DEPLOYMENTS



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



# CORE CONCEPTS, PRACTICE TEST NAMESPACES

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



# SCHEDULING, PRACTICE TEST MANUAL SCHEDULING



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



# SCHEDULING, PRACTICE TEST LABELS AND SELECTORS



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



# SCHEDULING, PRACTICE TEST – TAINTS AND TOLERATIONS

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
    



# SCHEDULING, PRACTICE TEST – NODE AFFINITY



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

   

# SCHEDULING, PRACTICE TEST RESOURCE LIMITS



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



# SCHEDULING, PRACTICE TEST DAEMONSETS

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



# SCHEDULING, PRACTICE TEST – STATIC PODS



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



# SCHEDULING, PRACTICE TEST MULTIPLE SCHEDULERS



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



# LOGGING & MONITORING, PRACTICE TEST MONITOR CLUSTER COMPONENTS



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




# LOGGING & MONITORING, PRACTICE TEST MANAGING APPLICATION LOGS

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



# APPLICATION LIFECYCLE MANAGEMENT, PRACTICE TEST ROLLING UPDATES AND ROLLBACKS



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



# APPLICATION LIFECYCLE MANAGEMENT, PRACTICE TEST COMMANDS AND ARGUMENTS

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

   

# APPLICATION LIFECYCLE MANAGEMENT, PRACTICE TEST ENV VARIABLES

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



<<<<<<< HEAD
=======
# APPLICATION LIFECYCLE MANAGEMENT, PRACTICE TEST SECRETS

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



# APPLICATION LIFECYCLE MANAGEMENT, PRACTICE TEST – MULTI CONTAINER PODS

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



# APPLICATION LIFECYCLE MANAGEMENT, PRACTICE TEST – INIT CONTAINERS

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



# CLUSTER MAINTENANCE, PRACTICE TEST OS UPGRADES

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



# CLUSTER MAINTENANCE, PRACTICE TEST CLUSTER UPGRADE PROCESS

>>>>>>> 7ac0df6d02fce4e649b474018c13645d24bec86c

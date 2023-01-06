# CKAD Lab

# CORE CONCEPTS, PRACTICE TEST – KUBERNETES – CKAD



1. How many `pods` exist on the system?

   In the current(default) namespace.

   - 5
   - 2
   - 3
   - 1
   - 4
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

    - 
      Name: redis
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




# CORE CONCEPTS, PRACTICE TEST – KUBERNETES – CKAD – REPLICASETS



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



# CORE CONCEPTS, PRACTICE TEST – KUBERNETES – CKAD – DEPLOYMENTS

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



# CORE CONCEPTS, PRACTICE TEST – KUBERNETES – CKAD – NAMESPACES

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

   
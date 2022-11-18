# CKAD Lab

## CORE CONCEPTS, PRACTICE TEST – KUBERNETES – CKAD



1. How many pods?

   ```
   kubectl get pods
   ```

   ASWER: 0

2. Create a new pod with the `nginx` image.

   ```
   kubectl run nginx --image nginx
   
   kubectl get pods
   NAME    READY   STATUS    RESTARTS   AGE
   nginx   1/1     Running   0          61s
   ```

3. How many pods are created now?

   ANSWER: 4

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

   ANSWER: busybox

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

   ANSWER: controlplane

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

   ANSWER: 2

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

   ANSWER:  nginx & agentx

   ```
   kubectl describe pod webapp 
   ```

8. What is the state of the container `agentx` in the pod `webapp`?

   Wait for it to finish the `ContainerCreating` state

   ANSWER: Error OR Waiting

   ```
   kubectl describe pod webapp 
   ```

9. Why do you think the container `agentx` in pod `webapp` is in error?

   Try to figure it out from the events section of the pod.

   Answer: Docker image is not found in the Docker Hub.

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
    
    



​      

​      
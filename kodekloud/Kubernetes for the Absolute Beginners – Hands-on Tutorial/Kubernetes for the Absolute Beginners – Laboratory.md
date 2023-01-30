# Kubernetes for the Absolute Beginners – Hands-on Tutorial



# KUBERNETES CONCEPTS – PODS, REPLICASETS, DEPLOYMENTS, LABS: PODS WITH YAML

1. How many PODs exist on the system?

   In the current(default) namespace.

   - 2
   - **0**
   - 4
   - 1
   - 3

   ```
   kubectl get pods
   No resources found in default namespace.
   ```

   

2. How many ReplicaSets exist on the system?

   In the current(default) namespace.

   - 1
   - 4
   - **0**
   - 2
   - 3

   ```
   kubectl get replicasets
   No resources found in default namespace.
   ```

   

3. How about now? How many ReplicaSets do you see?

   We just made a few changes!

   - 3
   - 2
   - 4
   - **1**
   - 0

   ```
   kubectl get replicasets
   NAME              DESIRED   CURRENT   READY   AGE
   new-replica-set   4         4         0       31s
   ```

4. How many PODs are DESIRED in the `new-replica-set`?

   - 0
   - 2
   - 1
   - **4**
   - 5

   ```
    kubectl get rs
   NAME              DESIRED   CURRENT   READY   AGE
   new-replica-set   4         4         0       88s
   ```

5. What is the image used to create the pods in the `new-replica-set`?

   - NEWPOD
   - BUSYBOX-POD
   - BUSYBOX-CONTAINER
   - NGINX
   - **BUSYBOX777**

   ```
   ➜  kubectl describe rs new-replica-set 
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
   Events:
     Type    Reason            Age    From                   Message
     ----    ------            ----   ----                   -------
     Normal  SuccessfulCreate  2m53s  replicaset-controller  Created pod: new-replica-set-k6pjv
     Normal  SuccessfulCreate  2m53s  replicaset-controller  Created pod: new-replica-set-nz5br
     Normal  SuccessfulCreate  2m53s  replicaset-controller  Created pod: new-replica-set-p7zrq
     Normal  SuccessfulCreate  2m53s  replicaset-controller  Created pod: new-replica-set-j87sf
   ```

6. How many PODs are READY in the `new-replica-set`?

   - **0**
   - 1
   - 4
   - 5
   - 2

   ```
   ➜  kubectl get rs
   NAME              DESIRED   CURRENT   READY   AGE
   new-replica-set   4         4         0       4m10s
   ```

7. Why do you think the PODs are not ready?

   - Kubernetes is faulty
   - **The image BUSYBOX777 doesn't exist**
   - Replicaset was not created correctly
   - Application has errors

8. Delete any one of the 4 PODs.

   Done

   ```
   kubectl delete pod new-replica-set-j87sf 
   pod "new-replica-set-j87sf" deleted
   ```

9. How many PODs exist now?

   - 1
   - 0
   - 3
   - 5
   - **4**
   - 2

   ```
   kubectl get pods
   NAME                    READY   STATUS             RESTARTS   AGE
   new-replica-set-p7zrq   0/1     ImagePullBackOff   0          8m25s
   new-replica-set-k6pjv   0/1     ImagePullBackOff   0          8m25s
   new-replica-set-nz5br   0/1     ImagePullBackOff   0          8m25s
   new-replica-set-wfk7b   0/1     ImagePullBackOff   0          53s
   ```

10. Why are there still 4 PODs, even after you deleted one?

    - You cannot delete a POD from a ReplicaSet
    - **ReplicaSet ensures that desired number of PODs always run**
    - I didn't delete it properly

11. Create a ReplicaSet using the `replicaset-definition-1.yaml` file located at `/root/`.

    There is an issue with the file, so try to fix it.

    Check

    - Name: replicaset-1

    

    Run the command: 

    ```
    kubectl create -f replicaset-definition-1.yaml 
    error: resource mapping not found for name: "replicaset-1" namespace: "" from "replicaset-definition-1.yaml": no matches for kind "ReplicaSet" in version "v1"
    ensure CRDs are installed first
    ```

    Run the command to get the correct apiversion for Replicaset

    ```
     ➜  kubectl explain replicaset | grep VERSION
    VERSION:  apps/v1
    ```

    replicaset-definition-1.yaml

    ```
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

    Then run the command: 

    ````
    kubectl create -f /root/replicaset-definition-1.yaml
    ````

12. Fix the issue in the `replicaset-definition-2.yaml` file and create a `ReplicaSet` using it.

    This file is located at `/root/`.

    Check

    - Name: replicaset-2

    ```
    ➜  kubectl create -f replicaset-definition-2.yaml 
    The ReplicaSet "replicaset-2" is invalid: spec.template.metadata.labels: Invalid value: map[string]string{"tier":"nginx"}: `selector` does not match template `labels`
    ```

    replicaset-definition-2.yaml

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
    ```

13. Delete the two newly created ReplicaSets - `replicaset-1` and `replicaset-2`

    Check

    - Delete: replicaset-2
    - Delete: replicaset-1

    ```
    kubectl delete rs replicaset-1 replicaset-2 
    ```

14. Fix the original replica set `new-replica-set` to use the correct `busybox` image.

    Either delete and recreate the ReplicaSet or Update the existing ReplicaSet and then delete all PODs, so new ones with the correct image will be created.

    Check

    - Replicas: 4

    

    Run the command: `kubectl edit replicaset new-replica-set`, modify the image name and then save the file.
    Delete the previous pods to get the new ones with the correct image.
    For this, run the command: `kubectl delete po <pod-name>`

​    

15. Scale the ReplicaSet to 5 PODs.

    Use `kubectl scale` command or edit the replicaset using `kubectl edit replicaset`.

    Check

    - Replicas: 5

    

    Run the command: `kubectl edit replicaset new-replica-set`, modify the `replicas` and then save the file 

    OR 

    Run: `kubectl scale rs new-replica-set --replicas=5` to scale up to 5 PODs.

​    

16. Now scale the ReplicaSet down to 2 PODs.

    Use the `kubectl scale` command or edit the replicaset using `kubectl edit replicaset`.

    Check

    - Replicas: 2

    

    Run the command: `kubectl edit replicaset new-replica-set`, modify the `replicas` and then save the file 

    

    OR 

    

    Run: `kubectl scale rs new-replica-set --replicas=2` to scale down to 2 PODs.

   

# KUBERNETES CONCEPTS – PODS, REPLICASETS, DEPLOYMENTS, LABS: DEPLOYMENTS

1. How many PODs exist on the system?

   In the current(default) namespace.

   - 3
   - 1
   - 4
   - **0**
   - 2

   ```
   kubectl get pods
   No resources found in default namespace.
   ```

2. How many ReplicaSets exist on the system?

   In the current(default) namespace.

   - 2
   - 3
   - 1
   - **0**
   - 4

   ```
   kubectl get replicasets
   No resources found in default namespace.
   ```

3. How many Deployments exist on the system?

   In the current(default) namespace.

   - 1
   - 3
   - 2
   - **0**
   - 4

   ```
   kubectl get deployment 
   
   or 
   
   kubectl get deploy
   ```

4. How many Deployments exist on the system now?

   We just created a Deployment! Check again!

   - 0
   - **1**
   - 4
   - 2
   - 3

   ```
   controlplane ~ ➜  kubectl get deployments
   NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
   frontend-deployment   0/4     4            0           36s
   ```

5. How many ReplicaSets exist on the system now?

   - 4
   - 2
   - 0
   - 3
   - 1

   ```
   kubectl get rs
   NAME                             DESIRED   CURRENT   READY   AGE
   frontend-deployment-6d8c45b946   4         4         0       81s
   ```

6. How many PODs exist on the system now?

   - 0
   - 1
   - 3
   - 2
   - **4**

   ```
   ➜  kubectl get pods
   NAME                                   READY   STATUS             RESTARTS   AGE
   frontend-deployment-6d8c45b946-t2gfz   0/1     ImagePullBackOff   0          2m4s
   frontend-deployment-6d8c45b946-9xhdn   0/1     ErrImagePull       0          2m4s
   frontend-deployment-6d8c45b946-pr9cf   0/1     ImagePullBackOff   0          2m4s
   frontend-deployment-6d8c45b946-98p7c   0/1     ImagePullBackOff   0          2m4s
   ```

7. Out of all the existing PODs, how many are ready?

   - 1
   - 4
   - 2
   - 3
   - **0**

   ```
   kubectl get deployments
   NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
   frontend-deployment   0/4     4            0           2m57s
   ```

8. What is the image used to create the pods in the new deployment?

   - **BUSYBOX888**
   - BUSYBOX-CONTAINER
   - BUSYBOX777
   - NGINX
   - BUSYBOX-POD

   ```
   ➜  kubectl describe deployments.apps frontend-deployment 
   Name:                   frontend-deployment
   Namespace:              default
   CreationTimestamp:      Tue, 03 Jan 2023 03:44:04 +0000
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
     Type    Reason             Age   From                   Message
     ----    ------             ----  ----                   -------
     Normal  ScalingReplicaSet  4m1s  deployment-controller  Scaled up replica set frontend-deployment-6d8c45b946 to 4
   ```

9. Why do you think the deployment is not ready?

   - **The image BUSYBOX888 doesn't exist**
   - Deployment was not created correctly
   - Application has errors
   - Kubernetes is faulty

   ```
   kubectl describe pod frontend-deployment-6d8c45b946-9xhdn 
   Name:         frontend-deployment-6d8c45b946-9xhdn
   Namespace:    default
   Priority:     0
   Node:         controlplane/172.25.0.20
   Start Time:   Tue, 03 Jan 2023 03:44:04 +0000
   Labels:       name=busybox-pod
                 pod-template-hash=6d8c45b946
   Annotations:  <none>
   Status:       Pending
   IP:           10.42.0.11
   IPs:
     IP:           10.42.0.11
   Controlled By:  ReplicaSet/frontend-deployment-6d8c45b946
   Containers:
     busybox-container:
       Container ID:  
       Image:         busybox888
       Image ID:      
       Port:          <none>
       Host Port:     <none>
       Command:
         sh
         -c
         echo Hello Kubernetes! && sleep 3600
       State:          Waiting
         Reason:       ImagePullBackOff
       Ready:          False
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-86b87 (ro)
   Conditions:
     Type              Status
     Initialized       True 
     Ready             False 
     ContainersReady   False 
     PodScheduled      True 
   Volumes:
     kube-api-access-86b87:
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
     Type     Reason     Age                    From               Message
     ----     ------     ----                   ----               -------
     Normal   Scheduled  6m12s                  default-scheduler  Successfully assigned default/frontend-deployment-6d8c45b946-9xhdn to controlplane
     Normal   Pulling    4m37s (x4 over 6m12s)  kubelet            Pulling image "busybox888"
     Warning  Failed     4m36s (x4 over 6m11s)  kubelet            Failed to pull image "busybox888": rpc error: code = Unknown desc = failed to pull and unpack image "docker.io/library/busybox888:latest": failed to resolve reference "docker.io/library/busybox888:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
     Warning  Failed     4m36s (x4 over 6m11s)  kubelet            Error: ErrImagePull
     Warning  Failed     4m21s (x6 over 6m11s)  kubelet            Error: ImagePullBackOff
     Normal   BackOff    65s (x20 over 6m11s)   kubelet            Back-off pulling image "busybox888"
   ```

10. Create a new Deployment using the `deployment-definition-1.yaml` file located at `/root/`.

   There is an issue with the file, so try to fix it.

   Check

   - Name: deployment-1

   ```
   ➜  kubectl create -f deployment-definition-1.yaml 
   Error from server (BadRequest): error when creating "deployment-definition-1.yaml": deployment in version "v1" cannot be handled as a Deployment: no kind "deployment" is registered for version "apps/v1" in scheme "k8s.io/apimachinery@v1.24.1-k3s1/pkg/runtime/scheme.go:100"
   ```

   ```
   kubectl explain deployment-definition-1.yaml | head -n1
   the server doesn't have a resource type "deployment-definition-1"
   ```

   ```
   ---
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
    kubectl create deployment httpd-frontend --image=httpd:2.4-alpine --replicas=3 --dry-run=client -o yaml > deployment-definition-httpd.yaml
    ```

    

    `deployment-definition-httpd.yaml`

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
      template:
        metadata:
          labels:
            app: httpd-frontend
        spec:
          containers:
          - image: httpd:2.4-alpine
            name: httpd
    ```

    ```
    kubectl create -f deployment-definition-httpd.yaml 
    
    ➜  kubectl get deployments
    NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
    httpd-frontend        3/3     3            3           23s
    ```



# KUBERNETES CONCEPTS – PODS, REPLICASETS, DEPLOYMENTS, LAB: PRACTICE TEST ROLLING UPDATES AND ROLLBACKS



1. We have deployed a simple web application. Inspect the PODs and the Services

   Wait for the application to fully deploy and view the application using the link called `Webapp Portal` above your terminal.

2. What is the current color of the web application?

   Access the Webapp Portal.

   - red
   - **blue**
   - orange
   - green
   - yellow

3. Run the script named `curl-test.sh` to send multiple requests to test the web application. Take a note of the output.

   Execute the script at `/root/curl-test.sh`.

   curl-test.sh

   ```
   for i in {1..35}; do
      kubectl exec --namespace=kube-public curl -- sh -c 'test=`wget -qO- -T 2  http://webapp-service.default.svc.cluster.local:8080/info 2>&1` && echo "$test OK" || echo "Failed"';
      echo ""
   done
   ```

   

   

4. Inspect the deployment and identify the number of PODs deployed by it

   - 1
   - **4**
   - 3
   - 2
   - 5

   ```
   ➜  kubectl get deployments
   NAME       READY   UP-TO-DATE   AVAILABLE   AGE
   frontend   4/4     4            4           3m9s
   ```

5. What container image is used to deploy the applications?

   - simple-webapp
   - kodekloud/webapp-color:v2
   - kodekloud
   - webapp
   - **kodekloud/webapp-color:v1**

   ```
   $ kubectl describe deployments.apps frontend 
   Name:                   frontend
   Namespace:              default
   CreationTimestamp:      Tue, 03 Jan 2023 04:16:21 +0000
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
   NewReplicaSet:   frontend-7776cb7d57 (4/4 replicas created)
   Events:
     Type    Reason             Age    From                   Message
     ----    ------             ----   ----                   -------
     Normal  ScalingReplicaSet  4m36s  deployment-controller  Scaled up replica set frontend-7776cb7d57 to 4
   ```

6. Inspect the deployment and identify the current strategy

   - RollOut
   - ReCreate
   - RollBack
   - **RollingUpdate**

   Run the command `kubectl describe deployment` and look at `StrategyType`

   ```
   $ kubectl describe deployments.apps frontend 
   Name:                   frontend
   Namespace:              default
   CreationTimestamp:      Tue, 03 Jan 2023 04:16:21 +0000
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
   NewReplicaSet:   frontend-7776cb7d57 (4/4 replicas created)
   Events:
     Type    Reason             Age    From                   Message
     ----    ------             ----   ----                   -------
     Normal  ScalingReplicaSet  4m36s  deployment-controller  Scaled up replica set frontend-7776cb7d57 to 4
   ```

   

7. If you were to upgrade the application now what would happen?

   - **PODs are upgraded few at a time**
   - All PODs are taken down before upgrading any\

8. Let us try that. Upgrade the application by setting the image on the deployment to `kodekloud/webapp-color:v2`

   Do not delete and re-create the deployment. Only set the new image name for the existing deployment.

   Check

   - Deployment Name: frontend
   - Deployment Image: kodekloud/webapp-color:v2

   Run the command `kubectl edit deployment frontend` and modify the image to `kodekloud/webapp-color:v2`.
   Next, save and exit. The pods should be recreated with the new image.

9. Run the script `curl-test.sh` again. Notice the requests now hit both the old and newer versions. However none of them fail.

   Execute the script at `/root/curl-test.sh`.

10. Up to how many PODs can be down for upgrade at a time

   Consider the current strategy settings and number of PODs - 4

   - 2
   - 3
   - **1**
   - 4

   ```
   kubectl describe deployment frontend 
   Name:                   frontend
   Namespace:              default
   CreationTimestamp:      Tue, 03 Jan 2023 12:28:13 +0000
   Labels:                 <none>
   Annotations:            deployment.kubernetes.io/revision: 2
   Selector:               name=webapp
   Replicas:               4 desired | 4 updated | 4 total | 4 available | 0 unavailable
   StrategyType:           RollingUpdate
   MinReadySeconds:        20
   RollingUpdateStrategy:  25% max unavailable, 25% max surge
   ```



11. Change the deployment strategy to `Recreate`

    Delete and re-create the deployment if necessary. Only update the strategy type for the existing deployment.

    Check

    - Deployment Name: frontend
    - Deployment Image: kodekloud/webapp-color:v2
    - Strategy: Recreate

    

    Run the command `kubectl edit deployment frontend` and modify the required field. Make sure to delete the properties of rollingUpdate as well, set at `strategy.rollingUpdate`.

    ```
    ---
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

13. Run the script `curl-test.sh` again. Notice the failures. Wait for the new application to be ready. Notice that the requests now do not hit both the versions

    Execute the script at `/root/curl-test.sh`.



# SERVICES, LABS: SERVICES

1. How many Services exist on the system?

   In the current(default) namespace

   - 2
   - 0
   - 4
   - **1**
   - 3

   ```
   kubectl get service
   NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
   kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   4m3s
   ```

   

2. That is a default service created by Kubernetes at launch.

3. What is the type of the default `kubernetes` service?

   - NodePort
   - External
   - LoadBalancer
   - **ClusterIP**

   Run the command: `kubectl get service` and look at the `Type` column.

   ```
   kubectl get service
   NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
   kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   5m22s
   ```

4. What is the `targetPort` configured on the `kubernetes` service?

   - 8080
   - **6443**
   - 443
   - 10.96.0.1

   Run the command: `kubectl describe service` and look at `TargetPort`.

   ```
   kubectl describe service kubernetes 
   Name:              kubernetes
   Namespace:         default
   Labels:            component=apiserver
                      provider=kubernetes
   Annotations:       <none>
   Selector:          <none>
   Type:              ClusterIP
   IP Family Policy:  SingleStack
   IP Families:       IPv4
   IP:                10.43.0.1
   IPs:               10.43.0.1
   Port:              https  443/TCP
   TargetPort:        6443/TCP
   Endpoints:         10.47.138.6:6443
   Session Affinity:  None
   Events:            <none>
   ```

5. How many labels are configured on the `kubernetes` service?

   - 3
   - 1
   - 0
   - **2**

   Run the command: `kubectl describe service` and look at the `Labels`.

   ```
   kubectl describe service kubernetes 
   Name:              kubernetes
   Namespace:         default
   Labels:            component=apiserver
                      provider=kubernetes
   Annotations:       <none>
   Selector:          <none>
   Type:              ClusterIP
   IP Family Policy:  SingleStack
   IP Families:       IPv4
   IP:                10.43.0.1
   IPs:               10.43.0.1
   Port:              https  443/TCP
   TargetPort:        6443/TCP
   Endpoints:         10.47.138.6:6443
   Session Affinity:  None
   Events:            <none>
   ```

6. How many Endpoints are attached on the `kubernetes` service?

   - 3
   - 0
   - **1**
   - 2

   Run the command: `kubectl describe service` and look at the `Endpoints`.

   ```
   kubectl describe service kubernetes 
   Name:              kubernetes
   Namespace:         default
   Labels:            component=apiserver
                      provider=kubernetes
   Annotations:       <none>
   Selector:          <none>
   Type:              ClusterIP
   IP Family Policy:  SingleStack
   IP Families:       IPv4
   IP:                10.43.0.1
   IPs:               10.43.0.1
   Port:              https  443/TCP
   TargetPort:        6443/TCP
   Endpoints:         10.47.138.6:6443
   Session Affinity:  None
   Events:            <none
   ```

7. How many Deployments exist on the system now?

   In the current(default) namespace

   - **1**
   - 3
   - 2
   - 0
   - 4

   ```
   kubectl get deployments.apps 
   NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
   simple-webapp-deployment   4/4     4            4           32s
   ```

8. What is the image used to create the pods in the deployment?

   - NGINX
   - BUSYBOX-CONTAINER
   - BUSYBOX-POD
   - **kodekloud/simple-webapp:red**
   - BUSYBOX777

   ```
   kubectl describe deployments.apps simple-webapp-deployment 
   Name:                   simple-webapp-deployment
   Namespace:              default
   CreationTimestamp:      Tue, 03 Jan 2023 12:50:11 +0000
   Labels:                 <none>
   Annotations:            deployment.kubernetes.io/revision: 1
   Selector:               name=simple-webapp
   Replicas:               4 desired | 4 updated | 4 total | 4 available | 0 unavailable
   StrategyType:           RollingUpdate
   MinReadySeconds:        0
   RollingUpdateStrategy:  25% max unavailable, 25% max surge
   Pod Template:
     Labels:  name=simple-webapp
     Containers:
      simple-webapp:
       Image:        kodekloud/simple-webapp:red
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
   NewReplicaSet:   simple-webapp-deployment-8c46cb57c (4/4 replicas created)
   Events:
     Type    Reason             Age   From                   Message
     ----    ------             ----  ----                   -------
     Normal  ScalingReplicaSet  101s  deployment-controller  Scaled up replica set simple-webapp-deployment-8c46cb57c to 4
   ```

9. Are you able to accesss the Web App UI?

   Try to access the Web Application UI using the tab `simple-webapp-ui` above the terminal.

   - **NO**

   - YES

10. Create a new service to access the web application using the `service-definition-1.yaml` file.

   `Name:` webapp-service
   `Type:` NodePort
   `targetPort:` 8080
   `port:` 8080
   `nodePort:` 30080
   `selector:`
    `name:` simple-webapp

```
kubectl expose deployment simple-webapp-deployment --name=webapp-service --type=NodePort --target-port=8080 --port=8080 --dry-run=client -o yaml > service-definition-1.yaml
```

service-definition-1.yaml

   ```
   apiVersion: v1
   kind: Service
   metadata:
     name: webapp-service
   spec:
     type: NodePort
     ports:
       - targetPort: 8080
         port: 8080
         nodePort: 30080
     selector:
       name: simple-webapp
   ```

   ```
   kubectl apply -f service-definition-1.yaml 
   ```










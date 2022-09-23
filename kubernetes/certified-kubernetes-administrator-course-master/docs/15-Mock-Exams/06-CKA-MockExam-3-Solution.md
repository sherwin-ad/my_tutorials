# Mock Exam 3 Solution


1. Create a new service account with the name `pvviewer`. Grant this Service account access to `list` all PersistentVolumes in the cluster by creating an appropriate cluster role called `pvviewer-role` and ClusterRoleBinding called `pvviewer-role-binding`.
     Next, create a pod called `pvviewer` with the image: `redis` and serviceAccount: `pvviewer` in the default namespace.

     - ServiceAccount: pvviewer
     - ClusterRole: pvviewer-role
     - ClusterRoleBinding: pvviewer-role-binding
     - Pod: pvviewer
     - Pod configured to use ServiceAccount pvviewer ?

     Run the below command for solution: 

     


    # CREATE SERVICE ACCOUNT
    kubectl create serviceaccount -h
     
    kubectl create serviceaccount pvviewer
     
    # CREATE CLUSTER ROLE
    kubectl create clusterrole -h
     
    kubectl create clusterrole pvviewer-role --resource=persistentvolumes --verb=list
     
    # CREATE CLUSTER ROLE BINDING
    kubectl create clusterrolebinding -h 
     
    kubectl create clusterrolebinding pvviewer-role-binding --clusterrole=pvviewer-role --serviceaccount=default:pvviewer
     
     # CREATE POD
     kubectl run pvviewer --image=redis --serviceaccount=pvviewer




2. List the `InternalIP` of all nodes of the cluster. Save the result to a file `/root/CKA/node_ips`.

     Answer should be in the format: `InternalIP of controlplane`<space>`InternalIP of node01` (in a single line)

     Run the below command for solution: 

     1. Search kubernetes cheat sheet look for jason path
     2. Identify the path that we want to retrieve

     ```
     k get nodes -o jason | grep InternalIP -B 5 -A 5
     
     k get nodes -o json | jq -c 'paths' | grep type | grep -v "metadata" | grep address
     
     k get nodes -o jsonpath='{.items}' | jq
     
     kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}'
     10.30.87.12 10.30.87.3
     
     kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}' > /root/CKA/node_ips
     ```

     


3. Create a pod called `multi-pod` with two containers.
     Container 1, name: `alpha`, image: `nginx`
     Container 2: name: `beta`, image: `busybox`, command: `sleep 4800`

     Environment Variables:
     container 1:
     `name: alpha`

     Container 2:
     `name: beta`

     - Pod Name: multi-pod
     - Container 1: alpha
     - Container 2: beta
     - Container beta commands set correctly?
     - Container 1 Environment Value Set
     - Container 2 Environment Value Set

     Run the below command for solution:  

     1. Create multi-pod.yaml 

     ```
     k run multi-pod --image=busybox --env="name=beta" --command --dry-run=client -o yaml -- sleep 4800 > multi-pod.yaml
     ```

     2. Edit multi-pod.yaml


     ```
     apiVersion: v1
     kind: Pod
     metadata:
       name: multi-pod
     spec:
       containers:
       - image: nginx
         name: alpha
         env:
         - name: name
           value: alpha
       - image: busybox
         name: beta
         command: ["sleep", "4800"]
         env:
         - name: name
           value: beta
     status: {}
     ```
     3. Create pod

     ```
     root@controlplane ~ ➜  k create -f multi-pod.yaml 
     pod/multi-pod created
     
     root@controlplane ~ ➜  k get pods
     NAME        READY   STATUS    RESTARTS   AGE
     multi-pod   2/2     Running   0          13s
     pvviewer    1/1     Running   0          54m
     
     root@controlplane ~ ➜  k describe pod multi-pod
     Name:         multi-pod
     Namespace:    default
     Priority:     0
     Node:         node01/10.30.87.3
     Start Time:   Fri, 23 Sep 2022 09:53:50 +0000
     Labels:       run=multi-pod
     Annotations:  <none>
     Status:       Running
     IP:           10.50.192.2
     IPs:
       IP:  10.50.192.2
     Containers:
       alpha:
         Container ID:   docker://4fe1ce223ba78fe37832ba4a250b29a843f7efe2544247a08aadb3cceaf88781
         Image:          nginx
         Image ID:       docker-pullable://nginx@sha256:0b970013351304af46f322da1263516b188318682b2ab1091862497591189ff1
         Port:           <none>
         Host Port:      <none>
         State:          Running
           Started:      Fri, 23 Sep 2022 09:53:57 +0000
         Ready:          True
         Restart Count:  0
         Environment:
           name:  alpha
         Mounts:
           /var/run/secrets/kubernetes.io/serviceaccount from default-token-4znsg (ro)
       beta:
         Container ID:  docker://7fcd7fa5245ebe8f435d0d6943e890be4597fb555868354a0c12ca9c20f24c0c
         Image:         busybox
         Image ID:      docker-pullable://busybox@sha256:ad9bd57a3a57cc95515c537b89aaa69d83a6df54c4050fcf2b41ad367bec0cd5
         Port:          <none>
         Host Port:     <none>
         Command:
           sleep
           4800
         State:          Running
           Started:      Fri, 23 Sep 2022 09:53:58 +0000
         Ready:          True
         Restart Count:  0
         Environment:
           name:  beta
         Mounts:
           /var/run/secrets/kubernetes.io/serviceaccount from default-token-4znsg (ro)
     Conditions:
       Type              Status
       Initialized       True 
       Ready             True 
       ContainersReady   True 
       PodScheduled      True 
     Volumes:
       default-token-4znsg:
         Type:        Secret (a volume populated by a Secret)
         SecretName:  default-token-4znsg
         Optional:    false
     QoS Class:       BestEffort
     Node-Selectors:  <none>
     Tolerations:     node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                      node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
     Events:
       Type    Reason     Age   From               Message
       ----    ------     ----  ----               -------
       Normal  Scheduled  28s   default-scheduler  Successfully assigned default/multi-pod to node01
       Normal  Pulling    27s   kubelet            Pulling image "nginx"
       Normal  Pulled     22s   kubelet            Successfully pulled image "nginx" in 4.382367339s
       Normal  Created    22s   kubelet            Created container alpha
       Normal  Started    21s   kubelet            Started container alpha
       Normal  Pulling    21s   kubelet            Pulling image "busybox"
       Normal  Pulled     20s   kubelet            Successfully pulled image "busybox" in 1.300104672s
       Normal  Created    20s   kubelet            Created container beta
       Normal  Started    20s   kubelet            Started container beta
     ```

     

4. Create a Pod called `non-root-pod` , image: `redis:alpine`
     runAsUser: 1000
     fsGroup: 2000

     - Pod non-root-pod fsGroup configured
     - Pod non-root-pod runAsUser configured

     Run the below command for solution:

     1. Create non-root-pod.yaml

     ```
     k run non-root-pod --image=redis:alpine --dry-run=client -o yaml > non-root-pod.yaml
     ```

     2. Search "security context"  and edit non-root-pod.yaml


     ```
     apiVersion: v1
     kind: Pod
     metadata:
       name: non-root-pod
     spec:
       securityContext:
         runAsUser: 1000
         fsGroup: 2000
       containers:
       - name: non-root-pod
         image: redis:alpine
     ```
     3. Create pod 

     ```
     root@controlplane ~ ➜  k create -f non-root-pod.yaml 
     pod/non-root-pod created
     
     root@controlplane ~ ➜  k get pods
     NAME           READY   STATUS    RESTARTS   AGE
     non-root-pod   1/1     Running   0          10s
     ```

     

5. We have deployed a new pod called `np-test-1` and a service called `np-test-service`. Incoming connections to this service are not working. Troubleshoot and fix it.
     Create NetworkPolicy, by the name `ingress-to-nptest` that allows incoming connections to the service over port `80`.

     Important: Don't delete any current objects deployed.

     - Important: Don't Alter Existing Objects!
     - NetworkPolicy: Applied to All sources (Incoming traffic from all pods)?
     - NetWorkPolicy: Correct Port?
     - NetWorkPolicy: Applied to correct Pod?

     Run the below command for solution:  

     1. Show pod and service

     ```
     root@controlplane ~ ➜  k get pod
     NAME           READY   STATUS    RESTARTS   AGE
     non-root-pod   1/1     Running   0          4m46s
     np-test-1      1/1     Running   0          3m30s
     
     root@controlplane ~ ➜  k get service
     NAME              TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
     kubernetes        ClusterIP   10.96.0.1      <none>        443/TCP   16m
     np-test-service   ClusterIP   10.109.5.240   <none>        80/TCP    3m37s
     ```

     2. Create a temporary container

     ```
     root@controlplane ~ ➜  k run curl --image=alpine/curl --rm -it -- sh
     If you don't see a command prompt, try pressing enter.
     / # curl np-test-service
     ```

     3. Create network policy 
        - Search network policy
        - Check labels in service 

     np.yaml


     ```
     apiVersion: networking.k8s.io/v1
     kind: NetworkPolicy
     metadata:
       name: ingress-to-nptest
       namespace: default
     spec:
       podSelector:
         matchLabels:
           run: np-test-1
       policyTypes:
       - Ingress
       ingress:
       - ports:
         - protocol: TCP
           port: 80
     ```
     ```
     root@controlplane ~ ✦ ➜  k create -f np.yaml 
     networkpolicy.networking.k8s.io/ingress-to-nptest created
     
     root@controlplane ~ ✦ ➜  k get networkpolicies.networking.k8s.io 
     NAME                POD-SELECTOR    AGE
     default-deny        <none>          9m2s
     ingress-to-nptest   run=np-test-1   12s
     
     root@controlplane ~ ✦ ➜  k describe networkpolicies.networking.k8s.io ingress-to-nptest 
     Name:         ingress-to-nptest
     Namespace:    default
     Created on:   2022-09-23 10:40:20 +0000 UTC
     Labels:       <none>
     Annotations:  <none>
     Spec:
       PodSelector:     run=np-test-1
       Allowing ingress traffic:
         To Port: 80/TCP
         From: <any> (traffic not restricted by source)
       Not affecting egress traffic
       Policy Types: Ingress
     ```

     4. Check if service is now accessible via curl

     ```
     k run curl --image=alpine/curl --rm -it -- sh
     If you don't see a command prompt, try pressing enter.
     / # curl np-test-service
     <!DOCTYPE html>
     <html>
     <head>
     <title>Welcome to nginx!</title>
     <style>
         body {
             width: 35em;
             margin: 0 auto;
             font-family: Tahoma, Verdana, Arial, sans-serif;
         }
     </style>
     </head>
     <body>
     <h1>Welcome to nginx!</h1>
     <p>If you see this page, the nginx web server is successfully installed and
     working. Further configuration is required.</p>
     
     <p>For online documentation and support please refer to
     <a href="http://nginx.org/">nginx.org</a>.<br/>
     Commercial support is available at
     <a href="http://nginx.com/">nginx.com</a>.</p>
     
     <p><em>Thank you for using nginx.</em></p>
     </body>
     </html>
     ```

     

6. Taint the worker node `node01` to be Unschedulable. Once done, create a pod called `dev-redis`, image `redis:alpine`, to ensure workloads are not scheduled to this worker node. Finally, create a new pod called `prod-redis` and image: `redis:alpine` with toleration to be scheduled on `node01`.

     key: `env_type`, value: `production`, operator: `Equal` and effect: `NoSchedule`

     - Key = env_type
     - Value = production
     - Effect = NoSchedule
     - pod 'dev-redis' (no tolerations) is not scheduled on node01?
     - Create a pod 'prod-redis' to run on node01

     Run the below command for solution: 

     1. Create taint in node01


     ```
     k taint -h
     
     k taint node node01 env_type=production:NoSchedule
     node/node01 tainted
     
     k describe nodes node01 
     Name:               node01
     Roles:              <none>
     Labels:             beta.kubernetes.io/arch=amd64
                         beta.kubernetes.io/os=linux
                         kubernetes.io/arch=amd64
                         kubernetes.io/hostname=node01
                         kubernetes.io/os=linux
     Annotations:        kubeadm.alpha.kubernetes.io/cri-socket: /var/run/dockershim.sock
                         node.alpha.kubernetes.io/ttl: 0
                         volumes.kubernetes.io/controller-managed-attach-detach: true
     CreationTimestamp:  Fri, 23 Sep 2022 10:25:31 +0000
     Taints:             env_type=production:NoSchedule
     ```

     2. Deploy `dev-redis` pod and to ensure that workloads are not scheduled to this `node01` worker node.

     ```
     k run dev-redis --image=redis:alpine
     pod/dev-redis created
     
     k get pods -o wide
     NAME        READY   STATUS    RESTARTS   AGE   IP            NODE           NOMINATED NODE   READINESS GATES
     dev-redis   1/1     Running   0          11s   10.50.0.4     controlplane   <none>           <none>
     np-test-1   1/1     Running   0          26m   10.50.192.1   node01         <none>           <none>
     ```

     3. Deploy new pod `prod-redis` with toleration to be scheduled on `node01` worker node. ()

     ```
     k run prod-redis --image=redis:alpine --dry-run=client -o yaml > prod-redis.yaml
     ```

     edit prod-redis.yaml

     ```
     apiVersion: v1
     kind: Pod
     metadata:
       name: prod-redis
     spec:
       containers:
       - name: prod-redis
         image: redis:alpine
       tolerations:
       - effect: NoSchedule
         key: env_type
         operator: Equal
         value: production     
     ```

     ```
     k create -f prod-redis.yaml 
     pod/prod-redis created
     ```

     View the pods with short details: 

     ```
     k get pods -o wide
     NAME         READY   STATUS    RESTARTS   AGE     IP            NODE           NOMINATED NODE   READINESS GATES
     dev-redis    1/1     Running   0          6m37s   10.50.0.4     controlplane   <none>           <none>
     np-test-1    1/1     Running   0          32m     10.50.192.1   node01         <none>           <none>
     prod-redis   1/1     Running   0          21s     10.50.192.2   node01         <none>           <none>
     ```
     

7. Create a pod called `hr-pod` in `hr` namespace belonging to the `production` `environment` and `frontend` `tier` .
     image: `redis:alpine`

     Use appropriate labels and create all the required objects if it does not exist in the system already.

     - hr-pod labeled with `environment=production`?
     - hr-pod labeled with `tier=frontend`?

     Run the below command for solution: 

     <details>

     ```
     kubectl create namespace hr
     kubectl run hr-pod --image=redis:alpine --namespace=hr --labels=environment=production,tier=frontend
     ```
     </details>

8. A kubeconfig file called `super.kubeconfig` has been created under `/root/CKA`. There is something wrong with the configuration. Troubleshoot and fix it.

     - Fix /root/CKA/super.kubeconfig

     Run the below command for solution:

     <details>

     ```
     vi /root/CKA/super.kubeconfig
     
     Change the 2379 port to 6443 and run the below command to verify
     
     kubectl cluster-info --kubeconfig=/root/CKA/super.kubeconfig     
     ```
     </details>

9. We have created a new deployment called `nginx-deploy`. scale the deployment to 3 replicas. Has the replica's increased? Troubleshoot the issue and fix it.

     - deployment has 3 replicas

     Run the below command for solution:

     <details>

     ```
     sed -i 's/kube-contro1ler-manager/kube-controller-manager/g' kube-controller-manager.yaml
     ```
     </details>


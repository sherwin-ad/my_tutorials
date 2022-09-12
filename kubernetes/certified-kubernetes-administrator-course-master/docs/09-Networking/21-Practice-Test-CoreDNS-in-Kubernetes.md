# Practice Test CoreDNS in Kubernetes

  - Take me to [Practice Test](https://kodekloud.com/topic/practice-test-coredns-in-kubernetes/)

#### Solution 

  1. Identify the DNS solution implemented in this cluster.

     - kube-dns
     - bind
     - google DNS
     - OpenDNS
     - CoreDNS

     Check the Solution

     ```
     kubectl get pods -n kube-system 
     NAME                                   READY   STATUS    RESTARTS   AGE
     coredns-74ff55c5b-5gbd7                1/1     Running   0          93m
     coredns-74ff55c5b-jrq5h                1/1     Running   0          93m
     etcd-controlplane                      1/1     Running   0          94m
     kube-apiserver-controlplane            1/1     Running   0          94m
     kube-controller-manager-controlplane   1/1     Running   0          94m
     kube-flannel-ds-hsgsb                  1/1     Running   0          93m
     kube-proxy-bv8kx                       1/1     Running   0          93m
     kube-scheduler-controlplane            1/1     Running   0          94m
     ```
     
     ```
     CoreDNS
     ```
     
     

  2. How many pods of the DNS server are deployed?

     - 1
     - 2
     - 3
     - 4

     Check the Solution

     ```
     kubectl get pods -n kube-system 
     NAME                                   READY   STATUS    RESTARTS   AGE
     coredns-74ff55c5b-5gbd7                1/1     Running   0          93m
     coredns-74ff55c5b-jrq5h                1/1     Running   0          93m
     etcd-controlplane                      1/1     Running   0          94m
     kube-apiserver-controlplane            1/1     Running   0          94m
     kube-controller-manager-controlplane   1/1     Running   0          94m
     kube-flannel-ds-hsgsb                  1/1     Running   0          93m
     kube-proxy-bv8kx                       1/1     Running   0          93m
     kube-scheduler-controlplane            1/1     Running   0          94m
     ```
     
     ```
     2
     ```
     
     

  3. What is the name of the service created for accessing CoreDNS?

     - core-service
     - dns-service
     - kube-service
     - kubernetes
     - kube-dns

     ```
     $ kubectl get service -n kube-system 
     NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
     kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   66m
     ```

     ```
     kube-dns
     ```

     

  4. What is the IP of the CoreDNS server that should be configured on PODs to resolve services?

     - 8.8.8.8
     - 192.168.1.
     - 110.244.1.2
     - 10.96.0.10

     ```
     kubectl get service -n kube-system 
     NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
     kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   66m
     ```

     ```
     10.96.0.10
     ```

     

5. Where is the configuration file located for configuring the CoreDNS service?

   - /root/Corefile
   - /etc/Corefile
   - /etc/coredns/Corefile
   - /var/coredns/Corefile
   - /etc/kubedns/Corefile

   Check the Solution
   
   ```
   kubectl get pods -n kube-system 
   NAME                                   READY   STATUS    RESTARTS   AGE
   coredns-74ff55c5b-5gbd7                1/1     Running   0          99m
   coredns-74ff55c5b-jrq5h                1/1     Running   0          99m
   etcd-controlplane                      1/1     Running   0          99m
   kube-apiserver-controlplane            1/1     Running   0          99m
   kube-controller-manager-controlplane   1/1     Running   0          99m
   kube-flannel-ds-hsgsb                  1/1     Running   0          99m
   kube-proxy-bv8kx                       1/1     Running   0          99m
   kube-scheduler-controlplane            1/1     Running   0          99m
   ```
   
   ```
   kubectl describe pod coredns-74ff55c5b-5gbd7 -n kube-system 
   Name:                 coredns-74ff55c5b-5gbd7
   Namespace:            kube-system
   Priority:             2000000000
   Priority Class Name:  system-cluster-critical
   Node:                 controlplane/10.54.101.8
   Start Time:           Sun, 11 Sep 2022 21:12:15 +0000
   Labels:               k8s-app=kube-dns
                         pod-template-hash=74ff55c5b
   Annotations:          <none>
   Status:               Running
   IP:                   10.244.0.2
   IPs:
     IP:           10.244.0.2
   Controlled By:  ReplicaSet/coredns-74ff55c5b
   Containers:
     coredns:
       Container ID:  docker://577e7bd68893f0a7489c3cdd12c9aefb595df1a525cdf5e67b4d5bda2640aad2
       Image:         k8s.gcr.io/coredns:1.7.0
       Image ID:      docker-pullable://k8s.gcr.io/coredns@sha256:73ca82b4ce829766d4f1f10947c3a338888f876fbed0540dc849c89ff256e90c
       Ports:         53/UDP, 53/TCP, 9153/TCP
       Host Ports:    0/UDP, 0/TCP, 0/TCP
       Args:
         -conf
         /etc/coredns/Corefile
       State:          Running
         Started:      Sun, 11 Sep 2022 21:12:19 +0000
       Ready:          True
       Restart Count:  0
       Limits:
         memory:  170Mi
       Requests:
         cpu:        100m
         memory:     70Mi
       Liveness:     http-get http://:8080/health delay=60s timeout=5s period=10s #success=1 #failure=5
       Readiness:    http-get http://:8181/ready delay=0s timeout=1s period=10s #success=1 #failure=3
       Environment:  <none>
       Mounts:
         /etc/coredns from config-volume (ro)
         /var/run/secrets/kubernetes.io/serviceaccount from coredns-token-lt2nx (ro)
   Conditions:
     Type              Status
     Initialized       True 
     Ready             True 
     ContainersReady   True 
     PodScheduled      True 
   Volumes:
     config-volume:
       Type:      ConfigMap (a volume populated by a ConfigMap)
       Name:      coredns
       Optional:  false
     coredns-token-lt2nx:
       Type:        Secret (a volume populated by a Secret)
       SecretName:  coredns-token-lt2nx
       Optional:    false
   QoS Class:       Burstable
   Node-Selectors:  kubernetes.io/os=linux
   Tolerations:     CriticalAddonsOnly op=Exists
                    node-role.kubernetes.io/control-plane:NoSchedule
                    node-role.kubernetes.io/master:NoSchedule
                    node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                    node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
   Events:          <none>
   ```
   
   ```
   /etc/coredns/Corefile
   ```
   
6. How is the Corefile passed in to the CoreDNS POD?

   - Corefile comes built-in with CoreDNS pod

   - Stored on the kube master

   - pulled from git

   - Configured as a ConfigMap object


Check the Solution


```
kubectl describe pod coredns-74ff55c5b-5gbd7 -n kube-system 
Name:                 coredns-74ff55c5b-5gbd7
Namespace:            kube-system
Priority:             2000000000
Priority Class Name:  system-cluster-critical
Node:                 controlplane/10.54.101.8
Start Time:           Sun, 11 Sep 2022 21:12:15 +0000
Labels:               k8s-app=kube-dns
                      pod-template-hash=74ff55c5b
Annotations:          <none>
Status:               Running
IP:                   10.244.0.2
IPs:
  IP:           10.244.0.2
Controlled By:  ReplicaSet/coredns-74ff55c5b
Containers:
  coredns:
    Container ID:  docker://577e7bd68893f0a7489c3cdd12c9aefb595df1a525cdf5e67b4d5bda2640aad2
    Image:         k8s.gcr.io/coredns:1.7.0
    Image ID:      docker-pullable://k8s.gcr.io/coredns@sha256:73ca82b4ce829766d4f1f10947c3a338888f876fbed0540dc849c89ff256e90c
    Ports:         53/UDP, 53/TCP, 9153/TCP
    Host Ports:    0/UDP, 0/TCP, 0/TCP
    Args:
      -conf
      /etc/coredns/Corefile
    State:          Running
      Started:      Sun, 11 Sep 2022 21:12:19 +0000
    Ready:          True
    Restart Count:  0
    Limits:
      memory:  170Mi
    Requests:
      cpu:        100m
      memory:     70Mi
    Liveness:     http-get http://:8080/health delay=60s timeout=5s period=10s #success=1 #failure=5
    Readiness:    http-get http://:8181/ready delay=0s timeout=1s period=10s #success=1 #failure=3
    Environment:  <none>
    Mounts:
      /etc/coredns from config-volume (ro)
      /var/run/secrets/kubernetes.io/serviceaccount from coredns-token-lt2nx (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  config-volume:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      coredns
    Optional:  false
  coredns-token-lt2nx:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  coredns-token-lt2nx
    Optional:    false
QoS Class:       Burstable
Node-Selectors:  kubernetes.io/os=linux
Tolerations:     CriticalAddonsOnly op=Exists
                 node-role.kubernetes.io/control-plane:NoSchedule
                 node-role.kubernetes.io/master:NoSchedule
                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                 node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:          <none>
```

OR

```
kubectl get pod coredns-74ff55c5b-5gbd7 -n kube-system -o yaml
```

```
Configured as a ConfigMap object
```



  7. What is the name of the ConfigMap object created for Corefile?

     - kube-proxy
     - dns-config
     - corefile-config
     - coredns

     Check the Solution

     ```
      $ kubectl get pod coredns-74ff55c5b-5gbd7 -n kube-system -o yaml
      ....
      volumes:
       - configMap:
           defaultMode: 420
           items:
           - key: Corefile
             path: Corefile
           name: coredns
         name: config-volume
       - name: coredns-token-lt2nx
         secret:
           defaultMode: 420
           secretName: coredns-token-lt2nx
      ......
     ```


      ```
      coredns
      ```
     

  8. What is the root domain/zone configured for this kubernetes cluster?

     - cluster.local
     - root
     - kubernetes
     - cluster-a.local

     Check the Solution

     <details>
     ```
     kubectl get configmaps -n kube-system 
     NAME                                 DATA   AGE
     coredns                              1      112m
     extension-apiserver-authentication   6      112m
     kube-flannel-cfg                     2      112m
     kube-proxy                           2      112m
     kube-root-ca.crt                     1      112m
     kubeadm-config                       2      112m
     kubelet-config-1.20                  1      112m
     ```

     ```
     kubectl describe -n kube-system configmaps coredns 
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
     
     Events:  <none>
     ```


      ```
      cluster.local
      ```
     </details>

  9. Check the Solution

     <details>

      ```
      Ok
      ```
     </details>

  10. What name can be used to access the `hr` web server from the `test` Application?

      You can execute a curl command on the `test` pod to test. Alternatively, the test Application also has a UI. Access it using the tab at the top of your terminal named `test-app`.

      - web-service.payroll
      - web-service
      - web
      - test-service

      Check the Solution

      ```
       kubectl get service
      NAME           TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
      kubernetes     ClusterIP   10.96.0.1       <none>        443/TCP        117m
      test-service   NodePort    10.103.86.39    <none>        80:30080/TCP   25m
      web-service    ClusterIP   10.104.51.166   <none>        80/TCP         25m
      ```

      ```
       kubectl describe service web-service 
      Name:              web-service
      Namespace:         default
      Labels:            <none>
      Annotations:       <none>
      Selector:          name=hr
      Type:              ClusterIP
      IP Families:       <none>
      IP:                10.104.51.166
      IPs:               10.104.51.166
      Port:              <unset>  80/TCP
      TargetPort:        80/TCP
      Endpoints:         10.244.0.5:80
      Session Affinity:  None
      Events:            <none>
      ```


       ```
       web-service
       ```
      

  11. Which of the names CANNOT be used to access the HR service from the test pod?

      - web-service
      - web-service.default
      - web-service.default.pod
      - web-service.default.svc

      Check the Solution

      ```
      kubectl exec test -- curl http://web-service
        % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                       Dload  Upload   Total   Spent    Left  Speed
      100    24    0    24    0     0  24000      0 --:--:-- --:--:-- --:--:-- 24000
       This is the HR server!
      
      kubectl exec test -- curl http://web-service.default
        % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                       Dload  Upload   Total   Spent    Left  Speed
        0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0 This is the HR server!
      100    24    0    24    0     0  24000      0 --:--:-- --:--:-- --:--:-- 24000
      
      kubectl exec test -- curl http://web-service.default.pod
        % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                       Dload  Upload   Total   Spent    Left  Speed
        0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: web-service.default.pod
      command terminated with exit code 6
      
      kubectl exec test -- curl http://web-service.default.svc
        % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                       Dload  Upload   Total   Spent    Left  Speed
      100    24    0    24    0     0   1263      0 --:--:-- --:--:-- --:--:--  1333
       This is the HR server!
      ```


       ```
       web-serivce.default.pod
       ```

  12. Which of the below name can be used to access the `payroll` service from the test application?

      - web-service
      - web
      - web-service.default
      - web-service.payroll

      Check the Solution

      ```
      kubectl exec test -- curl http://web-service.payroll
        % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                       Dload  Upload   Total   Spent    Left  Speed
      100    29    0    29    0     0   2416      0 --:--:-- --:--:-- --:--:--  2416
       This is the PayRoll server!
      ```


       ```
       web-service.payroll
       ```

  13. Which of the below name CANNOT be used to access the `payroll` service from the test application?

      - web-service.payroll
      - web-service.payroll.svc
      - web-service.payroll.svc.cluster
      - web-service.payroll.svc.cluster.local

      Check the Solution

      ```
      kubectl exec test -- curl http://web-service.payroll.svc.cluster
        % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                       Dload  Upload   Total   Spent    Left  Speed
        0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: web-service.payroll.svc.cluster
      command terminated with exit code 6
      ```


       ```
       web-service.payroll.svc.cluster
       ```

  14. We just deployed a web server - `webapp` - that accesses a database `mysql` - server. However the web server is failing to connect to the database server. Troubleshoot and fix the issue.

      They could be in different namespaces. First locate the applications. The web server interface can be seen by clicking the tab `Web Server` at the top of your terminal.

      Check:

      - Web Server: webapp
      - Uses the right DB_Host name

      Check the Solution

      ```
      kubectl get pods -A
      NAMESPACE     NAME                                   READY   STATUS    RESTARTS   AGE
      default       hr                                     1/1     Running   0          47m
      default       simple-webapp-1                        1/1     Running   0          47m
      default       simple-webapp-122                      1/1     Running   0          47m
      default       test                                   1/1     Running   0          47m
      default       webapp-84ffb6ddff-hgkjx                1/1     Running   0          3m33s
      kube-system   coredns-74ff55c5b-5gbd7                1/1     Running   0          139m
      kube-system   coredns-74ff55c5b-jrq5h                1/1     Running   0          139m
      kube-system   etcd-controlplane                      1/1     Running   0          139m
      kube-system   kube-apiserver-controlplane            1/1     Running   0          139m
      kube-system   kube-controller-manager-controlplane   1/1     Running   0          139m
      kube-system   kube-flannel-ds-hsgsb                  1/1     Running   0          139m
      kube-system   kube-proxy-bv8kx                       1/1     Running   0          139m
      kube-system   kube-scheduler-controlplane            1/1     Running   0          139m
      payroll       mysql                                  1/1     Running   0          3m33s
      payroll       web                                    1/1     Running   0          47m
      ```

      ```
      kubectl get service -n payroll 
      NAME          TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
      mysql         ClusterIP   10.96.232.222   <none>        3306/TCP   6m34s
      web-service   ClusterIP   10.96.130.191   <none>        80/TCP     50m
      ```


       ```
       kubectl edit deploy webapp
       
       Search for DB_Host and Change the DB_Host from mysql to mysql.payroll
       
       spec:
         containers:
         - env:
           - name: DB_Host
             value: mysql.payroll
       ```

  15. From the `hr` pod `nslookup` the `mysql` service and redirect the output to a file `/root/CKA/nslookup.out`

      Check

      - nslookup output redirected

      Check the Solution


       ```
       kubectl exec hr -- nslookup mysql.payroll > /root/CKA/nslookup.out
       ```
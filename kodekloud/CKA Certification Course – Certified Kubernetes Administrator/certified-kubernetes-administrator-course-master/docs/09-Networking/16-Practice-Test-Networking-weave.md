# Practice Test Networking Weave

  - Take me to [Practice Test](https://kodekloud.com/topic/practice-test-networking-weave/)

#### Solution 

  1. How many Nodes are part of this cluster?

     

     Including master and worker nodes

     - 1
     - 2
     - 3

     Check the Solution

     <details>
     ```
     kubectl get nodes
     NAME           STATUS   ROLES                  AGE   VERSION
     controlplane   Ready    control-plane,master   17m   v1.23.0
     node01         Ready    <none>                 17m   v1.23.0
     ```


      ```
      2
      ```
     </details>

  2. What is the Networking Solution used by this cluster?

     - flannel
     - weave
     - calico
     - cilium

     Check the Solution

     <details>
     ```
     ls -l /etc/cni/net.d/
     total 4
     -rw-r--r-- 1 root root 318 Sep  7 02:13 10-weave.conflist
     ```


      ```
      weave
      ```
     </details>

  3. How many weave agents/peers are deployed in this cluster?

     - 1
     - 3
     - 2

     Check the Solution

     <details>
     ```
     kubectl get pods -n kube-system 
     NAME                                   READY   STATUS    RESTARTS      AGE
     coredns-64897985d-qgw59                1/1     Running   0             20m
     coredns-64897985d-rj86z                1/1     Running   0             20m
     etcd-controlplane                      1/1     Running   0             20m
     kube-apiserver-controlplane            1/1     Running   0             20m
     kube-controller-manager-controlplane   1/1     Running   0             20m
     kube-proxy-4b7sj                       1/1     Running   0             20m
     kube-proxy-n9qms                       1/1     Running   0             19m
     kube-scheduler-controlplane            1/1     Running   0             20m
     weave-net-7nj4h                        2/2     Running   0             19m
     weave-net-q678m                        2/2     Running   1 (19m ago)   20m
     ```


      ```
      2
      ```
     </details>

  4. On which nodes are the weave peers present?

     - All on the master node
     - All on node01
     - One on every node
     - 2 on master 2 on worker
     - On worker nodes only

     Check the Solution

     <details>

     ```
     kubectl get pod -n kube-system -o wide
     NAME                                   READY   STATUS    RESTARTS      AGE   IP           NODE           NOMINATED NODE   READINESS GATES
     coredns-64897985d-qgw59                1/1     Running   0             22m   10.50.0.3    controlplane   <none>           <none>
     coredns-64897985d-rj86z                1/1     Running   0             22m   10.50.0.2    controlplane   <none>           <none>
     etcd-controlplane                      1/1     Running   0             23m   10.2.15.9    controlplane   <none>           <none>
     kube-apiserver-controlplane            1/1     Running   0             23m   10.2.15.9    controlplane   <none>           <none>
     kube-controller-manager-controlplane   1/1     Running   0             23m   10.2.15.9    controlplane   <none>           <none>
     kube-proxy-4b7sj                       1/1     Running   0             22m   10.2.15.9    controlplane   <none>           <none>
     kube-proxy-n9qms                       1/1     Running   0             22m   10.2.15.12   node01         <none>           <none>
     kube-scheduler-controlplane            1/1     Running   0             23m   10.2.15.9    controlplane   <none>           <none>
     weave-net-7nj4h                        2/2     Running   0             22m   10.2.15.12   node01         <none>           <none>
     weave-net-q678m                        2/2     Running   1 (22m ago)   22m   10.2.15.9    controlplane   <none>           <none>
     ```


      ```
      One on every node
      ```
     </details>

  5. Identify the name of the bridge network/interface created by weave on each node

     - ens3
     - lo
     - docker0
     - weave

     Check the Solution

     <details>
     ```
     ip link
     1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
         link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
     2: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default 
         link/ether 02:42:4c:17:11:e5 brd ff:ff:ff:ff:ff:ff
     3: datapath: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1376 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
         link/ether 7e:d8:be:65:38:a8 brd ff:ff:ff:ff:ff:ff
     5: weave: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1376 qdisc noqueue state UP mode DEFAULT group default qlen 1000
         link/ether 5e:dd:2f:31:f4:37 brd ff:ff:ff:ff:ff:ff
     7: vethwe-datapath@vethwe-bridge: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1376 qdisc noqueue master datapath state UP mode DEFAULT group default 
         link/ether c6:92:c3:8e:ff:0b brd ff:ff:ff:ff:ff:ff
     8: vethwe-bridge@vethwe-datapath: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1376 qdisc noqueue master weave state UP mode DEFAULT group default 
         link/ether c2:86:e5:45:db:1e brd ff:ff:ff:ff:ff:ff
     9: vxlan-6784: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 65535 qdisc noqueue master datapath state UNKNOWN mode DEFAULT group default qlen 1000
         link/ether c6:98:d4:6d:bb:fb brd ff:ff:ff:ff:ff:ff
     11: vethwepl8973da0@if10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1376 qdisc noqueue master weave state UP mode DEFAULT group default 
         link/ether 3a:ec:04:1a:f8:29 brd ff:ff:ff:ff:ff:ff link-netnsid 2
     13: vethweplc30ddaa@if12: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1376 qdisc noqueue master weave state UP mode DEFAULT group default 
         link/ether 86:e6:ad:bf:69:3e brd ff:ff:ff:ff:ff:ff link-netnsid 3
     22719: eth0@if22720: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP mode DEFAULT group default 
         link/ether 02:42:0a:02:0f:09 brd ff:ff:ff:ff:ff:ff link-netnsid 0
     22721: eth1@if22722: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
         link/ether 02:42:ac:19:01:36 brd ff:ff:ff:ff:ff:ff link-netnsid 1
     ```


      ```
      weave
      ```
     </details>

  6. What is the POD IP address range configured by weave?

     - 192.68.X.X
     - 172.17.X.X
     - 172.18.X.X
     - 10.X.X.X

     Check the Solution

     <details>
     ```
     ip addr show weave 
     5: weave: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1376 qdisc noqueue state UP group default qlen 1000
         link/ether 5e:dd:2f:31:f4:37 brd ff:ff:ff:ff:ff:ff
         inet 10.50.0.1/16 brd 10.50.255.255 scope global weave
            valid_lft forever preferred_lft forever
     ```


      ```
      10.X.X.X
      ```
     </details>

  7. What is the default gateway configured on the PODs scheduled on node01?

     Try scheduling a pod on node01 and check ip route output

     - 192.168.1.1
     - 172.17.0.1
     - 172.18.1.1
     - 10.50.192.0

     Check the Solution

     <details>

     ```
     $ kubectl run busybox --image=busybox --dry-run=client -o yaml -- sleep 1000 > busybox.yaml
     ```

     Edit busybox.yaml

     ```
     apiVersion: v1
     kind: Pod
     metadata:
       creationTimestamp: null
       labels:
         run: busybox
       name: busybox
     spec:
       nodeName: node01        
       containers:
       - args:
         - sleep
         - "1000"
         image: busybox
         name: busybox
         resources: {}
       dnsPolicy: ClusterFirst
       restartPolicy: Always
     status: {}
     ```

     ```
     kubectl create -f busybox.yaml 
     ```

     ```
     kubectl exec busybox -- ip route
     default via 10.50.192.0 dev eth0 
     10.50.0.0/16 dev eth0 scope link  src 10.50.192.1 
     ```


      ```
      10.38.0.0
      ```
     </details>
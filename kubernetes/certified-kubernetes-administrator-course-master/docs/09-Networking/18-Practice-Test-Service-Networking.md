# Practice Test Service Networking

  - Take me to [Practice Test](https://kodekloud.com/topic/practice-test-service-networking/)

#### Solution 

  1. What network range are the nodes in the cluster part of?

     - 192.168.0.0/16
     - 172.17.0.0/16
     - 172.18.0.0/16
     - 10.32.0.0/12
     - 10.96.0.0/12
     - 10.0.0.0/24
     - 10.72.73.0/24

     Check the Solution

     <details>
     ```
     $ kubectl get nodes -o wide
     NAME           STATUS   ROLES                  AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION   CONTAINER-RUNTIME
     controlplane   Ready    control-plane,master   16m   v1.23.0   10.72.73.12   <none>        Ubuntu 18.04.6 LTS   5.4.0-1087-gcp   docker://19.3.0
     node01         Ready    <none>                 15m   v1.23.0   10.72.73.3    <none>        Ubuntu 18.04.6 LTS   5.4.0-1087-gcp   docker://19.3.0
     ```

     ```
     ip addr show eth0
     24824: eth0@if24825: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default 
         link/ether 02:42:0a:48:49:0c brd ff:ff:ff:ff:ff:ff link-netnsid 0
         inet 10.72.73.12/24 brd 10.72.73.255 scope global eth0
            valid_lft forever preferred_lft forever
     ```


      ```
      10.72.73.0/24
      ```
     </details>

  2. What is the range of IP addresses configured for PODs on this cluster?

     - 172.17.0.0/16
     - 10.0.0.0/12
     - 172.18.0.0/24
     - 10.50.0.0/16

     Check the Solution

     <details>
     The network is configured with weave. Check the weave pods logs using command `kubectl logs <weave-pod-name> weave -n kube-system` and look for ipalloc-range

     ```
     
     root@controlplane ~ ✖ kubectl logs -n kube-system weave-net-nxkk2 weave
     DEBU: 2022/09/07 23:55:16.964797 [kube-peers] Checking peer "1a:32:cd:c3:1e:1d" against list &{[]}
     Peer not in list; removing persisted data
     INFO: 2022/09/07 23:55:17.149004 Command line options: map[conn-limit:200 datapath:datapath db-prefix:/weavedb/weave-net docker-api: expect-npc:true http-addr:127.0.0.1:6784 ipalloc-init:consensus=1 ipalloc-range:10.50.0.0/16 metrics-addr:0.0.0.0:6782 name:1a:32:cd:c3:1e:1d nickname:controlplane no-dns:true no-masq-local:true port:6783]
     INFO: 2022/09/07 23:55:17.149083 weave  2.8.1
     INFO: 2022/09/07 23:55:18.147794 Bridge type is bridged_fastdp
     INFO: 2022/09/07 23:55:18.147826 Communication between peers is unencrypted.
     INFO: 2022/09/07 23:55:18.151710 Our name is 1a:32:cd:c3:1e:1d(controlplane)
     INFO: 2022/09/07 23:55:18.151774 Launch detected - using supplied peer list: [10.72.73.3]
     INFO: 2022/09/07 23:55:18.151818 Using "no-masq-local" LocalRangeTracker
     INFO: 2022/09/07 23:55:18.151828 Checking for pre-existing addresses on weave bridge
     INFO: 2022/09/07 23:55:18.224264 [allocator 1a:32:cd:c3:1e:1d] No valid persisted data
     INFO: 2022/09/07 23:55:18.229182 [allocator 1a:32:cd:c3:1e:1d] Initialising via deferred consensus
     INFO: 2022/09/07 23:55:18.229267 Sniffing traffic on datapath (via ODP)
     INFO: 2022/09/07 23:55:18.230808 ->[10.72.73.3:6783] attempting connection
     INFO: 2022/09/07 23:55:18.231421 ->[10.72.73.3:6783] error during connection attempt: dial tcp :0->10.72.73.3:6783: connect: connection refused
     INFO: 2022/09/07 23:55:18.232980 Listening for HTTP control messages on 127.0.0.1:6784
     INFO: 2022/09/07 23:55:18.233006 Listening for metrics requests on 0.0.0.0:6782
     INFO: 2022/09/07 23:55:18.525958 Error checking version: Get "https://checkpoint-api.weave.works/v1/check/weave-net?arch=amd64&flag_docker-version=none&flag_kernel-version=5.4.0-1087-gcp&os=linux&signature=Zc8QpqTP%2FbU%2FkbiGJ%2BwvQwf4kV1kHUH6Px6AGYzvmGU%3D&version=2.8.1": dial tcp: lookup checkpoint-api.weave.works on 10.96.0.10:53: write udp 172.25.0.21:54055->10.96.0.10:53: write: operation not permitted
     WARN: 2022/09/07 23:55:18.533952 [allocator]: Delete: no addresses for f70ca285b0ff75a60a9bce04482ac23e1ec551ab63674ea052d7379106929f0a
     INFO: 2022/09/07 23:55:19.168823 [kube-peers] Added myself to peer list &{[{1a:32:cd:c3:1e:1d controlplane}]}
     DEBU: 2022/09/07 23:55:19.176895 [kube-peers] Nodes that have disappeared: map[]
     INFO: 2022/09/07 23:55:19.242291 adding entry 10.50.0.0/16 to weaver-no-masq-local of 0
     INFO: 2022/09/07 23:55:19.242323 added entry 10.50.0.0/16 to weaver-no-masq-local of 0
     10.50.0.1
     DEBU: 2022/09/07 23:55:19.542549 registering for updates for node delete events
     WARN: 2022/09/07 23:55:19.633925 [allocator]: Delete: no addresses for 075614fa658513f6aca70419c877fd8d5bc4ce625e059b974543e4d6a44ca65c
     INFO: 2022/09/07 23:55:21.070559 ->[10.72.73.3:6783] attempting connection
     INFO: 2022/09/07 23:55:21.071145 ->[10.72.73.3:6783] error during connection attempt: dial tcp :0->10.72.73.3:6783: connect: connection refused
     INFO: 2022/09/07 23:55:23.569924 ->[10.72.73.3:46505] connection accepted
     INFO: 2022/09/07 23:55:23.571004 ->[10.72.73.3:46505|ea:dd:1b:ae:12:d0(node01)]: connection ready; using protocol version 2
     INFO: 2022/09/07 23:55:23.571155 overlay_switch ->[ea:dd:1b:ae:12:d0(node01)] using fastdp
     INFO: 2022/09/07 23:55:23.571192 ->[10.72.73.3:46505|ea:dd:1b:ae:12:d0(node01)]: connection added (new peer)
     INFO: 2022/09/07 23:55:23.672370 ->[10.72.73.3:46505|ea:dd:1b:ae:12:d0(node01)]: connection fully established
     INFO: 2022/09/07 23:55:23.673682 sleeve ->[10.72.73.3:6783|ea:dd:1b:ae:12:d0(node01)]: Effective MTU verified at 1388
     INFO: 2022/09/07 23:55:24.775815 adding entry 10.50.0.0/17 to weaver-no-masq-local of 0
     INFO: 2022/09/07 23:55:24.775847 added entry 10.50.0.0/17 to weaver-no-masq-local of 0
     INFO: 2022/09/07 23:55:24.776809 adding entry 10.50.128.0/18 to weaver-no-masq-local of 0
     INFO: 2022/09/07 23:55:24.776849 added entry 10.50.128.0/18 to weaver-no-masq-local of 0
     INFO: 2022/09/07 23:55:24.777730 deleting entry 10.50.0.0/16 from weaver-no-masq-local of 0
     INFO: 2022/09/07 23:55:24.777787 deleted entry 10.50.0.0/16 from weaver-no-masq-local of 0
     INFO: 2022/09/07 23:55:24.867991 Discovered remote MAC ea:dd:1b:ae:12:d0 at ea:dd:1b:ae:12:d0(node01)
     ```


      ```
      10.50.0.0/16
      ```
     </details>

  3. What is the IP Range configured for the services within the cluster?

     - 172.17.0.0/16
     - 10.32.0.0/12
     - 10.96.0.0/12
     - 10.96.0.0/24

     Check the Solution

     <details>
     Inspect the setting on kube-api server by running on comman

     ```
     $ cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep cluster-ip-range
         - --service-cluster-ip-range=10.96.0.0/12
     ```


      ```
      10.96.0.0/12
      ```
     </details>

  4. How many kube-proxy pods are deployed in this cluster?

     - 1
     - 2
     - 3
     - 4

     Check the Solution

     <details>
     Run the command: `kubectl get pods -n kube-system` and look for kube-proxy pods.

     ```
     $ kubectl get pods -n kube-system 
     NAME                                   READY   STATUS    RESTARTS      AGE
     coredns-64897985d-g8gd7                1/1     Running   0             29m
     coredns-64897985d-sknqj                1/1     Running   0             29m
     etcd-controlplane                      1/1     Running   0             29m
     kube-apiserver-controlplane            1/1     Running   0             29m
     kube-controller-manager-controlplane   1/1     Running   0             29m
     kube-proxy-f4b98                       1/1     Running   0             29m
     kube-proxy-qnwpn                       1/1     Running   0             29m
     kube-scheduler-controlplane            1/1     Running   0             29m
     weave-net-nxkk2                        2/2     Running   1 (29m ago)   29m
     weave-net-z2t9v                        2/2     Running   0             29m
     ```


      ```
      2
      ```
     </details>

  5. What type of proxy is the kube-proxy configured to use?

     - iptables
     - ipvs
     - firewalld
     - userspace

     Check the Solution

     <details>

     Check the logs of the kube-proxy pods. Run the command: 

     ```
     $ kubectl logs -n kube-system kube-proxy-f4b98 
     I0907 23:55:00.625277       1 proxier.go:657] "Failed to load kernel module with modprobe, you can ignore this message when kube-proxy is running inside container without mounting /lib/modules" moduleName="ip_vs_wrr"
     I0907 23:55:00.628430       1 proxier.go:657] "Failed to load kernel module with modprobe, you can ignore this message when kube-proxy is running inside container without mounting /lib/modules" moduleName="ip_vs_sh"
     I0907 23:55:00.675330       1 node.go:163] Successfully retrieved node IP: 10.72.73.12
     I0907 23:55:00.675368       1 server_others.go:138] "Detected node IP" address="10.72.73.12"
     I0907 23:55:00.675407       1 server_others.go:561] "Unknown proxy mode, assuming iptables proxy" proxyMode=""
     I0907 23:55:00.728436       1 server_others.go:206] "Using iptables Proxier"
     I0907 23:55:00.728469       1 server_others.go:213] "kube-proxy running in dual-stack mode" ipFamily=IPv4
     I0907 23:55:00.728476       1 server_others.go:214] "Creating dualStackProxier for iptables"
     I0907 23:55:00.728490       1 server_others.go:491] "Detect-local-mode set to ClusterCIDR, but no IPv6 cluster CIDR defined, , defaulting to no-op detect-local for IPv6"
     I0907 23:55:00.827252       1 server.go:656] "Version info" version="v1.23.0"
     I0907 23:55:00.851616       1 conntrack.go:52] "Setting nf_conntrack_max" nf_conntrack_max=1179648
     I0907 23:55:00.853975       1 config.go:317] "Starting service config controller"
     I0907 23:55:00.853975       1 config.go:226] "Starting endpoint slice config controller"
     I0907 23:55:00.854012       1 shared_informer.go:240] Waiting for caches to sync for service config
     I0907 23:55:00.854022       1 shared_informer.go:240] Waiting for caches to sync for endpoint slice config
     I0907 23:55:00.954628       1 shared_informer.go:247] Caches are synced for endpoint slice config 
     I0907 23:55:00.954679       1 shared_informer.go:247] Caches are synced for service config 
     ```


      ```
      iptables
      ```
     </details>

  6. How does this Kubernetes cluster ensure that a kube-proxy pod runs on all nodes in the cluster?

     Inspect the kube-proxy pods and try to identify how they are deployed

     - Using deployments
     - Using a custom script
     - Using daemonset
     - kubelet ensures this is done

  7. Check the Solution

     <details>
     ```
     $ kubectl get daemonsets.apps -n kube-system 
     NAME         DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
     kube-proxy   2         2         2       2            2           kubernetes.io/os=linux   38m
     weave-net    2         2         2       2            2           <none>                   38m
     ```


      ```
      using daemonset
      ```
     </details>


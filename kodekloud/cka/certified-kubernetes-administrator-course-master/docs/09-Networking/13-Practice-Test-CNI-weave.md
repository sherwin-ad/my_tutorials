# Practice Test - CNI weave

  - Take me to [Practice Test](https://kodekloud.com/topic/practice-test-cni-weave/)

#### Solution

  1. Check the Solution

     <details>
     ```
     ps -aux | grep kubelet | grep network-plugin=
     root        3649  0.0  0.0 4310152 92724 ?       Ssl  01:14   0:29 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config=/var/lib/kubelet/config.yaml --network-plugin=cni --pod-infra-container-image=k8s.gcr.io/pause:3.6
     ```


      ``` 
      CNI
      ```
     </details>

  2. Check the Solution

     <details>
     ```
     ls -l /opt/cni/bin/
     total 70496
     -rwxr-xr-x 1 root root  4159518 May 13  2020 bandwidth
     -rwxr-xr-x 1 root root  4671647 May 13  2020 bridge
     -rwxr-xr-x 1 root root 12124326 May 13  2020 dhcp
     -rwxr-xr-x 1 root root  5945760 May 13  2020 firewall
     -rwxr-xr-x 1 root root  3069556 May 13  2020 flannel
     -rwxr-xr-x 1 root root  4174394 May 13  2020 host-device
     -rwxr-xr-x 1 root root  3614480 May 13  2020 host-local
     -rwxr-xr-x 1 root root  4314598 May 13  2020 ipvlan
     -rwxr-xr-x 1 root root  3209463 May 13  2020 loopback
     -rwxr-xr-x 1 root root  4389622 May 13  2020 macvlan
     -rwxr-xr-x 1 root root  3939867 May 13  2020 portmap
     -rwxr-xr-x 1 root root  4590277 May 13  2020 ptp
     -rwxr-xr-x 1 root root  3392826 May 13  2020 sbr
     -rwxr-xr-x 1 root root  2885430 May 13  2020 static
     -rwxr-xr-x 1 root root  3356587 May 13  2020 tuning
     -rwxr-xr-x 1 root root  4314446 May 13  2020 vlan
     ```

     


      ```
      /opt/cni/bin
      ```
     </details>

  3. Check the Solution

     <details>
     ```
     ls -l /opt/cni/bin/
     total 70496
     -rwxr-xr-x 1 root root  4159518 May 13  2020 bandwidth
     -rwxr-xr-x 1 root root  4671647 May 13  2020 bridge
     -rwxr-xr-x 1 root root 12124326 May 13  2020 dhcp
     -rwxr-xr-x 1 root root  5945760 May 13  2020 firewall
     -rwxr-xr-x 1 root root  3069556 May 13  2020 flannel
     -rwxr-xr-x 1 root root  4174394 May 13  2020 host-device
     -rwxr-xr-x 1 root root  3614480 May 13  2020 host-local
     -rwxr-xr-x 1 root root  4314598 May 13  2020 ipvlan
     -rwxr-xr-x 1 root root  3209463 May 13  2020 loopback
     -rwxr-xr-x 1 root root  4389622 May 13  2020 macvlan
     -rwxr-xr-x 1 root root  3939867 May 13  2020 portmap
     -rwxr-xr-x 1 root root  4590277 May 13  2020 ptp
     -rwxr-xr-x 1 root root  3392826 May 13  2020 sbr
     -rwxr-xr-x 1 root root  2885430 May 13  2020 static
     -rwxr-xr-x 1 root root  3356587 May 13  2020 tuning
     -rwxr-xr-x 1 root root  4314446 May 13  2020 vlan
     ```


      ```
      cisco
      ```
     </details>

  4. Check the Solution

     <details>

     ```
     ls -l /etc/cni/net.d/
     total 4
     -rw-r--r-- 1 root root 292 Sep  7 01:15 10-flannel.conflist
     ```


      ```   
      weave
      ```
     </details>

  5. Check the Solution

     <details>

     ```
     
     root@controlplane ~ ➜  cat /etc/cni/net.d/10-flannel.conflist 
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
     
     
      ```
      weave-net
      ```
     </details>


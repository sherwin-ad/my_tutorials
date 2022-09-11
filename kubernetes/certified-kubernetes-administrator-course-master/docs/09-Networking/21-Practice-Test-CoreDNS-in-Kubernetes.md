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

     <details>
     ```
     kubectl get pods -n kube-system 
     NAME                                   READY   STATUS    RESTARTS   AGE
     coredns-74ff55c5b-8vvq2                1/1     Running   0          18m
     coredns-74ff55c5b-t755c                1/1     Running   0          18m
     etcd-controlplane                      1/1     Running   0          18m
     kube-apiserver-controlplane            1/1     Running   0          18m
     kube-controller-manager-controlplane   1/1     Running   0          18m
     kube-flannel-ds-5pntx                  1/1     Running   0          18m
     kube-proxy-2qnp7                       1/1     Running   0          18m
     kube-scheduler-controlplane            1/1     Running   0          18m
     ```


      ```
      CoreDNS
      ```
     </details>

  2. How many pods of the DNS server are deployed?

     - 1
     - 2
     - 3
     - 4

     Check the Solution

     <details>
     ```
     kubectl get deployments.apps -n kube-system 
     NAME      READY   UP-TO-DATE   AVAILABLE   AGE
     coredns   2/2     2            2           21m
     ```


      ```
      2
      ```
     </details>

Check the Solution

<details>
```
kubectl get pods -n kube-system 
NAME                                   READY   STATUS    RESTARTS   AGE
coredns-74ff55c5b-rxsw2                1/1     Running   0          61m
coredns-74ff55c5b-tqc9n                1/1     Running   0          61m
etcd-controlplane                      1/1     Running   0          62m
kube-apiserver-controlplane            1/1     Running   0          62m
kube-controller-manager-controlplane   1/1     Running   0          62m
kube-flannel-ds-c4dqc                  1/1     Running   0          61m
kube-proxy-zkk8p                       1/1     Running   0          61m
kube-scheduler-controlplane            1/1     Running   0          62m
```


```
 10.96.0.10
```
</details>

  3. What is the name of the service created for accessing CoreDNS?

     - core-service
     - dns-service
     - kube-service
     - kubernetes
     - kube-dns

     ```
     kubectl get service -n kube-system 
     NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
     kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   66m
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

     

5. Where is the configuration file located for configuring the CoreDNS service?

   - /root/Corefile
   - /etc/Corefile
   - /etc/coredns/Corefile
   - /var/coredns/Corefile
   - /etc/kubedns/Corefile

   Check the Solution
   
   Inspect the `Args` field of the coredns deployment and check the file used.
   
   ```
   kubectl describe -n kube-system deployments.apps coredns | grep -A2 Args
       Args:
         -conf
         /etc/coredns/Corefile
   ```
   
   


  5. How is the Corefile passed in to the CoreDNS POD?

     - Corefile comes built-in with CoreDNS pod
     - Stored on the kube master
     - pulled from git
     - Configured as a ConfigMap object

     Check the Solution

     <details>

      ```
      Configured as a ConfigMapObject
      ```
     </details>

  6. Check the Solution

     <details>

      ```
      CoreDNS
      ```
     </details>

  7. Check the Solution

     <details>

      ```
      coredns
      ```
     </details>

  8. Check the Solution

     <details>

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

  10. Check the Solution

      <details>

       ```
       web-service
       ```
      </details>

  11. Check the Solution

      <details>

       ```
       web-serivce.default.pod
       ```
      </details>

  12. Check the Solution

      <details>

       ```
       web-service.payroll
       ```
      </details>

  13. Check the Solution

      <details>

       ```
       web-service.payroll.svc.cluster
       ```
      </details>

  14. Check the Solution

      <details>

       ```
       kubectl edit deploy webapp
       
       Search for DB_Host and Change the DB_Host from mysql to mysql.payroll
       
       spec:
         containers:
         - env:
           - name: DB_Host
             value: mysql.payroll
       ```
      </details>

  15. Check the Solution

      <details>

       ```
       kubectl exec -it hr -- nslookup mysql.payroll > /root/nslookup.out
       ```
      </details>
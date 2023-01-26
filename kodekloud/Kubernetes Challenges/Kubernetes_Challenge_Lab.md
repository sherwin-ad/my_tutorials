# Kubernetes Challenge

## Challenge 1

![image-20230124121743696](images/image-20230124121743696.png)

Deploy the given architecture diagram for implementing a `Jekyll SSG`.

Click on each icon to see more details. Once done click on the `Check` button to test your work.

1. jelly-pv

   - jekyll-site pv is already created. Inspect it before you create the pvc.

   Nothing to do here. The PV is pre-created.

   Check persistent volume

   ```
   root@controlplane ~ ➜  kubectl get pv
   NAME          CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS    REASON   AGE
   jekyll-site   1Gi        RWX            Delete           Available           local-storage            29m
   ```

   

2. jekyll-pvc

   jekyll-pvc.yaml

   ```
   apiVersion: v1
   kind: PersistentVolumeClaim
   metadata:
     name: jekyll-site
     namespace: development
   spec:
     accessModes:
       - ReadWriteMany
     storageClassName: local-storage
     resources:
       requests:
         storage: 1Gi
   ```

   ```
   root@controlplane ~ ✖ kubectl create -f jekyll-pvc.yaml 
   
   root@controlplane ~ ➜  kubectl get pvc -n development 
   NAME          STATUS   VOLUME        CAPACITY   ACCESS MODES   STORAGECLASS    AGE
   jekyll-site   Bound    jekyll-site   1Gi        RWX            local-storage   18s
   ```

3. jekyll

   - 
     Tasks not completed!

   - pod: 'jekyll' has an initContainer, name: 'copy-jekyll-site', image: 'kodekloud/jekyll'
   - initContainer: 'copy-jekyll-site', command: [ "jekyll", "new", "/site" ] (command to run: jekyll new /site)
   - pod: 'jekyll', initContainer: 'copy-jekyll-site', mountPath = '/site'
   - pod: 'jekyll', initContainer: 'copy-jekyll-site', volume name = 'site'
   - pod: 'jekyll', container: 'jekyll', volume name = 'site'
   - pod: 'jekyll', container: 'jekyll', mountPath = '/site'
   - pod: 'jekyll', container: 'jekyll', image = 'kodekloud/jekyll-serve'
   - pod: 'jekyll', uses volume called 'site' with pvc = 'jekyll-site'
   - pod: 'jekyll' uses label 'run=jekyll'

   ```
   kubectl run jekyll --image=kodekloud/jekyll-serve -namespace=development --dry-run=client -o yaml > jekyll-pod.yaml
   
   ```

   

   jekyll-pod.yaml

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     namespace: development
     name: jekyll
     labels:
       run: jekyll
   spec: 
     containers:
     - name: jekyll
       image: kodekloud/jekyll-serve
       volumeMounts:
       - mountPath: /site
         name: site  
     initContainers:
     - name: copy-jekyll-site
       image: kodekloud/jekyll
       command: [ "jekyll", "new", "/site" ]
       volumeMounts:
       - mountPath: /site
         name: site
     volumes:
     - name: site
       persistentVolumeClaim:
         claimName: jekyll-site
   ```

   ```
   root@controlplane ~ ➜  kubectl create -f jekyll-pod.yaml 
   ```

   ```
   root@controlplane ~ ➜  kubectl describe -n development pods jekyll 
   Name:         jekyll
   Namespace:    development
   Priority:     0
   Node:         node01/10.26.115.9
   Start Time:   Tue, 24 Jan 2023 08:51:16 +0000
   Labels:       run=jekyll
   Annotations:  <none>
   Status:       Running
   IP:           10.244.192.2
   IPs:
     IP:  10.244.192.2
   Init Containers:
     copy-jekyll-site:
       Container ID:  docker://4c16324db6a16fd703ce62ae29f39f89ef8be9028bbb9bbc61081f17c021b0fa
       Image:         kodekloud/jekyll
       Image ID:      docker-pullable://kodekloud/jekyll@sha256:e7776dd75bf813e7da2e76badecd9bfadf1e7893fe0d588cc552ea090594e00f
       Port:          <none>
       Host Port:     <none>
       Command:
         jekyll
         new
         /site
       State:          Terminated
         Reason:       Completed
         Exit Code:    0
         Started:      Tue, 24 Jan 2023 08:51:31 +0000
         Finished:     Tue, 24 Jan 2023 08:51:44 +0000
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /site from site (rw)
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-7ks4c (ro)
   Containers:
     jekyll:
       Container ID:   docker://501cd77d991b772e27425d4419a4d699322fc429bbb2b4bb0123553d2d2da56d
       Image:          kodekloud/jekyll-serve
       Image ID:       docker-pullable://kodekloud/jekyll-serve@sha256:5e2be6d03d137e9a724624118b2567931aff94e33ae9dabed34dc2626772e8be
       Port:           <none>
       Host Port:      <none>
       State:          Running
         Started:      Tue, 24 Jan 2023 08:51:46 +0000
       Ready:          True
       Restart Count:  0
       Environment:    <none>
       Mounts:
         /site from site (rw)
         /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-7ks4c (ro)
   Conditions:
     Type              Status
     Initialized       True 
     Ready             True 
     ContainersReady   True 
     PodScheduled      True 
   Volumes:
     site:
       Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
       ClaimName:  jekyll-site
       ReadOnly:   false
   ```

   

4. jekyll-node-service

   - Service 'jekyll' uses targetPort: '4000', namespace: 'development'
   - Service 'jekyll' uses Port: '8080', namespace: 'development'
   - Service 'jekyll' uses NodePort: '30097', namespace: 'development'

   ```
   root@controlplane ~ ✖ kubectl expose pod jekyll --namespace=development --name=jekyll --target-port=4000 --port=8080 --type=NodePort
   ```

   ```
   root@controlplane ~ ➜  kubectl describe svc jekyll  -n development 
   Name:                     jekyll
   Namespace:                development
   Labels:                   run=jekyll
   Annotations:              <none>
   Selector:                 run=jekyll
   Type:                     NodePort
   IP Family Policy:         SingleStack
   IP Families:              IPv4
   IP:                       10.108.206.5
   IPs:                      10.108.206.5
   Port:                     <unset>  8080/TCP
   TargetPort:               4000/TCP
   NodePort:                 <unset>  30415/TCP
   Endpoints:                10.244.192.2:4000
   Session Affinity:         None
   External Traffic Policy:  Cluster
   Events:                   <none>
   ```

   Edit "jekyll" service and change the nodePort to "30067" 

   ```
   root@controlplane ~ ➜  kubectl edit --namespace=development svc jekyll 
   ```

   

   OR

   jekyll-node-service.yaml

   ```
   apiVersion: v1
   kind: Service
   metadata:
     namespace: development
     name: jekyll
   spec:
     type: NodePort
     ports:
       - port: 8080
         targetPort: 4000
         nodePort: 30097
     selector:
       run: jekyll
   ```

   

5. developer-role

   - 'developer-role', should have all(*) permissions for services in development namespace
   - 'developer-role', should have all permissions(*) for persistentvolumeclaims in development namespace
   - 'developer-role', should have all(*) permissions for pods in development namespace

   ```
   root@controlplane ~ ➜  kubectl create role developer-role --namespace=development --resource=pods,pvc,svc --verb="*" 
   
   root@controlplane ~ ➜  kubectl get role -n development 
   NAME             CREATED AT
   developer-role   2023-01-24T09:34:30Z
   
   root@controlplane ~ ➜  kubectl describe --namespace=development role developer-role 
   Name:         developer-role
   Labels:       <none>
   Annotations:  <none>
   PolicyRule:
     Resources               Non-Resource URLs  Resource Names  Verbs
     ---------               -----------------  --------------  -----
     persistentvolumeclaims  []                 []              [*]
     pods                    []                 []              [*]
     services                []                 []              [*]
   ```

   OR 

   developer-role.yaml

   ```
   apiVersion: rbac.authorization.k8s.io/v1
   kind: Role
   metadata:
     creationTimestamp: null
     name: developer-role
     namespace: development
   rules:
   - apiGroups:
     - ""
     resources:
     - pods
     - services
     - persistentvolumeclaims
     verbs:
     - '*'
   ```

   

6. developer-rolebinding

   - 
     create rolebinding = developer-rolebinding, role= 'developer-role', namespace = development
   - rolebinding = developer-rolebinding associated with user = 'martin'

   ```
   root@controlplane ~ ➜  kubectl create rolebinding developer-rolebinding --role=developer-role --user=martin --namespace=development 
   rolebinding.rbac.authorization.k8s.io/developer-rolebinding created
   
   root@controlplane ~ ➜  kubectl get rolebindings.rbac.authorization.k8s.io -n  development 
   NAME                    ROLE                  AGE
   developer-rolebinding   Role/developer-role   18s
   
   root@controlplane ~ ➜  kubectl describe -n development rolebindings.rbac.authorization.k8s.io developer-rolebinding 
   Name:         developer-rolebinding
   Labels:       <none>
   Annotations:  <none>
   Role:
     Kind:  Role
     Name:  developer-role
   Subjects:
     Kind  Name    Namespace
     ----  ----    ---------
     User  martin  
   ```

   OR

   developer-rolebinding.yaml

   ```
   apiVersion: rbac.authorization.k8s.io/v1
   kind: RoleBinding
   metadata:
     creationTimestamp: null
     name: developer-rolebinding
     namespace: development
   roleRef:
     apiGroup: rbac.authorization.k8s.io
     kind: Role
     name: developer-role
   subjects:
   - apiGroup: rbac.authorization.k8s.io
     kind: User
     name: martin
   ```

   

7. kube-config

   - set context 'developer' with user = 'martin' and cluster = 'kubernetes' as the current context.

   ```
   root@controlplane ~ ➜  kubectl config set-credentials martin --client-certificate ./martin.crt --client-key ./martin.key 
   User "martin" set.
   
   root@controlplane ~ ➜  kubectl config set-context developer --cluster kubernetes --user martin
   Context "developer" created.
   ```

   

   ```
   kubectl config set-credentials martin --client-certificate ./martin.crt --client-key ./martin.key
   
   kubectl config set-context developer --cluster kubernetes --user martin
   ```

   

8. martin

   - 
     Build user information for martin in the default kubeconfig file: User = martin , client-key = /root/martin.key and client-certificate = /root/martin.crt
   - Create a new context called 'developer' in the default kubeconfig file with 'user = martin' and 'cluster = kubernetes'

   ```
   root@controlplane ~ ➜  kubectl config use-context developer 
   Switched to context "developer".
   ```

   ```
   kubectl config use-context developer
   ```



## Challenge 2

![image-20230124185745940](images/image-20230124185745940.png)

This 2-Node Kubernetes cluster is broken! Troubleshoot, fix the cluster issues and then deploy the objects according to the given architecture diagram to unlock our `Image Gallery`!!

Click on each icon to see more details. Once done click on `Check` button to test your work.

1. controlplane

   - 
     Master node: coredns deployment has image: 'k8s.gcr.io/coredns/coredns:v1.8.6'
   - Fix kube-apiserver. Make sure its running and healthy.
   - kubeconfig = /root/.kube/config, User = 'kubernetes-admin' Cluster: Server Port = '6443'

   Fix the controlplane node. This has three subtasks. The order to do them is atucally the *reverse* order in which they are listed!

   1. kubeconfig = /root/.kube/config, User = 'kubernetes-admin' Cluster: Server Port = '6443'

      Before we can execute any `kubectl` commands, we must fix the kubeconfig. The server port is incorrect and should be `6443`. Edit this in `vi` and save.

      Check nodes

      ```
      root@controlplane ~ ➜  kubectl get nodes
      The connection to the server controlplane:6433 was refused - did you specify the right host or port?
      ```

      Edit kubeconfig server port is incorrect and should be `6443`

      ```
      root@controlplane ~ ➜  vim .kube/config 
      ```

      .kube/config

      ```
      apiVersion: v1
      clusters:
      - cluster:
      apiVersion: v1
      clusters:
      - cluster:
          certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJek1ERXlOREl4TlRnek5Gb1hEVE16TURFeU1USXhOVGd6TkZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTGlPCkdkQ2hwa1hNZmZldW5BdnYzRnA2RjkyS2l4bDg3WUt3SjJiYUFrRHVMZ3VGU2pXYUk4aFBueTBjYjYvUkFCV2QKZlFEcEJ4dURGQ3B4cWt5K3lvR29hQW1OKytwRjJUbHB6RGFaa1R1UmJqU3JwZ3RLeDNMQ2Fic296WXBSaHRNRQpFam0yMXBJcXV1bmYxSE5ZeWVrUk9Fc3ZMNXdSbmQ4WDRGeG9Qb3VpS0RFcGE1MEh5ZkgvWnc3eG9kTU9aK0RxCnVaeHNrMUVOenM1SHZ4STZpQzNmRUhHNnl0RHRQNmdZY1M0K2RTN3NyOWs1MGV3MlBrOUpxMjJVRER1UFlkSW4KYUdXOUw2dDFmdGxDTmRhd0JsSWU3eVNrYkVuVmQ2RG8xSU53a3l2QnJMMTYrUVV6cW1PT2xyUGNwd2JCbnJxRgpLU0d2alFQR1YxMkc0Wk12NTZzQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZFVkJKY09EMGZpSFBvcU1iamIranBJckpydXpNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBR09ma3NSWUkxS0hFd2tydFh5YQpqUnh5SVFaa3pmV25pZzZHQ1UzSUdHK1JMYS80VllTd1pZUHJDZGdVc2RPbUZNNGpobnVmcFluYWhNeTZmUlVWCnAzQVA4cXQrdEwzdCtuR1d6N09obTU3YmJyUFlEc3F6dVNDZUhBaTlUTVZDUzJhNCsvTjdTV2lZeGhRMFZJb2gKVlNRZG03RVQzVDhKVmQ1KzNUMTF0ZkxCMlZJVlE4QVk3OUZwOU44bTczQnd1SUNTdDRKcEFRVXd6RXJqeTBBcApZdFRmbkw2cUlNaVVjL2JUTCtMRVhQR01OVlJmN0FMbk1zVHpQa2V1aFNuVnA1MTc5cVdOYUxhZkxVZ0tsTmlHCkczYnU5REJ5dVNzZTdzZXd3aVNIK1V3bmJDbE0yUk5OTXltdDRUazBxRmNGQ3dKZGpJNCsvNFZHTDgvV2s2NUYKbW9ZPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
          server: https://controlplane:6443
      ```

      

   2. Fix kube-apiserver. Make sure its running and healthy.

      The file referenced by the `--client-ca-file` argument to the API server doesn't exist. Edit the API server manisfest and correct this.

      ```
      ls -l /etc/kubernetes/pki/*.crt
      # Notice that the correct certificate is ca.crt
      vi /etc/kubernetes/manifests/kube-apiserver.yaml
      ```

      ```
      root@controlplane ~ ➜  ls -l /etc/kubernetes/pki/*.crt
      -rw-r--r-- 1 root root 1289 Jan 24 21:58 /etc/kubernetes/pki/apiserver.crt
      -rw-r--r-- 1 root root 1155 Jan 24 21:58 /etc/kubernetes/pki/apiserver-etcd-client.crt
      -rw-r--r-- 1 root root 1164 Jan 24 21:58 /etc/kubernetes/pki/apiserver-kubelet-client.crt
      -rw-r--r-- 1 root root 1099 Jan 24 21:58 /etc/kubernetes/pki/ca.crt
      -rw-r--r-- 1 root root 1115 Jan 24 21:58 /etc/kubernetes/pki/front-proxy-ca.crt
      -rw-r--r-- 1 root root 1119 Jan 24 21:58 /etc/kubernetes/pki/front-proxy-client.crt
      ```

      Edit /etc/kubernetes/manifests/kube-apiserver.yaml 

      - change the `--client-ca-file` 

      ```
      apiVersion: v1
      kind: Pod
      metadata:
        annotations:
          kubeadm.kubernetes.io/kube-apiserver.advertise-address.endpoint: 10.88.254.9:6443
        creationTimestamp: null
        labels:
          component: kube-apiserver
          tier: control-plane
        name: kube-apiserver
        namespace: kube-system
      spec:
        containers:
        - command:
          - kube-apiserver
          - --advertise-address=10.88.254.9
          - --allow-privileged=true
          - --authorization-mode=Node,RBAC
          - --client-ca-file=/etc/kubernetes/pki/ca.crt
      ```

      

      Now wait for the API server to restart. This may take a minute or so. You can run the following to check if the container has been created. Press `CTRL-C` to eacape from the following command.

      ```
      root@controlplane ~ ➜  watch docker ps
      ```

      ```
      Every 2.0s: docker ps                                                                                                           controlplane: Tue Jan 24 23:28:55 2023
      
      CONTAINER ID        IMAGE                  COMMAND                  CREATED              STATUS              PORTS               NAMES
      1fe91ea81d9c        k8s.gcr.io/pause:3.6   "/pause"                 22 seconds ago       Up 21 seconds                           k8s_POD_kube-apiserver-controlplane_k
      ube-system_0d5d264e19c767124cd456882303b9c7_0
      ```

      

      If it still hasn't started, then give it a nudge by restarting the kubelet.

      ```
      systemctl restart kubelet
      ```

      ```
      root@controlplane ~ ➜  watch docker ps
      ```

      ```
      Every 2.0s: docker ps                                                                                                           controlplane: Tue Jan 24 23:30:02 2023
      
      CONTAINER ID        IMAGE                  COMMAND                  CREATED              STATUS              PORTS               NAMES
      d87169ff1323        e6bf5ddd4098           "kube-apiserver --ad…"   16 seconds ago       Up 15 seconds                           k8s_kube-apiserver_kube-apiserver-con
      ```

      ```
      root@controlplane ~ ➜  kubectl get nodes
      NAME           STATUS                     ROLES                  AGE   VERSION
      controlplane   Ready                      control-plane,master   92m   v1.23.0
      node01         Ready,SchedulingDisabled   <none>                 91m   v1.23.0
      ```

      

      ...then run the docker command again. If you see it starting and stopping, then you've made an error in the manifest that you need to fix.

      You should also be aware of how to [diagnose a crashed API server](https://github.com/kodekloudhub/community-faq/blob/main/docs/diagnose-crashed-apiserver.md).

   3. Master node: coredns deployment has image: 'k8s.gcr.io/coredns/coredns:v1.8.6'

      Run the following:

      ```
      root@controlplane ~ ➜  kubectl get pods -n kube-system 
      NAME                                   READY   STATUS             RESTARTS        AGE
      coredns-7b945bfcb7-nz7zt               0/1     ImagePullBackOff   0               33m
      coredns-7b945bfcb7-zf5cj               0/1     ImagePullBackOff   0               33m
      etcd-controlplane                      1/1     Running            0               93m
      kube-apiserver-controlplane            1/1     Running            1 (3m41s ago)   93m
      kube-controller-manager-controlplane   1/1     Running            2 (4m ago)      93m
      kube-proxy-hmbx6                       1/1     Running            0               92m
      kube-proxy-wbkjb                       1/1     Running            0               93m
      kube-scheduler-controlplane            1/1     Running            1 (33m ago)     93m
      weave-net-gq9k7                        2/2     Running            0               92m
      weave-net-pkx7t                        2/2     Running            1 (93m ago)     93m
      ```

      You will see that CoreDNS has ImagePull errors, because the container imange is incorrect. To fix this, run the following, update the `image:` to that specificed in the question, save and exit

      ```
      kubectl edit deployment -n kube-system coredns
      ```

      ---- OR ----

      Edit the image directly

      ```
      root@controlplane ~ ✖ kubectl set image deployment/coredns -n kube-system coredns=k8s.gcr.io/coredns/coredns:v1.8.6
      deployment.apps/coredns image updated
      ```

      Now re-run the `get pods` command above (or use `watch` with it) until the coredns pods have recycled and there are two healthy pods.

2. node01

   - node01 is ready and can schedule pods?

   node01 is ready and can schedule pods? Run the following:

   ```
   kubectl get nodes
   ```

   We can see that `node01` is in state `Ready,SchedulingDisabled`. This usually means that it is cordoned, so...

   ```
   kubectl uncordon node01
   ```

3. web

   - Copy all images from the directory '/media' on the controlplane node to '/web' directory on node01

   Copy all images from the directory '/media' on the controlplane node to '/web' directory on node01. Here we are setting up the content of the directory on `node01` which will ultimately be served as a hostpath persistent volume. It's a straght forward copy with ssh (scp).

   ```
   scp /media/* node01:/web
   ```

4. data-pv

   - Create new PersistentVolume = 'data-pv'
   - PersistentVolume = data-pv, accessModes = 'ReadWriteMany'
   - PersistentVolume = data-pv, hostPath = '/web'
   - PersistentVolume = data-pv, storage = '1Gi'

   Create new PersistentVolume = 'data-pv'.
   Apply the [manifest](https://github.com/kodekloudhub/kubernetes-challenges/blob/master/challenge-2/fileserver-pv.yaml) with `kubectl apply -f`

   fileserver-pv.yaml

   ```
   kind: PersistentVolume
   apiVersion: v1
   metadata:
       name: data-pv
   spec:
      accessModes: ["ReadWriteMany"]
      capacity:
       storage: 1Gi
      hostPath:
         path: /web
         type: DirectoryOrCreate
   ```

5. data-pvc

   - Create new PersistentVolumeClaim = 'data-pvc'
   - PersistentVolume = 'data-pvc', accessModes = 'ReadWriteMany'
   - PersistentVolume = 'data-pvc', storage request = '1Gi'
   - PersistentVolume = 'data-pvc', volumeName = 'data-pv'

   Create new PersistentVolumeClaim = 'data-pvc'
   Apply the [manifest](https://github.com/kodekloudhub/kubernetes-challenges/blob/master/challenge-2/fileserver-pvc.yaml)

   fileserver-pvc.yaml

   ```
   kind: PersistentVolumeClaim
   apiVersion: v1
   metadata:
       name: data-pvc
   spec:
      accessModes: ["ReadWriteMany"]
      resources:
       requests:
          storage: 1Gi
      volumeName: data-pv
   ```

6. gop-fileserver

   - Create a pod for fileserver, name: 'gop-fileserver'
   - pod: gop-fileserver image: 'kodekloud/fileserver'
   - pod: gop-fileserver mountPath: '/web'
   - pod: gop-fileserver volumeMount name: 'data-store'
   - pod: gop-fileserver persistent volume name: data-store
   - pod: gop-fileserver persistent volume claim used: 'data-pvc'

   Create a pod for fileserver, name: 'gop-fileserver'
   Apply the [manifest](https://github.com/kodekloudhub/kubernetes-challenges/blob/master/challenge-2/fileserver-pod.yaml)

   fileserver-pod.yaml

   ```
   ---
   apiVersion: v1
   kind: Pod
   metadata:
     creationTimestamp: null
     labels:
       run: gop-fileserver
     name: gop-fileserver
   spec:
     volumes:
     - name: data-store
       persistentVolumeClaim:
         claimName: data-pvc
     containers:
     - image: kodekloud/fileserver
       imagePullPolicy: IfNotPresent
       name: gop-fileserver
       volumeMounts:
          - name: data-store
            mountPath: /web
     dnsPolicy: ClusterFirst
     restartPolicy: Never
   ```

7. gop-fs-service

   - New Service, name: 'gop-fs-service'
   - Service name: gop-fs-service, port: '8080'
   - Service name: gop-fs-service, targetPort: '8080'

   New Service, name: 'gop-fs-service'
   Apply the [manifest](https://github.com/kodekloudhub/kubernetes-challenges/blob/master/challenge-2/fileserver-svc.yaml)

   fileserver-svc.yaml

   ```
   ---
   apiVersion: v1
   kind: Service
   metadata:
     creationTimestamp: null
     labels:
       app: gop-fs-service
     name: gop-fs-service
   spec:
     ports:
     - name: 8080-8080
       port: 8080
       protocol: TCP
       targetPort: 8080
       nodePort: 31200
     selector:
       run: gop-fileserver
     type: NodePort
   ```

   


# Practice Test - Install kubernetes cluster using kubeadm tool

  - Take me to [Practice Test](https://kodekloud.com/topic/practice-test-deploy-a-kubernetes-cluster-using-kubeadm/)

# Solutions for practice test - Install Using Kubeadm

  1. Install the `kubeadm` and `kubelet` packages on the `controlplane` and `node01`.

     Use the exact version of `1.23.0-00` for both.

     Check

     - kubeadm installed on controlplane ?
     - kubelet installed on controlplane?
     - Kubeadm installed on worker node01 ?
     - Kubelet installed on worker node01 ?

     Check the solution

     <details>
     ```
     root@controlplane ~ ➜ ip addr
     1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
         link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
         inet 127.0.0.1/8 scope host lo
            valid_lft forever preferred_lft forever
     2: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
         link/ether 02:42:6c:3c:e2:ed brd ff:ff:ff:ff:ff:ff
         inet 172.12.0.1/24 brd 172.12.0.255 scope global docker0
            valid_lft forever preferred_lft forever
     3: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1400 qdisc noqueue state UNKNOWN group default 
         link/ether 22:c9:56:14:c0:44 brd ff:ff:ff:ff:ff:ff
         inet 10.244.0.0/32 brd 10.244.0.0 scope global flannel.1
            valid_lft forever preferred_lft forever
     4: cni0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
         link/ether 66:32:d6:8b:d8:fa brd ff:ff:ff:ff:ff:ff
         inet 10.244.0.1/24 brd 10.244.0.255 scope global cni0
            valid_lft forever preferred_lft forever
     104: eth0@if105: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default 
         link/ether 02:42:0a:49:99:08 brd ff:ff:ff:ff:ff:ff link-netnsid 0
         inet 10.73.153.8/24 brd 10.73.153.255 scope global eth0
            valid_lft forever preferred_lft forever
     166: eth1@if167: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
         link/ether 02:42:ac:19:00:1c brd ff:ff:ff:ff:ff:ff link-netnsid 1
         inet 172.25.0.28/24 brd 172.25.0.255 scope global eth1
            valid_lft forever preferred_lft forever
     
     root@controlplane ~ ➜  sudo cat /sys/class/dmi/id/product_uuid
     d7d27782-b05e-8317-317e-c551192fe670
     ```

     

     ```
     root@controlplane ~ ➜  ssh node01
     
     root@node01 ~ ➜  ip addr
     1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
         link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
         inet 127.0.0.1/8 scope host lo
            valid_lft forever preferred_lft forever
     2: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
         link/ether 02:42:30:12:e1:38 brd ff:ff:ff:ff:ff:ff
         inet 172.12.0.1/24 brd 172.12.0.255 scope global docker0
            valid_lft forever preferred_lft forever
     3: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1400 qdisc noqueue state UNKNOWN group default 
         link/ether 6a:06:71:d9:a4:e0 brd ff:ff:ff:ff:ff:ff
         inet 10.244.1.0/32 brd 10.244.1.0 scope global flannel.1
            valid_lft forever preferred_lft forever
     88: eth0@if89: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default 
         link/ether 02:42:0a:49:99:0a brd ff:ff:ff:ff:ff:ff link-netnsid 0
         inet 10.73.153.10/24 brd 10.73.153.255 scope global eth0
            valid_lft forever preferred_lft forever
     148: eth1@if149: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
         link/ether 02:42:ac:19:00:16 brd ff:ff:ff:ff:ff:ff link-netnsid 1
         inet 172.25.0.22/24 brd 172.25.0.255 scope global eth1
            valid_lft forever preferred_lft forever
     
     root@node01 ~ ➜  sudo cat /sys/class/dmi/id/product_uuid
     d7d27782-b05e-8317-317e-3adb048f43d5
     ```

     Follow the steps in the official documentation.

     These steps have to be performed on both nodes.

     1. `set net.bridge.bridge-nf-call-iptables to 1`:

     ```sh
     cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
     br_netfilter
     EOF
     
     cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
     net.bridge.bridge-nf-call-ip6tables = 1
     net.bridge.bridge-nf-call-iptables = 1
     EOF
     
     sudo sysctl --system
     ```


      ```
      sudo apt-get update 
      
      sudo apt-get install -y apt-transport-https curl
      
      sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
      
      echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
      
      sudo apt-get update
      
      sudo apt-get install -y kubelet=1.23.0-00 kubeadm=1.23.0-00 kubectl=1.23.0-00
      
      sudo apt-mark hold kubelet kubeadm kubectl
      ```
     </details>

  2. What is the version of `kubelet` installed?

     - 1.19
     - 1.18
     - 1.22.5
     - 1.23.0

     Check the solution

     <details>

      ```
      ➜  kubelet --version
      Kubernetes v1.23.0
      ```
     </details>

  3. How many nodes are part of kubernetes cluster currently?

     Are you able to run `kubectl get nodes`?

     - 0
     - 4
     - 2
     - 1

     Check the solution

     <details>

      ```
      0
      ```
     </details>

  4. Click on **`OK`**

  5. Initialize `Control Plane Node (Master Node)`. Use the following options:

     1. `apiserver-advertise-address` - Use the IP address allocated to eth0 on the controlplane node
     2. `apiserver-cert-extra-sans` - Set it to `controlplane`
     3. `pod-network-cidr` - Set to `10.244.0.0/16`

     Once done, set up the `default kubeconfig` file and wait for node to be part of the cluster.

     Check the solution

     <details>
     ```
     ip addr
     1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
         link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
         inet 127.0.0.1/8 scope host lo
            valid_lft forever preferred_lft forever
     2: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
         link/ether 02:42:6c:3c:e2:ed brd ff:ff:ff:ff:ff:ff
         inet 172.12.0.1/24 brd 172.12.0.255 scope global docker0
            valid_lft forever preferred_lft forever
     3: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1400 qdisc noqueue state UNKNOWN group default 
         link/ether 22:c9:56:14:c0:44 brd ff:ff:ff:ff:ff:ff
         inet 10.244.0.0/32 brd 10.244.0.0 scope global flannel.1
            valid_lft forever preferred_lft forever
     4: cni0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
         link/ether 66:32:d6:8b:d8:fa brd ff:ff:ff:ff:ff:ff
         inet 10.244.0.1/24 brd 10.244.0.255 scope global cni0
            valid_lft forever preferred_lft forever
     104: eth0@if105: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default 
         link/ether 02:42:0a:49:99:08 brd ff:ff:ff:ff:ff:ff link-netnsid 0
         inet 10.73.153.8/24 brd 10.73.153.255 scope global eth0
            valid_lft forever preferred_lft forever
     166: eth1@if167: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
         link/ether 02:42:ac:19:00:1c brd ff:ff:ff:ff:ff:ff link-netnsid 1
         inet 172.25.0.28/24 brd 172.25.0.255 scope global eth1
            valid_lft forever preferred_lft forever
     ```


      ```
      kubeadm init --apiserver-cert-extra-sans=controlplane --apiserver-advertise-address 10.73.153.8 --pod-network-cidr=10.244.0.0/16
      ```
     ```
     Your Kubernetes control-plane has initialized successfully!
     
     To start using your cluster, you need to run the following as a regular user:
     
       mkdir -p $HOME/.kube
       sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
       sudo chown $(id -u):$(id -g) $HOME/.kube/config
     
     Alternatively, if you are the root user, you can run:
     
       export KUBECONFIG=/etc/kubernetes/admin.conf
     
     You should now deploy a pod network to the cluster.
     Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
       https://kubernetes.io/docs/concepts/cluster-administration/addons/
     
     Then you can join any number of worker nodes by running the following on each as root:
     
     kubeadm join 10.73.153.8:6443 --token 7xznkj.u8upf4myzcoobu3i \
             --discovery-token-ca-cert-hash sha256:eb455e1ec6b3790764fb7a01ce5179606337b368b13646472a4d4afca7a96179 
     ```

     ```
     mkdir -p $HOME/.kube
     sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
     sudo chown $(id -u):$(id -g) $HOME/.kube/config
     ```

     

     </details>

  6. Click on **`OK`**

  7. Join `node01` to the cluster using the join token

     ```
     sudokubeadm join 10.73.153.8:6443 --token 7xznkj.u8upf4myzcoobu3i \
             --discovery-token-ca-cert-hash sha256:eb455e1ec6b3790764fb7a01ce5179606337b368b13646472a4d4afca7a96179
     ```

     

     Click on **`Check`** 

  8. Install a Network Plugin. As a default, we will go with `flannel`

     Refer to the official documentation for the procedure.

     Check the solution

     <details>

      ```
      kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
      ```
     </details>






[TOC]



# Kubernetes Setup and Configuration



# Ubuntu

## 1. Verify the MAC address and product_uuid are unique for every node[ ](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#verify-mac-address)

- You can get the MAC address of the network interfaces using the command `ip link` or `ifconfig -a`
- The product_uuid can be checked by using the command `sudo cat /sys/class/dmi/id/product_uuid`

 ```
$ ip link 
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:0a:35:c3 brd ff:ff:ff:ff:ff:ff
3: ens34: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:0a:35:cd brd ff:ff:ff:ff:ff:ff

$ sudo cat /sys/class/dmi/id/product_uuid
1b5d4d56-321c-906b-ac36-9c33720a35c3
 ```



## 2. Set hostname and add entries in the hosts file

Login to to master node and set hostname using hostnamectl command,

```
$ sudo hostnamectl set-hostname "kube-master"
```

On the worker nodes, run



```
$ sudo hostnamectl set-hostname "kube-node1"   // 1st worker node
$ sudo hostnamectl set-hostname "kube-node2"   // 2nd worker node
$ exec bash
```

Add the following entries in /etc/hosts file on each node

```
172.16.1.2  kube-master
172.16.1.3  kube-node1
172.16.1.4	kube-node2
```



## 3. Disable swap & add kernel settings

Execute beneath swapoff and sed command to disable swap. Make sure to run the following commands on all the nodes.

```
$ sudo swapoff -a
$ sudo sed -i '/ swap / s/^(.*)$/#1/g' /etc/fstab
```

Load the following kernel modules on all the nodes,

```
$ sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF
$ sudo modprobe overlay
$ sudo modprobe br_netfilter
```

Set the following Kernel parameters for Kubernetes, run beneath tee command

```
sudo tee /etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
```

Reload the above changes, run

```
$ sudo sysctl --system
```



## 4. Install kubelet, kubeadm and kubectl

```
sudo apt update
sudo apt upgrade
```

Once the servers are rebooted, add Kubernetes repository for Ubuntu 20.04 to all the servers.

```
sudo apt -y install curl apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

Then install required packages.

```
sudo apt update
sudo apt -y install vim git curl wget kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

Confirm installation by checking the version of kubectl.

```
$ kubectl version --client && kubeadm version
WARNING: This version information is deprecated and will be replaced with the output from kubectl version --short.  Use --output=yaml|json to get the full version.
Client Version: version.Info{Major:"1", Minor:"24", GitVersion:"v1.24.3", GitCommit:"aef86a93758dc3cb2c658dd9657ab4ad4afc21cb", GitTreeState:"clean", BuildDate:"2022-07-13T14:30:46Z", GoVersion:"go1.18.3", Compiler:"gc", Platform:"linux/amd64"}
Kustomize Version: v4.5.4
kubeadm version: &version.Info{Major:"1", Minor:"24", GitVersion:"v1.24.3", GitCommit:"aef86a93758dc3cb2c658dd9657ab4ad4afc21cb", GitTreeState:"clean", BuildDate:"2022-07-13T14:29:09Z", GoVersion:"go1.18.3", Compiler:"gc", Platform:"linux/amd64"}
```

## 5. Installing Docker runtime:

```
# Add repo and Install packages
sudo apt update

sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update

sudo apt install -y containerd.io docker-ce docker-ce-cli

# Create required directories
sudo mkdir -p /etc/systemd/system/docker.service.d

# Create daemon json config file
sudo tee /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

# Start and enable Services
sudo systemctl daemon-reload 
sudo systemctl restart docker
sudo systemctl enable docker
```

## 6. Install cri-dockerd on Linux

You can install [cri-dockerd](https://github.com/Mirantis/cri-dockerd) on Linux from source using Go, or by downloading ready binaries. We shall consider the two options.

A pre-requisite for this installation is Docker-Engine. You can reference our guide below to install the latest Docker Engine runtime on your Linux machine:

Ensure Docker service is running before you proceed:

```
$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
     Active: active (running) since Sun 2022-07-31 12:07:47 UTC; 20s ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 6355 (dockerd)
      Tasks: 8
     Memory: 30.0M
     CGroup: /system.slice/docker.service
```

**Install cri-dockerd using ready binary**

Install `wget` and `curl` command line tools.

```
### Debian based systems ###
sudo apt update
sudo apt install git wget curl
```

Once the tools are installed, use them to download the latest binary package of cri-dockerd. But first, let’s get the latest release version:

```
VER=$(curl -s https://api.github.com/repos/Mirantis/cri-dockerd/releases/latest|grep tag_name | cut -d '"' -f 4|sed 's/v//g')

echo $VER
```

We can then download the archive file from [Github cri-dockerd releases](https://github.com/Mirantis/cri-dockerd/releases) page.

```
### For Intel 64-bit CPU ###
wget https://github.com/Mirantis/cri-dockerd/releases/download/v${VER}/cri-dockerd-${VER}.amd64.tgz

tar xvf cri-dockerd-${VER}.amd64.tgz
```

Move `cri-dockerd` binary package to `/usr/local/bin` directory

```
sudo mv cri-dockerd/cri-dockerd /usr/local/bin/
```

Validate successful installation by running the commands below:

```
$ cri-dockerd --version
cri-dockerd 0.2.2 (HEAD)
```

Configure systemd units for cri-dockerd:

```
wget https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.service

wget https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.socket

sudo mv cri-docker.socket cri-docker.service /etc/systemd/system/

sudo sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service
```

Start and enable the services

```
sudo systemctl daemon-reload
sudo systemctl enable cri-docker.service
sudo systemctl enable --now cri-docker.socket
```

Confirm the service is now running:

```
$ systemctl status cri-docker.socket
● cri-docker.socket - CRI Docker Socket for the API
     Loaded: loaded (/etc/systemd/system/cri-docker.socket; enabled; vendor preset: enabled)
     Active: active (listening) since Fri 2022-04-15 08:48:59 UTC; 25s ago
   Triggers: ● cri-docker.service
     Listen: /run/cri-dockerd.sock (Stream)
      Tasks: 0 (limit: 4677)
     Memory: 60.0K
     CGroup: /system.slice/cri-docker.socket

Apr 15 08:48:59 ubuntu-20-04-02 systemd[1]: Starting CRI Docker Socket for the API.
Apr 15 08:48:59 ubuntu-20-04-02 systemd[1]: Listening on CRI Docker 
```



##  7. Initialize master node

Login to the server to be used as master and make sure that the *br_netfilter* module is loaded:

```
$ lsmod | grep br_netfilter
br_netfilter           22256  0 
bridge                151336  2 br_netfilter,ebtable_broute
```

Enable kubelet service.

```
sudo systemctl enable kubelet
```

We now want to initialize the machine that will run the control plane components which includes *etcd* (the cluster database) and the API Server.

Pull container images:

```
$ sudo kubeadm config images pull
[config/images] Pulled k8s.gcr.io/kube-apiserver:v1.23.5
[config/images] Pulled k8s.gcr.io/kube-controller-manager:v1.23.5
[config/images] Pulled k8s.gcr.io/kube-scheduler:v1.23.5
[config/images] Pulled k8s.gcr.io/kube-proxy:v1.23.5
[config/images] Pulled k8s.gcr.io/pause:3.6
[config/images] Pulled k8s.gcr.io/etcd:3.5.1-0
[config/images] Pulled k8s.gcr.io/coredns/coredns:v1.8.6
```

If you have multiple CRI sockets, please use `--cri-socket` to select one:

```
# CRI-O
sudo kubeadm config images pull --cri-socket /var/run/crio/crio.sock

# Containerd
sudo kubeadm config images pull --cri-socket /run/containerd/containerd.sock

# Docker
sudo kubeadm config images pull --cri-socket /run/cri-dockerd.sock 
```

These are the basic `kubeadm init` options that are used to bootstrap cluster.

```
--control-plane-endpoint :  set the shared endpoint for all control-plane nodes. Can be DNS/IP
--pod-network-cidr : Used to set a Pod network add-on CIDR
--cri-socket : Use if have more than one container runtime to set runtime socket path
--apiserver-advertise-address : Set advertise address for this particular control-plane node's API server
```



You can optionally pass Socket file for runtime and advertise address depending on your setup.

```
# CRI-O
sudo kubeadm init \
  --pod-network-cidr=192.168.0.0/16 \
  --cri-socket /var/run/crio/crio.sock \
  --upload-certs \
  --control-plane-endpoint=k8s-cluster.computingforgeeks.com

# Containerd
sudo kubeadm init \
  --pod-network-cidr=192.168.0.0/16 \
  --cri-socket /run/containerd/containerd.sock \
  --upload-certs \
  --control-plane-endpoint=k8s-cluster.computingforgeeks.com

# Docker
# Must do https://computingforgeeks.com/install-mirantis-cri-dockerd-as-docker-engine-shim-for-kubernetes/
sudo kubeadm init \
  --pod-network-cidr=192.168.0.0/16 \
  --cri-socket /run/cri-dockerd.sock  \
  --upload-certs \
  --control-plane-endpoint=k8s-cluster.computingforgeeks.com
```

Here is the output of my initialization command.

```
....
[init] Using Kubernetes version: v1.23.5
[preflight] Running pre-flight checks
	[WARNING Firewalld]: firewalld is active, please ensure ports [6443 10250] are open or your cluster may not function correctly
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Starting the kubelet
[certs] Using certificateDir folder "/etc/kubernetes/pki"
[certs] Using existing ca certificate authority
[certs] Using existing apiserver certificate and key on disk
[certs] Using existing apiserver-kubelet-client certificate and key on disk
[certs] Using existing front-proxy-ca certificate authority
[certs] Using existing front-proxy-client certificate and key on disk
[certs] Using existing etcd/ca certificate authority
[certs] Using existing etcd/server certificate and key on disk
[certs] Using existing etcd/peer certificate and key on disk
[certs] Using existing etcd/healthcheck-client certificate and key on disk
[certs] Using existing apiserver-etcd-client certificate and key on disk
[certs] Using the existing "sa" key
[kubeconfig] Using kubeconfig folder "/etc/kubernetes"
[kubeconfig] Using existing kubeconfig file: "/etc/kubernetes/admin.conf"
[kubeconfig] Using existing kubeconfig file: "/etc/kubernetes/kubelet.conf"
[kubeconfig] Using existing kubeconfig file: "/etc/kubernetes/controller-manager.conf"
[kubeconfig] Using existing kubeconfig file: "/etc/kubernetes/scheduler.conf"
[control-plane] Using manifest folder "/etc/kubernetes/manifests"
[control-plane] Creating static Pod manifest for "kube-apiserver"
[control-plane] Creating static Pod manifest for "kube-controller-manager"
W0611 22:34:23.276374    4726 manifests.go:225] the default kube-apiserver authorization-mode is "Node,RBAC"; using "Node,RBAC"
[control-plane] Creating static Pod manifest for "kube-scheduler"
W0611 22:34:23.278380    4726 manifests.go:225] the default kube-apiserver authorization-mode is "Node,RBAC"; using "Node,RBAC"
[etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
[wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 4m0s
[apiclient] All control plane components are healthy after 8.008181 seconds
[upload-config] Storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
[kubelet] Creating a ConfigMap "kubelet-config-1.21" in namespace kube-system with the configuration for the kubelets in the cluster
[upload-certs] Skipping phase. Please see --upload-certs
[mark-control-plane] Marking the node k8s-master01.computingforgeeks.com as control-plane by adding the label "node-role.kubernetes.io/master=''"
[mark-control-plane] Marking the node k8s-master01.computingforgeeks.com as control-plane by adding the taints [node-role.kubernetes.io/master:NoSchedule]
[bootstrap-token] Using token: zoy8cq.6v349sx9ass8dzyj
[bootstrap-token] Configuring bootstrap tokens, cluster-info ConfigMap, RBAC Roles
[bootstrap-token] configured RBAC rules to allow Node Bootstrap tokens to get nodes
[bootstrap-token] configured RBAC rules to allow Node Bootstrap tokens to post CSRs in order for nodes to get long term certificate credentials
[bootstrap-token] configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a Node Bootstrap Token
[bootstrap-token] configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
[bootstrap-token] Creating the "cluster-info" ConfigMap in the "kube-public" namespace
[kubelet-finalize] Updating "/etc/kubernetes/kubelet.conf" to point to a rotatable kubelet client certificate and key
[addons] Applied essential addon: CoreDNS
[addons] Applied essential addon: kube-proxy

Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

You can now join any number of control-plane nodes by copying certificate authorities
and service account keys on each node and then running the following as root:

  kubeadm join k8s-cluster.computingforgeeks.com:6443 --token sr4l2l.2kvot0pfalh5o4ik \
    --discovery-token-ca-cert-hash sha256:c692fb047e15883b575bd6710779dc2c5af8073f7cab460abd181fd3ddb29a18 \
    --control-plane 

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join k8s-cluster.computingforgeeks.com:6443 --token sr4l2l.2kvot0pfalh5o4ik \
    --discovery-token-ca-cert-hash sha256:c692fb047e15883b575bd6710779dc2c5af8073f7cab460abd181fd3ddb29a18
```

## 8. Add worker nodes

```
kubeadm join kube-master:6443 --token 983t51.w60gzp7l4nqiet7t --cri-socket /run/cri-dockerd.sock --discovery-token-ca-cert-hash sha256:177858dc78cf9004131c69af83241ad2d306ba9471506403ab6d370c80c366c6 
```



# Centos



### Install in all nodes

1. Install NTP

```
# yum install ntp
# systemctl enable ntpd
# systemctl start ntp
```

2. Set hostname and configure hosts

```
# hostnamectl set-hostname ubuntu-master
```

```
# vi /etc/hosts

# Add the following
192.168.1.15    ubuntu-master
192.168.1.16    ubuntu-node1
192.168.1.17    ubuntu-node2

$ echo "
10.240.17.2 k8s-master
10.240.17.4 worker-node1
10.240.17.6 worker-node2
" >> /etc/hosts
```

3. Disable SELinux & Configure firewall rules

```
# setenforce 0
# sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
```

4. Letting iptables see bridged traffic

```
# install bridge if not exist 
[k8s-master]$ yum install bridge-utils.x86_64 -y
# enable bridge-netfilter

[k8s-master]$ modprobe br_netfilter   
[k8s-master]$ echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
```

5. Configure firewall rules

```
# Check required ports Master Nodes

# firewall-cmd --permanent --add-port=6443/tcp
# firewall-cmd --permanent --add-port=2379-2380/tcp
# firewall-cmd --permanent --add-port=10250/tcp
# firewall-cmd --permanent --add-port=10251/tcp
# firewall-cmd --permanent --add-port=10252/tcp
# firewall-cmd --reload

# Check required ports Worker Nodes

# firewall-cmd --permanent --add-port=10250/tcp
# firewall-cmd --permanent --add-port=30000-32767/tcp
# firewall-cmd  --reload
```

6. Disable SWAP

```
sudo sed -i '/swap/d' /etc/fstab

or

sudo swapoff -a
```

7. Configure Kubernetes Repository

```
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
```

8. Install docker and kubeadm

* Docker - a container runtime. This is the component that runs your containers. Support for other runtimes such as rkt is under active development in Kubernetes.
* kubeadm - a CLI tool that will install and configure the various components of a cluster in a standard way.
* kubelet - a system service/program that runs on all nodes and handles node-level operations.
* kubectl - a CLI tool used for issuing commands to the cluster through its API Server.

```
sudo yum install kubeadm docker -y

sudo systemctl enable docker && sudo systemctl restart docker

sudo systemctl enable kubelet && sudo systemctl restart kubelet

```


Check what cgroup driver that docker is using

```
sudo docker info | grep -i cgroup
```

Add the cgroup driver from the previous step to the kublet config as an extra argument

```
$ sudo vi /etc/sysconfig/kubelet

KUBELET_EXTRA_ARGS=--cgroup-driver=systemd

```

<b>For Master</b>

9. Initialize Kubernetes Master

```
sudo kubeadm init
```

10. Install a Pod network add-on

```
kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml
```

Set up the Kubernetes Config:

```
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

# export KUBECONFIG=/etc/kubernetes/admin.conf
```



Check cluster-info

```
$ kubectl cluster-info
Kubernetes master is running at https://10.240.17.2:6443
KubeDNS is running at https://10.240.17.2:6443/api/v1/namespaces/kube-system/services/kube-dns/proxy
```

Remove the node

```
kubectl drain <node name> --delete-local-data --force --ignore-daemonsets
kubectl delete node <node name>

kubeadm reset
```


<b>For Nodes to join in the cluster</b>

```
# kubeadm join 192.168.1.15:6443 --token d6oudp.0vom0xaskbtvd9wb --discovery-token-ca-cert-hash sha256:accfcb4ecb672c786f667d8034fa16569489225a9bf95a5a5efb266d83876cd4

```


```
$ kubectl get pods --all-namespaces
NAMESPACE     NAME                                     READY   STATUS    RESTARTS   AGE
kube-system   coredns-66bff467f8-4rjzp                 1/1     Running   0          12m
kube-system   coredns-66bff467f8-wkr49                 1/1     Running   0          12m
kube-system   etcd-centos7-master                      1/1     Running   0          13m
kube-system   kube-apiserver-centos7-master            1/1     Running   0          13m
kube-system   kube-controller-manager-centos7-master   1/1     Running   0          13m
kube-system   kube-flannel-ds-amd64-4zcsz              1/1     Running   0          80s
kube-system   kube-proxy-ssdqc                         1/1     Running   0          12m
kube-system   kube-scheduler-centos7-master            1/1     Running   0          13m
```


```
$ kubectl get pods -n kube-system 
NAME                                     READY   STATUS    RESTARTS   AGE
coredns-66bff467f8-4rjzp                 1/1     Running   0          23m
coredns-66bff467f8-wkr49                 1/1     Running   0          23m
etcd-centos7-master                      1/1     Running   0          24m
kube-apiserver-centos7-master            1/1     Running   0          23m
kube-controller-manager-centos7-master   1/1     Running   0          23m
kube-flannel-ds-amd64-4zcsz              1/1     Running   0          12m
kube-flannel-ds-amd64-6l6jz              1/1     Running   0          5m11s
kube-flannel-ds-amd64-ggrnl              1/1     Running   0          5m11s
kube-proxy-clz8n                         1/1     Running   0          5m11s
kube-proxy-f8rnv                         1/1     Running   0          5m11s
kube-proxy-ssdqc                         1/1     Running   0          23m
kube-scheduler-centos7-master            1/1     Running   0          23m
```

```
  TTo start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 192.168.1.15:6443 --token 7y7699.zw0mjlx16irh44px \
    --discovery-token-ca-cert-hash sha256:bcb1d2bc26dbf7e3e98a4bb743324def64ce1b4a29936c712b4861dafa5137b3
```




## Kubernetes Setup and Configuration

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
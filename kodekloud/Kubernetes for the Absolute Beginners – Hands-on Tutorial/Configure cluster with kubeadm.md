# Configure cluster with kubeadm

## 1. Forwarding IPv4 and letting iptables see bridged traffic

Verify that the br_netfilter module is loaded by running

```
lsmod | grep br_netfilter
```

To load it explicitly, run 

```
sudo modprobe br_netfilter
```

In order for a Linux node's iptables to correctly view bridged traffic, verify that `net.bridge.bridge-nf-call-iptables` is set to 1 in your `sysctl` config. For example:

```bash
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# sysctl params required by setup, params persist across reboots
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system
```

## 2. Install Docker

https://docs.docker.com/engine/install/ubuntu/

**Set up the repository**

1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:

   ```
   sudo apt-get update
   
   sudo apt-get install \
       ca-certificates \
       curl \
       gnupg \
       lsb-release
   ```

2. Add Docker’s official GPG key:

   ```
   sudo mkdir -p /etc/apt/keyrings
   
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   ```

3. Use the following command to set up the repository:

   ```
   echo \
     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

**Install Docker Engine**

1. Update the `apt` package index, and install the *latest version* of Docker Engine, containerd, and Docker Compose, or go to the next step to install a specific version:

   ```
   sudo apt-get update
   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
   ```

2. Verify that Docker Engine is installed correctly by running the `hello-world` image.

   ```
   sudo service docker start
   sudo docker run hello-world
   ```

## 3. Installing kubeadm, kubelet and kubectl 

1. Update the `apt` package index and install packages needed to use the Kubernetes `apt` repository:

   ```shell
   sudo apt-get update
   sudo apt-get install -y apt-transport-https ca-certificates curl
   ```

2. Download the Google Cloud public signing key:

   ```shell
   sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
   ```

3. Add the Kubernetes `apt` repository:

   ```shell
   echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
   ```

4. Update `apt` package index, install kubelet, kubeadm and kubectl, and pin their version:

   ```shell
   sudo apt-get update
   sudo apt-get install -y kubelet kubeadm kubectl
   sudo apt-mark hold kubelet kubeadm kubectl
   ```

## 4. Creating a cluster with kubeadm

**Note: This must be run to master node only.**

If there is an error in initializing the cluster run this command.

```yaml
rm /etc/containerd/config.toml
systemctl restart containerd
```

```
kubeadm init --pod-network-cidr 10.244.0.0/16 --apiserver-advertise-address=192.168.56.2
```

To make kubectl work for your non-root user, run these commands, which are also part of the `kubeadm init` output:

```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

```
$ kubectl get nodes
NAME         STATUS     ROLES           AGE     VERSION
kubemaster   NotReady   control-plane   7m52s   v1.25.3
```

## 5. Install a Pod network add-on

Install weave network

```
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
```

## 6. Joining nodes

If there is an error in initializing the cluster run this command.

```
rm /etc/containerd/config.toml
systemctl restart containerd.service
```

The nodes are where your workloads (containers and Pods, etc) run. To add new nodes to your cluster do the following for each machine:

- SSH to the machine
- Become root (e.g. `sudo su -`)
- [Install a runtime](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-runtime) if needed
- Run the command that was output by `kubeadm init`. For example:

```
kubeadm join 192.168.56.2:6443 --token g8ksqy.rowrt2e7y3eubxiw \
--discovery-token-ca-cert-hash sha256:989d078bb3cda149fc212b84b26e20f0175df2202cebdd1198d5b9ed9a377423 
```

```
$ kubectl get nodes
NAME         STATUS   ROLES           AGE     VERSION
kubemaster   Ready    control-plane   39m     v1.25.3
kubenode01   Ready    <none>          9m56s   v1.25.3
kubenode02   Ready    <none>          38s     v1.25.3
```


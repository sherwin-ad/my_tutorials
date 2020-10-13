[TOC]



# Google Kubernetes Engine

## Docker Laboratory

 

**server.py**

```
import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, world\n")
        print(self.request)

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()

```



**requirements.txt**

```
tornado
```



**Dockerfile**

```
FROM python:3.5

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python", "-u", "server.py"]
```



**Create Image**

```
docker build -t myapp .
```



**Show images**

```
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
myapp               latest              2a8b7e53b4d4        26 seconds ago      882MB
python              3.5                 3687eb5ea744        3 weeks ago         871MB
```



**Show history**

```
docker history myapp
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
2a8b7e53b4d4        3 minutes ago       /bin/sh -c #(nop)  CMD ["python" "-u" "serve…   0B
1a6f5885761b        3 minutes ago       /bin/sh -c pip install -r requirements.txt      10.8MB
2626bfced69e        3 minutes ago       /bin/sh -c #(nop) WORKDIR /app                  0B
af8a9cc76e42        3 minutes ago       /bin/sh -c #(nop) COPY dir:842fcfa59a1330788…   498B
3687eb5ea744        3 weeks ago         /bin/sh -c #(nop)  CMD ["python3"]              0B
<missing>           3 weeks ago         /bin/sh -c set -ex;   wget -O get-pip.py "$P…   7.24MB
<missing>           3 weeks ago         /bin/sh -c #(nop)  ENV PYTHON_GET_PIP_SHA256…   0B
<missing>           3 weeks ago         /bin/sh -c #(nop)  ENV PYTHON_GET_PIP_URL=ht…   0B
<missing>           3 weeks ago         /bin/sh -c #(nop)  ENV PYTHON_PIP_VERSION=20…   0B
<missing>           3 weeks ago         /bin/sh -c cd /usr/local/bin  && ln -s idle3…   32B
<missing>           3 weeks ago         /bin/sh -c set -ex   && wget -O python.tar.x…   42.3MB
<missing>           3 weeks ago         /bin/sh -c #(nop)  ENV PYTHON_VERSION=3.5.10    0B
<missing>           3 weeks ago         /bin/sh -c #(nop)  ENV GPG_KEY=97FC712E4C024…   0B
<missing>           3 weeks ago         /bin/sh -c apt-get update && apt-get install…   17.9MB
<missing>           3 weeks ago         /bin/sh -c #(nop)  ENV LANG=C.UTF-8             0B
<missing>           3 weeks ago         /bin/sh -c #(nop)  ENV PATH=/usr/local/bin:/…   0B
<missing>           3 weeks ago         /bin/sh -c set -ex;  apt-get update;  apt-ge…   510MB
<missing>           3 weeks ago         /bin/sh -c apt-get update && apt-get install…   146MB
<missing>           3 weeks ago         /bin/sh -c set -ex;  if ! command -v gpg > /…   17.5MB
<missing>           3 weeks ago         /bin/sh -c apt-get update && apt-get install…   16.5MB
<missing>           3 weeks ago         /bin/sh -c #(nop)  CMD ["bash"]                 0B
<missing>           3 weeks ago         /bin/sh -c #(nop) ADD file:07a6578d6f507bd9c…   114MB
```



**Run docker image**

```
docker run -d -p 8888:8888 myapp
ab59619e5d95ef50092acd54568f5706daa4215efd3c965134978610524b75b2
```



**Show running containers**

```
docker ps
CONTAINER ID        IMAGE               COMMAND                 CREATED             STATUS              PORTS           
         NAMES
ab59619e5d95        myapp               "python -u server.py"   3 minutes ago       Up 3 minutes        0.0.0.0:8888->88
88/tcp   infallible_feistel
```



**Test the application**

```
curl http://localhost:8888
Hello, world
```



**Show the logs**

```
docker logs infallible_feistel
HTTPServerRequest(protocol='http', host='localhost:8888', method='GET', uri='/', version='HTTP/1.1', remote_ip='172.18.0
.1')
```



**Access running containers**

```
docker exec -it infallible_feistel /bin/bash
root@ab59619e5d95:/app# ls
Dockerfile  requirements.txt  server.py
root@ab59619e5d95:/app#
```



**Stop container**

```
docker stop infallible_feistel
```



**Start container**

```
docker start infallible_feistel
```



**Remove/Delete container**

```
docker rm -f infallible_feistel
```



### Push image to a registry

1. Tag image

   ```
   docker tag myapp:latest gcr.io/owen-project-285301/myapp:latest
   sherwin@cloudshell:~/myapp$ docker images
   REPOSITORY                         TAG                 IMAGE ID            CREATED             SIZE
   gcr.io/owen-project-285301/myapp   latest              2a8b7e53b4d4        35 minutes ago      882MB
   myapp                              latest              2a8b7e53b4d4        35 minutes ago      882MB
   python                             3.5                 3687eb5ea744        3 weeks ago         871MB
   ```

2. Push image

   ```
   docker push gcr.io/owen-project-285301/myapp
   The push refers to repository [gcr.io/owen-project-285301/myapp]
   4a8dbab70737: Pushed
   e07765d56b88: Pushed
   95d78f868723: Pushed
   493fa57d210f: Pushed
   5aed5e63d645: Pushed
   97be79495d2a: Layer already exists
   a995c5106335: Layer already exists
   17bdf5e22660: Layer already exists
   d37096232ed8: Layer already exists
   6add0d2b5482: Layer already exists
   4ef54afed780: Layer already exists
   latest: digest: sha256:400fa483b5513c0c666d304d403def37e6d555c0d25c680f51220e776732795a size: 2635
   ```

   

## The Anatomy of a cluster


**Kubernetes (K8s)** is an open-source system for automating deployment, scaling, and management of containerized applications.

### Kubernetes Cluster

1. One ore more **masters**

   - Master components provide **the control plane**
   - They make decisions (eg. about scheduling)

  ![](images/kubernetes_cluster.png)

**kube-apiserver**

- The API server is a component of the Kubernetes control plane that exposes the Kubernetes API. 
- The API server is the front end for the Kubernetes control plane.
- kube-apiserver is designed to scale horizontally—that is, it scales by deploying more instances. 

**etcd**

- Consistent and highly-available key value store used as Kubernetes' backing store for all cluster data.
- If your Kubernetes cluster uses etcd as its backing store, make sure you have a back up plan for those data.

**kube-scheduler**

- Control plane component that watches for newly created Pods with no assigned node, and selects a node for them to run on.
- Factors taken into account for scheduling decisions include: individual and collective resource requirements, hardware/software/policy constraints, affinity and anti-affinity specifications, data locality, inter-workload interference, and deadlines.

**kube-controller-manager**

- Control Plane component that runs controller processes. 
- Logically, each controller is a separate process, but to reduce complexity, they are all compiled into a single binary and run in a single process.

These controllers include:

**Node controller**: Responsible for noticing and responding when nodes go down.
**Replication controller**: Responsible for maintaining the correct number of pods for every replication controller object in the system.
**Endpoints controller**: Populates the Endpoints object (that is, joins Services & Pods).
**Service Account & Token controllers**: Create default accounts and API access tokens for new namespaces.

**cloud-controller-manager**

- A Kubernetes control plane component that embeds cloud-specific control logic. 
- The cloud controller manager lets you link your cluster into your cloud provider's API, and separates out the components that interact with that cloud platform from components that just interact with your cluster.
- The cloud-controller-manager only runs controllers that are specific to your cloud provider. If you are running Kubernetes on your own premises, or in a learning environment inside your own PC, the cluster does not have a cloud controller manager.
- As with the kube-controller-manager, the cloud-controller-manager combines several logically independent control loops into a single binary that you run as a single process. 
- You can scale horizontally (run more than one copy) to improve performance or to help tolerate failures.

The following controllers can have cloud provider dependencies:

**Node controller**: For checking the cloud provider to determine if a node has been deleted in the cloud after it stops responding
**Route controller**: For setting up routes in the underlying cloud infrastructure



2. One or more **nodes**

   - Node components provide the **runtime environment**

   - They are the **resources** of the cluster

  ![](images/kubernetes_node.png)



**kubelet**

- An agent that runs on each node in the cluster. It makes sure that containers are running in a Pod.
- The kubelet takes a set of PodSpecs that are provided through various mechanisms and ensures that the containers described in those PodSpecs are running and healthy. 
- The kubelet doesn't manage containers which were not created by Kubernetes.

**kube-proxy**

- kube-proxy is a network proxy that runs on each node in your cluster, implementing part of the Kubernetes Service concept.
- kube-proxy maintains network rules on nodes. These network rules allow network communication to your Pods from network sessions inside or outside of your cluster.
- kube-proxy uses the operating system packet filtering layer if there is one and it's available. Otherwise, kube-proxy forwards the traffic itself.

**Container runtime**

- The container runtime is the software that is responsible for running containers.
- Kubernetes supports several container runtimes: Docker, containerd, CRI-O, and any implementation of the Kubernetes CRI (Container Runtime Interface).



### Google Kubernetes Engine (GKE)

- Creates Masters and Nodes for you
- Uses a Container-Optimized opearationg system
- Built-in automatic **upgrades** and **repairs**
- **Resource** control and cluster **scaling**
- Integrated with other **GCP products and services**

### Interacting with GKE

- Google Cloud Console
- Command line
- kubectl
- Create and manage the lifecycle of Kubernetes objects
- Communicates with the API server

## Create a GKE cluster

```
# List nodes
kubectl get nodes

# List pods
kubectl get pods

# List services
kubectl get services
```



**Create deployment**

```
kubectl create deployment nginx --image nginx
deployment.apps/nginx created
```



**Expose deployment**

```
kubectl expose deployment nginx --port=80 --type=LoadBalancer
service/nginx exposed
```



**Set project**

```
gcloud config set project [PROJECT_ID]
```



## Pods

### Lab Creating  Single Pods

**nginx.yaml**

```
apiVersion: v1
kind: Pod
metadata: 
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - name: web
      containerPort: 80
```



```
# Authenticate kubectl with the cluster
gcloud container clusters get-credentials my-cluster-1 --zone=asia-east2-a                 
Fetching cluster endpoint and auth data.
kubeconfig entry generated for my-cluster-1.

# Apply configuration
kubectl apply -f nginx.yaml
pod/nginx created

# List pods
kubectl get pods
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          52s

# Port-forward
kubectl port-forward nginx 8080:80
Forwarding from 127.0.0.1:8080 -> 80
Handling connection for 8080

# Delete object
kubectl delete -f nginx.yaml
pod "nginx" deleted
```



![](images/web_preview.png)



### Creating multi-container pod

**multi.yaml**

```
apiVersion: v1
kind: Pod
metadata:
  name: multi
spec:
  volumes:
  - name: shared-data
    emptyDir: {}
  containers:
  - name: web-container
    image: nginx
    volumeMounts:
    - name: shared-data
      mountPath: /usr/share/nginx/html
  - name: ftp-container
    image: fauria/vsftpd
    volumeMounts:
    - name: shared-data
      mountPath: /pod-data
```



```
# Apply configuration
kubectl apply -f multi.yaml
pod/multi created

# List pods
kubectl get pods
NAME    READY   STATUS              RESTARTS   AGE
multi   0/2     ContainerCreating   0          13s

# Connect to ftp-container
kubectl exec -it multi -c ftp-container -- /bin/bash
[root@multi /]# ls
anaconda-post.log  bin  dev  etc  home  lib  lib64  media  mnt  opt  pod-data  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@multi /]# cd pod-data/
[root@multi pod-data]# echo "Hello from a multi-pod" > index.html
[root@multi pod-data]# curl http://localhost
Hello from a multi-pod
[root@multi pod-data]#
```

### Add FTP username and password

**multi.yaml**

```
spec:
  volumes:
  - name: shared-data
    emptyDir: {}
  containers:
  - name: web-container
    image: nginx
    volumeMounts:
    - name: shared-data
      mountPath: /usr/share/nginx/html
  - name: ftp-container
    image: fauria/vsftpd
    volumeMounts:
    - name: shared-data
      mountPath: /pod-data
    env:
    - name: FTP_USER
      value: admin
    - name: FTP_PASS
      value: password
```



```
# Delete configuration
sherwin@cloudshell:~/myapp (owen-project-285301)$ kubectl delete -f multi.yaml
pod "multi" deleted

# Apply configuration
sherwin@cloudshell:~/myapp (owen-project-285301)$ kubectl apply -f multi.yaml 
pod/multi created

# List pods
sherwin@cloudshell:~/myapp (owen-project-285301)$ kubectl get pods
NAME    READY   STATUS    RESTARTS   AGE
multi   2/2     Running   0          21s

# Connect to ftp-container
sherwin@cloudshell:~/myapp (owen-project-285301)$ kubectl exec -it multi -c ftp-container -- /bin/bash

# Check variable environment FTP_USER
[root@multi /]# echo $FTP_USER
admin

# Install ftp client
[root@multi /]# yum -y install ftp

# Log-in to ftp
[root@multi /]# ftp localhost
Trying 127.0.0.1...
Connected to localhost (127.0.0.1).
220 (vsFTPd 3.0.2)
Name (localhost:root): admin
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> exit
221 Goodbye.

```



## ReplicaSets and Deployments

### ReplicaSets

- A **Pod** is logical application-centric **unit of containers**
- A **ReplicaSet** is a Kubernetes **object** that provides:
  - A stable set of Pod **replicas**
  - A **specified number** of Pods
  - Logic to ensure **availability**
- **Not recommended** to create ReplicaSets on their own

### Deployments

- An object for logically managing **Pods** and **ReplicaSets**
- Desired state is **enforced** by the **Controller**
- Logic for **updating**, **rolling back** and **scaling** deployments
- Proportional **scaling** and **error checking** for rollouts
- The **preferred object** for deploying compute workloads

## Accessing Applications

### Services

- A **Service** exposes a **set of Pods** to the network
- A **Service** assigns a **fixed IP** to your **Pod replicas**
- Three main types of Service:
  - **ClusterIP** - it will assign fixed cluster IP address inside kubernetes cluster
  - **NodePort** - it will assign specific port on every node in your cluster to your service
  - **LoadBalancer** - Exposes the Service externally using a cloud provider's load balancer

### Selectors

- Labels are **key-value pairs** in object **metadata**
- Selectors search for **groups of labels**
  - app=nginx
- Pods that **match** selectors become part of the **Service**

## Laboratory: Creating Deployments and Services

**server.py**

```
import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        title = "Hello, World!"
        bgcolor = "dodgerblue"
        self.render("template.html", title=title, bgcolor=bgcolor)
        print(self.request)

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()
```

**template.html**

```
<!DOCTYPE html>
<html>
    <head>
        <title>{{ title }}</title>
    </head>
    <body bgcolor="{{ bgcolor }}">
        <h1 style="color:white;font-family:Arial, Helvetica, sans-serif;text-align: center">
            <strong>
                {{ title }}
            </strong>
        </h1>
    </body>
</html>
```

**Dockerfile**

```
FROM python:3.5

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python", "-u", "server.py"]
```



```
# Build image
docker build -t myapp .

# List images
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
myapp               latest              9d64f8f77902        2 minutes ago       882MB
python              3.5                 3687eb5ea744        3 weeks ago         871MB

# Tag image
docker tag myapp gcr.io/owen-project-285301/myapp:blue

# List images
docker images
REPOSITORY                         TAG                 IMAGE ID            CREATED             SIZE
gcr.io/owen-project-285301/myapp   blue                9d64f8f77902        4 minutes ago       882MB
myapp                              latest              9d64f8f77902        4 minutes ago       882MB
python                             3.5                 3687eb5ea744        3 weeks ago         871MB

# Push image to the google cloud repository
docker push gcr.io/owen-project-285301/myapp:blue
The push refers to repository [gcr.io/owen-project-285301/myapp]
db1cf7e352db: Pushed
a7a427ff286a: Pushed
95d78f868723: Layer already exists
493fa57d210f: Layer already exists
5aed5e63d645: Layer already exists
97be79495d2a: Layer already exists
a995c5106335: Layer already exists
17bdf5e22660: Layer already exists
d37096232ed8: Layer already exists
6add0d2b5482: Layer already exists
4ef54afed780: Layer already exists
blue: digest: sha256:ceb23b349a7edc3ef11defe665916a88b5be6cfc9b72f422d67a8728cec9d3c8 size: 2636

```



**Change background color to "limegreen"**

**server.py**

```
import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        title = "Hello, World!"
        bgcolor = "limegreen"
        self.render("template.html", title=title, bgcolor=bgcolor)
        print(self.request)

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()
```

```
# Build image
docker build -t myapp .

# Tag image
docker tag myapp gcr.io/owen-project-285301/myapp:green

# Push image to the google cloud repository
docker push gcr.io/owen-project-285301/myapp:green
The push refers to repository [gcr.io/owen-project-285301/myapp]
db1cf7e352db: Layer already exists
a7a427ff286a: Layer already exists
95d78f868723: Layer already exists
493fa57d210f: Layer already exists
5aed5e63d645: Layer already exists
97be79495d2a: Layer already exists
a995c5106335: Layer already exists
17bdf5e22660: Layer already exists
d37096232ed8: Layer already exists
6add0d2b5482: Layer already exists
4ef54afed780: Layer already exists
green: digest: sha256:ceb23b349a7edc3ef11defe665916a88b5be6cfc9b72f422d67a8728cec9d3c8 size: 2636
```



**Change background color to "darkred"**

**server.py**

```
import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        title = "Danger Will Robinson!"
        bgcolor = "darkred"
        self.render("template.html", title=title, bgcolor=bgcolor)
        print(self.request)

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()
```

```
# Build image
docker build -t myapp .

# Tag image
docker tag myapp gcr.io/owen-project-285301/myapp:bad

# Push image to the google cloud repository
docker push gcr.io/owen-project-285301/myapp:bad
The push refers to repository [gcr.io/owen-project-285301/myapp]
490919525ce6: Pushed
4fd88638be72: Pushed
95d78f868723: Layer already exists
493fa57d210f: Layer already exists
5aed5e63d645: Layer already exists
97be79495d2a: Layer already exists
a995c5106335: Layer already exists
17bdf5e22660: Layer already exists
d37096232ed8: Layer already exists
6add0d2b5482: Layer already exists
4ef54afed780: Layer already exists
bad: digest: sha256:2d21b18493859d2548cd1c4b1569a9e4b8215035e5e1c264a2fd908fe6affd46 size: 2636
```



### Create Deployment manifest for application

**myapp-deployment.yaml**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
  labels:
    app: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: gcr.io/owen-project-285301/myapp:blue
        ports:
        - containerPort: 8888
```

```
# Create deployment
kubectl apply -f myapp-deployment.yaml
deployment.apps/myapp-deployment created

# List pods
kubectl get pods
NAME                                READY   STATUS              RESTARTS   AGE
myapp-deployment-64b49b89d8-8qtr2   0/1     ContainerCreating   0          17s
myapp-deployment-64b49b89d8-nxh7v   0/1     ContainerCreating   0          17s
myapp-deployment-64b49b89d8-x2tc7   0/1     ContainerCreating   0          17s

# list details about deployment
kubectl describe deployment myapp-deployment
Name:                   myapp-deployment
Namespace:              default
CreationTimestamp:      Tue, 06 Oct 2020 11:21:11 +0800
Labels:                 app=myapp
Annotations:            deployment.kubernetes.io/revision: 1
                        kubectl.kubernetes.io/last-applied-configuration:
                          {"apiVersion":"apps/v1","kind":"Deployment","metadata":{"annotations":{},"labels":{"app":"myapp"},"name":"myapp-deployment","namespace":"d...
Selector:               app=myapp
Replicas:               3 desired | 3 updated | 3 total | 3 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=myapp
  Containers:
   myapp:
    Image:        gcr.io/owen-project-285301/myapp:blue
    Port:         8888/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   myapp-deployment-64b49b89d8 (3/3 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  12m   deployment-controller  Scaled up replica set myapp-deployment-64b49b89d8 to 3
```



### Create Service for application

**myapp-service.yaml**

```
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8888
  type: LoadBalancer
```

```
# Apply service configuration
kubectl apply -f myapp-service.yaml
service/myapp-service created

# List services
kubectl get services
NAME            TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE
kubernetes      ClusterIP      10.4.0.1      <none>        443/TCP        129m
myapp-service   LoadBalancer   10.4.15.220   34.92.29.7    80:30050/TCP   96s
```

**Browse the external IP in browser**

![](images/myapp_web_blue.png)



### Rolling changes

**myapp-deployment.yaml**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
  labels:
    app: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: gcr.io/owen-project-285301/myapp:bad
        ports:
        - containerPort: 8888
```

```
# Specify the --record flag to write the command executed
kubectl apply -f myapp-deployment.yaml --record
deployment.apps/myapp-deployment configured

# List pods
kubectl get pods
NAME                                READY   STATUS              RESTARTS   AGE
myapp-deployment-64b49b89d8-8qtr2   1/1     Running             0          98m
myapp-deployment-64b49b89d8-nxh7v   1/1     Terminating         0          98m
myapp-deployment-64b49b89d8-x2tc7   1/1     Terminating         0          98m
myapp-deployment-687c4b4c6c-hnknb   1/1     Running             0          35s
myapp-deployment-687c4b4c6c-pbtcv   0/1     ContainerCreating   0          2s
myapp-deployment-687c4b4c6c-qkfvk   1/1     Running             0          6s

# List pods
kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
myapp-deployment-687c4b4c6c-hnknb   1/1     Running   0          2m24s
myapp-deployment-687c4b4c6c-pbtcv   1/1     Running   0          111s
myapp-deployment-687c4b4c6c-qkfvk   1/1     Running   0          115s

# To see the rollout status
kubectl rollout status deployment.v1.apps/myapp-deployment
deployment "myapp-deployment" successfully rolled out

# To see the rollout history
kubectl rollout history deployment.v1.apps/myapp-deployment
deployment.apps/myapp-deployment
REVISION  CHANGE-CAUSE
1         <none>

# List services
kubectl get services
NAME            TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE
kubernetes      ClusterIP      10.4.0.1      <none>        443/TCP        129m
myapp-service   LoadBalancer   10.4.15.220   34.92.29.7    80:30050/TCP   96s
```



**Browse the external IP in browser**

![](images/myapp_web_red.png)



**To rollout to previous version**

```
# Rollout to previous version
kubectl rollout undo deployment.v1.apps/myapp-deployment
deployment.apps/myapp-deployment rolled back

# List pods
sherwin@cloudshell:~/myapp (owen-project-285301)$ kubectl get pods
NAME                                READY   STATUS        RESTARTS   AGE
myapp-deployment-64b49b89d8-dpkzj   1/1     Running       0          7s
myapp-deployment-64b49b89d8-mnjdn   1/1     Running       0          9s
myapp-deployment-64b49b89d8-q9pj9   1/1     Running       0          11s
myapp-deployment-687c4b4c6c-hnknb   1/1     Terminating   0          20m
myapp-deployment-687c4b4c6c-pbtcv   1/1     Terminating   0          19m
myapp-deployment-687c4b4c6c-qkfvk   1/1     Terminating   0          19m

# List pods
sherwin@cloudshell:~/myapp (owen-project-285301)$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
myapp-deployment-64b49b89d8-dpkzj   1/1     Running   0          72s
myapp-deployment-64b49b89d8-mnjdn   1/1     Running   0          74s
myapp-deployment-64b49b89d8-q9pj9   1/1     Running   0          76s
```

**Browse the external IP in browser**

![](images/myapp_web_blue.png)



**Check the GCP console **

Go to GKE > Workloads (In the info you can see are now in revision 3)

![](images/gcp_console.png)



## Laboratory: Monitoring, Logging and Debugging

```
# Dynamically create nginx deployment
$ kubectl create deployment nginx --image=nginx
deployment.apps/nginx created

# List deployments
$ kubectl get deployments
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
nginx   1/1     1            1           4m17s

# List pods
$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-554b9c67f9-lfh78   1/1     Running   0          2m49s

# List events
$ kubectl get events
LAST SEEN   TYPE     REASON                    OBJECT                                             MESSAGE
34m         Normal   Starting                  node/gke-owen-cluster-default-pool-21196fbd-ghgw   Starting kubelet.

# Describe deployment
$ kubectl describe deployment nginx
Name:                   nginx
Namespace:              default
CreationTimestamp:      Tue, 06 Oct 2020 07:24:39 +0000
Labels:                 app=nginx
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=nginx
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx
  Containers:
   nginx:
    Image:        nginx
    Port:         <none>
    Host Port:    <none>
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Progressing    True    NewReplicaSetAvailable
  Available      True    MinimumReplicasAvailable
OldReplicaSets:  <none>
NewReplicaSet:   nginx-554b9c67f9 (1/1 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  8m53s  deployment-controller  Scaled up replica set nginx-554b9c67f9 to 1

# Describe pod
$ kubectl describe pod nginx-554b9c67f9-lfh78
Name:           nginx-554b9c67f9-lfh78
Namespace:      default
Priority:       0
Node:           gke-owen-cluster-default-pool-21196fbd-ghgw/10.170.0.16
Start Time:     Tue, 06 Oct 2020 07:26:13 +0000
Labels:         app=nginx
                pod-template-hash=554b9c67f9
Annotations:    kubernetes.io/limit-ranger: LimitRanger plugin set: cpu request for container nginx
Status:         Running
IP:             10.0.1.3
IPs:            <none>
Controlled By:  ReplicaSet/nginx-554b9c67f9

# Expose deployment
$ kubectl expose deployment nginx --port=80 --type=LoadBalancer
service/nginx exposed

# List logs of pod
$ kubectl logs pod/nginx-554b9c67f9-lfh78
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
10.0.1.1 - - [06/Oct/2020:07:45:32 +0000] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36" "-"
10.0.1.1 - - [06/Oct/2020:07:45:35 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36" "-"

# Scale up deployment
$ kubectl scale --replicas=10 deployment nginx
deployment.extensions/nginx scaled

# List pods
sherwin@cloudshell:~ (owen-project-285301)$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-554b9c67f9-8w4zw   1/1     Running   0          28s
nginx-554b9c67f9-cqkfm   1/1     Running   0          28s
nginx-554b9c67f9-csqbd   1/1     Running   0          28s
nginx-554b9c67f9-cxcwx   1/1     Running   0          28s
nginx-554b9c67f9-hvtgm   1/1     Running   0          28s
nginx-554b9c67f9-hwck9   1/1     Running   0          28s
nginx-554b9c67f9-lfh78   1/1     Running   0          31m
nginx-554b9c67f9-rx7pm   1/1     Running   0          28s
nginx-554b9c67f9-smckt   1/1     Running   0          28s

# Scale down deployment
sherwin@cloudshell:~ (owen-project-285301)$ kubectl scale --replicas=1 deployment nginx
deployment.extensions/nginx scaled

# List pods
sherwin@cloudshell:~ (owen-project-285301)$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-554b9c67f9-lfh78   1/1     Running   0          35m
```



## Deploying Applications

![](images/guestbook_diagram.png)



**1CPU = 1000 millicores**
**100m = 1/10  or .1 CPU**

**1 mebibyte (MiB) = 1,048,576 bytes**
**1 megabyte(MB) = 1,000,000 bytes**



**redis-master-deployment.yaml**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-master
  labels:
    app: redis
spec:
  selector:
    matchLabels:
      app: redis
      role: master
      tier: backend
  replicas: 1
  template:
    metadata:
      labels:
        app: redis
        role: master
        tier: backend
    spec:
      containers:
      - name: master
        image: k8s.gcr.io/redis:e2e
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
        ports:
        - containerPort: 6379
```

**redis-master-service.yaml**

```
apiVersion: v1
kind: Service
metadata:
  name: redis-master
  labels:
    app: redis
    role: master
    tier: backend
spec:
  ports:
  - port: 6379
    targetPort: 6379
  selector:
    app: redis
    role: master
    tier: backend
```

**redis-slave-deployment.yaml**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-slave
  labels:
    app: redis
spec:
  selector:
    matchLabels:
      app: redis
      role: slave
      tier: backend
  replicas: 2
  template:
    metadata:
      labels:
        app: redis
        role: slave
        tier: backend
    spec:
      containers:
      - name: slave
        image: gcr.io/google_samples/gb-redisslave:v3
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
        env:
        - name: GET_HOSTS_FROM
          value: dns
        ports:
        - containerPort: 6379
```

**redis-slave-service.yaml**

```
apiVersion: v1
kind: Service
metadata:
  name: redis-slave
  labels:
    app: redis
    role: slave
    tier: backend
spec:
  ports:
  - port: 6379
  selector:
    app: redis
    role: slave
    tier: backend
```

```
# Apply deploymet
$ kubectl apply -f redis-master-deployment.yaml
deployment.apps/redis-master created

# Apply service
$ kubectl apply -f redis-master-service.yaml
service/redis-master created

# Apply deployment
$ kubectl apply -f redis-slave-deployment.yaml
deployment.apps/redis-slave created

# Apply service
$ kubectl apply -f redis-slave-service.yaml
service/redis-slave created

# List pods
$ kubectl get pods
NAME                            READY   STATUS    RESTARTS   AGE
redis-master-545d695785-mkh7w   1/1     Running   0          7m1s
redis-slave-546fc99d45-5rqlj    1/1     Running   0          38s
redis-slave-546fc99d45-wwhv6    1/1     Running   0          38s

# List services
$ kubectl get services
NAME           TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
kubernetes     ClusterIP   10.108.0.1     <none>        443/TCP    31m
redis-master   ClusterIP   10.108.2.73    <none>        6379/TCP   7m2s
redis-slave    ClusterIP   10.108.5.164   <none>        6379/TCP   31s
```

**frontend-deployment.yaml**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
  labels:
    app: guestbook
spec:
  selector:
    matchLabels:
      app: guestbook
      tier: frontend
  replicas: 3
  template:
    metadata:
      labels:
        app: guestbook
        tier: frontend
    spec:
      containers:
      - name: php-redis
        image: gcr.io/google-samples/gb-frontend:v4
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
        env:
        - name: GET_HOSTS_FROM
          value: dns
        ports:
        - containerPort: 80
```

**frontend-service.yaml**

```
apiVersion: v1
kind: Service
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  type: LoadBalancer
  ports:
  - port: 80
  selector:
    app: guestbook
    tier: frontend
```

```
# Apply deployment
$ kubectl apply -f frontend-deployment.yaml
deployment.apps/frontend created

# Apply service
$ kubectl apply -f frontend-service.yaml
service/frontend created

# List pods 
$ kubectl get pods
NAME                            READY   STATUS    RESTARTS   AGE
frontend-678d98b8f7-9zkw9       1/1     Running   0          34s
frontend-678d98b8f7-cfwwp       1/1     Running   0          34s
frontend-678d98b8f7-ptj9c       1/1     Running   0          34s
redis-master-545d695785-mkh7w   1/1     Running   0          18m
redis-slave-546fc99d45-5rqlj    1/1     Running   0          12m
redis-slave-546fc99d45-wwhv6    1/1     Running   0          12m

# List services
$ kubectl get services
NAME           TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
frontend       LoadBalancer   10.108.4.43    34.92.74.91   80:31759/TCP   43s
kubernetes     ClusterIP      10.108.0.1     <none>        443/TCP        44m
redis-master   ClusterIP      10.108.2.73    <none>        6379/TCP       19m
redis-slave    ClusterIP      10.108.5.164   <none>        6379/TCP       12m
```

**Browse External-IP**

![](/home/sherwinowen/Videos/gcp/gke/images/guestbook_web.png)

## Pod reliability with health checks

### Liveness Probe

- A check performed by **kubelet**
- Built-in **monitoring**
- Can check **HTTP** endpoint, **TCP** socket, or run a **command**
- A **failed probe** will cause a Pod to be **replaced**

### Readiness Probe

- A similar check performed by **kubelet**
- Define when a Pod is **ready to start** serving
- **Buys time** for Pods that must perform **startup tasks**
- Traffic **won't be directed** to a Pod until it is **ready**
- Use in **conjunction** with a **Liveness** Probe

### Probe Configuration

- Probes are performed by a handler:
  - ExecAction
  - TCPSocketAction
  - HTTPGetAction
- initialDelaySeconds, periodSeconds, timeoutSeconds
- successThreshold, failureThreshold



## Accessing External Services

### Service Endpoints

- Create a **Service** object with no **Selector**
- Kubernetes looks for an **Endpoint** with the same **name**
- Endpoints map **external services** to Service objects
- Service discovery via **internal DNS**



```
kind: Service
apiVersion: v1
metadata:
 name: mongo
Spec:
 type: ClusterIP
 ports:
 - port: 27017
   targetPort: 27017
```




```
kind: Endpoints
apiVersion: v1
metadata:
 name: mongo
subsets:
 - addresses:
     - ip: 10.240.0.4
   ports:
     - port: 27017
```



```
kind: Service
apiVersion: v1
metadata:
 name: mongo
spec:
 type: ExternalName
 externalName: ds149763.mlab.com
```

### Sidecars

- **Sidecar** provides the **connection** to the external service
- Application container accesses the service on **localhost / 127.0.0.1**
- Userful for proxies, such as **MySQL Proxy** for **Cloud SQL**



## Lab: Maintaining a service with unhealthy pods

Create service accounts

```
# Create service account
$ gcloud iam service-accounts create cloudsqlproxy
Created service account [cloudsqlproxy].

# Assign permission to the service account
$ gcloud projects add-iam-policy-binding owen-project-285301 --member serviceAccount:cloudsqlproxy@owen-project-285301.iam.gserviceaccount.com --role roles/cloudsql.client
Updated IAM policy for project [owen-project-285301].
bindings:
- members:
  - serviceAccount:service-459894858353@gcf-admin-robot.iam.gserviceaccount.com
  role: roles/cloudfunctions.serviceAgent
- members:
  - serviceAccount:cloudsqlproxy@owen-project-285301.iam.gserviceaccount.com
  role: roles/cloudsql.client
- members:
  - serviceAccount:service-459894858353@compute-system.iam.gserviceaccount.com
  role: roles/compute.serviceAgent
- members:
  - serviceAccount:service-459894858353@container-engine-robot.iam.gserviceaccount.com
  role: roles/container.serviceAgent
- members:
  - serviceAccount:459894858353-compute@developer.gserviceaccount.com
  - serviceAccount:459894858353@cloudservices.gserviceaccount.com
  - serviceAccount:owen-project-285301@appspot.gserviceaccount.com
  - serviceAccount:service-459894858353@containerregistry.iam.gserviceaccount.com
  role: roles/editor
- members:
  - serviceAccount:service-459894858353@firebase-rules.iam.gserviceaccount.com
  role: roles/firebaserules.system
- members:
  - user:sherwin@mybusybee.net
  role: roles/owner
etag: BwWxCf0tVsU=
version: 1

# Create a key
$ gcloud iam service-accounts keys create ./sqlproxy.json --iam-account cloudsqlproxy@owen-project-285301.iam.gserviceaccount.com
created key [55253323d617ef6db765470135ad6290b4fbae70] of type [json] as [./sqlproxy.json] for [cloudsqlproxy@owen-project-285301.iam.gserviceaccount.com]

# Show created key
$ cat sqlproxy.json
{
  "type": "service_account",
  "project_id": "owen-project-285301",
  "private_key_id": "55253323d617ef6db765470135ad6290b4fbae70",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDr4yF6j1WseNqk\nA5PD5ViygJwz2mSV70cPbIFx+ONHAToRzhrqD1DrL1r/oRZstmBK4HnQgeEdfYwe\nHr8Xt0eB4NQER77A5Phiy8CPnsdZWnNSaSCLKQs/Ui0KjyKZ0DAJCFDVFoVSYBhS\n1DNHpRLmSlXF+WYtfjhZKDCdRVDmPzBhIvmxs2c6Wu959zzZnpf/DCuJAHTrbKrc\npZAEc6Thm9qc+Ng1ElYWRlB1ngKktKC3lxbi1lSfkqKtpZE7TFGVT6NFlz6FcPKd\nsFTJo0hOsGLxpdB+ZbGvGxhN6EItafwoHK4NGAhwsIVN2jy9RBURUfKj1bUEUnWv\nddkJn1FRAgMBAAECggEAB+h50jstMP6tvM8qZGhDVpupcPMWyXCHyjh16AFjNDmS\nLe/iFtv712CjbTvELdGY7ZW0O8Vo68VOXeGjwCqqtOvZy8lwd5TNj3lbe60j64bU\n5CvGVagC+qTZgfe9vhiczaa32Ab84f+6/Qbkb7fU5//Qu5YCgw6u2q1WYOVmootm\nDFdQqTyV8lrNQmrXVL4DTzYA8ZPmP4zUTiZ9p4escnTe2JBNg7PwqPqaQwh/qXLR\nl4pGiziWVIUEWhM2tEh3VrhwC66GsshJOOnEY9ohInqVRgw11IiKKiWFbNz0XvPv\nF3r6YxBD8q2CCd07Pfiy4oTk6Kg8RU/K+fWbDHaWSQKBgQD4b8gJvoFY/5J2pIBy\nteMIMNd93cIXrjmpwxoHrreA3lkbo/VCM0NvwxJ1HhU7UnyazhsMIhQbrGDTYohL\n3BpS5cgg11q0pm8mxOxW4Cv4woaHxlBERqaGONWI+g05MsgoNPWFCTvrKrwXk5cQ\nxtAlqbDFs3Dwc3yi89cqf6UUCQKBgQDzEYtKiPoivkzzrKDHeqg6iJDLmqEWiMth\nWCNJw3CrkFbLkGi6K4a0dzRaYv7NENOYovbTTm0/TV3WrnN5is+GVQXEZNHHv7H3\nwAHXTVySZoSfKbRvXcK6xPibeSeaOhVN921CjmxUn/uoEsD/HAz7Igl+q0D2UAQP\nnLgRFr31CQKBgQDQvFq+lSnotRNCTAUAXIJcp2znfCNP8jrQv/Rm8A2OYUNNTf0L\nmjbW+HfRn20HYs7+4p0nHJr4hWT1Npx94HjdneMAdPDpR82sLVjFxaQsZoTSH3Xh\nZ9sSez4u0Km7nUc/QP/ov1FwzX8r7/3FQsYwXtr/wTzrSp017NqkAouYwQKBgQDt\nQ57X7sVbzK6I3WVD0rMMD+pnFFVSDc2ZA9POWPxOO+K9agUQVRR0bDeqUx+tRFOH\nluugb9msBPUobblCVwEjezLZ9h/f/3rU/5PMejN2pKOoSalbXAaNEWArQyQpI7FQ\nHcmFQkj0ggXAli3V16fELAFgqAINbSXJp4z1AWIDIQKBgDrh9FLvD3eSM/iQNB23\nuR/qGAwExQm2XH6pdD7EJ3sorZAk59gMwAWPIVkgjnuCurqtmaawqDkqkey7XGuD\nncOl4fFJjpo5RJDVLzVLFI12AUmeI+pOgEARNs5B7g2k46ZTwUYwKooEJu7AGgUt\n0i9Nm6Xz4nj5gLTYqO7/oJdu\n-----END PRIVATE KEY-----\n",
  "client_email": "cloudsqlproxy@owen-project-285301.iam.gserviceaccount.com",
  "client_id": "108537785626189251642",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/cloudsqlproxy%40owen-project-285301.iam.gserviceaccount.com"
}
```



**myapp-deployment.yaml**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
  labels:
    app: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: gcr.io/owen-project-285301/myapp:blue
        ports:
        - containerPort: 8888
      - name: cloudsql-proxy
        image: gcr.io/cloudsql-docker/gce-proxy:1.11
        command: ["/cloud_sql_proxy",
                  "-instances=owen-project-285301:asia-east2:owendb=tcp:3306",
                  "-credential_file=/secrets/cloudsql/credentials.json"]
        securityContext:
          runAsUser: 2
          allowPrivilegeEscalation: false
        volumeMounts:
          - name: cloudsql-instance-credentials
            mountPath: /secrets/cloudsql
            readOnly: true
      volumes:
        - name: cloudsql-instance-credentials
          secret:
            secretName: cloudsql-instance-credentials        
```



```
# Create secret file
$ kubectl create secret generic cloudsql-instance-credentials --from-file=credentials.json=./sqlproxy.json
secret/cloudsql-instance-credentials created

# Apply deployment
$ kubectl apply -f myapp-deployment.yaml
deployment.apps/myapp-deployment configured
sherwin@cloudshell:~/myapp (owen-project-285301)$ kubectl get pods
NAME                                READY   STATUS              RESTARTS   AGE
myapp-deployment-59688d8fc5-4cjrr   2/2     Running             0          6s
myapp-deployment-59688d8fc5-kffst   2/2     Running             0          11s
myapp-deployment-59688d8fc5-pnw77   0/2     ContainerCreating   0          2s
myapp-deployment-64b49b89d8-8nhxj   1/1     Running             0          92m
myapp-deployment-64b49b89d8-bww8p   1/1     Terminating         0          92m
myapp-deployment-64b49b89d8-ngs8q   1/1     Terminating         0          92m

# Check pod logs 
$ kubectl logs pod/myapp-deployment-59688d8fc5-4cjrr -c cloudsql-proxy
2020/10/07 01:11:01 using credential file for authentication; email=cloudsqlproxy@owen-project-285301.iam.gserviceaccount.com
2020/10/07 01:11:01 Listening on 127.0.0.1:3306 for owen-project-285301:asia-east2:owendb
2020/10/07 01:11:01 Ready for new connections
```



**requirements.txt**

```
tornado
PyMySQL
```

**server.py**

```
import tornado.ioloop
import tornado.web
import pymysql

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        title = "Hello World!"
        bgcolor = "dodgerblue"
        self.render("template.html", title=title, bgcolor=bgcolor)
        print(self.request)

class ProbeHandler(tornado.web.RequestHandler):
    def get(self):
        try:
            db = pymysql.connect('localhost', 'myapp', 'NOTpassword', 'myapp')
            cursor = db.cursor()
            cursor.execute("SELECT VERSION()")
            result = cursor.fetchone()
            title = "OK - DB version: %s" % result
            bgcolor = "limegreen"
            self.set_status(200)
        except pymysql.Error as e:
            title = "NOT OK - %s" % e
            bgcolor = "darkred"
            self.set_status(503)
        self.render("template.html", title=title, bgcolor=bgcolor)

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
        (r"/isalive", ProbeHandler),
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()import tornado.ioloop
import tornado.web
import pymysql


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        title = "Hello, World!"
        bgcolor = "dodgerblue"
        self.render("template.html", title=title, bgcolor=bgcolor)
        print(self.request)


class ProbeHandler(tornado.web.RequestHandler):
    def get(self):
        try:
            db = pymysql.connect('localhost', 'myapp', 'password', 'myapp')
            cursor = db.cursor()
            cursor.execute("SELECT VERSION()")
            result = cursor.fetchone()
            title = "OK - DB version: %s" % result
            bgcolor = "limegreen"
            self.set_status(200)
        except pymysql.Error as e:
            title = "NOT OK - %s" % e
            bgcolor = "darkred"
            self.set_status(503)
        self.render("template.html", title=title, bgcolor=bgcolor)


def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
        (r"/isalive", ProbeHandler),
        (r"/isready", ProbeHandler),
    ])


if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()
```



```
# Build image
$ docker build -t myapp:probes4 .

# List images
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
myapp               probes1             f852bde1ec60        24 seconds ago      882MB
python              3.5                 3687eb5ea744        3 weeks ago         871MB

# Tag image
$ docker tag myapp:probes4 gcr.io/owen-project-285301/myapp:probes4

# List images
$ docker images

# Push image to the repository
$ docker push gcr.io/owen-project-285301/myapp:probes4
```



**myapp-deployment.yaml**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
  labels:
    app: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: gcr.io/owen-project-285301/myapp:probes4
        ports:
        - containerPort: 8888
        livenessProbe:
          httpGet:
            path: /isalive
            port: 8888
          initialDelaySeconds: 3
          periodSeconds: 3
        readinessProbe:
          httpGet:
            path: /isready
            port: 8888
          initialDelaySeconds: 5
          periodSeconds: 5
      - name: cloudsql-proxy
        image: gcr.io/cloudsql-docker/gce-proxy:1.11
        command: ["/cloud_sql_proxy",
                  "-instances=owen-project-285301:asia-east2:owendb=tcp:3306",
                  "-credential_file=/secrets/cloudsql/credentials.json"]
        securityContext:
          runAsUser: 2
          allowPrivilegeEscalation: false
        volumeMounts:
          - name: cloudsql-instance-credentials
            mountPath: /secrets/cloudsql
            readOnly: true
      volumes:
        - name: cloudsql-instance-credentials
          secret:
            secretName: cloudsql-instance-credentials
```



```
# Apply deployment
$ kubectl apply -f myapp-deployment.yaml
deployment.apps/myapp-deployment configured

# Watch pods
$ watch kubectl get pods
```

**Browse /isalive and /isready**

![](images/web_isalive.png)



## Volumes and Persistent storage

### Volumes

- Container storage is **ephemeral**
- A **volume** is an independent **object**
- A  **directory** mounted in a container to access files
- Many different **types** - some of which are persistent

### Types of volumes

1. **emptyDir** 

- Scratch-space that can be shared by multiple containers in the same Pod.
- Deleted forever when a Pod is removed from a node.

2. gcePersistentDisk

- A GCP persistent disk
- Must be created beforehand, can be pre-pupulated with data, and mounted read-only by multiple comsumers.
- Will only be unmounted when a Pod is removed.

3. PersistentVolumeClaim

- Used to mount a PersistentVolume into a Pod - a way to "claim" durable storage.
- Requires a matching PersistentVolume object.



**Persistent Volumes**

- **PersistentVolume** defines a piece of storage in the cluster
- Manually or dynamically provisioned using **plugins**
- Configured with a **Storage Class**
- **PersistentVolumeClaim** is a request to consume a **PersistentVolume**
- Access Modes define how a volume may be accessed by multiple consumers



**Access Modes**

- **ReadWriteOnce** - a single node can mount the volume read/write
- **ReadOnlyMany** - any node can mount the volume read-only
- **ReadWriteMany** - any node can mount the volume read/write
  - Note: This mode is not supported by GCP persistent disks



### Lab: Volumes and persistent storage

**mysql-volumeclaim.yaml**

```
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: mysql-volumeclaim
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 200Gi
```



**mysql-development.yaml**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql
  labels:
    app: mysql
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
        - image: mysql:5.6
          name: mysql
          env:
            - name: MYSQL_ROOT_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: mysql
                  key: password
          ports:
            - containerPort: 3306
              name: mysql
          volumeMounts:
            - name: mysql-persistent-storage
              mountPath: /var/lib/mysql
      volumes:
        - name: mysql-persistent-storage
          persistentVolumeClaim:
            claimName: mysql-volumeclaim
```



**mysql-service.yaml**

```
apiVersion: v1
kind: Service
metadata:
  name: mysql
  labels:
    app: mysql
spec:
  type: ClusterIP
  ports:
    - port: 3306
  selector:
    app: mysql
```



**wordpress-volumeclaim.yaml**

```
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: wordpress-volumeclaim
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 200Gi
```



**wordpress-deployment.yaml**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wordpress
  labels:
    app: wordpress
spec:
  replicas: 1
  selector:
    matchLabels:
      app: wordpress
  template:
    metadata:
      labels:
        app: wordpress
    spec:
      containers:
        - image: wordpress
          name: wordpress
          env:
          - name: WORDPRESS_DB_HOST
            value: mysql:3306
          - name: WORDPRESS_DB_PASSWORD
            valueFrom:
              secretKeyRef:
                name: mysql
                key: password
          ports:
            - containerPort: 80
              name: wordpress
          volumeMounts:
            - name: wordpress-persistent-storage
              mountPath: /var/www/html
      volumes:
        - name: wordpress-persistent-storage
          persistentVolumeClaim:
            claimName: wordpress-volumeclaim
```



**wordpress-service.yaml**

```
apiVersion: v1
kind: Service
metadata:
  labels:
    app: wordpress
  name: wordpress
spec:
  type: LoadBalancer
  ports:
    - port: 80
      targetPort: 80
      protocol: TCP
  selector:
    app: wordpress
```



```
# Create mysql persistentvolumeclaim
$ kubectl apply -f mysql-volumeclaim.yaml
persistentvolumeclaim/mysql-volumeclaim created

# Create wordpress persistentvolumeclaim
$ kubectl apply -f wordpress-volumeclaim.yaml
persistentvolumeclaim/wordpress-volumeclaim created

# List persistentvolumeclaim 
$ kubectl get pvc
NAME                    STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
mysql-volumeclaim       Bound    pvc-ae0e4d77-8b73-435d-94be-1a1b838b344c   200Gi      RWO            standard       35s
wordpress-volumeclaim   Bound    pvc-29ab528d-d9b9-4ebd-9f98-b959f64c06fa   200Gi      RWO            standard       24s
```



```
# Create sercret
$ kubectl create secret generic mysql --from-literal=password=MYSECRETPASS
secret/mysql created
```



```
# Create mysql deployment
$ kubectl apply -f mysql-deployment.yaml
deployment.apps/mysql created

# Create mysql service
$ kubectl apply -f mysql-service.yaml
service/mysql created

# List pods
$ kubectl get pods
NAME                    READY   STATUS              RESTARTS   AGE
mysql-85d8486b9-ckr2v   0/1     ContainerCreating   0          16s

# List pods
$ kubectl get pods
NAME                    READY   STATUS    RESTARTS   AGE
mysql-85d8486b9-ckr2v   1/1     Running   0          28s

# List services
$ kubectl get services
NAME         TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)    AGE
kubernetes   ClusterIP   10.4.0.1      <none>        443/TCP    79m
mysql        ClusterIP   10.4.14.207   <none>        3306/TCP   43s

$ kubectl apply -f wordpress-deployment.yaml
deployment.apps/wordpress created

$ kubectl apply -f wordpress-service.yaml
service/wordpress created

$ kubectl get pods
NAME                       READY   STATUS              RESTARTS   AGE
mysql-85d8486b9-ckr2v      1/1     Running             0          4m23s
wordpress-c7cbfc75-4gdt6   0/1     ContainerCreating   0          12s

$ kubectl get pods
NAME                       READY   STATUS    RESTARTS   AGE
mysql-85d8486b9-ckr2v      1/1     Running   0          4m59s
wordpress-c7cbfc75-4gdt6   1/1     Running   0          48s

$ kubectl get services
NAME         TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP      10.4.0.1      <none>        443/TCP        83m
mysql        ClusterIP      10.4.14.207   <none>        3306/TCP       5m3s
wordpress    LoadBalancer   10.4.5.236    34.92.29.7    80:31361/TCP   53s

# Delete mysql pod
$ kubectl delete pod -l app=mysql
pod "mysql-85d8486b9-ckr2v" deleted

# Check the contents of wordpress if still there after deleting mysql pod 
```

**Browse external IP in the browser**

![](images/wordpress.png)



```
$ kubectl delete -f wordpress-service.yaml
service "wordpress" deleted

$ kubectl delete -f wordpress-deployment.yaml
deployment.apps "wordpress" deleted

$ kubectl delete -f wordpress-volumeclaim.yaml
persistentvolumeclaim "wordpress-volumeclaim" deleted

$ kubectl delete -f mysql-service.yaml
service "mysql" deleted

$ kubectl delete -f mysql-deployment.yaml
deployment.apps "mysql" deleted

$ kubectl delete -f mysql-volumeclaim.yaml
persistentvolumeclaim "mysql-volumeclaim" deleted
```



## Configmaps and Secrets

### Secrets

- Design to **obfuscate** the storage of **sensitive data**
- Consumed as **environment variables** or **volumes**
- Secrets are **encoded** only - **not encrypted** by default
- Secrets can be encrypted with **Cloud KMS**

### Configmaps

- **Decouple** configuration from image content
- Created from **files**, **directories** or **literal values**
- Values can be referenced as **environment** varialbles
- Configmap data may also be mounted as a **Volume**



## Deployment Patters

### Stateless Application Updates

1. **Rolling Updates**

- Gradually **replace** Pods with an **updated spec**
- **Control** how many **additional** Pods may be created
- Specify **threshold** for **failed** Pods

2. **Canary Deployments**

- Combines multiple **Deployments** with a single Service
- Deploy updates to a **small** subset of traffic
- Testing with **production** traffic

![](images/canary_deplyment.png)

3. **Blue-Green Deployment**
- Maitain two versions of your application development

- Switch traffic from blue to green with Service selector

- All traffic immediately sent to a new deplyment

- Switch back in the event of problems

  

### Lab: Deployment patterns

#### Blue=Green Deployment

**template.html**

```
<!DOCTYPE html>
<html>
    <head>
        <title>{{ title }}</title>
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
    </head>
    <body bgcolor="{{ bgcolor }}">
        <h1 style="color:white;font-family:Arial, Helvetica, sans-serif;text-align: center">
            <strong>
                {{ title }}
            </strong>
        </h1>
    </body>
</html>
```



**server.py**

```

import tornado.ioloop
import tornado.web
import pymysql


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        title = "Hello, Verion 2!"
        bgcolor = "indigo"
        self.render("template.html", title=title, bgcolor=bgcolor)
        print(self.request)


class ProbeHandler(tornado.web.RequestHandler):
    def get(self):
        try:
            db = pymysql.connect('localhost', 'myapp', 'password', 'myapp')
            cursor = db.cursor()
            cursor.execute("SELECT VERSION()")
            result = cursor.fetchone()
            title = "OK - DB version: %s" % result
            bgcolor = "limegreen"
            self.set_status(200)
        except pymysql.Error as e:
            title = "NOT OK - %s" % e
            bgcolor = "darkred"
            self.set_status(503)
        self.render("template.html", title=title, bgcolor=bgcolor)


def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
        (r"/isalive", ProbeHandler),
        (r"/isready", ProbeHandler),
    ])


if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()
```

```
# Build images and upload to google cloud repository
$ gcloud builds submit --tag gcr.io/owen-project-285301/myapp:v1

# Change Title to Version 2 in server.pyand
# Build images and upload to google cloud repository
$ gcloud builds submit --tag gcr.io/owen-project-285301/myapp:v2

# Change Title to Version 3 in server.py and
# Build images and upload to google cloud repository
$ gcloud builds submit --tag gcr.io/owen-project-285301/myapp:v2

```



**myapp-blue.yaml**

```

apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-blue
  labels:
    app: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
      version: blue
  template:
    metadata:
      labels:
        app: myapp
        version: blue
    spec:
      containers:
      - name: myapp
        image: gcr.io/owen-project-285301/myapp:v1
        ports:
        - containerPort: 8888
```



```
$ kubectl apply -f myapp-blue.yaml
deployment.apps/myapp-blue created

$ kubectl get pods
NAME                          READY   STATUS    RESTARTS   AGE
myapp-blue-78575bfff7-mwbfn   1/1     Running   0          46s
myapp-blue-78575bfff7-r9k24   1/1     Running   0          46s
myapp-blue-78575bfff7-wrkkj   1/1     Running   0          46s
```



**myapp-service.yaml**

```
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp
    version: blue
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8888
  type: LoadBalancer
```



```
$ kubectl apply -f myapp-service.yaml
service/myapp-service created

$ kubectl get services
NAME            TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)        AGE
kubernetes      ClusterIP      10.108.0.1     <none>          443/TCP        115m
myapp-service   LoadBalancer   10.108.0.127   35.241.108.18   80:32012/TCP   66s
```



**Browse the external IP in the browser**

![](images/blue-green-version1.png)



myapp-green.yaml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-green
  labels:
    app: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
      version: green
  template:
    metadata:
      labels:
        app: myapp
        version: green
    spec:
      containers:
      - name: myapp
        image: gcr.io/owen-project-285301/myapp:v2
        ports:
        - containerPort: 8888
```

```
$ kubectl apply -f myapp-green.yaml
deployment.apps/myapp-green created

$ kubectl get pods
NAME                           READY   STATUS    RESTARTS   AGE
myapp-blue-78575bfff7-mwbfn    1/1     Running   0          25m
myapp-blue-78575bfff7-r9k24    1/1     Running   0          25m
myapp-blue-78575bfff7-wrkkj    1/1     Running   0          25m
myapp-green-7d8b994b77-2p58q   1/1     Running   0          12s
myapp-green-7d8b994b77-c9rbs   1/1     Running   0          12s
myapp-green-7d8b994b77-j7nnm   1/1     Running   0          12s
sherwin@cloudshell:~/myapp (owen-project-285301)$
```



**myapp-service.yaml**

```
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp
    version: green
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8888
  type: LoadBalancer
```



```
$ kubectl apply -f myapp-service.yaml
service/myapp-service configured

$ kubectl describe service myapp-service
Name:                     myapp-service
Namespace:                default
Labels:                   <none>
Annotations:              <none>
Selector:                 app=myapp,version=green
Type:                     LoadBalancer
IP:                       10.108.0.127
LoadBalancer Ingress:     35.241.108.18
Port:                     <unset>  80/TCP
TargetPort:               8888/TCP
NodePort:                 <unset>  32012/TCP
Endpoints:                10.104.0.8:8888,10.104.1.6:8888,10.104.2.12:8888
Session Affinity:         None
External Traffic Policy:  Cluster
Events:
  Type    Reason                Age                From                Message
  ----    ------                ----               ----                -------
  Normal  EnsuringLoadBalancer  12m (x2 over 49m)  service-controller  Ensuring load balancer
  Normal  EnsuredLoadBalancer   12m (x2 over 48m)  service-controller  Ensured load balancer

$ kubectl get services
NAME            TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)        AGE
kubernetes      ClusterIP      10.108.0.1     <none>          443/TCP        151m
myapp-service   LoadBalancer   10.108.0.127   35.241.108.18   80:32012/TCP   36m
```



**Browse the external IP in the browser**

![](images/blue-green-version2.png)



**myapp-blue.yaml**

```

apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-blue
  labels:
    app: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
      version: blue
  template:
    metadata:
      labels:
        app: myapp
        version: blue
    spec:
      containers:
      - name: myapp
        image: gcr.io/owen-project-285301/myapp:v3
        ports:
        - containerPort: 8888
```



```
$ kubectl apply -f myapp-blue.yaml
deployment.apps/myapp-blue configured

$ watch kubectl get pods
```



**myapp-service.yaml**

```
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp
    version: blue
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8888
  type: LoadBalancer
```



```
$ kubectl apply -f myapp-service.yaml
service/myapp-service configured

$ kubectl get services
NAME            TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)        AGE
kubernetes      ClusterIP      10.108.0.1     <none>          443/TCP        171m
myapp-service   LoadBalancer   10.108.0.127   35.241.108.18   80:32012/TCP   56m
```



![](images/blue-green-version3.png)



#### Canary Deployment

**myapp-prod.yaml**

```
 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-prod
  labels:
    app: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: gcr.io/owen-project-285301/myapp:v1
        ports:
        - containerPort: 8888
```



**myapp-canary.yaml**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-canary
  labels:
    app: myapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: gcr.io/owen-project-285301/myapp:v3
        ports:
        - containerPort: 8888
```



**myapp-service.yaml**

```
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8888
  type: LoadBalancer
```



```
$ kubectl apply -f myapp-prod.yaml
deployment.apps/myapp-prod created

$ kubectl apply -f myapp-canary.yaml
deployment.apps/myapp-canary created

$ kubectl apply - yapp-service.yaml
service/myapp-service configured

$ kubectl get pods
NAME                            READY   STATUS    RESTARTS   AGE
myapp-canary-7bc868d7bc-tmbd9   1/1     Running   0          9m45s
myapp-prod-9dd544f45-2hbkf      1/1     Running   0          9m52s
myapp-prod-9dd544f45-b5827      1/1     Running   0          9m50s
myapp-prod-9dd544f45-qjkrc      1/1     Running   0          9m48s

$ kubectl get services
NAME            TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)        AGE
kubernetes      ClusterIP      10.108.0.1     <none>          443/TCP        4h47m
myapp-service   LoadBalancer   10.108.0.127   35.241.108.18   80:32012/TCP   173m

$ while true; do curl http://35.241.108.18/; sleep 0.5; done
```



#### Deployment Strategies

**Rolling Deployment**

- The rolling deployment is the standard default deployment to Kubernetes. It works by slowly, one by one, replacing pods of the previous version of your application with pods of the new version without any cluster downtime.

**Recreate**

- In this type of very simple deployment, all of the old pods are killed all at once and get replaced all at once with the new ones.

**Blue/ Green (or Red / Black) deployments**

- In a blue/green deployment strategy (sometimes referred to as red/black) the old version of the application (green) and the new version (blue) get deployed at the same time.
-  When both of these are deployed, users only have access to the green; whereas, the blue is available to your QA team for test automation on a separate service or via direct port-forwarding.



## Autoscaling all the things

### Automatically scaling deployments

- **Horizontally** scale **Pods** to increase capacity when **demand** is high
  - HorizontalPodAutoscaler
- **Vertically** scale **Pods** to increase resources assigned to individual Pods
  - VerticalPodAutoscaler
- Scale **cluster nodes** when demand is so high that extra VMs are required
  - Node-pool cluster autoscaliing in GKE

### Horizantal Pod Autoscaler

- Auto-scales the number of Pod replicas in a ReplicaSet/Deployment
- CPU and Memory thresholds are observed by GKE to trigger scaling
- Custom, multiple and external metrics also supported
- Stackdriver metrics can also be used

![](images/hrizontal-pod-autosacaler.png)



### Vertical Pod Autoscaler

- Automatically recommends or applies CPU and RAM requests for Pods
- More suited to stateful deployments
- Cannot work alongside the Horizontal Pod Autoscaler
- Current in Beta in GKE

![](images/vertical-pod-autoscaler.png)



### Cluster Autoscaler

- Automatically grow or shrink your GKE cluster based on demand
- New nodes added when Pods don't have enough capacity to run
- Underutilized nodes automatically deleted
- Works best with Node Pools
- Group VM nodes of a specific type together - eg. High CPU or High RAM



### Lab: Autoscaling of all things

**myapp-scaling.yaml**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
  labels:
    app: myapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: gcr.io/owen-project-285301/myapp:blue
        ports:
        - containerPort: 8888
        resources:
          requests:
            cpu: 200m
```



**myapp-hpa.yaml**

```
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: myapp-hpa
spec:
  maxReplicas: 20
  minReplicas: 1
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: myapp-deployment
  targetCPUUtilizationPercentage: 60

```



**myapp-service.yaml**

```
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8888
  type: LoadBalancer
```



```
$ kubectl apply -f myapp-scaling.yaml
deployment.apps/myapp-deployment created

$ kubectl apply -f myapp-service.yaml
service/myapp-service created

$ kubectl apply -f myapp-hpa.yaml
horizontalpodautoscaler.autoscaling/myapp-hpa created


$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
myapp-deployment-79c5d959b5-8tpdb   1/1     Running   0          76s

# Watch pods increase
$ watch kubectl get pods -o wide

# Watch nodes increase
$ watch kubectl get nodes


$ hey http://35.220.183.14/
Summary:
  Total:        0.2052 secs
  Slowest:      0.0702 secs
  Fastest:      0.0384 secs
  Average:      0.0471 secs
  Requests/sec: 974.7193
  Total data:   47000 bytes
  Size/request: 235 bytes
Response time histogram:
  0.038 [1]     |■
  0.042 [22]    |■■■■■■■■■■■■
  0.045 [76]    |■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  
  

$ hey -z 2m -c 25 http://35.220.183.14/

Summary:
  Total:        120.0239 secs
  Slowest:      0.1368 secs
  Fastest:      0.0144 secs
  Average:      0.0283 secs
  Requests/sec: 881.7658

  Total data:   24870755 bytes
  Size/request: 235 bytes

Response time histogram:
  0.014 [1]     |
  0.027 [43120] |■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.039 [58707] |■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.051 [2879]  |■■
  0.063 [479]   |
  0.076 [429]   |
  0.088 [87]    |
  0.100 [25]    |
  0.112 [35]    |
  0.125 [50]    |
  0.137 [21]    |


Latency distribution:
  10% in 0.0247 secs
  25% in 0.0259 secs
  50% in 0.0271 secs
  75% in 0.0287 secs
  90% in 0.0326 secs
  95% in 0.0370 secs
  99% in 0.0524 secs

Details (average, fastest, slowest):
  DNS+dialup:   0.0000 secs, 0.0144 secs, 0.1368 secs
  DNS-lookup:   0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:    0.0000 secs, 0.0000 secs, 0.0036 secs
  resp wait:    0.0282 secs, 0.0143 secs, 0.1368 secs
  resp read:    0.0001 secs, 0.0000 secs, 0.0048 secs

Status code distribution:
  [200] 105833 responses

```



**Enable autoscaling in GKE minimum=1 maximum=3  pods**

## Helm: The Kubernetes package manager

### What is Helm

- Packages Kubernetes object manifests and configuration in a Helm chart
- Maintains the lifecylcle of a deployment to GKE
- A command line tool (helm) and a server-side component (tiller)
- Public repos of helm charts for popular software
- Some security considerations - futureversions will remove tiller
- Other manifes-management solutions are available



**Using Helm**

- Install the helm tool
- Initialise Helm for your cluster
- Install a Helm chart
  - helm install stable/wordpress
- Helm applies the templated manifests from the chart to your cluster

### Lab: Deploying application with Helm

**tiller-serviceaccount.yaml**

```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: helm
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: helm
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: ServiceAccount
    name: helm
    namespace: kube-system
```



```
# Create serviceaccount for helm
$ kubectl apply -f tiller-serviceaccount.yaml
serviceaccount/helm created
clusterrolebinding.rbac.authorization.k8s.io/helm created
```



```
# Install helm
$ wget https://git.io/get_helm.sh

$ chmod 700 get_helm.sh

$ ./get_helm.sh
Helm v2.16.12 is available. Changing from version .
Downloading https://get.helm.sh/helm-v2.16.12-linux-amd64.tar.gz
Preparing to install helm and tiller into /usr/local/bin
helm installed into /usr/local/bin/helm
tiller installed into /usr/local/bin/tiller
Run 'helm init' to configure helm.

# Initialized helm
$ helm init --service-account helm
Creating /home/sherwin/.helm
Creating /home/sherwin/.helm/repository
Creating /home/sherwin/.helm/repository/cache
Creating /home/sherwin/.helm/repository/local
Creating /home/sherwin/.helm/plugins
Creating /home/sherwin/.helm/starters
Creating /home/sherwin/.helm/cache/archive
Creating /home/sherwin/.helm/repository/repositories.yaml
Adding stable repo with URL: https://kubernetes-charts.storage.googleapis.com
Adding local repo with URL: http://127.0.0.1:8879/charts
$HELM_HOME has been configured at /home/sherwin/.helm.

Tiller (the Helm server-side component) has been installed into your Kubernetes Cluster.

Please note: by default, Tiller is deployed with an insecure 'allow unauthenticated users' policy.
To prevent this, run `helm init` with the --tiller-tls-verify flag.
For more information on securing your installation see: https://v2.helm.sh/docs/securing_installation/

# Check tiller service and deplyment
$ kubectl get deploy,svc tiller-deploy -n kube-system
NAME                                  READY   UP-TO-DATE   AVAILABLE   AGE
deployment.extensions/tiller-deploy   1/1     1            1           44s

NAME                    TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)     AGE
service/tiller-deploy   ClusterIP   10.108.4.4   <none>        44134/TCP   43s

```



**Helm stable repository (https://github.com/helm/charts/tree/master/stable)**



```
# Install bookstack
$ helm install stable/bookstack
NAME:   pugnacious-jellyfish
LAST DEPLOYED: Thu Oct  8 10:13:34 2020
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/ConfigMap
NAME                                       DATA  AGE
pugnacious-jellyfish-mariadb               1     0s
pugnacious-jellyfish-mariadb-init-scripts  1     0s
pugnacious-jellyfish-mariadb-tests         1     0s

==> v1/Deployment
NAME                            READY  UP-TO-DATE  AVAILABLE  AGE
pugnacious-jellyfish-bookstack  0/1    1           0          0s

==> v1/PersistentVolumeClaim
NAME                                    STATUS   VOLUME    CAPACITY  ACCESS MODES  STORAGECLASS  AGE
pugnacious-jellyfish-bookstack-storage  Pending  standard  0s
pugnacious-jellyfish-bookstack-uploads  Pending  standard  0s

==> v1/Pod(related)
NAME                                             READY  STATUS             RESTARTS  AGE
pugnacious-jellyfish-bookstack-668d4b8867-2wdg7  0/1    Pending            0         0s
pugnacious-jellyfish-mariadb-0                   0/1    ContainerCreating  0         0s

==> v1/Role
NAME                            AGE
pugnacious-jellyfish-bookstack  0s

==> v1/RoleBinding
NAME                            AGE
pugnacious-jellyfish-bookstack  0s

==> v1/Secret
NAME                          TYPE    DATA  AGE
pugnacious-jellyfish-mariadb  Opaque  2     0s

==> v1/Service
NAME                            TYPE       CLUSTER-IP    EXTERNAL-IP  PORT(S)   AGE
pugnacious-jellyfish-bookstack  ClusterIP  10.108.7.207  <none>       80/TCP    0s
pugnacious-jellyfish-mariadb    ClusterIP  10.108.7.72   <none>       3306/TCP  0s

==> v1/ServiceAccount
NAME                            SECRETS  AGE
pugnacious-jellyfish-bookstack  1        0s

==> v1beta1/StatefulSet
NAME                          READY  AGE
pugnacious-jellyfish-mariadb  0/1    0s


NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app=bookstack,release=pugnacious-jellyfish" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:80

$ kubectl get deployments
NAME                             READY   UP-TO-DATE   AVAILABLE   AGE
pugnacious-jellyfish-bookstack   1/1     1            1           4m46s

$ kubectl get statefulsets
NAME                           READY   AGE
pugnacious-jellyfish-mariadb   1/1     5m3s

$ kubectl get services
NAME                             TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
kubernetes                       ClusterIP   10.108.0.1     <none>        443/TCP    33m
pugnacious-jellyfish-bookstack   ClusterIP   10.108.7.207   <none>        80/TCP     5m45s
pugnacious-jellyfish-mariadb     ClusterIP   10.108.7.72    <none>        3306/TCP   5m45s

$ kubectl get pv
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                                            STORAGECLASS   REASON   AGE
pvc-480ee52d-389c-49af-8b88-931a1810a298   8Gi        RWO            Delete           Bound    default/pugnacious-jellyfish-bookstack-storage   standard                6m
pvc-cc82cd2c-e95b-4fdd-b909-59e95c95c19b   8Gi        RWO            Delete           Bound    default/pugnacious-jellyfish-bookstack-uploads   standard                6m

$ helm status pugnacious-jellyfish
LAST DEPLOYED: Thu Oct  8 10:13:34 2020
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/ConfigMap
NAME                                       DATA  AGE
pugnacious-jellyfish-mariadb               1     7m54s
pugnacious-jellyfish-mariadb-init-scripts  1     7m54s
pugnacious-jellyfish-mariadb-tests         1     7m54s

==> v1/Deployment
NAME                            READY  UP-TO-DATE  AVAILABLE  AGE
pugnacious-jellyfish-bookstack  1/1    1           1          7m54s

==> v1/PersistentVolumeClaim
NAME                                    STATUS  VOLUME                                    CAPACITY  ACCESS MODES  STORAGECLASS  AGE
pugnacious-jellyfish-bookstack-storage  Bound   pvc-480ee52d-389c-49af-8b88-931a1810a298  8Gi       RWO           standard      7m54s
pugnacious-jellyfish-bookstack-uploads  Bound   pvc-cc82cd2c-e95b-4fdd-b909-59e95c95c19b  8Gi       RWO           standard      7m54s
```



**Change the service type to LoadBalancer**

```
$ helm upgrade --set service.type='LoadBalancer' pugnacious-jellyfish stable/bookstack
Release "pugnacious-jellyfish" has been upgraded.
LAST DEPLOYED: Thu Oct  8 10:30:12 2020
NAMESPACE: default
STATUS: DEPLOYED
RESOURCES:
==> v1/ConfigMap
NAME                                       DATA  AGE
pugnacious-jellyfish-mariadb               1     16m
pugnacious-jellyfish-mariadb-init-scripts  1     16m
pugnacious-jellyfish-mariadb-tests         1     16m
==> v1/Deployment
NAME                            READY  UP-TO-DATE  AVAILABLE  AGE
pugnacious-jellyfish-bookstack  1/1    1           1          16m
==> v1/PersistentVolumeClaim
NAME                                    STATUS  VOLUME                                    CAPACITY  ACCESS MODES  STORAGECLASS  AGE
pugnacious-jellyfish-bookstack-storage  Bound   pvc-480ee52d-389c-49af-8b88-931a1810a298  8Gi       RWO           standard      16m
pugnacious-jellyfish-bookstack-uploads  Bound   pvc-cc82cd2c-e95b-4fdd-b909-59e95c95c19b  8Gi       RWO           standard      16m
==> v1/Pod(related)
NAME                                             READY  STATUS   RESTARTS  AGE
pugnacious-jellyfish-bookstack-668d4b8867-2wdg7  1/1    Running  0         16m
pugnacious-jellyfish-mariadb-0                   1/1    Running  0         16m
==> v1/Role
NAME                            AGE
pugnacious-jellyfish-bookstack  16m
==> v1/RoleBinding
NAME                            AGE
pugnacious-jellyfish-bookstack  16m
==> v1/Secret
NAME                          TYPE    DATA  AGE
pugnacious-jellyfish-mariadb  Opaque  2     16m
==> v1/Service
NAME                            TYPE          CLUSTER-IP    EXTERNAL-IP  PORT(S)       AGE
pugnacious-jellyfish-bookstack  LoadBalancer  10.108.7.207  <pending>    80:30670/TCP  16m
pugnacious-jellyfish-mariadb    ClusterIP     10.108.7.72   <none>       3306/TCP      16m
==> v1/ServiceAccount
NAME                            SECRETS  AGE
pugnacious-jellyfish-bookstack  1        16m
==> v1beta1/StatefulSet
NAME                          READY  AGE
pugnacious-jellyfish-mariadb  1/1    16m
NOTES:
1. Get the application URL by running these commands:
     NOTE: It may take a few minutes for the LoadBalancer IP to be available.
           You can watch the status of by running 'kubectl get svc -w pugnacious-jellyfish-bookstack'
  export SERVICE_IP=$(kubectl get svc --namespace default pugnacious-jellyfish-bookstack -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  echo http://$SERVICE_IP:80
```



**List the charts installed**

```
$ helm list
NAME                    REVISION        UPDATED                         STATUS          CHART           APP VERSION     NAMESPACE
pugnacious-jellyfish    2               Thu Oct  8 10:30:12 2020        DEPLOYED        bookstack-1.2.1 0.27.5          default
```



**Delete chart installed**

```
$ helm delete pugnacious-jellyfish
release "pugnacious-jellyfish" deleted
```



### Another way to install chart in helm

```
# Download values.yaml in bookstack repo
wget https://raw.githubusercontent.com/helm/charts/master/stable/bookstack/values.yaml

# Install bookstack
$ helm install -f values.yaml stable/bookstack --name owen-bookstack
NAME:   owen-bookstack
LAST DEPLOYED: Thu Oct  8 10:49:03 2020
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/ConfigMap
NAME                                 DATA  AGE
owen-bookstack-mariadb               1     0s
owen-bookstack-mariadb-init-scripts  1     0s
owen-bookstack-mariadb-tests         1     0s

==> v1/Deployment
NAME            READY  UP-TO-DATE  AVAILABLE  AGE
owen-bookstack  0/1    1           0          0s

==> v1/PersistentVolumeClaim
NAME                    STATUS   VOLUME    CAPACITY  ACCESS MODES  STORAGECLASS  AGE
owen-bookstack-storage  Pending  standard  0s
owen-bookstack-uploads  Pending  standard  0s

==> v1/Pod(related)
NAME                             READY  STATUS             RESTARTS  AGE
owen-bookstack-67dbcb8d89-w5wg4  0/1    Pending            0         0s
owen-bookstack-mariadb-0         0/1    ContainerCreating  0         0s

==> v1/Role
NAME            AGE
owen-bookstack  0s

==> v1/RoleBinding
NAME            AGE
owen-bookstack  0s

==> v1/Secret
NAME                    TYPE    DATA  AGE
owen-bookstack-mariadb  Opaque  2     0s

==> v1/Service
NAME                    TYPE          CLUSTER-IP    EXTERNAL-IP  PORT(S)       AGE
owen-bookstack          LoadBalancer  10.108.4.203  <pending>    80:30864/TCP  0s
owen-bookstack-mariadb  ClusterIP     10.108.7.9    <none>       3306/TCP      0s

==> v1/ServiceAccount
NAME            SECRETS  AGE
owen-bookstack  1        0s

==> v1beta1/StatefulSet
NAME                    READY  AGE
owen-bookstack-mariadb  0/1    0s


NOTES:
1. Get the application URL by running these commands:
     NOTE: It may take a few minutes for the LoadBalancer IP to be available.
           You can watch the status of by running 'kubectl get svc -w owen-bookstack'
  export SERVICE_IP=$(kubectl get svc --namespace default owen-bookstack -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  echo http://$SERVICE_IP:80
  
$ kubectl get pods
NAME                              READY   STATUS    RESTARTS   AGE
owen-bookstack-67dbcb8d89-w5wg4   1/1     Running   1          113s


$ kubectl get pv
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                            STORAGECLASS   REASON   AGE
pvc-8a73d655-1bcd-4c1b-bfa9-d95e1a5076bd   20Gi       RWO            Delete           Bound    default/owen-bookstack-uploads   standard                102s
pvc-cf181236-0bb8-410f-8446-cf139c2e3112   20Gi       RWO            Delete           Bound    default/owen-bookstack-storage   standard                102s


$ kubectl get services
NAME                     TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
kubernetes               ClusterIP      10.108.0.1     <none>        443/TCP        65m
owen-bookstack           LoadBalancer   10.108.4.203   34.92.74.91   80:30864/TCP   2m11s
owen-bookstack-mariadb   ClusterIP      10.108.7.9     <none>        3306/TCP       2m11s


```



## Advanced Ingress control

**Ingress**

- A more customizable way to expose traffic than a cloud load balancer

- An Ingress object configures access to services from outside the cluster

- Designed for HTTP and HTTPS services

- Can provide SSL, name-based and path-based routing

**Ingress Controller**

- Routes traffic to services based on Ingress definitions
- Usually fronted by a cloud load balancer
- Consolidates your routing through a single resource
- NGINX Ingres Controller deployment is very common
- Other ingress controllers are available

![](images/ingress_controller.png)

  

![](images/ingress_controller1.png)



**NGINX Ingress Controller**

- Easily installed via helm
- Runs as a deployment or DaemonSet
- Supports autoscalling
- Supported by the Kubernetes project

### Lab: Ingress Controller

1. Install helm and tiller
2. Install nginx ingress controller

```
$ helm install --name nginx-ingress stable/nginx-ingress

$ kubectl get services
NAME                            TYPE           CLUSTER-IP   EXTERNAL-IP     PORT(S)                      AGE
kubernetes                      ClusterIP      10.4.0.1     <none>          443/TCP                      27m
nginx-ingress-controller        LoadBalancer   10.4.1.229   35.220.183.14   80:32278/TCP,443:32282/TCP   4m37s
nginx-ingress-default-backend   ClusterIP      10.4.14.96   <none>          80/TCP                       4m37s
```



myapp-blue.yaml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-blue
  labels:
    app: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
      version: blue
  template:
    metadata:
      labels:
        app: myapp
        version: blue
    spec:
      containers:
      - name: myapp
        image: gcr.io/owen-project-285301/myapp:blue
        ports:
        - containerPort: 8888
```



myapp-green.yaml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-green
  labels:
    app: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
      version: green
  template:
    metadata:
      labels:
        app: myapp
        version: green
    spec:
      containers:
      - name: myapp
        image: gcr.io/owen-project-285301/myapp:green
        ports:
        - containerPort: 8888
```



myapp-service.yaml

```

apiVersion: v1
kind: Service
metadata:
  name: myapp-blue-service
spec:
  selector:
    app: myapp
    version: blue
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8888
---
apiVersion: v1
kind: Service
metadata:
  name: myapp-green-service
spec:
  selector:
    app: myapp
    version: green
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8888
```



```
$ kubectl apply -f myapp-blue.yaml
deployment.apps/myapp-blue created

$ kubectl apply -f myapp-green.yaml
deployment.apps/myapp-green created

$ kubectl apply -f myapp-service.yaml
service/myapp-blue-service created
service/myapp-green-service created

$ kubectl get pods
NAME                                             READY   STATUS    RESTARTS   AGE
myapp-blue-7ffdd4d54d-4xgs7                      1/1     Running   0          3m7s
myapp-blue-7ffdd4d54d-8kd28                      1/1     Running   0          3m7s
myapp-blue-7ffdd4d54d-slgbq                      1/1     Running   0          3m7s
myapp-green-58b767ccc6-85fcq                     1/1     Running   0          2m53s
myapp-green-58b767ccc6-j8x72                     1/1     Running   0          2m54s
myapp-green-58b767ccc6-ww9p9                     1/1     Running   0          2m53s
nginx-ingress-controller-6b5498d8dc-tph2z        1/1     Running   0          20m
nginx-ingress-default-backend-674d599c48-v4k6k   1/1     Running   0          20m

$ kubectl get services
NAME                            TYPE           CLUSTER-IP   EXTERNAL-IP     PORT(S)                      AGE
kubernetes                      ClusterIP      10.4.0.1     <none>          443/TCP                      43m
myapp-blue-service              ClusterIP      10.4.5.245   <none>          80/TCP                       113s
myapp-green-service             ClusterIP      10.4.4.76    <none>          80/TCP                       113s
nginx-ingress-controller        LoadBalancer   10.4.1.229   35.220.183.14   80:32278/TCP,443:32282/TCP   20m
nginx-ingress-default-backend   ClusterIP      10.4.14.96   <none>          80/TCP                       20m
sherwin@cloudshell:~/myapp (owen-project-285301)$

```


ingress-blue.yaml

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: blue-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/ssl-redirect: "false"
    nginx.ingress.kubernetes.io/rewrite-target: / 
spec:
  rules:
  - host: myapp.example.com
    http:
      paths:
      - path: /blue
        backend:
          serviceName: myapp-blue-service
          servicePort: 80
```



ingress-green.yaml

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: green-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/ssl-redirect: "false"
    nginx.ingress.kubernetes.io/rewrite-target: / 
spec:
  rules:
  - host: myapp.example.com
    http:
      paths:
      - path: /green
        backend:
          serviceName: myapp-green-service
          servicePort: 80
```



```
$ kubectl apply -f ingress-blue.yaml
ingress.extensions/blue-ingress created

$ kubectl apply -f ingress-green.yaml
ingress.extensions/green-ingress created

# List ingress
$ kubectl get ingress
NAME            HOSTS               ADDRESS      PORTS   AGE
blue-ingress    myapp.example.com   34.92.29.7   80      36s
green-ingress   myapp.example.com   34.92.29.7   80      29s

sherwin@cloudshell:~/myapp (owen-project-285301)$ kubectl describe ingress blue-ingress
Name:             blue-ingress
Namespace:        default
Address:          34.92.29.7
Default backend:  default-http-backend:80 (10.0.2.3:8080)
Rules:
  Host               Path  Backends
  ----               ----  --------
  myapp.example.com
                     /blue   myapp-blue-service:80 (10.0.0.10:8888,10.0.1.4:8888,10.0.2.7:8888)
Annotations:         kubernetes.io/ingress.class: nginx
                     nginx.ingress.kubernetes.io/rewrite-target: /
                     nginx.ingress.kubernetes.io/ssl-redirect: false
Events:
  Type    Reason  Age   From                      Message
  ----    ------  ----  ----                      -------
  Normal  CREATE  119s  nginx-ingress-controller  Ingress default/blue-ingress
  Normal  UPDATE  87s   nginx-ingress-controller  Ingress default/blue-ingress

$ kubectl get services
NAME                            TYPE           CLUSTER-IP   EXTERNAL-IP     PORT(S)                      AGE
kubernetes                      ClusterIP      10.4.0.1     <none>          443/TCP                      78m
myapp-blue-service              ClusterIP      10.4.5.245   <none>          80/TCP                       36m
myapp-green-service             ClusterIP      10.4.4.76    <none>          80/TCP                       36m
nginx-ingress-controller        LoadBalancer   10.4.1.229   35.220.183.14   80:32278/TCP,443:32282/TCP   55m
nginx-ingress-default-backend   ClusterIP      10.4.14.96   <none>          80/TCP                       55m
  
$ curl --resolve myapp.example.com:80:35.220.183.14 http://myapp.example.com
default backend - 404sherwin@cloudshell:~/myapp (owen-project-285301)


$ curl --resolve myapp.example.com:80:35.220.183.14 http://myapp.example.com/blue
<!DOCTYPE html>
<html>
<head>
<title>Hello, World!</title>
</head>
<body bgcolor="dodgerblue">
<h1 style="color:white;font-family:Arial, Helvetica, sans-serif;text-align: center">
<strong>
Hello, World!
</strong>
</h1>
</body>
</html>


$ curl --resolve myapp.example.com:80:35.220.183.14 http://myapp.example.com/green
<!DOCTYPE html>
<html>
<head>
<title>Hello, World!</title>
</head>
<body bgcolor="limegreen">
<h1 style="color:white;font-family:Arial, Helvetica, sans-serif;text-align: center">
<strong>
Hello, World!
</strong>
</h1>
</body>
</html>
sherwin@cloudshell:~/myapp (owen-project-285301)$

```



Edit /etc/hosts

```
127.0.0.1       localhost cms.test phpmyadmin.test
127.0.1.1       owenbox

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

35.220.183.14   myapp.example.com
~                                        
```



Browse http://myapp.example.com/blue and http://myapp.example.com/green

![](images/web_ingress_blue.png)



![](images/web_ingress_green.png)



## High Availability clusters and workloads

### Lab: global load balancing with multi-cluster Ingress

```
# Create first cluster
$ KUBECONFIG=cluster.yaml gcloud container clusters create --zone=asia-east2-a cluster-1
WARNING: Warning: basic authentication is deprecated, and will be removed in GKE control plane versions 1.19 and newer. For a list of recommended authentication methods, see: https://cloud.google.com/kubernetes-engine/docs/how-to/api-server-authentication
WARNING: Currently VPC-native is not the default mode during cluster creation. In the future, this will become the default mode and can be disabled using `--no-enable-ip-alias` flag. Use `--[no-]enable-ip-alias` flag to suppress this warning.
WARNING: Newly created clusters and node-pools will have node auto-upgrade enabled by default. This can be disabled using the `--no-enable-autoupgrade` flag.
WARNING: Starting with version 1.18, clusters will have shielded GKE nodes by default.
WARNING: Your Pod address range (`--cluster-ipv4-cidr`) can accommodate at most 1008 node(s).
Creating cluster cluster-1 in asia-east2-a... Cluster is being health-checked (master is healthy)...done.
Created [https://container.googleapis.com/v1/projects/owen-project-285301/zones/asia-east2-a/clusters/cluster-1].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/asia-east2-a/cluster-1?project=owen-project-285301
kubeconfig entry generated for cluster-1.
NAME       LOCATION      MASTER_VERSION   MASTER_IP       MACHINE_TYPE   NODE_VERSION     NUM_NODES  STATUS
cluster-1  asia-east2-a  1.16.13-gke.401  35.220.217.113  n1-standard-1  1.16.13-gke.401  3          RUNNING

# Create second cluster
$ $ KUBECONFIG=cluster.yaml gcloud container clusters create --zone=asia-southeast1-a cluster-2
WARNING: Warning: basic authentication is deprecated, and will be removed in GKE control plane versions 1.19 and newer. For a list of recommended authentication methods, see: https://cloud.google.com/kubernetes-engine/docs/how-to/api-server-authentication
WARNING: Currently VPC-native is not the default mode during cluster creation. In the future, this will become the default mode and can be disabled using `--no-enable-ip-alias` flag. Use `--[no-]enable-ip-alias` flag to suppress this warning.
WARNING: Newly created clusters and node-pools will have node auto-upgrade enabled by default. This can be disabled using the `--no-enable-autoupgrade` flag.
WARNING: Starting with version 1.18, clusters will have shielded GKE nodes by default.
WARNING: Your Pod address range (`--cluster-ipv4-cidr`) can accommodate at most 1008 node(s).
Creating cluster cluster-2 in asia-southeast1-a... Cluster is being health-checked (master is healthy)...done.
Created [https://container.googleapis.com/v1/projects/owen-project-285301/zones/asia-southeast1-a/clusters/cluster-2].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/asia-southeast1-a/cluster-2?project=owen-project-285301
kubeconfig entry generated for cluster-2.
NAME       LOCATION           MASTER_VERSION   MASTER_IP       MACHINE_TYPE   NODE_VERSION     NUM_NODES  STATUS
cluster-2  asia-southeast1-a  1.16.13-gke.401  34.126.123.131  n1-standard-1  1.16.13-gke.401  3          RUNNING
```



```
$ mkdir manifests 
```

deplyment.yaml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: zoneprinter
  labels:
    app: zoneprinter
spec:
  selector:
    matchLabels:
      app: zoneprinter
  template:
    metadata:
      labels:
        app: zoneprinter
    spec:
      containers:
      - name: frontend
        image: gcr.io/google-samples/zone-printer:0.1
        ports:
          - containerPort: 80
```



service.yaml

```
apiVersion: v1
kind: Service
metadata:
  name: zoneprinter
  labels:
    app: zoneprinter
spec:
  type: NodePort
  selector:
    app: zoneprinter
  ports:
  - name: http
    port: 80
    nodePort: 30061
```



```
$ for ctx in $(kubectl config get-contexts -o=name --kubeconfig clusters.yaml); do
> kubectl --kubeconfig clusters.yaml --context="${ctx}" apply -f manifests/
> done
deployment.apps/zoneprinter created
service/zoneprinter created
deployment.apps/zoneprinter created
service/zoneprinter created

# OR YOU CAN DO IT ALTERNATIVELY

# Grab the cluster context name
$ kubectl --kubeconfig=clusters.yaml config get-contexts
CURRENT   NAME                                                  CLUSTER                                               AUTHINFO                                              NAMESPACE
          gke_owen-project-285301_asia-east2-a_cluster-1        gke_owen-project-285301_asia-east2-a_cluster-1        gke_owen-project-285301_asia-east2-a_cluster-1
*         gke_owen-project-285301_asia-southeast1-a_cluster-2   gke_owen-project-285301_asia-southeast1-a_cluster-2   gke_owen-project-285301_asia-southeast1-a_cluster-2

$ kubectl --kubeconfig=clusters.yaml --context="gke_owen-project-285301_asia-east2-a_cluster-1" apply -f manifests/
deployment.apps/zoneprinter created
service/zoneprinter created

$ kubectl --kubeconfig=clusters.yaml --context="gke_owen-project-285301_asia-southeast1-a_cluster-2" apply -f manifests/
deployment.apps/zoneprinter created
service/zoneprinter created
```



```
# Get contexts
$ kubectl --kubeconfig=clusters.yaml config get-contexts
CURRENT   NAME                                                  CLUSTER                                               AUTHINFO                                              NAMESPACE
          gke_owen-project-285301_asia-east2-a_cluster-1        gke_owen-project-285301_asia-east2-a_cluster-1        gke_owen-project-285301_asia-east2-a_cluster-1
*         gke_owen-project-285301_asia-southeast1-a_cluster-2   gke_owen-project-285301_asia-southeast1-a_cluster-2   gke_owen-project-285301_asia-southeast1-a_cluster-2

# Get current context
$ kubectl --kubeconfig=clusters.yaml config current-context
gke_owen-project-285301_asia-southeast1-a_cluster-2

# Switch context
$ kubectl --kubeconfig=clusters.yaml config use-context gke_owen-project-285301_asia-southeast1-a_cluster-2
Switched to context "gke_owen-project-285301_asia-southeast1-a_cluster-2".

# List deployment and service in cluster-2
$ kubectl --kubeconfig=clusters.yaml --context="gke_owen-project-285301_asia-southeast1-a_cluster-2" get deploy,svc
NAME                          READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/zoneprinter   1/1     1            1           23m

NAME                  TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/kubernetes    ClusterIP   10.3.240.1     <none>        443/TCP        61m
service/zoneprinter   NodePort    10.3.248.146   <none>        80:30061/TCP   27m

# List deployment and service in cluster-1
$ kubectl --kubeconfig=clusters.yaml --context="gke_owen-project-285301_asia-east2-a_cluster-1" get deploy,svc
NAME                          READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/zoneprinter   1/1     1            1           23m

NAME                  TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
service/kubernetes    ClusterIP   10.115.240.1     <none>        443/TCP        67m
service/zoneprinter   NodePort    10.115.245.117   <none>        80:30061/TCP   28m
sherwin@cloudshell:~/multicluster (owen-project-285301)$

```



```
# Get kubmci
$ wget https://storage.googleapis.com/kubemci-release/release/latest/bin/linux/amd64/kubemci
--2020-10-09 10:00:51--  https://storage.googleapis.com/kubemci-release/release/latest/bin/linux/amd64/kubemci
Resolving storage.googleapis.com (storage.googleapis.com)... 64.233.187.128, 64.233.188.128, 64.233.189.128, ...
Connecting to storage.googleapis.com (storage.googleapis.com)|64.233.187.128|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 69644075 (66M) [application/octet-stream]
Saving to: ‘kubemci’
kubemci                                              100%[===================================================================================================================>]  66.42M  43.1MB/s    in 1.5s
2020-10-09 10:00:54 (43.1 MB/s) - ‘kubemci’ saved [69644075/69644075]

# Create compute address
$ gcloud compute addresses create --global kubemci-ip
Created [https://www.googleapis.com/compute/v1/projects/owen-project-285301/global/addresses/kubemci-ip].

# List compute address
$ gcloud compute addresses list
NAME        ADDRESS/RANGE  TYPE      PURPOSE  NETWORK  REGION  SUBNET  STATUS
kubemci-ip  34.107.250.50  EXTERNAL                                    RESERVED

$ ./kubemci create zone-printer --ingress=manifests/ingress.yaml --kubeconfig=clusters.yaml
Created Ingress in cluster: gke_owen-project-285301_asia-east2-a_cluster-1
Created Ingress in cluster: gke_owen-project-285301_asia-southeast1-a_cluster-2
Ensuring health checks
Pod zoneprinter-858ccddd89-bmqz8 matching service selectors app=zoneprinter (targetport ): lacks a matching HTTP probe for use in health checks.
Pod zoneprinter-858ccddd89-ndl5r matching service selectors app=zoneprinter (targetport ): lacks a matching HTTP probe for use in health checks.
Path for healthcheck is /
Ensuring health check for port: {SvcName:default/zoneprinter SvcPort:{Type:0 IntVal:80 StrVal:} NodePort:30061 Protocol:HTTP SvcTargetPort: NEGEnabled:false}
Creating health check mci1-hc-30061--zone-printer
Health check mci1-hc-30061--zone-printer created successfully
Determining instance groups for cluster gke_owen-project-285301_asia-east2-a_cluster-1
Waiting for ingress ( default : zoneprinter ) to get ingress.gcp.kubernetes.io/instance-groups annotation.....
Waiting for ingress ( default : zoneprinter ) to get ingress.gcp.kubernetes.io/instance-groups annotation.....
Waiting for ingress ( default : zoneprinter ) to get ingress.gcp.kubernetes.io/instance-groups annotation.....
Waiting for ingress ( default : zoneprinter ) to get ingress.gcp.kubernetes.io/instance-groups annotation.....
Waiting for ingress ( default : zoneprinter ) to get ingress.gcp.kubernetes.io/instance-groups annotation.....
Waiting for ingress ( default : zoneprinter ) to get ingress.gcp.kubernetes.io/instance-groups annotation.....
Waiting for ingress ( default : zoneprinter ) to get ingress.gcp.kubernetes.io/instance-groups annotation.....
Waiting for ingress ( default : zoneprinter ) to get ingress.gcp.kubernetes.io/instance-groups annotation.....
Waiting for ingress ( default : zoneprinter ) to get ingress.gcp.kubernetes.io/instance-groups annotation.....
Determining instance groups for cluster gke_owen-project-285301_asia-southeast1-a_cluster-2
Fetching instance group: asia-east2-a k8s-ig--d08e35ba99d98889
Fetched instance group: asia-east2-a/k8s-ig--d08e35ba99d98889, got named ports: port: &{Name:port30061 Port:30061 ForceSendFields:[] NullFields:[]}
Ensuring backend services
Ensuring backend service for port: {default/zoneprinter {0 80 } 30061 HTTP  false}
Creating backend service mci1-be-30061--zone-printer
Backend service mci1-be-30061--zone-printer created successfully
Ensuring url map
Creating url map mci1-um--zone-printer
URL Map mci1-um--zone-printer created successfully
Ensuring http target proxy.
Ensuring target http proxy. UrlMap: https://www.googleapis.com/compute/v1/projects/owen-project-285301/global/urlMaps/mci1-um--zone-printer
Creating target HTTP proxy mci1-tp--zone-printer
Creating target http proxy mci1-tp--zone-printer
Target http proxy mci1-tp--zone-printer created successfully
Ensuring http forwarding rule
Creating forwarding rule mci1-fw--zone-printer
Forwarding rule mci1-fw--zone-printer created successfully
Ensuring firewall rule
Creating firewall rule mci1-fr--zone-printer
Firewall rule mci1-fr--zone-printer created successfully

Success.

# Get status
$ ./kubemci get-status zone-printer
Load balancer zone-printer has IPAddress 34.107.250.50 and is spread across 2 clusters (gke_owen-project-285301_asia-east2-a_cluster-1,gke_owen-project-285301_asia-southeast1-a_cluster-2)
```


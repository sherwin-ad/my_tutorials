# Kubernetes Architecture

Think of Kubernetes as a cluster manager that automatically deploys, manages, scales, and heals your applications.

## High-Level Architecture
```
                    Kubernetes Cluster
┌─────────────────────────────────────────────┐
│                                             │
│             Control Plane (Master)          │
│                                             │
│  ┌─────────┐ ┌─────────┐ ┌─────────────┐    │
│  │ API     │ │Scheduler│ │ Controller  │    │
│  │ Server  │ │         │ │ Manager     │    │
│  └─────────┘ └─────────┘ └─────────────┘    │
│           ┌──────────────┐                  │
│           │    etcd      │                  │
│           └──────────────┘                  │
│                                             │
├─────────────────────────────────────────────┤
│                                             │
│                Worker Nodes                 │
│                                             │
│  Node 1             Node 2                  │
│ ┌─────────┐      ┌─────────┐                │
│ │ kubelet │      │ kubelet │                │
│ │ kube-   │      │ kube-   │                │
│ │ proxy   │      │ proxy   │                │
│ │ Pod A   │      │ Pod C   │                │
│ │ Pod B   │      │ Pod D   │                │
│ └─────────┘      └─────────┘                │
│                                             │
└─────────────────────────────────────────────┘
```


# 1. Control Plane (Master)

The Control Plane makes all decisions.

If you run:

```
kubectl apply -f app.yaml
```
your command goes to the Control Plane.

## Components
### 1. API Server

- The front door of Kubernetes.

```
kubectl
  ↓
API Server
```
**Responsibilities:**

- Receives requests
- Validates manifests
- Communicates with other components

Example:
```
kubectl get pods
```
The API Server answers this request.

### 2. etcd

- The cluster database.

**Stores:**
- Pods
- Deployments
- Services
- Secrets
- ConfigMaps

Example:

```
Desired State:
3 nginx pods
```
etcd stores that information.

Think of it as:
- Kubernetes Database

### 3. Scheduler
Responsible for:
- Which node should run this pod?

Example:

```
Deployment
  ↓
3 replicas
```
Scheduler decides:

```
Node1 -> Pod1
Node2 -> Pod2
Node1 -> Pod3
```
based on:
- CPU availability
- Memory availability
- Taints/Tolerations
- Affinity rules

### 4. Controller Manager

- Ensures reality matches the desired state.

Example:

Desired State:
- 3 Pods Running

Current State:
- 2 Pods Running

Controller detects the difference:
- Missing Pod
 

Creates:
- New Pod

This is why Kubernetes is self-healing.

# 2. Worker Nodes

- Worker Nodes are where your applications actually run.

Example:
```
Node 1
├── Frontend Pod
├── API Pod

Node 2
├── Database Pod
```

## Each node contains:

### 1. Kubelet

- The node agent.

Responsibilities:

- Talks to API Server
- Starts containers
- Stops containers
- Reports node health

Example:

Scheduler:
- Run Pod A on Node 1

Kubelet:
- Starts Pod A

### 2. Container Runtime
- Runs containers.

Examples:
- containerd
- CRI-O

Old Kubernetes versions often used Docker.

Role:
- Pull Image
- Start Container
- Monitor Container

### 3. Kube Proxy
- Handles networking.

Example:

Service:
- frontend-service

Traffic:

```
User
 ↓
Service
 ↓
Frontend Pods
```
Kube-proxy does the traffic routing.

# 3. Pods
- Smallest deployable unit.

```
Pod
└── Container
```
Example:

```
Nginx Pod
└── nginx container
```
A pod gets:

- IP Address
- Storage
- Network namespace

# 4. Deployment

Manages Pods.

```
Deployment
 ↓
ReplicaSet
 ↓
Pods
```
Example:

```
replicas: 3
```

Result:
```
Pod1
Pod2
Pod3
```

If Pod2 fails:

```
Deployment
 ↓
Creates new Pod2
```
# 5. Service
- Provides a stable endpoint.

Without Service:

```
Pod IP
10.244.0.10
```
If pod restarts:

```
10.244.0.15
```
IP changes.

Service solves that.
```
frontend-service
```
Always remains:
```
frontend-service.default.svc.cluster.local
```
# 6. Ingress
- Controls external access.

Without Ingress:
- NodePort
- Frontend
- NodePort
- Backend

Many exposed ports.

With Ingress:
```
app.local
api.local
```
Single entry point.
```
Internet
 ↓
Ingress
 ↓
Services
```
# 7. Storage Architecture

- Applications like MySQL need persistent storage.
```
Pod
 ↓
PVC
 ↓
PV
 ↓
Disk
```
## Persistent Volume (PV)
Actual storage.
- 100 GB Disk

## Persistent Volume Claim (PVC)
Request for storage.
- Need 10 GB

Kubernetes connects PVC to PV automatically.

Example: Deploying an Application

Suppose you deploy:
- Frontend
- Backend
- MySQL

Flow:
```
User
 ↓
Ingress
 ↓
Frontend Service
 ↓
Frontend Pods
 ↓
Backend Service
 ↓
Backend Pods
 ↓
MySQL StatefulSet
 ↓
PVC
 ↓
PV
 ↓
Storage
```
Control Plane continuously watches everything.

If:
- Backend Pod crashes

Controller notices:
- Desired = 3 Pods
- Actual = 2 Pods

Controller creates:
- New Backend Pod

Automatically.

# What Happens When You Run a Deployment?
```
kubectl apply -f deployment.yaml
```
Step-by-step:
1. API Server receives request
2. Deployment stored in etcd
3. Scheduler selects a node
4. Kubelet gets instructions
5. Container runtime pulls image
6. Container starts
7. Service exposes pod
8. Ingress routes traffic
9. Controller monitors health

```
kubectl
 ↓
API Server
 ↓
etcd
 ↓
Scheduler
 ↓
Node
 ↓
Kubelet
 ↓
Container Runtime
 ↓
Pod Running
```

Architecture Interview Summary

Remember this one sentence:

The Control Plane decides what should happen, and the Worker Nodes run the actual application workloads.

For DevOps interviews, be comfortable explaining:
- API Server
- etcd
- Scheduler
- Controller Manager
- Kubelet
- Kube Proxy
- Pods
- Deployments
- Services
- Ingress
- Persistent Volumes

These are the core building blocks of Kubernetes architecture.

# Introduction to Kubernetes (K8s)

Before Kubernetes, Docker made application deployment easier by packaging applications and their dependencies into portable containers. As applications grew to hundreds or thousands of containers, managing them manually became increasingly complex.

- Managing and scaling large numbers of containers becomes difficult.
- Maintaining consistent applications across multiple cloud environments is challenging.
- Managing access, resources, and security across large container environments becomes complex.
- Updating applications without downtime requires automated deployment and coordination.
- Kubernetes automates container deployment, scaling, networking, and lifecycle management across a cluster.

# Features of K8s
- **Automated Scheduling**: Efficiently places containers on nodes for optimal resource use.
- **Self Healing**: Automatically restarts, replaces, and reschedules failed containers.
- **Rollouts & Rollbacks**: Manages application updates and reverts when needed.
- **Scaling & Load Balancing**: Supports horizontal scaling and distributes traffic.
- **Resource Optimization**: Monitors and ensures efficient resource utilization.

# Monolithic Vs Microservices


| Monolithic | Microservices |
|---|---|
| Single, unified code base and executable. | Collection of small, independent services. |
| Scaled by replicating the entire app. | Each service can be scaled independently. |
| All-or-nothing; entire app must be redeployed. | Services can be deployed individually. |
| A crash in one module can take down the app. | Failure in one service is usually isolated. |
| Forced to use one language/framework. | Each service can use a different stack. |
| Simple to start; complex as it grows. | High initial setup and operational complexity. |

Terminologies in K8s
Think of Kubernetes as a well organized company where different teams and systems work together to run applications efficiently. Here’s how the key terms fit into this system:

# 1. Pod
A Pod is the smallest unit you can deploy in Kubernetes. It wraps one or more containers that need to run together, sharing the same network and storage. Containers inside a Pod can easily communicate and work as a single unit.

# 2. Node
A Node is a machine (physical or virtual) in a Kubernetes cluster that runs your applications. Each Node contains the tools needed to run Pods, including the container runtime (like Docker), the Kubelet (agent), and the Kube proxy (networking).

# 3. Cluster
A Kubernetes cluster is a group of computers (called nodes) that work together to run your containerized applications. These nodes can be real machines or virtual ones.

There are two types of nodes in a Kubernetes cluster:

## Master node (Control Plane):
- Think of it as the brain of the cluster.
- It makes decisions, like where to run applications, handles scheduling, and keeps track of everything.

## Worker nodes:
- These are the machines that actually run your apps inside containers.
- Each worker node has a Kubelet (agent), a container runtime (like Docker or containerd), and tools for networking and monitoring.

# 4. Deployment
A Deployment is a Kubernetes object used to manage a set of Pods running your containerized applications. It provides declarative updates, meaning you tell Kubernetes what you want, and it figures out how to get there.

# 5. ReplicaSet
A ReplicaSet ensures that the right number of identical Pods are running.

# 6. Service
A Service in Kubernetes is a way to connect applications running inside your cluster. It gives your Pods a stable way to communicate, even if the Pods themselves keep changing.

# 7. Ingress
Ingress is a way to manage external access to your services in a Kubernetes cluster. It provides HTTP and HTTPS routing to your services, acting as a reverse proxy.

# 8. ConfigMap
- A ConfigMap stores configuration settings separately from the application, so changes can be made without modifying the actual code.
- Imagine you have an application that needs some settings, like a database password or an API key.
- Instead of hardcoding these settings into your app, you store them in a ConfigMap.
- Your application can then read these settings from the ConfigMap at runtime, which makes it easy to update the settings without changing the app code.

# 9. Secret
A Secret is a way to store sensitive information (like passwords, API keys, or tokens) securely in a Kubernetes cluster.

# 10. Persistent Volume (PV)
A Persistent Volume (PV) in Kubernetes is a piece of storage in the cluster that you can use to store data and it doesn’t get deleted when a Pod is removed or restarted.

# 11. Kubelet
A Kubelet runs on each Worker Node and ensures Pods are running as expected.

# 12. Kube-proxy
Kube-proxy manages networking inside the cluster, ensuring different Pods can communicate.
[TOC]

# Google Kubernetes Engine (GKE)

**Git Repository**

https://github.com/sherwin-ad/owen-devops-master-class.git



**Create deployment**

```
$ kubectl create deployment hello-world-rest-api --image=in28min/hello-world-rest-api:0.0.1.RELEASE
```

**Expose deployment**

```
$ kubectl expose deployment hello-world-rest-api --type=LoadBalancer --port=8080
```

**Scale deployment**

```
$ kubectl scale deployment hello-world-rest-api --replicas=3
```

**Update image deployment**

```
$ kubectl set image deployment hello-world-rest-api hello-world-rest-api=in28min/hello-world-rest-api:0.0.2.RELEASE
```

**View component status**

```
kubectl get componentstatuses
Warning: v1 ComponentStatus is deprecated in v1.19+
NAME                 STATUS    MESSAGE   ERROR
controller-manager   Healthy   ok
scheduler            Healthy   ok
etcd-0               Healthy
etcd-1               Healthy
```

**View rollout history**

```
$ kubectl rollout history deployment hello-world-rest-api
deployment.apps/hello-world-rest-api
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
```

**Update image deployment**

```
$ kubectl set image deployment hello-world-rest-api hello-world-rest-api=in28min/hello-world-rest-api:0.0.3.RELEASE --record=true
```

```
kubectl rollout history deployment hello-world-rest-api
deployment.apps/hello-world-rest-api
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
3         kubectl set image deployment hello-world-rest-api hello-world-rest-api=in28min/hello-world-rest-api:0.0.3.RELEASE --record=true
```

```
curl http://34.42.154.237:8080/hello-world
Hello World  V3 zz4k2%
```

**Undo a previous rollout (rollback)**

```
$ kubectl rollout undo deployment hello-world-rest-api  --to-revision=1
deployment.apps/hello-world-rest-api rolled back
```

```
$ kubectl rollout history deployment hello-world-rest-api
deployment.apps/hello-world-rest-api
REVISION  CHANGE-CAUSE
2         <none>
3         kubectl set image deployment hello-world-rest-api hello-world-rest-api=in28min/hello-world-rest-api:0.0.3.RELEASE --record=true
4         <none>
```

```
$ curl http://34.42.154.237:8080/hello-world
Hello World  V1 zz4k2%
```

 **Print the logs for a container in a pod**

```
$ kubectl logs -f hello-world-rest-api-5b78b5c566-zz4k2
```

**Delete all with selector**

```
$ kubectl get all -o wide
NAME                                        READY   STATUS    RESTARTS   AGE   IP           NODE                                       NOMINATED NODE   READINESS GATES
pod/hello-world-rest-api-5b78b5c566-lsz7d   1/1     Running   0          77m   10.36.1.17   gke-cluster-1-default-pool-c1e05bf6-1b3l   <none>           <none>
pod/hello-world-rest-api-5b78b5c566-zz4k2   1/1     Running   0          77m   10.36.0.10   gke-cluster-1-default-pool-c1e05bf6-vs10   <none>           <none>

NAME                           TYPE           CLUSTER-IP    EXTERNAL-IP     PORT(S)          AGE    SELECTOR
service/hello-world-rest-api   LoadBalancer   10.70.68.23   34.42.154.237   8080:31069/TCP   168m   app=hello-world-rest-api
service/kubernetes             ClusterIP      10.70.64.1    <none>          443/TCP          3h8m   <none>

NAME                                   READY   UP-TO-DATE   AVAILABLE   AGE    CONTAINERS             IMAGES                                       SELECTOR
deployment.apps/hello-world-rest-api   2/2     2            2           171m   hello-world-rest-api   in28min/hello-world-rest-api:0.0.1.RELEASE   app=hello-world-rest-api

NAME                                              DESIRED   CURRENT   READY   AGE    CONTAINERS             IMAGES                                       SELECTOR
replicaset.apps/hello-world-rest-api-5b78b5c566   2         2         2       171m   hello-world-rest-api   in28min/hello-world-rest-api:0.0.1.RELEASE   app=hello-world-rest-api,pod-template-hash=5b78b5c566
replicaset.apps/hello-world-rest-api-7dc5897557   0         0         0       150m   hello-world-rest-api   in28min/hello-world-rest-api:0.0.2.RELEASE   app=hello-world-rest-api,pod-template-hash=7dc5897557
replicaset.apps/hello-world-rest-api-89577dcb8    0         0         0       87m    hello-world-rest-api   in28min/hello-world-rest-api:0.0.3.RELEASE   app=hello-world-rest-api,pod-template-hash=89577dcb8
```

```
$ kubectl delete all -l app=hello-world-rest-api
pod "hello-world-rest-api-5b78b5c566-lsz7d" deleted
pod "hello-world-rest-api-5b78b5c566-zz4k2" deleted
service "hello-world-rest-api" deleted
deployment.apps "hello-world-rest-api" deleted
```

deployment.yaml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: hello-world-rest-api
  name: hello-world-rest-api
  namespace: default
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hello-world-rest-api
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: hello-world-rest-api
    spec:
      containers:
      - image: in28min/hello-world-rest-api:0.0.1.RELEASE
        imagePullPolicy: IfNotPresent
        name: hello-world-rest-api
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app: hello-world-rest-api
  name: hello-world-rest-api
  namespace: default
spec:
  ports:
  - nodePort: 31069
    port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    app: hello-world-rest-api
  sessionAffinity: None
  type: LoadBalancer
```

**Apply a configuration to a resource by file name**

```
kubectl apply -f deployment.yaml
```

**Quick fix to reduce release downtime with minReadySeconds**

deployment.yaml 

```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: hello-world-rest-api
  name: hello-world-rest-api
  namespace: default
spec:
  replicas: 3
  minReadySeconds: 45
  selector:
    matchLabels:
      app: hello-world-rest-api
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: hello-world-rest-api
    spec:
      containers:
      - image: in28min/hello-world-rest-api:0.0.2.RELEASE
        imagePullPolicy: IfNotPresent
        name: hello-world-rest-api
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app: hello-world-rest-api
  name: hello-world-rest-api
  namespace: default
spec:
  ports:
  - nodePort: 31069
    port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    app: hello-world-rest-api
  sessionAffinity: None
  type: LoadBalancer
```

## Configure multiple kubernetes deployments wit one service

deployment.yaml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: hello-world-rest-api
    version: v1
  name: hello-world-rest-api-v1
  namespace: default
spec:
  replicas: 2
  minReadySeconds: 45
  selector:
    matchLabels:
      app: hello-world-rest-api
      version: v1
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: hello-world-rest-api
        version: v1
    spec:
      containers:
      - image: in28min/hello-world-rest-api:0.0.1.RELEASE
        imagePullPolicy: IfNotPresent
        name: hello-world-rest-api
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: hello-world-rest-api
    version: v2
  name: hello-world-rest-api-v2
  namespace: default
spec:
  replicas: 2
  minReadySeconds: 45
  selector:
    matchLabels:
      app: hello-world-rest-api
      version: v2
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: hello-world-rest-api
        version: v2
    spec:
      containers:
      - image: in28min/hello-world-rest-api:0.0.2.RELEASE
        imagePullPolicy: IfNotPresent
        name: hello-world-rest-api
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
---
apiVersion: v1
kind: Service 
metadata:
  labels:
    app: hello-world-rest-api
  name: hello-world-rest-api
  namespace: default
spec:
  ports:
  - nodePort: 31069
    port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    app: hello-world-rest-api
  sessionAffinity: None
  type: LoadBalancer

```

```
kubectl get all
NAME                                           READY   STATUS    RESTARTS   AGE
pod/hello-world-rest-api-v1-867f8bd649-69ptw   1/1     Running   0          32m
pod/hello-world-rest-api-v1-867f8bd649-x8nm9   1/1     Running   0          32m
pod/hello-world-rest-api-v2-5f4bdc6757-bf8vq   1/1     Running   0          32m
pod/hello-world-rest-api-v2-5f4bdc6757-xr4gg   1/1     Running   0          32m

NAME                           TYPE           CLUSTER-IP    EXTERNAL-IP     PORT(S)          AGE
service/hello-world-rest-api   LoadBalancer   10.70.76.13   34.136.96.135   8080:31069/TCP   49m
service/kubernetes             ClusterIP      10.70.64.1    <none>          443/TCP          7h53m

NAME                                      READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/hello-world-rest-api-v1   2/2     2            2           32m
deployment.apps/hello-world-rest-api-v2   2/2     2            2           32m

NAME                                                 DESIRED   CURRENT   READY   AGE
replicaset.apps/hello-world-rest-api-v1-867f8bd649   2         2         2       32m
replicaset.apps/hello-world-rest-api-v2-5f4bdc6757   2         2         2       32m
```



## Kubernetes commands top node and pod

**Show services | all namespace | sort by namespace**

```
$ kubectl get service --all-namespaces --sort-by=.metadata.namespace
NAMESPACE     NAME                   TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)            AGE
default       hello-world-rest-api   LoadBalancer   10.70.76.13    34.136.96.135   8080:31069/TCP     60m
default       kubernetes             ClusterIP      10.70.64.1     <none>          443/TCP            8h
gmp-system    alertmanager           ClusterIP      None           <none>          9093/TCP           8h
gmp-system    gmp-operator           ClusterIP      10.70.72.199   <none>          8443/TCP,443/TCP   8h
kube-system   default-http-backend   NodePort       10.70.68.235   <none>          80:32027/TCP       8h
kube-system   kube-dns               ClusterIP      10.70.64.10    <none>          53/UDP,53/TCP      8h
kube-system   metrics-server         ClusterIP      10.70.76.211   <none>          443/TCP
```

**Print the address of the control plane and cluster services**

```
$ kubectl cluster-info
Kubernetes control plane is running at https://34.28.54.91
GLBCDefaultBackend is running at https://34.28.54.91/api/v1/namespaces/kube-system/services/default-http-backend:http/proxy
KubeDNS is running at https://34.28.54.91/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://34.28.54.91/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

**Display resource (CPU/memory) usage of nodes**

```
$ kubectl top node
NAME                                       CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%
gke-cluster-1-default-pool-c1e05bf6-1b3l   79m          8%     1142Mi          40%
gke-cluster-1-default-pool-c1e05bf6-1t8k   84m          8%     1571Mi          55%
gke-cluster-1-default-pool-c1e05bf6-vs10   60m          6%     1543Mi          54%
```

**Display resource (CPU/memory) usage of pods**

```
$ kubectl top pods
NAME                                       CPU(cores)   MEMORY(bytes)
hello-world-rest-api-v1-867f8bd649-69ptw   2m           232Mi
hello-world-rest-api-v1-867f8bd649-x8nm9   2m           234Mi
hello-world-rest-api-v2-5f4bdc6757-bf8vq   2m           229Mi
hello-world-rest-api-v2-5f4bdc6757-xr4gg   2m           237Mi
```

**Delete hello world deployments**

```
$ kubectl delete all -l app=hello-world-rest-api
pod "hello-world-rest-api-v1-867f8bd649-69ptw" deleted
pod "hello-world-rest-api-v1-867f8bd649-x8nm9" deleted
pod "hello-world-rest-api-v2-5f4bdc6757-bf8vq" deleted
pod "hello-world-rest-api-v2-5f4bdc6757-xr4gg" deleted
service "hello-world-rest-api" deleted
deployment.apps "hello-world-rest-api-v1" deleted
deployment.apps "hello-world-rest-api-v2" deleted
```



# **Infrastructure as a Code (IAAS)**

- is the managing and provisioning of infrastructure through code instead of through manual processes.

![image-20240416120515159](images/image-20240416120515159-3240320-3240322.png)

**Provisioning Server Tools**

- AWS CloudFormation
- Terraform

**Configuration Management Tools**

- Ansible
- Chef
- Puppet

# Continues Integration Deployment and Delivery

## Tools for Continues Integration Deployment and Delivery

- **Azure Devops**
- **Jenkins**

## Steps in CI/CD Pipeline

1. **Code Commit**

   **Tools**

   - Git Repository

2. **Unit Test**

   - is a quality assurance technique where application code is broken down into component building blocks – along with each block or unit’s associated data, usage processes, and functions – to ensure that each block works as expected. 

   **Tools**

   - Mocha / Jest (Javascript)
   - Pytest (Python)
   - Unit (Java)

3. Integration Tests

   - These tests validate the interactions between different components of the application, ensuring they work seamlessly together.

   **Tools**

   - Cucumber
   - Selenium
   - Protractor

4. **Package**

   - Once all of the tests are passing, you can now move on to packaging the code. Exactly how you package your application depends on your programming language and target environment.

   **Package Manager Tools**

   - NPM (javascript)
   - PIP (python)
   - MAVEN / GRADLE (java)

5. **Deploy**

   - The deploy stage is the final part of the CI/CD pipeline, where the application is released into the production environment, making it accessible to end-users. 
   - The deployment process varies based on the nature of the application and the production environment. For instance, it could involve deploying
     -  **a Docker container to a Kubernetes cluster,** 
     - **updating a web application on a cloud service like AWS or Google Cloud, or simply uploading files to a server.**

   **Tools**

   - Azure Devops
   - Jenkins

6. **Automated Tests**

   - Smoke test
   - Load test
   - Performance test
## Continues Integration

- is the practice where developers merge the changes to the code base to the main branch as often as possible. 
- These changes are validated by creating a build and then running automated tests against the build. 
- If these tests don’t pass, the changes aren’t merged, and developers avoid integration challenges that can happen. 

### Benefits of Continuous Integration 

This process also causes fewer bugs to be shipped to production as the issues are caught early and integration issues are solved before release. 



## Continues Delivery

- is an extension of CI since it enables automation to deploy all the code changes to an environment (dev, qa, stage, prod, etc.) after the changes have been merged. 
- The artifact may be built as part of CI or as part of this process since the source of truth (your repository) is reliable given your CI process. 

### Benefits of Continuous Delivery 

Since developers can deploy their changes at any time, it’s recommended to deploy the changes to production as often as possible, making troubleshooting easier and providing your users with access to the best your product has to offer as soon as possible.

## Continues Deployment

- takes the process one step further than continuous delivery. Here, all changes that pass the verification steps at each stage in the pipeline are released to production. 
- This process is completely automated and only a failed verification step will prevent pushing the changes to production. 

### Benefits of Continuous Deployment 

- Apart from the fact that customers get updates quicker, developers also get feedback faster which means there is less pressure as small changes are pushed incrementally compared to big updates not that often. 
- In order to successfully accomplish Continuous Deployment, tracking metrics around **Mean Time to Repair** and **Change Failure Rate** is critical to the success of fully automated deployments. 



# Azure Devops

1. Create project in Azure Devops

   **Project name**: azure-devops-kubernetes-terraform

2. Setting up Git Repository for Azure Devops Pipeline

   **Git Repository**

   https://github.com/sherwin-ad/azure-devops-kubernetes-terraform-pipeline.git

3. Create Azure Devops Pipeline

   1. Sign in to your Azure DevOps organization and go to your project.
   2. Go to **Pipelines**, and then select **New pipeline** or **Create pipeline** if creating your first pipeline.
   3. Do the steps of the wizard by first selecting **GitHub** as the location of your source code.
   4. You might be redirected to GitHub to sign in. If so, enter your GitHub credentials.
   5. When you see the list of repositories, select your repository.
   6. You might be redirected to GitHub to install the Azure Pipelines app. If so, select **Approve & install**.
   7. Select Starter pipeline![image-20240424113059094](images/owen_devops_lecture.png)
   8. Review, save and run

4. Azure Devops Agents and Jobs

   01-first-azure-pipelines.yml

   ```
   # Starter pipeline
   # Start with a minimal pipeline that you can customize to build and deploy your code.
   # Add steps that build, run tests, deploy, and more:
   # https://aka.ms/yaml
   
   trigger:
   - main
   
   pool:
     vmImage: ubuntu-latest
   
   steps:
   - script: echo Hello, world, changed!
     displayName: 'Run a one-line script'
   
   - script: |
       echo Add other tasks to build, test, and deploy your project.
       echo See https://aka.ms/yaml
       echo more information
     displayName: 'Run a multi-line script'
   ```

5. Azure Devops Agents and Job2

   01-first-azure-pipelines.yml

   ```
   # Starter pipeline
   # Start with a minimal pipeline that you can customize to build and deploy your code.
   # Add steps that build, run tests, deploy, and more:
   # https://aka.ms/yaml
   
   trigger:
   - main
   
   pool:
     vmImage: ubuntu-latest
   
   jobs:
   - job: Job1
     steps:
     - script: echo Job1 -  Hello, world, changed!
       displayName: 'Run a one-line script'
     - script: |
         echo Add other tasks to build, test, and deploy your project.
         echo See https://aka.ms/yaml
         echo more information
       displayName: 'Run a multi-line script'
   
   - job: Job2
     steps:
     - script: echo Job2!
       displayName: 'Run a one-line script'   
   ```

6. Using dependsOn with jobs

   01-first-azure-pipelines.yml

   ```
   # Starter pipeline
   # Start with a minimal pipeline that you can customize to build and deploy your code.
   # Add steps that build, run tests, deploy, and more:
   # https://aka.ms/yaml
   
   trigger:
   - main
   
   pool:
     vmImage: ubuntu-latest
   
   jobs:
   - job: Job1
     steps:
     - script: echo Job1 -  Hello, world, changed!
       displayName: 'Run a one-line script'
     - script: |
         echo Add other tasks to build, test, and deploy your project.
         echo See https://aka.ms/yaml
         echo more information
       displayName: 'Run a multi-line script'
   
   - job: Job2
     dependsOn: Job1
     steps:
     - script: echo Job2!
       displayName: 'Run a one-line script'   
   
   - job: Job3
     dependsOn: Job1
     steps:
     - script: echo Job3!
       displayName: 'Run a one-line script'   
   
   - job: Job4
     dependsOn: 
     - Job2
     - Job3
     steps:
     - script: echo Job4!
       displayName: 'Run a one-line script'
   ```

7. Creating Azure Devops Pipeline for Playing with Stages

   02-understanding-stages.yml

   ```
   # Starter pipeline
   # Start with a minimal pipeline that you can customize to build and deploy your code.
   # Add steps that build, run tests, deploy, and more:
   # https://aka.ms/yaml
   
   trigger:
   - main
   
   pool:
     vmImage: ubuntu-latest
   
   stages:
   - stage: Build
     jobs:
     - job: FirstJob
       steps:
       - bash: echo BuildFirstJob
     - job: SecondJob
       steps:
       - bash: echo BuildSecondJob  
   
   - stage: DevDeploy
     dependsOn: Build
     jobs:
     - job: DevDeployJob
       steps:
       - bash: echo DevDeployJob
   
   - stage: QADeploy
     dependsOn: Build
     jobs:
     - job: QADeployJob
       steps:
       - bash: echo QADeployJob
   
   - stage: ProdDeploy
     dependsOn:
     - DevDeploy
     - QADeploy 
     jobs:
     - job: ProdDeployJob
       steps:
       - bash: echo ProdDeployJob
   ```

8. Playing with variables and dependson for stages

   ```
   trigger:
   - main
   
   pool:
     vmImage: ubuntu-latest
   
   stages:
   - stage: Build
     jobs:
     - job: FirstJob
       variables:
         jobnum: First
       steps:
       - bash: echo Build$(jobnum)Job
       - bash: echo $(PipelineLevelVariable)
     - job: SecondJob
       steps:
       - bash: echo BuildSecondJob
   
   - stage: DevDeploy
     variables:
       environment: Dev
     dependsOn: Build
     jobs:
     - job: DevDeployJob
       steps:
       - bash: echo $(environment)DeployJob
   
   - stage: QADeploy
     variables:
       environment: QA
     dependsOn: Build
     jobs:
     - job: QADeployJob
       steps:
       - bash: echo $(environment)DeployJob
   
   - stage: ProdDeploy
     variables:
       environment: Prod
     dependsOn:
     - DevDeploy
     - QADeploy 
     jobs:
     - job: ProdDeployJob
       steps:
       - bash: echo $(environment)DeployJob
   ```

9. Understanding Azure DevopsPipeline Variables

   **Predefined variables in Azure Devops**

   https://learn.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml

   ```
   # Starter pipeline
   # Start with a minimal pipeline that you can customize to build and deploy your code.
   # Add steps that build, run tests, deploy, and more:
   # https://aka.ms/yaml
   
   trigger:
   - main
   
   pool:
     vmImage: ubuntu-latest
   
   stages:
   - stage: Build
     jobs:
     - job: FirstJob
       variables:
         jobnum: First
       steps:
       - bash: echo Build$(jobnum)Job
       - bash: echo $(PipelineLevelVariable)
       - bash: echo $(Build.BuildNumber)
       - bash: echo $(Build.BuildId)
       - bash: echo $(Build.SourceBranchName)
       - bash: echo $(Build.SourceDirectory)
       - bash: echo $(System.DefaultWorkingDirectory)
       - bash: ls -R $(System.DefaultWorkingDirectory)
       - bash: echo $(Build.ArtifactStagingDirectory)
     # - job: SecondJob
     #   steps:
     #   - bash: echo BuildSecondJob
   
   # - stage: DevDeploy
   #   variables:
   #     environment: Dev
   #   dependsOn: Build
   #   jobs:
   #   - job: DevDeployJob
   #     steps:
   #     - bash: echo $(environment)DeployJob
   
   # - stage: QADeploy
   #   variables:
   #     environment: QA
   #   dependsOn: Build
   #   jobs:
   #   - job: QADeployJob
   #     steps:
   #     - bash: echo $(environment)DeployJob
   
   # - stage: ProdDeploy
   #   variables:
   #     environment: Prod
   #   dependsOn:
   #   - DevDeploy
   #   - QADeploy 
   #   jobs:
   #   - job: ProdDeployJob
   #     steps:
   #     - bash: echo $(environment)DeployJob
   ```

10. Task for copy files and publish artifacts

   **Copy files**

   ```
   trigger:
   - main
   
   pool:
     vmImage: ubuntu-latest
   
   stages:
   - stage: Build
     jobs:
     - job: FirstJob
       variables:
         jobnum: First 
       steps:
       - bash: echo Build$(jobnum)Job
       - bash: echo $(PipelineLevelVariable)
       - bash: echo $(Build.BuildNumber)
       - bash: echo $(Build.BuildId)
       - bash: echo $(Build.SourceBranchName)
       - bash: echo $(Build.SourceDirectory)
       - bash: echo $(System.DefaultWorkingDirectory)
       - bash: ls -R $(System.DefaultWorkingDirectory)
       - bash: echo $(Build.ArtifactStagingDirectory)
       - bash: java -version
       - bash: node --version
       - bash: python --version
       - bash: mvn -version
       - bash: ls -R $(Build.ArtifactStagingDirectory)
       - task: CopyFiles@2
         inputs:
           SourceFolder: '$(System.DefaultWorkingDirectory)'
           Contents: |
             **/*.yaml
             **/*.tf
           TargetFolder: '$(Build.ArtifactStagingDirectory)'
       - bash: ls -R $(Build.ArtifactStagingDirectory)    
   ```

   **Publish build artifacts**

   ```
   trigger:
   - main
   
   pool:
     vmImage: ubuntu-latest
   
   stages:
   - stage: Build
     jobs:
     - job: FirstJob
       variables:
         jobnum: First 
       steps:
       - bash: echo Build$(jobnum)Job
       - bash: echo $(PipelineLevelVariable)
       - bash: echo $(Build.BuildNumber)
       - bash: echo $(Build.BuildId)
       - bash: echo $(Build.SourceBranchName)
       - bash: echo $(Build.SourceDirectory)
       - bash: echo $(System.DefaultWorkingDirectory)
       - bash: ls -R $(System.DefaultWorkingDirectory)
       - bash: echo $(Build.ArtifactStagingDirectory)
       - bash: java -version
       - bash: node --version
       - bash: python --version
       - bash: mvn -version
       - bash: ls -R $(Build.ArtifactStagingDirectory)
       - task: CopyFiles@2
         inputs:
           SourceFolder: '$(System.DefaultWorkingDirectory)'
           Contents: |
             **/*.yaml
             **/*.tf
           TargetFolder: '$(Build.ArtifactStagingDirectory)'
       - bash: ls -R $(Build.ArtifactStagingDirectory)
       - task: PublishBuildArtifacts@1
         inputs:
           PathtoPublish: '$(Build.ArtifactStagingDirectory)'
           ArtifactName: 'drop'
           publishLocation: 'Container'
   ```

11. Running Azure Devops Jobs on Multiple Agents

    ```
    trigger:
    - main
    
    strategy:
     matrix:
       linux:
         operatingSystem: 'ubuntu-latest'
       mac:
         operatingSystem: 'macos-latest'  
    
    pool:
      vmImage: $(operatingSystem)
    
    steps:
    - script: echo Running on $(operatingSystem)!
      displayName: 'Run a one-line script'
    ```

12. Understanding Azure Devops Deployment Jobs Environments and Approval

    ```
    trigger:
    - main
    
    pool:
      vmImage: 'ubuntu-latest'
    
    stages:
    - stage: Build
      jobs:
      - job: BuildJob
        steps:
        - bash: echo "Do the build"
    - stage: DevDeploy
      jobs:
      - deployment: DevDeployJob
        environment: Dev
        strategy:
          runOnce:
            deploy:
              steps:
                - script: echo deploy to Dev 
    - stage: QADeploy
      jobs:
      - deployment: QADeployJob
        environment: QA
        strategy:
          runOnce:
            deploy:
              steps:
                - script: echo deploy to QA 
    ```

13. Build and Push Docker Image in Azure Devops

    1. Goto Project Settings > Pipelines > Service connections  

       Click New Service connection > select Docker Registry

    ![image-20240425175534293](images/image-20240425175534293.png)



2. Crreate new pipeline

   - Connect - Github

   - Select Repository - azure-devops-kubernetes-terraform-pipeline

   - Configure - Build a docker image

     ![image-20240426150447734](images/image-20240426150447734.png)

   ![image-20240426151014892](images/image-20240426151014892.png)

   ```
   trigger:
   - main
   
   resources:
   - repo: self
   
   variables:
     tag: '$(Build.BuildId)'
   
   stages:
   - stage: Build
     displayName: Build image
     jobs:
     - job: Build
       displayName: Build
       pool:
         vmImage: ubuntu-latest
       steps:
       - task: Docker@2
         displayName: Build an image
         inputs:
           containerRegistry: 'sherwinowen-docker-hub'
           repository: 'sherwinowen/currency-exchange-devops'
           command: 'buildAndPush'
           Dockerfile: '**/Dockerfile'
           tags: '$(tag)'
   ```

   

13. Playing with Azure Devops Releases

    1. Goto Releases and click New pipeline and select Empty job

    2. Add an Artifact

       ![image-20240426181114965](images/image-20240426181114965.png)

    3. Enable deployment trigger in Artifacts

       ![image-20240426181540076](images/image-20240426181540076.png)

    4. Goto Dev Stage and Add task - Bash
    
       ![image-20240426182334699](images/image-20240426182334699.png)
    
       Goto Agent job and select ubuntu lates in the Agent Specification
    
       ![image-20240426184314828](images/image-20240426184314828.png)

# IAAC Azure AKS with Azure Devops, Terraform and Kubernetes

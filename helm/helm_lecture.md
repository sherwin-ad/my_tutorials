[TOC]



# Helm

- Package manager for Kubernetes

  

## Overview of Helm and Tiller

### The Helm Client

- Interacts with the Tiller server
- Manages charts
- Creates new charts
- Packages charts into archives
- Interacts with chart repositories
- Installs and uninstalls charts
- Manages chart release cycle

### The Tiller Server

- Interacts with the Kubernetes API
- Manages releases
- Listens for requests from the helm client
- Combines a chartand a config into a release
- Installs charts and tracks the release
- Upgrades and uninstalls charts



### Install helm

```
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```



### Add repo

```
$ helm repo add stable https://charts.helm.sh/stable

$ helm repo add bitnami https://charts.bitnami.com/bitnami

# List helm repo
$ helm repo ls
NAME  	URL                          
stable	https://charts.helm.sh/stable

```



### Deploying chart

```
# Search stable repository for a mysql chart
$ helm search repo stable/mysql
NAME            	CHART VERSION	APP VERSION	DESCRIPTION                                       
stable/mysql    	1.6.7        	5.7.30     	Fast, reliable, scalable, and easy to use open-...
stable/mysqldump	2.6.2        	2.4.1      	DEPRECATED! - A Helm chart to help backup MySQL...

# show chart definition
$ helm show chart stable/mysql
apiVersion: v1
appVersion: 5.7.30
description: Fast, reliable, scalable, and easy to use open-source relational database
  system.
home: https://www.mysql.com/
icon: https://www.mysql.com/common/logos/logo-mysql-170x115.png
keywords:
- mysql
- database
- sql
maintainers:
- email: o.with@sportradar.com
  name: olemarkus
- email: viglesias@google.com
  name: viglesiasce
name: mysql
sources:
- https://github.com/kubernetes/charts
- https://github.com/docker-library/mysql
version: 1.6.7

# Show chart README
$ helm show readme stable/mysql 
$ helm show readme stable/mysql > README.txt

# Show chart values
$ helm show values stable/mysql > values.txt

# Deploy chart
$ helm install mysql stable/mysql

# Confirm deployment
$ helm list
NAME 	NAMESPACE	REVISION	UPDATED                              	STATUS  	CHART      	APP VERSION
mysql	default  	1       	2020-11-03 09:06:06.4855744 +0800 PST	deployed	mysql-1.6.7	5.7.30     

# View status of the release
$ helm status mysql

# Get release manifests
$ helm get manifest mysql

# Get release values
$ helm get values mysql
USER-SUPPLIED VALUES:
null

# Get release notes
$ helm get notes mysql
NOTES:
MySQL can be accessed via port 3306 on the following DNS name from within your cluster:
mysql.default.svc.cluster.local

To get your root password run:

    MYSQL_ROOT_PASSWORD=$(kubectl get secret --namespace default mysql -o jsonpath="{.data.mysql-root-password}" | base64 --decode; echo)

To connect to your database:

1. Run an Ubuntu pod that you can use as a client:

    kubectl run -i --tty ubuntu --image=ubuntu:16.04 --restart=Never -- bash -il

2. Install the mysql client:

    $ apt-get update && apt-get install mysql-client -y

3. Connect using the mysql cli, then provide your password:
    $ mysql -h mysql -p

To connect to your database directly from outside the K8s cluster:
    MYSQL_HOST=127.0.0.1
    MYSQL_PORT=3306

    # Execute the following command to route the connection:
    kubectl port-forward svc/mysql 3306

    mysql -h ${MYSQL_HOST} -P${MYSQL_PORT} -u root -p${MYSQL_ROOT_PASSWORD}

# Get all from release 
$ helm get all mysql

# view release history
$ helm history mysql
REVISION	UPDATED                 	STATUS  	CHART      	APP VERSION	DESCRIPTION     
1       	Tue Nov  3 09:06:06 2020	deployed	mysql-1.6.7	5.7.30     	Install complete

# uninstall a release
helm uninstall mysql --keep-history

# confirm with --all flag
$ helm list --all

# delete release
$ helm delete mysql

```



### Search chart other version

```
$ helm search repo stable/mysql
NAME            	CHART VERSION	APP VERSION	DESCRIPTION                                       
stable/mysql    	1.6.7        	5.7.30     	Fast, reliable, scalable, and easy to use open-...
stable/mysqldump	2.6.2        	2.4.1      	DEPRECATED! - A Helm chart to help backup MySQL...

$ helm search repo stable/mysql --versions
NAME            	CHART VERSION	APP VERSION	DESCRIPTION                                       
stable/mysql    	1.6.7        	5.7.30     	Fast, reliable, scalable, and easy to use open-...
stable/mysql    	1.6.6        	5.7.30     	Fast, reliable, scalable, and easy to use open-...
stable/mysql    	1.6.5        	5.7.30     	Fast, reliable, scalable, and easy to use open-...
stable/mysql    	1.6.4        	5.7.30     	Fast, reliable, scalable, and easy to use open-...
stable/mysql    	1.6.3        	5.7.28     	Fast, reliable, scalable, and easy to use open-...
stable/mysql    	1.6.2        	5.7.28     	Fast, reliable, scalable, and easy to use open-...
stable/mysql    	1.6.1        	5.7.27     	Fast, reliable, scalable, and easy to use open-...
stable/mysql    	1.6.0        	5.7.27     	Fast, reliable, scalable, and easy to use open-...
stable/mysql    	1.5.0        	5.7.27     	Fast, reliable, scalable, and easy to use open-...

```



### Deploying a specific Chart Version

```
# Install specific chart version
$ helm install mysql stable/mysql --version 1.6.3

$ helm  ls
NAME 	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART      	APP VERSION
mysql	default  	1       	2020-11-03 09:54:58.241230744 +0800 PST	deployed	mysql-1.6.3	5.7.28     
```

 

### Upgrading a release

```
$ helm upgrade mysql stable/mysql --version 1.6.4
Release "mysql" has been upgraded. Happy Helming!


$ helm  ls
NAME 	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART      	APP VERSION
mysql	default  	2       	2020-11-03 09:58:06.613401963 +0800 PST	deployed	mysql-1.6.4	5.7.30 

$ helm history mysql
REVISION	UPDATED                 	STATUS    	CHART      	APP VERSION	DESCRIPTION     
1       	Tue Nov  3 09:54:58 2020	superseded	mysql-1.6.3	5.7.28     	Install complete
2       	Tue Nov  3 09:58:06 2020	deployed  	mysql-1.6.4	5.7.30     	Upgrade complete
```



### Rolling back a release

```
$ kubectl get replicasets
NAME               DESIRED   CURRENT   READY   AGE
mysql-5869b554db   0         0         0       15m
mysql-66487779c4   1         1         1       12m

$ helm rollback mysql 1
Rollback was a success! Happy Helming!

$ helm history mysql
REVISION	UPDATED                 	STATUS    	CHART      	APP VERSION	DESCRIPTION     
1       	Tue Nov  3 09:54:58 2020	superseded	mysql-1.6.3	5.7.28     	Install complete
2       	Tue Nov  3 09:58:06 2020	superseded	mysql-1.6.4	5.7.30     	Upgrade complete
3       	Tue Nov  3 10:11:00 2020	deployed  	mysql-1.6.3	5.7.28     	Rollback to 1 

# view replicasets
$ kubectl get replicasets
NAME               DESIRED   CURRENT   READY   AGE
mysql-5869b554db   1         1         1       21m
mysql-66487779c4   0         0         0       18m


# view secrets
$ kubectl get secrets
NAME                          TYPE                                  DATA   AGE
default-token-pmbkj           kubernetes.io/service-account-token   3      3d13h
mysql                         Opaque                                2      23m
sh.helm.release.v1.mysql.v1   helm.sh/release.v1                    1      23m
sh.helm.release.v1.mysql.v2   helm.sh/release.v1                    1      20m
sh.helm.release.v1.mysql.v3   helm.sh/release.v1                    1      7m21s

```



### Pulling down a chart

```
$ helm pull stable/mysql --untar

$ ls -l mysql*
total 40
-rw-r--r-- 1 sherwinowen sherwinowen   502 Nov  3 10:20 Chart.yaml
-rw-r--r-- 1 sherwinowen sherwinowen 23279 Nov  3 10:20 README.md
drwxr-xr-x 3 sherwinowen sherwinowen  4096 Nov  3 10:20 templates
-rw-r--r-- 1 sherwinowen sherwinowen  6164 Nov  3 10:20 values.yaml
```



### Chart repository

Repository is any HTTP server

https://hub.helm.sh /  https://artifacthub.io/



### Create a helm chart

```
$ helm create ourchart
Creating ourchart

# view ourchart directory
$ ls -l ourchart/
total 16
drwxr-xr-x 2 sherwinowen sherwinowen 4096 Nov  3 11:06 charts
-rw-r--r-- 1 sherwinowen sherwinowen 1099 Nov  3 11:06 Chart.yaml
drwxr-xr-x 3 sherwinowen sherwinowen 4096 Nov  3 11:06 templates
-rw-r--r-- 1 sherwinowen sherwinowen 1801 Nov  3 11:06 values.yaml

# view templates directory
$ ls -la ourchart/templates/
total 40
drwxr-xr-x 3 sherwinowen sherwinowen 4096 Nov  3 11:06 .
drwxr-xr-x 4 sherwinowen sherwinowen 4096 Nov  3 11:06 ..
-rw-r--r-- 1 sherwinowen sherwinowen 1841 Nov  3 11:06 deployment.yaml
-rw-r--r-- 1 sherwinowen sherwinowen 1792 Nov  3 11:06 _helpers.tpl
-rw-r--r-- 1 sherwinowen sherwinowen  919 Nov  3 11:06 hpa.yaml
-rw-r--r-- 1 sherwinowen sherwinowen 1054 Nov  3 11:06 ingress.yaml
-rw-r--r-- 1 sherwinowen sherwinowen 1747 Nov  3 11:06 NOTES.txt
-rw-r--r-- 1 sherwinowen sherwinowen  322 Nov  3 11:06 serviceaccount.yaml
-rw-r--r-- 1 sherwinowen sherwinowen  364 Nov  3 11:06 service.yaml
drwxr-xr-x 2 sherwinowen sherwinowen 4096 Nov  3 11:06 tests

# remove all yaml files in the tepmplates directory
$ rm ourchart/templates/*yaml

# generate deployment yaml
$ kubectl create deployment nginx-deployment --image=nginx --dry-run=true --output=yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: nginx-deployment
  name: nginx-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-deployment
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: nginx-deployment
    spec:
      containers:
      - image: nginx
        name: nginx
        resources: {}
status: {}

$ kubectl create deployment nginx --image=nginx --dry-run=true --output=yaml > ourchart/templates/deploymwnt.yaml


# create a deplyment (in order to run the expose command below)
$ kubectl create deployment nginx --image=nginx

# generate service yaml
$ $ kubectl expose deployment nginx --type=LoadBalancer --port=80 --dry-run=true --output=yaml > ourchart/templates/service.yaml

# delete the deployment
$ kubectl delete deployment nginx
deployment.apps "nginx" deleted

# replace Notes.txt file
$ rm ourchart/templates/NOTES.txt 
$ echo 'A test Helm Chart' > ourchart/templates/NOTES.txt

# remove the charts and tests directory within the chart (they're not needed)
$ rm -r ourchart/charts
$ rm -r ourchart/templates/tests

# deploy the chart
$ helm install ourchart ourchart/


# view release
$ helm list

# delete the release
$ helm delete ourchart

# update the deployment.yaml to use template directives
# copy {{ .Release.Name }} in for the deployment name

# also update the values.yaml file, removing the old file
$ rm ourchart/values.yaml

# and add in a custom value
$ echo 'containerImage: nginx:1.17' > ourchart/values.yaml

# update the deployment.yaml file to use the new default value
# copy {{ .Values.containerImage }} in for the container image name

# deploy the chart
$ helm install ourchart ourchart/

# view release
$ helm list

# view the container image in the deployment
$ kubectl get deployment -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }'
nginx:1.17


# now upgrade the chart, overriding the image name in the values file
$ helm upgrade ourchart ourchart/ --set containerImage=nginx:1.18

# view the container image in the deployment
$ kubectl get deployment -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }'
nginx:1.18

# package the chart
$ helm package ourchart/ --destination charts/
Successfully packaged chart and saved it to: charts/ourchart-0.1.0.tgz

# view package chart
$ ls -l charts/
total 4
-rw-r--r-- 1 sherwinowen sherwinowen 1436 Nov  3 16:42 ourchart-0.1.0.tgz


```



### Creating  a local helm repository

```
# test deploying Chart Museum
$ helm install chartmuseum stable/chartmuseum --dry-run --debug


# deploy Chart Museum
$ helm install chartmuseum stable/chartmuseum --set env.open.DISABLE_API=false
NAME: chartmuseum
LAST DEPLOYED: Tue Nov  3 17:12:10 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
** Please be patient while the chart is being deployed **

Get the ChartMuseum URL by running:

  export POD_NAME=$(kubectl get pods --namespace default -l "app=chartmuseum" -l "release=chartmuseum" -o jsonpath="{.items[0].metadata.name}")
  echo http://127.0.0.1:8080/
  kubectl port-forward $POD_NAME 8080:8080 --namespace default

# view release
$ helm list

# view Chart Museum pod
$ kubectl get pods
NAME                                       READY   STATUS    RESTARTS   AGE
chartmuseum-chartmuseum-6df7dd8885-26bpq   1/1     Running   0          2m37s

# grab the Chart Museum pod name
$ export POD_NAME=$(kubectl get pods --namespace default -l "app=chartmuseum" -l "release=chartmuseum" -o jsonpath="{.items[0].metadata.name}")

$ echo http://127.0.0.1:8080/

$ kubectl port-forward $POD_NAME 8080:8080 --namespace default


# confirm Chart Museum is running 
# browse http://127.0.0.1:8080/

# view helm help
$ helm --help

# navigate to folder containing repository names and URLs
# /home/sherwinowen/.config/helm/repositories.yaml

# add Chart Museum as a Helm repository
 helm repo add chartmuseum http://127.0.0.1:8080
"chartmuseum" has been added to your repositories

# list repositories
$ helm repo list
NAME       	URL                          
stable     	https://charts.helm.sh/stable
chartmuseum	http://127.0.0.1:8080        


# view updated repositories.yaml file
# /home/sherwinowen/.config/helm/repositories.yaml
apiVersion: ""
generated: "0001-01-01T00:00:00Z"
repositories:
- caFile: ""
  certFile: ""
  insecure_skip_tls_verify: false
  keyFile: ""
  name: stable
  password: ""
  url: https://charts.helm.sh/stable
  username: ""
- caFile: ""
  certFile: ""
  insecure_skip_tls_verify: false
  keyFile: ""
  name: chartmuseum
  password: ""
  url: http://127.0.0.1:8080
  username: ""

# navigate to packaged Chart
$ cd chart

# push chart to Chart Museum
$ curl --data-binary "@ourchart-0.1.0.tgz" http://localhost:8080/api/charts
{"saved":true}

# search for the chart
$ helm search repo chartmuseum/ourchart
No results found

# view helm help
$ helm --help

# view cached index.yaml file for repository
# /home/sherwinowen/.cache/helm/repository

# update Helm repositories
$ helm repo update

# search for the chart
helm search repo chartmuseum/ourchart
NAME                	CHART VERSION	APP VERSION	DESCRIPTION                
chartmuseum/ourchart	0.1.0        	1.16.0     	A Helm chart for Kubernetes

# deploy the chart from Chart Museum
$ helm install ourchart chartmuseum/ourchart
NAME: ourchart
LAST DEPLOYED: Tue Nov  3 17:56:33 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
A test Helm Chart


```



### Create a Remote Helm Repository

```
# go to github and create a repository

# clone repositopry locally
$ git clone https://github.com/sherwin-ad/OwenHelmRepo.git

# copy packaged chart into repo
$ cp charts/ourchart-0.1.0.tgz OwenHelmRepo/.

# navigate to repo
$ cd OwenHelmRepo/

# index repo
$ helm repo index .

# view index.yaml
$ cat index.yaml

# push chart to github
$ git add .
$ git commit -m "added ourchart to repo"
[master (root-commit) d182e41] added ourchart to repo
 2 files changed, 14 insertions(+)
 create mode 100644 index.yaml
 create mode 100644 ourchart-0.1.0.tgz

$ git push
Username for 'https://github.com': sherwin-ad
Password for 'https://sherwin-ad@github.com': 
Counting objects: 4, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 1.90 KiB | 1.90 MiB/s, done.
Total 4 (delta 0), reused 0 (delta 0)
To https://github.com/sherwin-ad/OwenHelmRepo.git
 * [new branch]      master -> master


# add Github repo as a Helm Repository
$ helm repo add owenhelmrepo https://raw.githubusercontent.com/sherwin-ad/OwenHelmRepo/master
"owenhelmrepo" has been added to your repositories


# list repository
$ helm repo list
NAME        	URL                                                             
stable      	https://charts.helm.sh/stable                                   
chartmuseum 	http://127.0.0.1:8080                                           
owenhelmrepo	https://raw.githubusercontent.com/sherwin-ad/OwenHelmRepo/master


# search new Helm repositpry
$ helm search repo owenhelmrepo/ourchart
NAME                 	CHART VERSION	APP VERSION	DESCRIPTION                
owenhelmrepo/ourchart	0.1.0        	1.16.0     	A Helm chart for Kubernetes

# deploy chart from repository
$ helm install ourchart owenhelmrepo/ourchart
NAME: ourchart
LAST DEPLOYED: Tue Nov  3 19:53:23 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
A test Helm Chart

# confirm deployment
$ helm list
NAME       	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART             	APP VERSION
chartmuseum	default  	1       	2020-11-03 17:12:10.840846935 +0800 PST	deployed	chartmuseum-2.14.0	0.12.0     
ourchart   	default  	1       	2020-11-03 19:53:23.238007712 +0800 PST	deployed	ourchart-0.1.0    	1.16.0     


```



### Configuring helm repositories

```

```





```
# View kubernetes objects
$ helm get values mysql
USER-SUPPLIED VALUES:
null
sherwinowen@owenbox:~$ kubectl get all
NAME                         READY   STATUS    RESTARTS   AGE
pod/mysql-54bbdd8f86-8fq52   1/1     Running   0          39m

NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
service/kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP    3d13h
service/mysql        ClusterIP   10.103.194.228   <none>        3306/TCP   39m

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/mysql   1/1     1            1           39m

NAME                               DESIRED   CURRENT   READY   AGE
replicaset.apps/mysql-54bbdd8f86   1         1         1       39m





```



### Run a Mariadb client to connect to the server:

```
$ kubectl run mariadb-client --rm --tty -i --restart='Never' --image  docker.io/bitnami/mariadb:10.5.6-debian-10-r0 --namespace default --command -- bash
```

### Run a MySQL client to connect to the server:

```
kubectl run -it --rm --image=mysql:5.6 mysql-client -- mysql -h mysql -ppassword
```



###  Authenticate kubectl with the cluster in GCP

```
# Authenticate kubectl with the cluster
$ gcloud container clusters get-credentials my-cluster-1 --zone=asia-east2-a               
Fetching cluster endpoint and auth data.
kubeconfig entry generated for my-cluster-1.
```





```
# Install a chart archive
$ helm install stable/moodle

# List releases
$ helm ls
NAME            REVISION        UPDATED                         STATUS          CHART           APP VERSION     NAMESPACE
oily-deer       1               Fri Oct 30 05:46:51 2020        DEPLOYED        moodle-7.2.8    3.8.2           default
solid-lambkin   1               Fri Oct 30 05:59:48 2020        DEPLOYED        moodle-7.2.8    3.8.2           default

# Upgrade release
$ helm upgrade [name of releae] stable/moodle

# Delete release
$ helm delete solid-lambkin --purge
release "solid-lambkin" deleted

$ helm ls
NAME            REVISION        UPDATED                         STATUS          CHART           APP VERSION     NAMESPACE
oily-deer       1               Fri Oct 30 05:46:51 2020        DEPLOYED        moodle-7.2.8    3.8.2           default

# Download a chart from a repository and (optionally) unpack it in local directory
$ helm fetch stable/moodle

$ ls -l
-rw-r--r-- 1 sherwin sherwin 34333 Oct 30 06:26 moodle-7.2.8.tgz

$ helm fetch --untar stable/moodle
ls -l
drwxr-xr-x 4 sherwin sherwin  4096 Oct 30 06:32 moodle

$ cat requirements.yaml
dependencies:
- name: mariadb
  version: 7.x.x
  repository: https://kubernetes-charts.storage.googleapis.com/
  condition: mariadb.enabled

$ ls charts/
mariadb

$ rm -rf charts/mariadb

$ ls -l charts/
total 0

$ helm dependency list
NAME    VERSION REPOSITORY                                              STATUS
mariadb 7.x.x   https://kubernetes-charts.storage.googleapis.com/       missing

$ helm dep update
Hang tight while we grab the latest from your chart repositories...
...Unable to get an update from the "local" chart repository (http://127.0.0.1:8879/charts):
        Get "http://127.0.0.1:8879/charts/index.yaml": dial tcp 127.0.0.1:8879: connect: connection refused
...Successfully got an update from the "stable" chart repository
Update Complete.
Saving 1 charts
Downloading mariadb from repo https://kubernetes-charts.storage.googleapis.com/
Deleting outdated charts

$ helm dependency list
NAME    VERSION REPOSITORY                                              STATUS
mariadb 7.x.x   https://kubernetes-charts.storage.googleapis.com/       ok


```



### Helm install locally

```
$ cd moodle
$ helm install .

```



```
$ kubectl get deployments
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
oily-deer-moodle   1/1     1            1           77m

$ kubectl get statefulsets
NAME                READY   AGE
oily-deer-mariadb   1/1     77m

$ kubectl get services
NAME                TYPE           CLUSTER-IP   EXTERNAL-IP     PORT(S)                      AGE
kubernetes          ClusterIP      10.4.0.1     <none>          443/TCP                      155m
oily-deer-mariadb   ClusterIP      10.4.5.139   <none>          3306/TCP                     77m
oily-deer-moodle    LoadBalancer   10.4.9.170   35.236.160.81   80:31916/TCP,443:30962/TCP   77m

$ kubectl get pods
NAME                               READY   STATUS    RESTARTS   AGE
oily-deer-mariadb-0                1/1     Running   0          77m
oily-deer-moodle-ff7989db4-tl6n9   1/1     Running   0          77m

$ helm ls
NAME            REVISION        UPDATED                         STATUS          CHART           APP VERSION     NAMESPACE
oily-deer       1               Fri Oct 30 05:46:51 2020        DEPLOYED        moodle-7.2.8    3.8.2           default

$ helm status oily-deer
```



### File structure of chart

**Chart.yaml**: A yaml file that contains information about the chart

**LICENSE**: An optional file contains info about the license for the chart

**README.md**: An optional human readable file

**requirements.yaml**: Optional file that listsdependencies for the chart

**values.yaml**: Contains the default configuration values for the chart

**templates**: Contains templates that combine with values to generate Kubernetes manifest files



```
# Create chart
$ helm create owenchart
Creating owenchart

$ ls -l owenchart/
total 16
drwxr-xr-x 2 sherwin sherwin 4096 Oct 30 07:45 charts
-rw-r--r-- 1 sherwin sherwin  105 Oct 30 07:45 Chart.yaml
drwxr-xr-x 3 sherwin sherwin 4096 Oct 30 07:45 templates
-rw-r--r-- 1 sherwin sherwin 1510 Oct 30 07:45 values.yaml
```



### Helm Commands

```
$ helm version

$ helm repo add

$ helm search repo

$ helm install --name 


```




# Helm Lecture

## Installing Helm

```
sudo snap install helm --classic
```

**From Script**

```
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```

**Ubuntu**

```
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```









## Writing Helm Chart

Creates a chart directory along with the common files and directories used in a chart

```
$ helm create nginx-chart

$ ls -l nginx-chart
total 16
-rw-r--r--  1 sherwinowen  staff  1147 Oct 27 13:56 Chart.yaml
drwxr-xr-x  2 sherwinowen  staff    64 Oct 27 13:56 charts
drwxr-xr-x  4 sherwinowen  staff   128 Oct 30 21:07 templates
-rw-r--r--  1 sherwinowen  staff   320 Oct 30 21:14 values.yaml
```

Installs chart using the chart created

```
$ helm install hello world 1 ./ nginx chart

$ helm install hello-world \
> --set replicaCount=2 \
> --set image=nginx \
> ./nginx-chart
NAME: hello-world
LAST DEPLOYED: Mon Oct 31 18:13:57 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
```





## Make sure Chart is working as intended



```
helm lint nginx chart
```

```
helm template ./ nginx chart

helm template ./ nginx chart --debug
```

```
helm install hello world 1 ./ nginx chart --
dry run
```



# Laboratory

## Installing Helm

1. You must have Kubernetes installed for a successful and properly secured use of `Helm`.

   Refer the documentation to check the prerequisites. The Documentation tab is available at the top right panel.

   - False

   - **True**

2. Install the `helm` package on the `controlplane` node.

   If unsure how to install the `helm` tool, feel free to refer to the documentation. The Documentation tab is available at the top right panel.

   **Note:** Make sure to complete the installation process before moving to the next questions.

   Check

   - Helm installed Successfully?

   ```
   controlplane ~ ➜  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
   
   controlplane ~ ➜  chmod 700 get_helm.sh
   
   controlplane ~ ➜  ./get_helm.sh 
   ```

3. Awesome 💪!! Now that you have Helm installed ✨ identify the Helm version in the cluster.

   - 1.17.4
   - 2.10.9
   - 3.1.0
   - 3.14
   - **3.11.0**

   ```
   controlplane ~ ➜  helm version
   version.BuildInfo{Version:"v3.11.0", GitCommit:"472c5736ab01133de504a826bd9ee12cbe4e7904", GitTreeState:"clean", GoVersion:"go1.18.10"}
   ```

4. Which environment variable can be used to indicate whether or not `Helm` is running in `Debug` mode?

   Use the help mode of the `helm` command to look for this information.

   Run the command: `helm --help` and check under Environment variables section.

   - **$HELM_DEBUG**
   - $DEBUG
   - $HELM_DEBUGGING
   - $HELM_ENABLE_DEBUG

   ```
   controlplane ~ ➜  helm --help
   The Kubernetes package manager
   
   Common actions for Helm:
   
   - helm search:    search for charts
   - helm pull:      download a chart to your local directory to view
   - helm install:   upload the chart to Kubernetes
   - helm list:      list releases of charts
   
   Environment variables:
   
   | Name                               | Description                                                                                       |
   |------------------------------------|---------------------------------------------------------------------------------------------------|
   | $HELM_CACHE_HOME                   | set an alternative location for storing cached files.                                             |
   | $HELM_CONFIG_HOME                  | set an alternative location for storing Helm configuration.                                       |
   | $HELM_DATA_HOME                    | set an alternative location for storing Helm data.                                                |
   | $HELM_DEBUG                        | indicate whether or not Helm is running in Debug mode               
   ```

5. What is a command line flag that can be used to enable verbose output?

   - **--debug**
   - --output
   - --verify
   - --verbose

   Run the command `helm --help` and check under the `Flags` section.

   ```
   controlplane ~ ➜  helm --help
   The Kubernetes package manager
   .......
   Flags:
         --burst-limit int                 client-side default throttling limit (default 100)
         --debug                           enable verbose output
     -h, --help                            help for helm
         --kube-apiserver string           the address and the port for the Kubernetes API server
         --kube-as-group stringArray       group to impersonate for the operation, this flag can be repeated to specify multiple groups.
         --kube-as-user string             username to impersonate for the operation
         --kube-ca-file string             the certificate authority file for the Kubernetes API server connection
         --kube-context string             name of the kubeconfig context to use
         --kube-insecure-skip-tls-verify   if true, the Kubernetes API server's certificate will not be checked for validity. This will make your HTTPS connections insecure
         --kube-tls-server-name string     server name to use for Kubernetes API server certificate validation. If it is not provided, the hostname used to contact the server is used
         --kube-token string               bearer token used for authentication
         --kubeconfig string               path to the kubeconfig file
     -n, --namespace string                namespace scope for this request
         --registry-config string          path to the registry config file (default "/root/.config/helm/registry/config.json")
         --repository-cache string         path to the file containing cached repository indexes (default "/root/.cache/helm/repository")
         --repository-config string        path to the file containing repository names and URLs (default "/root/.config/helm/repositories.yaml")
   
   Use "helm [command] --help" for more information about a command.
   ```

   

6. Which of the following is not a valid subcommand to use with `helm get` command?

   - values
   - **output**
   - hooks
   - notes
   - manifest

   Run the command `helm get --help` and check under the `Available Commands` section.

   ```
   controlplane ~ ➜  helm get --help
   
   This command consists of multiple subcommands which can be used to
   get extended information about the release, including:
   
   - The values used to generate the release
   - The generated manifest file
   - The notes provided by the chart of the release
   - The hooks associated with the release
   
   Usage:
     helm get [command]
   
   Available Commands:
     all         download all information for a named release
     hooks       download all hooks for a named release
     manifest    download the manifest for a named release
     notes       download the notes for a named release
     values      download the values file for a named release
   ```

7. That's all for now. That was a quick introduction to the `helm` command line utility. Feel free to explore the `helm` command line utility further. We will learn more about these commands throughout the remainder of this course.

   Ok



## USING HELM TO DEPLOY A CHART

1. The helm package that contains all of the resource definitions necessary to run an application, tool, or service inside of a Kubernetes cluster is known as a …

   - brew
   - map
   - **chart**
   - list

2. We cannot install the same chart multiple times on the same Kubernetes Cluster.

   - **False**
   - True

3. Which command is used to search for a `wordpress` helm chart package from the Artifact Hub?

   - **helm search hub wordpress**
   - helm find hub wordpress
   - helm find wordpress
   - helm list wordpress
   - helm search wordpress

   Run `helm search hub chart-name` command to search specific charts on Artifact Hub.

   **Note:** Replace the chart-name with the necessary package.

   ```
   controlplane ~ ➜  helm search hub wordpress
   URL                                                     CHART VERSION   APP VERSION             DESCRIPTION                                       
   https://artifacthub.io/packages/helm/kube-wordp...      0.1.0           1.1                     this is my wordpress package                      
   https://artifacthub.io/packages/helm/shubham-wo...      0.1.0           1.16.0                  A Helm chart for Kubernetes                       
   ```

4. Search for a `consul` helm chart package from the Artifact Hub and identify the `APP VERSION` for the `Official HashiCorp Consul Chart`.

   The url for bitnami repository is `https://charts.bitnami.com/bitnami`

   - 0.36.0
   - 1.10.2
   - 1.9.0
   - **1.14.2**

   ```
   controlplane ~ ➜  helm search hub consul | grep hashicorp
   https://artifacthub.io/packages/helm/hashicorp/...      1.0.2           1.14.2          Official HashiCorp Consul Chart   
   ```

5. Add `bitnami` helm chart repository in the controlplane node.

   Check

   - Repo added?

   ```
   controlplane ~ ➜  helm repo add bitnami https://charts.bitnami.com/bitnami
   ```

6. Which command is used to search for the `wordpress` package from the newly added bitnami repository?

   - **helm search repo wordpress**
   - helm search hub wordpress
   - helm find search wordpress
   - helm find repo wordpress
   - helm get repo wordpress

   ```
   controlplane ~ ➜  helm search repo wordpress
   NAME                    CHART VERSION   APP VERSION     DESCRIPTION                                       
   bitnami/wordpress       15.2.35         6.1.1           WordPress is the world's most popular blogging ...
   bitnami/wordpress-intel 2.1.31          6.1.1           DEPRECATED WordPress for Intel is the most popu...
   ```

7. How many `helm chart repositories` are there in the controlplane node now?

   We have added a few helm chart repositories in the controlplane node now.

   - **3**
   - 1
   - 2
   - 5

   ```
   controlplane ~ ➜  helm repo list
   NAME            URL                                                 
   bitnami         https://charts.bitnami.com/bitnami                  
   puppet          https://puppetlabs.github.io/puppetserver-helm-chart
   hashicorp       https://helm.releases.hashicorp.com                 
   ```

8. Deploy the `Apache` application on the cluster using the `apache` from the `bitnami` repository.

   Set the release Name to: `amaze-surf`

   Check

   - Chart Installed?

   ```
   controlplane ~ ➜  helm install amaze-surf bitnami/apache
   NAME: amaze-surf
   LAST DEPLOYED: Fri Jan 27 11:08:48 2023
   NAMESPACE: default
   STATUS: deployed
   REVISION: 1
   TEST SUITE: None
   NOTES:
   CHART NAME: apache
   CHART VERSION: 9.2.11
   APP VERSION: 2.4.55
   
   ** Please be patient while the chart is being deployed **
   
   1. Get the Apache URL by running:
   
   ** Please ensure an external IP is associated to the amaze-surf-apache service before proceeding **
   ** Watch the status using: kubectl get svc --namespace default -w amaze-surf-apache **
   
     export SERVICE_IP=$(kubectl get svc --namespace default amaze-surf-apache --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
     echo URL            : http://$SERVICE_IP/
   
   
   WARNING: You did not provide a custom web application. Apache will be deployed with a default page. Check the README section "Deploying your custom web application" in https://github.com/bitnami/charts/blob/main/bitnami/apache/README.md#deploying-a-custom-web-application.
   ```

9. What version of apache did we just install on the cluster using the helm chart?

   - **2.4.55**
   - 2.4.7
   - 2.2.9
   - 2.4.1

   Run the command helm list and check the APP VERSION of the release.

   ```
   controlplane ~ ➜  helm list
   NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
   amaze-surf      default         1               2023-01-27 11:08:48.51170214 +0000 UTC  deployed        apache-9.2.11   2.4.55    
   ```

10. How many releases of `nginx` charts can you see installed in the cluster now?

   Note: We just installed some charts

   - **2**
   - 3
   - 1
   - 0

   ```
   controlplane ~ ➜  helm list
   NAME            NAMESPACE       REVISION        UPDATED                                 STATUS        CHART            APP VERSION
   amaze-surf      default         1               2023-01-29 22:43:21.384273113 +0000 UTC deployed      apache-9.2.11    2.4.55     
   crazy-web       default         1               2023-01-29 22:44:05.386516908 +0000 UTC deployed      nginx-13.2.22    1.23.3     
   happy-browse    default         1               2023-01-29 22:44:02.287826716 +0000 UTC deployed      nginx-13.2.22    1.23.3     
   ```

11. Uninstall the nginx chart release `happy-browse` from the cluster.

    Check

    - Chart Removed?

    ```
    controlplane ~ ➜  helm uninstall happy-browse
    release "happy-browse" uninstalled
    ```

12. Remove the `Hashicorp helm repository` from the cluster.

    Check

    - Repo removed?

    ```
    controlplane ~ ➜  helm repo list
    NAME            URL                                                 
    bitnami         https://charts.bitnami.com/bitnami                  
    puppet          https://puppetlabs.github.io/puppetserver-helm-chart
    hashicorp       https://helm.releases.hashicorp.com                 
    
    controlplane ~ ➜  helm repo remove hashicorp
    "hashicorp" has been removed from your repositories
    ```



## INTRODUCTION TO HELM, LAB: UPGRADING A HELM CHART



1. Add `bitnami` helm chart repository to the cluster.

   **Note: -** Make sure to add the `bitnami` chart to the cluster before moving to the next questions.

   Check

   - Chart repository added?

   ```
   controlplane ~ ➜  helm repo add bitnami https://charts.bitnami.com/bitnami 
   "bitnami" has been added to your repositories
   ```

2. How many releases of `nginx` can you see in the cluster now?

   - **1**
   - 0
   - 2
   - 5

   ```
   controlplane ~ ➜  helm list
   NAME            NAMESPACE       REVISION        UPDATED                                 STATUS        CHART            APP VERSION
   dazzling-web    default         3               2023-01-29 22:58:13.920982742 +0000 UTC deployed      nginx-12.0.4     1.22.0     
   ```

3. How many revisions of `nginx` exists in the cluster?

   - **3**
   - 4
   - 1
   - 2

   ```
   controlplane ~ ➜  helm list
   NAME            NAMESPACE       REVISION        UPDATED                                 STATUS        CHART            APP VERSION
   dazzling-web    default         3               2023-01-29 22:58:13.920982742 +0000 UTC deployed      nginx-12.0.4     1.22.0     
   
   controlplane ~ ➜  helm history dazzling-web
   REVISION        UPDATED                         STATUS          CHART           APP VERSION     DESCRIPTION     
   1               Sun Jan 29 22:58:07 2023        superseded      nginx-12.0.4    1.22.0          Install complete
   2               Sun Jan 29 22:58:10 2023        superseded      nginx-12.0.5    1.22.0          Upgrade complete
   3               Sun Jan 29 22:58:13 2023        deployed        nginx-12.0.4    1.22.0          Upgrade complete
   ```

4. Which version of `nginx` is currently running in the cluster?

   - **1.22.0**
   - 1.19.4
   - 1.20.6
   - 1.21.6

   ```
   controlplane ~ ➜  helm list
   NAME            NAMESPACE       REVISION        UPDATED                                 STATUS        CHART            APP VERSION
   dazzling-web    default         3               2023-01-29 22:58:13.920982742 +0000 UTC deployed      nginx-12.0.4     1.22.0     
   ```

5. The DevOps team has decided to upgrade the `nginx` to version `1.23` in the bitnami repository.

   Make sure that the nginx version running in the cluster is `1.23.x`.

   Check

   - Nginx version: 1.23

   ```
   controlplane ~ ➜  helm upgrade dazzling-web bitnami/nginx --version 13
   Release "dazzling-web" has been upgraded. Happy Helming!
   NAME: dazzling-web
   LAST DEPLOYED: Sun Jan 29 23:06:46 2023
   NAMESPACE: default
   STATUS: deployed
   REVISION: 4
   TEST SUITE: None
   NOTES:
   CHART NAME: nginx
   CHART VERSION: 13.2.22
   APP VERSION: 1.23.3
   
   ** Please be patient while the chart is being deployed **
   NGINX can be accessed through the following DNS name from within your cluster:
   
       dazzling-web-nginx.default.svc.cluster.local (port 80)
   
   To access NGINX from outside the cluster, follow the steps below:
   
   1. Get the NGINX URL by running these commands:
   
     NOTE: It may take a few minutes for the LoadBalancer IP to be available.
           Watch the status with: 'kubectl get svc --namespace default -w dazzling-web-nginx'
   
       export SERVICE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].port}" services dazzling-web-nginx)
       export SERVICE_IP=$(kubectl get svc --namespace default dazzling-web-nginx -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
       echo "http://${SERVICE_IP}:${SERVICE_PORT}"
   ```

6. To which version is the `nginx` currently upgraded?

   - 1.21.0
   - **1.23.3**
   - 1.21.2
   - 1.19.10

   Run the command: `helm list` and look under the `APP VERSION` column.

   ```
   controlplane ~ ➜  helm list
   NAME            NAMESPACE       REVISION        UPDATED                                 STATUS        CHART            APP VERSION
   dazzling-web    default         4               2023-01-29 23:06:46.134288426 +0000 UTC deployed      nginx-13.2.22    1.23.3     
   ```

7. Oops!.. There seems to be a minor issue in the website and the DevOps Team is asked to rollback the nginx to previous version!

   Please rollback the `nginx` to previous version.

   Check

   - Rolled back successfully?

   ```
   controlplane ~ ➜  helm rollback dazzling-web
   Rollback was a success! Happy Helming!
   ```



## HELM CHARTS ANATOMY, LAB: WRITING A HELM CHART

1. We have pulled a `hello-world` chart in the directory `/root`.

   Please explore the chart and move to the next question.

   Ok

   ```
   controlplane ~/hello-world  ➜  ls -l 
   total 16
   -rw-r--r-- 1 root root  126 Dec 23 18:36 Chart.yaml
   -rw-r--r-- 1 root root   14 Dec 23 18:36 README.md
   drwxrwxr-x 2 root root 4096 Dec 23 18:36 templates
   -rw-r--r-- 1 root root  354 Dec 23 18:36 values.yaml
   ```

   Chart.yaml 

   ```
   apiVersion: v2
   appVersion: 1.16.0
   description: A Helm chart for Kubernetes
   Name: hello-world
   type: application
   version: 0.1.0
   ```

   values.yaml

   ```
   # Default values for hello-world.
   # This is a YAML-formatted file.
   # Declare variables to be passed into your templates.
   
   replicaCount: 1
   
   image:
     repository: nginx
     pullPolicy: IfNotPresent
     # Overrides the image tag whose default is the chart appVersion.
     tag: "1.16.0"
   
   nameOverride: ""
   fullnameOverride: ""
   
   service:
     type: ClusterIP
     port: 80
   ```

   ```
   controlplane ~/hello-world/templates ➜  ls -l 
   total 8
   -rw-r--r-- 1 root root 763 Dec 23 18:36 deployment.yaml
   -rw-r--r-- 1 root root 261 Dec 23 18:36 service.yaml
   ```

   deployment.yaml 

   ```
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: {{ .Release.Name }}-hello-world
     labels:
       app: hello-world
   spec:
     replicas: {{ .Values.replicaCount }}
     selector:
       matchLabels:
         app: hello-world
     template:
       metadata:
         labels:
           app: hello-world
       spec:
         containers:
           - name: {{ .Chart.Name }}
             image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
             imagePullPolicy: {{ .Values.image.pullPolicy }}
             ports:
               - name: http
                 containerPort: 80
                 protocol: TCP
             livenessProbe:
               httpGet:
                 path: /
                 port: http
             readinessProbe:
               httpGet:
                 path: /
                 port: http
   ```

   service.yaml 

   ```
   apiVersion: v1
   kind: Service
   metadata:
     name: {{ .Release.Name }}-hello-world
   spec:
     type: {{ .Values.service.type }}
     ports:
       - port: {{ .Values.service.port }}
         targetPort: http
         protocol: TCP
         name: http
     selector:
       app: hello-world
   ```

   

2. Inspect the `apiVersion` set on this chart and identify what Helm version this chart was built for.

   - Helm v2 and v3
   - Helm v1
   - Helm v2
   - **Helm v3**

3. What would be the name of the container created by this helm chart called `hello-world`?

   Answer the question by exploring the chart files. Do not deploy a release using the chart yet.

   - happy-panda
   - helm-world
   - nginx
   - **hello-world**

   Inspect the `deployment.yaml` file under the templates directory. And then inspect the `Chart.yaml` file.

4. What would be the name of the image used by the container created by this helm chart called `hello-world`?

   Answer the question by exploring the chart files. Do not deploy a release using the chart yet.

   - mysql
   - tomcat
   - **nginx:1.16.0**
   - apache

   Inspect the `deployment.yaml` file and the `values.yaml` files

5. Navigate to the directory `/root/webapp` where we have a deployment and service definition files of an app.

   Explore the files and move to the next question.

   Ok

   ```
   controlplane ~/webapp ➜  ls -l 
   total 8
   -rwxr-xr-x 1 root root 396 Dec 23 18:36 deployment.yaml
   -rwxr-xr-x 1 root root 223 Dec 23 18:36 service.yaml
   ```

   deployment.yaml

   ```
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: nginx
   spec:
     selector:
       matchLabels:
         app: nginx
     template:
       metadata:
         labels:
           app: nginx
       spec:
         containers:
           - name: nginx
             image: "nginx:1.16.0"
             imagePullPolicy: IfNotPresent
             ports:
               - name: http
                 containerPort: 80
                 protocol: TCP
   ```

   service.yaml

   ```
   apiVersion: v1
   kind: Service
   metadata:
     name: nginx
   spec:
     type: NodePort
     ports:
       - port: 80
         targetPort: http
         protocol: TCP
         nodePort: 30080
         name: http
     selector:
       app: nginx
   ```

   

6. What resources are created as part of this application?

   - **Deployment and Service**
   - Secret
   - Deployment
   - Service
   - ConfigMap

7. What would be the name of the deployment if we were to deploy this application on the cluster now?

   - nginx-deployment
   - RELEASE-NAME-nginx
   - **nginx**
   - Deployment

   Check the value of the `name` field under the `metadata` section of this deployment file.

   ```
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: nginx
   spec:
     selector:
       matchLabels:
         app: nginx
     template:
       metadata:
         labels:
           app: nginx
       spec:
         containers:
           - name: nginx
             image: "nginx:1.16.0"
             imagePullPolicy: IfNotPresent
             ports:
               - name: http
                 containerPort: 80
                 protocol: TCP
   ```

8. Create a helm chart at `/root/webapp-nginx` for this application by converting the deployment and service definition files into templates.

   Create a chart first and then move the definition files into the `templates` directory.

   1. The deployment and service objects should be named in the format `RELEASE-NAME-nginx`.
   2. Set `apiVersion` for the chart to `v2`.
   3. Name the chart `webapp-nginx`.
   4. Set version number to `0.1.1`.
   5. Set `appVersion` to `1.16.0`.
   6. Values file has a variable `image` set by default so make changes for an image `nginx:1.16.0`.
   7. Value of `image` variable to be used in deployment as the image name for the `container`.

   **Note:** - Remove the unused YAML and text files from the `templates` directory.

   CheckCompleteIncomplete

   - Deployment property fixed?
   - Apiversion set?
   - Chart Name is correct?
   - Right Chart version?
   - Appversion is set?
   - image value set?
   - tag value set?
   - deployment value updated?
   - deployment image tag set?
   - Service Property fixed?

   Run the following command to create a chart structure :

   ```
   controlplane ~/webapp ➜  helm create /root/webapp-nginx
   Creating /root/webapp-nginx
   ```

   
   and after running that command, make changes according to the question.

   The `Chart.yaml` should be look like as follows:

   ```yaml
   apiVersion: v2
   name: webapp-nginx
   description: A Helm chart for Kubernetes
   type: application
   version: 0.1.1
   appVersion: "1.16.0"
   ```

   
   Update the field's value according to the question and remove the other unused fields in `values.yaml`.

   The `values.yaml` file should be look like as follows:

   ```yaml
   replicaCount: 1
   
   image:
     repository: nginx
     tag: 1.16.0
   
   service:
     type: ClusterIP
     port: 80
   ```

   
   Copy the deployment and service definition files from `"/root/webapp"` directory to `"/root/webapp-nginx/templates"` directory.

   ```
   controlplane ~ ➜  cp -vr /root/webapp/* /root/webapp-nginx/templates/
   '/root/webapp/deployment.yaml' -> '/root/webapp-nginx/templates/deployment.yaml'
   '/root/webapp/service.yaml' -> '/root/webapp-nginx/templates/service.yaml'
   ```

   
   and remove other YAML and text files which are not in use.

   The deployment name can be modified in `deployment.yaml` file as:

   ```yaml
     name: {{ .Release.Name }}-nginx
   ```

   
   The container section in the `deployment.yaml` can be modified as:

   ```yaml
      containers:
         - name: {{ .Values.image.repository }}
           image: {{ .Values.image.repository }}:{{ .Values.image.tag }}
   ```

   deployment.yaml 

   ```
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: {{ .Release.Name }}-nginx 
   spec:
     selector:
       matchLabels:
         app: nginx
     template:
       metadata:
         labels:
           app: nginx
       spec:
         containers:
           - name: {{ .Values.image.repository }}
             image: {{ .Values.image.repository }}:{{ .Values.image.tag }}
             imagePullPolicy: IfNotPresent
             ports:
               - name: http
                 containerPort: 80
                 protocol: TCP
   ```

   

   The service name in the `service.yaml` should be modified as:

   ```yaml
     name: {{ .Release.Name }}-nginx
   ```

   service.yaml 

   ```
   apiVersion: v1
   kind: Service
   metadata:
     name: {{ .Release.Name }}-nginx
   spec:
     type: NodePort
     ports:
       - port: 80
         targetPort: http
         protocol: TCP
         nodePort: 30080
         name: http
     selector:
       app: nginx
   ```

9. What would be the `nodePort` at which the service exposes the application if we deploy a release with this helm chart - `webapp`?

   - **30080**
   - 38080
   - 8080
   - None

   ```
   controlplane ~/webapp-nginx/templates ➜  cat service.yaml 
   apiVersion: v1
   kind: Service
   metadata:
     name: {{ .Release.Name }}-nginx
   spec:
     type: NodePort
     ports:
       - port: 80
         targetPort: http
         protocol: TCP
         nodePort: 30080
         name: http
     selector:
       app: nginx
   ```

   

10. There seems to be an issue with the `service.yaml`.

    Identify the issue and fix it.

    **Note:** We have made some changes.

    Check

    - Service property fixed?
    - Right nodeport used?

    Fix the `nodePort` in the `service.yaml` file.

    ```
    controlplane ~ ✖ helm template ./webapp-nginx/
    Error: template: webapp-nginx/templates/serviceaccount.yaml:1:14: executing "webapp-nginx/templates/serviceaccount.yaml" at <.Values.serviceAccount.create>: nil pointer evaluating interface {}.create
    
    Use --debug flag to render out invalid YAML
    ```

    By using the `helm template` command, we see that the value is empty for the `nodePort` field under the `service.spec.ports` that we have to fix.

    There is a typo in `service.yaml` for the `nodePort` field. It should be look like this:

    ```
    nodePort: {{ .Values.service.nodePort }}
    ```

    service.yaml 

    ```
    apiVersion: v1
    kind: Service
    metadata:
      name: {{ .Release.Name }}-nginx
    spec:
      type: NodePort
      ports:
        - port: 80
          targetPort: http
          protocol: TCP
          nodePort: {{ .Values.service.nodePort }}
          name: http
      selector:
        app: nginx
    ```

11. Now change the service type in the `service.yaml` so as to fetch value from the `values.yaml`.

    Check

    - service yaml fixed?

    The service type field should be updated as follows:

    ```
    type: {{ .Values.service.type }}
    ```

    service.yaml

    ```
    apiVersion: v1
    kind: Service
    metadata:
      name: {{ .Release.Name }}-nginx
    spec:
      type: {{ .Values.service.type }}
      ports:
        - port: 80
          targetPort: http
          protocol: TCP
          nodePort: {{ .Values.service.nodePort }}
          name: http
      selector:
        app: nginx
    ```

12. Now install the `webapp-nginx` helm chart.

    **Release-Name:**`webapp`

    You will be able to view the application by accessing the `webapp` icon located at the top right corner of the terminal.

    Check

    - webapp-nginx deployment created?

    Run the command: `helm install webapp ./webapp-nginx` to install the chart and to ensure that the deployment resource created by using the command : `kubectl get deploy`.
    
    ```
    controlplane ~ ➜  helm install webapp ./webapp-nginx/
    NAME: webapp
    LAST DEPLOYED: Tue Jan 31 04:18:50 2023
    NAMESPACE: default
    STATUS: deployed
    REVISION: 1
    TEST SUITE: None
    ```
    
    ```
    controlplane ~ ➜  kubectl get deployments.apps 
    NAME           READY   UP-TO-DATE   AVAILABLE   AGE
    webapp-nginx   1/1     1            1           26s
    ```
    
    



## HELM CHARTS ANATOMY, LAB: USING FUNCTIONS AND PIPELINES

1. Chaining together multiple functions to express a series of transformations is known as a …

   - package
   - function
   - chart
   - pipeline

   One of the powerful features of the template language is its concept of pipelines. `Pipelines` are a tool for chaining together a series of template commands to compactly express a series of transformations.

   In other words, pipelines are an efficient way of getting several things done in sequence.

2. What would this expression within a helm chart template file result in provided `image.repository` is set to `wordpress`?

   ```
   {{ .Values.image.repository | upper }}
   ```

   - {{ WORDPRESS }}
   - wordpress | upper
   - wordpress
   - **WORDPRESS**

   `Upper` is a string function which convert the entire string to uppercase.

3. Which function takes a list of values and returns the first non-empty one?

   Refer to the list of functions using the URL link at the top of your terminal

   - not
   - **coalesce**
   - ternary
   - fail

   The `coalesce` function takes a list of values and returns the first non-empty one.

   coalesce 0 1 2

   The above returns 1

4. Which function can be used to generate a random password that uses only letters `a-zA-Z`?

   - **randAlpha**
   - randAscii
   - randNumeric
   - randAlphaNum

   Function `randAlpha` can be used to generate cryptographically secure (uses crypto/rand) random strings with characters `a-zA-Z`.

5. What would be the output of this expression if wordpressPassword is `PassW0rd` ?

   ```
   {{ .Values.wordpressPassword | b64enc | quote }}
   ```

   - **"UGFzc1cwcmQ="**
   - "UGFzc1c="
   - "UGFzc1cwcmDA"
   - "cm9vdA=="

   Run the command: `echo -n PassW0rd | base64` to generate the base64 encoded string and `-n` flag removes the trailing newlines.

   In our example, `b64enc` will encode the values with base64 and `quote` will wrap the encoded string in double-quotes.

6. We have created a helm chart package at `/root/` directory named `webapp`. What will be the `tag` name for the container image that will be created when we deploy the helm package `webapp`?

   **Note:** You don't need to install the chart. Just inspect the files which are part of the chart to get the information.

   - v1
   - .Values.image.tag
   - **2.4-alpine**
   - No tag
   - 0.1.0

   Check the `deployment.yaml` file present under the `templates` directory.

   When you check the `deployment.yaml` file you can see tag name mentioned as

   ```
   {{ .Values.image.tag | default .Chart.AppVersion }}
   ```

   If you check `values.yaml` file, the tag is mentioned empty, which means the tag name will be the `AppVersion` mentioned in the `Chart.yaml`.

7. What about now? What will be the `tag` set on the container image now? We made a few changes.

   **Note:** Do not change any files and we don't need to install the chart either. Try to figure out the answer by referring to `values.yaml`, template files and the `Chart.yaml` file.

   - No tag
   - 2.4-alpine
   - 2.4
   - **2.4.51**

   values.yaml

   ```
   # Default values for webapp.
   # This is a YAML-formatted file.
   # Declare variables to be passed into your templates.
   
   replicaCount: 1
   
   image:
     repository: httpd
     pullPolicy: IfNotPresent
     # Overrides the image tag whose default is the chart appVersion.
     tag: 2.4.51
   
   nameOverride: webapp
   fullnameOverride: my-webapp
   
   serviceAccount:
     # Specifies whether a service account should be created
     create: true
     # Annotations to add to the service account
     annotations: {}
     # The name of the service account to use.
     # If not set and create is true, a name is generated using the fullname template
     name: webapp-sa
     labels:
           app: web_application
           tier: frontend
   
   service:
     type: NodePort
     port: 80
     nodePort: 30080
   ```

   Chart.yaml 

   ```
   apiVersion: v2
   appVersion: 2.4-alpine
   description: An Apache Application
   name: webapp
   type: application
   version: 0.1.0
   ```

   ```
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: {{ include "webapp.fullname" . }}
     labels:
       {{- include "webapp.labels" . | nindent 4 }}
   spec:
     replicas: {{ .Values.replicaCount }}
     selector:
       matchLabels:
         {{- include "webapp.selectorLabels" . | nindent 6 }}
     template:
       metadata:
         labels:
           {{- include "webapp.selectorLabels" . | nindent 8 }}
       spec:
         serviceAccountName: {{ include "webapp.serviceAccountName" . }}
         containers:
           - name: {{ .Chart.Name }}
             image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default 2.4 }}"
             imagePullPolicy: {{ .Values.image.pullPolicy }}
             ports:
               - name: http
                 containerPort: 80
                 protocol: TCP
             livenessProbe:
               httpGet:
                 path: /
                 port: http
             readinessProbe:
               httpGet:
                 path: /
                 port: http
   ```

   

   When you check the `deployment.yaml` file you can see tag name as

   ```
   {{ .Values.image.tag | default 2.4 }}
   ```

   If you check `values.yaml` file, tag is mentioned as`2.4.51`.

8. We have decided that all labels have the first letter in upper case. Change the `serviceaccount.yaml` file so that the label `tier` ends up being `Frontend` instead of the `frontend` as it is currently. Any label set in the `values.yaml` file for the service account must have its first letter converted to upper case.

   **Note:** Use the appropriate function. Do not change the `values.yaml` and you don't need to install the chart for now.

   You may use a command like this to test your work:

   ```
   helm template /root/webapp --set serviceAccount.labels.tier=customlabel
   ```

   This overrides the default label set in the `values.yaml` file with a custom label you pass in from the command line. Then look for the generated `serviceaccount.yaml` file.

   To look at the specific tier line add a grep to the command:

   ```
   helm template /root/webapp --set serviceAccount.labels.tier=customlabel | grep tier
   ```

   CheckCompleteIncomplete

   - values.yaml unchanged?
   - Labelled correctly?
   - Correct function used?

   You can use the string function `Title`.

   In the `serviceaccount.yaml` edit the label as : `tier: {{ .Values.serviceAccount.labels.tier | title }}`

   serviceaccount.yaml

   ```
   apiVersion: v1
   kind: ServiceAccount
   metadata:
     name: {{ .Values.serviceAccount.Name }}
     labels:
       app: {{ .Values.serviceAccount.labels.app }}
       tier: {{ .Values.serviceAccount.labels.tier | title }}
   ```

   ```
   controlplane ~/webapp is 📦 v0.1.0 via ⎈ v3.11.0 ➜  helm template /root/webapp/ --set serviceAccount.labels.tier=customlabel
   ---
   # Source: webapp/templates/serviceaccount.yaml
   apiVersion: v1
   kind: ServiceAccount
   metadata:
     name: 
     labels:
       app: web_application
       tier: Customlabel
   ```

   ```
   controlplane ~/webapp is 📦 v0.1.0 via ⎈ v3.11.0 ➜  helm template /root/webapp/ --set serviceAccount.labels.tier=customlabel | grep tier
       tier: Customlabel
   ```

9. Use the appropriate function to convert the label `app` in the `serviceaccount.yaml` file from `web_application` to `WebApplication` .

   Few more examples:

   ```
   web_site` should become `WebSite
   my_site` should become `MySite
   ```

   **Note:** Do not make any changes to `values.yaml` and you don't need to install the chart for now.

   You may use a command like this to test your work:

   ```
   helm template /root/webapp --set serviceAccount.labels.app=custom_app
   ```

   
   This overrides the default label set in the values.yaml file with a custom label you pass in from the command line. Then look for the generated serviceaccount.yaml file.


   To look at the specific app line add a grep to the command:

   ```
   helm template /root/webapp --set serviceAccount.labels.app=custom_app | grep app:
   ```

   Check

   - values.yaml unchanged?
   - Labelled correctly?
   - Correct function used?

   Use the string function `camelcase`.

   In the `serviceaccount.yaml` edit the label as: `app: {{ Values.serviceAccount.labels.app | camelcase }}`

   ```
   apiVersion: v1
   kind: ServiceAccount
   metadata:
     name: {{ .Values.serviceAccount.Name }}
     labels:
       app: {{ .Values.serviceAccount.labels.app | camelcase }}
       tier: {{ .Values.serviceAccount.labels.tier | title }}
   ```

   ```
   controlplane ~/webapp is 📦 v0.1.0 via ⎈ v3.11.0 ➜  helm template /root/webapp/ --set serviceAccount.labels.app=customlabel
   ---
   # Source: webapp/templates/serviceaccount.yaml
   apiVersion: v1
   kind: ServiceAccount
   metadata:
     name: 
     labels:
       app: Customlabel
   ```

   ```
   controlplane ~/webapp is 📦 v0.1.0 via ⎈ v3.11.0 ➜  helm template /root/webapp/ --set serviceAccount.labels.app=customlabel | grep app
   # Source: webapp/templates/serviceaccount.yaml
       app: Customlabel
   ```



10. Now install the `webapp` chart.

    Set the release-name as `my-web-app`

    There might be some errors. So please fix them.

    CheckCompleteIncomplete

    - Chart Fixed?
    - Chart Installed?

    Run the command: `helm lint webapp` and check whether there is any issues.

    ```
    controlplane ~ ➜  helm lint webapp
    ==> Linting webapp
    [INFO] Chart.yaml: icon is recommended
    [WARNING] templates/serviceaccount.yaml: object name does not conform to Kubernetes naming requirements: "": metadata.name: Invalid value: "": a lowercase RFC 1123 subdomain must consist of lower case alphanumeric characters, '-' or '.', and must start and end with an alphanumeric character (e.g. 'example.com', regex used for validation is '[a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*')
    
    1 chart(s) linted, 0 chart(s) failed
    ```

    values.yaml

    ```
    # Default values for webapp.
    # This is a YAML-formatted file.
    # Declare variables to be passed into your templates.
    
    replicaCount: 1
    
    image:
      repository: httpd
      pullPolicy: IfNotPresent
      # Overrides the image tag whose default is the chart appVersion.
      tag: 2.4.51
    
    nameOverride: webapp
    fullnameOverride: my-webapp
    
    serviceAccount:
      # Specifies whether a service account should be created
      create: true
      # Annotations to add to the service account
      annotations: {}
      # The name of the service account to use.
      # If not set and create is true, a name is generated using the fullname template
      name: webapp-sa
      labels:
            app: web_application
            tier: frontend
    
    service:
      type: NodePort
      port: 80
      nodePort: 30080
    
    ```

    

    Fix the `name` in the `serviceaccount.yaml` as

    ```yaml
    name: {{ .Values.serviceAccount.name }}
    ```

    serviceaccount.yaml

    ```
    apiVersion: v1
    kind: ServiceAccount
    metadata:
      name: {{ .Values.serviceAccount.name }}
      labels:
        app: {{ .Values.serviceAccount.labels.app | camelcase }}
        tier: {{ .Values.serviceAccount.labels.tier | title }}
    ```

    Check for errors

    ```
    controlplane ~ ➜  helm lint webapp
    ==> Linting webapp
    [INFO] Chart.yaml: icon is recommended
    
    1 chart(s) linted, 0 chart(s) failed
    ```

    

    Then run the `helm install my-web-app webapp/` command.

    ```
    controlplane ~ ➜  helm install my-web-app webapp/
    NAME: my-web-app
    LAST DEPLOYED: Mon Jan 30 02:56:45 2023
    NAMESPACE: default
    STATUS: deployed
    REVISION: 1
    TEST SUITE: None
    NOTES:
    1. Get the application URL by running these commands:
      export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services my-webapp)
      export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
      echo http://$NODE_IP:$NODE_PORT
    ```

11. Awesome! 💪 You should be able to access the `webapp` now.

    Wait for the pod to be in a ready state and then click on the `webapp` tab located on the top right side of the terminal.

    Ok





## HELM CHARTS ANATOMY, LAB: CONDITIONALS, WITH BLOCKS AND RANGES

1. We have added a `webapp-color` chart repository under the `/root` directory.

   Inspect it and move on to the next question.

   Ok

   ```
   controlplane ~ ➜  ls -l webapp-color/
   total 12
   -rw-r--r-- 1 root root  692 Dec 23 18:36 Chart.yaml
   drwxrwxr-x 2 root root 4096 Dec 23 18:36 templates
   -rw-r--r-- 1 root root 1551 Dec 23 18:36 values.yaml
   ```

2. Will we be able to access the web application if we install the `webapp-color` chart as is and access it from the browser via NodePort?

   **Note:** We don't need to install the chart as of now.

   - Yes
   - **No**

   Inspect the `values.yaml` file.

   We have not used `NodePort` in the `values.yaml` so the application will not be accessible from the browser.

3. Change the service type to NodePort in the `values.yaml` file.

   Also assign the nodePort as `30080` in the `values.yaml`.

   CheckCompleteIncomplete

   - Service Type updated?
   - Service Port updated?

   The service section in the `values.yaml` should be as follows:

   ```\
   service:
     name: webapp-color-svc
     type: NodePort
     port: 8080
     nodePort: 30080
   ```

   values.yaml

   ```
   # Default values for webapp-color.
   # This is a YAML-formatted file.
   # Declare variables to be passed into your templates.
   
   replicaCount: 1
   
   image:
     repository: kodekloud/webapp-color
     pullPolicy: IfNotPresent
     # Overrides the image tag whose default is the chart appVersion.
     tag: ""
   
   imagePullSecrets: []
   
   name: webapp-color
   
   serviceAccount:
     # Specifies whether a service account should be created
     create: false
     # Annotations to add to the service account
     annotations: {}
     # The name of the service account to use.
     # If not set and create is true, a name is generated using the fullname template
     name: webapp-sa
     labels: 
       tier: frontend
       type: web
       mode: proxy
   
   podAnnotations: {}
   
   podSecurityContext: {}
     # fsGroup: 2000
   
   securityContext: {}
     # capabilities:
     #   drop:
     #   - ALL
     # readOnlyRootFilesystem: true
     # runAsNonRoot: true
     # runAsUser: 1000
   
   service:
     name: webapp-color-svc
     type: NodePort
     port: 8080
     nodePort: 30080
   
   
   environment: development
   
   
   configMap:
     name: webapp-color-configmap
   
   resources: {}
     # We usually recommend not to specify default resources and to leave this as a conscious
     # choice for the user. This also increases chances charts run on environments with little
     # resources, such as Minikube. If you do want to specify resources, uncomment the following
     # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
     # limits:
     #   cpu: 100m
     #   memory: 128Mi
     # requests:
     #   cpu: 100m
     #   memory: 128Mi
   nodeSelector: {}
   
   tolerations: []
   
   affinity: {}
   ```

4. Now update the `service.yaml` file in such a way that if the service type is `NodePort`, then it should fetch the `nodePort` value from the `values.yaml` file.

   The `service.yaml` file is located under the `/root/webapp-color/templates` directory.

   Check

   - Conditional used?
   - Service Type?

   Use the `if` conditional.

   The solution `service.yaml` is

   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: {{ .Values.name }}
     namespace: default
   spec:
     ports:
     - port: 8080
       protocol: TCP
       targetPort: 8080
       {{- if eq .Values.service.type "NodePort" }}
       nodePort: {{ .Values.service.nodePort }}
       {{- end }}
     selector:
       name: webapp-color
     type: {{ .Values.service.type }}
   status:
     loadBalancer: {}
   ```

5. Now update the `configmap.yaml` in such a way that the `APP_COLOR` should take the values based on the `environment` defined in `values.yaml` .

   1. if `environment` is production, value should be `pink`.
   2. else if `environment` is development, value should be `darkblue`.
   3. else, value should be `green`.

   Note: Only make the necessary changes in the `configmap.yaml` file.

   Check

   - Conditionals used?
   - Right env variable set?

   Use `if/else-if/else` conditional loops in helm chart.

   The `configmap.yaml` file will be:

   ```yaml
   apiVersion: v1
   metadata:
     name: {{ .Values.configMap.name }}
     namespace: default
   kind: ConfigMap
   data:
     {{- if eq .Values.environment "production" }}
       APP_COLOR: pink
     {{- else if eq .Values.environment "development" }}
       APP_COLOR: darkblue
     {{- else }}
       APP_COLOR: green
     {{- end }}
   ```

6. If we try to install the `webapp-color` helm chart repository now, will the serviceAccount be created?

   **Note:** You dont need to install the helm chart now.

   - **Yes, ServiceAccount named webapp-sa will be created**
   - No, ServiceAccount creation is disabled in values.yaml

   Run the dry-run command if unsure.

   Since we are not making use of a conditional for the service account, the field `create: false` in the `values.yaml` file is ignored.

7. Make appropriate changes in the `serviceaccount.yaml` file to:

   1. Check whether `serviceAccount` should be created or not (use the `with` conditional).
   2. Use the serviceAccount `name` from the `values.yaml` file.

   Check

   - Conditionals used?

   The solution `serviceaccount.yaml` is provided below:

   ```yaml
   {{- with .Values.serviceAccount.create }}
   apiVersion: v1
   kind: ServiceAccount
   metadata:
     name: {{ .Values.serviceAccount.name }}
     labels:
       app: webapp-color
   {{- end }}
   ```

8. Now that we have updated the `serviceaccount.yaml` file with the condition, update the `values.yaml` file to enable creation of serviceaccount.

   Check

   - value modified?

   The serviceaccount section in the `values.yaml` should be modified as follows:

   ```yaml
   serviceAccount:
     # Specifies whether a service account should be created
     create: true
   ```

   values.yaml

   ```
   # Default values for webapp-color.
   # This is a YAML-formatted file.
   # Declare variables to be passed into your templates.
   
   replicaCount: 1
   
   image:
     repository: kodekloud/webapp-color
     pullPolicy: IfNotPresent
     # Overrides the image tag whose default is the chart appVersion.
     tag: ""
   
   imagePullSecrets: []
   
   name: webapp-color
   
   serviceAccount:
     # Specifies whether a service account should be created
     create: true
   ```

9. Try to dry-run the `webapp-color` chart now.

   Fix the chart if there is any issues with the chart.

   Check

   - Syntax Check?

   Try running:
   `helm install webapp-color /root/webapp-color/ --dry-run`
   Check whether Root scope for `with` conditional is added in the `serviceaccount.yaml` file.

   ```
   controlplane ~ ➜  helm install webapp-color /root/webapp-color/ --dry-run
   Error: INSTALLATION FAILED: template: webapp-color/templates/serviceaccount.yaml:5:18: executing "webapp-color/templates/serviceaccount.yaml" at <.Values.serviceAccount.name>: can't evaluate field Values in type bool
   ```

   You need to add `$` symbol as mentioned in the solution file for `serviceaccount.yaml` provided below:

   serviceaccount.yaml

   ```yaml
   {{- with .Values.serviceAccount.create }}
   apiVersion: v1
   kind: ServiceAccount
   metadata:
     name: {{ $.Values.serviceAccount.name }}
     labels:
       app: webapp-color
   {{- end }}
   ```

10. Set additional `labels` for the `serviceaccount` which is defined in the `values.yaml` under the `serviceAccount` section.

   After deploying on the cluster. Please make sure that the **keys** and **values** are fetched from the `values.yaml` in the form as shown below:

   For example:

   ```yaml
   Name:                webapp-sa
   Namespace:           default
   Labels:              app=webapp-color
                        app.kubernetes.io/managed-by=Helm
                        mode=proxy
                        tier=frontend
                        type=web
   ...
   ```

   Check

   - Label set correctly?
   - Conditional used?

   Use range operator.

   The solution file for `serviceaccount.yaml` is as follows:

   ```yaml
   {{- with .Values.serviceAccount.create }}
   apiVersion: v1
   kind: ServiceAccount
   metadata:
     name: {{ $.Values.serviceAccount.name }}
     labels:
       {{- range $key, $val := $.Values.serviceAccount.labels }}
       {{ $key }}: {{ $val }}
       {{- end }}
       app: webapp-color
   {{- end }}
   ```





## HELM CHARTS ANATOMY, LAB: CHART HOOKS

1. Navigate to the directory `webapp-color` under the `/root` directory.

   Inspect the chart repository.

   Ok

   ```
   controlplane ~ ➜  ls -l webapp-color/
   total 12
   -rw-r--r-- 1 root root  692 Dec 23 18:36 Chart.yaml
   drwxrwxr-x 2 root root 4096 Dec 23 18:36 templates
   -rw-r--r-- 1 root root 1528 Dec 23 18:36 values.yaml
   ```

2. You will be able to see a `.tpl` file inside the `templates` directory of the `webapp-color` chart.

   There is an issue with the file name. Fix it.

   Check

   - Template file renamed?

   The template file should start with an `underscore`. Else it will be considered a Kubernetes manifest file.

   ```
   controlplane ~ ➜  mv  webapp-color/templates/helpers.tpl webapp-color/templates/_helpers.tpl 
   ```

3. Now add the label added in the template file to the `deployment.yaml` file.

   Use `include` statement and correct `indentation`.

   Check

   - include statement added?
   - Labels set?

   The solution deployment files should be as follows:

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     labels:
     {{- include "labels" . | indent 2 }}
       app: webapp-color
     name: {{ .Values.name }}
   spec:
     replicas: 1
     selector:
       matchLabels:
       {{- include "labels" . | indent 4 }}
         app: webapp-color
     template:
       metadata:
         labels:
         {{- include "labels" . | indent 6 }}
           app: webapp-color
       spec:
         containers:
         - image: kodekloud/webapp-color
           name: webapp-color
           envFrom:
            - configMapRef:
                   name: {{ .Values.configMap.name }}
   ```

4. Now define a `selectorLabels` section in the template file. You should use the selector `unit: dev` for the service.

   **Note:** We have already updated the selector field in the `service.yaml` file.

   Check

   - Updated template file?
   - Right Selector used?

   Check the `service.yaml` file and add the `webapp-color.selectorLabels` in the template file.

   service.yaml

   ```
   apiVersion: v1
   kind: Service
   metadata:
     name: {{ .Values.name }}
     namespace: default
   spec:
     ports:
     - port: 8080
       protocol: TCP
       targetPort: 8080
       {{- if eq .Values.service.type "NodePort" }}
       nodePort: {{ .Values.service.nodePort }}
       {{- end }}
     selector:
       {{- include "webapp-color.selectorLabels" . | indent 4 }}
     type: {{ .Values.service.type }}
   status:
     loadBalancer: {}
   ```

   

   The `_helpers.tpl` file should be as follows:

   ```
   {{/*
   Common labels
   */}}
   {{- define "labels" }}
     unit: dev
   {{- end }}
   
   
   {{- define "webapp-color.selectorLabels" }}
     unit: dev
   {{- end }}
   ```

5. Now navigate to the directory `/root/webapp` where we have an Apache helm chart repository.

   Ok

   ```
   controlplane ~/webapp ➜  ls -l 
   total 12
   -rw-r--r-- 1 root root  115 Dec 23 18:36 Chart.yaml
   drwxrwxr-x 2 root root 4096 Dec 23 18:36 templates
   -rw-r--r-- 1 root root  667 Dec 23 18:36 values.yaml
   ```

6. Now modify the `install-job.yaml` so that it will only execute after all resources are loaded into Kubernetes.

   Check

   - Right chart hook added?

   Use `post-install` hook in the `install-job.yaml`.

   ```
   The install-job.yaml should be modified as below:
   
   apiVersion: batch/v1
   kind: Job
   metadata:
     name: install-hook
     annotations:
        "helm.sh/hook": post-install
   spec:
     template:
       spec:
         containers:
         - name: install-hook
           image: alpine
           command: ["echo",  "Successful Installation"]
         restartPolicy: Never
     backoffLimit: 4
   ```

7. Which `hook` deletion policy deletes the previous resource before a new hook is launched?

   - **before-hook-creation**
   - after-hook-creation
   - hook-failed
   - hook-succeeded

   `before-hook-creation` policy deletes the previous resource before a new hook is launched.

8. Install the `webapp` chart repository.

   The release name should be `httpd`.

   After creation, you can see the pod status `Completed`, which is created by a job called `install-hook`. Check the pod log to view the output.

   Check

   - Chart installed?
   - Deployment running?
   - Job ran successfully?

   Run the command: `helm install httpd webapp`

   ```
   controlplane ~ ➜  helm install httpd webapp
   NAME: httpd
   LAST DEPLOYED: Mon Jan 30 06:56:42 2023
   NAMESPACE: default
   STATUS: deployed
   REVISION: 1
   TEST SUITE: None
   NOTES:
   1. Get the application URL by running these commands:
     export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services my-webapp)
     export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
     echo http://$NODE_IP:$NODE_PORT
   ```

   ```
   controlplane ~ ➜  kubectl get pods
   NAME                         READY   STATUS      RESTARTS   AGE
   install-hook--1-vkg2r        0/1     Completed   0          109s
   my-webapp-75f57479b4-9n88g   1/1     Running     0          110s
   ```

   ```
   controlplane ~ ✖ kubectl logs pods/install-hook--1-r6stn
   Successful Installation
   ```



## HELM CHARTS ANATOMY, LAB: UPLOADING CHARTS

1. Which command packages a chart into a versioned chart archive file?

   - helm template
   - helm repo
   - **helm package**
   - helm archive

2. Which flag can be used to `sign` a helm package?

   - --gen
   - --key
   - **--sign**
   - --signature

   ```
   controlplane ~ ➜  helm package -h
   
   This command packages a chart into a versioned chart archive file. If a path
   is given, this will look at that path for a chart (which must contain a
   Chart.yaml file) and then package that directory.
   
   Versioned chart archives are used by Helm package repositories.
   
   To sign a chart, use the '--sign' flag. In most cases, you should also
   provide '--keyring path/to/secret/keys' and '--key keyname'.
   
     $ helm package --sign ./mychart --key mykey --keyring ~/.gnupg/secring.gpg
   
   If '--keyring' is not specified, Helm usually defaults to the public keyring
   unless your environment is otherwise configured.
   
   Usage:
     helm package [CHART_PATH] [...] [flags]
   
   Flags:
         --app-version string       set the appVersion on the chart to this version
     -u, --dependency-update        update dependencies from "Chart.yaml" to dir "charts/" before packaging
     -d, --destination string       location to write the chart. (default ".")
     -h, --help                     help for package
         --key string               name of the key to use when signing. Used if --sign is true
         --keyring string           location of a public keyring (default "/root/.gnupg/pubring.gpg")
         --passphrase-file string   location of a file which contains the passphrase for the signing key. Use "-" in order to read from stdin.
         --sign                     use a PGP private key to sign this package
   ```

3. Which files provide cryptographic verification that a chart has not been tampered with, and was packaged by a trusted provider?

   - Chart
   - **Provenance**
   - Archive
   - gpg

4. Which command can be used to check that the given chart has a valid provenance file?

   - helm archive
   - helm provenance
   - **helm verify**
   - helm validate

5. We have added the `webapp-color` chart in the `/root/` directory.

   Package the chart in the `/root/package` directory.

   Check

   - packaged successfully?

   Create a directory called `package` and run the command `helm package`

   Run the following commands:

   ```shell
   mkdir /root/package
   cd /root/package/
   helm package /root/webapp-color
   ```

   ```
   controlplane ~ ➜  mkdir /root/package
   
   controlplane ~ ➜  cd /root/package/
   
   controlplane ~/package ➜  helm package /root/webapp-color
   Successfully packaged chart and saved it to: /root/package/webapp-color-0.1.0.tgz
   
   controlplane ~/package ➜  ls
   webapp-color-0.1.0.tgz
   ```

   


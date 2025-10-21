# Manage Scalable Workloads in GKE Enterprise



# Lab 1: Manage Workloads at Scale with GKE Fleets and Teams

## Overview

[GKE Enterprise](https://cloud.google.com/anthos/docs/concepts/gke-editions) offers a set of capabilities that help you manage clusters, infrastructure, and workloads. These capabilities are all built around the idea of the fleet: a logical grouping of Kubernetes clusters and other resources that can be managed by the Fleet service, also known as the Hub service.

One of the primary responsibilities of platform administrators is to ensure that application and service teams have the necessary infrastructure resources to run their workloads. With GKE Enterprise's fleet team management features, administrators can easily provision and manage infrastructure resources for different teams, with each team treated as a separate "tenant" on the fleet.

In this lab, you learn about the fleet and fleet team management features of GKE Enterprise to build an Enterprise Developer Platform.

### What you'll learn

In this lab, you learn how to perform the following tasks:

- Create GKE clusters
- Register clusters to a fleet
- Set up teams for your fleet and manage its features
- Explore team-based logs

## Setup and requirements

#### Before you click the Start Lab button

**Note: Read these instructions.**



Labs are timed and you cannot pause them. The timer, which starts when you click **Start Lab**, shows how long Google Cloud resources will be made available to you.

This Qwiklabs hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

#### What you need

To complete this lab, you need:

- Access to a standard internet browser (Chrome browser recommended).
- Time to complete the lab.

**Note:** If you already have your own personal Google Cloud account or project, do not use it for this lab.

**Note:** If you are using a Pixelbook, open an Incognito window to run this lab.

#### How to start your lab and sign in to the Console

1. Click the **Start Lab** button. If you need to pay for the lab, a pop-up opens for you to select your payment method. On the left is a panel populated with the temporary credentials that you must use for this lab.

   ![Credentials panel](https://cdn.qwiklabs.com/%2FtHp4GI5VSDyTtdqi3qDFtevuY014F88%2BFow%2FadnRgE%3D)

2. Copy the username, and then click **Open Google Console**. The lab spins up resources, and then opens another tab that shows the **Choose an account** page.

   **Note:** Open the tabs in separate windows, side-by-side.

3. On the Choose an account page, click **Use Another Account**. The Sign in page opens.

   ![Choose an account dialog box with Use Another Account option highlighted ](https://cdn.qwiklabs.com/eQ6xPnPn13GjiJP3RWlHWwiMjhooHxTNvzfg1AL2WPw%3D)

4. Paste the username that you copied from the Connection Details panel. Then copy and paste the password.

**Note:** You must use the credentials from the Connection Details panel. Do not use your Google Cloud Skills Boost credentials. If you have your own Google Cloud account, do not use it for this lab (avoids incurring charges).

1. Click through the subsequent pages:

- Accept the terms and conditions.
- Do not add recovery options or two-factor authentication (because this is a temporary account).
- Do not sign up for free trials.

After a few moments, the Cloud console opens in this tab.

**Note:** You can view the menu with a list of Google Cloud Products and Services by clicking the **Navigation menu** at the top-left. ![Cloud Console Menu](https://cdn.qwiklabs.com/9vT7xPlxoNP%2FPsK0J8j0ZPFB4HnnpaIJVCDByaBrSHg%3D)

## Task 1. Create GKE Clusters and register to fleet

### Enable GKE Enterprise

In this task, begin by enabling the GKE Enterprise.

1. In the Google Cloud console, select the **Navigation Menu** (![Navigation menu](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)) **> Kubernetes Engine > Overview**.
2. Click the **Learn about Enterprise** link in the top lefthand corner of the console. From here, you can see a description of the various features available in GKE Enterprise.
3. Click the **Learn about GKE Enterprise** button.

To learn more about the features included with GKE Enterprise, view the details under the **Features and Benefits** tab.

At this stage, you need to register your fleet and enable GKE Enterprise.

1. Click the **Enable GKE Enterprise** button.
2. Click **Edit Fleet Name or Cluster List**.
3. On the **Fleet registration** page, enter `gke-enterprise-fleet` in the **Fleet name** field. The fleet name cannot be changed after initial creation.
4. Click **Save** to save the Fleet name.
5. Click **Confirm** to enable GKE Enterprise.

**Note:** As an alternative to the console-based method above, you can enable GKE enterprise by enabling the **Anthos API** using gcloud, and create an empty fleet using the following command:



```
gcloud container fleet create --display-name=gke-enterprise-fleet
```

1. Click **Close** to complete the operation.

Click **Check my progress** to verify the objective.

Enable GKE Enterprise



### Create and register clusters to fleet using CLI

Next, create and register two clusters; an Autopilot cluster, and a Standard cluster.

1. In the Cloud console, click the **Cloud Shell** icon ![Cloud Shell icon](https://cdn.qwiklabs.com/ep8HmqYGdD%2FkUncAAYpV47OYoHwC8%2Bg0WK%2F8sidHquE%3D) in the upper-right corner.

Perform the steps below in the **Cloud Shell** environment.

1. Create a GKE Autopilot cluster (with the `--async` flag to avoid waiting for the first cluster to provision) and register to the fleet:

```
gcloud container clusters create-auto --async \
gke-enterprise-01-ap --region us-east1 \
--release-channel rapid --labels mesh_id=proj-PROJECT_NUMBER \
--enable-fleet
```



1. Create and register a second GKE Standard cluster:

```
gcloud container clusters create \
gke-enterprise-02-st --zone us-east1-d \
--release-channel rapid --num-nodes 2 --labels mesh_id=proj-PROJECT_NUMBER \
--workload-pool=qwiklabs-gcp-00-a40ebe845644.svc.id.goog --gateway-api=standard --enable-fleet --machine-type e2-standard-2
```



**Note:** It can take up to 10 minutes to provision the GKE clusters.

1. Ensure that both the clusters are running:

```
gcloud container clusters list
```



1. View the fleet overview in the **Overview** section.

Click **Check my progress** to verify the objective.

Create GKE Enterprise edition clusters



## Task 2. Manage fleet-level features

Fleets let you manage enterprise and other fleet-enabled features across multiple clusters at once.

**Configure Fleet settings:**

With GKE Enterprise, you can create fleet-level default settings for your GKE clusters. From here, you can view the status of features, configure and edit fleet-level settings, and apply them to your clusters. Here are the fleet-level default settings you can configure according to what you need for this lab:

- Service Mesh
- Config Sync
- Continuous validation for Binary Authorization
- Policy Controller
- Security posture

After configuring fleet-level settings, any GKE cluster you register during cluster creation is automatically configured with your fleet-level configurations.

1. In the **Cloud Shell** environment, to enable a feature for your fleet use the following command:

```
gcloud container fleet mesh enable
```



To begin managing the fleet-level features, configure the Policy.

1. In the Google Cloud console, select the **Navigation Menu** (![Navigation menu](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)) **> Kubernetes Engine > Features > Feature Manager**.
2. Find Policy and click **Configure**.
3. On the **Feature Manager: Policy** page, click **Customize Fleet Setting** to configure fleet-level settings.
4. Enable **Pod Security Policies v2022**.
5. Click **Edit Policy Controller configuration**, and choose the policy version **1.18.1** and then save the changes.
6. Click **Configure** to configure fleet settings.

**Note:** If you are asked to confirm fleet settings, click **Confirm**.

**Note:** If you get failed in configure fleet settings, try again by clicking **Configure**.

1. Select both clusters to sync it with the default fleet-level settings and then click on **Sync to fleet settings**.
2. Click **Confirm** to sync the cluster.

**Note:** It can take up to `5-10 minutes` for the clusters **Feature status** to get **enabled**. Refresh your page periodically until the status appears.

Click **Check my progress** to verify the objective.

Config Policy Controller



Within your fleet settings, you can configure Security posture, set Vulnerabilities scan to Basic, save the changes, and configure fleet settings.

## Task 3. Set up teams for your fleet

Fleet team management features help administrators to easily allocate and manage infrastructure resources for their teams. Each team is treated as a distinct "tenant" within the fleet. This allows teams to run and manage their own workloads, view logs, track resource utilization, error rates, and other metrics that are relevant to their specific clusters and namespaces.

For more information about the fleet team management feature, refer to the [Fleet team management documentation](https://cloud.google.com/anthos/fleet-management/docs/team-management).

In this task, you set up and manage fleet usage for a team.

1. On the Google Cloud console, select the **Navigation Menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)) **> Kubernetes Engine > Teams**.
2. Click **Create Team Scope**.

Team scopes let you define subsets of fleet resources on a per-team basis, with each scope associated with one or more fleet member clusters. Team scopes can include clusters on Google Cloud or outside Google Cloud, though all the clusters must be members of the same fleet. A cluster can be associated with more than one team scope, letting different teams run workloads on the same cluster.

1. On the **Team Basics** page, in the **Name** field, enter `gcc-dev-team` for your team scope.

You won't be able to change this name once the team scope is created.

1. To add team members to the scope, click **Add Team Member**.
2. For **Type**, select **User** to add an individual team member.
3. For **User**, type `student-02-6983ed7a187c@qwiklabs.net` as the email address.
4. For **Role**, select **Scope Admin** to specify the access level of the team member.
5. On the **Team Basics** page, after adding team members to your scope, click **Continue**.
6. In the **Clusters** dropdown, select both the fleet clusters `gke-enterprise-01-ap` and `gke-enterprise-02-st` to associate with this team scope, and click **OK**.
7. On the **Clusters** page, after adding clusters to your scope, click **Continue**.
8. On the **Namespaces** page, click **+ Add Namespace**.

Fleet namespaces provide a way to control who has access to specific namespaces within your fleet. By default, any namespaces with the same name defined on clusters in the fleet are treated as if they were the same namespace. However, fleet team management provides a way to add more granular control over namespaces.

You can create fleet namespaces within specific team scopes, and then grant team members access to them only on clusters within their team scope. Fleet namespaces can be used in the same way as any other Kubernetes namespace on the member clusters in the team scope. Platform admins can create fleet namespaces themselves, or, with some extra permissions, delegate namespace creation to team admins.

1. For **Name**, enter `gcc-dev-ns`.
2. To create the team scope, click **Create Team Scope**.

Click **Check my progress** to verify the objective.

Set up teams for your fleet



## Task 4. Deploy an application to the team

Cymbal Bank is a sample HTTP-based web app that simulates a bank's payment processing network, allowing users to create artificial bank accounts and complete transactions.

In this task, you deploy this application to the `gke-enterprise-01-ap` cluster registered in the team.

Perform the steps below in the **Cloud Shell** environment.

1. Retrieve the credentials for the cluster using the following command:

```
gcloud container clusters get-credentials gke-enterprise-01-ap \
    --region us-east1 
```



1. To simplify the name of the Kubernetes context, rename it to the name of the cluster:

```
kubectl config rename-context gke_qwiklabs-gcp-00-a40ebe845644_us-east1_gke-enterprise-01-ap gke-enterprise-01-ap
```



1. Clone the application repository:

```
git clone https://github.com/GoogleCloudPlatform/bank-of-anthos.git && \
cd bank-of-anthos
```



1. Deploy application to the `gke-enterprise-01-ap` GKE cluster in `gcc-dev-ns` namespace:

```
kubectl config use-context gke-enterprise-01-ap
kubectl apply -f ./extras/jwt/jwt-secret.yaml --namespace gcc-dev-ns
kubectl apply -f ./kubernetes-manifests --namespace gcc-dev-ns
```



1. Wait approximately 3-4 minutes and verify all the pods are running:

```
kubectl get pods --namespace gcc-dev-ns
```



Click **Check my progress** to verify the objective.

Deploy the application



## Task 5. View team-based logs and Fleet overview

### View team-based logs

Fleet logs allow you to view logs at the entire fleet level, or for specific team scopes.

Fleet scope logs show Container and Pod logs for applications owned by a team deployed in a specific fleet scope with multiple fleet-level namespaces.

In this task, you enable fleet logs using Google Cloud CLI and view team-based logs.

1. Enable fleet logging:

```
cat > config.json << EOF
{
  "loggingConfig": {
      "defaultConfig": {
          "mode": "COPY"
      },
      "fleetScopeLogsConfig": {
          "mode": "MOVE"
      }
  }
}
EOF

gcloud container fleet fleetobservability update --logging-config=config.json
```



1. Click the team scope `gcc-dev-team`, whose logs you want to view, and click the **Logs** tab.
2. Select **Container Logs** to filter the logs view.

**Note:** It can take up to 2-3 minutes to load the logs after fleet logging is enabled.

Click **Check my progress** to verify the objective.

View team based logs



Additional permissions are required if you are registering a cluster to a fleet in a different project (also known as cross-project registration). See [Set up cross-project logging permissions](https://cloud.google.com/anthos/fleet-management/docs/fleet-logs#cross-project-config) for more details.

You can grant access to users to view container logs and Pod logs. For more information, see [Grant team access to logs](https://cloud.google.com/anthos/fleet-management/docs/fleet-logs#grant_team_access_to_logs).

### Fleet overview

The GKE Enterprise Overview dashboard in the Google Cloud console provides a "big picture" overview of your fleet. The overview helps you use your GKE Enterprise features by showing you how many security concerns your fleet has, your fleet-wide policy controller coverage, and the synchronization status of your config sync packages.

In addition, the dashboard provides a fleet-level view of resource utilization of your fleets, clusters, and teams. You can use this information to help optimize spending, application design, and resource allocation, including CPU, memory, and disk utilization.

To view the overview dashboard with your fleet `gke-enterprise-fleet`, go to the [GKE Enterprise overview](https://console.cloud.google.com/kubernetes/overview) in the console.

![The Overview tabbed page, which displays the gke-enterprise-fleet dashboard](https://cdn.qwiklabs.com/1DuCsKcKWTryJl9B5VS%2BZ6an7I5JB8N1CuElsknoQfI%3D)

## Congratulations!



# Lab 2: Automate GKE Configurations with Config Sync

## Overview

[Google Kubernetes Engine (GKE) Enterprise](https://cloud.google.com/kubernetes-engine/docs/concepts/gke-editions) edition comes with two features to help administrators streamline and automate the GKE Enterprise resource management process:

- [Config Sync](https://cloud.google.com/anthos-config-management/docs/concepts/gitops-best-practices) is a GitOps-driven service that automates the synchronization of configurations stored in a Git repository with the Kubernetes cluster.

Using Config Sync allows for automated management of Kubernetes cluster configuration. This integrated approach simplifies cluster management, allowing you to confidently manage Kubernetes deployments across your fleet.

In this lab, you will use Config Sync to automate configuration. This provides an efficient way to maintain Kubernetes infrastructure.

### Objectives

In this lab, you learn how to perform the following tasks:

- Configure Config Sync
- Deploy a sample application on two GKE clusters using Config Sync

## Setup and requirements

#### Before you click the Start Lab button

**Note: Read these instructions.**



Labs are timed and you cannot pause them. The timer, which starts when you click **Start Lab**, shows how long Google Cloud resources will be made available to you.

This Qwiklabs hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

#### What you need

To complete this lab, you need:

- Access to a standard internet browser (Chrome browser recommended).
- Time to complete the lab.

**Note:** If you already have your own personal Google Cloud account or project, do not use it for this lab.

**Note:** If you are using a Pixelbook, open an Incognito window to run this lab.

#### How to start your lab and sign in to the Console

1. Click the **Start Lab** button. If you need to pay for the lab, a pop-up opens for you to select your payment method. On the left is a panel populated with the temporary credentials that you must use for this lab.

   ![Credentials panel](https://cdn.qwiklabs.com/%2FtHp4GI5VSDyTtdqi3qDFtevuY014F88%2BFow%2FadnRgE%3D)

2. Copy the username, and then click **Open Google Console**. The lab spins up resources, and then opens another tab that shows the **Choose an account** page.

   **Note:** Open the tabs in separate windows, side-by-side.

3. On the Choose an account page, click **Use Another Account**. The Sign in page opens.

   ![Choose an account dialog box with Use Another Account option highlighted ](https://cdn.qwiklabs.com/eQ6xPnPn13GjiJP3RWlHWwiMjhooHxTNvzfg1AL2WPw%3D)

4. Paste the username that you copied from the Connection Details panel. Then copy and paste the password.

**Note:** You must use the credentials from the Connection Details panel. Do not use your Google Cloud Skills Boost credentials. If you have your own Google Cloud account, do not use it for this lab (avoids incurring charges).

1. Click through the subsequent pages:

- Accept the terms and conditions.
- Do not add recovery options or two-factor authentication (because this is a temporary account).
- Do not sign up for free trials.

After a few moments, the Cloud console opens in this tab.

**Note:** You can view the menu with a list of Google Cloud Products and Services by clicking the **Navigation menu** at the top-left. ![Cloud Console Menu](https://cdn.qwiklabs.com/9vT7xPlxoNP%2FPsK0J8j0ZPFB4HnnpaIJVCDByaBrSHg%3D)

### Activate Google Cloud Shell

Google Cloud Shell is a virtual machine that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud.

Google Cloud Shell provides command-line access to your Google Cloud resources.

1. In Cloud console, on the top right toolbar, click the Open Cloud Shell button.

   ![Highlighted Cloud Shell icon](https://cdn.qwiklabs.com/WGBFVIap4CrFWut%2BGdNFzNxeelWYHF1IqYSMFH6Ouq4%3D)

2. Click **Continue**.

It takes a few moments to provision and connect to the environment. When you are connected, you are already authenticated, and the project is set to your *PROJECT_ID*. For example:

![Project ID highlighted in the Cloud Shell Terminal](https://cdn.qwiklabs.com/hmMK0W41Txk%2B20bQyuDP9g60vCdBajIS%2B52iI2f4bYk%3D)

**gcloud** is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

- You can list the active account name with this command:

```
gcloud auth list
```



**Output:**

```
Credentialed accounts:
 - <myaccount>@<mydomain>.com (active)
</mydomain></myaccount>
```

**Example output:**

```
Credentialed accounts:
 - google1623327_student@qwiklabs.net
```

- You can list the project ID with this command:

```
gcloud config list project
```



**Output:**

```
[core]
project = <project_id>
</project_id>
```

**Example output:**

```
[core]
project = qwiklabs-gcp-44776a13dea667a6
```

**Note:** Full documentation of **gcloud** is available in the [gcloud CLI overview guide ](https://cloud.google.com/sdk/gcloud).

## Task 1. Create GKE clusters and enable the GKE Service Mesh

In this task, you complete some prework to make the subsequent sections easier to work through. This includes setting environment variables, copying the necessary lab files, and creating contexts for both GKE clusters.

### Enable the required GKE enterprise APIs

1. Enable the required APIs:

```
gcloud services enable \
--project=qwiklabs-gcp-03-031318fc8126 \
anthos.googleapis.com \
anthosconfigmanagement.googleapis.com \
container.googleapis.com \
stackdriver.googleapis.com \
monitoring.googleapis.com \
cloudtrace.googleapis.com \
logging.googleapis.com \
meshca.googleapis.com \
meshtelemetry.googleapis.com \
meshconfig.googleapis.com \
multiclustermetering.googleapis.com \
multiclusteringress.googleapis.com \
multiclusterservicediscovery.googleapis.com \
iamcredentials.googleapis.com \
iam.googleapis.com \
gkeconnect.googleapis.com \
gkehub.googleapis.com \
compute.googleapis.com \
sourcerepo.googleapis.com \
osconfig.googleapis.com

gcloud services enable \
--project=qwiklabs-gcp-03-031318fc8126 \
trafficdirector.googleapis.com \
networkservices.googleapis.com \
mesh.googleapis.com \
cloudresourcemanager.googleapis.com
```



### Create two GKE clusters

1. Create the first GKE cluster (with the `--async` flag to avoid waiting for the first cluster to provision) with authorized networks:

```
gcloud container clusters create "gke-cluster-1" \
--node-locations us-central1-f \
--location us-central1 \
--num-nodes "2" --min-nodes "2" --max-nodes "2" \
--workload-pool "qwiklabs-gcp-03-031318fc8126.svc.id.goog" \
--enable-ip-alias \
--machine-type "e2-standard-4" \
--node-labels mesh_id=proj-764298333673  \
--labels mesh_id=proj-764298333673  \
--fleet-project=qwiklabs-gcp-03-031318fc8126  --async
```



2. Create a second cluster named `gke-cluster-2`:

```
gcloud container clusters create "gke-cluster-2" \
--node-locations us-central1-f \
--location us-central1 \
--num-nodes "2" --min-nodes "2" --max-nodes "2" \
--workload-pool "qwiklabs-gcp-03-031318fc8126.svc.id.goog" \
--enable-ip-alias \
--machine-type "e2-standard-4" \
--node-labels mesh_id=proj-764298333673  \
--labels mesh_id=proj-764298333673  \
--fleet-project=qwiklabs-gcp-03-031318fc8126
```



**Note:** It can take up to ten minutes to provision the GKE clusters.

3. Verify that both clusters are in running state:

```
$ gcloud container clusters list
NAME: gke-cluster-1
LOCATION: us-central1
MASTER_VERSION: 1.33.4-gke.1245000
MASTER_IP: 136.115.158.92
MACHINE_TYPE: e2-standard-4
NODE_VERSION: 1.33.4-gke.1245000
NUM_NODES: 2
STATUS: RUNNING
STACK_TYPE: IPV4

NAME: gke-cluster-2
LOCATION: us-central1
MASTER_VERSION: 1.33.4-gke.1245000
MASTER_IP: 34.9.202.36
MACHINE_TYPE: e2-standard-4
NODE_VERSION: 1.33.4-gke.1245000
NUM_NODES: 2
STATUS: RUNNING
STACK_TYPE: IPV4
```



4. Create a WORKDIR to store all associated files for this tutorial:

```
mkdir -p secure-gke && cd secure-gke && export WORKDIR=$(pwd)
```



### Enable the GKE Service Mesh fleet feature

In this section, you install GKE Service Mesh on the two GKE clusters and configure the clusters for cross-cluster service discovery.

#### For gke-cluster-1

1. Enable the mesh:

```
$ gcloud storage cp -r gs://spls/gsp1241/k8s/ ~
gcloud beta container hub mesh enable --project=qwiklabs-gcp-03-031318fc8126
Copying gs://spls/gsp1241/k8s/asm-ingressgateway.yaml to file:///home/student_02_c6dd655f94f8/k8s/asm-ingressgateway.yaml
Copying gs://spls/gsp1241/k8s/controlplanerevision-asm-managed.yaml to file:///home/student_02_c6dd655f94f8/k8s/controlplanerevision-asm-managed.yaml
Copying gs://spls/gsp1241/k8s/namespace-asm-gateways.yaml to file:///home/student_02_c6dd655f94f8/k8s/namespace-asm-gateways.yaml                                          
Copying gs://spls/gsp1241/k8s/namespace-istio-system.yaml to file:///home/student_02_c6dd655f94f8/k8s/namespace-istio-system.yaml
  Completed files 4/4 | 1.6kiB/1.6kiB                                                                                                                                      

Average throughput: 3.5kiB/s
Waiting for Feature Service Mesh to be created...done.                                   
```



2. Get cluster credentials:

```
$ gcloud container clusters get-credentials gke-cluster-1 --zone us-central1
Fetching cluster endpoint and auth data.
kubeconfig entry generated for gke-cluster-1.
```



3. Verify that the CRD is established in the cluster:

```
$ for NUM in {1..60} ; do
  kubectl get crd | grep controlplanerevisions.mesh.cloud.google.com && break
  sleep 10
done
kubectl wait --for=condition=established crd controlplanerevisions.mesh.cloud.google.com --timeout=10m
controlplanerevisions.mesh.cloud.google.com            2025-10-06T06:50:00Z
customresourcedefinition.apiextensions.k8s.io/controlplanerevisions.mesh.cloud.google.com condition met
```



The output should be similar to the following:

```
controlplanerevisions.mesh.cloud.google.com       2024-03-18T16:03:10Z
customresourcedefinition.apiextensions.k8s.io/controlplanerevisions.mesh.cloud.google.com condition met
```

**Note:** It can take up to ten minutes to establish a CRD.

4. Apply the mesh_id label:

```
$ gcloud container clusters update gke-cluster-1 \
    --project qwiklabs-gcp-03-031318fc8126 \
    --region us-central1 \
    --update-labels=mesh_id=proj-764298333673 
Updating gke-cluster-1...done.                                                                                                                                             
Updated [https://container.googleapis.com/v1/projects/qwiklabs-gcp-03-031318fc8126/zones/us-central1/clusters/gke-cluster-1].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/us-central1/gke-cluster-1?project=qwiklabs-gcp-03-031318fc8126gcloud container clusters update gke-cluster-1 \
    --project qwiklabs-gcp-03-031318fc8126 \
    --region us-central1 \
    --update-labels=mesh_id=proj-764298333673 
```



5. Create the istio namespace and apply Control Plane CR:

```
$ kubectl apply -f ~/k8s/namespace-istio-system.yaml
kubectl apply -f ~/k8s/controlplanerevision-asm-managed.yaml
namespace/istio-system created
controlplanerevision.mesh.cloud.google.com/asm-managed created
```



6. Verify that the control plane is provisioned:

```
$ kubectl wait --for=condition=ProvisioningFinished controlplanerevision asm-managed -n istio-system --timeout 600s0s
controlplanerevision.mesh.cloud.google.com/asm-managed condition met
```



The output should be similar to the following:

```
controlplanerevision.mesh.cloud.google.com/asm-managed condition met
```

**Note:** It can take up to ten minutes to meet the condition. Re-run the command if you do not get the expected output.

7. Create the ASM Gateway namespace, and apply ASM Gateway:

```
$ kubectl apply -f ~/k8s/namespace-asm-gateways.yaml
kubectl apply -f ~/k8s/asm-ingressgateway.yaml
namespace/asm-gateways created
service/asm-ingressgateway created
deployment.apps/asm-ingressgateway created
role.rbac.authorization.k8s.io/asm-ingressgateway-sds created
rolebinding.rbac.authorization.k8s.io/asm-ingressgateway-sds created
```



#### For gke-cluster-2

1. Get the cluster credentials:

```
$ gcloud container clusters get-credentials gke-cluster-2 --zone us-central1
Fetching cluster endpoint and auth data.
kubeconfig entry generated for gke-cluster-2.
```



2. Verify CRD is established in the cluster:

```
$ for NUM in {1..60} ; do
  kubectl get crd | grep controlplanerevisions.mesh.cloud.google.com && break
  sleep 10
done
kubectl wait --for=condition=established crd controlplanerevisions.mesh.cloud.google.com --timeout=10m
controlplanerevisions.mesh.cloud.google.com            2025-10-06T06:49:59Z
customresourcedefinition.apiextensions.k8s.io/controlplanerevisions.mesh.cloud.google.com condition met
```



The output should be similar to the following:

```
controlplanerevisions.mesh.cloud.google.com       2024-03-18T16:03:10Z
customresourcedefinition.apiextensions.k8s.io/controlplanerevisions.mesh.cloud.google.com condition met
```

**Note:** It can take up to ten minutes to establishe a CRD.

3. Apply the mesh_id label:

```
$ gcloud container clusters update gke-cluster-2 \
    --project qwiklabs-gcp-03-031318fc8126 \
    --region us-central1 \
    --update-labels=mesh_id=proj-764298333673 
Updating gke-cluster-2...done.                                                                                                                                             
Updated [https://container.googleapis.com/v1/projects/qwiklabs-gcp-03-031318fc8126/zones/us-central1/clusters/gke-cluster-2].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/us-central1/gke-cluster-2?project=qwiklabs-gcp-03-031318fc8126
```



4. Create the istio namespace and apply Control Plane CR:

```
$ kubectl apply -f ~/k8s/namespace-istio-system.yaml
kubectl apply -f ~/k8s/controlplanerevision-asm-managed.yaml
namespace/istio-system created
controlplanerevision.mesh.cloud.google.com/asm-managed created
```



5. Verify that the control plane is provisioned:

```
$ kubectl wait --for=condition=ProvisioningFinished controlplanerevision asm-managed -n istio-system --timeout 600s
controlplanerevision.mesh.cloud.google.com/asm-managed condition met
```



The output should be similar to the following:

```
controlplanerevision.mesh.cloud.google.com/asm-managed condition met
```

**Note:** It can take up to ten minutes to meet the condition. Re-run the command if you do not get the expected output.

6. Create the ASM Gateway namespace and apply ASM Gateway:

```
$ kubectl apply -f ~/k8s/namespace-asm-gateways.yaml
kubectl apply -f ~/k8s/asm-ingressgateway.yaml
namespace/asm-gateways created
service/asm-ingressgateway created
deployment.apps/asm-ingressgateway created
role.rbac.authorization.k8s.io/asm-ingressgateway-sds created
rolebinding.rbac.authorization.k8s.io/asm-ingressgateway-sds created
```



Prepare the Config Sync Git repository via Configuration Management.

7. Create an IAM policy binding between the Kubernetes service account and the Google service account.

```
$ gcloud --project=qwiklabs-gcp-03-031318fc8126 iam service-accounts add-iam-policy-binding \
--role roles/iam.workloadIdentityUser \
--member "serviceAccount:qwiklabs-gcp-03-031318fc8126.svc.id.goog[config-management-system/root-reconciler]" \
asm-reader-sa@qwiklabs-gcp-03-031318fc8126.iam.gserviceaccount.com
Updated IAM policy for serviceAccount [asm-reader-sa@qwiklabs-gcp-03-031318fc8126.iam.gserviceaccount.com].
bindings:
- members:
  - serviceAccount:qwiklabs-gcp-03-031318fc8126.svc.id.goog[config-management-system/root-reconciler]
  role: roles/iam.workloadIdentityUser
etag: BwZAeBthjOk=
version: 1
```



The Kubernetes service account is not created until you configure Config Sync for the first time. This binding lets the Config Sync Kubernetes service account act as the Google service account.

8. Configure your Git client:

```
git config --global user.email "sherwin_ad@yahoo.com"
git config --global user.name "sherwin-ad"
```



Click **Check my progress** to verify the objective.

Perform initial set up task



## Task 2. Install Config Sync

With Config Sync, you can manage Kubernetes resources with configuration files stored in a source of truth. Config Sync supports Git repositories, OCI images, and Helm charts as a source of truth. This page shows you how to enable and configure Config Sync so that it syncs from your root repository.

1. In the Google Cloud console, select the **Navigation Menu** (![Navigation menu](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)) > **Kubernetes Engine > Config**.
2. In the **Dashboard** tabbed page, click **Install Config Sync**.
3. In **Config Sync**, select **Manual upgrades**.

Leave the rest of the fields with their default values.

1. In the **Available Enterprise-enabled clusters** table, select both clusters and click **Install Config Sync**.

After a few minutes, go to the **Settings** tab. You should see **Status** is `enabled` for both `clusters`.

1. On the **Dashboard** tabbed page, click **Deploy Package**.
2. In the **Select Enterprise-enabled clusters for package deployment** table, select both clusters, then click **Continue**.
3. Leave **Package hosted on Git** selected, then click **Continue**.
4. In the **Package name** field, enter `root-sync`.

Leave the Sync type as **Cluster scoped sync**.

1. In the **Repository URL** field, enter the following url:

```
https://source.developers.google.com/p/qwiklabs-gcp-03-031318fc8126/r/acm-repo
```



1. In the **Branch** field, enter `main`.
2. In advanced settings, enter the following values:

| Parameter                     | Value                                                        |
| :---------------------------- | :----------------------------------------------------------- |
| **Authentication type**       | Workload Identity                                            |
| **GCP service account email** | asm-reader-sa@`qwiklabs-gcp-03-031318fc8126`.iam.gserviceaccount.com |
| **Source format**             | Hierarchy                                                    |

Leave all other fields with their default values.

1. Click **Deploy Package**.

**Note:** Upon deployment of the package, the Sync status column displays **Error**. This is expected behaviour, as Task 3 involves pushing configuration files to the repository.

1. Get cluster credentials for your GKE Clusters:

```
touch ~/secure-gke/asm-kubeconfig && export KUBECONFIG=~/secure-gke/asm-kubeconfig
gcloud container clusters get-credentials gke-cluster-1 --zone us-central1
gcloud container clusters get-credentials gke-cluster-2 --zone us-central1
kubectl config rename-context gke_qwiklabs-gcp-03-031318fc8126_us-central1_gke-cluster-1 gke-cluster-1
kubectl config rename-context gke_qwiklabs-gcp-03-031318fc8126_us-central1_gke-cluster-2 gke-cluster-2
kubectl config get-contexts
```



1. Download the latest version of the nomos client:

```
gsutil cp gs://config-management-release/released/latest/linux_amd64/nomos ~/secure-gke/nomos && chmod +x ~/secure-gke/nomos
export NOMOS=~/secure-gke/nomos
$NOMOS version
```



You may see an error message stating that the cluster cannot be contacted. If so, just rerun the $NOMOS version command, as this is usually a timing issue.

The output should be similar to the following:

```
CURRENT   CLUSTER_CONTEXT_NAME   COMPONENT           VERSION
                                 <nomos cli="">         v1.17.2-rc.1
          gke-cluster-1          config-management   v1.17.2-rc.1
*         gke-cluster-2          config-management   v1.17.2-rc.1     
</nomos>
```

Click **Check my progress** to verify the objective.

Install Config Sync



## Task 3. Deploy an app via Config Sync

In this task, you use Config Sync to deploy an application. Note that most customers have their own preferred CI/CD tools for deploying applications. GKE Config Sync is recommended and commonly used for GitOps-driven configuration management for Kubernetes resources. In the following tasks, you will learn how to use Config Sync to deploy Kubernetes resources and policies.

1. Deploy the Cymbal Bank application (it is called "Bank of Anthos" in the repository at the moment):

```
gcloud source repos clone acm-repo --project=qwiklabs-gcp-03-031318fc8126
gcloud storage cp -r gs://spls/gsp1241/acm-repo/ ~/secure-gke/
cd ~/secure-gke/acm-repo/
```



1. Push the code to the main branch:

```
git checkout -b main
git add .
git status
git commit -am "Cymbal Bank application deployment"
git push -u origin main
```



**Note:** It can take up to two minutes to create a namespace in a cluster. Please rerun the following service account commands if you get the *namespaces not found* error.

1. Create service accounts for namespaces in each cluster.

- For cluster `gke-cluster-1`:

```
gcloud container clusters get-credentials gke-cluster-1 --zone us-central1 --project qwiklabs-gcp-03-031318fc8126

kubectl create serviceaccount bank-of-anthos --namespace balance-reader
kubectl create serviceaccount bank-of-anthos --namespace contacts
kubectl create serviceaccount bank-of-anthos --namespace frontend
kubectl create serviceaccount bank-of-anthos --namespace ledger-writer
kubectl create serviceaccount bank-of-anthos --namespace transaction-history
kubectl create serviceaccount bank-of-anthos --namespace userservice
```



- For cluster `gke-cluster-2`:

```
gcloud container clusters get-credentials gke-cluster-2 --zone us-central1 --project qwiklabs-gcp-03-031318fc8126

kubectl create serviceaccount bank-of-anthos --namespace balance-reader
kubectl create serviceaccount bank-of-anthos --namespace contacts
kubectl create serviceaccount bank-of-anthos --namespace frontend
kubectl create serviceaccount bank-of-anthos --namespace ledger-writer
kubectl create serviceaccount bank-of-anthos --namespace transaction-history
kubectl create serviceaccount bank-of-anthos --namespace userservice
```



1. In the console, go to the Config Sync **Dashboard**.
2. Click the **Packages** tabbed page.

In the `root-sync` field, you should see **Sync status** and **Reconcile status** are `Synced` and `Current`.

**Note:** It can take up to 2-5 minutes to sync the status.

1. Access the application by browsing to the ASM ingressgateway external IP address:

```
export ASM_INGRESS_IP_CLUSTER_1=$(kubectl --context=gke-cluster-1 -n asm-gateways get svc asm-ingressgateway -ojsonpath='{.status.loadBalancer.ingress[].ip}')
echo -e "ASM_INGRESS_IP_CLUSTER_1 is ${ASM_INGRESS_IP_CLUSTER_1}"
export ASM_INGRESS_IP_CLUSTER_2=$(kubectl --context=gke-cluster-2 -n asm-gateways get svc asm-ingressgateway -ojsonpath='{.status.loadBalancer.ingress[].ip}')
echo -e "ASM_INGRESS_IP_CLUSTER_2 is ${ASM_INGRESS_IP_CLUSTER_2}"
```



1. Test each of these IPs in your web browser. You should see the login screen.

Now that Config Sync is synced to a repository, it continuously reconciles the state of your clusters with the configs in the repository.

Click **Check my progress** to verify the objective.

Deploy an app via Config Sync



## Congratulations!

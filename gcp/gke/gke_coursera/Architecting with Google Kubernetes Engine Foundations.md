[TOC]



# Architecting with Google Kubernetes Engine: Foundations



## Welcome to the Course

###  Welcome and Getting Started Guide

Welcome to **Architecting with Google Kubernetes Engine: Foundations!** This course teaches you the basics for getting started with Kubernetes and Google Kubernetes Engine.

**What is Kubernetes?**

Kubernetes is an orchestration framework for software containers. Containers are a way to package and run code that's more efficient than virtual machines. Kubernetes provides the tools you need to run containerized applications in production and at scale.

**What is Google Kubernetes Engine?**

Google Kubernetes Engine (GKE) is a managed service for Kubernetes.

**What to expect during this training course?**

During this training course, you will be presented with modules that will take you through skills you'll use as an architect or administrator of applications running in GKE. Each module contains video lectures, quizzes, and hands-on labs.

**In order to get the best training experience, please ensure that you are prepared:**

You should have a general familiarity with Google Cloud Platform; if you previously completed GCP Fundamentals: Core Infrastructure, you are well-positioned. You should also be comfortable working at the Linux command line and with a Linux text editor. You should be familiar with IT topics such as IP addresses, virtual machines, and web servers.

**What's Next?**

Watch the **Course Introduction** video lecture and then move onto the next lesson!

## Course Introduction

### Course Introduction Foundation

video

## How to use  Qwiklabs

### Getting Started with Google Cloud Platform and Qwiklabs

video



## Course Feedback

### How to Send Feedback


As you progress through this course, you may want to send us feedback about specific content. As a general rule, please send feedback directly in Coursera. Read the guide below on how to send feedback for each course content item.

**When Sending Feedback**

1. Please be precise -- tell us exactly what is wrong, and what we should consider to fix the problem.
2. If something is broken, or incorrect, we will prioritize these fixes first
3. Some feedback may not be actionable because of Coursera platform limitations. Even if this is the case, please file the feedback anyways.

**For Videos, Readings, Quizzes, and Exercises**

- Thumbs up: This means you think it's a good item
- Thumbs down: This means the item doesn't work or something is wrong
- Flag: This means that you need to report a problem – here is where you need to be precise and explain exactly what is wrong so we can quickly address the problem.

## Introduction

video



## Cloud Computing and Google Cloud

video

### Practice Quiz

**Cloud Computing and Google Cloud**

1. Which statements are true about cloud computing? Mark all that are true (2 correct answers).

   **A. Customers who need more resources can get them rapidly,**


   B. Cloud computing providers dedicate particular physical resources to particular customers.

   **C. Customers pay for the resources they use or reserve.**


   D. Human intervention is required to stop using cloud resources once reserved, and payment continues until the change is confirmed.

2. Which of these Google Cloud compute services provides environments for execution of code, in which users don't have to worry about infrastructure management? Choose all that are correct (2 correct answers).

   **A. Cloud Functions**


   B. Compute Engine


   C. Google Kubernetes Engine

   **D. App Engine**



## Resource Management

video



### Practice Quiz

**Resource Management**



1. Within which of these Google Cloud geographic scopes are network latencies generally less than 1 millisecond? Choose all that are correct (2 correct answers).

   A. Global

   B. Multi-Region

   **C. Region**

   **D. Zone**



2. What type of resource is a Compute Engine virtual machine?

   **A. Zonal**

   B. Global

   C. Multi-regional

   D. Regional

3. What is the base-level organizing entity for creating and using Google Cloud resources and services?

   **A. Project**

   B. Cluster

   C. Region

   D. Folder

## Billing

video

### Practice Quiz

**Billing**

1. At what level in the Google Cloud resource hierarchy is billing set up?

   A. Organization


   **B. Project**


   C. Individual users


   D. Folder

2. Which type of quota resets at regular intervals?

   **A. Rate quotas**


   B. Allocation quotas



## Interacting with Google Cloud

video



### Practice Quiz

**Interacting with Google Cloud**


1. Which of these ways to interact with  give you access to the gcloud and kubectl commands? Choose all that are correct (2 correct answers).

   A. GCP Console


   B. Cloud Console mobile app

   **C. Cloud Shell**

   **D. Cloud SDK**



### Computing Options
In a future module, you will learn more about Google Cloud's choices for organizing compute workloads. Here is a brief overview:

| Service name      | Description                                                  |
| :---------------- | :----------------------------------------------------------- |
| Kubernetes Engine | A managed environment for deploying containerized applications |
| Compute Engine    | A managed environment for deploying virtual machines         |
| App Engine        | A managed serverless platform for deploying applications     |
| Cloud Functions   | A managed serverless platform for deploying event-driven functions |

Kubernetes Engine is the focus of this specialization. You will learn more about all of these choices in a later module. If you would like more information in the meantime, see the Google Cloud documentation page [Choosing a Computing Option](https://cloud.google.com/docs/choosing-a-compute-option).



## Lab: Accessing the Google Cloud Console and Cloud Shell

### Lab Intro

Video



## Qwiklabs – Deploying Google Kubernetes Engine

### Graded External Tool: Qwiklabs - Accessing the Google Cloud Console and Cloud Shell

## Qwiklabs – Accessing the Google Cloud Console and Cloud Shell

In this lab, you become familiar with the GCP web-based interface. Two integrated environments are available:

- A GUI environment called the GCP Console
- A command-line interface called Cloud Shell, which has the commands from the Cloud SDK pre-installed

### Tips for Course Labs

Get the most out of Coursera and Qwiklabs by trying our tips below.

####  Avoid account confusion with private browsing

Close this page and log back in to Coursera in Incognito mode before moving on. When you return to this course and lab instructions page, click Open Tool to continue.

By using incognito mode, this ensures that you don't accidentally use your own Google account (including Gmail) while accessing the Google Cloud Console. This also prevents Qwiklabs from logging you out of your own Google accounts.

Detailed instructions for using Incognito mode in Google Chrome are available here. Depending on your browser, Incognito mode might also be called Private Browsing or InPrivate Browsing.

#### To ensure lab completion is marked in Coursera:

\1. Access each individual lab by clicking Open Tool in Coursera:

![img](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/l8-vyhLiEem6Gg6vVM6M8A_a7ef4cf7ffcf51e8d12ef38399979556_opentool.png?expiry=1604016000000&hmac=2aAdS5XjrAWyGEerKSyjqBtZc5FrArd2JQHRFzRL4Ns)

\2. Complete the lab in Qwiklabs.

\3. Click End Lab in Qwiklabs:

![img](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/oxh66BLiEem5_xLqNrIdUA_72c62c8a677260f359a73a18bb9395d3_endlab.jpg?expiry=1604016000000&hmac=ZtIpha4I2HT9g9xM7dKaLKh2h2ArYoo0xC0HBygnrq0)

\4. Close the Qwiklabs browser window or tab.

**Note:** You are limited to 3 attempts of this lab. If you need support, [submit a request](https://qwiklab.zendesk.com/hc/en-us/requests/new) to Qwiklabs Support

By opening the tool, you are agreeing to Qwiklabs' [Terms of Service](https://qwiklabs.com/terms_of_service).

------

This course uses a third-party tool, Qwiklabs – Accessing the Google Cloud Console and Cloud Shell, to enhance your learning experience. The tool will reference basic information like your name, email, and Coursera ID.

Honor Code Agreement

I, **Sherwin Owen Santiago Adriano**, understand that submitting work that isn’t my own may result in permanent failure of this course or deactivation of my Coursera account. Learn more about Coursera’s Honor Code

### Accessing the Google Cloud Console and Cloud Shell


#### Overview

In this lab, you become familiar with the Google Cloud web-based interface. Two integrated environments are available:

- A GUI environment called the Google Cloud Console
- A command-line interface called Cloud Shell, which has the commands from the Cloud SDK pre-installed

In this course, you use both environments.

You need to know a few things about the Google Cloud Console:

- The Google Cloud Console is under continuous development, so the graphical layout occasionally changes. Often, these changes are made to accommodate new Google Cloud features or changes in the technology, resulting in a slightly different workflow.
- You can perform most common Google Cloud actions in the Google Cloud Console. Sometimes new features are implemented in the Cloud SDK before they are made available in the Google Cloud Console.
- The Google Cloud Console is extremely fast for some activities. The Google Cloud Console can perform multiple actions on your behalf that might require many command-line actions.
- The commands in the Cloud SDK are valuable tools for automation.

#### Objectives

In this lab, you learn how to perform the following tasks:

- Learn how to access the Google Cloud Console and Cloud Shell
- Become familiar with the Google Cloud Console
- Become familiar with Cloud Shell features, including the Cloud Shell code editor
- Use the Google Cloud Console and Cloud Shell to create buckets and VMs and service accounts
- Perform other commands in Cloud Shell

#### Task 0. Lab Setup

##### Access Qwiklabs

For each lab, you get a new GCP project and set of resources for a fixed time at no cost.

1. Make sure you signed into Qwiklabs using an **incognito window**.
2. Note the lab's access time (for example, ![img/time.png](https://cdn.qwiklabs.com/aZQJ4BT7uCmM9XR6BTXgTRP1Hfu1T7q6V%2BcnbdEsbpU%3D) and make sure you can finish in that time block.

There is no pause feature. You can restart if needed, but you have to start at the beginning.

1. When ready, click ![img/start_lab.png](https://cdn.qwiklabs.com/XE8x7uvQokyubNwnYKKc%2BvBBNrMlo5iNZiDDzQQ3Ddo%3D).
2. Note your lab credentials. You will use them to sign in to Cloud Platform Console. ![img/open_google_console.png](https://cdn.qwiklabs.com/0d78dhX6IVMVWmixCPPSBbmi5O2GPokCXf1Ps1AkTgI%3D)
3. Click **Open Google Console**.
4. Click **Use another account** and copy/paste credentials for **this** lab into the prompts.

If you use other credentials, you'll get errors or **incur charges**.

1. Accept the terms and skip the recovery resource page.

Do not click **End Lab** unless you are finished with the lab or want to restart it. This clears your work and removes the project.

After you complete the initial sign-in steps, the project dashboard appears.

![Google Cloud Project Dashboard](https://cdn.qwiklabs.com/dxfeoOcn1ObyC0BYyoqqqSi4rO%2FeMdbWPFjoK6C0YYk%3D)

#### Task 1. Explore the Google Cloud Console

In this task, you explore the Google Cloud Console and create resources.

##### **Verify that your project is selected**

1. In the **Select a project** drop-down list in the title bar select the project ID that Qwiklabs provided with your authentication credentials.

The project ID will resemble **qwiklabs-Google Cloud-** followed by a long hexadecimal number.

1. Click **Cancel** to close the dialog.

Your title bar should indicate the project ID as shown in the screenshot. Each lab in the Qwiklabs environment has a unique project ID, as well as unique authentication credentials.

##### ![Google Cloud project ID](https://cdn.qwiklabs.com/iCYXT8odpgThHsfFOJLbKM4vcZvRyI0ITo7FMuoiZNA%3D)

##### **Navigate to Google Cloud Storage and create a bucket**

Cloud Storage allows world-wide storage and retrieval of any amount of data at any time. You can use Cloud Storage for a range of scenarios including serving website content, storing data for archival and disaster recovery, or distributing large data objects to users via direct download.

Cloud Storage buckets must have a globally unique name. In your organization, you should follow Google Cloud's [recommended best practices for naming buckets](https://cloud.google.com/storage/docs/best-practices). For this lab, we can easily get a unique name for our bucket by using the ID of the Google Cloud project that Qwiklabs created for us, because Google Cloud project IDs are also globally unique.

1. In the Google Cloud Console, on the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Home** .
2. In the **Dashboard** tab of the resulting screen, the **Project info** section shows your Google Cloud project ID. Select and copy the project ID. Because this project ID was created for you by Qwiklabs, it will resemble **qwiklabs-Google Cloud-** followed by a long hexadecimal number.
3. In the Google Cloud Console, on the **Navigation menu** (![Navigationmenu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Storage** > **Browser**.
4. Click **Create bucket**.
5. For **Name**, paste in the Google Cloud project ID string you copied in an earlier step. Leave all other values as their defaults.

These lab instructions will later refer to the name that you typed as [BUCKET_NAME].

1. Click **Create**.

The Google Cloud Console has a **Notifications** (![notifications icon](https://cdn.qwiklabs.com/F5kQGlErW%2BjJRPG8ZwXMUKHhAaugHazVETpa1WSg8aM%3D)) icon. Feedback from the underlying commands is sometimes provided there. You can click the icon to check the notifications for additional information and history.

#### Create a virtual machine (VM) instance

Google Compute Engine offers virtual machines running in Google's datacenters and on its network as a service. Google Kubernetes Engine makes use of Compute Engine as a component of its architecture. For this reason, it's helpful to learn a bit about Compute Engine before learning about Kubernetes Engine.

1. On the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D) ), click **Compute Engine** > **VM instances**.
2. Click **Create Instance**.
3. For **Name**, type `first-vm` as the name for your instance.
4. For **Region**, select **us-central1**.
5. For **Zone**, select **us-central1-c**.
6. For **Machine type**, examine the options.

The **Machine type:** menu lists the number of virtual CPUs, the amount of memory, and a symbolic name such as *n1-standard-1*. The symbolic name is the parameter you use to select the machine type when using the `gcloud` command to create a VM. To the right of the region, zone, and machine type is a per-month estimated cost.

1. To see the breakdown of estimated costs, click **Details** to the right of the **Machine type** list underneath the estimated costs.
2. For **Machine type**, click **2 vCPUs (n1-standard-2)**.

How did the cost change?

1. For **Machine type,** click **f1-micro (1 shared vCPU)**.

The micro type is a shared-core VM that is inexpensive.

1. For **Firewall**, click **Allow HTTP traffic**.
2. Leave the remaining settings as their defaults, and click **Create**.

Wait until the new VM is created.

##### **Explore the VM details**

1. On the **VM instances** page, click the name of your VM, `first-vm`.
2. Locate **CPU platform**, notice the value, and click **Edit**.

You can't change the machine type, the CPU platform, or the zone of a running Google Cloud VM. You can add network tags and allow specific network traffic from the internet through firewalls.

Some properties of a VM are integral to the VM and are established when the VM is created. They cannot be changed. Other properties can be edited. For example, you can add disks, and you can determine whether the boot disk is deleted when the instance is deleted.

1. Scroll down and examine **Availability policies**.

Compute Engine offers preemptible VM instances, which cost less per hour but can be terminated by Google Cloud at any time. These preemptible instances can save you a lot of money, but you must make sure that your workloads are suitable to be interrupted. You can't convert a non-preemptible instance into a preemptible one. This choice must be made at VM creation.

If a VM is stopped for any reason (for example, an outage or a hardware failure), the automatic restart feature starts it back up. Is this the behavior you want? Are your applications idempotent (written to handle a second startup properly)?

During host maintenance, the VM is set for live migration. However, you can have the VM terminated instead of migrated.

If you make changes, they can sometimes take several minutes to be implemented, especially if they involve networking changes, like adding firewalls or changing the external IP.

1. Click **Cancel**.

##### **Create an IAM service account**

An IAM service account is a special type of Google account that belongs to an application or a virtual machine, instead of to an individual end user.

1. On the **Navigation menu**, click **IAM & admin** > **Service accounts**.
2. Click **+ Create service account**.
3. On the **Service account details** page, specify the **Service account name** as `test-service-account`.
4. Click **Create**.
5. On the **Service account permissions** page, specify the role as **Project** > **Editor**.
6. Click **Continue**.
7. Click **Done**.
8. On the **Service accounts** page, move to the extreme right of the `test-service-account` and click on the three dots.
9. Click **Create Key**.
10. Select **JSON** as the key type.
11. Click **Create**.

A JSON key file is downloaded. In a later step, you find this key file and upload it to the VM.

1. Click **Close**.

Click *Check my progress* to verify the objective.

Create a bucket, VM instance with necessary firewall rule and an IAM service account.

Check my progress



#### Task 2. Explore Cloud Shell

Cloud Shell provides you with command-line access to your cloud resources directly from your browser. With Cloud Shell, Cloud SDK command-line tools such as gcloud are always available, up to date, and fully authenticated.

Cloud Shell provides the following features and capabilities:

- Temporary Compute Engine VM
- Command-line access to the instance through a browser
- 5 GB of persistent disk storage (`$HOME dir`)
- Preinstalled Cloud SDK and other tools
- `gcloud`: for working with Compute Engine, Google Kubernetes Engine (GKE) and many Google Cloud services
- `gsutil`: for working with Cloud Storage
- `kubectl`: for working with GKE and Kubernetes
- `bq`: for working with BigQuery
- Language support for Java, Go, Python, Node.js, PHP, and Ruby
- Web preview functionality
- Built-in authorization for access to resources and instances

After 1 hour of inactivity, the Cloud Shell instance is recycled. Only the `/home` directory persists. Any changes made to the system configuration, including environment variables, are lost between sessions.

In this task, you use Cloud Shell to create and examine some resources.

##### **Open Cloud Shell and explore its features**

1. On the Google Cloud Console title bar, click **Activate Cloud Shell** (![e92fcd01cbb5e0ff.png](https://cdn.qwiklabs.com/G2OU7QatKvkGgxCZRcv3IFJd8GvwHIJz6JhAtOMT5cg%3D)).
2. When prompted, click **Continue**.

Cloud Shell opens at the bottom of the Google Cloud Console window.

The following icons are on the far right of Cloud Shell toolbar:

- **Hide/Restore:** This icon hides and restores the window, giving you full access to the Google Cloud Console without closing Cloud Shell.
- **Open in new window:** Having Cloud Shell at the bottom of the Google Cloud Console is useful when you are issuing individual commands. But when you edit files or want to see the full output of a command, clicking this icon displays Cloud Shell in a full-sized terminal window.
- **Close all tabs:** This icon closes Cloud Shell. Everytime you close Cloud Shell, the virtual machine is recycled and all machine context is lost. However, data that you stored in your home directory is still available to you the next time you start Cloud Shell.

##### **Use Cloud Shell to set up the environment variables for this task**

In Cloud Shell, use the following commands to define the environment variables used in this task.

1. Replace [BUCKET_NAME] with the name of the first bucket from task 1.
2. Replace [BUCKET_NAME_2] with a globally unique name.

You can append a 2 to the globally unique bucket name that you used previously.

```
MY_BUCKET_NAME_1=[BUCKET_NAME]
MY_BUCKET_NAME_2=[BUCKET_NAME_2]
MY_REGION=us-central1
content_copy
```

When you are working in the Cloud Shell or writing scripts, creating environment variables is a good practice. You can easily and consistently re-use these environment variables, which makes your work less error-prone.

Make sure you replace the full placeholder string, such as `[BUCKET_NAME]`with the unique name that you choose, for example `MY_BUCKET_NAME_1=unique_bucket_name.`

##### **Move the credentials file you created earlier into Cloud Shell**

You downloaded a JSON-encoded credentials file in an earlier task when you created your first Cloud IAM service account.

1. On your local workstation, locate the JSON key that you just downloaded and rename the file to `credentials.json`.
2. In Cloud Shell, click the three dots ( ![Three-dot menu icon](https://cdn.qwiklabs.com/5OEwfJEfsSg8zDSsYjmqhsK7fRiAcDrW50FJ0Axw%2Fk8%3D)) icon in the Cloud Shell toolbar to display further options.
3. Click **Upload file** and upload the `credentials.json` file from your local machine to the Cloud Shell VM.
4. Click the **X** icon to close the file upload pop-up window.
5. In Cloud Shell, type **ls** and press ENTER to confirm that the file was uploaded.

##### **Create a second Cloud Storage bucket and verify it in the Google Cloud Console**

The `gsutil` command, which is supplied by the Cloud SDK, lets you work with Cloud Storage from the command line. In this task, you use the `gsutil` command in Cloud Shell.

1. In Cloud Shell, use the `gsutil` command to create a bucket.

```
gsutil mb gs://$MY_BUCKET_NAME_2
content_copy
```

1. In the Google Cloud Console, on the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Storage** > **Browser**, or click **Refresh** if you are already in the Storage Browser.

The second bucket should appear in the **Buckets** list.

##### **Use the gcloud command line to create a second virtual machine**

1. In Cloud Shell, execute the following command to list all the zones in a given region:

```
gcloud compute zones list | grep $MY_REGION
content_copy
```

1. Select a zone from the first column of the list. Notice that Google Cloud zones' names consist of their region name, followed by a hyphen and a letter.

You may choose a zone that is the same as or different from the zone that you used for the first VM in task 1.

1. Execute the following command to store your chosen zone in an environment variable.

You replace `[ZONE]` with your selected zone.

```
MY_ZONE=[ZONE]
content_copy
```

1. Set this zone to be your default zone by executing the following command.

```
gcloud config set compute/zone $MY_ZONE
content_copy
```

1. Execute the following command to store a name in an environment variable you will use to create a VM. You will call your second VM `second-vm`.

```
MY_VMNAME=second-vm
content_copy
```

1. Create a VM in the default zone that you set earlier in this task using the new environment variable to assign the VM name.

```
gcloud compute instances create $MY_VMNAME \
--machine-type "n1-standard-1" \
--image-project "debian-cloud" \
--image-family "debian-9" \
--subnet "default"
content_copy
```

1. List the virtual machine instances in your project.

```
gcloud compute instances list
content_copy
```

You will see both your newly created and your first virtual machine in the list.

1. In the Google Cloud Console, on the **Navigation menu** ( ![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Compute Engine** > **VM Instances**. Just as in the output of `gcloud compute instances list`, you will see both of the virtual machines you created.
2. Look at the `External IP` column. Notice that the external IP address of the first VM you created is shown as a link. (If necessary, click the `HIDE INFO PANEL` button to reveal the `External IP` column.) The Google Cloud Console offers the link because you configured this VM's firewall to allow HTTP traffic.
3. Click the link you found in your VM's `External IP` column. Your browser will present a `Connection refused` message in a new browser tab. This message occurs because, although there is a firewall port open for HTTP traffic to your VM, no Web server is running there. Close the browser tab you just created.

##### **Use the gcloud command line to create a second service account**

1. In Cloud Shell, execute the following command to create a new service account:

```
gcloud iam service-accounts create test-service-account2 --display-name "test-service-account2"
content_copy
```

If you see the following output, type **y** and press **ENTER**:

**Output (do not copy)**

```
API [iam.googleapis.com] not enabled on project [560255523887]. Would
you like to enable and retry (this will take a few minutes)? (y/N)?
content_copy
```

1. In the Google Cloud Console, on the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **IAM & admin** > **Service accounts**.

Refresh the page till you see **test-service-account2**.

Click *Check my progress* to verify the objective.

Create a second bucket, VM instance and an IAM service account.

Check my progress



1. In Cloud Shell, execute the following command to grant the second service account the Project viewer role:

```
gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT --member serviceAccount:test-service-account2@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com --role roles/viewer
content_copy
```

`GOOGLE_CLOUD_PROJECT` is an environment variable that is automatically populated in Cloud Shell and is set to the project ID of the current context.

1. In the Google Cloud Console, on the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **IAM & admin** > **IAM**. Select the new service account called **test-service-account2**.
2. On the right hand side of the page, click on pencil icon and expand the Viewer role.

You will see **test-service-account2** listed as a member of the Viewer role.

#### Task 3. Work with Cloud Storage in Cloud Shell

##### **Download a file to Cloud Shell and copy it to Cloud Storage**

1. Copy a picture of a cat from a Google-provided Cloud Storage bucket to your Cloud Shell.

```
gsutil cp gs://cloud-training/ak8s/cat.jpg cat.jpg
content_copy
```

1. Copy the file into one of the buckets that you created earlier.

```
gsutil cp cat.jpg gs://$MY_BUCKET_NAME_1
content_copy
```

1. Copy the file from the first bucket into the second bucket:

```
gsutil cp gs://$MY_BUCKET_NAME_1/cat.jpg gs://$MY_BUCKET_NAME_2/cat.jpg
content_copy
```

1. In the Google Cloud Console, on the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Storage** > **Browser**, select the buckets that you created, and verify that both contain the `cat.jpg` file.

##### **Set the access control list for a Cloud Storage object**

1. To get the default access list that's been assigned to `cat.jpg` (when you uploaded it to your Cloud Storage bucket), execute the following two commands:

```
gsutil acl get gs://$MY_BUCKET_NAME_1/cat.jpg  > acl.txt
cat acl.txt
content_copy
```

The output should look like the following example, but with different numbers. This output shows that anyone with a Project Owner, Editor, or Viewer role for the project has access (Owner access for Owners/Editors and Reader access for Viewers).

**Output (do not copy)**

```
[
  {
    "entity": "project-owners-560255523887",
    "projectTeam": {
      "projectNumber": "560255523887",
      "team": "owners"
    },
gsutil cp gs://cloud-training/ak8s/cat.jpg cat.jpg    "role": "OWNER"
  },
  {
    "entity": "project-editors-560255523887",
    "projectTeam": {
      "projectNumber": "560255523887",
      "team": "editors"
    },
    "role": "OWNER"
  },
  {
    "entity": "project-viewers-560255523887",
    "projectTeam": {
      "projectNumber": "560255523887",
      "team": "viewers"
    },
    "role": "READER"
  },
  {
    "email": "google12345678_student@qwiklabs.net",
    "entity": "user-google12345678_student@qwiklabs.net",
    "role": "OWNER"
  }
]
content_copy
```

1. To change the object to have private access, execute the following command:

```
gsutil acl set private gs://$MY_BUCKET_NAME_1/cat.jpg
content_copy
```

1. To verify the new ACL that's been assigned to `cat.jpg`, execute the following two commands:

```
gsutil acl get gs://$MY_BUCKET_NAME_1/cat.jpg  > acl-2.txt
cat acl-2.txt
content_copy
```

The output should look similar to the following example. Now only the original creator of the object (your lab account) has Owner access.

**Output (do not copy)**

```
[
  {
    "email": "google12345678_student@qwiklabs.net",
    "entity": "user-google12345678_student@qwiklabs.net",
    "role": "OWNER"
  }
]
content_copy
```

##### **Authenticate as a service account in Cloud Shell**

1. In Cloud Shell, execute the following command to view the current configuration:

```
gcloud config list
content_copy
```

You should see output that looks like the following example. In your output, the zone should be equal to the zone that you set when you created your second VM in task 2. The account and project should match your Qwiklabs lab credentials.

**Output (do not copy)**

```
[component_manager]
disable_update_check = True
[compute]
gce_metadata_read_timeout_sec = 5
zone = us-central1-a
[core]
account = google12345678_student@qwiklabs.net
disable_usage_reporting = False
project = qwiklabs-Google Cloud-1aeffbc5d0acb416
[metrics]
environment = devshell

Your active configuration is: [cloudshell-16441]
content_copy
```

1. In Cloud Shell, execute the following command to change the authenticated user to the first service account (which you created in an earlier task) through the credentials that you downloaded to your local machine and then uploaded into Cloud Shell (`credentials.json`).

```
gcloud auth activate-service-account --key-file credentials.json
content_copy
```

Cloud Shell is now authenticated as `test-service-account`.

1. To verify the active account, execute the following command:

```
gcloud config list
content_copy
```

You should see output that looks like the following example. The account is now set to the `test-service-account` service account.

**Output (do not copy)**

```
[component_manager]
disable_update_check = True
[compute]
gce_metadata_read_timeout_sec = 5
zone = us-central1-a
[core]
account = test-service-account@qwiklabs-Google Cloud-1aeffbc5d0acb416.iam.gserviceaccount.com
disable_usage_reporting = False
project = qwiklabs-Google Cloud-1aeffbc5d0acb416
[metrics]
environment = devshell

Your active configuration is: [cloudshell-16441]
content_copy
```

1. To verify the list of authorized accounts in Cloud Shell, execute the following command:

```
gcloud auth list
content_copy
```

You should see output that looks like the following example.

**Output (do not copy)**

```
                Credentialed Accounts
ACTIVE  ACCOUNT
        google12345678_student@qwiklabs.net
*       test-service-account@qwiklabs-Google Cloud-1aeffbc5d0acb416.iam.gserviceaccount.com

To set the active account, run:
    $ gcloud config set account `ACCOUNT`
content_copy
```

1. To verify that the current account (`test-service-account`) cannot access the `cat.jpg` file in the first bucket that you created, execute the following command:

```
gsutil cp gs://$MY_BUCKET_NAME_1/cat.jpg ./cat-copy.jpg
content_copy
```

Because you restricted access to this file to the owner earlier in this task you should see output that looks like the following example.

**Output (do not copy)**

```
Copying gs://test-bucket-123/cat.jpg...
AccessDeniedException: 403  KiB]
content_copy
```

1. Verify that the current account (`test-service-account`) can access the `cat.jpg` file in the second bucket that you created:

```
gsutil cp gs://$MY_BUCKET_NAME_2/cat.jpg ./cat-copy.jpg
content_copy
```

Because access has not been restricted to this file you should see output that looks like the following example.

**Output (do not copy)**

```
Copying gs://test-bucket-123/cat.jpg...
- [1 files][ 81.7 KiB/ 81.7 KiB]
Operation completed over 1 objects/81.7 KiB.
content_copy
```

1. To switch to the lab account, execute the following command.

You replace `[USERNAME]` with the username provided in the Qwiklabs Connection Details pane on the left of the lab instructions page. .

```
gcloud config set account [USERNAME]
content_copy
```

1. To verify that you can access the `cat.jpg` file in the [BUCKET_NAME] bucket (the first bucket that you created), execute the following command.

```
gsutil cp gs://$MY_BUCKET_NAME_1/cat.jpg ./copy2-of-cat.jpg
content_copy
```

You should see output that looks like the following example. The lab account created the bucket and object and remained an Owner when the object access control list (ACL) was converted to private, so the lab account can still access the object.

**Output (do not copy)**

```
Copying gs://test-bucket-123/cat.jpg...
- [1 files][ 81.7 KiB/ 81.7 KiB]
Operation completed over 1 objects/81.7 KiB.
content_copy
```

1. Make the first Cloud Storage bucket readable by everyone, including unauthenticated users.

```
gsutil iam ch allUsers:objectViewer gs://$MY_BUCKET_NAME_1
content_copy
```

This is an appropriate setting for hosting public website content in Cloud Storage.

1. In the Google Cloud Console, on the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Storage** > **Browser**, select the first storage bucket that you created. Notice that the `cat.jpg` file has a `Public link`. Copy this link.
2. Open an incognito browser tab and paste the link into its address bar. You will see a picture of a cat. Leave this browser tab open.

Click *Check my progress* to verify the objective.

Work with the Cloud Storage in Cloud Shell.

Check my progress



#### Task 4. Explore the Cloud Shell code editor

In this task, you explore using the Cloud Shell code editor.

##### **Open the Cloud Shell code editor**

1. In Cloud Shell, click the Open in new window icon on the top right. Then click the pencil icon to open the Cloud Shell code editor.

![Cloud Shell Code Editor icon](https://cdn.qwiklabs.com/%2F0PU9XwgGWyf%2B%2Buf9AiL%2BMqc9SUkbRf1CiEB4fBZl58%3D)

A new tab opens with the Cloud Shell Code editor and the Cloud Shell. The Google Cloud console remains on the original tab. You can switch between the Google Cloud Console and Cloud Shell by clicking the tab.

1. In Cloud Shell, execute the following command to clone a `git` repository:

```
git clone https://github.com/googlecodelabs/orchestrate-with-kubernetes.git
content_copy
```

The `orchestrate-with-kubernetes` folder appears in the left pane of the Cloud Shell code editor window.

![File-refresh menu](https://cdn.qwiklabs.com/hXTJ%2FlDdOW3SJRq3kXQwYCOpqRpGu3cmDUi3PDqTp5w%3D)

1. In Cloud Shell, execute the following command to create a test directory:

```
mkdir test
content_copy
```

The `test` folder now appears in the left pane of the Cloud Shell code editor window.

![test-folder-revealed](https://cdn.qwiklabs.com/fIQEgM2apf0RdT0NaGMykEFUnHIOOf0tg0%2BXROt38b4%3D)

1. In the Cloud Shell code editor, click the arrow to the left of `orchestrate-with-kubernetes` to expand the folder.

![expand-folder](https://cdn.qwiklabs.com/sFNhGK6RcH66%2FcbULKE%2Bw2W%2B4CeoAFTFQPWe3M%2F0KeI%3D)

1. Click the `cleanup.sh` file to open it in the right pane of the Cloud Shell code editor window.

![cleanup](https://cdn.qwiklabs.com/nze4h0R82UGn%2F%2FT%2B9TeGdPHSJbbfHebBnnFvZ39itwc%3D)

1. Add the following text as the last line of the `cleanup.sh` file:

```
echo Finished cleanup!
content_copy
```

No action is necessary to save your work.

1. In Cloud Shell, execute the following commands to change directory and display the contents of `cleanup.sh`:

```
cd orchestrate-with-kubernetes
cat cleanup.sh
content_copy
```

1. Verify that the output of `cat cleanup.sh` includes the line of text that you added.
2. In the Cloud Shell code editor, click to open the `File` menu and choose `New File`. Name the file `index.html`.
3. In the right hand pane, paste in this HTML text:

```
<html><head><title>Cat</title></head>
<body>
<h1>Cat</h1>
<img src="REPLACE_WITH_CAT_URL">
</body></html>
content_copy
```

Use your local computer's keyboard shortcut to paste: `Cmd-V` for a Mac, `Ctrl-V` for a Windows or Linux machine.

1. Replace the string `REPLACE_WITH_CAT_URL` with the URL of the cat image from an earlier task. The URL will look like this:

**Example (do not copy)**

```
https://storage.googleapis.com/qwiklabs-Google Cloud-1aeffbc5d0acb416/cat.jpg
content_copy
```

1. On the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D) ), click **Compute Engine** > **VM instances**.
2. In the row for your first VM, click the `SSH` button.
3. In the SSH login window that opens on your VM, install the `nginx` Web server:

```
sudo apt-get update
sudo apt-get install nginx
content_copy
```

It may take few minutes to complete the process.

1. In your Cloud Shell window, copy the HTML file you created using the Code Editor to your virtual machine:

```
gcloud compute scp index.html first-vm:index.nginx-debian.html --zone=us-central1-c
content_copy
```

If you are prompted whether to add a host key to your list of known hosts, answer **y**.

If you are prompted to enter a passphrase, press the **Enter** key to respond with an empty passphrase. Press the **Enter** key again when prompted to confirm the empty passphrase.

1. In the **SSH** login window for your VM, copy the HTML file from your home directory to the document root of the `nginx` Web server:

```
sudo cp index.nginx-debian.html /var/www/html
content_copy
```

Click *Check my progress* to verify the objective.

Install the nginx Web server and customize the welcome page.

Check my progress



1. On the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D) ), click **Compute Engine** > **VM instances**. Click the link in the `External IP` column for your first VM. A new browser tab opens, containing a Web page that contains the cat image.

#### End your lab

When you have completed your lab, click **End Lab**. Qwiklabs removes the resources you’ve used and cleans the account for you.

You will be given an opportunity to rate the lab experience. Select the applicable number of stars, type a comment, and then click **Submit**.

The number of stars indicates the following:

- 1 star = Very dissatisfied
- 2 stars = Dissatisfied
- 3 stars = Neutral
- 4 stars = Satisfied
- 5 stars = Very satisfied

You can close the dialog box if you don't want to provide feedback.

For feedback, suggestions, or corrections, please use the **Support** tab.

Copyright 2020 Google LLC All rights reserved. Google and the Google logo are trademarks of Google LLC. All other company and product names may be trademarks of the respective companies with which they are associated.







### Quiz

#### Introduction to Google Cloud

1. You are considering deploying a solution using containers on Google Cloud. What Google Cloud solutions are available to you that will provide a managed compute platform with native support for containers?

   A. Container Registry

   **B. Google Kubernetes Engine Clusters**

   C. Cloud Functions

   D. Compute Engine Autoscaling Groups

2. You are ready to start work building an application in Google Cloud. What Cloud IAM hierarchy should you implement for this project?

   **A. Create a new folder inside your organization and create projects inside that folder for the resources.**

   B. Create new projects and resources inside departmental folders for the resources needed by the component applications.

   C. Create new projects for each of the component applications and create folders inside those for the resources.

   D. Create a new organization for the project and create all projects and resources inside the new organization.

3. You are developing a new product for a customer and need to implement control structures in Google Cloud to help manage the Google Cloud resources consumed by the product and the billing for the customer account. What steps should you take to manage costs for this product and customer?

   **A. Configure the billing account at the product folder level in the resource hierarchy.**

   B. Confgure the billing account for each project associated with the product.

   C. Configure quotas and limits for the product folders.

   D. Set up budgets and alerts at the project folder level for the product.

4. You need to write some automated scripts to run periodic updates to the resources in your Google Cloud environment. What tools can you install in your own computers to allow you to run those scripts?

   A. The Google Cloud Console

   **B. The Cloud SDK**

   C. The Cloud Console Mobile app

   D. The Cloud Shell

5. One of the key characteristics of cloud computing is the concept of measured service. What is the primary customer benefit of the measured service aspect of cloud computing?

   **A. You pay only for the resources you consume.**

   B. You share resources from a large pool enabling economies of scale.

   C. Resources can be allocated automatically.

   D. You can get more resources as quickly as you need them.



## Container and Container images



### Introduction to Containers

Video

### Quiz Introduction to Containers

1. Which of these problems are containers intended to solve? Mark all that are correct (3 correct answers),

   A. **It's difficult to troubleshoot applications when they work on a developer's laptop but fail in production.**

   B. **Applications need a way to isolate their dependencies from one another.**

   C. Some developers need parts of their applications to be Linux-based while other parts are Windows-based.

   D. **Packaging applications in virtual machines can be wasteful.**



### Containers and Container Images

video

### Quiz: Containers and Container Images
1. Why do Linux containers use union file systems?

   **A. To efficiently encapsulate applications and their dependencies into a set of clean, minimal layers**


   B. To give a container its own virtual memory address space


   C. To control what an application's ability to see parts of the directory tree and IP addresses


   D. To control an application's maximum consumption of CPU time and memory



2. What is significant about the topmost layer in a container? Choose all that are true (2 correct answers).

   A. Reading from or writing to the topmost layer requires special privileges.

   **B. An application running in a container can only modify the topmost layer.**

   **C. The topmost layer's contents are lost when the container is no longer running.**

   D. Reading from or writing to the topmost layer requires special software libraries.



## Lab: Working with Cloud Build

### Lab Intro

video

### Graded External Tool : Qwikslabs - Working with Cloud Build



#### Working with Cloud Build


#### Overview

In this lab you will build a Docker container image from provided code and a Dockerfile using Cloud Build. You will then upload the container to Container Registry.

#### Objectives

In this lab, you learn how to perform the following tasks:

- Use Cloud Build to build and push containers
- Use Container Registry to store and deploy containers

#### Task 0. Lab Setup

##### **Access Qwiklabs**

For each lab, you get a new GCP project and set of resources for a fixed time at no cost.

1. Make sure you signed into Qwiklabs using an **incognito window**.
2. Note the lab's access time (for example, ![img/time.png](https://cdn.qwiklabs.com/aZQJ4BT7uCmM9XR6BTXgTRP1Hfu1T7q6V%2BcnbdEsbpU%3D) and make sure you can finish in that time block.

There is no pause feature. You can restart if needed, but you have to start at the beginning.

1. When ready, click ![img/start_lab.png](https://cdn.qwiklabs.com/XE8x7uvQokyubNwnYKKc%2BvBBNrMlo5iNZiDDzQQ3Ddo%3D).
2. Note your lab credentials. You will use them to sign in to Cloud Platform Console. ![img/open_google_console.png](https://cdn.qwiklabs.com/0d78dhX6IVMVWmixCPPSBbmi5O2GPokCXf1Ps1AkTgI%3D)
3. Click **Open Google Console**.
4. Click **Use another account** and copy/paste credentials for **this** lab into the prompts.

If you use other credentials, you'll get errors or **incur charges**.

1. Accept the terms and skip the recovery resource page.

Do not click **End Lab** unless you are finished with the lab or want to restart it. This clears your work and removes the project.

After you complete the initial sign-in steps, the project dashboard appears.

![c679b27aa332f22d.png](https://cdn.qwiklabs.com/dxfeoOcn1ObyC0BYyoqqqSi4rO%2FeMdbWPFjoK6C0YYk%3D)

#### Task 1: Confirm that needed APIs are enabled

1. Make a note of the name of your Google Cloud project. This value is shown in the top bar of the Google Cloud Console. It will be of the form `qwiklabs-gcp-` followed by hexadecimal numbers.
2. In the Google Cloud Console, on the **Navigation menu**(![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **APIs & Services**.
3. Click **Enable APIs and Services**.
4. In the **Search for APIs & Services** box, enter `Cloud Build`.
5. In the resulting card for the Cloud Build API, if you do not see a message confirming that the Cloud Build API is enabled, click the `ENABLE` button.
6. Use the Back button to return to the previous screen with a search box. In the search box, enter `Container Registry`.
7. In the resulting card for the Container Registry API, if you do not see a message confirming that the Container Registry API is enabled, click the `ENABLE` button.

#### Task 2. Building Containers with DockerFile and Cloud Build

You can write build configuration files to provide instructions to Cloud Build as to which tasks to perform when building a container. These build files can fetch dependencies, run unit tests, analyses and more. In this task, you'll create a DockerFile and use it as a build configuration script with Cloud Build. You will also create a simple shell script (quickstart.sh) which will represent an application inside the container.

1. On the Google Cloud Console title bar, click **Activate Cloud Shell**.
2. When prompted, click **Continue**.

Cloud Shell opens at the bottom of the Google Cloud Console window.

1. Create an empty `quickstart.sh` file using the nano text editor.

```
nano quickstart.sh
content_copy
```

1. Add the following lines in to the `quickstart.sh` file:

```
#!/bin/sh
echo "Hello, world! The time is $(date)."
content_copy
```

1. Save the file and close nano by pressing the **CTRL+X** key, then press **Y** and **Enter**.
2. Create an empty `Dockerfile` file using the nano text editor.

```
nano Dockerfile
content_copy
```

1. Add the following Dockerfile command:

```
FROM alpine
content_copy
```

This instructs the build to use the Alpine Linux base image.

1. Add the following Dockerfile command to the end of the Dockerfile:

```
COPY quickstart.sh /
content_copy
```

This adds the `quickstart.sh` script to the / directory in the image.

1. Add the following Dockerfile command to the end of the Dockerfile:

```
CMD ["/quickstart.sh"]
content_copy
```

This configures the image to execute the `/quickstart.sh` script when the associated container is created and run.

The Dockerfile should now look like:

```
FROM alpine
COPY quickstart.sh /
CMD ["/quickstart.sh"]
content_copy
```

1. Save the file and close nano by pressing the **CTRL+X** key, then press **Y** and **Enter**.
2. In Cloud Shell, run the following command to make the `quickstart.sh` script executable.

```
chmod +x quickstart.sh
content_copy
```

1. In Cloud Shell, run the following command to build the Docker container image in Cloud Build.

```
gcloud builds submit --tag gcr.io/${GOOGLE_CLOUD_PROJECT}/quickstart-image .
content_copy
```

**Important**

Don't miss the dot (".") at the end of the command. The dot specifies that the source code is in the current working directory at build time.

When the build completes, your Docker image is built and pushed to Container Registry.

1. In the Google Cloud Console, on the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Container Registry** > **Images**.

![5ea63873c5756db4.png](https://cdn.qwiklabs.com/Qj7SNdo1E4nLPdSjRNkyhEiFDD7wDpfrFR%2BXqJ75GGY%3D)

The `quickstart-image` Docker image appears in the list

#### Task 3. Building Containers with a build configuration file and Cloud Build

Cloud Build also supports custom build configuration files. In this task you will incorporate an existing Docker container using a custom YAML-formatted build file with Cloud Build.

1. In Cloud Shell enter the following command to clone the repository to the lab Cloud Shell.

```
git clone https://github.com/GoogleCloudPlatform/training-data-analyst
content_copy
```

1. Create a soft link as a shortcut to the working directory.

```
ln -s ~/training-data-analyst/courses/ak8s/v1.1 ~/ak8s
content_copy
```

1. Change to the directory that contains the sample files for this lab.

```
cd ~/ak8s/Cloud_Build/a
content_copy
```

A sample custom cloud build configuration file called `cloudbuild.yaml` has been provided for you in this directory as well as copies of the `Dockerfile` and the `quickstart.sh` script you created in the first task.

1. In Cloud Shell, execute the following command to view the contents of `cloudbuild.yaml`.

```
cat cloudbuild.yaml
content_copy
```

You will see the following:

```
steps:
- name: 'gcr.io/cloud-builders/docker'
  args: [ 'build', '-t', 'gcr.io/$PROJECT_ID/quickstart-image', '.' ]
images:
- 'gcr.io/$PROJECT_ID/quickstart-image'
content_copy
```

This file instructs Cloud Build to use Docker to build an image using the Dockerfile specification in the current local directory, tag it with `gcr.io/$PROJECT_ID/quickstart-image` (`$PROJECT_ID` is a substitution variable automatically populated by Cloud Build with the project ID of the associated project) and then push that image to Container Registry.

1. In Cloud Shell, execute the following command to start a Cloud Build using `cloudbuild.yaml` as the build configuration file:

```
gcloud builds submit --config cloudbuild.yaml .
content_copy
```

The build output to Cloud Shell should be the same as before. When the build completes, a new version of the same image is pushed to Container Registry.

1. In the Google Cloud Console, on the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Container Registry** > **Images** and then click `quickstart-image`.

![20760c66fe33e5c7.png](https://cdn.qwiklabs.com/mylH9Pp%2BcYlbRpVp5HOjGthybnn717ZJhGNy%2BfLA70M%3D)

Two versions of `quickstart-image` are now in the list.

Click *Check my progress* to verify the objective.

Build two Container images in Cloud Build.

Check my progress



1. In the Google Cloud Console, on the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Cloud Build** > **History**.

![build1.png](https://cdn.qwiklabs.com/mqUXBAq%2ByIuDVyD8BONP%2FFdGUQ2tZIx54TnQtTsAhEs%3D)

Two builds appear in the list.

1. Click the build ID for the build at the top of the list.

![build2.png](https://cdn.qwiklabs.com/sFxkQJqyhLEDPzkL12IRlPTETIPOMoV83f3AbQjrZjo%3D)

The details of the build, including the build log, are displayed.

#### Task 4. Building and Testing Containers with a build configuration file and Cloud Build

The true power of custom build configuration files is their ability to perform other actions, in parallel or in sequence, in addition to simply building containers: running tests on your newly built containers, pushing them to various destinations, and even deploying them to Kubernetes Engine. In this lab, we will see a simple example: a build configuration file that tests the container it built and reports the result to its calling environment.

1. In Cloud Shell, change to the directory that contains the sample files for this lab.

```
cd ~/ak8s/Cloud_Build/b
content_copy
```

As before, the `quickstart.sh` script and the a sample custom cloud build configuration file called `cloudbuild.yaml` has been provided for you in this directory. These have been slightly modified to demonstrate Cloud Build's ability to test the containers it has build. There is also a Dockerfile present, which is identical to the one used for the previous task.

1. In Cloud Shell, execute the following command to view the contents of `cloudbuild.yaml`.

```
cat cloudbuild.yaml
content_copy
```

You will see the following:

```
steps:
- name: 'gcr.io/cloud-builders/docker'
  args: [ 'build', '-t', 'gcr.io/$PROJECT_ID/quickstart-image', '.' ]
- name: 'gcr.io/$PROJECT_ID/quickstart-image'
  args: ['fail']
images:
- 'gcr.io/$PROJECT_ID/quickstart-image
content_copy
```

In addition to its previous actions, this build configuration file runs the `quickstart-image` it has created. In this task, the `quickstart.sh` script has been modified so that it simulates a test failure when an argument `['fail']` is passed to it.

1. In Cloud Shell, execute the following command to start a Cloud Build using `cloudbuild.yaml` as the build configuration file:

```
gcloud builds submit --config cloudbuild.yaml .
content_copy
```

You will see output from the command that ends with text like this:

**Output (do not copy)**

```
Finished Step #1
ERROR
ERROR: build step 1 "gcr.io/ivil-charmer-227922klabs-gcp-49ab2930eea05/quickstart-image" failed: exit status 127
----------------------------------------------------------------------------------------------------------------------------------------------------------------
ERROR: (gcloud.builds.submit) build f3e94c28-fba4-4012-a419-48e90fca7491 completed with status "FAILURE"
content_copy
```

1. Confirm that your command shell knows that the build failed:

```
echo $?
content_copy
```

The command will reply with a non-zero value. If you had embedded this build in a script, your script would be able to act up on the build's failure.

Click *Check my progress* to verify the objective.



## Introduction to Kubernetes

video

**Quiz**

1. When you use Kubernetes, you describe the desired state you want, and Kubernetes's job is to make the deployed system conform to your desired state and to keep it there in spite of failures. What is the name for this management approach?

   A. Virtualization


   B. Containerization	

   **C. Declarative configuration**


   D. Imperative configuration

2. What is a stateful application?

   **A. An application that requires data to be stored persistently**


   B. A web front end


   C. An application that is not containerized

### Introduction to Google Kubernetes Engine

video

**QUIZ**

1. What is the relationship between Kubernetes and Google Kubernetes Engine?

   A. Google Kubernetes Engine is a closed-source variant of Kubernetes.


   B. Kubernetes and Google Kubernetes Engine are two names for the same thing.

   **C. Google Kubernetes Engine is Kubernetes as a managed service.**

2. What is the name for the computers in a Kubernetes cluster that can run your workloads?

   A. Containers


   B. Masters

   **C. Nodes**


   D. Container images

3. Which of the following supports scaling a Kubernetes cluster as a whole?

   A. Kubernetes


   B. Compute Engine

   **C. Google Kubernetes Engine**



## Compute Options Detail

video

You are choosing a technology for deploying applications, and you want to deliver them in lightweight, standalone, resource-efficient, portable packages. Which choice best meets those goals?



**Quiz**

1. You are choosing a technology for deploying applications, and you want to deliver them in lightweight, standalone, resource-efficient, portable packages. Which choice best meets those goals?

1 / 1 point

1 / 1 point
Correct

2. You are classifying a number of your applications into workload types. Select the stateful applications in this list of applications. Choose all responses that are correct (2 correct responses).

1 / 1 point
Correct

3. Question 3
   Google Compute Engine provides fine-grained control of costs. Which Compute Engine features provide this level of control?

0.8 / 1 point
Incorrect

4. You are developing a new solution and want to explore serverless application solutions. Which Google Cloud compute services provide serverless compute resources that you can use with containers?

1 / 1 point
Correct

5. You are deploying a containerized application, and you want maximum control over how containers are configured and deployed. You want to avoid the operational management overhead of managing a full container cluster environment yourself. Which Google Cloud compute solution should you choose?

1 / 1 point
Correct

## Kubernetes Architecture

### Kubernetes Concepts

video 

**Quiz**



1. What is the difference between a pod and a container?

   **A. A pod contains one or more containers.**

   B. A container contains one or more pods.

   C. Pods and containers are two names for the name thing.

## The Kubernetes Control Plane

video

**Quiz**

1. Which master control plane component is the only one with which clients interact directly?

   A. etcd

   **B. kube-apiserver**

   C. kube-controller-manager


   D. kube-scheduler

2. Which master control plane component is the cluster's database?

   A. kube-apiserver


   B. kube-controller-manager

   **C. etcd**


   D. kube-scheduler

3. What is the role of the kubelet?

   **A. To serve as Kubernetes’s agent on each node**


   B. To interact with underlying cloud providers


   C. To maintain network connectivity among the Pods in a cluster



## Google Kubernetes Engine Concepts

**video**

**Quiz**

1. In GKE clusters, how are nodes provisioned?

   **A. As Compute Engine virtual machines**


   B. As abstract parts of the GKE service that are not exposed to GCP customers

2. In GKE, how are masters provisioned?

   A. As Compute Engine virtual machines

   **B. As abstract parts of the GKE service that are not exposed to GCP customers**

3. What is the purpose of configuring a regional cluster in GKE?

   **A. To allow applications running in the cluster to withstand the loss of a zone**


   B. To ensure that the cluster's workloads are isolated from the public Internet



## Kubernetes Object Management

**video**

**Reading **A note about Deployments and ReplicaSets**:** 

The example nginx Deployment you saw in the previous video was simplified. In practice, you would launch a Deployment object to manage your desired three nginx Pods, just as the video described. Note, though, that the Deployment object would create a ReplicaSet object to manage the Pods. The diagram in the video leaves out this detail.

You will work with Deployment objects directly much more often than ReplicaSet objects. But it's still helpful to know about ReplicaSets, so that you can better understand how Deployments work. For example, one capability of a Deployment is to allow a rolling upgrade of the Pods it manages. To perform the upgrade, the Deployment object will create a second ReplicaSet object, and then increase the number of (upgraded) Pods in the second ReplicaSet while it decreases the number in the first ReplicaSet.



**Quiz**

1. In a manifest file for a Pod, in which field do you define a container image for the Pod?

   **A. spec**


   B. apiVersion


   C. kind


   D. metadata

2. What are Kubernetes namespaces useful for? Choose all that are correct (2 correct answers).

   **A. Namespaces let you implement resource quotas across your cluster.**

   **B. Namespaces allow you to use object names that would otherwise be duplicates of one another.**


   C. Namespaces partition Linux kernel resources.


   D. Namespaces make resources more secure,

3. What is the purpose of the Deployment object?

   **A. To ensure that a defined set of Pods is running at any given time.**


   B. To launch one or more Pods and ensure that a specified number of them succcessfully run to completion and exit.


   C. To launch one or more Pods on a time-based schedule.

### Advanced Objects Service

**video**

**A note about Services**
Services provide load-balanced access to specified Pods. There are three primary types of Services:

**ClusterIP**: Exposes the service on an IP address that is only accessible from within this cluster. This is the default type.
**NodePort**: Exposes the service on the IP address of each node in the cluster, at a specific port number.
**LoadBalancer**: Exposes the service externally, using a load balancing service provided by a cloud provider.
In Google Kubernetes Engine, LoadBalancers give you access to a regional Network Load Balancing configuration by default. To get access to a global HTTP(S) Load Balancing configuration, you can use an Ingress object.

You will learn more about Services and Ingress objects in a later module in this specialization.

**Controller objects to know about**
This reading explains the relationship among several Kubernetes controller objects:

**ReplicaSets**
**Deployments**
**Replication Controllers**
**StatefulSets**
**DaemonSets**
**Jobs**

A **ReplicaSet controller** ensures that a population of Pods, all identical to one another, are running at the same time. Deployments let you do declarative updates to ReplicaSets and Pods. In fact, Deployments manage their own ReplicaSets to achieve the declarative goals you prescribe, so you will most commonly work with Deployment objects.

**Deployments** let you create, update, roll back, and scale Pods, using ReplicaSets as needed to do so. For example, when you perform a rolling upgrade of a Deployment, the Deployment object creates a second ReplicaSet, and then increases the number of Pods in the new ReplicaSet as it decreases the number of Pods in its original ReplicaSet.

**Replication Controllers** perform a similar role to the combination of ReplicaSets and Deployments, but their use is no longer recommended. Because Deployments provide a helpful "front end" to ReplicaSets, this training course chiefly focuses on Deployments.

If you need to deploy applications that maintain local state, StatefulSet is a better option. A StatefulSet is similar to a Deployment in that the Pods use the same container spec. The Pods created through Deployment are not given persistent identities, however; by contrast, Pods created using StatefulSet have unique persistent identities with stable network identity and persistent disk storage.

If you need to run certain Pods on all the nodes within the cluster or on a selection of nodes, use DaemonSet. DaemonSet ensures that a specific Pod is always running on all or some subset of the nodes. If new nodes are added, DaemonSet will automatically set up Pods in those nodes with the required specification. The word "daemon" is a computer science term meaning a non-interactive process that provides useful services to other processes. A Kubernetes cluster might use a DaemonSet to ensure that a logging agent like fluentd is running on all nodes in the cluster.

The Job controller creates one or more Pods required to run a task. When the task is completed, Job will then terminate all those Pods. A related controller is CronJob, which runs Pods on a time-based schedule.

Later modules in this specialization will cover these controllers in more depth.

**Quiz**

1. What is the purpose of a Service? Choose all that are true (2 correct answers)

   **A. To provide a load-balancing network endpoint for Pods**

   **B. To allow you to choose how Pods are exposed**


   C. To allow you to put constraints on Pods' resource consumption


   D. To provide a way to inspect and diagnose code running in a Pod

2. If you are deploying applications in your Pods that need persistent storage, which controller type should you use?

   **A. StatefulSet**


   B. Deployment


   C. DaemonSet


   D. ReplicaSet



## Lab: Deploying to Google Kubernetes Engine

**Video**

# Deploying Google Kubernetes Engine

1 hourFree

Rate Lab

## Overview

In this lab, you use the Google Cloud Console to build GKE clusters and deploy a sample Pod.

## Objectives

In this lab, you learn how to perform the following tasks:

- Use the Google Cloud Console to build and manipulate GKE clusters
- Use the Google Cloud Console to deploy a Pod
- Use the Google Cloud Console to examine the cluster and Pods

## Task 0. Lab Setup

### **Access Qwiklabs**

For each lab, you get a new GCP project and set of resources for a fixed time at no cost.

1. Make sure you signed into Qwiklabs using an **incognito window**.
2. Note the lab's access time (for example, ![img/time.png](https://cdn.qwiklabs.com/aZQJ4BT7uCmM9XR6BTXgTRP1Hfu1T7q6V%2BcnbdEsbpU%3D) and make sure you can finish in that time block.

There is no pause feature. You can restart if needed, but you have to start at the beginning.

1. When ready, click ![img/start_lab.png](https://cdn.qwiklabs.com/XE8x7uvQokyubNwnYKKc%2BvBBNrMlo5iNZiDDzQQ3Ddo%3D).
2. Note your lab credentials. You will use them to sign in to Cloud Platform Console. ![img/open_google_console.png](https://cdn.qwiklabs.com/0d78dhX6IVMVWmixCPPSBbmi5O2GPokCXf1Ps1AkTgI%3D)
3. Click **Open Google Console**.
4. Click **Use another account** and copy/paste credentials for **this** lab into the prompts.

If you use other credentials, you'll get errors or **incur charges**.

1. Accept the terms and skip the recovery resource page.

Do not click **End Lab** unless you are finished with the lab or want to restart it. This clears your work and removes the project.

After you complete the initial sign-in steps, the project dashboard appears.

![c679b27aa332f22d.png](https://cdn.qwiklabs.com/dxfeoOcn1ObyC0BYyoqqqSi4rO%2FeMdbWPFjoK6C0YYk%3D)

## Task 1. Deploy GKE clusters

In this task, you use the Google Cloud Console and Cloud Shell to deploy GKE clusters.

### Use the Google Cloud Console to deploy a GKE cluster

1. In the Google Cloud Console, on the **Navigation menu** (![9a951fa6d60a98a5.png](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Kubernetes Engine** > **Clusters**.

![82b6a27127bebd94.png](https://cdn.qwiklabs.com/T5oXqKrs5CtMqAnbTCtyzlk9vi9SLssQKcGR5yd5T1o%3D)

1. Click **Create cluster** to begin creating a GKE cluster.
2. Examine the console UI and the controls to change the cluster name, the cluster location, Kubernetes version, the number of nodes, and the node resources such as the machine type in the default node pool.

Clusters can be created across a region or in a single zone. A single zone is the default. When you deploy across a region the nodes are deployed to three separate zones and the total number of nodes deployed will be three times higher.

1. Change the cluster name to **standard-cluster-1** and zone to **us-central1-a**. Leave all the values at their defaults and click **Create**.

The cluster begins provisioning.

**Note:** You need to wait a few minutes for the cluster deployment to complete.

When provisioning is complete, the **Kubernetes Engine > Clusters** page looks like the screenshot:

![f46327c053cbb49b.png](https://cdn.qwiklabs.com/EXCo6kx%2BUs3QFSQ7nD3LrxjICq%2BkGRSoKMwS3aJuHIE%3D)

Click *Check my progress* to verify the objective.

Deploy GKE cluster

Check my progress



1. Click the cluster name **standard-cluster-1** to view the cluster details

![6a505cd98a4e854e.png](https://cdn.qwiklabs.com/RDyzIGLn9uzrgMJHWXsI481jjvByYzdNTV4dFNS2JLk%3D)

1. You can scroll down the page to view more details.
2. Click the **Storage** and **Nodes** tabs under the cluster name (standard-cluster-1) at the top to view more of the cluster details.

## Task 2. Modify GKE clusters

It is easy to modify many of the parameters of existing clusters using either the Google Cloud Console or Cloud Shell. In this task, you use the Google Cloud Console to modify the size of GKE clusters.

1. In the Google Cloud Console, click **Edit** at the top of the details page for **standard-cluster-1**.
2. Scroll down to the **Node Pools** section and click **default pool**.
3. In the Google Cloud Console, click **Edit** at the top of the details page.
4. In the **Size** section, change the number of nodes from 3 to 4.

![changenode.png](https://cdn.qwiklabs.com/gnvRD8eOaiTvBnAmv1VpIoZjFpnOymZ8bKMamaEjOsk%3D)

1. Scroll to the bottom and click **Save**.
2. In the Google Cloud Console, on the **Navigation menu** (![9a951fa6d60a98a5.png](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Kubernetes Engine** > **Clusters**.

When the operation completes, the **Kubernetes Engine > Clusters** page should show that standard-cluster-1 now has four nodes.

![110af9591326966.png](https://cdn.qwiklabs.com/75nMDeRu%2F4zw%2Bp%2BCk2bzB9Brwcxr2EYGycTp4%2B1GURo%3D)

Click *Check my progress* to verify the objective.

Modify GKE clusters

Check my progress



## Task 3. Deploy a sample workload

In this task, using the Google Cloud console you will deploy a Pod running the nginx web server as a sample workload.

1. In the Google Cloud Console, on the **Navigation menu**( ![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Kubernetes Engine** > **Workloads**.
2. Click **Deploy** to show the Create a deployment wizard.

![b5ff57c1a950cc70.png](https://cdn.qwiklabs.com/BQbbiSxGcXyz0dldDGAHbTOI7Ri4D2Y5TjwpcgkkRxo%3D)

1. Click **Continue** to accept the default container image, nginx.latest, which deploys a Pod with a single container running the latest version of nginx.

![15d282aa7690eacf.png](https://cdn.qwiklabs.com/gBFrtmMahRutJ695KQOSwGxO0GKjbheJMhrjdaL%2FZTU%3D)

1. Scroll to the bottom of the window and click the **Deploy** button leaving the **Configuration** details at the defaults.
2. When the deployment completes your screen will refresh to show the details of your new nginx deployment.

![a4a2ee9873a2dc2f.png](https://cdn.qwiklabs.com/l5%2BECOPAcygl50OY%2FOx5w2Ua4Q1ewEpglzRc%2F%2BfMPP4%3D)

Click *Check my progress* to verify the objective.

Deploy a sample nginx workload

Check my progress



## Task 4. View details about workloads in the Google Cloud Console

In this task, you view details of your GKE workloads directly in the Google Cloud Console.

1. In the Google Cloud Console, on the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/fXo8j8i%2FKJoMkZ7FeHUYU7Vvu2PQfFZtFbLISSnYEaY%3D)), click **Kubernetes Engine** > **Workloads**.

![32a95eb42719841a.png](https://cdn.qwiklabs.com/MLSbUWTBs%2BMyeqHyILo6xlM%2FrUZiBD1bhbyBoCbRDn4%3D)

1. In the Google Cloud Console, on the **Kubernetes Engine > Workloads** page, click **nginx-1**.

You may see Pods (3/3) as the default deployment will start with three pods but will scale back to 1 after a few minutes. You can continue with the lab.

This displays the overview information for the workload showing details like resource utilization charts, links to logs, and details of the Pods associated with this workload.

![871369f92b245567.png](https://cdn.qwiklabs.com/EuMqSu4yfX51PA32PmwbFKArWSvCQfu69NUBXxNZ9Ag%3D)

1. In the Google Cloud Console, click the **Details** tab for the **nginx-1** workload. The Details tab shows more details about the workload including the Pod specification, number and status of Pod replicas and details about the horizontal Pod autoscaler.

![b71b95bf5d1ff3e5.png](https://cdn.qwiklabs.com/FifaHpFi%2FibAmAByGL5IX07BMRfeCiBKLfXdbhgA8P8%3D)

1. Click the **Revision History** tab. This displays a list of the revisions that have been made to this workload.

![b2532b5efc81c672.png](https://cdn.qwiklabs.com/UOCbCDyrkrArmdD4aolzSM9yfFRc7fvllO4YTDIvAA0%3D)

1. Click the **Events** tab. This tab lists events associated with this workload.

![2a770ffe99a8ae05.png](https://cdn.qwiklabs.com/jsmeYyJNn9FMsLGqWK67%2BJ5UyVx%2F5egDRd0un%2BCDwX8%3D)

1. And then the **YAML** tab. This tab provides the complete YAML file that defines this components and full configuration of this sample workload.

![1f074ceacbc117f4.png](https://cdn.qwiklabs.com/UJdNflgPgNMFCOkA41nHuNoUlYG3TM0x2UerZjFbzT8%3D)

1. Still in the Google Cloud Console's **Details** tab for the **nginx-1** workload, click the **Overview** tab, scroll down to the **Managed Pods** section and click the name of one of the Pods to view the details page for that Pod.

![4183f157b2afea06.png](https://cdn.qwiklabs.com/zIRZCQRnNdOF1HKtYJ50ccsIvnqI5y%2FNIfdxPC53VxE%3D)

**Note:**

The default deployment will start with three pods but will scale back to 1 after a few minutes so you may need to refresh the Overview page to make sure you have a valid Pod to inspect.

1. The Pod Details page provides information on the Pod configuration and resource utilization and the node where the Pod is running.

![1c7955b9e33f3f5b.png](https://cdn.qwiklabs.com/yHukzI3cJR6u6AbCQrFcUPGKRi9maZbMbZaeQE2T4kc%3D)

1. In the **Pod details** page, you can click the Events and Logs tabs to view event details and links to container logs in Cloud Operations.

![event.png](https://cdn.qwiklabs.com/t3Ll52IoxUIdJyHQFW8wUEk5pwrRp2P1MixLp07FI8s%3D)

![logs.png](https://cdn.qwiklabs.com/Vpn1lTmzmoMMvcl0xrbnnNNkiwOnpAaJj%2BRZxPIcS%2B8%3D)

1. Click the **YAML** tab to view the detailed YAML file for the Pod configuration.

![a3174a5f4dcf8b68.png](https://cdn.qwiklabs.com/MmeL0XFrph4yQqgmrAF8XT4%2B8wWYxK3mCo4rauo66L4%3D)



## Migrate for Anthos Introduction

#### Migrate for Anthos Introduction







Kubernetes Architecture
TOTAL POINTS 7

1. 
   You are designing an application, and you want to ensure that the containers are located as close to each other as possible, in order to minimize latency. Which design decision helps meet this requirement?

   A. Give the containers the same labels.

   B. Place the containers in the same cluster.

   C. Place the containers in the same Namespace.

   **D. Place the containers in the same Pod.**

2. Which Kubernetes component does the kubectl command connect to in order to carry out operations on a cluster?

   **A. kube-apiserver**

   B. kube-controller-manager


   C. kube-scheduler


   D. kube-dns

3. You have deployed a new Kubernetes Engine regional cluster with four machines in the default pool for the first zone and left the number of zones at the default. How many Compute Engine machines are deployed and billed against your account?

   A. Ten. (Four nodes are deployed in the first zone and three nodes are deployed in two other zones because you selected the defaults.)

   **B. Twelve. (Four nodes are deployed in each of three zones. A master node is deployed in each zone but it is not billed against your account.)**


   C. Fifteen. (Four nodes and a single master are deployed to each of the three zones. A master node is D deployed in each zone and it is billed against your account.)


   D. Sixteen. (Four nodes are deployed in primary and secondary zones in two regions, for a total of 4 zones and 16 nodes. A master node is deployed in each zone but it is not billed to your account.)

4. You need to ensure that the production applications running on your Kubernetes cluster are not impacted by test and staging deployments. Which features should you implement and configure to ensure that the resources for your production applications can be prioritized?

   A. Configure resource requests for Test, Staging and Production and configure specific Kubernetes resource quotas for the Production Namespace.


   B. Configure labels for Test, Staging and Production and configure specific Kubernetes resource quotas for the Production Namespace.

   C. Configure Namespaces for Test, Staging and Production and configure specific Kubernetes resource quotas for the Production Namespace.

   **D. Configure Namespaces for Test, Staging and Production and configure specific Kubernetes resource quotas for the test and staging Namespaces.**

5. When configuring storage for stateful applications, what steps must you take to provide file system storage inside your containers for data from your applications that will not be lost or deleted if your Pods fail or are deleted for any reason?

   A. You must create Volumes using local Storage on the Nodes and mount the Volumes inside your containers to provide durable storage.


   B. You must export the data from your applications to a remote service that preserves your data.


   C. You must mount NFS Volumes on each container in the Pod that requires durable storage.

   **D. You must create Volumes using network based storage to provide durable storage remote to the Pods and specify these in the Pods.**

6. You have a new logging and auditing utility that you need to deploy on all of the nodes within your cluster. Which type of controller should you use to handle this task?

   A. ReplicaSet

   **B. DaemonSet**

   C. Deployment.

   D. StatefulSet

7. You want to deploy multiple copies of your application, so that you can load balance traffic across them. How should you deploy this application's Pods to the production Namespace in your cluster?

   A. Create a Service manifest for the LoadBalancer that specifies the number of replicas you want to run.


   B. Deploy the Pod manifest multiple times until you have achieved the number of replicas required.


   C. Create separate named Pod manifests for each instance of the application and deploy as many as you need.

   **D. Create a Deployment manifest that specifies the number of replicas that you want to run.**
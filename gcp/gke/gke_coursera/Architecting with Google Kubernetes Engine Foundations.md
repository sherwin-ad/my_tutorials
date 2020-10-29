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

   A. Configure the billing account at the product folder level in the resource hierarchy.

   B. Confgure the billing account for each project associated with the product.

   C. Configure quotas and limits for the product folders.

   **D. Set up budgets and alerts at the project folder level for the product.**

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
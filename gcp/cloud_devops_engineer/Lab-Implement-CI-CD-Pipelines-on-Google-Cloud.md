# Implement CI/CD Pipelines on Google Cloud

# Working with Artifact Registry

## Overview

As the evolution of Container Registry, [Artifact Registry](https://cloud.google.com/artifact-registry) is a single place for your organization to manage container images and language packages (such as Maven and npm). It is fully integrated with Google Cloud's tooling and runtimes and comes with support for native artifact protocols. This makes it simple to integrate it with your CI/CD tooling to set up automated pipelines.

In this lab you will learn about some of the features available in Artifact Registry.

## Objectives

In this lab, you learn how to:

- Create repositories for Containers and Language Packages
- Manage container images with Artifact Registry
- Integrate Artifact Registry with Cloud Code
- Configure Maven to use Artifact Registry for Java Dependencies

## Setup and requirement

### Before you click the Start Lab button

Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click **Start Lab**, shows how long Google Cloud resources will be made available to you.

This hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

To complete this lab, you need:

- Access to a standard internet browser (Chrome browser recommended).

**Note:** Use an Incognito or private browser window to run this lab. This prevents any conflicts between your personal account and the Student account, which may cause extra charges incurred to your personal account.

- Time to complete the lab---remember, once you start, you cannot pause a lab.

**Note:** If you already have your own personal Google Cloud account or project, do not use it for this lab to avoid extra charges to your account.

### How to start your lab and sign in to the Google Cloud console

1. Click the **Start Lab** button. If you need to pay for the lab, a pop-up opens for you to select your payment method. On the left is the **Lab Details** panel with the following:

   - The **Open Google Cloud console** button
   - Time remaining
   - The temporary credentials that you must use for this lab
   - Other information, if needed, to step through this lab

2. Click **Open Google Cloud console** (or right-click and select **Open Link in Incognito Window** if you are running the Chrome browser).

   The lab spins up resources, and then opens another tab that shows the **Sign in** page.

   ***Tip:\*** Arrange the tabs in separate windows, side-by-side.

   **Note:** If you see the **Choose an account** dialog, click **Use Another Account**.

3. If necessary, copy the **Username** below and paste it into the **Sign in** dialog.

   ```
   "Username"
   ```

   

   You can also find the **Username** in the **Lab Details** panel.

4. Click **Next**.

5. Copy the **Password** below and paste it into the **Welcome** dialog.

   ```
   "Password"
   ```

   

   You can also find the **Password** in the **Lab Details** panel.

6. Click **Next**.

   **Important:** You must use the credentials the lab provides you. Do not use your Google Cloud account credentials.

   **Note:** Using your own Google Cloud account for this lab may incur extra charges.

7. Click through the subsequent pages:

   - Accept the terms and conditions.
   - Do not add recovery options or two-factor authentication (because this is a temporary account).
   - Do not sign up for free trials.

After a few moments, the Google Cloud console opens in this tab.

**Note:** To view a menu with a list of Google Cloud products and services, click the **Navigation menu** at the top-left. ![Navigation menu icon](images/nUxFb6oRFr435O3t6V7WYJAjeDFcrFb16G9wHWp5BzU%3D.png)

### Activate Cloud Shell

Cloud Shell is a virtual machine that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud. Cloud Shell provides command-line access to your Google Cloud resources.

1. Click **Activate Cloud Shell** ![Activate Cloud Shell icon](https://cdn.qwiklabs.com/ep8HmqYGdD%2FkUncAAYpV47OYoHwC8%2Bg0WK%2F8sidHquE%3D) at the top of the Google Cloud console.

When you are connected, you are already authenticated, and the project is set to your **Project_ID**, `PROJECT_ID`. The output contains a line that declares the **Project_ID** for this session:

```
Your Cloud Platform project in this session is set to "PROJECT_ID"
```

`gcloud` is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

1. (Optional) You can list the active account name with this command:

```
gcloud auth list
```

1. Click **Authorize**.

**Output:**

```
ACTIVE: *
ACCOUNT: "ACCOUNT"

To set the active account, run:
    $ gcloud config set account `ACCOUNT`
```

1. (Optional) You can list the project ID with this command:

```
gcloud config list project
```



**Output:**

```
[core]
project = "PROJECT_ID"
```

**Note:** For full documentation of `gcloud`, in Google Cloud, refer to [the gcloud CLI overview guide](https://cloud.google.com/sdk/gcloud).

You must wait for the lab to provision before making any changes to the environment! The pre-configured parts of the environment that you need to work with will be available to you as soon as the lab indicates it is ready.

## Task 1. Prepare the lab environment

### Set up variables

- In Cloud Shell, set your project ID and project number. Save them as `PROJECT_ID` and `PROJECT_NUMBER` variables:

```
export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
export REGION="REGION"
gcloud config set compute/region $REGION
```



### Enable Google services

- Run the following to enable necessary Google services:

```
gcloud services enable \
  cloudresourcemanager.googleapis.com \
  container.googleapis.com \
  artifactregistry.googleapis.com \
  containerregistry.googleapis.com \
  containerscanning.googleapis.com
```

### Get the source code

The source code for this lab is located in the GoogleCloudPlatform org on GitHub.

- Clone the source code with the command below, then change into the directory.

```
git clone https://github.com/GoogleCloudPlatform/cloud-code-samples/
cd ~/cloud-code-samples
```



### Provision the infrastructure used in this lab

In this lab you will deploy code to Kubernetes Engine (GKE).

- Run the setup script below to prepare this infrastructure:

```
gcloud container clusters create container-dev-cluster --zone="ZONE"
```



Click **Check my progress** to verify the objective.

Enable Google Services and create GKE cluster

Check my progress



## Task 2. Working with container images

### Create a Docker Repository on Artifact registry

Artifact Registry supports managing container images and language packages. Different artifact types require different specifications. For example, the requests for Maven dependencies are different from requests for Node dependencies.

To support the different API specifications, Artifact Registry needs to know what format you want the API responses to follow. To do this you will create a repository and pass in the `--repository-format` flag indicating the type of repository desired.

1. From Cloud Shell run the following command to create a repository for Docker images:

```
gcloud artifacts repositories create container-dev-repo --repository-format=docker \
  --location=$REGION \
  --description="Docker repository for Container Dev Workshop"
```



Click **Authorize** if the Cloud Shell authorization prompt appears.

1. In the Cloud console, go to **Artifact Registry** > **Repositories** and notice your newly created Docker repository named `container-dev-repo`. If you click on it you can see that it's empty at the moment.

Click **Check my progress** to verify the objective. (It may take a minute to validate. If you have completed successfully and it is not validating, wait a minute and try again.)

Working with container images

Check my progress



### Configure Docker Authentication to Artifact Registry

When connecting to Artifact Registry credentials are required in order to provide access. Rather than set up separate credentials, Docker can be configured to use your `gcloud` credentials seamlessly.

1. From Cloud Shell run the following command to configure Docker to use the Google Cloud CLI to authenticate requests to Artifact Registry in the `<filled in at lab start>` region:

```
gcloud auth configure-docker "Filled in at lab start"-docker.pkg.dev
```



1. The command will prompt for a confirmation to change the Cloud Shell docker configuration, click **ENTER**.

### Explore the sample Application

A sample application is provided in the git repository you cloned.

- Change into the java directory and review the application code:

```
cd ~/cloud-code-samples/java/java-hello-world
```



The folder contains an example Java application that renders a simple web page: in addition to various files not relevant for this specific lab, it contains the source code, under the `src` folder, and a Dockerfile you will use to build a container image locally.

### Build the Container Image

Before you can store container images in Artifact Registry you need to create one.

- Run the following command to build the container image and tag it properly:

```
docker build -t "REGION"-docker.pkg.dev/"PROJECT_ID"/container-dev-repo/java-hello-world:tag1 .
```

### Push the Container Image to Artifact Registry

- Run the following command to push the container image to the repository you created:

```
docker push "REGION"-docker.pkg.dev/"PROJECT_ID"/container-dev-repo/java-hello-world:tag1
```



### Review the image in Artifact Registry

1. In **Artifact Registry > Repositories**, click into `container-dev-repo` and check that the `java-hello-world` image is there.
2. Click on the image and note the image tagged `tag1`. You can see that Vulnerability Scanning is running or already completed and the number of vulnerabilities detected is visible.

![Artifact Registry](images/Fs3OTdcz9Ze%2F2ejwzgSPgbluaLT3YVESJWDQElxHwPU%3D.png)

Click on the number of vulnerabilities and you will see the list of vulnerabilities detected in the image, with the CVE bulletin name and the severity. Click **VIEW** on each listed vulnerability to get more details:

![CVE Readout](images/V6XVnPOuIjzX5496btWIthHrhmdCQcT998mk7Vg7PBg%3D.png)

## Task 3. Integration with Cloud Code

In this section you use the Artifact Registry Docker image repository with [Cloud Code](https://cloud.google.com/code).

### Deploy the Application to GKE Cluster from Cloud Code

1. From the `java-hello-world` folder run the following command to open Cloud Shell Editor and add the application folder to this workspace:

```
cd ~/cloud-code-samples/
cloudshell workspace .
```



The Cloud Shell editor will open with the explorer in the application folder.

1. From the left menu, select **Cloud Code** and then expand the **COMPUTE ENGINE** option and click on **Select a Project** and choose the project ID provided in the Lab Instruction.

![Cloud Code select Project](images/uBkx5YV0EHDtJ2ZacT%2BaRfjw4UhzQlNrDEXOZN1CzN8%3D.png)

Also, expand the **KUBERNETES** option. You will be able to see the cluster loading.

Wait until you see the cluster listed under **KUBERNETES** as well as under **COMPUTE ENGINE**.

1. The following steps will require you to enter your Artifact Registry repository location. The format for the location is:

```
"REGION"-docker.pkg.dev/"PROJECT_ID"/container-dev-repo
```

Click **Navigation menu** under the Cloud Shell Editor![navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D) **View > Command Palette...** and type **Run on Kubernetes** and select **Cloud Code: Run on Kubernetes**.

![Cloud Code Status](images/5TNFJonK0%2F34Ptdn2bm1%2BLuv2MuSOEwPOglqWOdVJF8%3D.png)

1. Choose **cloud-code-samples/java/java-hello-world/skaffold.yaml** and then **dockerfile**.
2. If Prompted for a context, select **Yes** to use the current context.
3. In the prompt for the image registry select **Enter the address of an image repository** and put the address location you located below and press **Enter**.

![Cloud Code Select Image Repository](images/HUPQfy2YJyirTxggCIvJ03afLMwqC3LJyMkoWznkMhI%3D.png)

```
"REGION"-docker.pkg.dev/"PROJECT_ID"/container-dev-repo
```



1. When you execute **Run on Kubernetes** for the first time Cloud Code prompts you for the target image repository location. Once provided, the repository url is stored in the file `.vscode/launch.json` which is created in the application folder.

In the output pane you see that the build starts for the application image `java-hello-world,` the image is uploaded to the Artifact Registry repository configured previously.

1. In **Artifact Registry > Repositories** click into `container-dev-repo` and check that the `java-hello-world` image and note a new image tagged `latest`.

### Review the Deployed Application

1. Go back to Cloud Shell Editor. When deployment is complete Skaffold/Cloud Code will print the exposed url where the service have been forwarded, click on the link - **Follow link**:

![URL Location](images/WqbdqnbpEwsfVgkxNO238fzw538d%2F%2BdUHX3SZoKVA7Y%3D.png)

In the new browser window you see the hello world app page.

![Hello World](images/EhYbCuh0BXpEitT%2BxC%2FwvcIdTfqZCTwDYA03NV9Y%2FIE%3D.png)

### Update application code

Now update the application to see the change implemented immediately in the deployment on the cluster:

1. Open the `HelloWorldController.java` by clicking on the **Navigation menu** under the Cloud Shell Editor ![navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D) **View > Command Palette...** and then click one backspace and then enter the path **src/main/java/cloudcode/helloworld/web** and click the option starting with `Hello..` .
2. Change the text in row 20 from "It's running!" to "It's updated!". You should see the build and deployment process starting immediately.
3. At the end of the deploy click again on the forwarded url or refresh the browser window with the application to see your change deployed:

![Hello World Updated](images/9MMRZmhhziw4WEb3SYlfGzSKCvV4YE0EvqQGXdqwerw%3D.png)

1. In the Cloud console go to **Navigation Menu > Artifact Registry > Repositories** and click into `container-dev-repo` to check that the `java-hello-world` image and note the new image.

Click **Check my progress** to verify the objective.

Integration with Cloud Code

Check my progress



## Task 4. Working with language packages

In this section you will set up an Artifact Registry Java repository and upload packages to it, leveraging them in different applications.

### Create a Java package repository

1. From Cloud Shell run the following command to create a repository for Java artifacts:

```
gcloud artifacts repositories create container-dev-java-repo \
    --repository-format=maven \
    --location="REGION" \
    --description="Java package repository for Container Dev Workshop"
```



1. Click Authorize if the Cloud Shell authorization prompt appears
2. In the Cloud console go to **Artifact Registry > Repositories** and notice your newly created Maven repository named `container-dev-java-repo`, if you click on it you can see that it's empty at the moment.

Click **Check my progress** to verify the objective.

Create a Java package repository

Check my progress



### Set up authentication to Artifact Repository

- Use the following command to update the well-known location for Application Default Credentials (ADC) with your user account credentials so that the Artifact Registry credential helper can authenticate using them when connecting with repositories:

```
gcloud auth login --update-adc
```

Copied!

content_copy

If prompted to authenticate:

- Choose **Y**.
- Paste the code into a browser window.
- Select Google Sign In and sign in using the credentials in the lab.
- Copy the authentication code from the browser back into the console to complete the authentication.

### Configure Maven for Artifact Registry

1. Run the following command to print the repository configuration to add to your Java project:

```
gcloud artifacts print-settings mvn \
    --repository=container-dev-java-repo \
    --location="REGION"
```



1. Open the `pom.xml` in Cloud Shell Editor and add the returned settings to the appropriate sections in the file:

- Add the **distributionManagement** section.

```
  <distributionManagement>
    <snapshotRepository>
      <id>artifact-registry</id>
      <url>artifactregistry://"REGION"-maven.pkg.dev/"PROJECT_ID"/container-dev-java-repo</url>
    </snapshotRepository>
    <repository>
      <id>artifact-registry</id>
      <url>artifactregistry://"REGION"-maven.pkg.dev/"PROJECT_ID"/container-dev-java-repo</url>
    </repository>
  </distributionManagement>
```



- Add the **repositories** section.

```
 <repositories>
   <repository>
     <id>artifact-registry</id>
     <url>artifactregistry://"REGION"-maven.pkg.dev/"PROJECT_ID"/container-dev-java-repo</url>
     <releases>
       <enabled>true</enabled>
     </releases>
     <snapshots>
       <enabled>true</enabled>
     </snapshots>
   </repository>
 </repositories>
```



- Update the **extensions in the Builds** section.

```
<extensions>
     <extension>
       <groupId>com.google.cloud.artifactregistry</groupId>
       <artifactId>artifactregistry-maven-wagon</artifactId>
       <version>2.1.0</version>
     </extension>
   </extensions>
```



Here's an example of the complete file for your reference.

```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
 <modelVersion>4.0.0</modelVersion>

 <artifactId>hello-world</artifactId>
 <packaging>jar</packaging>
 <name>Cloud Code Hello World</name>
 <description>Getting started with Cloud Code</description>
 <version>1.0.0</version>
<distributionManagement>
   <snapshotRepository>
     <id>artifact-registry</id>
     <url>artifactregistry://"REGION"-maven.pkg.dev/"PROJECT_ID"/container-dev-java-repo</url>
   </snapshotRepository>
   <repository>
     <id>artifact-registry</id>
     <url>artifactregistry://"REGION"-maven.pkg.dev/"PROJECT_ID"/container-dev-java-repo</url>
   </repository>
 </distributionManagement>

 <repositories>
   <repository>
     <id>artifact-registry</id>
     <url>artifactregistry://"REGION"-maven.pkg.dev/"PROJECT_ID"/container-dev-java-repo</url>
     <releases>
       <enabled>true</enabled>
     </releases>
     <snapshots>
       <enabled>true</enabled>
     </snapshots>
   </repository>
 </repositories>

 <parent>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-starter-parent</artifactId>
   <version>2.6.3</version>
 </parent>

 <properties>
   <java.version>1.8</java.version>
   <checkstyle.config.location>./checkstyle.xml</checkstyle.config.location>
 </properties>

 <build>
   <plugins>
     <plugin>
       <groupId>com.google.cloud.tools</groupId>
       <artifactId>jib-maven-plugin</artifactId>
       <version>3.2.0</version>
     </plugin>
     <plugin>
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-maven-plugin</artifactId>
     </plugin>
     <plugin>
       <groupId>org.apache.maven.plugins</groupId>
       <artifactId>maven-checkstyle-plugin</artifactId>
       <version>3.1.2</version>
     </plugin>
   </plugins>
   <extensions>
     <extension>
       <groupId>com.google.cloud.artifactregistry</groupId>
       <artifactId>artifactregistry-maven-wagon</artifactId>
       <version>2.1.0</version>
     </extension>
   </extensions>
 </build>

 <!-- The Spring Cloud GCP BOM will manage spring-cloud-gcp version numbers for you. -->
 <dependencyManagement>
   <dependencies>
     <dependency>
       <groupId>org.springframework.cloud</groupId>
       <artifactId>spring-cloud-gcp-dependencies</artifactId>
       <version>1.2.8.RELEASE</version>
       <type>pom</type>
       <scope>import</scope>
     </dependency>
   </dependencies>
 </dependencyManagement>

 <dependencies>

   <dependency>
     <groupId>org.springframework.boot</groupId>
     <artifactId>spring-boot-starter</artifactId>
   </dependency>

   <dependency>
     <groupId>org.springframework.boot</groupId>
     <artifactId>spring-boot-starter-jetty</artifactId>
   </dependency>

   <dependency>
     <groupId>org.springframework</groupId>
     <artifactId>spring-webmvc</artifactId>
   </dependency>

   <dependency>
     <groupId>org.springframework.boot</groupId>
     <artifactId>spring-boot-starter-thymeleaf</artifactId>
   </dependency>

   <dependency>
     <groupId>org.springframework.boot</groupId>
     <artifactId>spring-boot-starter-test</artifactId>
     <scope>test</scope>
   </dependency>

   <dependency>
     <groupId>org.springframework.cloud</groupId>
     <artifactId>spring-cloud-gcp-starter-logging</artifactId>
   </dependency>

 </dependencies>

</project>
```



### Upload your Java package to Artifact Registry

With Artifact Registry configured in Maven, you can now use Artifact Registry to store Java Jars for use by other projects in your organization.

- Enter the below command to change to `java-hello-world` folder.

```
cd ~/cloud-code-samples/java/java-hello-world
```



- Run the following command to upload your Java package to Artifact Registry:

```
mvn deploy
```



### Check the Java package in Artifact Registry

In the Cloud console go to **Artifact Registry > Repositories** and click into `container-dev-java-repo` to check that the `hello-world` binary artifact is there:

![Artifact Registry](images/TyBBKDNjWzPuuh%2B6UVeVgOebFt%2BdpjwV55YmJymBU48%3D.png)

## Congratulations!

In this lab you learned about some of the features available in Artifact Registry. You first created repositories for containers and language packages. You then managed container images with Artifact Registry and integrated it with Cloud Code. Finally, you configured Maven to use Artifact Registry for Java dependencies. You now have a solid understanding of features available in Artifact Registry.



# Google Kubernetes Engine Pipeline using Cloud Build

## Overview

In this lab, you create a CI/CD pipeline that automatically builds a container image from committed code, stores the image in Artifact Registry, updates a Kubernetes manifest in a Git repository, and deploys the application to Google Kubernetes Engine using that manifest.

![CI/CD Flow](images/7swem2VpBgLbbDMGVgWrtmVQtBlYOADPBh89k%2Bbb1S4%3D.png)

For this lab you will create 2 Git repositories:

- app repository: contains the source code of the application itself
- env repository: contains the manifests for the Kubernetes Deployment

When you push a change to the **app repository**, the Cloud Build pipeline runs tests, builds a container image, and pushes it to Artifact Registry. After pushing the image, Cloud Build updates the Deployment manifest and pushes it to the **env repository**. This triggers another Cloud Build pipeline that applies the manifest to the GKE cluster and, if successful, stores the manifest in another branch of the **env repository**.

The app and env repositories are kept separate because they have different lifecycles and uses. The main users of the **app repository** are actual humans and this repository is dedicated to a specific application. The main users of the **env repository** are automated systems (such as Cloud Build), and this repository might be shared by several applications. The **env repository** can have several branches that each map to a specific environment (you only use production in this lab) and reference a specific container image, whereas the **app repository** does not.

When you finish this lab, you have a system where you can easily:

- Distinguish between failed and successful deployments by looking at the Cloud Build history.
- Access the manifest currently used by looking at the production branch of the **env repository**.
- Rollback to any previous version by re-executing the corresponding Cloud Build build.

![Git Ops Flow](images/qEN8Qxr82h1FkL8DhD5sqJmblM11i7JjhZv14OGahr0%3D.png)

## Objectives

In this lab, you learn how to perform the following tasks:

- Create Kubernetes Engine clusters
- Create Cloud Source Repositories
- Trigger Cloud Build from Cloud Source Repositories
- Automate tests and publish a deployable container image via Cloud Build
- Manage resources deployed in a Kubernetes Engine cluster via Cloud Build

## Setup and requirements

### Before you click the Start Lab button

Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click **Start Lab**, shows how long Google Cloud resources will be made available to you.

This hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

To complete this lab, you need:

- Access to a standard internet browser (Chrome browser recommended).

**Note:** Use an Incognito or private browser window to run this lab. This prevents any conflicts between your personal account and the Student account, which may cause extra charges incurred to your personal account.

- Time to complete the lab---remember, once you start, you cannot pause a lab.

**Note:** If you already have your own personal Google Cloud account or project, do not use it for this lab to avoid extra charges to your account.

### How to start your lab and sign in to the Google Cloud console

1. Click the **Start Lab** button. If you need to pay for the lab, a pop-up opens for you to select your payment method. On the left is the **Lab Details** panel with the following:

   - The **Open Google Cloud console** button
   - Time remaining
   - The temporary credentials that you must use for this lab
   - Other information, if needed, to step through this lab

2. Click **Open Google Cloud console** (or right-click and select **Open Link in Incognito Window** if you are running the Chrome browser).

   The lab spins up resources, and then opens another tab that shows the **Sign in** page.

   ***Tip:\*** Arrange the tabs in separate windows, side-by-side.

   **Note:** If you see the **Choose an account** dialog, click **Use Another Account**.

3. If necessary, copy the **Username** below and paste it into the **Sign in** dialog.

   ```
   "Username"
   ```

   

   You can also find the **Username** in the **Lab Details** panel.

4. Click **Next**.

5. Copy the **Password** below and paste it into the **Welcome** dialog.

   ```
   "Password"
   ```

   

   You can also find the **Password** in the **Lab Details** panel.

6. Click **Next**.

   **Important:** You must use the credentials the lab provides you. Do not use your Google Cloud account credentials.

   **Note:** Using your own Google Cloud account for this lab may incur extra charges.

7. Click through the subsequent pages:

   - Accept the terms and conditions.
   - Do not add recovery options or two-factor authentication (because this is a temporary account).
   - Do not sign up for free trials.

After a few moments, the Google Cloud console opens in this tab.

**Note:** To view a menu with a list of Google Cloud products and services, click the **Navigation menu** at the top-left. ![Navigation menu icon](images/nUxFb6oRFr435O3t6V7WYJAjeDFcrFb16G9wHWp5BzU%3D.png)

### Activate Cloud Shell

Cloud Shell is a virtual machine that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud. Cloud Shell provides command-line access to your Google Cloud resources.

1. Click **Activate Cloud Shell** ![Activate Cloud Shell icon](https://cdn.qwiklabs.com/ep8HmqYGdD%2FkUncAAYpV47OYoHwC8%2Bg0WK%2F8sidHquE%3D) at the top of the Google Cloud console.

When you are connected, you are already authenticated, and the project is set to your **Project_ID**, `PROJECT_ID`. The output contains a line that declares the **Project_ID** for this session:

```
Your Cloud Platform project in this session is set to "PROJECT_ID"
```

`gcloud` is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

1. (Optional) You can list the active account name with this command:

```
gcloud auth list
```

1. Click **Authorize**.

**Output:**

```
ACTIVE: *
ACCOUNT: "ACCOUNT"

To set the active account, run:
    $ gcloud config set account `ACCOUNT`
```

1. (Optional) You can list the project ID with this command:

```
gcloud config list project
```



**Output:**

```
[core]
project = "PROJECT_ID"
```

**Note:** For full documentation of `gcloud`, in Google Cloud, refer to [the gcloud CLI overview guide](https://cloud.google.com/sdk/gcloud).

## Task 1. Initialize Your Lab

1. In Cloud Shell, set your project ID and project number. Save them as `PROJECT_ID` and `PROJECT_NUMBER` variables:

```
export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
export REGION=
gcloud config set compute/region $REGION
```



In the next task you will prepare your Google Cloud Project for use by enabling the required APIs, initializing the git configuration in Cloud Shell, and downloading the sample code used later in the lab.

1. Run the following command to enable the APIs for GKE, Cloud Build, Cloud Source Repositories and Container Analysis:

```
gcloud services enable container.googleapis.com \
    cloudbuild.googleapis.com \
    sourcerepo.googleapis.com \
    containeranalysis.googleapis.com
```



1. Create an Artifact Registry Docker repository named my-repository in the `<filled in at lab start>` region to store your container images:

```
gcloud artifacts repositories create my-repository \
  --repository-format=docker \
  --location=$REGION
```



1. Create a GKE cluster to deploy the sample application of this lab:

```
  gcloud container clusters create hello-cloudbuild --num-nodes 1 --region $REGION
```



1. If you have never used Git in Cloud Shell, configure it with your name and email address. Git will use those to identify you as the author of the commits you will create in Cloud Shell (if you don't have a github account, you can just fill in this with your current information. No account is necessary for this lab):

```
git config --global user.email "you@example.com"  
```



```
git config --global user.name "Your Name"
```



Click **Check my progress** to verify the objective.

Enable services, create an artifact registry and the GKE cluster

Check my progress



## Task 2. Create the Git repositories in Cloud Source Repositories

In this task, you create the two Git repositories (**hello-cloudbuild-app** and **hello-cloudbuild-env**) and initialize **hello-cloudbuild-app** with some sample code.

1. In Cloud Shell, run the following to create the two Git repositories:

```
gcloud source repos create hello-cloudbuild-app
```



```
gcloud source repos create hello-cloudbuild-env
```



1. Download the sample code from Cloud Storage:

```
cd ~
mkdir hello-cloudbuild-app
```



```
gcloud storage cp -r gs://spls/gsp1077/gke-gitops-tutorial-cloudbuild/* hello-cloudbuild-app
```



1. Configure Cloud Source Repositories as a remote:

```
cd ~/hello-cloudbuild-app
```



```
export REGION="REGION"
sed -i "s/us-central1/$REGION/g" cloudbuild.yaml
sed -i "s/us-central1/$REGION/g" cloudbuild-delivery.yaml
sed -i "s/us-central1/$REGION/g" cloudbuild-trigger-cd.yaml
sed -i "s/us-central1/$REGION/g" kubernetes.yaml.tpl
```

Copied!

content_copy

```
PROJECT_ID=$(gcloud config get-value project)
```



```
git init
git add .
git remote add google "https://source.developers.google.com/p/${PROJECT_ID}/r/hello-cloudbuild-app"
git commit -m "Initial commit"
```



The code you just cloned contains a simple "Hello World" application.

```
from flask import Flask
app = Flask('hello-cloudbuild')
@app.route('/')
def hello():
  return "Hello World!\n"
if __name__ == '__main__':
  app.run(host = '0.0.0.0', port = 8080)
```

Click **Check my progress** to verify the objective.

Create the Git repositories

Check my progress



## Task 3. Create a container image with Cloud Build

The code you cloned already contains the following Dockerfile.

```
FROM python:3.7-slim
RUN pip install flask
WORKDIR /app
COPY app.py /app/app.py
ENTRYPOINT ["python"]
CMD ["/app/app.py"]
```

With this Dockerfile, you can create a container image with Cloud Build and store it in Artifact Registry.

1. In Cloud Shell, create a Cloud Build build based on the latest commit with the following command:

```
cd ~/hello-cloudbuild-app
```



```
COMMIT_ID="$(git rev-parse --short=7 HEAD)"
```



```
gcloud builds submit --tag="${REGION}-docker.pkg.dev/${PROJECT_ID}/my-repository/hello-cloudbuild:${COMMIT_ID}" .
```



Cloud Build streams the logs generated by the creation of the container image to your terminal when you execute this command.

1. After the build finishes, in the Cloud console go to **Artifact Registry > Repositories** to verify that your new container image is indeed available in Artifact Registry. Click **my-repository**.

![Artifact Registry](images/Fs6gU1DUA0rvXELOzThMRlSRMHOa9Txjxxf0HA6vOdo%3D.png)

Click **Check my progress** to verify the objective.

Create the container image with Cloud Build

Check my progress



## Task 4. Create the Continuous Integration (CI) pipeline

In this task, you will configure Cloud Build to automatically run a small unit test, build the container image, and then push it to Artifact Registry. Pushing a new commit to Cloud Source Repositories triggers this pipeline automatically. The **cloudbuild.yaml** file already included in the code is the pipeline's configuration.

![Architecture](images/z3p4mZq3O2H5X9gBCmSJLRV9KcC9hL9yhYcO3k3Oq7Q%3D.png)

1. In the Cloud console, go to **Cloud Build > Triggers**.
2. Click **Create Trigger**
3. In the Name field, type `hello-cloudbuild`.
4. Under **Event**, select **Push to a branch**.
5. Under **Source**, select **hello-cloudbuild-app** as your **Repository** and `.* (any branch)` as your **Branch**.
6. Under **Build configuration**, select **Cloud Build configuration file**.
7. In the **Cloud Build configuration file location** field, type `cloudbuild.yaml` after the /.
8. For the **Service account**, use the Compute Engine default service account.
9. Click **Create**.

![Create Trigger](images/joBzWe0xa5NJ1uE63FgrF2KVJCswQcPKxddT8O4lJS0%3D.png)

When the trigger is created, return to the Cloud Shell. You now need to push the application code to Cloud Source Repositories to trigger the CI pipeline in Cloud Build.

1. To start this trigger, run the following command:

```
cd ~/hello-cloudbuild-app
```



```
git add .
```



```
git commit -m "Type Any Commit Message here"
```



```
git push google master
```



1. In the Cloud console, go to **Cloud Build > Dashboard**.
2. You should see a build running or having recently finished. You can click on the build to follow its execution and examine its logs.

![Dashboard](images/by89PSB7S5nlrhbdgOL1dY1JtsDYIGLHoM4KMwu97NQ%3D.png)

Click **Check my progress** to verify the objective.

Create the Continuous Integration (CI) Pipeline

Check my progress



## Task 5. Create the Test Environment and CD pipeline

Cloud Build is also used for the continuous delivery pipeline. The pipeline runs each time a commit is pushed to the candidate branch of the **hello-cloudbuild-env** repository. The pipeline applies the new version of the manifest to the Kubernetes cluster and, if successful, copies the manifest over to the production branch. This process has the following properties:

- The candidate branch is a history of the deployment attempts.
- The production branch is a history of the successful deployments.
- You have a view of successful and failed deployments in Cloud Build.
- You can rollback to any previous deployment by re-executing the corresponding build in Cloud Build. A rollback also updates the production branch to truthfully reflect the history of deployments.

Next you will modify the continuous integration pipeline to update the candidate branch of the **hello-cloudbuild-env** repository, triggering the continuous delivery pipeline.

### Grant Cloud Build access to GKE

To deploy the application in your Kubernetes cluster, Cloud Build needs the Kubernetes Engine Developer Identity and Access Management role.

1. In Cloud Shell execute the following command:

```
PROJECT_NUMBER="$(gcloud projects describe ${PROJECT_ID} --format='get(projectNumber)')"
```



```
gcloud projects add-iam-policy-binding ${PROJECT_NUMBER} \
--member=serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com \
--role=roles/container.developer
```



You need to initialize the **hello-cloudbuild-env** repository with two branches (production and candidate) and a Cloud Build configuration file describing the deployment process.

The first step is to clone the **hello-cloudbuild-env** repository and create the production branch. It is still empty.

1. In Cloud Shell execute the following command:

```
cd ~
```



```
gcloud source repos clone hello-cloudbuild-env
```

Copied!

content_copy

```
cd ~/hello-cloudbuild-env
```



```
git checkout -b production
```



1. Next you need to copy the **cloudbuild-delivery.yaml** file available in the **hello-cloudbuild-app** repository and commit the change:

```
cd ~/hello-cloudbuild-env
```



```
cp ~/hello-cloudbuild-app/cloudbuild-delivery.yaml ~/hello-cloudbuild-env/cloudbuild.yaml
```



```
git add .
```



```
git commit -m "Create cloudbuild.yaml for deployment"
```



The `cloudbuild-delivery.yaml` file describes the deployment process to be run in Cloud Build. It has two steps:

- Cloud Build applies the manifest on the GKE cluster.
- If successful, Cloud Build copies the manifest on the production branch.

1. Create a candidate branch and push both branches for them to be available in Cloud Source Repositories:

```
git checkout -b candidate
```



```
git push origin production
```



```
git push origin candidate
```



1. Grant the Source Repository Writer IAM role to the Cloud Build service account for the **hello-cloudbuild-env** repository:

```
PROJECT_NUMBER="$(gcloud projects describe ${PROJECT_ID} \
--format='get(projectNumber)')"
cat >/tmp/hello-cloudbuild-env-policy.yaml <<EOF
bindings:
- members:
  - serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com
  role: roles/source.writer
EOF
```



```
gcloud source repos set-iam-policy \
hello-cloudbuild-env /tmp/hello-cloudbuild-env-policy.yaml
```



### Create the trigger for the continuous delivery pipeline

1. In the Cloud console, go to **Cloud Build > Triggers**.
2. Click **Create Trigger**.
3. In the Name field, type `hello-cloudbuild-deploy`.
4. Under **Event**, select **Push to a branch**.
5. Under **Source**, select **hello-cloudbuild-env** as your **Repository** and `^candidate$` as your **Branch**.
6. Under **Build configuration**, select **Cloud Build configuration file**.
7. In the **Cloud Build configuration file location** field, type `cloudbuild.yaml` after the /.
8. For the **Service account**, use the Compute Engine default service account.
9. Click **Create**.

![Create Trigger](images/GL1HS%2B%2FBhdNwsMwL3FwYujis1MMCR99hDTsZ5j6uNbM%3D.png)

### Modify the continuous integration pipeline to trigger the continuous delivery pipeline.

Next, add some steps to the continuous integration pipeline that will generate a new version of the Kubernetes manifest and push it to the **hello-cloudbuild-env** repository to trigger the continuous delivery pipeline.

1. Copy the extended version of the **cloudbuild.yaml** file for the **app repository**:

```
cd ~/hello-cloudbuild-app
```



```
cp cloudbuild-trigger-cd.yaml cloudbuild.yaml
```



The **cloudbuild-trigger-cd.yaml** is an extended version of the **cloudbuild.yaml** file. It adds the steps below: they generate the new Kubernetes manifest and trigger the continuous delivery pipeline.

This pipeline uses a simple `sed` to render the manifest template. In reality, you will benefit from using a dedicated tool such as kustomize or skaffold. They allow for more control over the rendering of the manifest templates.

1. Commit the modifications and push them to Cloud Source Repositories:

```
cd ~/hello-cloudbuild-app
```



```
git add cloudbuild.yaml
```



```
git commit -m "Trigger CD pipeline"
```



```
git push google master
```



This triggers the continuous integration pipeline in Cloud Build.

Click **Check my progress** to verify the objective.

Create the Test Environment and CD Pipeline

Check my progress



## Task 6. Review Cloud Build Pipeline

1. In the Cloud console, go to **Cloud Build > Dashboard**.
2. Click into the **hello-cloudbuild-app** trigger to follow its execution and examine its logs. The last step of this pipeline pushes the new manifest to the **hello-cloudbuild-env** repository, which triggers the continuous delivery pipeline.

![Build History](images/fhfK%2F6Z72yUrC%2FyHACUJaNnoUMXwt5M9gJcm2BkTodc%3D.png)

1. Return to the main **Dashboard**.
2. You should see a build running or having recently finished for the **hello-cloudbuild-env** repository. You can click on the build to follow its execution and examine its logs.

![Cloud Build Dashboard](images/qAeV%2FbgCks5dCOdBZ2J089Ms3DHBv1X3orVp%2F9yvWqk%3D.png)

## Task 7. Test the complete pipeline

The complete CI/CD pipeline is now configured. Test it from end to end.

1. In the Cloud console, go to **Kubernetes Engine > Gateways,Services & Ingress**.

There should be a single service called **hello-cloudbuild** in the list. It has been created by the continuous delivery build that just ran.

1. Click on the endpoint for the **hello-cloudbuild** service. You should see "Hello World!". If there is no endpoint, or if you see a load balancer error, you may have to wait a few minutes for the load balancer to be completely initialized. Click **Refresh** to update the page if needed.

![App 1 Hello World!](images/r4XfRZ7CZPMk4Dr8HJ3qHVAZIZDXD%2BwvqiPeA3b5efU%3D.png)

1. In Cloud Shell, replace "Hello World" with "Hello Cloud Build", both in the application and in the unit test:

```
cd ~/hello-cloudbuild-app
```



```
sed -i 's/Hello World/Hello Cloud Build/g' app.py
```



```
sed -i 's/Hello World/Hello Cloud Build/g' test_app.py
```



1. Commit and push the change to Cloud Source Repositories:

```
git add app.py test_app.py
```



```
git commit -m "Hello Cloud Build"
```



```
git push google master
```



1. This triggers the full CI/CD pipeline.

After a few minutes, reload the application in your browser. You should now see "Hello Cloud Build!".

![App 2 Hellow Cloud Build!](images/g9DL0f%2BcVV7vEd6m%2F2pQ4EKV%2BESCBJgzdRRcgMM%2BSYI%3D.png)

## Task 8. Test the rollback

In this task, you rollback to the version of the application that said "Hello World!".

1. In the Cloud console, go to **Cloud Build > Dashboard**.
2. Click on *View all* link under **Build History** for the **hello-cloudbuild-env** repository.
3. Click on the second most recent build available.
4. Click **Rebuild**.

![Rollback success screen](https://cdn.qwiklabs.com/iLBtWEOJx%2FnmwISdKFM%2B3C2CbUmug8FtHJTBFLNpWuI%3D)

When the build is finished, reload the application in your browser. You should now see "Hello World!" again.

![App 1 Hello World!](images/r4XfRZ7CZPMk4Dr8HJ3qHVAZIZDXD%2BwvqiPeA3b5efU%3D.png)

## Congratulations!

Now you can use Cloud Build to create and rollback continuous integration pipelines with GKE on Google Cloud!



# Continuous Delivery with Google Cloud Deploy

## Overview

Google Cloud Deploy is a managed service that automates delivery of your applications to a series of target environments in a defined promotion sequence. When you want to deploy your updated application, you create a release, whose lifecycle is managed by a delivery pipeline.

In this lab, you will create a delivery pipeline using Google Cloud Deploy. You will then create a release for a basic application and promote the application through a series of Google Kubernetes Engine (GKE) targets.

The sample application is a simple web app that listens to a port, provides an HTTP response code and adds a log entry. This lab is derived from a tutorial published by Google: https://cloud.google.com/deploy/docs/tutorials.

## Objectives

In this lab, you learn how to perform the following tasks:

- Deploy a container image to Google Cloud Artifact Registry using Skaffold
- Create a Google Cloud Deploy delivery pipeline
- Create a release for the delivery pipeline
- Promote the application through the targets in the delivery pipeline

## Setup

### Before you click the Start Lab button

Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click **Start Lab**, shows how long Google Cloud resources will be made available to you.

This hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

To complete this lab, you need:

- Access to a standard internet browser (Chrome browser recommended).

**Note:** Use an Incognito or private browser window to run this lab. This prevents any conflicts between your personal account and the Student account, which may cause extra charges incurred to your personal account.

- Time to complete the lab---remember, once you start, you cannot pause a lab.

**Note:** If you already have your own personal Google Cloud account or project, do not use it for this lab to avoid extra charges to your account.

### How to start your lab and sign in to the Google Cloud console

1. Click the **Start Lab** button. If you need to pay for the lab, a pop-up opens for you to select your payment method. On the left is the **Lab Details** panel with the following:

   - The **Open Google Cloud console** button
   - Time remaining
   - The temporary credentials that you must use for this lab
   - Other information, if needed, to step through this lab

2. Click **Open Google Cloud console** (or right-click and select **Open Link in Incognito Window** if you are running the Chrome browser).

   The lab spins up resources, and then opens another tab that shows the **Sign in** page.

   ***Tip:\*** Arrange the tabs in separate windows, side-by-side.

   **Note:** If you see the **Choose an account** dialog, click **Use Another Account**.

3. If necessary, copy the **Username** below and paste it into the **Sign in** dialog.

   ```
   student-02-b57d53811715@qwiklabs.net
   ```

   

   You can also find the **Username** in the **Lab Details** panel.

4. Click **Next**.

5. Copy the **Password** below and paste it into the **Welcome** dialog.

   ```
   pU24wjqV4D5j
   ```

   

   You can also find the **Password** in the **Lab Details** panel.

6. Click **Next**.

   **Important:** You must use the credentials the lab provides you. Do not use your Google Cloud account credentials.

   **Note:** Using your own Google Cloud account for this lab may incur extra charges.

7. Click through the subsequent pages:

   - Accept the terms and conditions.
   - Do not add recovery options or two-factor authentication (because this is a temporary account).
   - Do not sign up for free trials.

After a few moments, the Google Cloud console opens in this tab.

**Note:** To view a menu with a list of Google Cloud products and services, click the **Navigation menu** at the top-left. ![Navigation menu icon](images/nUxFb6oRFr435O3t6V7WYJAjeDFcrFb16G9wHWp5BzU%3D.png)

### Activate Cloud Shell

Cloud Shell is a virtual machine that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud. Cloud Shell provides command-line access to your Google Cloud resources.

1. Click **Activate Cloud Shell** ![Activate Cloud Shell icon](https://cdn.qwiklabs.com/ep8HmqYGdD%2FkUncAAYpV47OYoHwC8%2Bg0WK%2F8sidHquE%3D) at the top of the Google Cloud console.

When you are connected, you are already authenticated, and the project is set to your **Project_ID**, `qwiklabs-gcp-03-a29be26e48aa`. The output contains a line that declares the **Project_ID** for this session:

```
Your Cloud Platform project in this session is set to qwiklabs-gcp-03-a29be26e48aa
```

`gcloud` is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

1. (Optional) You can list the active account name with this command:

```
gcloud auth list
```



1. Click **Authorize**.

**Output:**

```
ACTIVE: *
ACCOUNT: student-02-b57d53811715@qwiklabs.net

To set the active account, run:
    $ gcloud config set account `ACCOUNT`
```

1. (Optional) You can list the project ID with this command:

```
gcloud config list project
```



**Output:**

```
[core]
project = qwiklabs-gcp-03-a29be26e48aa
```

**Note:** For full documentation of `gcloud`, in Google Cloud, refer to [the gcloud CLI overview guide](https://cloud.google.com/sdk/gcloud).

## Task 1. Set variables

- Declare the environment variables that will be used by various commands:

```
export PROJECT_ID=$(gcloud config get-value project)
export REGION=us-central1
gcloud config set compute/region $REGION
```

Copied!

content_copy

## Task 2. Create three GKE clusters

In this task you will create the three GKE clusters that will be targets for the delivery pipeline.

Three GKE clusters will be created, denoting the three targets for the delivery pipeline:

- **test**
- **staging**
- **prod**

1. Enable the Google Kubernetes Engine API:

```
gcloud services enable \
container.googleapis.com \
clouddeploy.googleapis.com
```



1. Create the three GKE clusters:

```
gcloud container clusters create test --node-locations=us-central1-c --num-nodes=1  --async
gcloud container clusters create staging --node-locations=us-central1-c --num-nodes=1  --async
gcloud container clusters create prod --node-locations=us-central1-c --num-nodes=1  --async
```



1. Check the status of the three clusters:

```
gcloud container clusters list --format="csv(name,status)"
```



**Output**

```
name,status
prod,PROVISIONING
staging,PROVISIONING
test,RUNNING
```

Creating the clusters can take a few minutes. You don't need to wait for the clusters to be ready. Continue the lab.

Click **Check my progress** to verify the objective.

Create three GKE clusters

Check my progress



## Task 3. Prepare the web application container image

In this task you'll create a repository in Artifact Registry to hold the web application's container images.

1. Enable the Artifact Registry API:

```
gcloud services enable artifactregistry.googleapis.com
```



1. Create the web-app repository for holding container images:

```
gcloud artifacts repositories create web-app \
--description="Image registry for tutorial web app" \
--repository-format=docker \
--location=$REGION
```



Click **Check my progress** to verify the objective.

Create the web-app repository

Check my progress



## Task 4. Build and deploy the container images to the Artifact Registry

In this task you will clone the git repository containing the web application and deploy the application's container images to Artifact Registry.

### Prepare the application configuration

1. Clone the repository for the lab into your home directory:

```
cd ~/
git clone https://github.com/GoogleCloudPlatform/cloud-deploy-tutorials.git
cd cloud-deploy-tutorials
git checkout c3cae80 --quiet
cd tutorials/base
```



1. Create the `skaffold.yaml` configuration:

```
envsubst < clouddeploy-config/skaffold.yaml.template > web/skaffold.yaml
cat web/skaffold.yaml
```



The web directory now contains the `skaffold.yaml` configuration file, which provides instructions for Skaffold to build a container image for your application. This configuration describes the following items.

The build section configures:

- The two container images that will be built (artifacts)
- The Google Cloud Build project used to build the images

The `deploy` section configures the Kubernetes manifests needed in deploying the workload to a cluster.

The `portForward` configuration is used to define the Kubernetes service for the deployment.

**Output**

```
apiVersion: skaffold/v2beta7
kind: Config
build:
  artifacts:
    - image: leeroy-web
      context: leeroy-web
    - image: leeroy-app
      context: leeroy-app
  googleCloudBuild:
    projectId: {{project-id}}
deploy:
  kubectl:
    manifests:
      - leeroy-web/kubernetes/*
      - leeroy-app/kubernetes/*
portForward:
  - resourceType: deployment
    resourceName: leeroy-web
    port: 8080
    localPort: 9000
```

**Note:** To view the files, use vi, emacs, nano or the Cloud Shell Code Editor by clicking on the **Open Editor** icon in Cloud Shell.

### Build the web application

The skaffold tool will handle submission of the codebase to Cloud Build.

1. Enable the Cloud Build API:

```
gcloud services enable cloudbuild.googleapis.com
```

1. Run the skaffold command to build the application and deploy the container image to the Artifact Registry repository previously created:

```
cd web
skaffold build --interactive=false \
--default-repo $REGION-docker.pkg.dev/$PROJECT_ID/web-app \
--file-output artifacts.json
cd ..
```

1. Once the skaffold build has completed, check for the container images in Artifact Registry:

```
gcloud artifacts docker images list \
$REGION-docker.pkg.dev/$PROJECT_ID/web-app \
--include-tags \
--format yaml
```

The `--format` yaml parameter returns the output as YAML for readability. The output should look like this:

**Output**

```
---
createTime: '2022-01-14T02:07:54.995807Z'
package: us-central1-docker.pkg.dev/{{project-id}}/web-app/leeroy-app
tags: '9181623'
updateTime: '2022-01-14T02:07:54.995807Z'
version: sha256:6af6a0a72d13dd6597c0fc0191f697e2da2c3892d1bf8e87a3df8d96612e1495
---
createTime: '2022-01-14T02:07:53.629263Z'
package: us-central1-docker.pkg.dev/{{project-id}}/web-app/leeroy-web
tags: '9181623'
updateTime: '2022-01-14T02:07:53.629263Z'
version: sha256:a0179673d1876f205875b223557c83162e56e91c5e3313f5e99465a224adb6c9
```

By default, Skaffold sets the tag for an image to its related git tag if one is available. Similar information can be found in the `artifacts.json` file that was created by the skaffold command.

Skaffold generates the `web/artifacts.json` file with details of the deployed images:

```
cat web/artifacts.json | jq
```

**Output**

```
{
    "builds": [
        {
            "imageName": "leeroy-web",
            "tag": "us-central1-docker.pkg.dev/{{project-id}}/web-app/leeroy-web:9181623@sha256:a0179673d1876f205875b223557c83162e56e91c5e3313f5e99465a224adb6c9"
        },
        {
            "imageName": "leeroy-app",
            "tag": "us-central1-docker.pkg.dev/{{project-id}}/web-app/leeroy-app:9181623@sha256:6af6a0a72d13dd6597c0fc0191f697e2da2c3892d1bf8e87a3df8d96612e1495"
        }
    ]
```

Click **Check my progress** to verify the objective.

Build and deploy the container images to the Artifact Registry

Check my progress



## Task 5. Create the delivery pipeline

In this task you will set up the delivery pipeline.

1. Enable the Google Cloud Deploy API:

```
gcloud services enable clouddeploy.googleapis.com
```

1. Create the delivery-pipeline resource using the `delivery-pipeline.yaml` file:

```
gcloud config set deploy/region $REGION
cp clouddeploy-config/delivery-pipeline.yaml.template clouddeploy-config/delivery-pipeline.yaml
gcloud beta deploy apply --file=clouddeploy-config/delivery-pipeline.yaml
```



1. Verify the delivery pipeline was created:

```
gcloud beta deploy delivery-pipelines describe web-app
```

The delivery pipeline will appear similar to the following output:

**Output**

```
Unable to get target test
Unable to get target staging
Unable to get target prod
Delivery Pipeline:
  createTime: '2021-08-16T14:03:18.294884547Z'
  description: web-app delivery pipeline
  etag: 2539eacd7f5c256d
  name: projects/{{project-id}}/locations/us-central1/deliveryPipelines/web-app
  serialPipeline:
    stages:
    - targetId: test
    - targetId: staging
    - targetId: prod
  uid: eb0601aa03ac4b088d74c6a5f13f36ae
  updateTime: '2021-08-16T14:03:18.680753520Z'
Targets: []
```

Notice the first three lines of the output. The delivery pipeline currently references three target environments that haven't been created yet. In the next task you will create those targets.

Click **Check my progress** to verify the objective.

Create the delivery pipeline

Check my progress



## Task 6. Configure the deployment targets

Three delivery pipeline targets will be created - one for each of the GKE clusters.

### Ensure that the clusters are ready

The three GKE clusters should now be running, but it's useful to verify this.

- Run the following to get the status of the clusters:

```
gcloud container clusters list --format="csv(name,status)"
```



All three clusters should be in the RUNNING state, as indicated in the output below. If they are not yet marked as RUNNING, retry the command above until their status has changed to RUNNING.

**Output**

```
name,status
prod,RUNNING
staging,RUNNING
test,RUNNING
```

Once all the clusters have the "RUNNING" status continue the lab.

### Create a context for each cluster

Use the commands below to get the credentials for each cluster and create an easy-to-use `kubectl` context for referencing the clusters later:

```
CONTEXTS=("test" "staging" "prod")
for CONTEXT in ${CONTEXTS[@]}
do
    gcloud container clusters get-credentials ${CONTEXT} --region ${REGION}
    kubectl config rename-context gke_${PROJECT_ID}_${REGION}_${CONTEXT} ${CONTEXT}
done
```



### Create a namespace in each cluster

Use the commands below to create a Kubernetes namespace (web-app) in each of the three clusters:

```
for CONTEXT in ${CONTEXTS[@]}
do
    kubectl --context ${CONTEXT} apply -f kubernetes-config/web-app-namespace.yaml
done
```



The application will be deployed to the (web-app) namespace.

### Create the delivery pipeline targets

1. Submit a target definition for each of the targets:

```
for CONTEXT in ${CONTEXTS[@]}
do
    envsubst < clouddeploy-config/target-$CONTEXT.yaml.template > clouddeploy-config/target-$CONTEXT.yaml
    gcloud beta deploy apply --file clouddeploy-config/target-$CONTEXT.yaml
done
```

The targets are described in a yaml file. Each target configures the relevant cluster information for the target. The test and staging target configurations are mostly the same.

1. Display the details for the test Target:

```
cat clouddeploy-config/target-test.yaml
```

**Output**

```
apiVersion: deploy.cloud.google.com/v1beta1
kind: Target
metadata:
  name: test
description: test cluster
gke:
  cluster: projects/{{project-id}}/locations/us-central1/clusters/test
```

The prod target is slightly different as it requires approval (see the `requireApproval` setting in the output) before a release can be promoted to the cluster.

1. Display the details for the prod Target:

```
cat clouddeploy-config/target-prod.yaml
```

**Output**

```
apiVersion: deploy.cloud.google.com/v1beta1
kind: Target
metadata:
  name: prod
description: prod cluster
requireApproval: true
gke:
  cluster: projects/{{project-id}}/locations/us-central1/clusters/prod
```

1. Verify the three targets (test, staging, prod) have been created:

```
gcloud beta deploy targets list
```

All Google Cloud Deploy targets for the delivery pipeline have now been created.

Click **Check my progress** to verify the objective.

Configure the deployment targets

Check my progress



## Task 7. Create a release

In this task you create a release of the application.

A Google Cloud Deploy release is a specific version of one or more container images associated with a specific delivery pipeline. Once a release is created, it can be promoted through multiple targets (the promotion sequence). Additionally, creating a release renders your application using skaffold and saves the output as a point-in-time reference that's used for the duration of that release.

Since this is the first release of your application, you'll name it `web-app-001`.

1. Run the following command to create the release:

```
gcloud beta deploy releases create web-app-001 \
--delivery-pipeline web-app \
--build-artifacts web/artifacts.json \
--source web/
```

The `--build-artifacts` parameter references the `artifacts.json` file created by skaffold earlier. The `--source parameter` references the application source directory where skaffold.yaml can be found.

When a release is created, it will also be automatically rolled out to the first target in the pipeline (unless approval is required, which will be covered in a later step of this lab).

1. To confirm the test target has your application deployed, run the following command:

```
gcloud beta deploy rollouts list \
--delivery-pipeline web-app \
--release web-app-001
```

**Output**

```
---
approvalState: DOES_NOT_NEED_APPROVAL
createTime: '2021-08-16T14:05:21.961604Z'
deployEndTime: '2021-08-16T14:06:35.278604Z'
deployStartTime: '2021-08-16T14:06:22.420091744Z'
deployingBuild: projects/{{project-id}}/locations/us-central1/builds/4815b788-ec5e-4185-9141-a5b57c71b001
enqueueTime: '2021-08-16T14:06:21.760830Z'
etag: 5cb7b6c342b5f29b
name: projects/{{project-id}}/locations/us-central1/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-test-0001
state: SUCCESS
targetId: test
uid: cccd9525d3a0414fa60b2771036841d9
```

The first rollout of a release will take several minutes because Google Cloud Deploy renders the manifests for all targets when the release is created. The GKE cluster may also take a few minutes to provide the resources required by the deployment.

If you do not see `state: SUCCESS` in the output from the previous command, please wait and periodically re-run the command until the rollout completes.

1. Confirm your application was deployed to the test GKE cluster by running the following commands:

```
kubectx test
kubectl get all -n web-app
```

**Output**

```
NAME                              READY   STATUS    RESTARTS   AGE
pod/leeroy-app-5547cf9d9b-rgc2l   1/1     Running   0          3m27s
pod/leeroy-web-6768b49c46-w7vt9   1/1     Running   0          3m27s
NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)     AGE
service/leeroy-app   ClusterIP   None         <none>        50051/TCP   3m28s
NAME                         READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/leeroy-app   1/1     1            1           3m28s
deployment.apps/leeroy-web   1/1     1            1           3m28s
NAME                                    DESIRED   CURRENT   READY   AGE
replicaset.apps/leeroy-app-5547cf9d9b   1         1         1       3m28s
replicaset.apps/leeroy-web-6768b49c46   1         1         1       3m28s
```

Click **Check my progress** to verify the objective.

Create a release

Check my progress



## Task 8. Promote the application to staging

In this task you will promote the application from test and into the staging target.

1. Promote the application to the staging target:

```
gcloud beta deploy releases promote \
--delivery-pipeline web-app \
--release web-app-001
```



You will be prompted to continue before the promotion commences.

- Press ENTER to accept the default (Y = yes).

1. To confirm the staging Target has your application deployed, run the following command:

```
gcloud beta deploy rollouts list \
--delivery-pipeline web-app \
--release web-app-001
```

### Review the output

Look for the section marked `targetId: staging`. As before, if you do not see `state: SUCCEEDED` in the output from the previous command, wait and periodically re-run the command until the rollout completes.

**Output**

```
---
approvalState: DOES_NOT_NEED_APPROVAL
createTime: '2022-01-05T02:19:32.539468Z'
deployEndTime: '2022-01-05T02:19:45.970949Z'
deployStartTime: '2022-01-05T02:19:33.111948770Z'
deployingBuild: projects/743805075658/locations/us-central1/builds/2316517c-3a2f-4cd3-80ad-6d133b653746
etag: 1109b802ff586df5
name: projects/{{project-id}}/locations/us-central1/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-staging-0001
state: SUCCEEDED
targetId: staging
uid: 80a35a5f044844708d2050f8c556e07e
```

Click **Check my progress** to verify the objective.

Promote the application to staging

Check my progress



## Task 9. Promote the application to prod

In this task you will again promote the application but will also provide approval.

1. Promote the application to the prod target:

```
gcloud beta deploy releases promote \
--delivery-pipeline web-app \
--release web-app-001
```

You will be prompted to continue before the promotion commences.

- Press ENTER to accept the default (Y = yes).

1. To review the status of the prod target, run the following command:

```
gcloud beta deploy rollouts list \
--delivery-pipeline web-app \
--release web-app-001
```

In the output, note that the `approvalState` is `NEEDS_APPROVAL` and the state is `PENDING_APPROVAL`.

**Output**

```
---
approvalState: NEEDS_APPROVAL
createTime: '2021-08-16T14:12:07.466989Z'
etag: 6e9303e5a1b04084
name: projects/{{project-id}}/locations/us-central1/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-prod-0001
state: PENDING_APPROVAL
targetId: prod
uid: a5c7d6007fee4d80904d49142581aaa7
```

1. Approve the rollout with the following:

```
gcloud beta deploy rollouts approve web-app-001-to-prod-0001 \
--delivery-pipeline web-app \
--release web-app-001
```

You will be prompted to approve the rollout before the promotion commences.

- Press ENTER to accept the default (Y = yes).

1. To confirm the prod target has your application deployed, run the following command:

```
gcloud beta deploy rollouts list \
--delivery-pipeline web-app \
--release web-app-001
```



As for previous rollouts, locate the entry for the target (`targetId: prod`) and check that the rollout has completed (`state: SUCCEEDED`). Periodically re-run the command until the rollout completes.

1. Use `kubectl` to check on the status of the deployed application:

```
kubectx prod
kubectl get all -n web-app
```

Click **Check my progress** to verify the objective.

Promote the application to prod

Check my progress



## Congratulations!

Congratulations! In this lab, you learned how to create a delivery pipeline using Google Cloud Deploy. You created a release for a basic application and promoted the application through a series of Google Kubernetes Engine (GKE) targets. You first deployed the application to the test target, then promoted it to the staging target, and finally to the prod target. Now you can use Cloud Deploy to create continuous delivery pipelines!



# Implement CI/CD Pipelines on Google Cloud: Challenge Lab

## Overview

In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

To score 100% you must successfully complete all tasks within the time period!

This lab is recommended for students enrolled in the [Implement CI/CD Pipelines on Google Cloud](https://www.cloudskillsboost.google/course_templates/691) course. Are you ready for the challenge?

### Topics tested

- Using Cloud Build and Artifact Registry for containers.
- Setting up Cloud Deploy pipelines using Skaffold.
- Deploying to multiple environments with promotion approvals.
- Rolling back deployments.

## Setup

### Before you click the Start Lab button

Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click **Start Lab**, shows how long Google Cloud resources will be made available to you.

This hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

To complete this lab, you need:

- Access to a standard internet browser (Chrome browser recommended).

**Note:** Use an Incognito or private browser window to run this lab. This prevents any conflicts between your personal account and the Student account, which may cause extra charges incurred to your personal account.

- Time to complete the lab---remember, once you start, you cannot pause a lab.

**Note:** If you already have your own personal Google Cloud account or project, do not use it for this lab to avoid extra charges to your account.

You must wait for the lab to provision before making any changes to the environment! The pre-configured parts of the environment that you need to work with will be available to you as soon as the lab indicates it is ready.

## Challenge Scenario

You have started a new role as a Cloud Engineer for Jooli Inc. New management has decided to modernize and believe it's best to completely replace their legacy systems with managed infrastructure and automated integration and delivery pipelines. They have tasked you with finding and testing the best tools and services to achieve this.

By the end of the day, management would like to see a proof of concept that can address all of the following:

- Container images stored in a secure and reliable registry.
- Automatic container image scanning with detailed reports on security vulnerabilities.
- A test web application running on managed infrastructure.
- A CI/CD pipeline defined as code in order to eliminate manual errors.
- A reliable, easy, and quick way to deploy code and promote to a production-like environment or rollback if necessary.

You're expected to help manage the Cloud infrastructure and deployment tools at Jooli. Common tasks include provisioning resources for projects and implementing new products and services to ensure Jooli Inc. is modernizing effectively and following best practices.

You are expected to have the skills and knowledge for these tasks, so step-by-step guides won't be provided.

Some Jooli Inc. standards you should follow:

- Create all resources in the `<filled in at lab start>` region, unless otherwise directed.
- Use the project default VPC.
- Allocate cost effective resource sizes. Projects are monitored and excessive resource use will result in the containing project's termination (and possibly yours), so beware. This is the guidance the monitoring team is willing to share; unless directed, use the default machine types.

### Your challenge

As soon as you sit down at your desk and open your new laptop, you receive the following request to complete a set of tasks. Good luck!

1. PRE-WORK - Enable APIs, Create GKE clusters and create an docker repository in Artifact Registry.
2. Clone source code, build image, and push to artifact registry.
3. Create delivery pipeline, targets, and release.
4. Rebuild and push image, tag with latest.
5. Create new release with latest version.
6. Promote the latest release to second cluster.
7. Rollback changes to second cluster, modify, and re-release.

## Task 1. Prework - Set up environment, enable APIs and create clusters

1. Set up environment variables for your Project ID (this is important as it is used in several of the configuration files below). You can use the commands below:

```
export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
export REGION=
gcloud config set compute/region $REGION
```



1. Enable the following services in your Google Cloud project using the following commands:

- container.googleapis.com
- clouddeploy.googleapis.com
- artifactregistry.googleapis.com
- cloudbuild.googleapis.com

```
gcloud services enable \
container.googleapis.com \
clouddeploy.googleapis.com \
artifactregistry.googleapis.com \
cloudbuild.googleapis.com
```



1. Enable permissions for both Kubernetes and Cloud Deploy using the following commands:

```
gcloud projects add-iam-policy-binding $PROJECT_ID \
--member=serviceAccount:$(gcloud projects describe $PROJECT_ID \
--format="value(projectNumber)")-compute@developer.gserviceaccount.com \
--role="roles/clouddeploy.jobRunner"

gcloud projects add-iam-policy-binding $PROJECT_ID \
--member=serviceAccount:$(gcloud projects describe $PROJECT_ID \
--format="value(projectNumber)")-compute@developer.gserviceaccount.com \
--role="roles/container.developer"
```



1. Create an Artifact Repository

Create a repository for storing your Docker containers.

Name the repository: `cicd-challenge`

```
gcloud artifacts repositories create cicd-challenge \
--description="Image registry for tutorial web app" \
--repository-format=docker \
--location=$REGION
```



1. Create the Google Kubernetes Engine clusters

Create two GKE clusters for Staging and Production named `cd-staging` and `cd-production`. Clusters should be single zone and single node.

```
gcloud container clusters create cd-staging --node-locations= --num-nodes=1 --async
gcloud container clusters create cd-production --node-locations= --num-nodes=1 --async
```



## Task 2. Build the images and upload to the repository

1. Clone the repository for the lab into your home directory using the commands below:

```
cd ~/
git clone https://github.com/GoogleCloudPlatform/cloud-deploy-tutorials.git
cd cloud-deploy-tutorials
git checkout c3cae80 --quiet
cd tutorials/base
```



1. Create the skaffold.yaml configuration using the command below:

```
envsubst < clouddeploy-config/skaffold.yaml.template > web/skaffold.yaml
cat web/skaffold.yaml
```

skaffold.yaml.template

```
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apiVersion: skaffold/v2beta7
kind: Config
build:
  artifacts:
    - image: leeroy-web
      context: leeroy-web
    - image: leeroy-app
      context: leeroy-app
  googleCloudBuild:
    projectId: ${PROJECT_ID}
deploy:
  kubectl:
    manifests:
      - leeroy-web/kubernetes/*
      - leeroy-app/kubernetes/*
portForward:
  - resourceType: deployment
    resourceName: leeroy-web
    port: 8080
    localPort: 9000
```



skaffold.yaml

```
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apiVersion: skaffold/v2beta7
kind: Config
build:
  artifacts:
    - image: leeroy-web
      context: leeroy-web
    - image: leeroy-app
      context: leeroy-app
  googleCloudBuild:
    projectId: qwiklabs-gcp-01-cde765505302
deploy:
  kubectl:
    manifests:
      - leeroy-web/kubernetes/*
      - leeroy-app/kubernetes/*
portForward:
  - resourceType: deployment
    resourceName: leeroy-web
    port: 8080
    localPort: 9000
```



The web directory now contains the skaffold.yaml configuration file, which provides instructions for Skaffold to build a container image for your application.

1. Run the skaffold command to build the application and deploy the container image to the Artifact Registry repository previously created:

**HINT: use the full path to the repository you created earlier**

```
cd web
---
skaffold build --interactive=false \
--default-repo <INSERT YOUR ARTIFACT REPOSITORY HERE> \
--file-output artifacts.json
---
cd ..
```

```
cd web
---
skaffold build --interactive=false \
--default-repo us-west1-docker.pkg.dev/qwiklabs-gcp-02-a3eac393e591/cicd-challenge \
--file-output artifacts.json
---
cd ..
```



Validate that the container was created and added to the repository

Check my progress



## Task 3. Create the Delivery Pipeline

Run the following commands to copy the pipeline template file:

```
cd ~/cloud-deploy-tutorials/tutorials/base
```



1. Create the delivery-pipeline resource using the delivery-pipeline.yaml file:

```
cp clouddeploy-config/delivery-pipeline.yaml.template clouddeploy-config/delivery-pipeline.yaml
sed -i "s/targetId: staging/targetId: cd-staging/" clouddeploy-config/delivery-pipeline.yaml
sed -i "s/targetId: prod/targetId: cd-production/" clouddeploy-config/delivery-pipeline.yaml
sed -i "/targetId: test/d" clouddeploy-config/delivery-pipeline.yaml
```



1. **Set the deployment region using the `deploy/region` configuration parameter.**

   ```
   gcloud config set deploy/region $REGION
   ```

2. **Apply the pipeline configuration you created above using the `gcloud beta deploy` command**

   ```
   gcloud beta deploy apply --file=clouddeploy-config/delivery-pipeline.yaml
   ---
   Waiting for the operation on resource projects/qwiklabs-gcp-03-7a62738fe279/locations/us-east4/deliveryPipelines/web-app...done.                                                                          
   Created Cloud Deploy resource: projects/qwiklabs-gcp-03-7a62738fe279/locations/us-east4/deliveryPipelines/web-app.
   ```

   

3. Verify the delivery pipeline was created using the command below:

   ```
   gcloud beta deploy delivery-pipelines describe web-app
   ---
   Unable to get target cd-staging
   Unable to get target cd-production
   Delivery Pipeline:
     condition:
       pipelineReadyCondition: {}
       targetsPresentCondition:
         missingTargets:
         - projects/633900038112/locations/us-east4/targets/cd-staging
         - projects/633900038112/locations/us-east4/targets/cd-production
       targetsTypeCondition:
         status: true
     createTime: '2024-10-23T01:43:18.726516250Z'
     description: web-app delivery pipeline
     etag: a50ac81eaeb9dc00
     name: projects/qwiklabs-gcp-03-7a62738fe279/locations/us-east4/deliveryPipelines/web-app
     serialPipeline:
       stages:
       - targetId: cd-staging
       - targetId: cd-production
     uid: e328d1740dd94d6e9cd25d447b94dcba
     updateTime: '2024-10-23T01:43:19.327172018Z'
   Targets: []
   ```

   

### Configure the deployment targets

Two delivery pipeline targets will be created - one for each of the GKE clusters.

#### Ensure that the clusters are ready

The two GKE clusters should now be running but it's useful to verify this.

- Get the status of the clusters:

```
gcloud container clusters list --format="csv(name,status)"
---
name,status
cd-production,RUNNING
cd-staging,RUNNING
```



All clusters should be in the RUNNING state, as indicated in the output below. If they are not yet marked as RUNNING, retry the command above until their status has changed to RUNNING.

#### Create a context for each cluster

- Use the commands below to get the credentials for each cluster and create an easy-to-use kubectl context for referencing the clusters later:

```
CONTEXTS=({INSERT YOUR TARGETS HERE})
for CONTEXT in ${CONTEXTS[@]}
do
    gcloud container clusters get-credentials ${CONTEXT} --region ${REGION}
    kubectl config rename-context gke_${PROJECT_ID}_${REGION}_${CONTEXT} ${CONTEXT}
done
```

```
CONTEXTS=("cd-staging" "cd-production")
for CONTEXT in ${CONTEXTS[@]}
do
    gcloud container clusters get-credentials ${CONTEXT} --region ${REGION}
    kubectl config rename-context gke_${PROJECT_ID}_${REGION}_${CONTEXT} ${CONTEXT}
done
---
Fetching cluster endpoint and auth data.
kubeconfig entry generated for cd-staging.
Context "gke_qwiklabs-gcp-03-7a62738fe279_us-east4_cd-staging" renamed to "cd-staging".
Fetching cluster endpoint and auth data.
kubeconfig entry generated for cd-production.
Context "gke_qwiklabs-gcp-03-7a62738fe279_us-east4_cd-production" renamed to "cd-production".
```



#### Create a namespace in each cluster

- Use the commands below to create a Kubernetes namespace (web-app) in each of the clusters:

```
for CONTEXT in ${CONTEXTS[@]}
do
    kubectl --context ${CONTEXT} apply -f kubernetes-config/web-app-namespace.yaml
done
---
namespace/web-app created
namespace/web-app created
```



#### Create the delivery pipeline targets

1. Create a target definition file for each of the targets using the commands below (no changes needed):

```
envsubst < clouddeploy-config/target-staging.yaml.template > clouddeploy-config/target-cd-staging.yaml
envsubst < clouddeploy-config/target-prod.yaml.template > clouddeploy-config/target-cd-production.yaml

sed -i "s/staging/cd-staging/" clouddeploy-config/target-cd-staging.yaml
sed -i "s/prod/cd-production/" clouddeploy-config/target-cd-production.yaml
```



1. **Apply the target files to Cloud Deploy.**

The targets are described in a yaml file. Each target configures the relevant cluster information for the target.

```
gcloud beta deploy apply --file=clouddeploy-config/target-cd-staging.yaml
---
Waiting for the operation on resource projects/qwiklabs-gcp-03-7a62738fe279/locations/us-east4/targets/cd-staging...done.                                                                                 
Created Cloud Deploy resource: projects/qwiklabs-gcp-03-7a62738fe279/locations/us-east4/targets/cd-staging.
```

```
gcloud beta deploy apply --file=clouddeploy-config/target-cd-production.yaml
---
Waiting for the operation on resource projects/qwiklabs-gcp-03-7a62738fe279/locations/us-east4/targets/cd-production...done.                                                                              
Created Cloud Deploy resource: projects/qwiklabs-gcp-03-7a62738fe279/locations/us-east4/targets/cd-production.
```



Display the details for the staging target:

```
cat clouddeploy-config/target-cd-staging.yaml
```

target-cd-staging.yaml

```
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apiVersion: deploy.cloud.google.com/v1beta1
kind: Target
metadata:
  name: cd-staging
description: cd-staging cluster
gke:
  cluster: projects/qwiklabs-gcp-01-cde765505302/locations/us-east4/clusters/cd-staging
```

```
cat clouddeploy-config/target-cd-production.yaml
```

target-cd-production.yaml

```
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apiVersion: deploy.cloud.google.com/v1beta1
kind: Target
metadata:
  name: cd-production
description: cd-production cluster
requireApproval: true
gke:
  cluster: projects/qwiklabs-gcp-01-cde765505302/locations/us-east4/clusters/cd-production
```



Verify that the Cloud Deploy targets have been created.

```
gcloud beta deploy targets list
---
targets:
- createTime: '2024-10-22T08:17:01.678647890Z'
  description: cd-production cluster
  etag: a332486c340629a2
  executionConfigs:
  - artifactStorage: gs://us-east4.deploy-artifacts.qwiklabs-gcp-01-cde765505302.appspot.com
    defaultPool:
      artifactStorage: gs://us-east4.deploy-artifacts.qwiklabs-gcp-01-cde765505302.appspot.com
      serviceAccount: 105417119561-compute@developer.gserviceaccount.com
    executionTimeout: 3600s
    serviceAccount: 105417119561-compute@developer.gserviceaccount.com
    usages:
    - RENDER
    - DEPLOY
    - VERIFY
    - PREDEPLOY
    - POSTDEPLOY
  gke:
    cluster: projects/qwiklabs-gcp-01-cde765505302/locations/us-east4/clusters/cd-production
  name: projects/qwiklabs-gcp-01-cde765505302/locations/us-east4/targets/cd-production
  requireApproval: true
  targetId: cd-production
  uid: c940ea709731443eb0b9dc1cd1338a63
  updateTime: '2024-10-22T08:19:31.959685194Z'
- createTime: '2024-10-22T08:11:49.153632083Z'
  description: cd-staging cluster
  etag: c956abaaf732215e
  executionConfigs:
  - artifactStorage: gs://us-east4.deploy-artifacts.qwiklabs-gcp-01-cde765505302.appspot.com
    defaultPool:
      artifactStorage: gs://us-east4.deploy-artifacts.qwiklabs-gcp-01-cde765505302.appspot.com
      serviceAccount: 105417119561-compute@developer.gserviceaccount.com
    executionTimeout: 3600s
    serviceAccount: 105417119561-compute@developer.gserviceaccount.com
    usages:
    - RENDER
    - DEPLOY
    - VERIFY
    - PREDEPLOY
    - POSTDEPLOY
  gke:
    cluster: projects/qwiklabs-gcp-01-cde765505302/locations/us-east4/clusters/cd-staging
  name: projects/qwiklabs-gcp-01-cde765505302/locations/us-east4/targets/cd-staging
  targetId: cd-staging
  uid: da8f429a0220489d8e17bb349aea0ffc
  updateTime: '2024-10-22T08:11:49.936872289Z'
```



Check my progress



## Task 4. Create a Release

1. Create a release using the `gcloud beta deploy releases` command and the skaffold and artifacts.json files you created earlier.

- Name the release `web-app-001` and use the delivery-pipeline `web-app`.

```
gcloud beta deploy releases create web-app-001 \
--delivery-pipeline web-app \
--build-artifacts web/artifacts.json \
--source web/
---
Creating temporary archive of 9 file(s) totalling 9.2 KiB before compression.
Uploading tarball of [web/] to [gs://e328d1740dd94d6e9cd25d447b94dcba_clouddeploy/source/1729649919.98363-ca9fbd9a055f409d87f7db6380894a40.tgz]
Waiting for operation [operation-1729649923668-6251b81493b13-4eec6d17-645a4073]...done.                                                                                                                   
Created Cloud Deploy release web-app-001.
Creating rollout projects/qwiklabs-gcp-03-7a62738fe279/locations/us-east4/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-cd-staging-0001 in target cd-staging
Waiting for rollout creation operation to complete...done.                       
```

**HINT: your source directory should be web/**

- Verify that your application has been deployed to the staging environment (**cd-staging**) via the command below or in the console.

```
gcloud beta deploy rollouts list \
--delivery-pipeline web-app \
--release web-app-001
---
approvalState: DOES_NOT_NEED_APPROVAL
createTime: '2024-10-22T08:27:27.413693Z'
deployEndTime: '2024-10-22T08:27:54.549886Z'
deployStartTime: '2024-10-22T08:27:32.641556788Z'
deployingBuild: projects/105417119561/locations/us-east4/builds/ef32fae1-2ccf-492e-814e-fd51a9048bd8
enqueueTime: '2024-10-22T08:27:31.568098Z'
etag: '2368254907785534'
name: projects/qwiklabs-gcp-01-cde765505302/locations/us-east4/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-cd-staging-0001
phases:
- deploymentJobs:
    deployJob:
      deployJob: {}
      id: deploy
      jobRun: projects/105417119561/locations/us-east4/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-cd-staging-0001/jobRuns/dff8eb53-6b2a-4496-b39a-1ea632969452
      state: SUCCEEDED
    verifyJob:
      id: verify
      state: DISABLED
      verifyJob: {}
  id: stable
  state: SUCCEEDED
state: SUCCEEDED
targetId: cd-staging
uid: 10eede7ab2a34427981a806b3c257a62
```



![Cloud Deploy Pipeline](images/l2rNrItVWW%2BqkhbTZBzgjiHRK1qDE0kqDEKboIpMM7k%3D.png)

Verify the release to the Staging environment

Check my progress



## Task 5. Promote your application to production

- Promote your application from the Staging (**cd-staging**) environment to the Production (**cd-production**) environment.

**HINT: Don't forget to approve the deployment!**

```
gcloud beta deploy releases promote \
--delivery-pipeline web-app \
--release web-app-001
---
Promoting release web-app-001 to target cd-production.

Do you want to continue (Y/n)?  Y

Creating rollout projects/qwiklabs-gcp-03-7a62738fe279/locations/us-east4/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-cd-production-0001 in target cd-production
Waiting for rollout creation operation to complete...done.                                                                                                                                                
The rollout is pending approval.
```

1. To confirm the staging Target has your application deployed, run the following command:

```
gcloud beta deploy rollouts list \
--delivery-pipeline web-app \
--release web-app-001
---
approvalState: NEEDS_APPROVAL
createTime: '2024-10-22T08:32:07.986281Z'
etag: b394945053f81d9a
name: projects/qwiklabs-gcp-01-cde765505302/locations/us-east4/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-cd-production-0001
phases:
- deploymentJobs:
    deployJob:
      deployJob: {}
      id: deploy
      state: PENDING
    verifyJob:
      id: verify
      state: DISABLED
      verifyJob: {}
  id: stable
  state: PENDING
state: PENDING_APPROVAL
targetId: cd-production
uid: e2685df5a0254304b3ace6574b2f083a
```



Approve the rollout with the following:

```
gcloud beta deploy rollouts approve web-app-001-to-cd-production-0001 \
--delivery-pipeline web-app \
--release web-app-001
---
Approving rollout web-app-001-to-cd-production-0001 from web-app-001 to target cd-production.

Do you want to continue (Y/n)?  Y
```

You will be prompted to approve the rollout before the promotion commences.

- Press ENTER to accept the default (Y = yes).

1. To confirm the prod target has your application deployed, run the following command:

```
gcloud beta deploy rollouts list \
--delivery-pipeline web-app \
--release web-app-001
---
approvalState: APPROVED
approveTime: '2024-10-22T08:42:53.240518Z'
createTime: '2024-10-22T08:32:07.986281Z'
deployEndTime: '2024-10-22T08:43:13.099800Z'
deployStartTime: '2024-10-22T08:42:53.806910909Z'
deployingBuild: projects/105417119561/locations/us-east4/builds/30948baa-d97b-460c-9bce-dbeaa1f7569a
enqueueTime: '2024-10-22T08:42:53.240518Z'
etag: 4eefd744c9815a18
name: projects/qwiklabs-gcp-01-cde765505302/locations/us-east4/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-cd-production-0001
phases:
- deploymentJobs:
    deployJob:
      deployJob: {}
      id: deploy
      jobRun: projects/105417119561/locations/us-east4/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-cd-production-0001/jobRuns/aed5279e-c522-4fa3-bc9a-a33a3d7bbb80
      state: SUCCEEDED
    verifyJob:
      id: verify
      state: DISABLED
      verifyJob: {}
  id: stable
  state: SUCCEEDED
state: SUCCEEDED
targetId: cd-production
uid: e2685df5a0254304b3ace6574b2f083a
---
approvalState: DOES_NOT_NEED_APPROVAL
createTime: '2024-10-22T08:27:27.413693Z'
deployEndTime: '2024-10-22T08:27:54.549886Z'
deployStartTime: '2024-10-22T08:27:32.641556788Z'
deployingBuild: projects/105417119561/locations/us-east4/builds/ef32fae1-2ccf-492e-814e-fd51a9048bd8
enqueueTime: '2024-10-22T08:27:31.568098Z'
etag: '2368254907785534'
name: projects/qwiklabs-gcp-01-cde765505302/locations/us-east4/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-cd-staging-0001
phases:
- deploymentJobs:
    deployJob:
      deployJob: {}
      id: deploy
      jobRun: projects/105417119561/locations/us-east4/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-cd-staging-0001/jobRuns/dff8eb53-6b2a-4496-b39a-1ea632969452
      state: SUCCEEDED
    verifyJob:
      id: verify
      state: DISABLED
      verifyJob: {}
  id: stable
  state: SUCCEEDED
state: SUCCEEDED
targetId: cd-staging
uid: 10eede7ab2a34427981a806b3c257a62
```

Verify the release to the Production environment

Check my progress



## Task 6. Make a change to the application and redeploy it

1. Using the editor, open the `cloud-deploy-tutorials/tutorials/base/web/leeroy-app/` directory and modify the `app.go` file. Change line 24 to say: `fmt.Fprintf(w, "leeroooooy app v2!!\n")`

2. **Build the application and push to the Artifact Registry.**

   ```
   cd wed
   skaffold build --interactive=false \
   --default-repo us-west1-docker.pkg.dev/qwiklabs-gcp-02-a3eac393e591/cicd-challenge \
   --file-output artifacts.json
   cd ..
   ```

   

3. **Create a new release on your pipeline you created earlier. Name the release `web-app-002`**

   ```
   gcloud beta deploy releases create web-app-002 \
   --delivery-pipeline web-app \
   --build-artifacts web/artifacts.json \
   --source web/
   ---
   Creating temporary archive of 9 file(s) totalling 9.2 KiB before compression.
   Uploading tarball of [web/] to [gs://f7d0fa1fb13844ecb498a38ac90b271c_clouddeploy/source/1729654970.469481-252e0b9fdcdf47edbd4666b1fe985775.tgz]
   Waiting for operation [operation-1729654973781-6251cae4bd7a5-d26022db-b8ef6855]...done.                                                                                                                   
   Created Cloud Deploy release web-app-002.
   Creating rollout projects/qwiklabs-gcp-02-a3eac393e591/locations/us-west1/deliveryPipelines/web-app/releases/web-app-002/rollouts/web-app-002-to-cd-staging-0001 in target cd-staging
   Waiting for rollout creation operation to complete...done.                   
   ```

   

4. **Verify the new version has been deployed to the staging environment.**

   ```
   gcloud beta deploy rollouts list \
   --delivery-pipeline web-app \
   --release web-app-002
   ---
   approvalState: DOES_NOT_NEED_APPROVAL
   createTime: '2024-10-23T03:43:00.452287Z'
   deployEndTime: '2024-10-23T03:43:25.673209Z'
   deployStartTime: '2024-10-23T03:43:08.118431683Z'
   deployingBuild: projects/358382463111/locations/us-west1/builds/c711bbcd-0078-4801-8da6-630d0b7ef6aa
   enqueueTime: '2024-10-23T03:43:07.513947Z'
   etag: 11c7a21638a14c10
   name: projects/qwiklabs-gcp-02-a3eac393e591/locations/us-west1/deliveryPipelines/web-app/releases/web-app-002/rollouts/web-app-002-to-cd-staging-0001
   phases:
   - deploymentJobs:
       deployJob:
         deployJob: {}
         id: deploy
         jobRun: projects/358382463111/locations/us-west1/deliveryPipelines/web-app/releases/web-app-002/rollouts/web-app-002-to-cd-staging-0001/jobRuns/c70dc531-95a1-46b3-921d-f1f49d238ac0
         state: SUCCEEDED
       verifyJob:
         id: verify
         state: DISABLED
         verifyJob: {}
     id: stable
     state: SUCCEEDED
   state: SUCCEEDED
   targetId: cd-staging
   uid: 2d47fad76aca4ca19a6d7b5ee53a0d3f
   ```

   



## Task 7. Rollback The Change

Oh No! Your QA Engineers have found a bug in your release to staging so you will need to rollback to the previous version.

1. **Use Cloud Deploy to rollback to the original version of the application - `web-app-001`**

   gcloud cli

   ```
   gcloud deploy targets rollback cd-staging \
      --delivery-pipeline=web-app \
      --release=web-app-001
   ---
   Rolling back target cd-staging to release web-app-001.
   
   
   Do you want to continue (Y/n)?  Y
   
   Creating rollout projects/qwiklabs-gcp-02-a3eac393e591/locations/us-west1/deliveryPipelines/web-app/releases/web-app-001/rollouts/web-app-001-to-cd-staging-0002 in target cd-staging
   Waiting for rollout creation operation to complete...done.                   
   ```

   console

   https://cloud.google.com/deploy/docs/roll-back#console

2. Verify that the original version is running.

Verify the rollback ran successfully

Check my progress



## Congratulations!

In this lab, you have successfully set up a CI/CD pipeline using Google Cloud Deploy and Artifact Registry. You've created a proof of concept that addressed all of management's requirements. Jooli Inc. is now well on their way towards achieving higher ROI with the [benefits of application modernization](https://cloud.google.com/solutions/application-modernization)!


# Professional Cloud Architect Certification Learning Path



# Designing and Planning a Cloud Solution Architecture



## Diagnostic questions

1. Cymbal Direct is evaluating database options to store the analytics data from its experimental drone deliveries. You're currently using a small cluster of MongoDB NoSQL database servers. You want to move to a managed NoSQL database service with consistent low latency that can scale throughput seamlessly and can handle the petabytes of data you expect after expanding to additional markets. What should you do?

- **Create a Bigtable instance, extract the data from MongoDB, and insert the data into Bigtable.**

- Extract the data from MongoDB. Insert the data into Firestore using Datastore mode.

- Extract the data from MongoDB, and insert the data into BigQuery.

- Extract the data from MongoDB. Insert the data into Firestore using Native mode.

Correct! Bigtable is ideal for IoT, gives consistently sub-10ms latency, and can be used at a petabyte scale.

2. You are creating a new project. You plan to set up a Dedicated interconnect between two of your data centers in the near future and want to ensure that your resources are only deployed to the same regions where your data centers are located. You need to make sure that you don’t have any overlapping IP addresses that could cause conflicts when you set up the interconnect. You want to use RFC 1918 class B address space. What should you do?

- **Create a new project, delete the default VPC network, set up a custom mode VPC network, and then use IP addresses in the 172.16.x.x address range to create subnets in your desired regions.**

- Create a new project, delete the default VPC network, set up an auto mode VPC network, and then use the default 10.x.x.x network range to create subnets in your desired regions.

- Create a new project, leave the default network in place, and then use the default 10.x.x.x network range to create subnets in your desired regions.

- Create a new project, delete the default VPC network, set up the network in custom mode, and then use IP addresses in the 192.168.x.x address range to create subnets in your desired zones. Use VPC Network Peering to connect the zones in the same region to create regional networks.

Correct! Custom networks give you full control.

3. Cymbal Direct's employees will use Google Workspace. Your current on-premises network cannot meet the requirements to connect to Google's public infrastructure. What should you do?

- Order a Partner Interconnect from a Google Cloud partner, and ensure that proper routes are configured.

- Connect the network to a Google point of presence, and enable Direct Peering.

- Order a Dedicated Interconnect from a Google Cloud partner, and ensure that proper routes are configured.

- **Connect the on-premises network to Google’s public infrastructure via a partner that supports Carrier Peering.**

Correct! Carrier Peering allows using a Google partner to connect to Google public infrastructure, such as Workspace or YouTube.

4. You are working with a client who is using Google Kubernetes Engine (GKE) to migrate applications from a virtual machine–based environment to a microservices-based architecture. Your client has a complex legacy application that stores a significant amount of data on the file system of its VM. You do not want to re-write the application to use an external service to store the file system data. What should you do?

- **In Cloud Shell, create a YAML file defining your StatefulSet called statefulset.yaml. Create a StatefulSet in GKE by running the command kubectl apply -f statefulset.yaml**

- In Cloud Shell, create a YAML file defining your Container called build.yaml. Create a Container in GKE by running the command gcloud builds submit –config build.yaml .

- In Cloud Shell, create a YAML file defining your Deployment called deployment.yaml. Create a Deployment in GKE by running the command kubectl apply -f deployment.yaml

- In Cloud Shell, create a YAML file defining your Pod called pod.yaml. Create a Pod in GKE by running the command kubectl apply -f pod.yaml

Correct! A StatefulSet represents a group of persistent Pods. The YAML file will define a PersistentVolumeClaim (PVC) that allows for an application to retain state. A StatefulSet is commonly used with applications like databases.

5. Cymbal Direct has created a proof of concept for a social integration service that highlights images of its products from social media. The proof of concept is a monolithic application running on a single SuSE Linux virtual machine (VM). The current version requires increasing the VM’s CPU and RAM in order to scale. You would like to refactor the VM so that you can scale out instead of scaling up. What should you do?

- Make sure that the application declares any dependent requirements in a requirements.txt or equivalent statement so that they can be referenced in a startup script, and attach external persistent volumes to the VMs.

- Make sure that the application declares any dependent requirements in a requirements.txt or equivalent statement so that they can be referenced in a startup script. Specify the startup script in a managed instance group template, and use an autoscaling policy.

- Move the existing codebase and VM provisioning scripts to git, and attach external persistent volumes to the VMs.

- **Use containers instead of VMs, and use a GKE autoscaling deployment.**

###### **Correct! Treating each app as one or more stateless processes means externalizing state to a separate database service. This allows for more concurrent processing.**

6. Cymbal Direct is working with Cymbal Retail, a separate, autonomous division of Cymbal with different staff, networking teams, and data center. Cymbal Direct and Cymbal Retail are not in the same Google Cloud organization. Cymbal Retail needs access to Cymbal Direct’s web application for making bulk orders, but the application will not be available on the public internet. You want to ensure that Cymbal Retail has access to your application with low latency. You also want to avoid egress network charges if possible. What should you do?

- Verify that the subnet Cymbal Retail is using has the same IP address range with Cymbal Direct’s subnet range, and then enable VPC Network Peering for the project.

- If Cymbal Retail does not have access to a Google Cloud data center, use Carrier Peering to connect the two networks.

- **Verify that the subnet range Cymbal Retail is using doesn’t overlap with Cymbal Direct’s subnet range, and then enable VPC Network Peering for the project.**

- Specify Cymbal Direct’s project as the Shared VPC host project, and then configure Cymbal Retail’s project as a service project.

Correct! VPC Peering allows for shared networking between organizations.

7. Customers need to have a good experience when accessing your web application so they will continue to use your service. You want to define key performance indicators (KPIs) to establish a service level objective (SLO). Which KPI could you use?

- Low latency for > 85% of requests when aggregated over 1 minute

- **Eighty-five percent of requests succeed when aggregated over 1 minute**

- ###### Eighty-five percent of customers are satisfied users

- Eighty-five percent of requests are successful

Correct! This is specific, and you can reasonably expect to meet this KPI.

8. Cymbal Direct developers have written a new application. Based on initial usage estimates, you decide to run the application on Compute Engine instances with 15 Gb of RAM and 4 CPUs. These instances store persistent data locally. After the application runs for several months, historical data indicates that the application requires 30 Gb of RAM. Cymbal Direct management wants you to make adjustments that will minimize costs. What should you do?

- Stop the instance, and then use the command gcloud compute instances set-machine-type VM_NAME --machine-type e2-standard-8. Set the instance’s metadata to: preemptible: true. Start the instance again.

- Stop the instance, and then use the command gcloud compute instances set-machine-type VM_NAME --machine-type e2-standard-8. Start the instance again.

- Stop the instance, and then use the command gcloud compute instances set-machine-type VM_NAME --machine-type 2-custom-4-30720. Set the instance’s metadata to: preemptible: true. Start the instance again.

- **Stop the instance, and then use the command gcloud compute instances set-machine-type VM_NAME --machine-type 2-custom-4-30720. Start the instance again.**

Correct! Custom instances are a good way to optimize costs. You don’t have to pay for resources you don’t need.

9. You are working in a mixed environment of VMs and Kubernetes. Some of your resources are on-premises, and some are in Google Cloud. Using containers as a part of your CI/CD pipeline has sped up releases significantly. You want to start migrating some of those VMs to containers so you can get similar benefits. You want to automate the migration process where possible. What should you do?

- Use Migrate for Compute Engine to import VMs and convert them to containers.

- Use Migrate for Anthos to automate the creation of Compute Engine instances to import VMs and convert them to containers.

- **Manually create a GKE cluster, and then use Migrate for Anthos to set up the cluster, import VMs, and convert them to containers.**

- Manually create a GKE cluster. Use Cloud Build to import VMs and convert them to containers.

Correct. You must initially create a GKE cluster. Then you can use Migrate for Anthos to set up the cluster and import the VMs.

10. Cymbal Direct drones continuously send data during deliveries. You need to process and analyze the incoming telemetry data. After processing, the data should be retained, but it will only be accessed once every month or two. Your CIO has issued a directive to incorporate managed services wherever possible. You want a cost-effective solution to process the incoming streams of data. What should you do?

- Ingest data with ClearBlade IoT Core, and then store it in BigQuery.

- **Ingest data with ClearBlade IoT Core, and then publish to Pub/Sub. Use Dataflow to process the data, and store it in a Nearline Cloud Storage bucket.**

- Ingest data with ClearBlade IoT Core, process it with Dataprep, and store it in a Coldline Cloud Storage bucket.

- Ingest data with ClearBlade IoT Core, and then publish to Pub/Sub. Use BigQuery to process the data, and store it in a Standard Cloud Storage bucket.

Correct! Dataflow is a fully managed service that can be used to process both streams and batches of data. Nearline is a good fit because the data could be accessed every month.

## Knowledge Check

1. If you have a business requirement to minimize costs, what are **two** things you could do?

*info*Note: To get credit for a multiple-select question, you must select all of the correct options and none of the incorrect ones.

- **Do not run instances when they are not being used**

Correct. Only running, and thus paying for, instances when they are needed, is a great way to save costs. Using tools like GKE autoscaling clusters, or managed instance groups are a great way to save money.

- **Follow Google’s rightsizing recommendations**

Correct. Google will evaluate your instance’s usage, and make recommendations on how to save money or improve performance by resizing them.

- Use a managed service

- Cap costs by creating a budget in Google Cloud

- Migrate to Kubernetes from VMs

2. What could Cymbal Direct use to estimate costs for their Google Cloud environment?

- ROI

- KPIs

- **Cloud Pricing Calculator**

- Average Compute Instance CPU

Correct! The Cloud pricing calculator allows you to estimate the costs for Google Cloud Products and Services.



# Managing and Provisioning a Solution Infrastructure

## Diagnostic questions

1. Cymbal Direct's user account management app allows users to delete their accounts whenever they like. Cymbal Direct also has a very generous 60-day return policy for users. The customer service team wants to make sure that they can still refund or replace items for a customer even if the customer’s account has been deleted. What can you do to ensure that the customer service team has access to relevant account information?

- Ensure that the user clearly understands that after they delete their account, all their information will also be deleted. Remind them to download a copy of their order history and account information before deleting their account. Have the support agent copy any open or recent orders to a shared spreadsheet.

- Disable the account. Export account information to Cloud Storage. Have the customer service team permanently delete the data after 30 days.

- **Temporarily disable the account for 30 days. Export account information to Cloud Storage, and enable lifecycle management to delete the data in 60 days.**

- Restore a previous copy of the user information database from a snapshot. Have a database administrator capture needed information about the customer.

Correct! This takes a lazy deletion approach and allows support or administrators to restore data later if necessary.

2. Cymbal Direct needs to use a tool to deploy its infrastructure. You want something that allows for repeatable deployment processes, uses a declarative language, and allows parallel deployment. You also want to deploy infrastructure as code on Google Cloud and other cloud providers. What should you do?

- Use Google Kubernetes Engine (GKE) to create deployments and manifests for your applications.

- **Automate the deployment with Terraform scripts.**

- Develop in Docker containers for portability and ease of deployment.

- Automate the deployment with Cloud Deployment Manager.

Correct! Terraform lets you automate and manage resources in multiple clouds.

3. Cymbal Direct wants to create a pipeline to automate the building of new application releases. What sequence of steps should you use?

- Set up a source code repository. Run unit tests. Check in code. Deploy. Build a Docker container.

- Run unit tests. Deploy. Build a Docker container. Check in code. Set up a source code repository.

- Check in code. Set up a source code repository. Run unit tests. Deploy. Build a Docker container.

- **Set up a source code repository. Check in code. Run unit tests. Build a Docker container. Deploy.**

Correct! Each step is dependent on the previous step. These are in the right order.



4. You are working with a client who has built a secure messaging application. The application is open source and consists of two components. The first component is a web app, written in Go, which is used to register an account and authorize the user’s IP address. The second is an encrypted chat protocol that uses TCP to talk to the backend chat servers running Debian. If the client's IP address doesn't match the registered IP address, the application is designed to terminate their session. The number of clients using the service varies greatly based on time of day, and the client wants to be able to easily scale as needed. What should you do?

- Deploy the web application using the App Engine standard environment with a global external HTTP(S) load balancer and a network endpoint group. Use a managed instance group for the backend chat servers. Use a global SSL proxy load balancer to load-balance traffic across the backend chat servers.

- Deploy the web application using the App Engine standard environment with a global external HTTP(S) load balancer and a network endpoint group. Use an unmanaged instance group for the backend chat servers. Use an external network load balancer to load-balance traffic across the backend chat servers.

- **Deploy the web application using the App Engine standard environment with a global external HTTP(S) load balancer and a network endpoint group. Use a managed instance group for the backend chat servers. Use an external network load balancer to load-balance traffic across the backend chat servers.**

- Deploy the web application using the App Engine flexible environment with a global external HTTP(S) load balancer and a network endpoint group. Use an unmanaged instance group for the backend chat servers. Use an external network load balancer to load-balance traffic across the backend chat servers.

Correct! Using App Engine allows for dynamic scaling based on demand, as does a managed instance group. Using an external network load balancer preserves the client's IP address.



5. You have deployed your frontend web application in Kubernetes. Based on historical use, you need three pods to handle normal demand. Occasionally your load will roughly double. A load balancer is already in place. How could you configure your environment to efficiently meet that demand?

- Edit your pod's configuration file and change the number of replicas to six.

- Edit your deployment's configuration file and change the number of replicas to six.

- Use the "kubectl autoscale" command to change the pod's maximum number of instances to six.

- **Use the "kubectl autoscale" command to change the deployment’s maximum number of instances to six.**

Correct! This will allow Kubernetes to scale the number of pods automatically, based on a condition like CPU load or requests per second.



6. Cymbal Direct wants a layered approach to security when setting up Compute Engine instances. What are some options you could use to make your Compute Engine instances more secure?

- Use labels to allow traffic only from certain sources and ports. Turn on Secure boot and vTPM.

- Use network tags to allow traffic only from certain sources and ports. Use a Compute Engine service account.

- Use labels to allow traffic only from certain sources and ports. Use a Compute Engine service account.

- **Use network tags to allow traffic only from certain sources and ports. Turn on Secure boot and vTPM.**

Correct! You can use network tags with firewall rules to automatically associate instances when they are created. Secure boot and vTPM protect the OS from being compromised.



7. Cymbal Direct must meet compliance requirements. You need to ensure that employees with valid accounts cannot access their VPC network from locations outside of its secure corporate network, including from home. You also want a high degree of visibility into network traffic for auditing and forensics purposes. What should you do?

- Ensure that all users install Cloud VPN. Enable VPC Flow Logs for the networks you need to monitor.

- **Enable VPC Service Controls, define a network perimeter to restrict access to authorized networks, and enable VPC Flow Logs for the networks you need to monitor.**

- Enable VPC Service Controls, and use Google Cloud Observability to view audit logs for the networks you need to monitor.

- Enable Identity-Aware Proxy (IAP) to allow users to access services securely. Use Google Cloud Observability to view audit logs for the networks you need to monitor.

Correct! Enabling VPC Service Controls lets you define a network perimeter. VPC Flow Logs lets you log network-level communication to Compute Engine instances.



8. You need to deploy a load balancer for a web-based application with multiple backends in different regions. You want to direct traffic to the backend closest to the end user, but also to different backends based on the URL the user is accessing. Which of the following could be used to implement this?

- The request is received by the SSL proxy load balancer, which uses a global forwarding rule to check the URL map, then sends the request to a backend service. The request is processed by Compute Engine instance groups in multiple regions.

- **The request is received by the global external HTTP(S) load balancer. A global forwarding rule sends the request to a target proxy, which checks the URL map and selects the backend service. The backend service sends the request to Compute Engine instance groups in multiple regions.**

- The request is matched by a URL map and then sent to a SSL proxy load balancer. A global forwarding rule sends the request to a target proxy, which selects a backend service and sends the request to Compute Engine instance groups in multiple regions.

- The request is matched by a URL map and then sent to a global external HTTP(S) load balancer. A global forwarding rule sends the request to a target proxy, which selects a backend service. The backend service sends the request to Compute Engine instance groups in multiple regions.

Correct! This is the right order of operations.

9. Your existing application runs on Ubuntu Linux VMs in an on-premises hypervisor. You want to deploy the application to Google Cloud with minimal refactoring. What should you do?

- Set up a Google Kubernetes Engine (GKE) cluster, and then create a deployment with an autoscaler.

- Isolate the core features that the application provides. Use App Engine to deploy each feature independently as a microservice.

- **Write Terraform scripts to deploy the application as Compute Engine instances.**

- Use a Dedicated or Partner Interconnect to connect the on-premises network where your application is running to your VPC: Configure an endpoint for a global external HTTP(S) load balancer that connects to the existing VMs.

Correct! Terraform lets you manage how you deploy and manage a variety of services in Google Cloud, such as Compute Engine. You can also use Cloud Deployment Manager for this purpose.



10. Cymbal Direct wants to allow partners to make orders programmatically, without having to speak on the phone with an agent. What should you consider when designing the API?

- The API backend should be tightly coupled. Clients should know a significant amount about the services they use. REST APIs using gRPC should be used for all external APIs.

- The API backend should be tightly coupled. Clients should know a significant amount about the services they use. For REST APIs, HTTP(S) is the most common protocol used.

- The API backend should be loosely coupled. Clients should not be required to know too many details of the services they use. REST APIs using gRPC should be used for all external APIs.

The API backend should be loosely coupled. Clients should not be required to know too many details of the services they use. For REST APIs, HTTP(S) is the most common protocol.

Incorrect. If an API is not loosely coupled, it can become an issue for maintenance, with large, complicated monolithic applications. REST APIs are protocol-agnostic, and HTTP(S) is the most common protocol for external APIs.

## Knowledge Check



1. Which network configuration would ensure low latency for US drone pilots?

- Deploy resources globally

- Only deploy resources to Regions in Asia

- Only deploy resources to Regions in Europe

- **Only deploy resources to Regions in the US**

Correct! Only deploy resources to Regions in the US

2. Which Storage Class should you use for data that is going to be accessed at least once every two weeks?

- Nearline

- **Standard**

- Coldline

- Archive

Correct! Standard is appropriate for frequent use.



# Designing for Security and Compliance
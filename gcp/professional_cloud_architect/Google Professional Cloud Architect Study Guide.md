[TOC]



# Chapter 1 : Introduction to the Google Professional Cloud Architect Exam

## Analyzing Business Requirements

**Business requirements** define the operational landscape in which you will develop a solution. 

Example business requirements are as follows:

- The need to reduce **capital expenditures**
- Accelerating the pace of software development
- Reporting on **service-level objectives**
- Reducing time to recover from an incident
- Improving compliance with industry regulations

### Reducing Operational Expenses

- Reducing operational expenses may be satisfied by using managed services instead of operating services

### Accelerating the Pace of Development

- Successful businesses are constantly innovating. Agile software development practices are designed to support rapid development, testing, deployment, and feedback.
- **Continuous integration and continuous delivery** are additional practices within software development. 

### Reporting on Service-Level Objectives 

- Requirements about availability are formalized in **service-level objectives (SLOs)**
- SLOs can be defined in terms of availability, such as being available 99.9 percent of the time.
-  Developers can create reports and dashboards using logging details and metrics to monitor compliance with SLOs. These metrics are known as **service-level indicators (SLIs)**. 

- The operational groups of a modern business depend on IT applications. 
  - A finance department needs access to accounting systems. 
  - A logistics analyst needs access to data about how well the fleet of delivery vehicles is performing
  - The sales team constantly queries and updates the customer management system.

### Reducing Time to Recover from an Incident

- **Incidents**, in the context of IT services, are a disruption that causes a service to be degraded or unavailable.
-  To reduce the time to recover, it is best to collect metrics and log events and then make them available to engineers at any time, especially during an incident response.

### Improving Compliance with Industry Regulations

- Complying with privacy regulations usually requires controls on who can access and change protected data, where it is stored, and under what conditions data may be retained by a business.
- Regulations range from protecting the privacy of customer data to ensuring the integrity of business transactions and financial reporting. 

#### Major regulations include the following:

**Health Insurance Portability and Accountability Act (HIPAA)** 

- a healthcare regulation
- addresses privacy security of medical information in the United States.

**Children's Online Privacy Protection Act (COPPA)**

- a privacy regulation
- is a U.S. law that regulates websites that collect personal information to protect children under the age of 13.

**Sarbanes–Oxley Act (SOX)** 

- a financial reporting regulation
- regulates business reporting of publicly traded companies to ensure the accuracy and reliability of financial statements to mitigate the risk of corporate fraud. This is a U.S. federal regulation.

**Payment Card Industry Data Standard (PCI)** 

- a data protection regulation for credit card processing
- is an industry security standard that applies to businesses that accept payment cards. The regulation specifies security controls that must be in place to protect cardholders' data.

**General Data Protection Regulation (GDPR)** 

- a European Union privacy protection regulation
- defines privacy protections for people in and citizens of the European Union.

### Business Terms to Know 

- **Capital Expenditure (Capex)** Funds spent to acquire assets, such as computer equipment, vehicles, and land. Capital expenditures are used to purchase assets that will have a useful life of at least a few years. The other major type of expenditure is *operational expenditures*. Capital expenses are spread over multiple years, with only a portion of the capital expense impacting the bottom line for each of the years.
- **Compliance** Implementing controls and practices to meet the requirements of regulations, including security, monitoring, and verification that controls meet requirements.
- **Digital Transformation** Major changes in businesses as they adopt information technologies to develop new products, improve customer service, optimize operations, and make other major improvements enabled by technology. Brick-and-mortar retailers using mobile technologies to promote products and engage with customers is an example of digital transformation. Digital transformations usually include some cloud component.
- **Governance** Procedures and practices used to ensure that policies and principles of organizational operations are followed. Governance is the responsibility of directors and executives within an organization.
- **Key Performance Indicator (KPI)** A measure that provides information about how well a business or organization is achieving an important or key objective. For example, an online gaming company may have KPIs related to the number of new players acquired per week, total number of player hours, and operational costs per player.
- **Line of Business** The parts of a business that deliver a particular class of products and services. For example, a bank may have consumer banking and business banking lines, while an equipment manufacturer may have industrial as well as agricultural lines of business. Different lines of business within a company will have some business and technical requirements in common as well as their own distinct needs.
- **Operational Expenditures (Opex)** An expense paid for from the operating budget, not the capital budget.
- **Operating Budget** A budget allocating funds to meet the costs of labor, supplies, and other expenses related to performing the day-to-day operations of a business. Contrast this to capital expenditure budgets, which are used for longer-term investments.
- **Service-Level Agreement (SLA)** An agreement between a provider of a service and a customer using the service. SLAs define responsibilities for delivering a service and consequences when responsibilities are not met.
- **Service-Level Indicator (SLI)** A metric that reflects how well a service-level objective is being met. Examples include latency, throughput, and error rate.
- **Service-Level Objective (SLO)** An agreed-upon target for a measurable attribute of a service that is specified in a service-level agreement.

## Analyzing Technical Requirements

- **Technical requirements** specify features of a system that relate to functional and nonfunctional performance.
  - **Functional features** include providing Atomicity, Consistency, Reliability, and Durability (ACID) transactions in a database, which guarantees that transactions are atomic, consistent, isolated, and durable; ensuring *at least once* delivery in a messaging system; and encrypting data at rest. 
  - **Nonfunctional features** are the general features of a system, including scalability, reliability, observability, and maintainability.

### Functional Requirements

#### Understanding Compute Requirements 

- **Compute Engine** -  if there is a technical requirement to use a virtual machine running a particular hardened version of Linux

- **App Engine Flexible, Cloud Run, or Kubernetes Engine** - If you want to run containers in a managed service
- **App Engine** **Flexible** -  If you already have application code running in App Engine and you intend to run a small number of containers
- **Kubernetes Engine** - If you plan to deploy and manage a large number of containers and want to use a service mesh like **Anthos Service Mesh** to secure and monitor microservices
- **Cloud Run** - If you are running stateless containers that do not require Kubernetes features such as namespaces or node allocation and management features

#### Understanding Storage Requirements 

-  If SQL is required, then your choices are **Cloud SQL**, **Spanner**, **BigQuery**, or **running a relational database yourself in Compute Engine**.

- **Cloud Spanner** - If you require a global, strongly consistent transactional data store

- **Cloud SQL** is a good choice for regional-scale databases

- **Cloud Firestore** is a good option when a document store is needed

- **Bigtable** 

  - is well suited for ingesting large volumes of data at low latency. 

  - if a service needs to ingest time-series data at low latency and one of the business requirements is to maximize the use of managed services

- **Cloud Storage** -  long-term archival storage is required

  - **Standard Storage class storage** - If the data is frequently accessed
  - **Multiregional or Dual-region storage** - If high availability of access to the data is a concern or if data will be accessed from different areas of the world
  - **Nearline storage** - is designed for data that won't be accessed more than once a month
  - **Coldline storage** - is used for data that is stored at least 90 days and accessed no more than once every three months
  -  **Archive storage** -  is well suited for data that will be accessed not more than once a year.

- **Nearline, Coldline, and Archive** storage have slightly lower availability than Standard Storage.

#### Understanding Network Requirements 

- Networking topics that require an architect tend to fall into two categories: structuring virtual private clouds and supporting hybrid cloud computing.
- **Virtual private clouds (VPCs)** isolate a Google Cloud Platform customer's resource.

- To develop solutions to these high-level requirements, architects need to understand basic networking components such as the following:

  - Firewalls and firewall rules
  - Domain name services (DNS)
  - *CIDR* blocks and IP addressing
  - Autogenerated and custom subnets
  - *VPC peering*

- Many companies and organizations adopting cloud computing also have their own data centers. Architects need to understand options for networking between on-premises data centers and the Google Cloud Platform network. 

  **Virtual private Network (VPN)** 

  - are a good choice when bandwidth demands are not high and data is allowed to traverse the public Internet.
  - 3 Gbps for each VPN tunnel

  **Dedicated Interconnect** 

  - are used when a 10 Gbps connection is needed and both your on-premises point of presence and a Google point of presence are in the same physical location.

  **Partner Interconnects**

  - If you do not have point of presence co-located with a Google point of presence

### Nonfunctional Requirements

**Availability** 

- is a measure of the time that services are functioning correctly and accessible to users. 
- *Availability* requirements are typically stated in terms of percent of time a service should be up and running, such as 99.99 percent. 
- Fully supported Google Cloud services have SLAs for availability so that you can use them to help guide your architectural decisions. Note, alpha and beta products typically do not have SLAs.

**Reliability** 

- is a closely related concept to availability. 
- *Reliability* is a measure of the probability that a service will continue to function under some load for a period of time.
-  The level of reliability that a service can achieve is highly dependent on the availability of infrastructure upon which it depends.

**Scalability** 

- is the ability of a service to adapt its infrastructure to the load on the system. 
- When load decreases, some resources may be shut down. When load increases, resources can be added. 
- Autoscalers and managed instance groups are often used to ensure scalability when using Compute Engine. 
- One of the advantages of services like Cloud Storage and App Engine is that scalability is managed by GCP, which reduces the operational overhead on DevOps teams.

**Durability**

- is used to measure the likelihood that a stored object will be retrievable in the future. 
- Cloud Storage has 99.999999999 percent (eleven 9s) durability guarantees, which means it is extremely unlikely that you will lose an object stored in Cloud Storage. Because of the math, as the number of objects increases, the likelihood that one of them is lost will increase.

**Observability** 

- is the ability to determine the internal state of a system by examining outputs of the system. 
- Metrics and logs improve observability by providing information about the state of a system over time.

#### Cloud Dataproc 

- is a managed Spark and Hadoop service that is well suited for batch processing.
- Spark has support for stream processing, and if you are migrating a Spark-based batch processing system, then using Cloud Dataproc may be the fastest way to support stream processing.

#### Cloud Dataflow

- supports both batch and stream processing by implementing an Apache Beam runner, which is an open source model for implementing data workflows
- Cloud Dataflow has several key features that facilitate building data pipelines, such as supporting commonly used languages like Python, Java, and SQL; providing native support for exactly one processing and event time; and implementing periodic checkpoints.

#### Cloud Pub/Sub 

- can be used instead of RabbitMQ

## The case studies are summarized in the following sections.

### EHR Healthcare

- In the EHR Healthcare cases study, you will have to assess the needs of an electronic health records software company. 
- The company has customers in multiple countries, and the business is growing. 
- The company wants to scale to meet the needs of new business, provide for disaster recovery, and adapt agile software practices, such as frequent deployments.

#### Business and Technical Considerations 

- EHR Healthcare uses multiple colocation facilities, and the lease on one of those facilities is expiring soon.

- Customers use applications that are containerized and running in **Kubernetes**. **Both relational and NoSQL databases** are in use. Users are managed with **Microsoft Active Directory.** Open source tools are used for monitoring, and although there are alerts in place, email notifications about alerts are often ignored.

- Business requirements include onboarding new clients as soon as possible, maintaining a minimum of 99.9 percent availability for applications used by customers, improving observability into system performance, ensuring compliance with relevant regulations, and reducing administration costs.

- Technical requirements include maintaining legacy interfaces, standardizing on how to manage containerized applications, **providing for high-performance networking between on-premises systems and GCP**, providing consistent logging, provisioning and scaling new environments, creating interfaces for ingesting data from new clients, and reducing latency in customer applications.

- The company has experienced outages and struggles to manage multiple environments.

#### Architecture Considerations 

- The company has customers in multiple countries, and reducing latency to customers is a priority. This calls for a multiregional deployment of services, which will also help address disaster recovery requirements. Depending on storage requirements, **multiregional Cloud Storage** may be needed. 
- If a relational database is required to span regions, then **Cloud Spanner** may become part of the solution.

- EHR Healthcare is already using Kubernetes, so Kubernetes Engine will likely be used. Depending on the level of control they need over Kubernetes, they may be able to reduce operations costs by using Autopilot mode of Kubernetes instead of Standard mode.

- The company uses **Microsoft Active Directory** to manage identities, so you may want to use **Cloud Identity with Active Directory** as an identity provider (IdP) for federating identities.

- To improve deployments of multiple environments, you should treat infrastructure as code using **Cloud Deployment Manager or Terraform**. **Cloud Build, Cloud Source Repository, and Artifact Registry** are key to supporting an agile continuous integration/continuous delivery.

- Current logging and monitoring are insufficient given the problems with outages and ignored alert messages. Engineers may be experiencing alert fatigue caused by too many alerts that either are false positives or provide insufficient information to help resolve the incident. Cloud Monitoring and Cloud Logging will likely be included in a solution.



### Helicopter Racing League 

- The Helicopter Racing League case study describes a global sports provider specializing in helicopter racing at regional and worldwide scales. 
- The company streams races around the world. In addition, it provides race predictions throughout the race.

#### Business and Technical Considerations 

- The company wants to increase its use of managed artificial intelligence (AI) and machine learning (ML) services as well as serving content closer to racing fans.

- The Helicopter Racing League runs its services in a public cloud provider, and initial video recording and editing is performed in the field and then uploaded to the cloud for additional processing on virtual machines. 
- The company has truck-mounted mobile data centers deployed to race sites. An object storage system is used to store content. The deep learning platform **TensorFlow** is used for predictions, and it runs on VMs in the cloud.

- The company is focused on expanding the use of predictive analytics and reducing latency to those watching the race. They are particularly interested in predictions about race results, mechanical failures, and crowd sentiment. They would also like to increase the telemetry data collected during races. Operational complexity should be minimized while still ensuring compliance with relevant regulations.

- Specific technical requirements include increasing prediction accuracy, reducing latency for viewers, increasing post-editing video processing performance, and providing additional analytics and data mart services.



#### Architecture Considerations 

- The emphasis on **AI and ML** makes the Helicopter Racing League a candidate for Vertex AI services. Since they are using TensorFlow, performance may be improved using GPUs or TPUs to build machine learning models.

- Improving the accuracy of predictive models will likely require additional data or larger ML models, possibly both. **Cloud Pub/Sub** is ideal for ingesting large volumes of telemetry data. Services can run in **Kubernetes Engine** with appropriate scaling configurations and using a **Google Cloud global load balancer**. The Helicopter Racing League should consider adopting **MLOps practices, including automated CI/CD for ML pipelines, such as Vertex Pipelines.**

- **The league has racing fans across the globe, and latency is a key consideration, so Premium Tier network services should be used over the lower-performance Standard Network Tier.** Cloud CDN can be used for high-performance edge caching of recorded content to meet latency requirements.

- BigQuery would be a good option for deploying data marts and supporting analytics since it scales well and is fully managed.



### Mountkirk Games 

- The Mountkirk Games case study is about a developer of online, multiplayer games for mobile devices. 
- It has migrated on-premises workloads to Google Cloud. It is creating a game that will enable hundreds of players to play in geospecific digital arenas. The game will include a real-time leader board.



#### Business and Technical Considerations 

- The game will be deployed on **Google Kubernetes Engine (GKE)** using a **global load balancer** along with a **multiregion Cloud Spanner cluster**. Some existing games that were migrated to Google Cloud are running on virtual machines although they will be eventually migrated to GKE. Popular legacy games are isolated in their own projects in the resource hierarchy while those with less traffic have been consolidated into one project.

- Business sponsors of the game want to support multiple gaming devices in multiple geographic regions in a way that scales to meet demand. Server-side GPU processing will be used to render graphics that can be used on multiple platforms. Latency and costs should be minimized, and the company prefers to use managed services and pooled resources.

- Structured game activity logs should be stored for analysis in the future. Mountkirk Games will be making frequent changes and want to be able to rapidly deploy new features and bug fixes.



#### Architecture Considerations 

- Mountkirk Games has completed a migration to Google Cloud using a lift-and-shift approach. Legacy games will eventually be migrated from **VMs to GKE**, but the new game is a higher priority.

- The new game will support multiple device platforms, so some processing, like rendering graphics, will be done on the server side to ensure consistency in graphics processing and minimizing the load on players' devices. To minimize latency, plan for **global load balancing** and **multiregion deployment of services in GKE**.

- Cloud Logging can ingest custom log data, so it should be used to collect game activity logs. Since Cloud Logging stores logs for only 30 days, you will likely need to create a log sink to store the data in **Cloud Storage or BigQuery**. Since the logs are structured and you will be analyzing the logs, storing them in **BigQuery** is a good option. At the time of writing, in North America the cost of active storage in BigQuery is about the same as the cost of Standard Storage in Cloud Storage. The cost of BigQuery's Long-term Storage is also about the same as Nearline Storage in Cloud Storage. Prices vary by region and may vary over time.



### TerramEarth

- The TerramEarth case study describes a heavy equipment manufacturer for the agriculture and mining industries. 
- The company has hundreds of dealers in 100 countries with more than 2 million vehicles in operation. The company is growing at 20 percent annually.



#### Business and Technical Considerations 

- Vehicles generate telemetry data from sensors. Most of the data collected is compressed and uploaded after the vehicle returns to its home base. A small amount of data is transmitted in real time. Each vehicle generates from 200 to 500 MB of data per day.

- Data aggregation and analysis is performed in Google Cloud. Significant amounts of sensor data from manufacturing plants are stored in legacy inventory and logistics management applications running in private data centers. Those data centers have multiple network interconnects to GCP.

- Business sponsors want to predict and detect vehicle malfunctions and ship replacement parts just in time for repairs. They also want to reduce operational costs, increase development speed, support remote work, and provide custom API services for partners.

- An HTTP API access layer for legacy systems will be developed to minimize disruptions when moving those services to the cloud.

- Developers will use a modern CI/CD platform as well as a self-service platform for creating new projects.

- Cloud-native solutions for key management will be used along with identity-based access management.



#### Architecture Considerations 

- For data that is transmitted in real time, **Cloud Pub/Sub** can be used for ingestion. If there is additional processing to be done on that data, **Cloud Dataflow** could be used to read the data from a Pub/Sub topic, process the data, and then write the results to **persistent storage**. BigQuery would be a good option for additional analytics.

- The other data that is uploaded in batch may be stored in **Cloud Storage** where a **Cloud Dataflow** job could decompress the files, perform any needed processing, and write the data to **BigQuery**.

- **BigQuery** has the advantages of being a fully managed, petabyte-scale analytical database that supports the creation of machine learning models without the need to export data. Also, the machine learning functionality is available through SQL functions, making it accessible to relational database users who may not be familiar with specialized machine learning tools.

- TerramEarth is a good use case for **Vertex AI**. Assuming much of the sensor data is highly structured, that is, it is not images or videos, then **AutoML Tables** may be used for developing models. If deep learning models are used, then GPUs and TPUs may be used as well.

- For workflows with more complex dependencies, **Cloud Composer** is a good option since it allows you to define workflows as directed acyclic graphs. Consider an **MLOps workflow** that includes training a machine learning model using the latest data, using the model to make predictions about data collected in real time, and initiating the shipment of replacement parts when a component failure is predicted. If the model is not successfully trained, then the existing prediction job should not be replaced. Instead, the training job should be executed again with an update to the prediction job to follow only if training is successful. This kind of workflow management is handled automatically in Cloud Composer.

# Chapter 2 Designing Solutions to Meet Business Requirements

## Business Use Cases and Product Strategy

- Business requirements may be high-level, broad objectives, or they may be tightly focused specifications of some aspect of a service. 
- *High-level objectives* are tied to strategy, or plan, to meet some vision and objective. 
- These statements give us clues as to what the cloud solution will look like. In fact, we can often estimate technical requirements just from statements about business strategy and product offerings.

Let's look at the three case studies and see what kinds of information can be derived to help formulate a solution.

### EHR Healthcare 

The EHR Healthcare case study explicitly lists several business requirements, and from these statements, we can derive several facts about any solution.

- The company provides business-to-business services to insurance providers. The time it takes insurance providers to start using the system, known as *onboarding*, needs to be minimized.
- There is a mix of users, including medical offices, hospitals, and insurance providers. It is likely they all have different needs. For example, small medical offices may need more technical assistance when onboarding, while large insurance providers will likely have specialized data integration requirements.
- Medical records management services cannot have extended periods of downtime. These systems need to be available 99.9 percent of the time.
- Application performance is an issue. Latency needs to be reduced.
- Since the applications store and process protected health information such as medical history, maintaining data confidentiality is a top concern.
- The company is growing rapidly, and system administration costs cannot grow just because more infrastructure is added. System management practices should be designed to allow the organization to add infrastructure without needing to add staff to support it.
- The company wants to use its data to derive insights about industry trends.

This list of business requirements helps us start to understand or at least estimate some likely aspects of the technical requirements. Here are some examples of technical implications that should be considered based on the facts listed previously:

- Since the company is providing services to other businesses, customers will likely use public APIs.
- There are many legacy systems in the insurance industry, so there may be batch processing jobs as well.
- The need for availability calls for redundancy in infrastructure including compute, storage, and networking along with an architecture that prevents any single failure from making services unavailable.
- With a goal of deriving insights from data, the company will likely keep large amounts of data for extended periods of time. This coupled with the sensitivity of the data will require careful planning of access controls and data lifecycle management policies.
- Since the company serves customers in multiple nations and low latency is a goal, services and data will be served from multiple regions. For example, the EU's GDPR restricts the movement of records across national boundaries, which may have implications for region selection, storage strategy, and network topology.
- The adoption of managed services will likely lead to a decrease in infrastructure administration costs. AI and machine learning managed services will allow the company to start deriving insights from data faster than if they built ML models from scratch.

### Helicopter Racing League 

- The Helicopter Racing League has several explicitly stated business requirements that fall into four categories: predictive analytics, increase viewership, operations, and increasing revenue.

- The company wants to improve predictions during races, but they also want to expose their predictive models to business partners. Part of the business plan is to increase the type and amount of telemetry data collected.

- Executives want to increase the number of concurrent viewers and reduce latency. This requirement will have a direct impact on technical requirements, especially related to scalability and geographic distribution of content and services.

- Another business requirement is to minimize operational complexity and ensure compliance with regulations. This is a common requirement across the case studies.

- The requirements specifically call for creating a merchandising revenue stream. It is not specifically detailed, but this may include branded merchandise such as clothing. This is a vague requirement and would require additional work to identify more specific details of the requirement.



### Mountkirk Games Strategy 

- Mountkirk Games is a company that makes online, session-based, multiplayer games for mobile platforms. The company is already using cloud computing. In the Mountkirk Games case study, we see an example of a product strategy that is focused on building on their cloud and application development experience to create a new product and improve the way they deliver services.

- The business requirements include customer-facing requirements, such as supporting multiple gaming platforms and supporting multiple regions, which will improve latency and disaster recovery capabilities.

- There is also a call for using managed services and pooled resources as well as support for dynamic scaling. We can see, given their use of Kubernetes, there will likely be an opportunity to use Google Kubernetes Engine as well as other managed services.

- Here again, we see that business requirements can help us frame and anticipate some likely technical requirements. There is not enough information in the business requirements to make definitive decisions about technical solutions, but they do allow us to start formulating possible solutions.



### TerramEarth Strategy 

- The TerramEarth business requirements include improving the ability to predict malfunctions in equipment, increasing the speed and reliability of development workflows, and enabling developers to create custom APIs more efficiently.

- The business requirements do not explicitly call for using managed services, but given the emphasis on predictive analytics, it is likely that Vertex AI and other machine learning services, such as GPUs and TPUs, will be employed.

- The business requirements also emphasize the importance of developer productivity, including remote workers.

- Business requirements are a starting point for formulating a technical solution. Architects must apply their knowledge of systems design to map business requirements into possible technical requirements. After that, they can dig into explicit technical requirements to start to formulate technical solutions.

- The key point of this section is that business requirements are not some kind of unnecessary filler in the case studies. They provide the broad context in which a solution will be developed. While they do not provide enough detail to identify solution components on their own, they do help us narrow the set of feasible technical solutions. Business requirements may help you rule out options to an exam question. For example, a data storage solution that distributes data across multiple regions by default may meet all technical requirements, but if a business requirement indicates the data to be stored must be located in a specific country, then the correct answer is the one that lets you limit where the data is stored.

## Application Design and Cost Considerations

 **Total Cost of Ownership** **(TCO)** - is the combination of all expenses related to maintaining a service, which can include the following:

- Software licensing costs

- Cloud computing costs, including infrastructure and managed services
- Cloud storage costs
- Data ingress and egress charges
- Cost of DevOps personnel to develop and maintain the service
- Cost of third-party services used in an application
- Charges against missed service-level agreements
- Network connectivity charges, such as those for a dedicated connection between an on-premises data center and Google Cloud

### Managed Services

- Manages services are Google Cloud Platform services that do not require users to perform common configuration and maintenance operations.

**Google Cloud Platform managed services.**

| Service Name             | Service Type            | Description                                                  |
| :----------------------- | :---------------------- | :----------------------------------------------------------- |
| AutoML Tables            | AI and machine learning | Machine learning models for structured data                  |
| Recommendations AI       | AI and machine learning | Personalized recommendations                                 |
| Natural Language AI      | AI and machine learning | Entity recognition, sentiment analysis, and language identification |
| Cloud Translation        | AI and machine learning | Translate between languages                                  |
| Cloud Vision             | AI and machine learning | Understand contents of images                                |
| Dialogflow Essentials    | AI and machine learning | Development suite for voice and text conversational apps     |
| BigQuery                 | Analytics               | Data warehousing and analytics                               |
| Cloud Datalab            | Analytics               | Interactive data analysis tool based on Jupyter Notebooks    |
| Dataproc                 | Analytics               | Managed Hadoop and Spark service                             |
| Cloud Data Fusion        | Data management         | Data integration and ETL (Extract, Transform, and Load) tool |
| Data Catalog             | Data management         | Metadata management service                                  |
| Dataflow                 | Data management         | Stream and batch processing                                  |
| Cloud Spanner            | Database                | Global relational database                                   |
| Cloud SQL                | Database                | Regional relational database                                 |
| Cloud Deployment Manager | Development             | Infrastructure-as-code service                               |
| Cloud Pub/Sub            | Messaging               | Messaging service                                            |
| Cloud Composer           | Orchestration           | Data workflow orchestration service                          |
| Bigtable                 | Storage                 | Wide column, NoSQL database                                  |
| Cloud Data Transfer      | Storage                 | Bulk data transfer service                                   |
| Cloud Memorystore        | Storage                 | Managed cache service using Redis or memcached               |
| Cloud Storage            | Storage                 | Managed object storage service                               |

### Reduced Levels of Services

One way to reduce costs is to accept lower levels of service in exchange for lower costs. In GCP there are a number of opportunities to reduce cost in exchange for lower levels of service, including the following:

- Using preemptible virtual machines instead of standard virtual machines
- Using standard tier networking instead of Premium tier
- Using Pub/Sub Lite instead of Pub/Sub
- Using Durable Reduced Availability Storage

#### Preemptible Virtual Machines 

One way to minimize computing costs is to use *preemptible virtual machines*, which are short-lived VMs that cost about 80 percent less than their nonpreemptible counterparts. Here are some things to keep in mind about preemptible VMs when considering business and technical requirements:

- Preemptible VMs may be shut down at any time by Google. They will be shut down after running for 24 hours.
- GCP will signal a VM before shutting down. The VM will have 30 seconds to stop processes gracefully.
- Preemptible VMs can have local SSDs and GPUs if additional storage and compute resources are needed.
- If you want to replace a preempted VM automatically, you can create a managed instance group for preemptible VMs. If resources are available, the managed instance group will replace the preempted VM.
- Preemptible VMs can be used with some managed services, such as Cloud Dataproc, to reduce the overall cost of the service.

- Preemptible VMs are well suited for batch jobs or other workloads that can be disrupted and restarted. They are not suitable for running services that need high availability, such as a database or user-facing service, like a web server.

- Preemptible VMs are also not suitable for applications that manage state in memory or on the local SSD. Preemptible VMs cannot be configured to live migrate; when they are shut down, locally persisted data and data in memory are lost. If you want to use preemptible VMs with stateful applications, consider using Cloud Memorystore, a managed Redis or memcached service for caching data, or a database to store state.

#### Standard vs. Premium Tier Networking

**Standard Tier** **networking** 

- is the lower-performance option. Performance and availability are typically like other cloud providers that depend on the public internet. 
- There are no global SLAs, and Cloud Load Balancing is limited to regional load balancing.

**Premium Tier** **networking** 

- you experience high performance and reliability, low latency, and a global SLA. 
- You can also use global load balancers that can distribute load across regions. 
- Network traffic is carried on Google's network, not the public internet.

#### Pub/Sub Lite vs. Pub/Sub

**Pub/Sub** 

- is a highly scalable messaging service in Google Cloud. 
- provides for per-message parallelism, automatic scaling, and global routing. Service endpoints are global and regional.
- provides multizone replication in a single region.
- Google recommends that Pub/Sub as the default choice for a managed messaging service.

**Pub/Sub Lite**

- is also horizontally scalable but costs less and provides lower levels of service than Pub/Sub.

- offers lower availability and durability than Pub/Sub.

- Messages replication is limited to a single zone 

- service endpoints are regional, not global.

- service also requires users of the service to manage resource capacity.

- can cost up to 85 percent less than Cloud Pub/Sub

  

#### Durable Reduced Availability Storage

- Durable Reduced Availability (DRA) Storage is like Standard Storage but with lower performance and availability. 
- DRA Storage has a 99 percent availability, while Standard Storage has greater than 99.99 percent availability in dual-regions and multiregions and 99.99 percent in regions.

### Data Lifecycle Management 

When assessing the application design and cost implications of business requirements, consider how to manage storage costs. Storage options lie on a spectrum from short-term to archival storage.

- Memorystore is a cache, and data should be kept in cache only if it is likely to be used by an application in the very near future. The purpose of this storage is to reduce the latency of accessing data.

  Caches are not durable. Data stored in Memorystore can disappear at any time. Only data that can be retrieved from another source or regenerated should be stored in a cache.

- Databases, like *CloudSQL* and *Firestore*, store data that needs to be persistently stored and readily accessed by an application or user. Data should be stored in the database when it could possibly be queried or updated. When data is no longer required to be queried or updated, it can be exported and stored in object storage.

- In the case of *time-series databases*, data may be aggregated by larger time spans as time goes on. For example, an application may collect performance metrics every minute. After three days, there is no need to query to the minute level of detail, and data can be aggregated to the hour level. After one month, data can be aggregated to the day level. This incremental aggregation will save space and improve response times for queries that span large time ranges.

- *Object storage* is often used for unstructured data and backups. Standard Storage class should be used for frequently accessed data. If data is accessed at most once a month, then Nearline storage can be used. When data is not likely to be accessed more than once in 90 days, then Coldline storage should be used. Archive storage is appropriate for objects that are not accessed more than once per year.

## Systems Integration and Data Management

Business requirements can give information that is useful for identifying dependencies between systems and how data will flow through those systems.

### Systems Integration Business Requirements

One of an architect's responsibilities is to ensure that systems work together. Business requirements will not specify technical details about how applications should function together, but they will state what needs to happen to data or what functions need to be available to users.

Let's review examples of systems integration considerations in the case studies. These are representative examples of system integration considerations; it is not an exhaustive list.

#### EHR Healthcare Systems Integration 

The EHR Healthcare Systems case study notes that there are several legacy file and API-based integrations with insurance providers that will be replaced over the next several years. The existing systems will not be migrated to the cloud. This is an example of a rip-and-replace migration strategy.

Even though the existing systems will not be migrated, new cloud-native systems will be developed. As an architect working on that project, you would consider several challenges, including the following:

- Understanding the volume and types of data exchanged
- Deciding how to authenticate service requests
- Encrypting data at rest and in transit
- Managing encryption keys
- Decoupling services to accommodate spikes in service demand
- Designing ingestion and data pipelines
- Monitoring and logging for service performance as well as security
- Using multiregion storage and compute resources for high availability while operating within any regulations that put constraints on where data may be stored and processed

In addition to these technical design issues, the architect and business sponsors will need to determine how to retire existing on-premises systems while bringing the new systems online without disrupting services.

### Data Management Business Requirements 

In addition to using business requirements to understand which systems need to work together, architects can use those requirements to understand data management business requirements. At a minimum, data management considerations include the following:

- How much data will be collected and stored?
- How long will it be stored?
- What processing will be applied to the data?
- Who will have access to the data?

### Privacy Regulations 

- Regulations placed on data are often designed to ensure privacy and protect the integrity of data.
  - **Health Insurance Portability and Accountability Act (HIPAA)** 
  - **General Data Protection Regulation (GDPR)**
  - **Gram-Leach-Bliley Act (GLBA) - specifying privacy protections for consumers' nonpublic financial information.**

- Protected data should be encrypted before transmitting it to cloud applications and databases. Data should also be encrypted when stored. This is sometimes called **encrypting *data in transit/motion* and *data at rest*.**

- Networks and servers should be protected **with firewalls and other measures to limit access to servers that process protected data**. With Google Cloud, architects and developers can take advantage of the **Cloud Identity-Aware Proxy** to verify a user's identity in the context of a request to a service and determine whether that operation should be allowed.

- Security best practices should be used as well. This includes following the ***principle of least privilege***, so users and service accounts have only the permissions that are required to carry out their responsibilities. 
- Also practice ***defense in depth***. That principle assumes any security control may be compromised, so systems and data should be protected with multiple different types of controls.

### Data Integrity Regulations 

- are designed to protect against fraud
  - ***Sarbanes-Oxley (SOX) Act***

## Security

- *Information security*, also known as infosec and cybersecurity

## Success Measures

- Two common ways to measure progress and success are **key performance indicators** and **return on investment.**

### Key Performance Indicators 

- KPIs are a measurable value of some aspect of the business or operations that indicates how well the organization is achieving its objectives.

### Return on Investment 

- ROI is a way of measuring the monetary value of an investment. 
- ROI is expressed as a percentage, and it is based on the value of some aspect of the business after an investment when compared to its value before the investment.
- ROI = [( value of invesment -cost of investment) / cost of investment] * 100



# Chapter 3: Designing Solutions to Meet Technical Requirements

## High Availability

- is the continuous operation of a system at sufficient capacity to meet the demands of ongoing workloads. 
- Availability is usually measured as a percent of time that a system is available and responding to requests with latency not exceeding some certain threshold.

**Availability SLAs and corresponding downtimes**

| Percent Uptime | Downtime/Day      | Downtime/Week      | Downtime/Month |
| :------------- | :---------------- | :----------------- | :------------- |
| 99.00          | 14.4 minutes      | 1.68 hours         | 7.31 hours     |
| 99.90          | 1.44 minutes      | 10.08 minutes      | 43.83 minutes  |
| 99.99          | 8.64 seconds      | 1.01 minutes       | 4.38 minutes   |
| 99.999         | 864 milliseconds  | 6.05 seconds       | 26.3 seconds   |
| 99.9999        | 86.4 milliseconds | 604.8 milliseconds | 2.63 seconds   |

When designing high availability applications, you have to plan for failures. Failures can occur at multiple points in an application stack:

- An application bug
- A service that the application depends on is down
- A database disk drive fills up
- A network interface card fails
- A router is down
- A network engineer misconfigures a firewall rule

- We can mitigate the risk of hardware failures, in part, with ***redundancy***. 
- Instead of writing data to one disk, we write it to three disks. 
- Rather than have a single server running an application, we create instance groups with multiple servers and load balance workload among them. 
- We install two direct network connections between our data center and the GCP—preferably with two different telecommunication vendors. 
- Redundancy is also a key element of ensuring scalability, but it also requires autohealing or other automated repair mechanisms to ensure continued availability.

- As you design systems with an eye for high availability, keep in mind the role of **redundancy** and **best practices for software development and DevOps.**

### Compute Availability 

#### High Availability in Compute Engine 

##### Hardware Redundancy and Live Migration 

- the large number of physical servers in the GCP provide redundancy for hardware failures. If a physical server fails, others are available to replace it.
- Google also provides *live migration*, which moves VMs to other physical servers when there is a problem with a physical server or scheduled maintenance occurs. Live migration is also used when network or power systems are down, security patches need to be applied, or configurations need to be modified.

##### Managed Instance Groups 

- High availability also comes from the use of redundant VMs.
- *Managed instance groups* are the best way to create a cluster of VMs, all running the same services in the same configuration.
- A managed instance group uses an *instance template* to specify the configuration of each VM in the group. Instance templates specify machine type, boot disk image, and other VM configuration details. If a VM in the instance group fails, another one will be created using the instance template.
- Managed instance groups (MIGs) provide other features that help improve availability. A VM may be operating correctly, but the application running on the VM may not be functioning as expected. Instance groups can detect this using an application-specific health check. If a VM instance fails the health check, the managed instance group will kill the failing instance and create a new instance. This feature is known as *autohealing*

- Managed instance groups use load balancing to distribute workload across instances. If an instance is not available, traffic will be routed to other servers in the instance group. Instance groups can be configured as regional instance groups. This distributes instances across multiple zones. If there is a failure in a zone, the application can continue to run in the other zones.

##### Multiple Regions and Global Load Balancing 

- Beyond the regional instance group level, you can further ensure high availability by running your application in multiple regions and using a global load balancer to distribute workload. This would have the added advantage of allowing users to connect to an application instance in the closest region, which could reduce latency. You would have the option of using the *HTTP(S)*, *SSL Proxy*, or *TCP Proxy* load balancers for global load balancing.

#### High Availability in Kubernetes Engine 

- *Kubernetes Engine* is a managed Kubernetes service that is used for container orchestration. Kubernetes is designed to provide highly available containerized services. High availability in GKE *Kubernetes clusters* comes both from Google's technical processes and from the design of Kubernetes itself.

#### High Availability in App Engine and Cloud Functions 

- *App Engine* and *Cloud Functions* are fully managed compute services. Users of these services are not responsible for maintaining the availability of the computing resources. The Google Cloud Platform ensures the high availability of these services.
- App Engine and Cloud Functions applications and functions may fail and leave the application unavailable. This is a case where the software engineering and DevOps best practices can help improve availability.

#### High Availability Computing Requirements in Case Studies 

### Storage Availability 

#### Availability of Object, File, and Block Storage 

- ***Cloud Storage*** is a fully managed object storage service. Google maintains high availability of the service. As with other managed services, users do not have to do anything to ensure high availability.
- ***Cloud Filestore*** is another managed storage service. It provides filesystem storage that is available across the network. High availability is ensured by Google.
- ***Persistent disks* (PDs)** are SSDs and hard disk drives that can be attached to VMs. These disks provide block storage so that they can be used to implement filesystems and database storage. Persistent disks continue to exist even after the VMs shut down. One of the ways in which persistent disks enable high availability is by supporting online resizing.

Persistent disks are further categorized by performance characteristics into several types:

- Zonal standard PDs, which are efficient and reliable block storage devices up to 64 TB
- Regional standard PDs, which are like zonal standard PDs but replicated across two zones in a region
- Zonal balanced PDs, which have higher IOPS (input/output operations per second) rates than standard PDs
- Regional balanced PDs, which are like zonal balanced PDs but replicated across two zones in a region
- Zonal SSD PDs, which have higher IOPS rates than balanced or standard PDs
- Regional SSD PDs, which are like zonal SSD PDs but replicated across two zones in a region
- Zonal extreme PDs, which are the highest-performance block storage option

#### Availability of Databases 

- ##### Self-Managed Databases 

##### Self-Managed Databases 

- When running and managing a database, you will need to consider how to maintain availability if the database server or underlying VM fails. Redundancy is the common approach to ensuring availability in databases. How you configure multiple database servers will depend on the database system you are using.

PostgreSQL employs several methods for enabling failover, including the following:

- ***Shared disk***, in which case multiple databases share a disk. If the primary server fails, the standby starts to use the shared disk.
- ***Filesystem replication***, in which changes in the master server filesystem are mirrored on the failover server's filesystem.
- ***Synchronous multimaster replication***, in which each server accepts writes and propagates changes to other servers.

##### Managed Databases 

- GCP offers several managed databases. All have high availability features.

- Fully managed and serverless databases, such as *Cloud Firestore* and *BigQuery*, are highly available, and Google attends to all of the deployment and configuration details to ensure high availability.
- The database servers that require users to specify some server configuration options, such as Cloud SQL and *Bigtable*, can be made more or less highly available based on the use of regional replication. 

#### Availability of Caching 

- Caching is the practice of storing data in low-latency storage to improve application or database performance.
- Cloud Memorystore is a high availability cache service in Google Cloud that supports both Memcached and Redis.

### Network Availability 

 There are two primary ways to improve network availability:

- Use redundant network connections

  - *Redundant network connections* can be used to increase the availability of the network between an on-premises data center and Google's data center.

    **Dedicated Interconnect** 

    - which can be used with a minimum of 10 Gbps throughput and does not traverse the public internet

    **Partner Interconnect** 

    - you provision a network link between your data center and a Google network point of presence. 
    - Traffic flows through a telecommunication provider's network from your data center to Google Cloud's network. Traffic does not travel over the internet.

    **VPN**

    - VPNs can also be used when sending data over the internet is not a problem. You should choose among these options based on cost, security, throughput, latency, and availability considerations. 
    - Google Cloud offers a high availability VPN, known as HA VPN, which uses redundant connections and offers a 99.99 percent SLA.

- Use Premium Tier networking

	**Premium Network Tier**

    - Data within the GCP can be transmitted among regions using Google internal network
    - Note, if you plan to use global load balancing, you will need to use Premium Tier networking.
  
  **Standard Network Tier**
  
    - Data within the GCP can be transmitted among regions using public internet

## Scalability

- *Scalability* is the process of adding and removing infrastructure resources to meet workload demands efficiently.

Different kinds of resources have different scaling characteristics.

- VMs in a managed instance group scale by adding or removing instances from the group.
- Kubernetes scales *pods* based on load and configuration parameters.
- NoSQL databases scale horizontally, but this introduces issues around consistency.
- Relational databases can scale horizontally, but that requires server clock synchronization if strong consistency is required among all nodes.
  - *Cloud Spanner* uses the *TrueTime service*, which depends on atomic clocks and GPS signals to ensure a low, upper bound on the difference in time reported by clocks in a distributed system.

#### Scaling Compute in Compute Engine 

**scaling out or scaling up** 

- Adding VMs to a managed instance group

- When adding a VM to a managed instance group, the application running on the VM will take some time to initialize. This is known as the **cooldown period**. Autoscalers will use data from VMs in a cooldown period for scale-in decisions but not scale-out decisions. By default, the cooldown period is **60 seconds**, but that can be changed.

**scaling in or scaling down** - 

- Removing VMs from a managed instance group

- When scaling in, the autoscaler considers the peak load during the previous 10 minutes, which is known as the **stabilization period**. The autoscaler ensures there are enough VMs to meet the peak load during the stabilization period.
- Abrupt scale-in events can increase application latency. You can control scale-in operations by specifying a maximum allowed reduction in VMs within a specified time period known as the **trailing time window**. The trailing time window is the time window the autoscaler monitors for making scaling decisions. The autoscaler does not resize below the peak size less the maximum allowed reduction in VMs.
- Before a VM is removed from a group, it can optionally run a shutdown script to clean up. The shutdown script is run on a best-effort basis.

Autoscaling can be configured to scale based on several attributes, including the following:

- Average CPU utilization
- HTTP load balancing utilization
- Customer monitoring metrics

#### Scaling Compute in Kubernetes Engine 

### Scaling Storage Resources 

- Zonal and *regional persistent disks* and *persistent SSDs* can currently scale up to **64 TB** per VM instance.

**Standard disks** 

- have a maximum sustained read *IO operations per second (IOPS)* of 0.75 per gigabyte and write IOPS of 1.5 per gigabyte.

**Persistent SSDs** 

- have a maximum sustained read and write IOPS of 30 per gigabyte.

- are well suited for large-volume batch processing when low-cost and high-storage volume are important

- when running a database on a VM, persistent SSDs are the better option.

## Reliability

- *Reliability* is a measure of the likelihood of a system being available and able to meet the needs of the load on the system. 

### Measuring Reliability 

- Total system uptime is one measure. 

- The number of requests that are successfully responded to is a good basis for measuring reliability.

- *Successful request rate* is the percentage of all application requests that are successfully responded to. This measure has the advantage of being easy to calculate and of providing a good indicator for the user experience.

### Reliability Engineering 

As an architect, you should consider ways to support reliability early in the design stage. This should include the following:

- *Identifying how to monitor services*. Will they require custom metrics?
- *Considering alerting conditions*. How do you balance the need for early indication that a problem may be emerging with the need to avoid overloading DevOps teams with unactionable alerts?
- *Using existing incident response procedures with the new system*. Does this system require any specialized procedures during an incident? For example, if this is the first application to store confidential, personally identifying information, you may need to add procedures to notify the information security team if an incident involves a failure in access controls.
- *Implementing a system for tracking outages and performing post-mortems* to understand why a disruption occurred.

# Chapter 4: Designing Compute Systems

### Compute Engine 

- *Compute Engine* is Google's i**infrastructure-as-a-service (IaaS)**
- Running virtual machines (VMs) in Google Cloud Platform is also known as an **instance.**

##### Machine Types and Service Accounts 

- Instances are provisioned by specifying *machine types*, which are differentiated by the number of CPUs and the amount of memory allocated to the instance. 

- When creating an instance, you also specify a boot image. You can choose from a set of predefined boot images, or you can create your own based on one of the predefined boot images. 

The type of disk should be decided based on the workload you will be running on the VM.

- **Standard persistent disks** are efficient and reliable block storage used for large data processing workloads that use sequential I/Os.
- **Balanced disks** are cost-effective and reliable block storage. SSD persistent disks are fast and reliable and balance cost and performance. These devices have the same maximum IOPS as SSD persistent disks but lower IOPS per GB. These are often used with general-purpose applications loads.
- **SSD persistent disks** provide low latency and high IOPS typically used in applications that require single-digit millisecond latencies, such as databases.
- **Extreme persistent disks** provide high performance for workloads that have both sequential and random access patterns. IOPS are user configurable. These devices are used for high-performance applications such as SAP HANA.

##### Sole-Tenant VMs 

- If you need to ensure that your VMs run only on physical servers with other VMs from the same project, you can select *sole tenancy* when provisioning instances. When specifying a sole-tenant VM, you will specify node affinity labels. Node affinity labels are used to group nodes and schedule VMs on specific nodes.

#####  

##### Standard VMs 

- continue to run until you shut them down or there is a failure in the VM

##### Preemptible VMs

- are available at 60 percent to 91 percent discounts off the cost of standard VMs

- will run up to 24 hours before it is shut down by GCP

##### Spot VMs

- are a newer version of preemptible VMs

- Both have a similar pricing model, but Spot VMs are not automatically shut down after 24 hours

##### Shielded VMs 

*Shielded VMs* are instances with enhanced security controls, including the following:

- **Secure boot**
  - runs only software that is verified by digital signatures of all boot components using UEFI firmware features.
- **vTPM  (Virtualizing the Trusted Platform Module)**
  - is a virtual module for storing keys and other secrets.
- **Integrity monitoring**
  - compares the boot measurements with a trusted baseline and returns true if the results match and false otherwise.

##### Confidential VMs

- Confidential VMs encrypt data in use

#### Instance Groups 

- *Instance groups* are clusters of VMs that are managed as a single unit

**Managed instance groups (MIGs)**

- contain identically configured instances.
- the configuration is specified in an instance template

**Unmanaged instance groups** 

- are groups of VMs that may not be identical.
- they are not provisioned using an instance template

**Instance template** - defines a machine type, disk image or container image, network settings, and other properties of a VM.

**MIGs provide several advantages, including the following:**

- Maintaining a minimal number of instances in the MIG. If an instance fails, it is automatically replaced.
- Autohealing using application health checks. If the application is not responding as expected, the instance is restarted.
- Distribution of instances across a zone. This provides resiliency in case of zonal failures.
- Load balancing across instances in the group.
- Autoscaling to add or remove instances based on workload.
- Auto-updates, including rolling updates and canary updates.
- **Rolling updates** will update a minimal number of instances at a time until all instances are updated.
- **Canary updates** allow you to run two versions of instance templates to test the newer version before deploying it across the group.

### App Engine 

- *App Engine* is a serverless PaaS compute offering. 
- With App Engine, users do not have to configure servers since it is a fully managed service
- App Engine resources are regional, and GCP deploys resources redundantly across all zones in a region.
- App Engine includes the *App Engine Cron Service*, which allows developers to schedule tasks to run at regular times or intervals.
- App Engine provides *Task Queues* to support operations that need to run asynchronously or in the background. Task Queues can use either a push or pull model. Task Queues are well suited for distributing tasks. If you need a publish/subscribe-type messaging service, then *Cloud Pub/Sub* is a good option.

#### App Engine Standard 

- *App Engine Standard* is a PaaS product that allows developers to run their applications in a serverless environment.
- App Engine Standard is a good option when you have an application that is written in one of the supported languages and needs to scale rapidly up or down, depending on traffic.

App Engine Standard provides the following language-specific runtime environments:

- Go
- Java
- PHP
- Node.js
- Python
- Ruby

#### App Engine Flexible 

- *App Engine Flexible* allows developers to customize their runtime environments by using Dockerfiles.

- App Engine Flexible instances are based on Compute Engine VMs so you can use SSH for debugging and deploy custom Docker containers. 

- With App Engine Flexible you can specify CPU and memory configurations. 

- App Engine Flexible is a good choice when applications are run within a Docker container. 

- App Engine Flexible scales, but startup time of instances is on the order of minutes, not seconds. It is also a good choice when your application uses microservices, when it depends on custom code, or when libraries are not available in App Engine Standard.

  These instances provide additional features to what is provided by Compute Engine, including the following:

  - Health checks and autohealing
  - Automatic updates to the operating system
  - Automatically colocate a project's VM instances for performance
  - Weekly maintenance operations including restarts and updates
  - Ability to use root access

By default, the App Engine Flexible environment supports the following:

- Go
- Java 8
- .NET
- Node.js
- PHP 5/7
- Python 2.7 and Python 3.6
- Ruby

**The following are the key differences between running containers in App Engine Flexible and running them in Compute Engine:**

- App Engine Flexible containers are restarted once per week.
- By default, SSH access is disabled in an App Engine Flexible container, but you can enable it. SSH access is enabled by default in Compute Engine.
- Images in App Engine Flexible are built using the *Cloud Build* service. Images run in Compute Engine may use the Cloud Build service, but it is not necessary.
- The geographic location of App Engine Flexible instances is determined by project settings, and all App Engine Flexible instances are colocated for performance.

### Cloud Functions 

- *Cloud Functions* is a serverless compute service well suited for event processing. 

- The service is designed to respond to and execute code in response to events within the Google Cloud Platform. 
- For example, if an image file is uploaded to Cloud Storage, a Cloud Function can execute a piece of code to transform the image or record metadata in a database. Similarly, if a message is written to a Cloud Pub/Sub topic, a Cloud Function may be used to operate on the message or invoke an additional process.

- Cloud Functions supports several runtimes, including Node.js, Python 3, Go, Java 11, .NET Core, Ruby, and PHP.

- Cloud Functions uses three components: **events, triggers, and functions**. 
  - An *event* is an action that occurs in the GCP
  - A trigger in Cloud Functions is a specification of how to respond to an event. 

- Cloud Functions does not work with all possible events in the cloud platform; instead, it is designed to respond to several kinds of events:

  - Cloud Storage
  - Cloud Pub/Sub
  - HTTP
  - Cloud Firestore
  - Firebase
  - Cloud Logging

  For each kind of event, there are different actions to which a Cloud Function can respond.

  - *Cloud Storage* has upload, delete, and archive events.
  - *Cloud Pub/Sub* recognizes message publishing events.
  - *HTTP events* have five actions: `GET`, `POST`, `PUT`, `DELETE`, and `OPTIONS`.
  - *Cloud Firestore* supports events on document create, update, delete, and write operations.
  - *Firebase* is a mobile application development platform that supports database triggers, remote configuration triggers, and authentication triggers.
  - When a message is written to *Cloud Logging*, you can have it forwarded to Cloud Pub/Sub, and from there you can trigger a call to a cloud function.

#### Cloud Functions Use Cases

- A Cloud Function is used for event-driven processing. 

- The code is run in response to a triggering event, like a file being updated in Cloud Storage or a message written to a Cloud Pub/Sub topic. 

  Here are some specific use cases that demonstrate the range of uses for Cloud Functions:

  - When an image is uploaded to a particular Cloud Storage bucket, a function verifies the image file type and converts to the preferred file type if needed.
  - When a new version of code is uploaded to a code repository, trigger on a webhook and execute a function that sends a message to other developers who are watching changes to the code.
  - When a user of a mobile app initiates a long-running operation, write a message to a Cloud Pub/Sub queue and trigger a function to send a message to the user informing them that the operation will take several minutes.
  - When a background process completes, write a message to a Cloud Pub/Sub queue and trigger the execution of a function that sends a message to the initiator of the process notifying them that the operation finished.
  - When a database administrator authenticates to a Firebase database, trigger the execution of a function that writes a message to an audit log and sends a message to all other administrators informing them someone has logged in as an administrator.

### Cloud Run 

- Cloud Run is a Google Cloud service for running stateless containers.

- Cloud Run is available as a managed service or within Anthos. When using the managed service, you pay per use and can have up to 1,000 container instances by default. 

- You can allow unauthorized access to services running in Cloud Run, or you can use an **Identity-Aware Proxy (IAP)** to limit access to authorized clients.

### Kubernetes Engine (K8s)

- is a managed service providing *Kubernetes cluster management* and *Kubernetes container orchestration*. 

- allocates cluster resources, determines where to run containers, performs health checks, and manages VM lifecycles using Compute Engine instance groups. 

  Key services provided by Kubernetes include the following:

  - Service discovery
  - Load balancing
  - Storage allocation
  - Automated rollouts and rollbacks
  - Placement of containers to optimize use of resources
  - Automated detection and correction with self-healing
  - Configuration management
  - Secrets management

##### Kubernetes Clusters from an Infrastructure Perspective 

- The *cluster master* runs four core services that are part of the control plane: 

  **Controller Manager**

  - runs services that manage Kubernetes abstract components, such as deployments and replica sets.

  **API server** 

  - Applications interacting with the Kubernetes cluster make calls to the master using the *API server*
  - The API server also handles intercluster interactions.

  **Scheduler** 

  -  is responsible for determining where to run pods, which are low-level compute abstractions that support containers.

  **Etcd**

  - is a distributed key-value store used to store state information across a cluster.

##### Kubernetes Clusters from a Workload and Kubernetes Abstraction Perspective 

Kubernetes introduces abstractions that facilitate the management of containers, applications, and storage services. Some of the most important are the following:

- Pods
  - are the smallest computation unit managed by Kubernetes. 
  - Pods contain one or more containers. 
- Services
  -  is an abstraction with a stable API endpoint and stable IP address that is used to expose an application running on a set of pods. 
  - A service keeps track of its associated pods so that it can always route calls to a functioning pod.
- ReplicaSets
  - A *ReplicaSet* is a controller that manages the number of pods running for a deployment.
- Deployments
  - *Deployments* are a type of controller consisting of pods running the same version of an application. Each pod in a deployment is created using the same template, which defines how to run a pod. The definition is called a *pod specification*.
- Persistent Volumes
  - *PersistentVolumes* is Kubernetes' way of representing storage allocated or provisioned for use by a pod. 
  - Pods acquire access to persistent volumes by creating a *PersistentVolumeClaim*, which is a logical way to link a pod to persistent storage.
- StatefulSets
  - Kubernetes uses the *StatefulSet* abstraction, which is like a deployment. StatefulSets are used to designate pods as stateful and assign a unique identifier to them.
- Ingress
  - An *Ingress* is an object that controls external access to services running in a Kubernetes cluster. 
  - An Ingress Controller must be running in a cluster for an Ingress to function.
- Node pools
  - *Node pools* are sets of nodes in a cluster with the same configuration and a common *node label*

#### Kubernetes Engine Types of Clusters 

There are two modes of operation in Kubernetes Engine: 

**Standard** 

- In standard mode you have the most flexibility and control over the configuration of the cluster, including the infrastructure. 

**Autopilot**

- In autopilot mode, GKE provides a preconfigured provisioned and managed cluster. 
- Autopilot mode clusters are always regional and use VPC-native network routing. 
- With autopilot mode you will not have to manage compute capacity or manage the health of pods. Nodes and node pools are managed by GKE. 
- When using autopilot, you pay only for CPU, memory, and storage that pods use while running.

#### Kubernetes Networking 

Three kinds of IP addresses are supported in Kubernetes.

- ClusterIP, which is an IP address assigned and fixed to a service
- Pod IP, which is an ephemeral IP address assigned to a pod
- Node IP, which is an IP address assigned to a node in a cluster

##### Service Networking 

**ClusterIP** 

- which exposes a service on the internal IP network and makes the service reachable only from within the cluster.

**NodePort**

- SA NodePort serviceType exposes the service on a node's IP address at a static port specified as NodePort in the configuration. External clients can reach the service by specifying the node IP address and the NodePort.

**LoadBalancer**

- A LoadBalancer service exposes a service outside the cluster using a cloud provider load balancer. When a LoadBalancer service type is used, a NodePort and ClusterIP service are created automatically, and the load balancer routes traffic to them.

##### Load Balancing in Kubernetes Engine 

**External load balancers** 

- are used when a service needs to be reachable from outside the cluster and outside the VPC. GKE will provision a network load balancer for the service and configure firewall rules to allow connections to the service from outside the cluster.

**Internal load balancers** 

- are used when a service needs to be reachable from within the cluster. In this case an internal TCP/UDP load balancer is used. The load balancer uses an IP address from the VPC subnet instead of an external IP address.

**HTTP(S) load balancers**

- To allow HTTP(S) traffic from outside the VPC, we use a Kubernetes Ingress resource. The Ingress maps URLs and hostnames to services in the cluster. Services are configured to use both ClusterIP and NodePort service types.



#### Kubernetes Engine Use Cases 

- **Kubernetes Engine** is a managed service that relieves users of managing their own Kubernetes cluster.
- If you prefer to minimize system administration overhead, you could deploy containers using **App Engine Flexible**. 
- **Cloud Run** is an option if you are running stateless containers and do not require Kubernetes features, such as node pools. 

## Anthos

- Anthos is an application management platform that builds on Kubernetes' hybrid and multicloud implementations.

- Anthos is an application management platform that builds on Kubernetes' hybrid and multicloud implementations.

## AI and Machine Learning Services

- **Vertex AI** is a unified machine learning platform for developing, deploying, and scaling machine learning models. 
- **Cloud TPUs** are accelerators for training large deep learning networks. 

### Vertex AI

- Vertex AI is the combination of two prior Google Cloud services, AutoML and AI Platform. Vertex AI provides a single API and user interface. Vertex AI supports both customer training of machine learning models and automated training of models using AutoML. Vertex AI includes several components, such as the following:
  - Training using both AutoML automated training and AI custom training
  - Support for ML model deployment
  - Data labeling, which allows you to request human assistance in labeling training examples for supervised learning tasks
  - Feature store, which is a repository for managing and sharing ML features
  - Workbench, which is a Jupyter notebook-based development environment
- Vertex AI also includes specially configured deep learning VM images and containers.

### Cloud TPU 

- Cloud TPU is a Google Cloud service that provides access to Tensor Processing Units (TPUs), which are custom-designed, application-specific integrated circuits (ASICs) designed by Google. 
- TPUs can be more efficient at training deep learning models than GPUs or CPUs.

## Data Flows and Pipelines



### Cloud Pub/Sub Pipelines 

- Cloud Pub/Sub is a good option for buffering data between services. It supports both push and pull subscriptions.

- With a **push subscription**, message data is sent by HTTP POST request to a push endpoint URL. The push model is useful when a single endpoint processes messages from multiple topics. It's also a good option when the data will be processed by an App Engine Standard application or a Cloud Function. Both of those services bill only when in use, and pushing a message avoids the need to check the queue continually for messages to pull.

- With a **pull subscription**, a service reads messages from the topic. This is a good approach when processing large volumes of data and efficiency is a top concern.

### Cloud Dataflow Pipelines 

- *Cloud Dataflow* is an implementation of the Apache Beam stream processing framework. 
- Cloud Dataflow is fully managed, so you do not have provision and manage instances to process data in streams. 
- The service also operates in batch mode without changes to processing code. Developers can write stream and batch processing code using Java, Python, and SQL.

### Cloud Dataproc 

- Cloud Dataproc is a managed Spark and Hadoop service that is widely used for large-scale batch processing and machine learning. 
- Spark also supports stream processing. 
- Cloud Dataproc creates clusters quickly so they are often used ephemerally. 
- Cloud Dataproc clusters use Compute Engine virtual machines and can use preemptible instances as worker nodes.

- Cloud Dataproc has built-in integration with BigQuery, Bigtable, Cloud Storage, Cloud Logging, and Cloud Monitoring.

### Cloud Workflows 

- Cloud Workflows is a service for orchestrating HTTP-based API services and serverless workflows. 
- It can be used with Cloud Functions, Cloud Run, and other Google Cloud APIs to string together a set of processing steps.
- Workflows are defined as a series of steps specified in YAML or JSON formats. 

### Cloud Data Fusion 

- Cloud Data Fusion is a managed service based on the CDAP data analytics platform that allows for development of extraction, transformation, and load (ETL) and extraction, load, and transform (ELT) pipelines without coding. 

- CDAP provides a code-free, drag-and-drop development tool that includes more than 160 prebuilt connectors and transformations.

  **Cloud Data Fusion is deployed as an instance and comes in three versions.**

  **Developer version** 

  - is the lowest cost and most limited in terms of features. 
  
  **The Basic Edition** 

  - includes a visual design, transformations, and an SDK. 
  
  **The Enterprise edition** 
  
    - includes those features plus streaming pipelines, integration with a metadata repository, high availability, as well as support for triggers and scheduling.

# Chapter 5: Designing Storage Systems

### Cloud Storage FUSE (Filesystem in Userspace)

-  is a framework for exposing a filesystem to the Linux kernel. ****

- is an open source adapter that allows users to mount Cloud Storage buckets as filesystems on Linux and macOS platforms.

### Storage Tiers 

#### **Standard storage** 

- is well suited for use with frequently accessed (“hot”) data or for data that is stored briefly.

Types:

**Region** - stores multiple copies of an object in multiple zones in one region

**Dual-region and Multiregion storage** mitigate the risk of a regional outage by storing replicas of objects in two or multiple regions, respectively

#### Nearline Storage

- Data that is accessed less than once in 30 days

#### Coldline Storage

-  Data that is accessed less than once in 90 days

#### Archive storage

- is optimal for data accessed less than once per 

### Cloud Storage Use Cases 

- Storage of data shared among multiple instances that does not need to be on persistent attached storage. For example, log files may be stored in Cloud Storage and analyzed by programs running in a Cloud Dataproc Spark cluster.
- Backup and archival storage, such as persistent disk snapshots, backups of on-premises systems, and data kept for audit and compliance requirements but not likely to be accessed.
- As a staging area for uploaded data. For example, a mobile app may allow users to upload images to a Cloud Storage bucket. When the file is created, a Cloud Function could trigger to initiate the next steps of processing.

## Network-Attached Storage with Google Cloud Filestore

**Cloud Filestore** is a network-attached storage service that provides a filesystem that is accessible from Compute Engine and Kubernetes Engine.

### Cloud Filestore Service Tiers 

- Filestore provides for snapshots of the filesystem, which can be taken periodically. If you need to recover a filesystem from a snapshot, it would be available within 10 minutes.

Cloud Filestore has three service tiers.

**Filestore Basic** 

- is designed for file sharing, software, and Google Kubernetes Engine workloads that benefit from a persistent, managed filesystem. 
- Filestore Basic is a zonal resource.

**Filestore High Scale** 

- is designed to meet the demands of high-performance computing workloads, such as genome analysis and financial services applications requiring low-latency file operations. 
- Filestore High Scale is a zonal resource.

**Filestore Enterprise** 

- is for mission-critical applications and Google Kubernetes Engine workloads. 
- This version provides 99.99 percent regional availability by provisioning multiple NFS shares across multiple zones within a region.

# Chapter 6: Designing Networks

**Open Systems Interconnection (OSI) 7 layers**

- **Layer 1, Physical**, represents the physical base of the network, including cables, radio frequency, voltages, and other aspects of the physical implementation of networking.
- **Layer 2, Data Link**, handles data transfer between two nodes in a network as well as error correction for the physical layer. Layer 2 has two sublayers, Media Access Control (MAC) and Logical Link Control (LLC). Switches often, but not always, operate at layer 2.
- **Layer 3, Network**, manages packet forwarding using routers. The IP protocol exists at layer 3.
- **Layer 4, Transport**, controls data transfer between systems. This layer manages how the amount of data is sent and where to send it. The Transmission Control Protocol (TCP) and the User Datagram Protocol (UDP) operate at layer 4.
- **Layer 5, Session**, manages sessions or interactions over time between applications. The handshake portion of Transport Layer Security (TLS) operates at layer 5.
- **Layer 6, Presentation**, manages the mapping from application representations to network representations. Encryption and decryption of network traffic is performed at layer 6.
- **Layer 7, Application**, is the top layer of the OSI network model. Layer 7 provides functionality for applications, like web browsers, to access lower-level network services.

### IP Address Structure

**IPv4**

- uses four octets, such as 192.168.20.10. 
- 32bit address

**IPv6**

- uses eight 16-bit blocks, such as FE80:0000:0000:0000:0202:B3FF:FE1E:8329.
- 128bit address

### Public vs. Private Addressing 

**Private addresses**

- **10.0.0.0/8:** 10.0.0.0 to 10.255.255.255 | 16,777,216 addresses
- **172.16.0.0/12:** 172.16.0.0 to 172.31.255.255 | 1,048,576 addresses
- **192.168.0.0/16:** 192.168.0.0 to 192.168.255.255 | 65,536 addresses

### Firewall Rules 

- control network traffic by blocking or allowing traffic into (ingress) or out of (egress) a network, subnet, or device

**2 implied firewall rules are defined with VPCs:** 

- **blocks all incoming traffic,** 
- **allows all outgoing traffic.**

**4 default rules assigned to the default network in a VPC**

- **default-allow-internal** allows ingress connections for all protocols and ports among instances in the network.
- **default-allow-ssh allows** ingress connections on TCP port 22 from any source to any instance in the network. This allows users to ssh into Linux servers.
- **default-allow-rdp** allows ingress connections on TCP port 3389 from any source to any instance in the network. This lets users use Remote Desktop Protocol (RDP) developed by Microsoft to access Windows servers.
- **default-allow-icmp** allows ingress ICMP traffic from any source to any instance in the network.

**Firewall rules have several attributes in addition to priority. They are as follows:**

- **The direction of traffic:** This is either ingress or egress.
- **The action:** This is either allow or deny traffic.
- **The target:** This defines the instances to which the rule applies.
- **The source:** This is for ingress rules or the destination for egress rules.
- **A protocol specification:** This includes TCP, UDP, or ICMP, for example.
- **A port number:** A communication endpoint associated with a process.
- **An enforcement status:** This allows network administrators to disable a rule without having to delete it.

### Cloud Router 

- A router is device or service that connects multiple networks and enables communication between those networks. 
- Routers may be implemented as physical devices, such as a rack-mounted appliance in a data center, or as a software-defined network service, which is the case with Google Cloud's Cloud Router.

- Cloud Router uses the Border Gateway Protocol (BGP) to advertise IP address ranges to other networks and builds customer dynamic routes based on IP address information it receives from other BGP peers. 

**Cloud Router provides routing services for the following:**

- **Dedicated Interconnect**
- **Partner Interconnect**
- **HA VPN**
- **Supported router appliances**

### Cloud Armor 

- is a layer 7 web application firewall (WAF) designed to mitigate distributed denial-of-service (DDoS) attacks and prevent other unwanted access to applications, such as cross-site scripting and SQL injection attacks. 
- The preconfigured rules include protection against the Open Web Application Security Project (OWASP) Top 10 threats.

## Virtual Private Clouds

- VPCs are like a network in a data center; they are network-based organizational structures for controlling access to GCP resources. 
- VPCs organize Compute Engine instances, App Engine Flexible instances, and GKE clusters. \
- They are global resources, so a single VPC can span multiple regions.

### Shared VPC 

- A Shared VPC is a way to connect resources from multiple projects to a common VPC network using private IP addresses. Shared VPCs have one host project and one or more service projects. 
- The host project and service project must be in the same organization with one exception for service projects during migrations, in which case the service project may be in a different organization.

### VPC Network Peering 

- VPC network peering enables different VPC networks to communicate using private IP address space, as defined in RFC 1918.
-  VPC network peering is used as an alternative to using external IP addresses or using VPNs to link networks.
- VPC network peering works with Compute Engine, App Engine Flexible Environment, and Google Kubernetes Engine.
- peered networks manage their own resources, such as firewall rules and routes. 
-  there is a maximum of 25 peering connections from a single VPC.

**The following are three primary advantages of VPC network peering:**

- There is lower latency because the traffic stays on the Google network and is not subject to conditions on the public internet.
- Services in the VPC are inaccessible from the public internet, reducing the attack surface of the organization.
- There are no egress charges associated with traffic when using VPC network peering.

## Hybrid-Cloud Networking

- is the practice of providing network services between an on-premises data center and a cloud. 

Architects also need to understand when to use different network topologies. Some common topologies are as follows:

- **Mirrored topology:** In this topology, the public cloud and private on-premises environments mirror each other. This topology could be used to set up test or disaster recovery environments.
- **Meshed topology:** With this topology, all systems within all clouds and private networks can communicate with each other.
- **Gated egress topology:** In this topology, on-premises service APIs are made available to applications running in the cloud without exposing them to the public internet.
- **Gated ingress topology:** With this topology, cloud service APIs are made available to applications running on premises without exposing them to the public internet.
- **Gated egress and ingress topolog**y**:** This topology combines gated egress and gated ingress.
- **Handover topology:** In this topology, applications running on premises upload data to a shared storage service, such as Cloud Storage, and then a service running in GCP consumes and processes that data. This is commonly used with data warehousing and analytic services.

### Hybrid-Cloud Implementation Options 

#### Cloud VPN

- *Cloud VPN* is a GCP service that provides virtual private networks between GCP and on-premises networks. 

- Cloud VPN tunnel supports up to 3 Gbps

- Cloud VPN is implemented using IPSec VPNs and is available in two types, HA VPN and Classic VPN

  **HA VPN** 

  - provides an IPSec VPN connection with 99.99 percent availability. 
  - HA VPN uses two connections to provide high availability. Each connection has its own external IP address. 
  - HA VPN gateways support multiple tunnels. It is possible to configure an HA VPN with just one active gateway, but that does not meet requirements for the 99.99 percent availability SLA.

  **Classic VPN** 

  - uses one network interface and one external IP address and provides 99.9 percent availability.

#### Cloud Interconnect 

- service provides high throughput and highly available networking between GCP and on-premises networks. 

**Dedicated Interconnect**.
- is available in 10 Gbps or 100 Gbps 
- configurations when using a direct connection between a Google Cloud access point and your data center

**Partner Interconnect**

- using a third-party network provider
- customers have the option of configuring 50 Mbps to 50 Gbps connections.

**The advantages of using Cloud Interconnect include the following:**

- You can transmit data on private connections. Data does not traverse the public internet.
- Private IP addresses in Google Cloud VPCs are directly addressable from on-premises devices. There is no need for NAT or a VPN tunnel.
- You have the ability to scale up Dedicated Interconnects to 80 Gbps using eight 10 Gbps direct interconnects or 200 Gbps using two 100 Gbps interconnects.
- You have the ability to scale up Partner Interconnects to 80 Gbps using eight 10 Gbps partner interconnects.

#### Direct Peering

- **Network peering** is a network configuration that allows for routing between networks.

**Direct peering** 

- is a form of peering that allows customers to connect their networks to a Google network point of access. 
- This kind of connection is not a GCP service—it is a lower-level network connection that is outside of GCP. 
- It works by exchanging Border Gateway Protocol (BGP) routes, which define paths for transmitting data between networks. 
- It does not make use of any GCP resources, like VPC firewall rules or GCP access controls.

### Global Load Balancing 

#### Network TCP/UDP

- The *Network TCP/UDP load balancer* distributes workload based on IP protocol, address, and port. 
- This load balancer uses forwarding rules to determine how to distribute traffic

- is a nonproxied load balancer, which means that it passes data through the load balancer without modification. 

#### Internal TCP/UDP

- The *Internal TCP/UDP load balancer* is the only internal load balancer. 
- It is used to distribute traffic from GCP resources, and it allows for load balancing using private IP addresses. 
- It is a regional load balancer.

#### HTTP(S) Load Balancing

- The *HTTP(S) load balancer* is used when you need to distribute HTTP and HTTPS traffic globally, or at least across two or more regions.

#### SSL Proxy Load Balancing 

- The *SSL Proxy load balancer* terminates SSL/TLS traffic at the load balancer and distributes traffic across the set of backend servers.

#### TCP Proxy Load Balancing 

- *TCP Proxy Load Balancing* lets you use a single IP address for all users regardless of where they are on the globe, and it will route traffic to the closest instance.
- TCP Proxy Load Balancing load balancers should be used for non-HTTPS and non-SSL traffic.

## Additional Network Services

### Service Directory 

- is a managed service for centralizing information about your services. 
- it manages metadata about services by allowing you to publish, discover, and connect to services. 
-  is essentially an endpoint registry.

### Cloud CDN 

- is a content delivery network managed by Google Cloud. 
- provides the means to distribute content across the globe in ways to minimize latency when accessing that data.
- works with external HTTP(S) Load Balancing. The load balancer provides a public IP address while the CDN backend is responsible for providing content.
- Cloud CDN content can come from several sources, including Compute Engine instance groups, zonal network endpoint groups, App Engine, Cloud Run, Cloud Functions, and Cloud Storage.

### Cloud DNS 

-  is a managed global domain name service used to publish domain names.

# Chapter 7: Designing for Security and Legal Compliance

## Identity and Access Management and Related Access Control Services

** Identity and Access Management (IAM)**

- service is designed to allow you to specify what operations specific users can perform on particular resources. 
- This is also described as specifying “who gets to do what on which resources.”

The first step to understanding IAM is to understand the abstractions used. The primary elements of IAM are as follows:

- **Identities and groups**
- **Resources**
- **Permissions**
- **Roles**
- **Policies**

#### Identities 

- An *identity* is an entity that represents a person or other agent that performs actions on a GCP resource.

-  Identities are sometimes called *members*. 

**There are several kinds of identities:**

- **Google account**
  - are used by people and represent people who interact with GCP, such as developers and administrators. 
  - These accounts are designated by an email address that is linked to a Google account. 
  - For example, `jane.doe@gmail.com`could be an identity in GCP. 
  - The domain of the email does not have to be `gmail.com`; it just has to be associated with a Google account.
- **Service account**
  - are used by applications running in GCP.
  - are used to give applications their own set of access controls instead of relying on using a person's account for permissions. 
  - are also designated by email addresses. 
- **Cloud Identity domain**
  - is an (IDaaS) offering]
  - Users who do not have Google accounts or G Suite accounts can use the Cloud Identity service to create an identity. 
  - It will not be linked to a Google account, but it will create an identity that can be used when assigning roles and permissions.

### Resources

- *Resources* are entities that exist in the Google Cloud platform and can be accessed by users. 

- Resources is a broad category that essentially includes anything that you can create in GCP. 

**Resources include the following:**

- Projects
- Virtual machines
- App Engine applications
- Cloud Storage buckets
- Pub/Sub topics

### Permissions 

- A *permission* is a grant to perform some action on a resource. Permissions vary by the type of resource with which they are associated.

Here are some examples of other permissions used by Compute Engine:

- `compute.instances.get`
- `compute.networks.use`
- `compute.securityPolicies.list`

Here are some permissions used with Cloud Storage:

- `resourcemanager.projects.get`
- `resourcemanager.projects.list`
- `storage.objects.create`

### Roles 

- *Roles* are sets of permissions. 
- One of the most important things to remember about IAM is that administrators grant roles, not permissions, to identities. 
- You cannot grant a permission directly to a user—you must grant it by assigning a role to an identity.

There are three types of roles.

**Predefined**

- *Predefined roles* are created and managed by GCP. 

- The roles are organized around groups of tasks commonly performed when working with IT systems, such as administering a server, querying a database, or saving a file to a storage system. 

  Roles have names such as the following:

  - `roles/bigquery.admin`
  - `roles/bigquery.dataEditor`
  - `roles/cloudfunction.developer`
  - `roles/cloudsql.viewer`

**Basic**

- GCP did not always have the IAM service. 

- Before IAM was released, permissions were grouped into a set of three roles that are now called **basic roles**, and previously these were known as **primitive roles**.

  **Viewer**

  - The *Viewer role* grants a user read-only permission to a resource. 
  - A user with a Viewer role can see but not change the state of a resource.

  **Editor**

  - The *Editor role* has all the capabilities of the Viewer role and can also modify the state of the resource.

  **Owner**

  - The *Owner role* includes the capabilities of the Editor role and can also manage roles and permissions for the resource to which it is assigned. 

**Custom**

- When the predefined roles do not fit a particular set of needs, users of GCP can set up their own roles. These are known as **custom roles**. 

### Policies 

-  is a set of statements that define a combination of users and the roles. This combination of users (or *members* as they are sometimes called) and a role is called a *binding*. 
- Policies are specified using JSON.

In the following example from Google's IAM documentation, the role `roles/storage_objectAdmin` is assigned to four identities, and the `roles/storage_objectViewer` is assigned to one identity—a user with the email [bob@example.com](mailto:bob@example.com):

```
{
 "bindings": [
 {
  "role": "roles/storage.objectAdmin",
  "members": [
  "user:alice@example.com",
  "serviceAccount:my-other-app@appspot.gserviceaccount.com",
  "group:admins@example.com",
  "domain:google.com" ]
},
{
  "role": "roles/storage.objectViewer",
  "members": ["user:bob@example.com"]
}
]
}
Source: cloud.google.com/iam/docs/overview
```

Policies can be managed using the Cloud IAM API, which provides three functions.

- `setIamPolicy` for setting policies on resources
- `getIamPolicy` for reading policies on resources
- `testIamPermissions` for testing whether an identity has a permission on a resource

### Cloud IAM Conditions 

- Cloud IAM Conditions is a feature of IAM that allows you to specify and enforce conditional access controls based on the attributes of a resource. 
- This allows you to grant access to an identity when specified conditions are met. Conditions are defined in resources role bindings.

### IAM Best Practices 

- Favor predefined roles over basic roles. Predefined roles are designed to provide all of the permissions needed for a user or service account to carry out a particular set of tasks.

- Think in terms of *trust boundaries*, which set the scope of where roles and permissions should apply.

### Identity-Aware Proxy 

- Identity-Aware Proxy (IAP) is an application layer (layer 7)–based access control for applications accessed using HTTPS. 
- IAP allows you to define access control policies for applications and resources.

### Workload Identity Federation 

- Workload Identity Federation allows you to use IAM to grant external identities IAM roles. 
- Workload identities are organized into workload identity pools. 

### Encryption

- *Encryption* is the process of encoding data in a way that yields a coded version of data that cannot be practically converted back to the original form without additional information such as a key.

#### Encryption at Rest 

- Google encrypts data at rest by default. 
- You do not have to configure any policy to enable this feature. 
- This applies to all Google data storage services, such as Cloud Storage, Cloud SQL, and Cloud Bigtable. 

**Encryption at rest actually occurs at multiple levels.**
  - At the **platform level**, database and file data is protected using AES256 and AES128 encryption.
  - At the **infrastructure level**, data is grouped into data chunks in the storage system, and each chunk is encrypted using AES256 encryption.
  - At the **hardware level**, storage devices apply AES256 in almost all cases, but as of July 2020, a small number of older persistent disks use AES128 encryption.

**To summarize encryption at rest:**

- Data at rest is encrypted by default in Google Cloud Platform.
- Data is encrypted at multiple levels, including the application, infrastructure, and device levels.
- Data is encrypted in chunks. Each chunk has its own encryption key, which is called a data encryption key.
- Data encryption keys are themselves encrypted using a key encryption key.

#### Encryption in Transit 

- *Encryption in transit*, also called *encryption in motion*, is used to protect the confidentiality and integrity of data in the event that the data is intercepted in transit. 
- GCP uses a combination of authenticating sources and encryption to protect data in transit.
- Google uses **Application Layer Transport Security (ALTS)** for authentication and encryption. This is done at layer 7 of the OSI network model.

#### Cloud KMS Key Management 

- *Cloud KMS* is a hosted key management service in Google Cloud. 
- It enables customers to generate and store keys in GCP. 
- It is used when customers want control over key management but do not need keys to reside on their own key management infrastructure.

#### Customer-Supplied Keys 

- Another alternative for key management is *customer-supplied keys*. 
- Customer-supplied keys are used when an organization needs complete control over key management, including storage.

#### Customer-Managed Encryption Keys 

- Customer-managed encryption keys (CMEKs) are keys that are managed by customers of Google Cloud using Cloud KMS. 
- When using CMEKs, customers have more control over the key lifecycle. 
- Customers using CMEKs can limit Google Cloud's ability to decrypt data by disabling keys. 
- In addition, customers can automatically or manually rotate keys when using CMEKs.

#### Cloud External Key Manager 

- Cloud External Key Manager (Cloud EKM) allows customers to manage keys outside of Google Cloud and set up Cloud KMS to use those externally managed keys.

### Cloud Storage Data Access

- When you create a bucket in Cloud Storage, you can choose to use **uniform** or **fine-grained access**. 

**Uniform bucket-level access** 

- you use only IAM to manage permissions 

**Fine-grained access** 

- enables the use of ACLs along with IAM. 

### Penetration Testing 

- *Penetration testing* is the process of simulating an attack on an information system to gain insights into potential vulnerabilities. 
- Penetration tests are authorized by system owners.

**Penetration testing occurs in these five phases.**

- **Reconnaissance** is the phase at which penetration testers gather information about the target system and the people who operate it or have access to it. This could include phishing attacks that lure a user into disclosing their login credentials or details of software running on their network equipment and servers.
- **Scanning** is the automated process of probing ports and checking for known and unpatched vulnerabilities.
- **Gaining access** is the phase at which the attackers exploit the information gathered in the first two phases to access the target system.
- In the **maintaining access** phase, attackers will do things to hide their presence, such as manipulating logs or preventing attacking processes from appearing in a list of processes running on a server.
- **Removing footprints**, the final phase, involves eliminating indications that the attackers have been in the system. This can entail manipulating audit logs and deleting data and code used in the attack.

### Auditing

- **Auditing** is basically reviewing what has happened on your system. 
- In the case of Google Cloud, there are a number of sources of logging information that can provide background details on what events occurred on your system and who executed those actions.

- **Cloud Audit Logs** is a GCP service that records administrative actions and data operations.

- The logs are saved for a limited period of time. Often, regulations require that audit logs be retained for longer periods of time. 
- Plan to export audit logs from Cloud Audit Logs and save them to Cloud Storage or BigQuery. They can also be written to Cloud Pub/Sub.

Logs are exported from Cloud Logging, which supports the following three export methods:

- JSON files to Cloud Storage
- Logging tables to BigQuery datasets
- JSON messages to Cloud Pub/Sub

## Security Design Principles

As a cloud architect, you will be expected to know security design principles such as separation of duties, least privileges, and defense in depth.

### Separation of Duties 

- **Separation of duties (SoD)** is the practice of limiting the responsibilities of a single individual in order to prevent the person from successfully acting alone in a way detrimental to the organization.

### Least Privilege 

- **Least privilege** is the practice of granting only the minimal set of permissions needed to perform a duty. 
- IAM roles and permissions are fine-grained and enable the practice of least privilege. 

### Defense in Depth 

- **Defense in depth** is the practice of using more than one security control to protect resources and data. 
- For example, to prevent unauthorized access to a database, a user attempting to read the data may need to authenticate to the database and must be executing the request from an IP address that is allowed by firewall rules.

## ITIL Framework

- **ITIL**, which was formerly known as the **Information Technology Infrastructure Library**, 

- is a set of IT service management practices for coordinating IT activities with business goals and strategies. 

ITIL specifies 34 practices grouped into three broad areas.

- **General management practices**, which include strategy, architecture, risk management, security management, and project management
- **Service management practices**, which include business analysis, service design, capacity and performance management, incident management, and IT asset management
- **Technical management practices**, which include deployment management, infrastructure management, and software development management

## Summary

- IAM is used for managing identities, groups, roles, permissions, and related functionality. 

  - Predefined roles are preferred over basic roles in most situations. 
  - Policies are used to associate a set of roles and permissions with a resource.

- Encryption is used to protect data in transit and at rest. 

  - Google Cloud encrypts data at rest by default. 

  - Google Cloud can manage keys, or customers can manage their own keys. 

- It is strongly suggested that you use security best practices, including separation of duties and defense in depth.

## Exam Essentials

**Know the key components of the Identity and Access Management service.** 

**The key components of the IAM service include** 

- identities and groups 

  Identities can be a 

  - Google account, 
  - service account, or a 
  - Cloud Identity account. 
  - Identities can be collected into Google Groups or G Suite groups.

- resources, 

- permissions, 

- roles, and 

- policies. 

- Identities can be a Google account, a service account, or a Cloud Identity account. Identities can be collected into Google Groups or G Suite groups.

**Understand roles are sets of permissions.** 

- Remember that IAM permissions are granted to roles and roles are granted to identities. 
- You cannot grant a permission directly to an identity. 
- Google has created predefined roles that map to common organizational roles, such as administrators, viewers, and deployers. 
  - **Predefined roles** have all of the permissions someone in that organizational role typically needs to perform their duties. 
  - **Custom roles** can also be created if the predefined roles do not fit your needs.

**Basic roles should be used in limited situations.** 

- Basic roles are the owner, editor, and viewer. 
- These roles existed prior to IAM and grant coarse-grained permissions to identities. 
- Basic roles should be used only in cases where users need broad access, such as developers in a development environment. 
- In general, you should favor predefined roles over basic roles or custom roles.

**Resources are entities in GCP that can be accessed by a user. Access is controlled by IAM.** 

- Resources is a broad category that essentially includes anything that you can create in GCP including projects, virtual machines, storage buckets, and Cloud Pub/Sub topics. 
- Permissions vary by type of resource. Cloud Pub/Sub, for example, has permissions related to writing messages to topics and creating subscriptions. 
- Those permissions would not make sense for other types of resources. Some role patterns are used across entity types, such as admin and viewer.

**Policies are used to associate a set of roles and permissions with resources.** 

- A policy is a set of statements that define a combination of users and roles. 
- This combination of users and a role is called a **binding**. 
- Policies are specified using JSON. 
- Policies are used in addition to IAM identity-based access controls to limit access to resources.

**Understand the resource hierarchy.** 

- Organizations are at the top of the hierarchy. 

- Organizations contain folders and projects. 

- Folders can contain other folders as well as projects. 

- Access controls assigned to entities in the hierarchy are inherited by entities lower in the hierarchy. 

- Access controls assigned to an entity do not affect entities higher in the hierarchy.

**Know that Google encrypts data at rest by default.** 

- Data is encrypted at multiple levels. 
  - At the platform level, database and file data is protected using AES256 and AES128 encryption. 
  - At the infrastructure level, data is grouped into data chunks in the storage system, and each chunk is encrypted using AES256 encryption. 
  - At the hardware level, storage devices apply AES256 or AES128 encryption.

**Data at rest is encrypted with a data encryption key (DEK).** 

- The DEK is encrypted with a KEK (Key Encryption Key). Data is encrypted in chunks, and the DEK is kept near the data that it encrypts. 
- The service writing the data has a KEK, which is used to encrypt the DEK. 
- Google manages rotating KEKs.

**Understand how Google encrypts data in transit.** 

- Google distinguishes data in transit on the Google network and data in transit on or over the public internet. 
- Data within the boundaries of the Google network is authenticated but may not be encrypted. 
- Data outside the physical boundaries of the Google network is encrypted.

**Know the three types of key management.** 

- Google provides default key management in which Google generates, stores, and manages keys. 
- With the Cloud KMS Key Management service, customers manage the generation, rotation, and destruction of keys, but the KMS service stores the keys in the cloud. 
- Customer-supplied keys are fully managed and stored on-premises by customers.

**Understand the role of penetration testing and auditing.** 

- Both are forms of security evaluation. 
- The goal of penetration testing is to find vulnerabilities in services by simulating an attack by malicious actors. 
- You do not have to notify Google when you perform penetration testing. 
- The purpose of auditing is to ensure that security controls are in place and functioning as expected.

**Know security best practices, including separation of duties, least privilege, and defense in depth.** 

- Separation of duties is the practice of limiting the responsibilities of a single individual in order to prevent the person from successfully acting alone in a way detrimental to the organization. 
- Least privilege is the practice of granting only the minimal set of permissions needed to perform a duty. 
- Defense in depth is the practice of using more than one security control to protect resources and data.

**Understand how to use security controls to comply with regulations.** 

- Governments and industry organizations have developed rules and regulations to protect the privacy of individuals, ensure the integrity of business information, and make sure that a baseline level of security is practiced by organizations using information technology. 
- Architects should understand the broad requirements of these regulations. Regulations often have common requirements around confidentiality, integrity, and availability.

# Chapter 8: Designing for Reliability

## Improving Reliability with Cloud Operations Suite

Google Cloud Platform offers Cloud Operations Suite, formerly known as **Stackdriver**, a comprehensive set of services for collecting data on the state of applications and infrastructure. Specifically, it supports three ways of collecting and receiving reliability information.

- **Monitoring:** This service is used to help understand performance and utilization of applications and resources.
- **Logging:** This service is used to collect service-specific details about the operations of services.
- **Alerting:** This service is used to notify responsible parties about issues with applications or infrastructure that need attention.

### Monitoring with Cloud Monitoring 

- *Monitoring* is the practice of collecting measurements of key aspects of infrastructure and application performance.

#### Metrics 

- *Metrics* have a particular pattern that includes a property of an entity, a time range, and a numeric value. 

  GCP has defined metrics for a wide range of entities, including the following:

  - GCP services, such as BigQuery, Cloud Storage, and Compute Engine
  - Operating system and application metrics that are collected by Cloud Monitoring agents that run on VMs
  - Anthos metrics, which include Kubernetes and Istio metrics
  - AWS metrics that measure performance of Amazon Web Services resources, such as EC2 instances
  - External metrics including metrics defined in Prometheus, a popular open source monitoring tool

#### Time Series 

- A *time series* is a set of metrics recorded with a time stamp. 
- Often, metrics are collected at a specific interval, such as every second or every minute.

### Alerting with Cloud Monitoring 

- *Alerting* is the process of monitoring metrics and sending notifications when some custom-defined conditions are met. 
- The goal of alerting is to notify someone when there is an incident or condition that cannot be automatically remediated and that puts service-level objectives at risk.

#### Policies, Conditions, and Notifications 

- Alerting policies are sets of conditions, notification specifications, and selection criteria for determining resources to monitor.
- Conditions are rules that determine when a resource is in an unhealthy state. Alerting users can determine what constitutes an unhealthy state for their resources. 
- On the other hand, if the threshold is too low, you may receive notifications for incidents that do not warrant your intervention. These are known as **false alerts**. 

#### Reducing Alerts

- In addition to tuning alerts, reliability can be improved by automatically responding to changes in workload or other conditions.
- Using autoscaling can reduce the number of times notifications are sent about VM resources utilization.

- Instead of running a relational database in Compute Engine to support a data warehouse, you could use BigQuery. In that case, there is no need to monitor servers because it is a serverless product. Of course, there are servers running BigQuery software, but they are managed by Google, which handles monitoring and incident response.

### Logging with Cloud Logging 

- *Cloud Logging* is a centralized log management service. 

- Logs are collections of messages that describe events in a system. 

- Unlike metrics that are collected at regular intervals, log messages are written only when a particular type of event occurs. 

- Cloud Logging provides the ability to store, search, analyze, and monitor log messages from a variety of applications and cloud resources. 

- An important feature of Cloud Logging is that it can store logs from virtually any application or resource, including GCP resources, other cloud resources, or applications running on premises. 

  Here are some examples:

  - If a new user account is added to an operating system and that account is granted root privileges, a log message with details about that account and who created it may be written to an audit log.
  - When a database connection error message is received by an application, the application may write a log message with data about the time and the type of operation that would have been performed.
  - Applications running on the Java virtual machine may need to reclaim memory that is no longer in use. This process is called *garbage collection*. Log messages may be written at the start and end of garbage collection.

### Open Source Observability Tools 

#### Prometheus 

- Prometheus is a monitoring tool that collects metrics data from targets, such as applications, by scrapping HTTP endpoints of target services. 
- The Prometheus project is hosted by the Cloud Native Computing Foundation, which also hosts Kubernetes.

#### Grafana 

- Grafana is an open source visualization tool often used with Prometheus. 
- Grafana queries data from existing data sources rather than importing data into a Grafana-managed data store. 
- Grafana can pull data from monitoring services, relational databases, and time-series databases, as well as other sources.

## Release Management

- *Release management* is the practice of deploying code and configuration changes to environments, such as production, test, staging, and development environments. 
- It is an integral part of *DevOps*, which combines software engineering and system administration efforts.

### Continuous Delivery 

- *Continuous delivery (CD)* is the practice of releasing code soon after it is completed and after it passes all tests. 
- CD is an automated process—there is usually no human in the loop. This allows for rapid deployment of code, but since humans other than the developer do not need to review the code prior to release, there is a higher risk of introducing bugs than there would be if a human were in the loop.

#### Tests 

- A *test* is a combination of input data and expected output. 

These include the following:

**Unit tests**

- A *unit test* is a test that checks the smallest unit of testable code. 
- This could be a function, an API endpoint, or another entry point into a program. 
- Unit tests are designed to find bugs within the smallest unit.

**Integration tests**

- *Integration tests* test a combination of units

**Acceptance tests**

- Unit tests and integration tests help developers ensure that their code is functioning as they expect and want. 
- *Acceptance tests* are designed to assure business owners of the system that the code meets the business requirements of the system.

**Load testing**

- *Load testing* is used to understand how a system will perform under a particular set of conditions.

#### Deployment Strategies 

##### Complete Deployment 

- A *complete deployment* updates all instances of the modified code at once. 
- This was a common practice with teams that used waterfall methodologies. It is still the only option in some cases, for example, in the case of a single server running a monolithic application.

##### Rolling Deployment 

- A *rolling deployment* incrementally updates all servers over a period of time. 
- For example, in a 10-server cluster, a deployment may be released to only one server at first. After a period of time, if there are no problems detected, a second server will be updated. This process continues until all of the servers are updated.

- An advantage of rolling deployments is that you expose only a subset of users to the risk of disruptive code. In this example, assuming a balanced distribution of users, only 10 percent of the users were exposed to the initial deployment. 
- Also, it is generally possible to do a rolling deployment without any service disruptions.

##### Canary Deployment 

- In a *canary deployment*, engineers release new code, but no traffic is routed to it at first. 
- Once it is deployed, engineers route a small amount of traffic to the deployment. As time passes, if no problems are found, more traffic can be routed to the servers with the newly deployed code.

- With a canary deployment, you may want to choose users randomly to route to the new version of code, or you may have criteria for choosing users. 
- A web service that offers a free and paid version of its product may prefer to route free users to new deployments rather than expose paying customers to freshly released code.

##### Blue/Green Deployment 

- A *Blue/Green deployment* strategy uses two production environments, named Blue and Green. 
- They are configured similarly but run different code. At any point in time, one of them (for instance, Green) is the active production environment processing a live workload. 
- The other (in other words, Blue) is available to deploy updated versions of software or new services where those changes can be tested. When testing is complete, workload is shifted from the current environment (Green) to the recently updated environment (Blue).

### Continuous Integration 

- *Continuous integration (CI)* is the practice of incorporating new code into an established code base as soon as it is complete.

**GitHub** is a widely used code repository

**Cloud Source Repository** is Google Cloud's version control system.

**Jenkins** is a widely used CI tool that builds and tests code

**Google Cloud Build** is a GCP service that provides software building services, and it is integrated with other GCP services, such as Cloud Source Repository.

## Summary

- Reliability is a property of systems that measures the probability that a service will be available for a period of time. 
- Several factors contribute to creating and maintaining reliable systems, including monitoring systems using **metrics, logs, and alerts**.

- Continuous integration and continuous delivery are commonly used practices for managing the release of code. These practices reduce risk by emphasizing the frequent release of small changes. The use of automation helps to reduce the risk that a bad deployment will disrupt services for too long.
- Systems reliability engineering is a set of practices that incorporates software engineering practices with operations management. 
- These practices recognize that failures will occur, and the best way to deal with those failures is to set well-defined service-level objectives and service-level indicators, monitor systems to detect indications of failure, and learn from failures using techniques such as post-mortem analysis. 
- Systems should be architected to anticipate problems, such as overloading and cascading failures. Testing is an essential part of promoting highly reliable systems.

## Exam Essentials

**Know the role of monitoring, logging, and alerting in maintaining reliable systems.** 

- Monitoring collects metrics, which are measurements of key attributes of a system, such as utilization rates. 
  - Metrics are often analyzed in a time series. 
- Logging is used to record significant events in an application or infrastructure component. 
- Alerting is the process of sending notifications to human operators when some condition is met indicating that a problem needs human intervention. 
- Conditions are often of the form that a resource measurement exceeds some threshold for a specified period of time.

**Understand continuous delivery and continuous integration.** 

- CI/CD is the practice of releasing code soon after it is completed and after it passes all tests. 
- This allows for rapid deployment of code. 
- Continuous integration is the practice of incorporating code changes into baseline code frequently. Code is kept in a version control repository that is designed to support collaboration among multiple software engineers.

**Know the different kinds of tests that are used when deploying code.** 

- These include unit tests, integration tests, acceptance tests, and load testing. 
  - Unit tests check the smallest unit of functional code. 
  - Integration tests check that a combination of units function correctly together. 
  - Acceptance tests determine whether code meets the requirements of the system. 
  - Load testing measures how well the system responds to increasing levels of load.

**Understand that systems reliability engineering is a practice that combines software engineering practices with operations management to reduce risk and increase the reliability of systems.** 

The core tenets of systems reliability engineering include the following:

- Automating systems operations as much as possible
- Understanding and accepting risk and implementing practices that mitigate risk
- Learning from incidents
- Quantifying service-level objectives and service-level indicators
- Measuring performance

**Know that systems reliability engineering includes design practices, such as planning for overload, cascading failures, and incident response.** 

- Overload is when a workload on a system exceeds the capabilities of the system to process the workload in the time allowed. 

- Ways of dealing with overload include **load shedding**, **degrading service**, and **upstream or client throttling**. 

- Cascading failures occur when a failure leads to an action that causes further failures. 

  - An example is that in response to a failure in a server in a cluster, a load balancer shifts additional workload to the remaining healthy servers, causing them to fail due to overload. 

- Incident response is the practice of controlling failures by using a structured process to identify the cause of a problem, correct the problem, and learn from the problem.

**Know testing is an important part of reliability engineering.** 

- There are several kinds of tests, and all should be used to improve reliability. 
- Testing for reliability includes practices used in CI/CD but adds others as well, particularly stress testing. These tests may be applied outside of the CI/CD process.

# Chapter 9: Analyzing and Defining Technical Processes

## Software Development Lifecycle Plan

- The *software development lifecycle* (*SDLC)* is a series of steps that software engineers follow to create, deploy, and maintain complicated software systems. 

SDLC consists of seven phases.

1. Analysis

2. Design

3. Development

4. Testing

5. Deployment

6. Documentation

7. Maintenance

### Analysis 

-  The purpose of the analysis phase is to do the following:

   - Identify the scope of the problem to address.

   - Evaluate options for solving the problem.

   - Assess the cost benefit of various options.

-  Analysis begins with understanding the problem to be solved.

#### Scoping the Problem to Be Solved

- At this point, the focus is on the business or organizational problem that is to be solved. 
- This requires a combination of domain knowledge about the problem area and software and systems knowledge to understand how to frame a solution.

#### Evaluating Options 

- Once the scope of the problem is decided, you should consider options for solving the problem. 
- There may be multiple ways to address a business need, from modifying an existing system to building a new service from scratch.

- A common question at this stage is, “Should the organization buy a software solution or build one?”
-  *Commercial off-the-shelf software (COTS)* is a term that you may hear to describe existing software solutions.

The advantages of buying software or using a service include the following:

- Faster time to solution since you do not have to build an application.
- Allows developers to focus on other business requirements for which there are no good “buy” options.
- The purchased software or service likely comes with support.

There are disadvantages to buying software, and these can include potentially high licensing costs and the inability to customize the software or service to your specific needs.

#### Cost-Benefit Analysis 

- Another task in the analysis phase is to consider the costs and benefits of undertaking the project as scoped. 
- The *opportunity cost* described earlier is one example of a cost-benefit consideration. In addition to the opportunity cost of software engineers' time, there is also the financial cost of developing an application.

### Design 

- In the design phase, you map out in detail how the software will be structured and how key functions will be implemented. 

The design phase can often be broken into two subphases: high-level design and detailed design.

#### High-Level Design 

- During the *high-level design* phase, the major subcomponents of a system are identified.

#### Detailed Design 

- *Detailed design* focuses on how to implement each of the subcomponents. 

#### Development, Testing, and Deployment 

- During development, software engineers create software artifacts that implement a system. This can include application code, which implements functionality, and configuration files, which specify environment-specific details, such as file locations or environment variables.

#### Documentation 

There are three distinct kinds of documentation with regard to software systems.

Developer documentation

- is designed for software engineers who will be working with code. 

Operations documentation

- consists of instructions used by system administrators and DevOps engineers to deploy and maintain system operations.

User documentation

- explains how to use an application and is often written by technical writers. 

#### Maintenance

- *Maintenance* is the process of keeping software running and up-to-date with business requirements.

- Maintenance includes configuring monitoring, alerting, and logging

## Continuous Integration/Continuous Delivery

- CI/CD is the process of incorporating code into a baseline of software, testing it, and if the code passes tests, releasing it for use.

### CI/CD Building Blocks

CI/CD is a practice that builds on several types of tools, including the following:

- Version control
- Secrets management
- Automated builds
- Deployment pipelines

#### Version Control 

- Version control is the practice of tracking changes to software. 
- The basic idea is that teams of developers need to collaborate on software development, and that requires tools that track changes, enable multiple changes to source code at one time, and allow developers to revert to previous versions of software when needed.

#### Secrets Management 

- We often need to use secrets when working with services in the cloud, including API keys, certificates, passwords, and other data we would not want widely known. 
- An obvious bad practice is hard-coding secrets into application or configuration code.

- Secrets managers like HashiCorp Vault and Google Cloud's Secret Manager are secure storage systems for managing secrets in a secure, centralized service.

#### Deployment Pipelines 

- Modern applications are built using many components, libraries, and modules. 
- Build pipelines automate the process of creating deployable artifacts. 
- Deployment pipelines are used to release previously built artifacts for use. 

## Troubleshooting and Post-Mortem Analysis Culture

- Complicated and complex systems fail, sometimes in ways that we do not anticipate. There are a number of ways to respond to this reality.

- We can extend more effort to ensure that our software is correct

- *Chaos engineering*, which is the practice of introducing failures into a system to better understand the consequences of those failures and identify unanticipated failure modes, is another approach. 

- Netflix's *Simian Army* is a collection of chaos engineering tools that introduce failures at various levels of infrastructure from instances to availability zones.

- There are two types of post-mortems: one for **incidents** and another for **projects**.



### Incident Post-Mortems 

- An *incident* is an event that disrupts a service. 
- An *incident post-mortem* is a review of the causes of an incident, assessment of the effectiveness of responses to the incident, and discussions of lessons learned.



#### Learning from Minor Incidents

- Minor incidents in themselves may not provide much opportunity to learn—at least from a single incident.

- Minor incidents can help you to identify weak spots in your procedures without significant adverse effects on system users.

#### Learning from Major Incidents 

- When a large portion of users is adversely affected by a disruption in service or there is a loss of data, then we are experiencing a major incident. 

### Project Post-Mortems 

- Another type of post-mortem that is sometimes used in software engineering is a *project post-mortem*. 
- These are reviews of a project that review the way work was done. 
- The goal in these post-mortems is to identify issues that might have slowed down work or caused problems for members of the team.

## IT Enterprise Processes

-  One of the most comprehensive sets of IT enterprise practices is known as ITIL.

- **Information Technology Infrastructure Library (ITIL)** is a set of service management practices
- **ISO/IEC 20000** is an international standard for IT service management that is similar to ITIL

The ITIL model is organized around four dimensions.

- **Organizations and people:** This dimension is about how people and groups contribute to IT processes.
- **Information and technology products:** This dimension relates to information technology services within an organization.
- **Partners and suppliers:** These are external organizations that provide information technology services.
- **Value streams and processes:** These are the activities executed to realize the benefits of information technologies.

ITIL also organizes management practices into three groups.

- **General management practices:** These practices include strategy, portfolio, and architecture management.
- **Service management practices:** These practices include business analysis, service catalog management, availability management, and service desk management.
- **Technical management practices:** These practices are related to deployment management, infrastructure and platform management, and software development management.

## Business Continuity Planning and Disaster Recovery

- This is planning for keeping business operations functioning in the event of a large-scale natural or human-made disaster. 
- A part of business continuity planning is planning for operations of information systems throughout, or despite the presence of, disasters. This is called *disaster recovery*.

### Business Continuity Planning 

- It tries to answer the question, “How can we keep the business operating in the event of large-scale disruption of services on which our business depends?” 

- Large-scale disruptions include extreme weather events, such as Category 5 hurricanes, or other disasters, such as 7.0 magnitude or greater earthquakes. 

- These kinds of events can cause major community-scale damage to power, water, transportation, and communication systems. 

To enable business operations to continue in spite of such events requires considerable planning. This includes defining the following:

- **Disaster plan**
  - A *disaster plan* documents a strategy for responding to a disaster. 
  - It includes information such as where operations will be established, which services are the highest priority, what personnel are considered vital to recovery operations, and plans for dealing with insurance carriers and maintaining relationships with suppliers and customers.
- **Business impact analysis**
  - A *business impact analysis* describes the possible outcomes of different levels of disaster.
  - Business impact analysis includes cost estimates as well
- **Recovery plan**
  - The *recovery plan* describes how services will be restored to normal operations.
  - Once key services, such as power and access to physical infrastructure, are restored, business can start to move operations back to their usual location.
- **Recovery time objectives**
  - The recovery plan will also include *recovery time objectives (RTOs)*. 
  - These prioritize which services should be restored first and the time expected to restore them.

### Disaster Recovery 

- *Disaster recovery (DR)* is the subset of business continuity planning that focuses specifically on IT operations. 
- DR starts with planning. 

## Summary

- Cloud architects contribute to and participate in a wide range of technical and business processes. Some are focused on individual developers and small teams. 

- The software development lifecycle is a series of phases developers go through to understand business requirements, plan the architecture of a solution, design a detailed implementation, develop the code, deploy for use, and maintain it.

- Some software development projects can use highly automated CI/CD procedures. This allows for rapid release of features and helps developers catch bugs or misunderstood requirements faster than batch updates that were common in the past.
- As systems become more complicated and fail in unanticipated ways, it is important to learn from those failures. 
  - A post-mortem analysis provides the means to learn from minor and major incidents in a blameless culture.
- Large enterprises with expansive portfolios of software employ additional organization-level processes in order to manage dynamic IT and business environments. 
- ITIL is a well-established set of enterprise practices for managing the general, service, and technical aspects of an organization's IT operations.

- Business continuity planning is the process of preparing for major disruptions in an organization's ability to deliver services. 
- Disaster planning is a subset of business continuity planning and focuses on making IT services available in the event of a disaster.

## Exam Essentials

- **Understand that information systems are highly dynamic and individual developers, teams, businesses, and other organizations use technical processes to manage the complexity of these environments.** 
  - Technical processes have been developed to help individual developers and entire organizations function and operate in a coordinated fashion. 
  - SDLC processes focus on creating, deploying, and maintaining code. 
  - Other processes include CI/CD, post-mortem analysis, and business continuity planning.
- **Know that the first stage of the SDLC is analysis.** 
  - This involves identifying the scope of the problem to address, evaluating options for solving the problem, and assessing the costs/benefits of various options. 
  - Options should include examining building versus buying. 
  - Cost considerations should include the opportunity costs of developers' time and the competitive value of the proposed software development effort.
- **Understand the difference between high-level and detailed design.** 
  - High-level design focuses on major subcomponents of a system and how they integrate. Architecture decisions, such as when to use asynchronous messaging or synchronous interfaces, are made during the high-level design. 
  - Detailed design describes how subcomponents will be structured and operate. This includes decisions about algorithms and data structures. Decisions about frameworks and libraries may be made during either high-level or detailed design.
- **Know the three kinds of documentation.** 
  - Developer documentation is for other software engineers to help them understand application code and how to modify it. 
  - Operations documentation is for DevOps engineers and site reliability engineers (SREs) so that they can keep systems functioning. A runbook is documentation that describes steps to run an application and correct operational problems. 
  - User documentation is for users of the system, and it explains how to interact with the system to have it perform the functions required by the user.
- **Understand the benefits of CI/CD.** 
  - CI/CD is the process of incorporating code into a baseline of software, testing it, and if the code passes tests, releasing it for use. 
  - A key benefit of CI/CD is that new features can be rolled out for use by customers quickly. This may not always be an option. For example, safety-critical software may require substantial testing and validation before it can be changed.
- **Know what a post-mortem is and why it is used.** 
  - Post-mortems are reviews of incidents or projects with the goal of improving services or project practices. 
  - Incidents are disruptions to services. 
  - Major incidents are often the result of two or more failures within a system. 
  - Post-mortems help developers better understand application failure modes and learn ways to mitigate risks of similar incidents. 
  - Post-mortems are best conducted without assigning blame.
- **Understand that enterprises with large IT operations need enterprise-scale management practices.** 
  - Large organizations need ways to manage large numbers of software projects, operational systems, and expanding infrastructures. 
  - Over time, IT professionals have developed good practices for managing information technology systems at an enterprise level. One of the most comprehensive sets of IT enterprise practices is ITIL.
- **Know why enterprises use business continuity planning and disaster recovery planning.** 
  - These are ways of preparing for natural or human-made disasters that disrupt an organization's ability to deliver services. 
  - Disaster planning is a component of business continuity planning. 
  - Disaster planning includes defining the criteria for declaring a disaster, establishing and switching to a DR environment, and having a plan for restoring normal operations. 
  - DR plans should be tested regularly.

# Chapter 10:  Analyzing and Defining Business Processes

## Stakeholder Management

- A stakeholder is someone or some group with an interest in a business initiative. 
- There are many kinds of stakeholders involved with IT projects, including employees, contractors, consultants, project managers, program managers, business process owners, compliance officers, external partners, and vendors. 
- Stakeholder management begins with understanding the relationship between interest and influence, the scope of stakeholder interests, and processes for managing stakeholders.

### Interests and Influence

- Interests describe what a stakeholder wants. 
- Influence describes the stakeholder's ability to get it.



Interests come in several forms, such as the following:

- Financial interests around costs and benefits of an initiative
- Organizational interests, such as the priority in which projects will be funded and completed
- Personnel interests that include assignment of engineers to a project and opportunities for career advancement
- Functional interests, such as another team of engineers who want the new service to include some specific API functions”

### Projects, Programs, and Portfolios

**Project**

- A project is an initiative focused on completing some organizational task. 
- Projects have budgets specifying the funding available for the project. They also have schedules that describe the expected time frame for completing the project. 
- Projects also have resources, which include employees, contractors, and consultants assigned to the project. 

**Programs**

- Programs are initiatives designed to achieve some business goal.

**Porfolios**

- Portfolios are groups of projects and programs that collectively implement a business or organization's strategy.



### Stages of Stakeholder Management

The four basic stages of stakeholder management are as follows:

- Identifying stakeholders
- Determining their roles and scope of interests
- Developing a communications plan
- Communicating with and influencing stakeholders

### Exam Essentials

- Know that stakeholder management involves the interests and influence of individuals and groups who are affected by a project or program.  
  - There are different kinds of stakeholders with varying levels of influence. 
  - Know how to identify stakeholders, discover their interests, and understand how to communicate with them.
  
- Understand that change management is particularly challenging.  
  
    - Change can occur at the individual, team, department, and enterprise levels. 
    
    - Change may be initiated internally or prompted by external factors. 
    
    - One way to manage change is to treat it like a scientific experiment and follow a methodology such as **Plan-Do-Study-Act**.
    
- Know that team skills are a resource that can be managed.  
  - As an architect, you understand the skills needed to execute projects in the corporate portfolio. 
  - You are also able to identify gaps between needed skills and the skills of employees. 
  - Use this knowledge to develop training and to recruit additional team members.
  
- Understand that customer success management is a key business process that may require some architecture consultations.  

    - Early stages of customer success management, such as customer acquisition, marketing, and sales, are not likely to need architecture skills, but later stages, such as professional services engagement and technical support, may benefit from the advice of an architect.

- Know the various aspects of cost management.  

  - The main steps in cost management are resource planning, cost estimating, cost budgeting, and cost control. 
  - Architects may be especially helpful with resource planning and cost estimating, since these require knowledge of how projects serve business strategy and an understanding of the cost of developing services.
  
  ​    


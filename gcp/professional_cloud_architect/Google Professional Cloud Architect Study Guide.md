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
| Cloud Data Fusion        | Data management         | Data integration and ETL tool                                |
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
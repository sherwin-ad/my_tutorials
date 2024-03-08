

# AZ-104 Micrsoft Azure Administrator Practice Exam 

1. A company has a requirement to retain any blob data that might accidentally be deleted. The deleted data needs to be retained for 14 days. From which of the following section of the Storage account would you modify to fulfill this requirement?
   - Lifecycle Management
   - **Soft Delete**
   - Advanced security
   - Firewall and virtual networks

   #### Explanation

   For more information on the soft delete feature, go to:

   https://docs.microsoft.com/en-us/azure/storage/blobs/soft-delete-blob-overview

   https://docs.microsoft.com/en-us/azure/storage/blobs/soft-delete-blob-enable?tabs=azure-portal

2. You have an Azure subscription named Getcloudskillsstaging. Under the subscription, you create a Resource group named Getcloudskillsrg.

   You then create an Azure policy based on the “Not allowed resources types” definition. You define the parameters as Microsoft.Network. virtual networks as the not allowed resource type. You assign this policy to the Tenant Root Group. A Virtual Network does not already exist in this subscription.

   Would you be able to create a virtual machine in the Getcloudskillsrg Resource group?

   - **No**
   - Yes

   #### Explanation

   Since the policy is applied to the Tenant Root Group, it would be applied to all subscriptions and Resource groups. If you need to create a virtual machine, you must have permission to create virtual network resources required for VM provisioning. Hence the policy restricts the creation of the Vnet resources. You wouldn't be able to create a new VM in this resource group.

   For more information on creating Azure Policies, go to:

   https://docs.microsoft.com/en-us/azure/governance/policy/overview

3. What does Azure DNS allow you to do?

   - Register new domain names, removing the need to use a domain registrar.
   - **Manage and host your registered domain and associated records.**
   - Manage the security and access to your website.

   

4. What kind of account would you create to allow an external organization easy access?

   - An external account for each member of the external team.
   - An administrator account for each member of the external team.
   - **A guest user account for each member of the external team.**

5. A company has the following resource groups defined as part of its Azure subscription:

   ![img](images/2022-01-21_14-30-05-24dac65072337cd080edf3c1dd17092f.png)

   The following virtual machines are then created in the subscription:

   ![img](images/2022-01-21_14-30-06-2a5a022e0ed6856064a48db01d4c09b3.png)

   The Recovery Services vault is located in West Europe in the rg-gsc-01 Resouce Group.

   The company wants to ensure that as many virtual machines as possible are backed up using the Recovery Services Vault.

   Which of the following virtual machines can be backed up using the Recovery Services vault?

   - VMGCS1 and VMGCS3 only
   - VMGCS3 and VMGCS6 only
   - All of them
   - **VMGCS1, VMGCS3 VMGCS4 and VMGCS6 only**
   - VMGCS1 only

   #### Explanation

   The Recovery Services vault and the virtual machine need to be in the same region. This condition is fulfilled by VMGCS1, VMGCS3 VMGCS4 and VMGCS6 only.

   For more information on backing up Azure virtual machines using the Azure backup feature, go to:

   https://docs.microsoft.com/en-us/azure/backup/backup-azure-vms-first-look-arm

6. Your company has the following resources deployed to Azure:

   ![img](images/2022-01-30_18-28-47-f5ba8a80b505c0a6178f697385ecdd61.png)

   You install a DNS service on virtual machine getcloudskillsvm1.

   The DNS server settings are then configured for each virtual network, as shown below:

   ![img](images/2022-01-30_18-28-48-0c6a02867b14ec30f834faffa749656f.png)

   You have to ensure that all virtual machines in your vnet can resolve DNS names by using the DNS service on the virtual machine getcloudskillsvm1. Which of the following would you implement for this requirement?

   - Add service endpoints for the virtual network getcloudskillsnetwork2 and getcloudskillsnetwork3.
   - Configure a conditional forwarder for the getcloudskillsvm1 virtual machine.
   - Add a service endpoint for the virtual network getcloudskillsnetwork1.
   - **Configure virtual network peering connections between all virtual networks.**

   #### Explanation

   Since the networks are isolated from each other, you still need to ensure that the machines can communicate across the virtual networks. This can be accomplished with the help of virtual network peering connections.

   For more information on virtual network peering connections, go to:

   https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview

   

7. A company is planning to deploy an application to a set of Virtual Machines in an Azure network. The company needs to have an SLA of 99.999% for the application hosted on the Virtual machines. Which of the following should be implemented to guarantee an SLA of 99.999% on the infrastructure level?

   - Assign a standard public IP address to the virtual machines.
   - Deploy single virtual machines across multiple regions.
   - **Deploy the virtual machines in an availability zone across multiple regions**
   - Make the virtual machines part of an availability set.

   #### Explanation

   For more information on availability zones, go to:

   https://docs.microsoft.com/en-us/azure/availability-zones/az-overview

   

8. A new Network interface named Secondary has been created. The Network interface needs to be added to the Virtual machine. What must be done first in order to ensure that the network interface can be attached to the Virtual Machine?

   - The public IP needs to be deallocated from the primary network interface

   - **The machine needs to be stopped first**

   - The primary network interface needs to be removed

     

9. Users are reporting that when they attempt to access myapps.microsoft.com, they are prompted multiple times to sign in and are forced to use an account name that ends with onmicrosoft.com. You discover that there is a UPN mismatch between Azure AD and the on-premises Active Directory. You need to ensure that the users can use single-sign-on (SSO) to access Azure resources. What should you do first?

   - From the on-premises network, request a new certificate that contains the Active Directory domain name.
   - From the on-premises network, deploy Active Directory Federation Services in a clustered environment.
   - From the server that runs Azure AD Connect, modify the filtering options.
   - **From Azure AD, add and verify a custom domain name.**

   

10. A company has set up a Load balancer that load balances traffic on ports 80 and 443 across 3 virtual machines. You have to ensure that all RDP traffic is directed towards a VM named getcloudskillsvm. How would you achieve this?

    - By creating a new IP configuration

    - **By creating an inbound NAT rule**

    - By creating a new internal load balancer for getcloudskillsvm

    - By creating a new public load balancer for getcloudskillsvm

      

11. Which Azure Service is the centralized spot for all Activity Logs, Metrics, Alerts, and Diagnostics for all resources across your subscription?

    - Azure Stream Analytics

    - Azure Log Analytics

    - **Azure Monitor**

    - Event Hub

      

12. A company is planning to deploy a set of virtual machines across different system tiers.

    The following requirement needs to be met:

    \- Incoming requests to the Business Logic tier (50 VMs that are not accessible from the internet) from the web servers (5 VMs that are accessible from the internet) need to be spread equally across the virtual machines.

    Which of the following would you implement?

    - A Public Load Balancer
    - An application gateway that uses the WAF tier
    - A network security group
    - An application gateway that uses the Standard tier
    - **An Internal Load Balancer**

    #### Explanation

    The Business Logic Tier has the requirement of NOT being accessible from the Internet. This means we should spin up an Internal Load Balancer.

    ![img](images/2022-01-31_18-57-37-3f7d88e6e6b7fbc4b4efe168e340c245.png)

    For more information on the Azure Load Balancer, go to:

    https://docs.microsoft.com/en-us/azure/load-balancer/concepts-limitations

    

13. You create an App Service plan B1 for your web app. You want Azure to be able to add up to 10 VM instances to run your app automatically during the highest traffic on your site.

    What are two configuration options you should implement to achieve your goal in the most cost-effective way?

    - Scale up the service plan to P1
    - **Scale up the service plan to S1**
    - Scale out the service plan to S1
    - **Scale-out based on a metric**
    - Scale out the service plan to P1
    - Scale out based on a schedule
    - Scale up based on a metric
    - Scale up based on a schedule

    

14. True or false: Microsoft ExpressRoute is a virtual networking technology that operates over the public Internet that allows secure, scalable access to Microsoft Azure services while ensuring performance, security, and reliability.

    - **False**
    - True

    #### Explanation

    ExpressRoute operates over a private network, not the Internet. You must connect through a communications service provider to arrange a private direct connection.

    

15. Which of the following network watcher feature would you use for the following requirement?

    *Find out if there is outbound connectivity between an Azure virtual machine and an external host.*

    - Traffic Analytics
    - **Connection Monitor**
    - Next Hop
    - IP Flow Verify

    

16. Your company has an Azure subscription. In the subscription, you create an Azure file share named **share1**. You also create a shared access signature (SAS) named **SASdemo** as shown in the following exhibit:

    ![img](images/2022-01-16_14-35-18-1370627955aa17a9b96be096cd4ff417-1709287519575-11.png)

    If you run Microsoft Azure Storage Explorer on a computer that has an IP address of 193.77.134.1, and you use **SASdemo** to connect to the storage account, then you...

    - will be prompted for the credentials.
    - will have read, write and list access.
    - **will have no access.**
    - will have read-only access.

    #### Explanation

    Since the IP address is not in the valid IP address range defined by the SAS, you will be denied access.

    For more information on Shared access signatures, go to:

    https://docs.microsoft.com/en-us/azure/storage/common/storage-dotnet-shared-access-signature-part-1

    

17. You need to allow traffic onto certain FQDN’s via the Azure Firewall. Which of the following rules would you create for this requirement?

    - NAT collections rules

    - Network collection rules

    - **Application collection rules**

    - FQDN collection rules

      

18. A company has an Azure AD tenant. They have users that are also synced with their on-premise environment. Getcloudskillsusr1 has the Reports Reader role assigned.

    The administrator has enabled self-service password reset (SSPR) for all users.

    \- The administrator has enabled the following SSPR settings:

    \- Number of methods required to reset – 2

    \- Methods available to users – Mobile phone and Security questions

    \- Number of questions to register – 3

    \- Number of questions to reset – 3

    The following security questions are chosen:

    \- In what city was your first job?

    \- What was the name of the first school you attended?

    Would Getcloudskillsusr1 be required to answer the security question “In what city was your first job?” to reset their password?

    - No
    - **Yes**

    #### Explanation

    Yes, here, since SSPR has been enabled for all users, the user would need to answer the security-related question to reset their password.

    For more information on how password reset works, visit the following URL:

    https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-sspr-howitworks

    

19. You have created a storage account named Getcloudskills. You have created a file share named demo using the file service. You need to ensure that users can connect to the file share from their home computers. Which of the following port should be open to ensure connectivity?

    - 80
    - 3389
    - **445**
    - 443
    
20. Your company goes ahead and registers a domain name of demodomain.com. You then go ahead and create an Azure DNS zone named demodomain.com. You then add an A record to the zone for a host named www that has an IP address of 123.10.9.143. But the users complain that they cannot resolve the URL www.demodomain.com to 123.10.9.143. This issue needs to be resolved.

    You propose a solution to modify the name server at the domain registrar.

    Would this solution resolve the issue?

    - **Yes**
    - No

    #### Explanation

    If you create a DNS zone in Azure, then you need to first make a note of the Name servers for the DNS zone. Then go to your DNS provider and enter the Name servers for your Domain.

    

21. A company has an Azure subscription that contains the following Resource Groups:

    ![img](images/2022-01-15_16-25-16-f3d62300a311718b835fc6e0567bf297.png)

    The Resource Group **Getcloudskills-rg1** contains the following resources:

    ![img](images/2022-01-15_16-26-03-38498fe5b8c44bb6dd2a0038581f5349.png)

    Would you be able to move the resource **Getcloudskillsstor** from the Resource Group **Getcloudskills-rg1** to **Getcloudskills-rg2?**

    - No
    - **Yes**

    #### Explanation

    We would be able to move the resource **Getcloudskillsstor** from the resource group **Getcloudskills-rg1** to **Getcloudskills-rg2**. The storage account **Getcloudskillsstor** has a Delete lock. It means that we can't delete this resource without removing the lock. But this lock doesn't prevent us from moving a resource from one resource group to another. The current **Getcloudskillsstor** Resource Group doesn't have any locks. The destination resource group **Getcloudskills-rg2** similarly to the Storage account has a Delete lock. This lock prevents the deletion of this Resource Group and all resources within it. But it doesn't restrict the movement of the resources to this group from other groups.

    For more information on Resource locks, go to:

    https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources

    

22. You create Azure AD administrative units for the subsidiaries of your organization. Each of the subsidiaries includes several hundred employees. You need to add these employees as administrative unit members. Select the tool you can use to achieve your goal.

    - Microsoft Office Admin center
    - Microsoft Graph
    - **Azure AD Portal**
    - PowerShell
    - Azure CLI

    #### Explanation

    Microsoft Office Admin center, Microsoft Graph, and PowerShell are incorrect because the Microsoft Office Admin center, Microsoft Graph, and PowerShell can manage individual users in the administrative units but not the list of the users in a bulk manner.

    Azure CLI is incorrect because the Azure CLI does not have the functionality to create and manage administrative units.

    For more information about the management of the Azure AD Administrative Units, visit the below URLs:

    https://docs.microsoft.com/en-us/azure/active-directory/roles/administrative-units

    https://docs.microsoft.com/en-us/azure/active-directory/roles/admin-units-add-manage-users

    

23. You have defined an autoscale condition with four autoscale rules. The first rule scales out when the CPU utilization reaches 70 percent. The second rule scales back in when the CPU utilization drops below 50 percent. The third rule scales out if memory occupancy exceeds 75 percent. The fourth rule scales back in when memory occupancy falls below 50 percent. When will the system scale out?

    - When CPU utilization reaches 70 percent, **and** memory occupancy exceeds 75 percent
    - You can't do this with a single autoscale condition. An autoscale condition can only contain autoscale rules that use the same metric
    - **When CPU utilization reaches 70 percent, or memory occupancy exceeds 75 percent**

    

24. Your company has an Azure AD tenant named getcloudskills.com.

    The following user is part of the tenant:

    \- Getcloudskillsusr1 is a User administrator.

    The following VM is part of the tenant:

    \- Getclouskillsvm1 is a Windows 10 device that is AAD registered.

    The following group is part of the tenant:

    \- Getcloudskillsgroup1 is a Dynamic Device group, Getcloudskillsusr1 is an owner of that group.

    Would user Getcloudskillsusr1 be able to add device Getclouskillsvm1 to group Getcloudskillsgroup1?

    - Yes
    - **No**
    
25. In order to use ARM templates in automation, what other file is usually required besides the ARM template JSON file itself?

    - A .PS1 PowerShell script file

    - **No other files are required. But a parameter JSON file would be used if the template had parameters as inputs.**

    - The parameter XML file

    - The parameter JSON file

    - A .SH file to contain the Shell Script in CLI

      

26. A company has the following App Service Plans defined as part of their Azure subscription:

    \- Plan1 runs Linux in East US.

    \- Plan2 runs Windows in East US.

    \- Plan 3 runs Windows in UK South.

    The company is planning on deploying the following Azure Web App Instances:

    \- App1 runs on runtime stack .Net Core 3.1 in East us.

    \- App2 runs on runtime stack ASP.NET v4.7 in East us.

    Which of the following App service plans can you use for App1?

    - **Plan1 and Plan2 only**
    - Plan2 only
    - Plan1 only
    - Plan2 and Plan 3 only
    - Plan1, Plan2 and Plan 3

    #### Explanation

    If we need to deploy App1 in the East US region, we need to choose the App Service Plan in the same region. The Web App and the App Service Plan need to be located in the same region.

    There are two plans in the East US region: Plan1 and Plan2. You can deploy a .Net Core application on either a Windows OS or a Linux OS.

    For more information on the Linux App Service Plan, go to:

    https://docs.microsoft.com/en-us/azure/app-service/overview-hosting-plans

    https://docs.microsoft.com/en-us/azure/app-service/app-service-plan-manage

    https://docs.microsoft.com/en-us/azure/app-service/containers/app-service-linux-intro

    

27. A company has an Azure subscription and an Azure tenant named getcloudskills.onmicrosoft.com. Getcloudskillsusr1 has Global Administrator permissions in Azure Active Directory.

    The user getcloudskillsusr1 creates a new directory named staging.getcloudskills.onmicrosoft.com. New users need to be added to the new tenant. The company asks getcloudskillsusr1 to create user accounts.

    Would this fulfill the requirement?

    - No
    - **Yes**

    #### Explanation

    Getcloudskillsusr1 has the Global Administrator role and has created the new directory. The user would have the required permissions to create new users in the directory.

    For more information on creating a new directory, please visit:

    https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-access-create-new-tenant

    

28. Which of the following needs to be implemented on the Azure virtual network to deploy the Azure Bastion Host?

    - Enable DDoS protection for the virtual network.
    - Add a new address space.
    - **Add a new subnet.**
    - Add a service endpoint.

    #### Explanation

    For more information about deploying an Azure Bastion, go to:

    https://docs.microsoft.com/en-us/azure/bastion/bastion-create-host-portal

    

29. Your company needs to deploy an application to a set of three virtual machines. You have to ensure that two virtual machines are always available in the event of a data center failure at any point in time.

    You decide to deploy the virtual machines as part of an Availability Set.

    Would this fulfill the requirement?

    - **No**
    - Yes

    #### Explanation

    Availability sets can’t protect virtual machines from a data center-level failure. Availability zones protect VMs from data center failure.

    You need to distribute your virtual machines across three Availability Zones.

    For more information on Availability sets, go to:

    \- https://docs.microsoft.com/en-us/azure/virtual-machines/windows/manage-availability

    \- https://social.technet.microsoft.com/wiki/contents/articles/51828.azure-vms-availability-sets-and-availability-zones.aspx

    

30. Your company runs its Azure virtual machines in an availability set. All of the websites are running in the same availability set. They do this to increase the availability of their application when planned or unplanned outages happen. What is the maximum number of fault domains (FD) and update domains (UD) that your application can be spread across?

    - 2 FD and 5 UD
    - 20 FD and 3 UD
    - 2 FD and 10 UD
    - Unlimited FD and UD
    - **3 FD and 20 UD**

    

31. A company has started using Azure and set up a subscription. They want to see the costs being incurred for each type of resource. Which of the following can help you get these details?

    - Go to your Azure AD directory and go to Licences.
    - Go to your Subscription and go to Resource Groups.
    - Go to your Azure AD directory and go to Cost Analysis.
    - **Go to your Subscription and go to Cost Analysis.**

    #### Explanation

    If you go to your subscription, look at the Cost Analysis, you can see a breakdown of each resource's costs.

    The Cost Analysis section for the Subscription allows you to see all the costs. Hence all other options are incorrect.

    For more information on Cost Analysis, go to: https://docs.microsoft.com/en-us/azure/cost-management/quick-acm-cost-analysis

    

32. Select all true statements that apply to the use of Azure Disk Encryption (ADE) for Windows Azure VM disk protection.

    - **ADE encrypted VM can be backed up to the Recovery Service Vault.**
    - ADE uses DM-Crypt for Windows VM-controlled disks.
    - ADE can use Azure Key Vault and Azure Recovery Service Vault from different Azure regions.
    - ADE encrypts all data at rest and in transit.
    - **ADE is integrated with Azure Key Vault.**
    - ADE supports the encryption of Basic tier VM's.
    - **ADE uses BitLocker for Windows VM-controlled disks.**
    - **ADE uses DM-Crypt for Linux-based VMs.**

    #### Explanation

    For more information about the Azure Disk Encryption, go to:

    https://docs.microsoft.com/en-us/azure/security/fundamentals/azure-disk-encryption-vms-vmss

    https://docs.microsoft.com/en-us/learn/modules/secure-your-azure-virtual-machine-disks/2-encryption-options-for-protecting-windows-and-linux-vms

    

33. You have set up a computer named getcloudskillsclient1 that has a point-to-site VPN connection to an Azure virtual network named getcloudskillsnetwork. The point-to-site connection makes use of a self-signed certificate. You now have to establish a point-to-site VPN connection to the same virtual network from another computer named getcloudskillsclient2. The VPN client configuration package is downloaded and installed on the getcloudskillsclient2 computer.

    You decide to join the getcloudskillsclient2 computer to Azure AD.

    Would this fulfill the requirement?

    - **No**
    - Yes

    #### Explanation

    Here you have to ensure that the client certificate is installed on every client computer that needs to establish a Point-to-Site VPN connection to the Azure virtual network

    For more information on Point-to-Site VPN connections, go to:

    https://docs.microsoft.com/en-us/azure/vpn-gateway/point-to-site-about

    

34. A file named **audio.log** has been uploaded to a Storage account container called **demo**.

    You need to allow users to download the object. The access should be granted for a day only. You need to provide a secure way to access the object. Which of the following would you implement for this purpose?

    - Mark public access on the object.
    - Provide access Keys.
    - **Generate a shared access signature.**
    - Mark public access on the container.

    #### Explanation

    For more information on Shared access signatures, go to: https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview

    

35. A company has set up an Azure subscription and a tenant. They want to ensure that only Virtual Machines of a particular SKU size can be created in their Azure account.

    They decide to implement Role-Based Access Control.

    Does this fulfill the requirement?

    - Yes
    - **No**

    #### Explanation

    Role-Based Access Control (RBAC) helps you manage who has access to Azure resources, what they can do with those resources, and what areas they have access to.

    For more information on Role-Based Access Control, go to:

    https://docs.microsoft.com/en-us/azure/role-based-access-control/overview

    

36. You need to deploy two Azure virtual machines named VM1 and VM2 based on the Windows server 2016 image. The deployment must meet the following requirements:

    \- Provide a Service Level Agreement (SLA) of 99.95 percent availability.

    \- Use managed disks.

    You propose a solution to create a scale set for the requirement. Would the solution meet the goal?

    - No
    - Yes

37. Imagine your company has the following storage accounts in place as part of its Azure subscription:

    \- General Purpose V1

    \- General Purpose V2

    \- Blob Storage

    Which of the following storage account/accounts could be used to store objects as part of the Archive tier?

    - All Storage accounts
    - General Purpose V1 and Blob Storage only
    - **General Purpose V2 and Blob Storage only**
    - General Purpose V1 and General Purpose V2 only
    - General Purpose V1 only
    - General Purpose V2 only
    - Blob Storage only

    #### Explanation

    For more information on storage accounts, go to:

    https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview

    

38. A company has an application deployed across a set of virtual machines. Users connect to the application either using point-to-site VPN or site-to-site VPN connections. You need to ensure that connections to the application are spread across all of the virtual machines. Which of the following could you set up for this requirement? Choose 2 answers from the options given below.

    - A Traffic Manager Profile
    - **An Internal Load Balancer**
    - **An Azure Application Gateway**
    - An Azure Content Delivery Network
    - A Public Load Balancer

    #### Explanation

    All of the other options are incorrect since the users access the Azure virtual machines via private IP addresses. This is because the users are connecting via VPNs. So we need to use internal load balancing solutions.

    For more information on the load balancer and the application gateway, go to:

    https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-overview

    https://docs.microsoft.com/en-us/azure/application-gateway/overview

    

39. What benefit does a Content Delivery Network (CDN) provide its users?

    - Allows you to store data that can be retrieved later in an extremely fast and inexpensive manner
    - Allows you to keep temporarily session information on the web visitor such as their login ID or their name
    - **Allows you to reduce the traffic coming into a web server for static, unchanging files such as images, videos, and PDFs**
    - For a small fee, Azure will take over management of your virtual machine, perform OS updates and ensure it's running well

    #### Explanation

    A Content Delivery Network allows you to improve performance by removing the burden of serving static, unchanging files from the main server to a network of servers around the globe; a CDN can reduce traffic to a server by 50% or more, which means you can serve more users or serve the same users faster.

40. A company has an Azure subscription. They want to transfer around 6 TB of data to the subscription. They plan to use the Azure Import/Export service. Which of the following can they use as the destination for the imported data?

    - Azure SQL Database
    - Azure File Sync Storage
    - **Azure Blob storage**
    - Azure Data Lake Storage

    #### Explanation

    For more information on the Import-Export service, go to:

    https://docs.microsoft.com/en-us/azure/storage/common/storage-import-export-service

    

41. When adding custom domain names, which of the following record needs to be added to your custom domain registrar?

    - NS record.
    - PTR record.
    - A record.
    - **TXT record and Updating Name Server (NS) Records.**

    

42. In the context of alerts, you can create an Action Group. Which of the following is not an Action Type that can exist inside an Action Group?

    - Logic App

    - Azure Function

    - **Facebook Messenger message**

    - SMS text message

      

43. Which of the following can be used to organize resources for cost reporting? Choose the most complete answer.

    - **Subscriptions, resource groups, and tags**

    - Tags

    - Cost Center, subscriptions, resource groups, and tags

    - Resource groups and tags

      

44. Your company has the following resources created as part of its Azure subscription:

    \- 100 Azure virtual machines

    \- 10 Azure SQL databases

    \- 50 Azure file shares

    You need to create a daily backup of all resources by using Azure Backup. What is the minimum number of backup policies you have to create for this requirement?

    - 100
    - 3
    - 160
    - 1
    - **2**

    #### Explanation

    In this task, there are three types of resources that require a backup. One of them is the Azure SQL database. We don't need to create a daily backup for Azure SQL Database because Azure provides a backup as an automatic service for every database by default. Azure SQL Database is an Azure fully managed platform-as-a-service (PaaS) database engine. It includes automatic patching, monitoring, and backups. The Azure SQL Database service is different from SQL Server that runs in Azure VM. SQL Server in VM requires the user to provide database maintenance and setup backups.

    For the two other types, Azure VM and Azure File shares, we need to create daily backup policies. For multiple VMs, Microsoft recommends creating a Recovery Services vault and adding backup policies from the Backup policies option.

    For more information on an example of using the Azure backup service, go to:

    https://docs.microsoft.com/en-us/azure/backup/backup-azure-vms-first-look-arm

    https://docs.microsoft.com/en-us/azure/backup/backup-afs

    https://docs.microsoft.com/en-us/learn/modules/backup-restore-azure-sql/2-protect-database-with-backup

45. Which of the following would you implement for the below requirement?

    *All web servers need to be protected from SQL injection attacks.*

    - An Internal Load Balancer
    - A Public Load Balancer
    - **An application gateway with a WAF**
    - A network security group
    - An application gateway that uses the Standard tier

    #### Explanation

    To protect the web servers against SQL injection attacks, one can use the Web Application Firewall feature.

    The Microsoft documentation mentions the following:

    ![img](https://img-c.udemycdn.com/redactor/raw/test_question_description/2022-01-31_19-38-55-6245b05ebbc0f79268c8cd1de78ae926.png)

    Since this is clearly mentioned in the documentation, all other options are incorrect.

    For more information on the Web Application Firewall, go to:

    https://docs.microsoft.com/en-us/azure/web-application-firewall/ag/ag-overview

    

46. Which of the following Network watcher feature would you use for the following requirement?

    *Find out if a network security rule is preventing a network packet from reaching a virtual machine hosted in an Azure virtual network.*

    - Packet Capture
    - **IP Flow Verify**
    - Traffic Analysis
    - Next Hop

    

47. In order to get diagnostics from an Azure virtual machine you own, what is the first step to doing that?

    - A diagnostics agent needs to be installed on the VM
    - **You need to create a storage account to store it**
    - You need to grant RBAC permissions to the user requesting diagnostics

    

48. A company needs to create a storage account that must follow the requirements below:

    \- Users should be able to add files, such as images and videos.

    \- Ability to store archive data.

    \- File shares need to be in place, which can be accessed across several VM’s.

    \- The data needs to be available, even if a region goes down.

    \- The solution needs to be cost-effective.

    What is the type of replication they need to implement for the storage account?

    - Locally redundant storage (LRS)
    - Read-access geo-redundant storage (RA-GRS)
    - Zone-redundant storage (ZRS)
    - **Geo-redundant storage (GRS)**

    #### Explanation

    LRS and ZRS are incorrect since these replication strategies don’t replicate the data across regions.

    Option RA-GRS is incorrect because additional read access to data in another region is not mentioned, and we also have to keep the cost to a minimum.

    For more information on storage redundancy, go to:

    https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-grs

    

49. You need to synchronize the files in the file share with an on-premise server named Getcloudskillsserver. Which of the following would you need to implement to fulfill this requirement? Choose 3 answers from the options given below.

    - Download an automation script
    - **Create a sync group**
    - Create a container instance
    - **Install the Azure File Sync agent on Getcloudskillsserver**
    - **Register Getcloudskillsserver**

    #### Explanation

    For more information on deploying Azure File Sync, go to:

    https://docs.microsoft.com/en-us/azure/storage/files/storage-sync-files-deployment-guide?tabs=portal

    

50. Which of the following needs to be set up in Azure for the Site-to-Site VPN connection?

    - A gateway Virtual Machine

    - **A gateway subnet**

    - An additional address space for the Virtual Network

    - A service endpoint

      

51. A company has set up a Virtual Machine in Azure. A web server listening on port 80 and a DNS server has been installed on the Virtual machine. A network security group is attached to the network interface for the virtual machine. The rules for the NSG are given below:

    ![img](images/2022-01-30_19-18-07-8240d38a97d4a45c8dd23c00cea1cccb.png)

    ![img](images/2022-01-30_19-18-07-6dbcbdb1266246c11ade27cebc6f58d7.png)

    Select all server(s) that internet users will connect to on the Virtual machine if RuleB is deleted.

    - DNS server only
    - **RDP server only**
    - RDP, web, and DNS servers
    - Both web and DNS servers
    - Webserver only

    #### Explanation

    If RuleB is deleted, users won’t be able to access port 80 and the webserver.

    There is a Deny rule of RuleA for ports 50-60. Since DNS listens on port 53, you will not be able to access the DNS server. But you will still be able to connect to the virtual machine using RDP under the Allow_rdp rule.

    Because of this logic, all other options are incorrect.

    For more information on network security, go to:

    https://docs.microsoft.com/en-us/azure/virtual-network/security-overview

    

52. You plan to deploy five virtual machines to a virtual network subnet.

    Each virtual machine will have a public IP address and a private IP address.

    Each virtual machine requires the same inbound and outbound security rules.

    What is the minimum number of network interfaces that you require?

    - 20
    - **10**
    - 5
    - 15

    #### Explanation

    For more information on the virtual network interfaces in Azure, go to:

    https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-network-interface

    

53. You have an application in the East US region, running on a virtual network also in the East US region. You need to establish an encrypted, private connection to a data source that exists in Azure's Japan region, and that data source does not have a public endpoint. Attempting to connect with the Japanese data source from East US results in an error. What is the best way to establish a connection between the two regions?

    - Install Gateway devices in both the East US and Japan regions, and connect the gateways together.

    - **Use Global VNet Peering.**

    - Install a Network Gateway in the Japan region. And have the East US application establish a private point-to-site VPN to Japan.

      

54. You need to connect Azure resources like Azure virtual machines across geographical regions. Which Azure networking option should you use?

    - Azure ExpressRoute

    - VPN Gateway

    - **Virtual network peering**

      

55. In your company, all virtual networks are hosting virtual machines with varying workloads. A virtual machine named getcloudskillsvm is hosted in Vnet getcloudskills-vnet1. This virtual machine will have intrusion detection software installed on it. All traffic on all other virtual networks must be routed via this virtual machine.

    You need to complete the required steps for implementing this requirement.

    Which of the following would you need to create additional to ensure that traffic is sent via the virtual machine hosting the intrusion software?

    - **A new route table**
    - Add DNS servers
    - Add an address space
    - Add a service endpoint

    #### Explanation

    In order to ensure that traffic is routed via the intrusion-based device, you need to set up a route table and add the route table to the subnets in the other virtual networks.

    For more information on working with route tables, go to:

    https://docs.microsoft.com/en-us/azure/virtual-network/tutorial-create-route-table-portal

    https://docs.microsoft.com/en-us/azure/virtual-wan/scenario-route-through-nva

    

56. If no rules other than the default NSG rules are in place, are VM's on SubnetA and SubnetB be able to connect to the Internet?

    - **Yes**
    - No

    #### Explanation
    
    The Outbound rules contain a Rule with the Name of “AllowInternetOutBound”. This would allow all Outbound traffic to the Internet.
    
    

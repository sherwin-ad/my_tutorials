# AZ-104: MICROSOFT AZURE ADMINISTRATOR

**Course Git Repository**

https://github.com/rithinskaria/kodekloud-azure

# Managing Azure Active Directory

## QUIZ: AZURE ACTIVE DIRECTORY

1. What is the maximum number of methods we can set for password reset?

   - 4
   - **2**
   - 6
   - 1

2. Your organization wants to use Identity Governance in Azure AD. Which Azure AD edition will you recommend for this?

   - **Premium P2**
   - Microsoft 365 Apps
   - Free
   - Premium P1

3. Which users will be part of the “Finance” group if the dynamic query for the group is user.department –eq “Finance” –and user.country –eq “US”? ![question-image](https://res.cloudinary.com/dezmljkdo/image/upload/v1656356062/az104/table1_qqyxc9.png)

   - **3 and 5**

   - 3, 4, and 5

   - 2, 4, and 5

   - 1 and 4

4. You would like to add external users to your directory in bulk. Which of the following bulk operations will you use to accomplish this task?

   - Bulk create

   - **Bulk invite**

   - Bulk export

   - Bulk add

5. Which feature in Azure AD can be used to enforce device management?

   - **Azure AD Join**

   - Azure Domain Join

   - Azure AD Directory Services

   - Azure AD login

6. Which of the following statements is false? Select one.

   - Azure AD uses REST API calls for querying.

   - Azure AD uses OAuth.

   - **Azure AD uses Kerberos.**

   - Azure AD is a managed service.

7. If you are deleting a user from Azure AD, how long will Azure AD will retain the user?

   - 10 days

   - 60 days

   - 15 days

   - **30 days**

8. Which type of user account is owned by Abigail Richards? ![question-image](https://res.cloudinary.com/dezmljkdo/image/upload/v1655214383/az104/az1041_swnnph.png)

   - Member identity

   - Directory Synchronized identity

   - Guest identity

   - **Cloud identity**

9. With Azure AD Free edition, we can have B2B collaboration.

   - False

   - **True**

10. Which protocol is used by Active Directory Domain services for querying objects?

    - **LDAP**

    - HTTPS

    - REST

    - HTTP



# Subscription and Governance

## QUIZ: SUBSCRIPTION AND GOVERNANCE

1. Which of the following statements about Azure Cost Management is false?

   - Cost Management can be used export Azure usage to storage account.

   - Cost Management offers API to download the usage programmatically.

   - **We can analyse AWS and GCP cost in Azure Cost Management.**

   - We can create budgets and cost alerts in Cost Management.

2. You deployed a production webserver on Azure Ubuntu Linux Virtual Machine. Your manager is planning to perform cost cutting and asked you to optimize the cost of the VM. Which of the following methods can be used to save the cost?

   - Azure Visual Studio subscription

   - Azure Dev/Test subscription

   - Azure Hybrid Benefit

   - **Reserved Instances**

3. Your organization is going for PCI: DSS compliance and there are several policies that your organization wants to enforce to their Azure environment. They are looking for an easier solution to assign multiple policies and evaluate them. What will you suggest?

   - Use Azure Policy bulk processing

   - Use Azure Policy Developer Console

   - **Use Azure Initiative**

   - There is no way to assign and manage multiple policies.

4. Chris is the owner of the subscription, and he wants to assign a role to Alex. Alex is responsible for managing user access to Azure resources. The role should comply with the principle of least privilege. Which role should Chris assign to Alex?

   - **User access administrator**

   - User access owner

   - Administrator

   - Owner

5. Which service in Azure is used to manage access to Azure resources?

   - Policy

   - Azure Management groups

   - Tags

   - **RBAC**

6. You need to group your subscription based on department, which of the following need to be used?

   - Subscription groups

   - **Management groups**

   - Resource groups

   - Business groups

7. You are running production critical workloads in Azure, and you need to make sure that the resources are protected from accidental changes and deletion. Which of the following should you use?

   - Policy

   - Delete lock

   - **Read-only lock**

   - Tag

8. What’s the maximum number of tags you can assign to a resource?

   - 40

   - **50**

   - 60

   - 20

9. You need to make sure that the tags applied to the resource group is getting inherited to the underlying resources. How can we accomplish this?

   - No change is required, tags applied at higher scopes will be inherited to underlying resources.

   - You cannot assign tags to resource groups, tag resources individually.

   - **Azure Policy needs to be implemented to inherit the tags.**

   - Use inherit option in Azure to inherit if needed.

10. ###### Which of the following statements about Azure subscription is not true?

   - Azure Subscription provides billing boundary.

   - **Only one subscription can be created inside an account**

   - Logical boundary for our resources.

   - All resources will be mapped to a subscription.



# Implementing virtual networking

## QUIZ: IMPLEMENTING VIRTUAL NETWORKING

1. You are setting up a service endpoint between your VM-1 deployed in East US and storage account in West US. Which IP address will be used by the VM to connect to the storage account using service endpoint?

   - Public IP of the VM

   - Cross region is not possible with Service Endpoints

   - **Private IP of the VM**

   - NAT IP of the VM

2. You need to assign a static zone redundant IP address to one of your DNS servers to ensure that the IP address is not getting changed during planned reboot events. Which Public IP SKU should be selected for this IP?

   - Reserved

   - Premium

   - Basic

   - **Standard**

3. Which of the following statements is false? Select all that apply.

   - Azure Firewall has built in threat intelligence

   - **Azure Firewall is a Layer 4 firewall-as-a-service solution**

   - **Azure Firewall doesn’t require dedicated subnet**

   - Azure Firewall supports public IP

4. In Azure, without the need for deploying a NAT gateway, all VMs can communicate to the internet. What is the reason for this?

   - **System route**

   - VPN

   - Built in internet gateway

   - Built in NAT gateway

5. You have created a DNS zone in Azure called “[kodekloudlabs.com](http://kodekloudlabs.com/)”. You added records of your public-facing webservers to the DNS zone. When you try to resolve the DNS names from your Windows computer, they are not getting resolved. What could be the reason?

   - You need to change the visibility of your Azure zone to public

   - **You need to make sure that the requests are going to the Azure provided name servers for resolution**

   - Try ipconfig /flushdns and retry querying the record

   - You need to create an on-premises DNS server to resolve the domain name

6. VM1 is deployed to subnet-1 in VNet-1. We have NSG-1 assigned to subnet-1 and NSG-2 assigned to NIC of VM1. You need to confirm if inbound RDP traffic will be allowed by looking at the following inbound rules: ![question-image](https://res.cloudinary.com/dezmljkdo/image/upload/v1656356062/az104/table3_c4e1xa.png) Select true if traffic is allowed, else select false.

   - False

   - **True**

7. You are setting up a hybrid environment. Your webservers are deployed in on-premises infrastructure, and you have a SQL Database deployed in Azure. You have already setup the VPN connection and the webserver can connect to resources in the Azure virtual network. Since Azure SQL Database is a PaaS solution and it’s not directly integrated to the virtual network, you cannot connect to it using a private IP. Your security asked you to find a way to connect to PaaS services via private IP. What is your recommendation?

   - **Use Private Link**

   - Use ExpressRoute

   - Use Private DB Connection

   - Use Service Endpoint

8. You are not able to connect to one of your VMs on port 22. Following is the NSG inbound rules attached to VM NIC: ![question-image](https://res.cloudinary.com/dezmljkdo/image/upload/v1656356062/az104/table2_clnmvy.png) What should be done to establish SSH connectivity to the VM?

   - Change Action of 101 to Allow

   - Add a new rule with priority of 105 to allow SSH (22)

   - Add a new rule with priority of 1 to allow SSH (22)

   - **Change priority to 102 to 100**

9. Your organization is planning to host DNS in Azure by which VMs can resolve names of other VMs. Which of the following services should be used to create a DNS zone for name resolution in an Azure virtual network?

   - Virtual DNS

   - Delegated DNS zone

   - DNS zones

   - **Private DNS zones**

10. Which of the following statement is false?

    - Virtual Networks are representation of cloud network.

    - **Virtual Network is a global service in Azure used to connect to other virtual networks and on-premises environment.**

    - A subscription is required to create an Azure virtual network.

    - Virtual network can be divided to small sub networks called subnets.

# Configure VMs


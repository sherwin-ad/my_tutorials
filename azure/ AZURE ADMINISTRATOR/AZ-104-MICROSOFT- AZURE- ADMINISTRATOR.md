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

3. Which users will be part of the “Finance” group if the dynamic query for the group is user.department –eq “Finance” –and user.country –eq “US”? ![question-image](images/table1_qqyxc9.png)

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

8. Which type of user account is owned by Abigail Richards? ![question-image](images/az1041_swnnph.png)

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

6. VM1 is deployed to subnet-1 in VNet-1. We have NSG-1 assigned to subnet-1 and NSG-2 assigned to NIC of VM1. You need to confirm if inbound RDP traffic will be allowed by looking at the following inbound rules: ![question-image](images/table3_c4e1xa.png) Select true if traffic is allowed, else select false.

   - False

   - **True**

7. You are setting up a hybrid environment. Your webservers are deployed in on-premises infrastructure, and you have a SQL Database deployed in Azure. You have already setup the VPN connection and the webserver can connect to resources in the Azure virtual network. Since Azure SQL Database is a PaaS solution and it’s not directly integrated to the virtual network, you cannot connect to it using a private IP. Your security asked you to find a way to connect to PaaS services via private IP. What is your recommendation?

   - **Use Private Link**

   - Use ExpressRoute

   - Use Private DB Connection

   - Use Service Endpoint

8. You are not able to connect to one of your VMs on port 22. Following is the NSG inbound rules attached to VM NIC: ![question-image](images/table2_clnmvy.png) What should be done to establish SSH connectivity to the VM?

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

## Create VM using Powershell

1. Create resource group

```
PS /home/sherwin> New-AzResourceGroup -Name 'vm-from-ps' -Location 'East US'

ResourceGroupName : vm-from-ps
Location          : eastus
ProvisioningState : Succeeded
Tags              : 
ResourceId        : /subscriptions/09be15e8-0638-4e99-8dc6-b53367de0941/resourceGroups/vm-from-ps
```

2. Create VM

```
PS /home/sherwin> New-AzVM -ResourceGroupName 'vm-from-ps' `                                 
>> -Name "vm-ps" `
>> -VirtualNetworkName "ps-vnet" `
>> -SubnetName "default" `
>> -SecurityGroupName "ps-nsg"
```



## Create VM using Azure CLI

1. Create resource group

```
PS /home/sherwin> az group create -n vm-from-cli -l westus                                                 {                                                                                       
  "id": "/subscriptions/09be15e8-0638-4e99-8dc6-b53367de0941/resourceGroups/vm-from-cli",
  "location": "westus",
  "managedBy": null,
  "name": "vm-from-cli",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
```

2. Create VM

```
PS /home/sherwin> az vm create -n vm-from-cli -g vm-from-cli --image UbuntuLTS --admin-username sherwinowen --admin-password "P@$$w0rd1234"  
```

## QUIZ: CONFIGURE VMS

1. You are setting up Windows Server in Azure and would like to establish command line connectivity to the Windows VM. Which is the default port used for this?

   - 3389

   - **5986**

   - 21

   - 22

2. What is the SLA offered by Microsoft if you are deploying two or more Virtual Machines across an availability set?

   - **99.95%**

   - 99.00%

   - 99.99%

   - 99.90%

3. Currently, your organization’s web application is running on single VMs and in Microsoft documentation, you found that there is a service called Virtual Machine Scale Set. What are the advantages of using Virtual Machine Scale Set compared to Virtual Machines? Select all that apply.

   - **Marketplace and custom images can be scaled with Virtual Machine Scaleset.**

   - **Virtual Machine scale set can be easily integrated with Azure Load Balancer or Application Gateway and there is no need to update the backend pool if the number of instances change.**

   - **Virtual Machine Scale Set can automatically change the number of instances based on demand**

   - **Cost optimization**

4. Which of the following statements about Azure Bastion is true? Select all that apply.

   - Azure Bastion can be used for Windows VMs only.

   - **Azure Bastion can automatically scale in and out based on the number of requests.**

   - **Azure Bastion is PaaS solution.**

   - Azure Bastion can be deployed to any subnet where your VMs are deployed to connect to the VMs.

5. Your organization needs to encrypt data-in-use due to the sensitivity of the data your organization is handling. Which of the following computing options should you use to achieve this?

   - Transparent Data Encryption

   - **Confidential Computing**

   - Storage Service Encryption

   - Azure Disk Encryption

6. You are using Availability Set and your application team is insisting on creating the availability to 99.99%. What is the best way to increase SLA for your application?

   - Increase the number of fault domains and update domains

   - Deploy more instances

   - Roll back to single VMs and use Azure Load Balancer

   - **Use Availability Zones**

7. You are deploying DS2v2 VM in East US with a single disk, and your application is quite I/O intensive. Which disk tier will be ideal for your virtual machine?

   - **Premium SSD**

   - Super Fast SSD

   - Standard SSD

   - Ultra SSD

8. Currently, your organization is using jumpbox VMs to connect to the virtual machines that are deployed in the VNet. Your security team would like to eliminate these jumpbox VMs and replace them with a PaaS solution for better security. Which solution would you suggest?

   - **Azure Bastion**

   - Azure Load Balancer

   - Azure Private Link

   - Azure Firewall

# Load Balancing

## Azure Load Balancer

**Git**

kodekloud-azure/Azure Load Balancer

```
ls -l 
total 40
-rw-rw-r-- 1 sherwinowen sherwinowen  562 May 10 09:03 jumpbox.sh
-rw-rw-r-- 1 sherwinowen sherwinowen 4402 May 10 09:03 lab-infra.ps1
-rw-rw-r-- 1 sherwinowen sherwinowen  117 May 10 09:03 sample.html
```

## Azure Application Gateway

kodekloud-azure/AppGateway

```
$ ls -l 
total 44
-rw-rw-r-- 1 sherwinowen sherwinowen 1795 May 10 09:03 jumpbox.sh
-rw-rw-r-- 1 sherwinowen sherwinowen 8206 May 10 09:03 lab-infra.ps1
-rw-rw-r-- 1 sherwinowen sherwinowen  127 May 10 09:03 sample.html
```



## QUIZ: LOAD BALANCING

1. Azure Application Gateway is a Layer ____ load balancer.

   - 6

   - 4

   - **7**

   - 5

2. If we take all the load balancing solutions in Azure, which of the following can be used for public facing non-Azure applications? Select all that apply.

   - **Azure Front Door**

   - **Azure Traffic Manager**

   - **Azure Application Gateway**

   - Azure Load Balancer

3. Azure Load Balancer is a Layer ________ load balancer.

   - 7

   - 5

   - 3

   - **4**

4. You created two App Services in East US region and are trying to load balance the request with the help of Azure Load Balancer. However, when you configure the backend pool for load balancer, you are not able to find the App Services. You confirmed that these are deployed in the same subscription, resource group and region as load balancer.

   - Ensure you are using the Standard or Premium tier of App Service Plan

   - Make sure App Service is not in stopped state.

   - Contact Microsoft support

   - **Azure Load Balancer only supports Virtual Machines and Virtual Machine Scale Set**

5. One of your applications behind Application Gateway was attacked by attackers and your security team found that they used cross-site scripting to attack the application. Which optional component of Application Gateway should be enabled to avoid these kinds of attacks?

   - **Web Application Firewall**

   - Application Proxy

   - DDOS Protection

   - Azure Firewall

6. Which of the following is considered as a DNS resolver in Azure?

   - Azure Application Gateway

   - Azure Front Door

   - **Azure Traffic Manager**

   - Azure Load Balancer

7. You are setting up a load balancer with the default session persistence settings. What are the factors that will be considered for routing the traffic to backend servers with the default session persistence settings?

   - **Source IP, Destination IP, Protocol, Source Port, Destination Port**

   - Source, Destination IP, Source Port, Destination Port

   - Source IP, Destination IP

   - Source IP, Destination IP, Protocol

8. Which of the following statements about Azure Application Gateway is true? Select all that apply

   - **Azure Application Gateway supports Azure Virtual Machines, Azure VMSS, App Services and App Service deployment slots as backend pools.**

   - Azure Application Gateway cannot be used to load balance requests to on-premises application.

   - **Behind a single Application Gateway, multiple sites can be hosted.**

   - We cannot create empty backend pools in Application Gateway.

9. While deploying Azure Load Balancer, you came to know there are multiple SKUs for Azure Load Balancer. Your application is a production application that requires 99.99% SLA. Which SKU would you choose?

   - Production

   - Basic

   - Premium

   - **Standard**

10. Which of the following features are supported by Azure Application Gateway? Select all that apply.

    - **URL Redirect**

    - **SSL termination**

    - **Custom error pages**

    - **HTTP header rewrite**



# Intersite connectivity

## Azure-to-Azure Connectivity

![image-20230626093132043](images/image-20230626093132043.png)

## Virtual Network Peering

![image-20230626093424551](images/image-20230626093424551.png)

### Creating Virtual Network Peering

1. Goto Virtual Networks > [Vnet Name] > Peerings and Add

   ![image-20230626112858034](images/image-20230626112858034.png)

   **wus-eus peerings connection**
   ![image-20230626113225691](images/image-20230626113225691.png)

   **eus-wus peerings connection**

   ![image-20230626113332646](images/image-20230626113332646.png)

## Azure-to-on premises Connectivity

![image-20230626093305892](images/image-20230626093305892.png)



## VPN GATEWAY

![image-20230626113613344](images/image-20230626113613344.png)



## VPN Gateway SKUs

![image-20230626114021194](images/image-20230626114021194.png)



## Steps VNet-to-VNet Connection

1. Create Gateway Subnet in both virtual networks.

   Goto Virtual networks > [Vnet Name] >  Gateway Subnet

   ![image-20230626144621691](images/image-20230626144621691.png)

   - **Gateway Subnet**
     - VPN Gateways requires a dedicated subnet to deploy the gateway. First, we need to create Gateway Subnet in both of our virtual networks.

2. Create the VPN gateway in both virtual networks

   Goto Virtual network gateways > and click Create

   ![image-20230626151705525](images/image-20230626151705525.png)

   - **VPN Gateway**
     - Once the Gateway Subnet is created, we will deploy the VPN gateway to the subnet.
     - Creating a VPN gateway would take around approx.: 40 minutes.

3. Create the VPN connection

   Goto Virtual network gateways > [VNet GW Name] > Connections > and Click Add

   ![image-20230626155421521](images/image-20230626155421521.png)

   ![image-20230626155512061](images/image-20230626155512061.png)

   **Check connections**

   ![image-20230626160616115](images/image-20230626160616115.png)

   

   - **VNet-to-VNet connection**
     - After creating the VPN gateway, then we need to create VNet-to-VNet connection from the VPN Gateway

## VNet Peering v/s VNet-to-VNet Connection

![image-20230626161001820](images/image-20230626161001820.png)

## Site-to-Site connection

- Connecting to your virtual network to an on-premises site or non-Azure site.

1. Create Gateway Subnet in Azure Virtual Network to deploy the VPN Gateway.

   Goto Virtual networks > [Vnet Name] >  Gateway Subnet

   ![image-20230626144621691](images/image-20230626144621691.png)

2. Deploy VPN Gateway to the Gateway Subnet in Azure virtual network

   ![image-20230626151705525](images/image-20230626151705525.png)

   

3. Create Local Network Gateway (LNG) in Azure by providing the IP address or FQDN of your on-premises VPN device

   

4. Provide Public IP address of your Azure VPN Gateway in on-premises VPN device

5. Create Site-to-Site VPN connection



## Point-to-Site connection

1. Create Gateway Subnet in Azure Virtual Network to deploy the VPN Gateway.
2. Deploy VPN Gateway to the Gateway Subnet in Azure virtual network
3. Configure your Point-to-Site in VPN gateway by selecting the address pool and authentication method
4. Download the VPN client configuration to your client machine
5. From your Windows, Linux, macOS or mobile clients; connect to the VPN

## QUIZ: INTERSITE CONNECTIVITY

1. XYZ Inc. has offices in NYC, LAX and DAL. In addition to deployments in these on-premises offices they have deployment in Azure as well. They need to set-up Site-to-Site connection from Azure to each of their offices. As of now, they only have one virtual network in Azure; how many Virtual Network Gateways and Local Network Gateways are required in Azure to set-up the connectivity?

   - 3 VPN Gateways and 1 Local Network Gateways

   - **1 VPN Gateway and 3 Local Network Gateways**

   - 3 VPN Gateways and 3 Local Network Gateways

   - 1 VPN Gateway and 1 Local Network Gateway1 VPN Gateway and 3 Local Network Gateways

2. There are three virtual networks in Azure, vnet-a is peered with vnet-b and vnet-b is peered with vnet-c. The resources deployed in vnet-a can communicate with resources in vnet-c.

   - **False**

   - True

3. Which of the following connections can be used as a failover path for ExpressRoute to on-premise site?

   - Gateway transit

   - **Site-to-Site**

   - ExpressRoute failover

   - Point-to-Site

4. ## We have the following VNets in Azure. For which scenarios can we establish peering? ![question-image](images/az104-vnet_smp2ym.png)

   - A and B

   - A, C, and D

   - **A and C**

   - A, B, C and D

   In scenario B, the address spaces are overlapping so we cannot establish peering. In scenario-D, the CIDR for VNet-a is /30; in Azure we can only create till /29. Since the network itself cannot be created, peering cannot be established.

5. Which would be the cheapest method to establish private connectivity between two virtual networks in Azure? The estimated data transfer is 10 GB per month.

   - Site-to-Site connection

   - VNet-to-VNet connection

   - **Virtual Network Peering**

   - ExpressRoute

6. What is the maximum number of peering a single virtual network can have?

   - 400

   - **500**

   - 200

   - 100

7. You would like to set up an architecture where you can use the gateway deployed in the peered network to send traffic to another destination, say, on-premises. Which feature should you enable while setting up peering?

   - Route table

   - **Gateway transit**

   - Gateway transfer

   - Transit route



# Automating deployment and configuration

## Creating ARM template

- Use Visual Studio Code

- Install **Azure Resource Manager (ARM) Tools** extension in Visual Studio Code

- type "arm" to show the different ARM template 

- azure quickstart templates

## Deploying ARM template

1. Azure Portal

   - Goto Deploy a custom template

   - Load the template 

     Vent-template

     ```
     {
         "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
         "contentVersion": "1.0.0.0",
         "parameters": {},
         "functions": [],
         "variables": {},
         "resources": [
             {
                 "name": "arm-template-vnet",
                 "type": "Microsoft.Network/virtualNetworks",
                 "apiVersion": "2020-11-01",
                 "location": "[resourceGroup().location]",
                 "tags": {
                     "created-from": "ARM template"
                 },
                 "properties": {
                     "addressSpace": {
                         "addressPrefixes": [
                             "192.168.0.0/16"
                         ]
                     },
                     "subnets": [
                         {
                             "name": "web-subnet",
                             "properties": {
                                 "addressPrefix": "192.168.1.0/24"
                             }
                         },
                         {
                             "name": "data-subnet",
                             "properties": {
                                 "addressPrefix": "192.168.2.0/24"
                             }
                         }
                     ]
                 }
             }
         ],
         "outputs": {}
     }
     ```

     

     

2. Azure CLI

   ```
   $ az group deployment create \
   -g <resource group name>
   --template file <path to file>
   
   PS /home/sherwin> az group deployment create --resource-group arm-sg --template-file vnet-template.json
   This command is implicitly deprecated because command group 'group deployment' is deprecated and will be removed in a future release. Use 'deployment group' instead.
   Please provide string value for 'location' (? for help): eastus
   Please provide string value for 'userInput' (? for help): owen
   ```

3. Azure Powershell

   ```
   $ New AzResourceGroupDeployment -ResourceGroupName <resourcegroup> 
   -TemplateFile <path to file>
   ```



## Exporting deployments as ARM template

1. Azure Portal

   - Goto Resource Group > Export Template

2. Azure CLI

   ```
   $ az group export --name <resource group name>
   ```

3. Azure Powershell

   ```
   $ Export-AzResourceGroup -ResourceGroupName <resource group> --resource
   ```

   

## **Creating VHD Templates**

![image-20230529101010202](images/image-20230529101010202.png)

![image-20230529101137663](images/image-20230529101137663-5326299.png)

## QUIZ: AUTOMATING DEPLOYMENT AND CONFIGURATION

1. What is the maximum run window we have for Custom Script Extension before it hits timeout?

   - 30 minutes

   - **1.5 hours**

   - 1 hour

   - 15 minutes

   CSE can run scripts up to 90 minutes, anything more that will be returned as a timed out operation.

2. Your Windows administrator would like to create multiple domain controllers and file servers using Azure VMs. They already have a PowerShell script for this, the script requires reboot and has complex installation. Which extension would you prefer to accomplish this task?

   - **Desired State Configuration Extension**

   - Custom Script Extension

   - PowerShell Remoting Extension

   - Configuration Management Extension

   DSC extension can be used for complex installations that require reboot.

3. Which PowerShell command is used to deploy an ARM template?

   - New-AzGroupTemplateDeployment

   - **New-AzResourceGroupDeployment**

   - New-AzTemplateDeployment

   - New-AzResourceGroupTemplate

   New-AzResourceGroupDeployment command can be used to deploy an ARM template using PowerShell.

4. In your organization, there is a need to create a custom Linux image. This image should contain the Apache, PHP and MySQL installation. Also, the default files should be modified with your own HTML files. This custom image will be used with Virtual Machine Scale Set. Your Azure administrator already created a VM with the required software and files. What type of image should you create?

   - Backup image

   - Snapshot

   - Specialized image

   - **Generalized image**

   Generalized image needs to be created. VMs created from this image require a hostname, admin user, and other VM related setup. This image can be used to create VMs or VMSS.

5. You would like to export all the resources in a resource group to an ARM template. Which of the following methods can be used. Select all that apply.

   - **Use Export template option in Resource Group blade**

   - Use Deployments in Resource Group blade and export the templates

   - Use Export-AzResourceGroupTemplate command in Azure PowerShell

   - **Use az group export command in Azure CLI**

   We can use the export option in Azure Portal or use the az group export command in Azure CLI. If you want to export using Azure PowerShell, then you need to use the Export-AzResourceGroup command.

6. You need to pass a value during the ARM template deployment. How do we define this in the template?

   - Create a dynamic variable

   - **Use parameters**

   - Create a function which accepts the value

   - Store as a variable and modify as required

   With the help of parameters, we can provide values at the time of template execution.

7. Which of the following connections can be used as a failover path for ExpressRoute to on-premise site?

   - ExpressRoute failover

   - **Site-to-Site**

   - Point-to-Site

   - Gateway transit

   Site-to-site and ExpressRoute connections can co-exist and S2S can act as a failover path for ExpressRoute.



# Securing storage

## QUIZ: SECURING STORAGE

1. What type of encryption is used by Storage Service Encryption?

   - 512 bit AES

   - 128 bit AES

   - 128 bit RSA

   - **256 bit AES**

2. Your organization follows the principle of least privilege and uses custom RBAC roles to segregate the roles and responsibilities. You need to make sure that your storage admins are able to view, read, and copy the storage account keys. Which action should you add to your custom role?

   - **Microsoft.Storage/storageAccounts/listkeys/action**

   - Microsoft.Storage/storageAccounts/keys/action

   - Microsoft.Storage/storageAccounts/keys/*

   - Microsoft.Storage/storageAccounts/listkeys

   Users with Microsoft.Storage/storageAccounts/listkeys/action permission will be able to view, read, and copy the storage account keys.

3. Which of the following statement is incorrect?

   - Customer-managed keys only supports encryption of files and blobs

   - **SSE can be disabled for testing purposes from Azure Portal if required**

   - SSE allows you to use Microsoft-managed keys and Customer-managed keys

   - SSE automatically decrypts the data when you want to access it

   SSE cannot be disabled.

4. In Azure Disk Encryption for Linux VMs, which tool is used for encryption?

   - Crypto

   - BitLocker

   - Crypt-Linux

   - **DM-Crypt**

5. As per your organizational policy, you need to rotate the storage account keys every 60 days. What all things you need to consider before making this change? Select all that apply.

   - No impact on storage account

   - **All applications using the storage account keys will no longer be able to access the storage account**

   - There will be a minor downtime during the process and users accessing storage account using Azure AD will be affected.

   - **All SAS token generated with the keys will be revoked**

   Rotating the storage account keys will revoke all SAS tokens and stop applications from accessing the storage account as they are still using old keys. You can consider storing the keys in Key Vault so that the application can obtain the keys from the vault. Users using Azure AD will not be impacted as storage account keys are not used in Azure AD authentication.

6. In your development environment, your developers require a storage account which offers at least 99.999999999999 (12 “9s”) of durability. Which type of redundancy should you choose? Make sure your choice is the cheapest one.

   - GRS

   - LRS

   - **ZRS**

   - GZRS

7. You have successfully set up the storage account with GZRS redundancy. How many copies of data will be created by Azure for this redundancy?

   - 5

   - 3

   - 4

   - **6**

8. To which all-storage account services can we enable anonymous access?

   - Files

   - **Blobs**

   - Tables

   - Queues

9. You are partnering with another organization to develop a C# application for your organization. They need a storage account to write logs from development and they need access to the storage account for 31 days. Due to organizational policies, you cannot set up guest accounts for these developers in your tenant. Which authorization method should you use?

   - Storage keys

   - Just in time access

   - Azure AD + RBAC

   - **Storage Access Signature**

10. Your organization would like to set-up Geo-Zone-Redundant storage account. Which type of storage account do you recommend for this redundancy?

    - Premium Blob Storage

    - **StorageV2**

    - Premium File Storage

    - StorageV1

    General Purpose v2 or StorageV2 accounts are needed to use GZRS or RA-GZRS redundancy.

# Administering Azure Blobs and Azure Files

## QUIZ: ADMINISTERING AZURE BLOBS AND AZURE FILES

1. Your storage administrator created a file share for you and when you mount it to your on-premises Windows server which is behind a firewall, you are not able to connect to the share. What should be done?

   - **Open port 445 on the firewall**

   - Put the Windows server in DMZ

   - Provide the Azure AD credentials to complete the setup

   - Add Windows file server role to the server

2. Your storage administrator has set the public access level of a blob container to “Blob”. What does that mean?

   - Users will have read access to all blobs in the storage account

   - Users will have anonymous read access to a single blob

   - **Users will have read access to blobs in the container**

   - Users will have read access to all containers and blobs

3. Which one of the following is not a use case of Azure Blob Storage?

   - Embed images or documents in webpages

   - Store files for distributed access in websites

   - **Mount as a common storage for virtual machines**

   - Stream video and audio directly to browser

4. You started using blob access tier, however, the manual conversion of access tiers is not feasible considering the amount of data. You are looking for a solution by which you can automatically transition between the access tiers. What do you recommend?

   - **Lifecycle management**

   - Import/Export tool

   - AzCopy

   - CORS

5. To which all-storage account services can we enable anonymous access?

   - Files

   - Queues

   - **Blobs**

   - Tables

6. One of your applications is writing a lot of data to an Azure Storage account. Only a part of it’s accessed regularly, rest of the data remain in the storage account. You should consider which feature of blob storage to optimize the cost of the storage?

   - Use Blob Scavenging option

   - Use Blob Clean up tool

   - **Use Blob Access Tiers**

   - Use Blob Access Policy

7. Now that you are aware of Lifecycle Management, you started implementing it for all storage accounts from Azure Portal. One of your old storage accounts, which is a Premium General Purpose v1 storage account deployed in East US, cannot use this feature. What could be the reason?

   - You need to have dedicated storage permission like Storage Blob Data Contributor to enable this feature

   - **GPv1 doesn’t support lifecycle management**

   - You cannot enable from Azure Portal, v1 account requires PowerShell or CLI to enable lifecycle management

   - By default, lifecycle management is disabled for GPv1, however, this can be enabled from storage account properties

   GPv1 storage accounts don't support lifecycle management.

# Managing Storage

## Azure Storage Explorer

https://azure.microsoft.com/en-us/products/storage/storage-explorer/

## AZCopy

https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10#download-azcopy

### Upload file using SAS key

**SAS Token**

![image-20230530174602543](images/image-20230530174602543.png)

**Container URL**

![image-20230530174902160](images/image-20230530174902160-5440144.png)



azcopy copy <source> <container-url + sas-token>

```
$ ./azcopy copy ~/Pictures/service_type.png "https://owenstorage02.blob.core.windows.net/images?sv=2022-11-02&ss=b&srt=sco&sp=rwdlaciytfx&se=2023-05-30T17:38:16Z&st=2023-05-30T09:38:16Z&spr=https&sig=%2BtLi2nrsxi%2BhmtoRJYIuTR0cOR1Mw7Ezev4%2BOvtTRas%3D"
INFO: Scanning...
INFO: Any empty folders will not be processed, because source and/or destination doesn't have full folder support

Job e0c683c3-86ab-8242-7dcc-b80bc9b3571e has started
Log file is located at: /Users/sherwinowen/.azcopy/e0c683c3-86ab-8242-7dcc-b80bc9b3571e.log

0.0 %, 0 Done, 0 Failed, 1 Pending, 0 Skipped, 1 Total, 2-sec Throughput (Mb/s):100.0 %, 1 Done, 0 Failed, 0 Pending, 0 Skipped, 1 Total,
```

### Upload file using Azure AD

**Add role assignment**

![image-20230530180203008](images/image-20230530180203008-5440924.png)

**Tenant ID**

![image-20230530180701662](images/image-20230530180701662.png)

**Azcopy login**

```
% ./azcopy login --tenant-id 19536135-463a-411c-96f4-1f13cfd99a30
To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code I765ZC3JL to authenticate.
```

![image-20230530181013006](images/image-20230530181013006-5441415.png)

```
$ ./azcopy copy ~/Pictures/fisheries_tor.png https://owenstorage02.blob.core.windows.net/images
INFO: Scanning...
INFO: Autologin not specified.
INFO: Authenticating to destination using Azure AD
INFO: Any empty folders will not be processed, because source and/or destination doesn't have full folder support

Job 02f9cfd0-39b2-e94f-6b2e-7d631937ca92 has started
Log file is located at: /Users/sherwinowen/.azcopy/02f9cfd0-39b2-e94f-6b2e-7d631937ca92.log

100.0 %, 1 Done, 0 Failed, 0 Pending, 0 Skipped, 1 Total,


Job 02f9cfd0-39b2-e94f-6b2e-7d631937ca92 summary
Elapsed Time (Minutes): 0.1336
Number of File Transfers: 1
Number of Folder Property Transfers: 0
Number of Symlink Transfers: 0
Total Number of Transfers: 1
Number of File Transfers Completed: 1
Number of Folder Transfers Completed: 0
Number of File Transfers Failed: 0
Number of Folder Transfers Failed: 0
Number of File Transfers Skipped: 0
Number of Folder Transfers Skipped: 0
TotalBytesTransferred: 270644
Final Job Status: Completed
```



## QUIZ: MANAGING STORAGE

1. Which tool is used to prepare the disks in the Import/Export tool?

   - **WAImportExport tool**

   - ImportExport tool

   - PSImportExport tool

   - AzImportExport tool

   The WAImportExport tool is used to prepare the disks, copy the contents and generate the journal files.

2. You have a few GBs of data that needs to be copied to Azure Blobs everyday at 4:00 AM. Which tool do you recommend for this?

   - Storage Explore

   - **AZCopy**

   - Import/Export tool

   - Azure Portal

# Azure App Services

## Creating an App Service

1. Create App Service Plan

   - Goto App Service Plans

   ![image-20230531063842018](images/image-20230531063842018-1685486326855-1.png)

2. Create App Service

   - Goto App Service
   
   ![image-20230531064443560](images/image-20230531064443560-1685486685166-3.png)

## Securing an App Service

Goto App Services > Authentication > Add an identity provider

![image-20230531090930026](images/image-20230531090930026-5495372.png)

![image-20230531091148459](images/image-20230531091148459-5495511.png)



## Custom Domains

Goto App Services > Custom Domains

![image-20230531092434166](images/image-20230531092434166.png)

## Backup App Service

Goto App Services > Backups

![image-20230531162436998](images/image-20230531162436998-5521479.png)



## CI/CD and Deployment slots



## QUIZ: AZURE APP SERVICES

1. You have a webapp with the URL: [kodekloud-courses.azurewebsites.net](http://kodekloud-courses.azurewebsites.net/). You created a deployment slot named “dev”. What would be the URL to the slot?

   - [dev-kodekloud-courses.azurewebsites.net](http://dev-kodekloud-courses.azurewebsites.net/)

   - [kodekloud-courses.dev.azurewebsites.net](http://kodekloud-courses.dev.azurewebsites.net/)

   - **[kodekloud-courses-dev.azurewebsites.net](http://kodekloud-courses-dev.azurewebsites.net/)**

   - [dev.kodekloud-courses.azurewebsites.net](http://dev.kodekloud-courses.azurewebsites.net/)

   The name of the slot will be added as a suffix to the production slot.

2. One of your production applications requires App Service Backup. The connected MySQL PaaS database is of size 8.3 GB. How can we back this up?

   - Use App Service Backup which supports backup of application and connected database

   - **Use Azure Backup for Database**

   - Use Azure Site Recovery and setup backup for the database

   - Databases cannot be used with Azure App Services

   The maximum backup database size supported by Azure App Service is 4 GB since the size is larger than that, you need to use Azure Backup for Database.

3. You have a production application with the name kodekloud and the URL for the app is [https://kodekloudsales.azurewebsites.net](https://kodekloudsales.azurewebsites.net/). You would like to set up a custom domain name [sales.kodekloud.com](http://sales.kodekloud.com/). Which record type should you add to verify the ownership before you configure the alias?

   - SRV

   - CNAME

   - A

   - **TXT**

   You need to add the unique ID as the value of the TXT record in your domain to verify the domain ownership.

4. Out of the following CI/CD methods, which are considered as manual deployment methods? Select all that apply.

   - Bitbucket

   - **Dropbox**

   - **OneDrive**

   - **External Git**

   All choices except Bitbucket are manual deployment methods. Bitbucket, Git, GitHub, and Azure Repos are considered as automated deployment options.

5. Following the PaaS first approach, you started using Azure App Services. Before moving to production, you need to test your applications on Azure App Service. As per your development team, they require dedicated compute which is ideal for development and testing. What tier do you suggest? Make sure your suggestion is the cheapest option.

   - **Basic**

   - Free

   - Standard

   - Shared

   The Basic plan provides dedicated compute and is recommended for all development and testing purposes. Even though Free and Shared are recommended for development and they are cheap, they are using shared compute.

6. What factor determines the number of deployment slots you can have for an App Service?

   - Runtime of the webapp

   - **Tier of the App Service Plan**

   - Location of the webapp

   - Operating System of the plan

   App Service Plan tier decides the number of deployment slots you can have for a webapp. Deployment slot is supported only from Standard plan onwards.

7. Your production application is facing performance issues while too many users are accessing your application. Currently, your application is running on a Basic App Service Plan. As per your analysis, you require five instances to handle the load. Suggest a solution for this and make sure your choice is the cheapest one.

   - Enable autoscaling for Basic tier

   - **Upgrade to Standard tier**

   - Upgrade to Premium tier

   - Upgrade to Isolated tier

8. Which of the following can be swapped during a deployment slot swap?

   - CORS

   - Custom domain names

   - **Connection strings**

   - TLS/SSL settings

   Connection strings can be swapped during a deployment slot swap, rest of the choices cannot be swapped.



# CONFIGURING CONTAINERS

## Azure Container Instances

**Using Azure Cloud Shell**

1. Create resource group

   ```
   PS /home/sherwin> az group create -n az-acr-aci-demo -l eastus                                                       {                                                               
     "id": "/subscriptions/09be15e8-0638-4e99-8dc6-b53367de0941/resourceGroups/az-acr-aci-demo",
     "location": "eastus",
     "managedBy": null,
     "name": "az-acr-aci-demo",
     "properties": {
       "provisioningState": "Succeeded"
     },
     "tags": null,
     "type": "Microsoft.Resources/resourceGroups"
   }
   ```

2. Create azure container registries

   ```
   PS /home/sherwin> az acr create -n azaciowenrepo -g az-acr-aci-demo --sku Standard --admin-enabled true  
   {
     "adminUserEnabled": true,
     "anonymousPullEnabled": false,
     "creationDate": "2023-06-05T07:51:24.025582+00:00",
     "dataEndpointEnabled": false,
     "dataEndpointHostNames": [],
     "encryption": {
       "keyVaultProperties": null,
       "status": "disabled"
     },
     "id": "/subscriptions/09be15e8-0638-4e99-8dc6-b53367de0941/resourceGroups/az-acr-aci-demo/providers/Microsoft.ContainerRegistry/registries/azaciowenrepo",
     "identity": null,
     "location": "eastus",
     "loginServer": "azaciowenrepo.azurecr.io",
     "name": "azaciowenrepo",
     "networkRuleBypassOptions": "AzureServices",
     "networkRuleSet": null,
     "policies": {
       "azureAdAuthenticationAsArmPolicy": {
         "status": "enabled"
       },
       "exportPolicy": {
         "status": "enabled"
       },
       "quarantinePolicy": {
         "status": "disabled"
       },
       "retentionPolicy": {
         "days": 7,
         "lastUpdatedTime": "2023-06-05T07:51:30.853172+00:00",
         "status": "disabled"
       },
       "softDeletePolicy": {
         "lastUpdatedTime": "2023-06-05T07:51:30.853172+00:00",
         "retentionDays": 7,
         "status": "disabled"
       },
       "trustPolicy": {
         "status": "disabled",
         "type": "Notary"
       }
     },
     "privateEndpointConnections": [],
     "provisioningState": "Succeeded",
     "publicNetworkAccess": "Enabled",
     "resourceGroup": "az-acr-aci-demo",
     "sku": {
       "name": "Standard",
       "tier": "Standard"
     },
     "status": null,
     "systemData": {
       "createdAt": "2023-06-05T07:51:24.025582+00:00",
       "createdBy": "sherwin.adriano@outlook.com",
       "createdByType": "User",
       "lastModifiedAt": "2023-06-05T07:51:24.025582+00:00",
       "lastModifiedBy": "sherwin.adriano@outlook.com",
       "lastModifiedByType": "User"
     },
     "tags": {},
     "type": "Microsoft.ContainerRegistry/registries",
     "zoneRedundancy": "Disabled"
   }
   ```

3. Create Dockerfile

   ```
   PS /home/sherwin> code Dockerfile  
   ```

   Dockerfile

   ```
   FROM nginx:latest
   COPY ./index.html /usr/share/nginx/html/index.html
   ```

   index.html

   ```
   <html>
     <body style="background-color:green">
         <h1 style="color:white;"> Hello from container instances :)</h1>
     </body>    
   </html>
   ```

   

4. Build docker container

   ```
   PS /home/sherwin/aci> az acr build --file Dockerfile --registry azaciowenrepo --image greenweb:v1 .                          Packing source code into tar to upload...                   
   Uploading archived source code from '/tmp/build_archive_fbf48d0867d84ba7a480b984995dce42.tar.gz'...
   Sending context (520.000 Bytes) to registry: azaciowenrepo...
   Queued a build with ID: ca1
   Waiting for an agent...
   2023/06/05 08:23:32 Downloading source code...
   2023/06/05 08:23:32 Finished downloading source code
   2023/06/05 08:23:33 Using acb_vol_972886c9-aca1-42b1-9182-510722b76ef0 as the home volume
   2023/06/05 08:23:33 Setting up Docker configuration...
   2023/06/05 08:23:33 Successfully set up Docker configuration
   2023/06/05 08:23:33 Logging in to registry: azaciowenrepo.azurecr.io
   2023/06/05 08:23:34 Successfully logged into azaciowenrepo.azurecr.io
   2023/06/05 08:23:34 Executing step ID: build. Timeout(sec): 28800, Working directory: '', Network: ''
   2023/06/05 08:23:34 Scanning for dependencies...
   2023/06/05 08:23:35 Successfully scanned dependencies
   2023/06/05 08:23:35 Launching container with name: build
   Sending build context to Docker daemon  4.096kB
   Step 1/2 : FROM nginx:latest
   latest: Pulling from library/nginx
   f03b40093957: Pulling fs layer
   eed12bbd6494: Pulling fs layer
   fa7eb8c8eee8: Pulling fs layer
   7ff3b2b12318: Pulling fs layer
   0f67c7de5f2c: Pulling fs layer
   831f51541d38: Pulling fs layer
   7ff3b2b12318: Waiting
   0f67c7de5f2c: Waiting
   831f51541d38: Waiting
   fa7eb8c8eee8: Download complete
   7ff3b2b12318: Verifying Checksum
   7ff3b2b12318: Download complete
   0f67c7de5f2c: Verifying Checksum
   0f67c7de5f2c: Download complete
   eed12bbd6494: Verifying Checksum
   eed12bbd6494: Download complete
   f03b40093957: Verifying Checksum
   f03b40093957: Download complete
   831f51541d38: Verifying Checksum
   831f51541d38: Download complete
   f03b40093957: Pull complete
   eed12bbd6494: Pull complete
   fa7eb8c8eee8: Pull complete
   7ff3b2b12318: Pull complete
   0f67c7de5f2c: Pull complete
   831f51541d38: Pull complete
   Digest: sha256:af296b188c7b7df99ba960ca614439c99cb7cf252ed7bbc23e90cfda59092305
   Status: Downloaded newer image for nginx:latest
    ---> f9c14fe76d50
   Step 2/2 : COPY ./index.html /usr/share/nginx/html/index.html
    ---> 283c84a6d7b7
   Successfully built 283c84a6d7b7
   Successfully tagged azaciowenrepo.azurecr.io/greenweb:v1
   2023/06/05 08:23:39 Successfully executed container: build
   2023/06/05 08:23:39 Executing step ID: push. Timeout(sec): 3600, Working directory: '', Network: ''
   2023/06/05 08:23:39 Pushing image: azaciowenrepo.azurecr.io/greenweb:v1, attempt 1
   The push refers to repository [azaciowenrepo.azurecr.io/greenweb]
   ff02847e6121: Preparing
   4fd834341303: Preparing
   5e099cf3f3c8: Preparing
   7daac92f43be: Preparing
   e60266289ce4: Preparing
   4b8862fe7056: Preparing
   8cbe4b54fa88: Preparing
   4b8862fe7056: Waiting
   8cbe4b54fa88: Waiting
   7daac92f43be: Pushed
   ff02847e6121: Pushed
   4fd834341303: Pushed
   5e099cf3f3c8: Pushed
   e60266289ce4: Pushed
   4b8862fe7056: Pushed
   8cbe4b54fa88: Pushed
   v1: digest: sha256:99507f4c9421e920f774c9e8481fd0541814401023d3dd6a492a52867761c345 size: 1778
   2023/06/05 08:23:51 Successfully pushed image: azaciowenrepo.azurecr.io/greenweb:v1
   2023/06/05 08:23:51 Step ID: build marked as successful (elapsed time in seconds: 4.850013)
   2023/06/05 08:23:51 Populating digests for step ID: build...
   2023/06/05 08:23:52 Successfully populated digests for step ID: build
   2023/06/05 08:23:52 Step ID: push marked as successful (elapsed time in seconds: 11.736186)
   2023/06/05 08:23:52 The following dependencies were found:
   2023/06/05 08:23:52 
   - image:
       registry: azaciowenrepo.azurecr.io
       repository: greenweb
       tag: v1
       digest: sha256:99507f4c9421e920f774c9e8481fd0541814401023d3dd6a492a52867761c345
     runtime-dependency:
       registry: registry.hub.docker.com
       repository: library/nginx
       tag: latest
       digest: sha256:af296b188c7b7df99ba960ca614439c99cb7cf252ed7bbc23e90cfda59092305
     git: {}
   
   Run ID: ca1 was successful after 21s
   ```

5. Create container instance

   Goto Container Instances > Create container instance

   ![image-20230605163515995](images/image-20230605163515995.png)

   ![image-20230605164049745](images/image-20230605164049745.png)

![image-20230605164143287](images/image-20230605164143287.png)

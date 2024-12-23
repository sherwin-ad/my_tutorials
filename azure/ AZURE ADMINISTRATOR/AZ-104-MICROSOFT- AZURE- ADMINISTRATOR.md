# AZ-104: MICROSOFT AZURE ADMINISTRATOR

## Course Git Repository

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

- Azure Load Balancer is a Layer 4 load balancer which supports Azure Virtual Machines and Azure Virtual Machine Scale Sets as backend.

- Supports all TCP/UDP protocols 

- Load Balancer is offered in two SKUs: Standard and Basic SKU

  **Basic Load Balancer**

  - Ideal for testing and development. No SLA offered

  **Standard Load Balancer**

  - Recommended for production scenarios because of the SLA. Offers  HTTPS health probe

  | **Feature**       | **Basic**                        | **Standard**                             |
  | ----------------- | -------------------------------- | ---------------------------------------- |
  | Backend pool size | Up to 300 instances              | Up to 1000 instances                     |
  | Health probes     | TCP, HTTP                        | TCP, HTTP, HTTPS                         |
  | Redundancy        | Not available                    | Zone redundant and zonal redundant       |
  | Multiple frontend | Inbound only                     | Inbound and outbound                     |
  | Security          | Open by default. NSG is optional | Closed, unless traffic is allowed by NSG |
  | SLA               | Not applicable                   | 99.99%                                   |

- Security is managed with the help of Network Security Groups

### Public Load Balancer

![image-20230814092852033](images/image-20230814092852033.png)

- Ideal for public facing workloads

- Public load balancer will have public IP address

- Incoming traffic’s public IP address and port number will be mapped to the private IP address and port number of the backend servers.

- With the help of load balancing rules, we can distribute the traffic across backend servers.

- Used in all public facing workloads which require load balancing.

  

### Internal Load Balancer

![image-20230814093212501](images/image-20230814093212501.png)

- Ideal for internal workloads
- Internal load balancer doesn’t have public IP address as frontend
- Incoming traffic inside the virtual network or from a VPN can be distributed across the backend servers
- This load balancer is never exposed to the internet, so the IP addresses and port numbers are not visible to the internet.
- Used in internal resources that needs to be accessed from Azure or on-premises via VPN connection.

### Load Balancer Rules

![image-20230814093819036](images/image-20230814093819036.png)

**Load balancing rules**

- The incoming traffic to backend pools is distributed with the help of load balancing rules. We can create frontend IP to backend IP port mapping and the traffic is distributed accordingly.

**Inbound NAT rules**

- Instead of backend pool, we can target a specific virtual machine and create a NAT rule. Frontend IP and port combination is used to send traffic to IP and port of the designated VM.

**Outbound rule**

- Allows instances in the backend pool to communicate to the Internet and other endpoint. 

### Session Persistence

**None (default)**

- Request will be routed based on a 5-tuple hash. Five tuple comprises of Source IP, Source Port, Destination IP, Destination port, and Protocol. Requests can be handled by any VM and the chances of getting a new VM for every session is very high.

**Client IP**

- Client IP is called two-tuple where the hash of source IP and destination IP is used to route the traffic. Requests will be handled by the same VM if the source IP or destination IP doesn’t change. 

**Client IP and protocol**

- This is also called as three-tuple hash, where the hash of source IP, destination IP and protocol is used to route the traffic to the VM. Requests coming from same IP and protocol will be handled by the same VM.



### Create Load Balancer

1. Goto > Load Balancer > and click Create load balancer

![image-20230814100925000](images/image-20230814100925000.png)

2. Frontend IP configuration

![image-20230814101400384](images/image-20230814101400384.png)

3. Backend pools > Add backend pool

![image-20230814101838199](/Users/sherwinowen/my_doc/my_tutorials/azure/ AZURE ADMINISTRATOR/images/image-20230814101838199.png)

4. inbound rules > Add a load balancing rule

![image-20230814102701576](images/image-20230814102701576.png)

5. Add inbound security rule

   Goto Vrtual machine > Networking > Add inbound port rule 

![image-20230814105526465](images/image-20230814105526465.png)





## Azure Application Gateway

kodekloud-azure/AppGateway

```
$ ls -l 
total 44
-rw-rw-r-- 1 sherwinowen sherwinowen 1795 May 10 09:03 jumpbox.sh
-rw-rw-r-- 1 sherwinowen sherwinowen 8206 May 10 09:03 lab-infra.ps1
-rw-rw-r-- 1 sherwinowen sherwinowen  127 May 10 09:03 sample.html
```

![image-20230814110950315](images/image-20230814110950315.png)

**Layer 7 Load Balancer**

- Manages HTTP, HTTPS, HTTP/2, and WebSocket requests. Requests will be routed to the backend pool. Web Application Firewall can be added to Application Gateway as an option component.

**Routing and features** 

- Requests can be routed to the backend pool based on URL also known as path-based routing. Also, we can host multiple sites behind an application gateway. Features includes URL Redirect, SSL termination, Rewrite HTTP headers and Custom error pages. 

**Backend pools**

- The web servers can be hosted in Azure Virtual Machines, Azure Virtual Machine Scale Sets, Azure App Services, and even on-premises servers.



### Application Gateway - Components

![image-20230814111442653](images/image-20230814111442653.png)



### Application Gateway – Routing Rules

**Path based routing**

- Based on the path in the URL, we can route the request to different backend pools. Ideal for routing requests to different backend pools optimized for different paths.

![image-20230814112652574](images/image-20230814112652574.png)

**Multiple-site routing**

- Multiple sites can be hosted behind a single application gateway. Based on the domain, the request can be routed to the backend pool hosting the requested domain.

![image-20230814112807794](images/image-20230814112807794.png)

### Create Application Gateway

1. Goto Application gateway > Click Create

  ![image-20230814143741725](images/image-20230814143741725.png)

2. Create Application Gateway subnet

   Click Manage subnet configuration > Click Subnet

   ![image-20230814144225342](images/image-20230814144225342.png)

![image-20230814144839699](images/image-20230814144839699.png)

3. Frontends

   ![image-20230814145126047](images/image-20230814145126047.png)

4. Backends

   Click Add a backend pool

   ###### ![image-20230814150129566](images/image-20230814150129566.png)

5. Configuration > Add a routing rule

   Click Add a routing rule

   **Listener**

   ![image-20230814151205773](images/image-20230814151205773.png)

   **Backend targets**

   ![image-20230814151835262](images/image-20230814151835262.png)



  Click Backend settings > Add new

   ![image-20230814151735242](images/image-20230814151735242.png)

**Add multiple targets to create a path-based rule**

![image-20230814153730330](images/image-20230814153730330.png)

![image-20230814153849471](images/image-20230814153849471.png)

6. Add Backend pool targets

   Goto Application gateway > color-app-gw > Click Backend pools

   ![image-20230814182507567](/home/sherwinowen/Documents/my_tutorials/azure/ AZURE ADMINISTRATOR/images/image-20230814182507567.png)

   ![image-20230814182420059](images/image-20230814182420059.png)

## Other load balancing solutions

### Azure Front Door

- Modern CDN solution that provides reliable, fast content delivery.
- Azure Front Door is a global solution which leverages the Microsoft’s global edge network with hundreds of global and local point-of-presence locations. These endpoints are distributed across the globe and closer to your customers.
- We can deploy our solutions in multiple regions and load balance using the Azure Front Door. Path based routing and multiple-site routing is available.
- Web Application Firewall can be added as an optional component.

### Azure Traffic Manager

- ATM or Azure Traffic Manager is a DNS based load balancer. Traffic coming to your public facing applications can be distributed across the globe with the help of ATM.
- As this is a DNS load balancer, it uses DNS to direct the client request to an endpoint based on the routing rule we configure. Traffic Manager finds the best endpoint for you based on the routing and returns a DNS response with the endpoint name. Client then directly reaches out to the endpoint.
- ATM can be used with the public facing services deployed in Azure or non-Azure environments. Routing methods includes Priority, Weighted, Geography, Performance and Nested Profile.

### Comparing Load Balancing Solutions



| Feature          | Application Gateway                                          | Front Door                                                   | Load Balancer                                                | Traffic Manager                                              |
| ---------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Usage            | Optimize delivery from application server farms while increasing application security with web application firewall. | Scalable, security-enhanced delivery point for global, micro service-based web applications. | Balance inbound and outbound connections and requests to your applications or server endpoints. | Distribute traffic optimally to services across global Azure regions, while providing high availability and responsiveness. |
| Protocols        | HTTP, HTTPS, HTTP2                                           | HTTP, HTTPS, HTTP2                                           | TCP, UDP                                                     | Any                                                          |
| Internal support | Yes                                                          |                                                              | Yes                                                          |                                                              |
| Cross Region     | No                                                           | Yes                                                          | Preview                                                      | Yes                                                          |
| Environment      | Azure, non-Azure cloud, on premises                          | Azure, non-Azure cloud, on premises                          | Azure                                                        | Azure, non-Azure cloud, on premises                          |
| Security         | WAF                                                          | WAF, NSG                                                     | NSG                                                          |                                                              |

https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/load-balancing-overview#reference-architecture-examples

## Azure Bastion

![image-20230815094815097](images/image-20230815094815097.png)

**Direct RDP and SSH in Azure Portal**

- No need to deploy or download SSH and RDP clients to your computer, you can RDP/SSH from browser.

**Public IP is not required**

- Since we are connecting via Bastion Host, there is no need to main public IP addresses for our virtual machines.

**No need to tweak NSGs**

- No need to manage and write complex rules in your NSG as Bastion is connecting to private IP address

**Port scanning protection**

- Since we are not exposing any public IPs, attackers cannot perform port scanning.

**Hardening**

- Bastion is a platform managed service and hardening in one place only.

**Basic and Standard SKUs**

- Basic SKU provides base functionality as in direct RDP/SSH access. 
- The Standard SKU enables premium features that allow Azure Bastion to manage remote connectivity at a larger scale.

### Create Bastion

1. Goto Bastion > Click Create

   ![image-20230815100134708](images/image-20230815100134708.png)

2. Create Bastion subnet

      Click Manage subnet configuration

      ![image-20230815100428997](images/image-20230815100428997.png)

      

      ![image-20230815100617200](images/image-20230815100617200.png)

3. Connec to VM thru Bastion

      Goto Virtual Machine > [VM Name] > Click Connect > Click Go to Bastion 

      ![image-20230815102300087](images/image-20230815102300087.png)

      ![image-20230815102427562](/home/sherwinowen/Documents/my_tutorials/azure/ AZURE ADMINISTRATOR/images/image-20230815102427562.png)

      

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

### Virtual Network Peering

![image-20230808085342298](images/image-20230808085342298.png)

- High speed data transfer, easy configuration and great performance
- Uses Microsoft backbone network for data transfer, so privacy and low latency is offered in peering
- Provides connectivity between Azure virtual networks. The virtual networks can reside in the same region, different region, same subscription, different subscription, same tenant or different tenant



#### Types of peering

1. **Global VNet Peering**
   - Peering of virtual network between region to another region
2. **Regional VNet Peering**
   - Peering of virtual network on the same region



#### Creating Virtual Network Peering

1. Goto Virtual Networks > [Vnet Name] > Peerings and Add

   ![image-20230626112858034](images/image-20230626112858034.png)

   **wus-eus peerings connection**
   ![image-20230626113225691](images/image-20230626113225691.png)

   **eus-wus peerings connection**

   ![image-20230626113332646](images/image-20230626113332646.png)

## Azure-to-on premises Connectivity

![image-20230626093305892](images/image-20230626093305892.png)



### VPN GATEWAY

![image-20230626113613344](images/image-20230626113613344.png)



#### VPN Gateway SKUs

![image-20230626114021194](images/image-20230626114021194.png)

**SKU selection**

- SKU is selected based on the number of connections and throughput you require.

**Resizing**

- Within generation, we can resize the VPN gateway based on the requirement.

**Basic SKU**

- In addition to the above SKUs, we have Basic SKU which is considered as legacy and should not be used. 

## Steps VNet-to-VNet Connection

1. Create Gateway Subnet in both virtual networks.

   **Gateway Subnet**

   - VPN Gateways requires a dedicated subnet to deploy the gateway. First, we need to create Gateway Subnet in both of our virtual networks.

   Goto Virtual networks > [Vnet Name] >  Gateway Subnet

   ![image-20230626144621691](images/image-20230626144621691.png)

2. Create the VPN gateway in both virtual networks

   **VPN Gateway**

   - Once the Gateway Subnet is created, we will deploy the VPN gateway to the subnet.
   - Creating a VPN gateway would take around approx.: 40 minutes.

   Goto Virtual network gateways > and click Create

   ![image-20230626151705525](images/image-20230626151705525.png)

   

3. Create the VPN connection

   **VNet-to-VNet connection**

   - After creating the VPN gateway, then we need to create VNet-to-VNet connection from the VPN Gateway

   Goto Virtual network gateways > [VNet GW Name] > Connections > and Click Add

   ![image-20230626155421521](images/image-20230626155421521.png)

   ![image-20230626155512061](images/image-20230626155512061.png)

   **Check connections**

   ![image-20230626160616115](images/image-20230626160616115.png)

   


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

   Goto Local network gateways > Create

   

4. Provide Public IP address of your Azure VPN Gateway in on-premises VPN device

5. Create Site-to-Site VPN connection



## Point-to-Site connection

1. Create Gateway Subnet in Azure Virtual Network to deploy the VPN Gateway.

2. Deploy VPN Gateway to the Gateway Subnet in Azure virtual network

3. Configure your Point-to-Site in VPN gateway by selecting the address pool and authentication method

   Documentation
   https://learn.microsoft.com/en-us/azure/vpn-gateway/openvpn-azure-ad-tenant

4. Download the VPN client configuration to your client machine

5. From your Windows, Linux, macOS or mobile clients; connect to the VPN

## Gateway transit

- Hub spoke architecture

![image-20230808102630052](images/image-20230808102630052.png)



# High Availability

1. Active/Standby
2. Active/Active

![image-20230808110226157](images/image-20230808110226157.png)

**Default count**

- There will be always two instances of VPN Gateway, default selection is Active/standby

**Cost**

- The cost of the gateway includes the cost of two instances. Regardless of whether it’s active/standby or active/active cost will be same.

**High availability**

- High availability can be ensured by enabling Active/active configuration. You should make sure that you have similar setup in on-premises.

  

# ExpressRoute

- Redundant L3 connectivity
- Within a geography, connectivity is available to all regions
- Bandwidth options vary from 50 Mbps to 100 Gbps
- ExpressRoute circuit is offered in Local, Standard and Premium SKUs
- In Local SKU, you will be charged under the Unlimited plan. In unlimited outbound data transfer is free.
- With Standard and Premium SKU, you can select between a Metered or an Unlimited data plan. In metered, you will be charged for outbound data transfer.
- With the addition of premium add-on, you can get global  connectivity.

![image-20230808130624314](images/image-20230808130624314.png)

**Private connectivity**  

- ExpressRoute offers private connectivity between on-premises infrastructure and Microsoft datacenters.

**Partner network**

- Traffic is routed with the help of partner network and public internet is not used.

**Features**

- Reliable, secure, low latency and high-speed connection.

![image-20230808131413755](/home/sherwinowen/Documents/my_tutorials/azure/ AZURE ADMINISTRATOR/images/image-20230808131413755.png)

**Co-located at a cloud exchange**

- If your facility is already co-located with cloud exchange, then virtual cross connections to Microsoft cloud can be provisioned through the co-location provider’s Ethernet exchange. L2 and
  managed L3 cross connections are supported.

**Point-to-Point Ethernet connection**

- By leveraging point-to-point Ethernet links, you can connect your on-premises network to Microsoft cloud. L2 or managed L3 connections are supported.

**Any-to-Any (IPVPN)**

- With the integration of your WAN to Microsoft cloud, you can make it look like Microsoft cloud is one of your branch offices. Supports managed L3 connectivity.

**Direct model**

- Establish connectivity by directly connecting to Microsoft’s global network at a peering location nearby.

## Co-existing ExpressRoute and Site-to-Site

![image-20230808132034452](images/image-20230808132034452.png)

**Failover path**

- Though ExpressRoute has redundant connection, we can use S2S connection as a failover path for ExpressRoute

**Branch office connectivity**

- We can use S2S connectivity to connect to branch offices or other sites which are not connected to ExpressRoute.

**Separate gateways**

- ExpressRoute and VPN requires separate gateways for communication.

# Virtual WAN

![image-20230808132432795](images/image-20230808132432795.png)

**Brings together all connections**

- We can connect Point-to-Site, Site-to-Site, Virtual Network and ExpressRoute connections to VWAN.

**Seamless connectivity**

- Connects Azure virtual networks and resources to the hub seamlessly.

**Advanced architecture**

- With the help VWAN, we can advance our hub-spoke architecture. End-to-end traffic flow can be
  visualized.



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

2. Create azure container registries/repository

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

   ```
   PS /home/sherwin> code index.html
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



## Container Groups

- Collection of containers that get scheduled on the same container host machine they share resources, lifecycle, local network, and storage volumes.



## Azure Kubernetes Service

See Az-104-azure-administrator.pdf



## AKS Networking

- Services in Kubernetes provide internal and external network connectivity to pods

See Az-104-azure-administrator.pdf



## AKS Storage

See Az-104-azure-administrator.pdf



## AKS Scaling

See Az-104-azure-administrator.pdf



## AKS Bursting

See Az-104-azure-administrator.pdf



## AKS Demonstration

1. Create Kubernetes Cluster

​	Go to Kubernetes Services > and Click Create Kubernetes cluster

![image-20230725141335855](images/image-20230725141335855.png)

Select the container registry we created

![image-20230725142104459](images/image-20230725142104459.png)

2. Get the credentials of kubernetes cluster and add to opur context

   ```
   PS /home/andrea> az aks get-credentials -n az-aks-cluster -g az-aks-demo                Merged "az-aks-cluster" as current context in /home/andrea/.kube/config
   ```

   ```
   PS /home/andrea> cat .kube/config 
   apiVersion: v1
   clusters:
   - cluster:
       certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUU2VENDQXRHZ0F3SUJBZ0lSQVBISzNtcFlGZDRJU1paQU01MC80WTR3RFFZSktvWklodmNOQVFFTEJRQXcKRFRFTE1Ba0dBMVVFQXhNQ1kyRXdJQmNOTWpNd056STFNRFl4TkRFM1doZ1BNakExTXpBM01qVXdOakkwTVRkYQpNQTB4Q3pBSkJnTlZCQU1UQW1OaE1JSUNJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBZzhBTUlJQ0NnS0NBZ0VBCm1IUE9ZS0pKNGM5dlNVTmVFcXpvMTlUdXU1RXNtUUlkeStPUDNjUkgxZjBGeCtaak9NdFkzM293WEpkUHVxdGQKUEFGRG9xMGxYN3RCYlBZZTVNMlNVVHE2KzBQYmZIL1lQQzNOOVVkaDZFUXJweU9NT21qSjRLUmFyT0liZlA0SQpLbkRsVm5MdXNJcDJCTFVBaGJWWVk0MmZFc1NESytROTNOS2wzdGxPMWhnNGF2TWJBTDlZbWlMSjhka200ajIxCldKazNtclJNYW1ESnJ1Z2pGRU5CWG9SVmhWT3g4S2ZoVjdkQXJpRUJrTXdLbGxrWWRaazQ4dXZYMVJMNnI1OVEKY3dMQXRFa3cxakpRWWpleFY3eXFTTys5TWx1MmhxRmNkdG1vWmNpWUw1cDlRaDZHVUkxb2tTZ2ZQSnJXSlp1dwo5T2pXQnZBME1SbzJxbStBRnhMa2hhV09yRU9aT0J5RTlxc21lRzQzYXIrSDRBQ0FIUlV3M2lrZlI5UmM0Z2lRCk1OeFFLNi90UnI1MmplSzhiR2FIckpDdHZlTEM1RTFDNGczMWxNRUlhVWlHM1RjUnh4dis5c3BNWk5qL2FGY1AKN2U3VFJaQXFtOENKWG5KQTA3RVFySkdsRndKRGNOT1EvdEhsbnkzOU9MbU5GWVV1SW9WMkl5K2M2bjIwNkEzRwptenYxREdFSlh1bmhucXVhN1hLUUxXdjVNaUVzakRkSWhyYXJyR0RmelpDUGp5ODMxaGNLbUo3WmJuOStvbmo3CldCeC9ZT3R3aG5lbjlQRkVydEp6MURXc2FvdjlrNzdIdHk3b3ArZEVwUUs3Y2pib1ovRWhwZjZFZ2liMzNkVjQKL3doU2tMNlRyUG5KVUFQU2o3Z2FzSExyTkNDN2lpNHo4SVRlS0ZnN3d2TUNBd0VBQWFOQ01FQXdEZ1lEVlIwUApBUUgvQkFRREFnS2tNQThHQTFVZEV3RUIvd1FGTUFNQkFmOHdIUVlEVlIwT0JCWUVGRUpMNk03ZjFLL1hGVWZuCisrSHBaU0dhbWtkS01BMEdDU3FHU0liM0RRRUJDd1VBQTRJQ0FRQXJteUQ1amQ2YlI0amlLV2c5ZXdoc2dTQTAKZHN6S3pZNHhqTkVOUzB4WlVudlFDWEIvWnBIcjE0bXBnYklIVVA0QzZFdy9xTnU0eHVITnhWd1laSXBvTDFmdApXOHF6RnRpckZtOW9nRmprUk4zYVQvRXJDU3hBaHE0c3FkQmFzdmJ5QXRPM1ZnSVFxMUtLMW96ODM3bm1YSUZYCkpGM0RjNTVqWURjc1JjMTU3dVUrcHkxN2JBeGdHWGYzK2Z5K0MzSFZHRER6VVN0bTcybmFSZjBrMEtldnd0RWkKWWpOT084RVZvTTExNW5MeStQc1l3dSsvSzVUMVZCcEFCVXh3VzVDVkZnWjN0L1lOUXkyREdwNkU4cG1yQ1k5aQpMUE9hd1YvTlhIMTNML0FBN3FFaUVZanI3OUM2dkpjdUtuazhOaFdqN1ZRWUcrdUNZZXFubWdrcHdSbk5jWllxCjZ3c3QvSFdseGRobDJ2T3ZCa0ZwMlRhRmx5NjB1YmxtbldUaG1VSEs0NVhPeFpZVTJUWFlRSDNrTFFjWk5TWW4KWStLNXM0dGxzT2tzU2Vyd2FXOUJySTNQTFBQMHdDVVFzd2NEcjFuekxBN0wzQnNrVWZvREoyb1Y1MVNudEtlKwplcGp3Qm50YTVnZjVJVnlyWnVqTmRVdHo2eDZRQnJFRE5VUGhscjhiODlWT3RZZDA2MFJSZVk4UHhFL2d3VVROClErRFk2VDRqUjdxbVkwNGNKVXNFUldiV1IvVEc3Q2YwNFhvc0dwd3dvTzFRUUV3eEFXc2Rzd2VLeGxxTlliTUoKZVV6eElBWXRWbDBSZkIvemhBUmpSdGp6VjFCbHZUYnJPOE0yZUpGcktEMnRpV01ON0h6Q3NUa3hHRzR2dHJhMAp1RVFmdEo2WlBmZ0tjbWR4MHc9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
       server: https://az-aks-cluster-dns-p9x5xnip.hcp.eastus.azmk8s.io:443
     name: az-aks-cluster
   contexts:
   - context:
       cluster: az-aks-cluster
       user: clusterUser_az-aks-demo_az-aks-cluster
     name: az-aks-cluster
   current-context: az-aks-cluster
   kind: Config
   preferences: {}
   users:
   - name: clusterUser_az-aks-demo_az-aks-cluster
     user:
       client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUZIakNDQXdhZ0F3SUJBZ0lSQUlnK1BhbnZCb1dsTnpyK1BCdFhpZUl3RFFZSktvWklodmNOQVFFTEJRQXcKRFRFTE1Ba0dBMVVFQXhNQ1kyRXdIaGNOTWpNd056STFNRFl4TkRFM1doY05NalV3TnpJMU1EWXlOREUzV2pBdwpNUmN3RlFZRFZRUUtFdzV6ZVhOMFpXMDZiV0Z6ZEdWeWN6RVZNQk1HQTFVRUF4TU1iV0Z6ZEdWeVkyeHBaVzUwCk1JSUNJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBZzhBTUlJQ0NnS0NBZ0VBemMwcmxtK1dicGZoeG9jQUxPWXYKZmV0aFljSzFmSDA0c2tzQUVlanNwc3hNaUZydnlKaEh2SWRLUytIaWg2SUJtMks5a3ZIc1BKTXNua08rRFVFVwpDbUMzdm85VUo2OFJLN081eWE4ZHVzL01HOXd3SE9NRkRHdTZSOXVDbEdHYjBxUXdLV1RTblV0SkJwMjVoVTBGCnNzWnQwdTVPUk4xL0VzYSs0SUw1TjlQMUNXdVcvd2ZUYnhNZC9peVQxdzV1SXNjamxmeVhUREEzdGpJMW1oeFMKeHFiTVE1ck5tZnFJbW85YjFNY1NHbEtJNjVmRkdiaTVNeXNIYUN0LzczajNLTEppcHhydWQ2dXllcmFGMFd5UApxY2k2eDJ4MGR2Z1A1NFhvT1pIbHpIQVpQck1GamZzb25pNG91UUtObGE4MU9kdkc3cUFtMWlIUUNrRDFLQ3NkCk16bnVWZm9xbVNMVHVvTHJlRVNWQnNFVnYzTXhjMEFrMWQzUzFPRVZwZkpmS292c1pxUmVXMjl6cUQ4VjMzQmgKelJYRXZKUit5d2pjY2JiY2NHMmtidTdoR21IWDJUazMzcEFHSlNkTC9vT2lmWE8xZUplNFhwNUdQbmEyY0ZSMwpJRkZ4YUk2MEpzWTJXaHhySjhZNFR1NDRVZkl1T05PTWZyaWxETGQ4WlFMQ1RpWWorcGJkNG0yOFQyVm5GUHVkCkZvLzdVZkJ1bitTQytMT0J5Q0VDdVd4WnkyWnl2T3Q3UlRZWGZsbmVVbjY4QUJDazB3MEFxeEZTNnQzRk53MWIKYyt6NFA3dy90WGxOZTYwa2dwRU90U00zd01aU3FOblI0M2xWaGQ3ZU43OEREbzQwVW9wYm5ZQmhpWFFNbDZVbwpSTklrWHN2NGc4YkxSYzd4RXdjMngwRUNBd0VBQWFOV01GUXdEZ1lEVlIwUEFRSC9CQVFEQWdXZ01CTUdBMVVkCkpRUU1NQW9HQ0NzR0FRVUZCd01DTUF3R0ExVWRFd0VCL3dRQ01BQXdId1lEVlIwakJCZ3dGb0FVUWt2b3p0L1UKcjljVlIrZjc0ZWxsSVpxYVIwb3dEUVlKS29aSWh2Y05BUUVMQlFBRGdnSUJBQTcxQ0NYeGo5dlA1cFYzOFlSeApja1l5ZXlHK2cyVG4rM2tiZnpBRk5BZjZGc1k0OXB1UEZVOE8xdFVqa1BROC9YdHdIaFFobGRReGh1L2szL3pXCmZrRVRWMXY1djdrVmpkQW1xTkNHWDdKc3cxWnRNYjRJZUlYRmllUDJFSzArRzhUNUVZcG8xMTNhcWJDeUhVTEQKaFBkcTB2ZjhCem84MG9ZOEszYW5WTUlFYUZhK2o5NG1oMmp2aG54MFA3bXhLbFdOL3d5OXZoMUY3SlRpSW1KeQpEYzZSekVSc0lGRk40VzgzMk9LVndLWTIzbzRIWmJ0WC9Xc1hPZXZ1UmdQalN2ZTYxelBaVXE1YXl5V3RoeE9wCm9MSjlDL3BCZDZzWS9xY0dxL0t0L1k2MHMxekJlT0FMTWRDQUpjUFZpT2V3KzFaMTlUYXhleTUrYkFvRHlHUGUKdXgzMW9waWZsS2ZiYnhKWDMyMlhhQUhlWXFhNUc2cVJvOG5ydFY2VlVLRGFXNVZCZDFWcnFyZHBtQW5nVEFnOAo5WjFQWm0zQkpqQVAyUENxSEJrU2llSWRxbDBVa0lOeXBlVU5OMU5RMVIxb01EdWV3NVVBMjV5djcrcXRZWE9ECmNTeFpyc2l1QUZmVFBDM0Uzd0FLRXNvS3BmUkpEcFliM1hYZHdXOXpMZG1hLzNGSDFXa015RnBSbksyV0loa08KbkhFbmZDYlpEZlVIUUtYcDIraUhqUW0wZHR3WlJlQlZMemJqMm5WOGRpMTFVb3lRcG5PZjBza2NVTTM0YlRCOAoreCt0bE1yYk5mL2tsb3hCUHgvTFN4Qk5NLzhHcjMwOTV0em1lSENQRjF0blRCSzJTQjlBSnlPaXVsNWVGbWU3CjBoM1Bwa2M2dkRiWnVlRFJReUNQRytGWQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
       client-key-data: LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlKS1FJQkFBS0NBZ0VBemMwcmxtK1dicGZoeG9jQUxPWXZmZXRoWWNLMWZIMDRza3NBRWVqc3BzeE1pRnJ2CnlKaEh2SWRLUytIaWg2SUJtMks5a3ZIc1BKTXNua08rRFVFV0NtQzN2bzlVSjY4Uks3TzV5YThkdXMvTUc5d3cKSE9NRkRHdTZSOXVDbEdHYjBxUXdLV1RTblV0SkJwMjVoVTBGc3NadDB1NU9STjEvRXNhKzRJTDVOOVAxQ1d1Vwovd2ZUYnhNZC9peVQxdzV1SXNjamxmeVhUREEzdGpJMW1oeFN4cWJNUTVyTm1mcUltbzliMU1jU0dsS0k2NWZGCkdiaTVNeXNIYUN0LzczajNLTEppcHhydWQ2dXllcmFGMFd5UHFjaTZ4MngwZHZnUDU0WG9PWkhsekhBWlByTUYKamZzb25pNG91UUtObGE4MU9kdkc3cUFtMWlIUUNrRDFLQ3NkTXpudVZmb3FtU0xUdW9McmVFU1ZCc0VWdjNNeApjMEFrMWQzUzFPRVZwZkpmS292c1pxUmVXMjl6cUQ4VjMzQmh6UlhFdkpSK3l3amNjYmJjY0cya2J1N2hHbUhYCjJUazMzcEFHSlNkTC9vT2lmWE8xZUplNFhwNUdQbmEyY0ZSM0lGRnhhSTYwSnNZMldoeHJKOFk0VHU0NFVmSXUKT05PTWZyaWxETGQ4WlFMQ1RpWWorcGJkNG0yOFQyVm5GUHVkRm8vN1VmQnVuK1NDK0xPQnlDRUN1V3haeTJaeQp2T3Q3UlRZWGZsbmVVbjY4QUJDazB3MEFxeEZTNnQzRk53MWJjK3o0UDd3L3RYbE5lNjBrZ3BFT3RTTTN3TVpTCnFOblI0M2xWaGQ3ZU43OEREbzQwVW9wYm5ZQmhpWFFNbDZVb1JOSWtYc3Y0ZzhiTFJjN3hFd2MyeDBFQ0F3RUEKQVFLQ0FnQk1JUEJWeHRONzk1MGlKa0JQVzVzSDFuR0FpMWs5UXNrZFV4Y2tpT2c1ejJza0taZDN1YlVYcldnegpaOHkzWlp0NGttOFVFMy9TN0pKZHZTdHBsY0VFZDhDZ3NqNXNLNXVMY2dGdzlPRm5nSVM5YlpjeXFGdnV1MDcrClU5b2E3M3lIMEFxczFVbi91NkM0M05HSzJQSVpyc05qZXBuamFaZ2ZKdnZtNnl3cmxiR1lHWCtTdVo5aUFFMWcKLzdaMG9EYm5rSWkrYStDLzR6cElvSXdwaFA2dDAzZk9MazZOL2hwWUtsM0srUlRlUGRlK1pyY1hpN2llai9VKwplSkRyMGZDRDBuRWg1WmwvRlRtQm9WRWhKaXFDb09sTzZmU3ZLWllnaSsxYWxuak9SazFnWHpMWDBhZTEwOWRtCmtPWTFEOG45ckNvTGpaeXdLM1BjeHlpcEFrSGJUZ0dFcFh4bTlyT3dLbnppRnJXMHNoQi9sNEp6SG5uUDNEdFYKeS9KSmV5L3B1VVZrb0FTL1pWemxBM1UwaDgwYnNkM0lPSEJ6QmFlUGFWcW96NVplNWw4NWVnRUZwN3czYTBEcwpjd2FHclZKYUpzTlZWS0V3Y3kxK0pVMFh6UVorcWFLK3ZCWW5Nenl5alBqUnBnSjd1V0RsQTdNWnUrQWxhenN0CmJlT0JYVHdicmdIczRONjFyOHhTeUZVTmUvakFtcG1MWWtPWTJlR3ErWW9rT3I2RTJ6eGtnVnl3U2JZVUxlY1YKZVZSZmc4TFV6VVZTRytUejk2OFZhakZzUXByb0FjcVVMQkRsUlpCM09hVitXa3huVWdibTBrVnVkUmtuSTNNOAoxRVBoNFc1Tlp6MFNaTTBhQkJsSnJaNnJtTlNBcVB6NnJUS2xVQWdTVjBCU1NkbCtUUUtDQVFFQTlnN0ZSYmtxClJZelJ2WFZ6K28vaHIwMm1lNkwzcDM3RUowZVBSYTIxSWZSR0Nka00yM1h1cEwxYlVXemhLZnM4ZGtJc21HQTMKV2hwcWg0eERIenNTSFN4M2I2Q3dSZk9OWUpHZkwwQWR6N3RCWHNxYmtvbnVmNityZ2dpN21ZaGQ5azFCdzZJZgpBYlNYajRrUEI2cWlpR0JvcDk2UnA0SEhUSTNBdVJmZ0Vmanc0NUFOMDhueXc1VFlqbURIZXBmcHROUkZPZ1NNClppN2I5TkpqOXZXazM2UVZMejQ2bXF4dFRsdlN3WE50SVZnM21KWnlIei8wa3dzRldER3NrQTVFTCtoR1hvaVkKczZTcXM3MlcrYUJ0dFh1ZUxqQXFWdElEb0x6N3JQZGQ0NmhCNHkyamNsTkhnTUtKQnN0bmluaVUvbXE4S3dUcgo0UWxUN1J4QWdlRGZQd0tDQVFFQTFoMzgwM3BKdHMwS1pFZHo1a0QySlBUQ0lsVnIvV0QraS9HbCs2QWxUVGdVCmZWcXBiQTFXWkxrVmxMdnl1UHBOR0FDVTRkbXJiakNBNHdkZ1ZzWGh4NWsvQVpzM21XVHAxN3RScXNLRnRnUFEKbjk0NDdCQ1lZL2RoNWJreG8rWVNZeEU1ZkZ2M2VFUTl1UVRmdVRnbkgrdTNuR2JEZzhDZG1ZTkRhRzh4U2ZyVAp1b3B1enJnVTVKb3Q0QzZCY25kazJjYzRXUE5Cc3FnK1NuNjJtRWwzRXg5S2QzQWlFZU9kbFhyODQvbGtEeXVKCk1hSEVnVUF1V2F0dWhXTlNBLy82U2N2cXVUUkl1anlQV3RHVmxhWVVySWdJOFZ5by82RTVrTjY4ODBrV09VQUMKMnVDOGNWZDQvYzAycHUybHZzQ0dRam5seEFjU0dTdEEyRFJVWDAwNWZ3S0NBUUVBcm9mdm1mTXJic1hpQi9jRgoyeGF2eUg3VnRpRDBkWlJQWW1VNTFQelAzRk8rVWtIcEFzbjJDbGhlSzdXRlNSZngzUmczTmFZWjNRbWJ3cVhVCi9wUVIxeXV4VkRhd2tnMmRuSC91WDcrazViSTNQaHVNbWpiSU96M0o4NlJxSFE5RFJ1K3AxREJzdWZMMUJsVDcKbWo2SXB4OXJYSmRjeldvYWljeUtoVC9RS2k5Zi9xb3hoS1pjVWlxRUtRbXd0TjZJWVVHb0VPMGxBVjMvbXZxWQorWlZuNjFJaHpLN2hOdEZUZng5V3NPMUUzVUFMdjJvSGJPOGFkaXA5RWYrNkhUeGhWWEgyYUJ1UDVPektRRkFjCmhOZ3N1V3dEMlZORTFPeUdzajhhYmFmUXF5aXdBNHBkd3p3YkhkUGZDampCS3RFNUxmVmJuMUFRV0VFYmpMWmIKYzBTa1ZRS0NBUUJZMzBXTGVaeVRGWFFVdjF1cDNKak9LaEZTTXVhSjJ2S01uNVpuWk1kV3o4b2haYm9nc1VDRQp1aFh0RUQzazdXK0dZT2RxL3ZBYTRtTDgySmp5SzF4VmZwUWFWSlMxUkorUy9ac2VKM05jWXlUNjFrQUdLN1UwCitQOVhYSkR3R0pUVkxkY1FlUk8waFk2Zzl4YnRTQk5sT20rUnFVM0pwKzlDUXF0OTgza2YzYzU0QlBHTk4vYmsKRStLcXhHTFNZaUFvREhxazRRTUo1cTlFT0dnTnVhQ0UvVjNwU1UrNjRTRU5aR2tITHdLTEVXVDJodENMWFZwZgp1Ym83LzBlUmhYUWJvVm9oMlVPK21WaGZOOUxBdEppc0xDS2FHLzNCYk9mNTY1bTkyVDR5TVJGK1MvMnJoY1VnCmcwY0Y3bW4zVE8zdEd4NzFTSUlJbEYxcjMveU5PZjU5QW9JQkFRQ2o1c3plczU4aFpiMHRkR29YY0pXcGpDREYKME16QXQvcHdoOVBGYlliSG4zc0ZMb2krcXJ5ZnBYRklBdW83QXpoeHZ6dEtLZHVXb3QrSDNlSVR2bkoxV1BveApKL0dSMzVmbXE5MUwySzBYRjF5MWN1eXgzSTNLR0llV0UvUnE2NjQwUEQzVHNjNVVyQisyUVJUYithaUMxWk5FClBGYUNWQ242TUlwL0xlOHFHMnpBdlhHZEx2T2FKV01BM2JPaVcyaldER0J0ZnZxNU9RTG43Uk1SbVNTcXM1UzcKNzAxbkNGSUtVMnBkL1B1SEZvM2piVUVzNFJjK0RMMlVqc1N1QTZMNjdzZThVOUwzVHM4SFNUdm5sWlFNNTBrSgp6cGNVdG1lTGxPQW5hcnlTQW1CSC9ycHcweFJyYStFb2ZJbXZnUFhTcS9STzZCZGs4QXdtQVIrUnNZc3AKLS0tLS1FTkQgUlNBIFBSSVZBVEUgS0VZLS0tLS0K
       token: gub49ibnjy2hrnlzzxd5mv6570t1r9pmihf10hnjcny4gxynfm98ktnc734kqp25d4x3k8ztmgi270nvgrpmeom952355i1u9iquaf8fewa7y86uiwric13x0vwn7xoi
   ```

   **List nodes**

   ```
   PS /home/andrea> kubectl get nodes
   NAME                                STATUS   ROLES   AGE   VERSION
   aks-agentpool-26991424-vmss000000   Ready    agent   76m   v1.25.6
   aks-agentpool-26991424-vmss000001   Ready    agent   76m   v1.25.6
   aks-agentpool-26991424-vmss000002   Ready    agent   76m   v1.25.6
   ```

   **Create pod**

   ```
   PS /home/andrea> code pod.yaml
   ```

   pod.yaml

   ```
   apiVersion: v1
   kind: Pod
   metadata:
     name: first-pod-nginx
   spec:
     containers:
     - name: nginx
       image: nginx:1.14.2
       ports:
       - containerPort: 80
   ```

   ```
   PS /home/andrea> kubectl apply -f pod.yaml
   pod/first-pod-nginx created
   
   PS /home/andrea> kubectl get pods    
   NAME              READY   STATUS    RESTARTS   AGE
   first-pod-nginx   1/1     Running   0          14s
   ```

   **Create Deployment**

   deployment.yaml

   ````
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: first-deployment
     labels:
       app: nginx
   spec:
     replicas: 3
     selector:
       matchLabels:
         app: nginx
     template:
       metadata:
         labels:
           app: nginx
       spec:
         containers:
         - name: nginx
           image: nginx:1.14.2
           ports:
           - containerPort: 80
   ````

   ```
   PS /home/andrea> kubectl apply -f deploymentt.yaml
   deployment.apps/first-deployment created
   
   PS /home/andrea> kubectl get deployment
   NAME               READY   UP-TO-DATE   AVAILABLE   AGE
   first-deployment   3/3     3            3           7m40s
   
   PS /home/andrea> kubectl get pods      
   NAME                                READY   STATUS    RESTARTS   AGE
   first-deployment-7fb96c846b-49f59   1/1     Running   0          12m
   first-deployment-7fb96c846b-m8xb2   1/1     Running   0          12m
   first-deployment-7fb96c846b-mgqch   1/1     Running   0          12m
   first-pod-nginx                     1/1     Running   0          29m
   ```
   
   **Edit deployment**
   
   - Change replica numbers
   
   ```
   PS /home/andrea> kubectl edit deployment first-deployment
   ```
   
   app.yaml
   
   ```
   apiVersion: v1
   kind: Service
   metadata:
     name: db
     labels:
       app: words-db
   spec:
     ports:
       - port: 5432
         targetPort: 5432
         name: db
     selector:
       app: words-db
     clusterIP: None
   ---
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: db
     labels:
       app: words-db
   spec:
     selector:
       matchLabels:
         app: words-db
     template:
       metadata:
         labels:
           app: words-db
       spec:
         containers:
         - name: db
           image: dockersamples/k8s-wordsmith-db
           ports:
           - containerPort: 5432
             name: db
   ---
   apiVersion: v1
   kind: Service
   metadata:
     name: words
     labels:
       app: words-api
   spec:
     ports:
       - port: 8080
         targetPort: 8080
         name: api
     selector:
       app: words-api
     clusterIP: None
   ---
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: words
     labels:
       app: words-api
   spec:
     replicas: 5
     selector:
       matchLabels:
         app: words-api
     template:
       metadata:
         labels:
           app: words-api
       spec:
         containers:
         - name: words
           image: dockersamples/k8s-wordsmith-api
           ports:
           - containerPort: 8080
             name: api
   ---
   apiVersion: v1
   kind: Service
   metadata:
     name: web
     labels:
       app: words-web
   spec:
     ports:
       - port: 8081
         targetPort: 80
         name: web
     selector:
       app: words-web
     type: LoadBalancer
   ---
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: web
     labels:
       app: words-web
   spec:
     selector:
       matchLabels:
         app: words-web
     template:
       metadata:
         labels:
           app: words-web
       spec:
         containers:
         - name: web
           image: dockersamples/k8s-wordsmith-web
           ports:
           - containerPort: 80
             name: words-web
   ```
   
   ```
   PS /home/andrea> kubectl apply -f app.yaml        
   service/db created
   deployment.apps/db created
   service/words created
   deployment.apps/words created
   service/web created
   deployment.apps/web created
   ```
   
   **Check Load Balancer Service**
   
   ![image-20230725174740030](images/image-20230725174740030.png)
   
   **List services**
   
   ```
   PS /home/andrea> kubectl get services     
   NAME         TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)          AGE
   db           ClusterIP      None           <none>          5432/TCP         14m
   kubernetes   ClusterIP      10.0.0.1       <none>          443/TCP          3h22m
   web          LoadBalancer   10.0.133.195   20.72.178.205   8081:31152/TCP   14m
   words        ClusterIP      None           <none>          8080/TCP         14m
   ```
   
   **Browse**
   
   http://20.72.178.205:8081/
   
   ![image-20230725175948010](images/image-20230725175948010.png)

## QUIZ: CONFIGURING CONTAINERS

1. Which of the following statement is incorrect?

   - You can use Azure Files as persistent storage for ACI

   - **You can only have public IPs for ACI**

   - ACI can use images stored in Azure Container Registry

   - Azure Container Instances is a PaaS solution

2. Which of the following methods can be used to deploy a container group? Select all that apply.

   - Azure PowerShell

   - **Azure Resource Manager templates**

   - **YAML**

   - Azure Portal

3. Which service is used for AKS bursting?

   - Azure Virtual Machines

   - Azure Virtual Machines Scale Set

   - Azure Container Registry

   - **Azure Container Instances**

4. What do we call the smallest unit of application instance which is a collection of one or more containers?

   - Replica Set

   - Service

   - Deployment

   - **Pod**

5. For creating a Kubernetes object, you need to write the manifest files. Which extensions are supported for the manifest file? Select all that apply.

   - **JSON**

   - **YAML**

   - ARM

   - XML

   Kubernetes supports YAML and JSON languages for writing manifests.

6. You are planning to deploy Azure Kubernetes Services. As per specifications, you would require a three node cluster. How the pricing for AKS is calculated for compute resources?

   - Pay for Azure managed node only

   - **Pay for the three nodes**

   - Pay for the number of nodes and Azure managed nodes

   - Pay for AKS, based on the tier you will be charged. There is no additional compute cost

   You need to pay only for the number of customer managed nodes, there is no cost for the Microsoft managed node.

7. You need to open a specific port in your AKS cluster for internal communication. Which service should you use?

   - NodePort

   - Ingress Controller

   - LoadBalancer

   - ClusterIP

# Implement backup and recovery



## File and Folder Backup

![image-20230726133744713](images/image-20230726133744713.png)

### Backup Files and Folders in Azure File Share

1. Create Vault

   Goto Recovery Services vaults > and click Create

2. Create backup Azure File Share

### Backup Files and Folders in Virtual Machine

1. Create Vault

   Goto Recovery Services vaults > and click Create

2. Create backup Files and Folders in Virtual Machine

3. Install **MARS - Microsoft Azure Recovery Service Agent** in Virtual Machine



## Virtual Machine Backup

2 ways to backup Virtual Machine

1. Go to Virtual Machine > (VM name) > Backup
2. Go to Recovery Services vault > (Vault name) > Backup > select Azure and Virtual Machine

### Virtual Machine Backup - on-prem VM

1. Go to Recovery Services vault > (Vault name) > Backup > select On-Premises and Virtual Machine
2. Install **Microsoft Azure Backup Server (MABS)**
3. Download vault credentials to register the server to the vault. Vault credentials will expire after 10 days.

**Backup center**

- Azure service to monitor backup jobs

Go to Backup center

![image-20230726150651032](images/image-20230726150651032.png)



## Azure Site Recovery

- is a plan to recover our application in regional outages

![image-20230726160254432](images/image-20230726160254432.png)



## QUIZ: IMPLEMENT BACKUP AND RECOVERY

1. You have the following resources in Azure: Blob container – imgfilesFile share – executablesVM – VM-01Azure Database for MySQL – wordpress Which of the following can be backed up to a recovery services vault?

   - File share, VM, and Azure Database for MySQL

   - VM and Azure Database for MySQL

   - Blob container, file share, VM, and Azure Database for MySQL

   - **File share and VM**

2. Which agent should you use to back-up on-premises files and folders?

   - waagent

   - MMA

   - **MARS**

   - MABS

3. We have the following resources in Azure. Which of the following can be backed up to vault-01? ![question-image](https://res.cloudinary.com/dezmljkdo/image/upload/v1661187961/az104/azure5_kldth8.png)

   - db-vm, share01, and web-vm

   - **db-vm and share01**

   - share01 and web-vm

   - db-vm only

   Since the vault-01 is in East US, we will be able to select the resources that are there in East US only.

4. What is the default redundancy for a newly created Recovery Services Vault?

   - GZRS

   - **GRS**

   - LRS

   - ZRS

   Recovery Service Vaults are created with the default redundancy as Geo-redundant storage.

5. Following is the contents of Recovery Services vaults in one of the subscriptions: ![question-image](https://res.cloudinary.com/dezmljkdo/image/upload/v1656356062/az104/table6_d8wqto.png) All of these vaults were created with the default redundancy GRS. Which all vaults can be converted to LRS vaults?

   - Vault-04 only

   - **Vault-03 only**

   - Vault-02 and Vault-03

   - Vault-01 and Vault-02

6. You have on-premises and Azure VMs that require backup. You are planning to use Microsoft Azure Backup Server to configure the backup. Which of the following on-premises workloads are not supported by MABS?

   - **Oracle workloads**

   - Exchange servers

   - Windows Server

   - Linux Servers on Hyper-V

# Network Monitoring

## Network Watcher

- is a regional service that can be used to diagnose, monitor, and setup logging for resources that are
  deployed in Azure Virtual Network.

### IP Flow verify 

- is used to verify inbound and outbound connectivity from or to a VM from a remote IP address

Go to Network Watcher > IP flow verify

![image-20230727073950048](images/image-20230727073950048.png)

### Next hop

- is used to identify the next destination the traffic will be routed to.



### VPN diagnostics

- will help you diagnose VPN connectivity issues and troubleshoot them.



### NSG Flow Logs

-  will store the details of the traffic through an NSG in a storage account.



### Connection troubleshoot 

- can be used to identify network performance and connectivity issues

![image-20230727084659411](images/image-20230727084659411.png)

### Topology

- can be used to see the topology of your Azure infrastructure.

![image-20230727085240817](images/image-20230727085240817.png)



# Resource Monitoring

## Azure Monitor

- Monitor and visualize metrics
- Query and analyze logs
- Alerting and notifications

![image-20230727085948968](images/image-20230727085948968.png)

### Metrics

**Zero configuration required**

- is displayed in the Overview blade of the resource Metrics are collected from Azure resources without any additional configuration. Thus, collected data is displayed in the Overview blade of the resource and we can analyze further with the help of Metrics Explorer.

**Time series**

- Metrics are plotted on a time axis to represent the state of a system at a point in time.

**Near real time data**

- As Metrics can visualize real time data which represents the state of our system, it’s easy to monitor and troubleshoot issues.

![image-20230727095520589](images/image-20230727095520589.png)

### Logs

**Organized as records**

Logs represent data that are organized into different records. Each record represents an event or information

**Requires additional configuration**

Logs collected are stored in Log Analytics and this collection requires agents to be configured on the source.

**Rich query language**

Log Analytics supports Kusto Query Language (KQL) for querying the data stored in the repository. KQL supports simple queries and complex queries where you can perform joins, aggregations, and analytics.



## Azure Activity Log

![image-20230727100138693](images/image-20230727100138693.png)

**Subscription level logging**

- All subscription level events will be logged in Azure Activity Logs. The ingested data includes all ARM operations and service health events.

**Auditing**

- Activity Log provides insights into what operations were taken on the resource, who started it, when did that happen, status and other raw data, that could help in auditing.

**Retention**

- Activity Log is enabled by default and as retention period of 90 days, if needed, we can extend by sending the data to a storage account.

**Querying data**

- Filters like Subscriptions, Timespan, Resource group, Resource, Operation, Event initiated by, and Search for keywords



### Azure Activity Log – Event Categories

Goto Activity log

![image-20230727105750171](images/image-20230727105750171.png)

**Administrative**

- All Resource Manager create, update, delete, and action operations are categorized under Administrative

**Security**

- All security alerts generated by Microsoft Defender for cloud will be mapped under this category.

**Service Health**

- Any service health incidents happened to Azure Resources, this may or not may not include your resources.

**Alert**

- Any alerts triggered in Azure Alerts.

**Recommendation**

- All recommendations generated in Azure Advisor

**Policy**

- All policy effects will be mapped to this category.

**Autoscale**

- This category contains all scale in and out events

**Resource Health**

- Health events associated your Azure resources.



# Azure Alerts

## Azure Monitor Alerts

**Unified Authoring Experience**

- We can create alerts for Activity Logs, Service Health Events, Log Analytics, Metrics etc. In all these scenarios the authoring experience is same.

**Classify based on severity and response**

- Azure Alerts supports severity (0-4), so you easily prioritize the alerts. Secondly, we can categorize 

by user response New, Acknowledged or Closed.

**Integrate with Action Groups**

- Define your notification and automation preferences with the help of Action Groups.



## Create an alert rule

2 ways to create an alert rule

1. Goto Virtual Machine > (VM name) > Alert
2. Goto Alerts > and click Create Alert rule

**Scope**

- Defines the scope for alert

**Condition**

- Helps you to define the signal and criteria for alert

**Actions**

- Integrate alerts with Action Groups

**Rule details**

- Specify name, severity, region, resource group and subscription for the alert.



## Action Groups

**Notification**

- Email Azure Resource Manager Role ( Owner/Contributor/ Reader/ Monitoring Contributor/Monitoring Reader)
- Email/ SMS/ Push/ Voice

**Actions**

- Automation Runbook
- Azure Function
- Event Hub
- ITSM
- Logic App
- Secure Webhook
- Webhook



**Create Resource group**

```
PS /home/andrea> az group create -n alert-rg -l eastus                                                                                                                              
{
  "id": "/subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/alert-rg",
  "location": "eastus",
  "managedBy": null,
  "name": "alert-rg",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
```

**Create VM**

```
PS /home/andrea> az vm create -n linux-box -g alert-rg --image UbuntuLTS --admin-username sherwinowen --admin-password "P@55w0rd@000" 
Ignite (November) 2023 onwards "az vm/vmss create" command will deploy Gen2-Trusted Launch VM by default. To know more about the default change and Trusted Launch, please visit https://aka.ms/TLaD
It is recommended to use parameter "--public-ip-sku Standard" to create new VM with Standard public IP. Please note that the default public IP used for VM creation will be changed from Basic to Standard in the future.
Consider using the "Ubuntu2204" alias. On April 30, 2023,the image deployed by the "UbuntuLTS" alias reaches its end of life. The "UbuntuLTS" will be removed with the breaking change release of Fall 2023.
{
  "fqdns": "",
  "id": "/subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/alert-rg/providers/Microsoft.Compute/virtualMachines/linux-box",
  "location": "eastus",
  "macAddress": "00-22-48-30-EC-7B",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.4",
  "publicIpAddress": "172.190.3.137",
  "resourceGroup": "alert-rg",
  "zones": ""
```

Make the the CPU high

- use stress command

```
stress -t 6000 -c 2 -v
```

**stress Command Examples**

1. Spawn 4 workers to stress test CPU:

```
# stress -c 4
```

2. Spawn 2 workers to stress test IO and timeout after 5 seconds:

```
# stress -i 2 -t 5
```

3. Spawn 2 workers to stress test memory (each worker allocates 256M bytes):

```
# stress -m 2 --vm-bytes 256M
```

4. Spawn 2 workers spinning on write()/unlink() (each worker writes 1G bytes):

```
# stress -d 2 --hdd-bytes 1GB
```



# Log Analytics

**Data collection**

- Data generated from resources in cloud and on-premises can be collected to Azure Log Analytics workspace.

**Reporting and visualization**

- Use KQL to create rich reports and visualization

**Workspace**

- A workspace should be created for data ingestion. You can create one or more workspaces in different regions as per your requirement.

**Pricing**

- Cost is for data ingestion (GB) and data retention (days). Log Analytics offers 30 days of cost-free data retention.

### Log Analytics Workspace

**Workspace**

- Resource created in Azure to collect, analyze, aggregate, and visualize the data from onboarded resources.

**Data isolation**

- You can create workspaces in different regions to meet compliance and data residency requirements.

**Stores Insights and Sentinel data**

- Data ingested by other services like Application Insights and Sentinel use Log Analytics Workspace
  to store data.

### Querying Log Analytics Workspace

![image-20230727184149114](images/image-20230727184149114.png)

# Application Insights

Goto App Services > click Create 

**Continuous Monitoring**

- Ability to monitor failures and unavailability of our applications continuously.

**Availability test**

- Ability to perform availability test from different geographic regions to observe latency and performance.

**Supports Azure and non-Azure applications**

- We can install the instrumentation package on Azure and non-Azure environment to monitor our applications.

## QUIZ: NETWORK AND RESOURCE MONITORING

1. Name the datastores used by Azure Monitor to store the collected data? Select all that apply.

   - Workspace

   - **Logs**

   - Activity Logs

   - **Metrics**

2. Which one of the following is an Application Performance Monitoring tool?

   - **Azure Application Insights**

   - Azure Application Metrics

   - Azure Log Analytics

   - Azure Monitor

3. Your organization is using ExpressRoute to connect to on-premises. Your network administrators stated that they are seeing performance issues with the circuit. Which tool should you use to troubleshoot this?

   - **VPN diagnostics**

   - ExpressRoute troubleshoot

   - NSG flow logs

   - Connection Monitor

4. In the action group, what are the supported notification methods? Select all that apply.

   - **Automation Runbook**

   - **Secure webhook**

   - Event Grid

   - **Webhook**

   Supported actions are Secure Webhook, Webhook, Logic App, Function App, Automation Runbook and ITSM.

5. When it comes to the billing of Log Analytics which all meters are considered? Select all that apply.

   - **Data retention**

   - **Data ingestion**

   - Number of queries

   - Connected sources

6. You are ingesting “cron” logs from your Linux servers to Log Analytics. Which table should you query to get the ingested logs?

   - Heartbeat

   - Perf

   - **Syslog**

   - Cron

   Cron is one of the facilities provided by syslog, all data ingested will be stored in the syslog table.

7. Users claim that some of the DNS queries to one of your public facing DNS servers running on Azure VM are failing. You need to check if the requests are hitting the Azure VM. How can we troubleshoot this?

   - **Use Packet Capture to confirm if the request from the clients are hitting the server**

   - Use NSG flow logs and verify if the clients are reachable from the DNS server

   - Use Effective Security Rules to verify if the DNS port is open

   - Use IP flow to confirm if the port 53 is open for DNS

   Use Packet Capture on the DNS server and verify if the requests are hitting the server.

8. You are using Azure Virtual Desktop and users are complaining that a couple of websites take longer to load. They don’t experience the same when they access these websites from their laptops. You need to troubleshoot this by finding the latency and connectivity to the endpoint. Which tool should you use?

   - **Connection Monitor**

   - Packet capture

   - Topology

   - IP Flow verify

   Connection Monitor can be used to check the connectivity and latency between your virtual machines and IP addresses/ FQDNs.

9. What is the default retention period for activity logs?

   - 60 days

   - 120 days

   - 30 days

   - **90 days**

   Activity Logs are stored for 90 days, you can ingest the logs to storage account if you need retention more than 90 days.

10. One of your route tables was deleted and you need to filter the activity logs to find who deleted it. Which category should you select to filter the logs?

    - Resource Health

    - Alert

    - Policy

    - **Administrative**

11. Your organization uses Service Now to log internal IT events. You need to set up an alert for high CPU utilization for your production server. When this alert is fired, you need to create a ticket in ServiceNow. What should you do?

    - **In Action groups, use ITSM**

    - Create an Event Hub and send the event to Service Now

    - Trigger emails to admins, so that they can create a ticket

    - Use runtime integration



# Mock Exam 1

1. Which table in Log Analytics should you check if the agent is sending data to the Log Analytics workspace?

   - **Heartbeat**

   - Syslog

   - Health

   - AgentLogs

2. Your organization has two subscriptions, prod-sub and dev-sub. In prod-sub, you have all your production resources and they are protected using resource locks to avoid any accidental changes or deletion. However, the dev-sub doesn’t have any locks, you need to make sure all the resources in the subscription are protected from accidental deletion and at the same time users should be able to modify the resources as required. What is the easiest solution for this?

   - Use Delete lock for all resource groups

   - Use ReadOnly resource lock at the subscription scope

   - Use ReadOnly resource lock for all resource groups

   - **Use Delete lock at the subscription scope**

3. Your organization wants to use the self-service password reset option for all cloud identities in Azure AD. Which license should you choose?

   - Microsoft 365 Apps

   - Azure AD Free

   - **Azure AD Premium P2**

   - Azure AD Premium P1

4. Which of the following statements about custom domains is true?

   - **You can use MX record to verify the domain**

   - You can have only domain attached to the Azure AD tenant

   - You can remove [onmicrosoft.com](http://onmicrosoft.com/) domain from Azure AD after adding a custom domain

   - **You can use TXT record to verify the domain**

5. What is the retention period for the metrics collected by Azure Monitor?

   - 60 days

   - 120 days

   - **90 days**

   - 30 days

6. You are planning to create an Azure Virtual Machine Scale Set using PowerShell. Which command should you use?

   - New-AzVMScaleSet

   - Set-AzVMScaleSet

   - New-AzVM -Type ScaleSet

   - **New-AzVMSS**

7. Your team hired a new VM administrator to manage the production VMs which are deployed in PROD-RG. You need to assign a role to the new hire by which the administrator should be able to manage all aspects of the VMs including network and storage in PROD-RG. Which of the following roles gives the right amount of access to the user?

   - Provide Virtual Machine Contributor role at the resource group level

   - **Provide Contributor role at the resource group level**

   - Provide Virtual Machine Operator role at the subscription level

   - Provide Owner role at the resource group level

   The Owner role will give additional rights to the user such as access delegation. In this case, the Contributor is the least privilege we can give.

8. Which of the following statements about scaling is correct. Select all that apply.

   - Vertical scaling is same as autoscaling

   - **Vertical scaling would require VM reboot**

   - Vertical scaling can be done on selected VM sizes only

   - **Vertical scaling has an upper limit, you cannot scale beyond that**

9. You purchased a domain called [kodekloud.com](http://kodekloud.com/) from a domain registrar and created a DNS zone in Azure DNS. You added an A record for www which will resolve to 13.11.13.12, which is one of your public facing web servers. You asked your users to test if they are able to access [www.kodekloud.com](http://www.kodekloud.com/). The clients were not able to resolve the name. What should you do? Select all that apply.

   - **Add the name servers in Azure DNS to domain registrar**

   - Reboot the client machines to flush the cache

   - Create a Private Azure DNS zone

   - Make sure public access is enabled in Azure DNS

10. Your organization deployed an AKS cluster in Azure and the operations team started to create pods in the cluster. One of the Kubernetes administrators needs to access the cluster from his local computer. The user is able to run kubectl commands from cloud shell, but when the user tries from the Linux terminal, it says kubectl is not recognized. User reached out to you to fix this, how can you resolve this? Azure CLI is already installed on the computer

    - Update AKS cluster

    - **Install AKS CLI tools using az aks install-cli**

    - SSH to the node and verify if the kube-proxy service is running

    - Download the credentials using az aks get-credentials command and try again

11. You added a ReadOnly lock to one of your Azure VMs running SQL database. Which of the following operations cannot be performed on the database? Select all that apply.

    - **Restart the VM**

    - Drop a table

    - **Delete VM**

    - Delete database

12. You have a VM named VM-1 in the East US region. VM-1 has a network interface named NIC1, this interface is attached to a subnet called “default” which is part of virtual network VNET-01. VM-1 is using a managed disk. You have another virtual network in the West US called VNET-02, you need to move the VM to VNET-02. Which of the following two actions should you perform?

    - Deallocate the VM-1

    - **Create a new VM using the disk in West US**

    - Add a new NIC in VNET-02, attach to VM-1 and remove the one in VNET-01 

    - **Delete VM-1 and retain the disk**

13. Your organization would like to create some containers using Azure Container Instances. These containers require persistent storage. Which Azure services can be used to create persistent storage for the containers?

    - Azure Container

    - Azure Data Lake Storage Gen2

    - Azure Data Box

    - **Azure Files**

14. Your development team wants to use Azure Queue Storage for their application. One of the development teams asked to share the access key and endpoint for the service. You created a storage account called “devkodekloudapp”. You were able to find the access key from Azure Portal. What will be endpoint to access queue storage?

    - [https://devkodekloudapp.table.azure.net](https://devkodekloudapp.table.azure.net/)

    - **[https://devkodekloudapp.table.core.windows.net](https://devkodekloudapp.table.core.windows.net/)**

    - [https://devkodekloudapp.core.table.windows.net](https://devkodekloudapp.core.table.windows.net/)

    - [https://storage.devkodekloudapp.core.table.windows.net](https://storage.devkodekloudapp.core.table.windows.net/)

15. Which service is responsible for providing cost recommendations?

    - **Azure Advisor**

    - Azure Cost Advisor

    - Azure Cost Management

    - Azure Monitor

16. Your application development team wants to use Azure Storage Service where they can store application binaries, embed them in a webpage and access via HTTP/HTTPS. Which service should you recommend?

    - Queue

    - File

    - **Blob**

    - Table

17. If you are using the Microsoft Azure Recovery Services Agent, how many backups will be taken per day?

    - **3**

    - 1

    - 4

    - 2

18. You are planning to use Azure Virtual WAN for connecting your branch offices to Azure via S2S VPN. Due to the cost constraints, you were asked by the management to choose the cheapest SKU that supports S2S. Which SKU will you choose?

    - Standard

    - **Basic**

    - Standard V2

    - Premium

19. Your business unit uses different virtual machines for your applications. You were asked by your manager to consolidate the cost for these VMs. These VMs are part of different resource groups. What is the easiest way to track the cost for these VMs in Azure Cost Management?

    - Assign tags at the resource group level

    - Calculate the cost individually and sum up the cost

    - Use Azure Policy to group the VMs and calculate the cost

    - **Assign tags at the resource level**

    Tags assigned at the resource group level will not be visible in Azure Cost Management, we need to use tags at the resource level to track cost.

20. Your security team is planning to audit the sign-in logs in Azure AD by ingesting that to a Log Analytics workspace. Which of the following configurations should be done to achieve this?

    - Data source setting

    - **Diagnostic setting**

    - Ingestion configuration

    - Data monitor setting

21. In an ARM template, what’s the right way to declare a variable “role” with the value “database”?

    - variable: {“role” : “database”}

    - **variables: {“role” : “database”}**

    - variable: [“role” : “database”]

    - variables: (“role” : “database”)



# Mock Exam 2

1. What is the key length of the key pairs used for Azure Linux virtual machines?

   - **2048-bit**

   - 128-bit

   - 4096-bit

   - 1024-bit

   Azure uses a 2048-bit key length and SSH-RSA format for public and private keys.

2. Which of the following user types cannot be created from the Azure portal? (Select all that apply.)

   - Cloud identities

   - **Directory synchronized users**

   - Guest accounts

   - M365 cloud identities

3. You want to use an ARM template to deploy a VM. You need to make sure that the password should be added as a parameter to the template. What parameter type should you choose to make sure that the password is secure?

   - secureObject

   - passwordString

   - notClearTextString

   - **secureString**

4. You are planning to restore an Azure VM that you were backing up to a Recovery Services Vault. As part of the restore process, you would like to mount the restore point as a drive to our VM and recover files. Which option should you select while restoring the VM?

   - **File recovery**

   - Folder recovery

   - Volume recovery

   - File system recovery

   Using File Recovery, you will be able to mount the restore point as a drive to your VM and recover files without the need to restore the entire VM.

5. Which of the following facts about resource groups is true? (Select all that apply.)

   - **Resource groups can act as a scope for managing access.**

   - A resource group is a global service and can be used to group resources from multiple regions.

   - **Resource groups will help manage the lifecycle of resources.**

   - **Deleting the resource group deletes all the resources that are part of the resource group.**

   Though we can use resource groups to group resources from multiple regions, a resource group is not a global service. Every resource group will have a region where it will store the metadata about the resources that are part of the group.

6. Which of the statements about MARS is not true?

   - MARS can back up files without the need to deploy the Backup server.

   - **MARS can back up files stored in RedHat VMs.**

   - MARS can be used to back up files and folders stored in physical Windows servers.

   - File, folder, and volume level restore is available in MARS.

7. Which of the following facts about Azure AD is not true?

   - **Kerberos and OpenID Connect authentication are supported.**

   - Azure AD uses a flat hierarchy.

   - Group Policy doesn’t exist.

   - LDAP is not used in Azure AD.

   Though OpenID Connect is used for authentication, Azure AD doesn’t use Kerberos. So, option B is not true.

8. You would like to ingest metrics from the VM host and analyze them using Metrics Explorer. What should you do to collect these metrics from the VM?

   - Metrics are collected by default without any additional configuration.

   - **You need to create a Log Analytics workspace to collect these metrics.**

   - Data sources.

   - **During VM deployment, you can enable log collection. By default, this will be enabled.**

   The Log Analytics cost is calculated using the amount of data ingested and the number of days the data is retained for (data retention). Thirty-one days of retention is free.

9. Which of the following data can be collected using Azure Monitor? (Select all that apply.)

   - **Subscription monitoring data**

   - **Application monitoring data**

   - **Resource monitoring data**

   - **Guest OS monitoring data**

   Azure Monitor can collect all the aforementioned data sources along with tenant monitoring data.

10. Cost data exported from Azure Cost Management will be stored in the ____________________.

    - Azure Event Hub

    - Azure Log Analytics workspace

    - **Azure Storage account**

    - Power BI workspace

    The export feature in Azure Cost Management can be used to export the billing data to an Azure storage account.

11. Your organization has decided to migrate from IaaS to an App Service offering. For your apps, management requires high performance, security, and isolation. Which App Service Plan tier should you use?

    - Premium V2

    - **Isolated**

    - Standard

    - Premium

    An isolated plan offers high performance, security, isolation, and native virtual network deployment.

12. After creating the load balancer when you reviewed the Azure NSG for the VM, what can you see?

    - SNAT rule

    - Load balancing rule

    - DNAT rule

    - **Inbound NAT rule**

13. Select the correct sequence for setting up a virtual network to virtual network connection.

    - **Create virtual networks, add gateway subnets, deploy VPN gateways, establish a connection**

    - Create a VPN gateway, select the virtual networks to connect, create the connection

    - Create virtual networks, create gateway virtual networks, deploy gateways to gateway virtual network

    - Create a VPN gateway and then create a site-to-site connection

    The process is to first create virtual networks, then add gateway subnets, and then deploy VPN gateways. Finally, you establish a connection.

14. To create a hybrid environment, you are planning to deploy a basic VPN gateway. To get zone redundancy, your manager asked you to use a standard SKU public IP address for the VPN gateway. When you were creating a VPN gateway, you were not able to see the option to attach a standard SKU public IP address. What could be the reason?

    - **A standard SKU is not supported for VPN gateways.**

    - You don’t have permission to attach a standard SKU to the VPN gateway.

    - You need to upgrade to VpnGw1 or higher to use a standard SKU.

    - The public IP is deployed in a different region. You can only select the IP address that is in the same region as the gateway.

15. For using Azure Bastion, you need to create a dedicated subnet. What should be the name and minimum size of the subnet?

    - AzureBastionSubnets (minimum /26)

    - BastionSubnet (minimum /26)

    - AzureBastion (minimum /27)

    - **AzureBastionSubnet (minimum /27)**

16. You need to connect to Linux virtual machines using a key pair from the Windows Terminal application. The key name is vm-01, and it is stored in ~/.ssh/key. What is the right syntax for connecting to a VM called vm-01 using the username admin?

    - ssh -p ~/.ssh/key/ -i vm-01 admin@vm-01

    - **ssh -i ~/.ssh/key/vm-01 admin@vm-01**

    - ssh -c ~/.ssh/key/vm-01 admin@vm-01

    - ssh -k ~/.ssh/key/vm-01 admin@vm-01

17. You have implemented alerts for all your critical workloads. As of now, you are using ServiceNow for creating internal IT tickets. Which action in action groups offers the easiest way to connect to ServiceNow?

    - ITIL

    - **ITSM**

    - Email/SMS/push

    - Email Azure Resource Manager role

18. Which of the following PowerShell commands can be used to create a virtual network? (Select all that apply.)

    - New-AzureVirtualNetwork

    - **New-AzVirtualNetwork**

    - New-AzureVNet

    - New-AzNetwork

    The New-AzVirtualNetwork command is used to create a virtual network.

19. You need to establish a highly available site-to-site connection to an on-premises environment. Which of the following topologies offers the highest availability?

    - Passive-passive

    - **Active-active**

    - Active-passive

    - Active-cold standby

20. Your organization would like to use self-service password reset, and hybrid users should be able to reset their on-premises password. However, you are not able to use this feature due to licensing issues. Which license should you purchase to use this feature?

    - Azure AD Free

    -  Azure AD P1

    - **Azure AD P2**

    - Azure AD M2

21. Which of the following is an example of manual deployment in App Services?

    - Local Git

    - GitHub

    - **External Git**

    - BitBucket

22. Which of the following bulk operations are available for users in Azure AD? (Select all that apply.)

    - **Bulk invite**

    - **Bulk delete**

    - **Download all users**

    - **Bulk create**

    All of the options are considered as bulk operations for users.

23. Your organization wants to store binaries and executables for downloads over HTTP/HTTPS. However, they are confused with the storage options in Azure. Which storage service would you suggest?

    - Files

    - Queues

    - **Blobs**

    - Tables

24. Which is the cheapest licensing option if you have fewer than 500,000 users and require single sign-on?

    - Azure AD P2

    - Azure AD M2

    - **Azure AD Free**

    - Azure AD P1

    Azure AD Free edition offers 500,000 directory objects, SSO, and B2B collaboration.

25. Your management has requested to collect all logs related to health events for resources that are part of your subscription. Which category should you select to get this data from the Activity Log?

    - Service health

    - Administrative

    - **Resource health**

    - Subscription health

26. You would like to control the way the traffic is getting distributed to the backend VMs. Which option in Azure Load Balancer should be configured to control this?

    - Session stickiness

    - Session affinity

    - TCP timeout

    - **Session persistence**

    The distribution mode of the load balancer can be changed using session persistence.

27. Which of the following facts about management groups is true? (Select all that apply.)

    - **You can easily apply policies and access a set of subscriptions.**

    - **Budgets can be created at the management group level, which is ideal for teams and projects having multiple subscriptions.**

    - The management group can be created to isolate the resources that you don’t want to be part of any subscription.

    - **Using the management group, you can logically group subscriptions.**

28. Which of the following statements is false?

    - **The ARM template can be used for creating Azure resources only; resource groups and subscriptions should be deployed using PowerShell or the CLI.**

    - The ARM template is an example of declarative automation.

    - The ARM templates can be exported and reused in different subscriptions.

    - The ARM template has an option to preview the changes before the deployment.

    ARM templates can be used to create resources, resource groups, and subscriptions.

29. What is the maximum number of gateways you can add to a virtual network?

    - **1**

    - 500

    - 100

    - 10

30. Which of the following statements is not true? (Select all that apply.)

    - Azure Bastion can be used to establish a connection from the Azure portal over SSL.

    - **The Azure Bastion host is charged only when you are connecting to VMs using RDP/SSH.**

    - The Azure Bastion service requires a dedicated subnet.

    - **The Azure Bastion host requires you to create RDP access to the host machine to establish an RDP/SSH connection to other VMs.**

    Azure Bastion can be used to establish a connection from the Azure portal over SSL; there is no need to download any clients. You will be charged for the entire hour regardless of whether you are using Azure Bastion. The only way to stop being billed is to delete the Azure Bastion service.

31. Your company has a virtual network with the specifications below. When you were writing a PowerShell script, you needed to provide the resource ID of the virtual network. Which of the following is the right one?

    ```
    Name: vnet-hub
    Resource Group: clz-01
    Subscription ID: 00000-00001-00002-00003
    ```

    - /subscription/00000-00001-00002-00003/clz-01/providers/Microsoft.Network/virtualNetworks/vnet-hub

    - **/subscriptions/00000-00001-00002-00003/resourcegroups/clz-01/providers/Microsoft.Network/virtualNetworks/vnet-hub**

    - /subscription/00000-00001-00002-00003/resourcegroups/clz-01/providers/Microsoft.Network/virtualNetworks/vnet-hub

    - /subscriptions/00000-00001-00002-00003/resourcegroups/clz-01 /Microsoft.Network/virtualNetworks/vnet-hub

    If you have a virtual network with the name vnet-hub, then the resource ID will be /subscriptions/<subscriptionId>/resourcegroups/<resouceGroupName>/ providers/Microsoft.Network/virtualNetworks/vnet-hub.

32. You have been asked to access the table named `customers` in the storage account `axfg03`. Which is the right endpoint to access the table?

    - https:// [axfg03.table.core.windows.net/tables/customers](http://axfg03.table.core.windows.net/tables/customers)

    - https:// [axfg03.table.core.windows.net/Customers](http://axfg03.table.core.windows.net/Customers)

    - https:// [axfg03.table.core.windows.net/CUSTOMERS](http://axfg03.table.core.windows.net/CUSTOMERS)

    - **https:// [axfg03.table.core.windows.net/customers](http://axfg03.table.core.windows.net/customers)**

33. You have an on-premises endpoint that is publicly exposed. You want to check the latency and connectivity from a virtual machine to the FQDN. Which service should you choose?

    - **Connection Monitor**

    - Topology

    - VPN diagnostics

    - IP Flow Verify

    Connection Monitor will verify if the destination is reachable or not. It will also show the hops taken to reach the destination and latency.

34. ARM is an example of a(n) ____________________________ solution for Azure.

    - Template

    - Infrastructure-as-a-service

    - **Infrastructure-as-code**

    - Platform-as-a-service

35. Which action will a User Access administrator be able to perform? (Select all that apply.)

    - **Delegate access**

    - **View resources**

    - Modify resources

    - Create resources

    A User Access administrator can delegate access to other users; however, this role cannot manage any resources.

36. After creating the load balancer when you reviewed the Azure NSG for the VM, what would you be able to see?

    - SNAT rule

    - Load balancing rule

    - **Inbound NAT rule**

    - DNAT rule

37. You are using deployment slots for your web apps. Currently, you are using the Standard plan, and when you swapped the slots, CORS settings were not swapped. What could be the reason?

    - CORS swap is supported only from the Premium tier onward.

    - Enable the CORS Across Slots option from app configuration settings.

    - Enable CORS Across Slots option from the app general settings.

    - **CORS settings cannot be swapped during slot swap.**

    CORS settings cannot be swapped during a deployment slot swap.

38. What is the maximum number of nodes that can be added to an AKS cluster with the Standard Load Balancer?

    - 100

    - 2,000

    - 1,500

    - **1,000**

    Refer to the following: https://docs.microsoft.com/en-us/azure/aks/quotas-skus-regions#service-quotas-and-limits

39. Your organization is creating a virtual machine with a public IP address. You need to make sure that the public IP address is zone redundant. Which of the following SKU and assignment types should you select to achieve this?

    - **Standard static**

    - Standard dynamic

    - Basic static

    - Basic dynamic

40. Your organization wants to store binaries and executables for downloads over HTTP/HTTPS. However, they are confused with the storage options in Azure. Which storage service would you suggest?

    - Files

    - Tables

    - Queues

    - **Blobs**

41. Does Azure App Service support Azure Marketplace images?

    - **Yes**

    - No

42. What is the durability offered by GRS storage?

    - **99.9999999999999999 (16 nines)**

    - 99.99999999999 (11 nines)

    - 99.999999999999999999 (18 nines)

    - 99.99999999999999 (14 nines)

43. You are setting up Azure Load Balancer, and you would like to implement cookie affinity. However, you are not able to find this while configuring the load balancer. What could be the reason?

    - Ensure that you are using Azure Load Balancer Standard as cookie affinity is available only on Standard.

    - Cookie affinity is also known as session persistence; use it instead.

    - **Cookie affinity requires an L7 load balancer; use an application gateway instead of Azure Load Balancer.**

    - Set session persistence to a two-tuple hash to enable cookie persistence.

    To use cookie affinity, you need to have an L7 load balancer like Azure Application Gateway.

44. Which port is used to establish WinRM to Windows machines?

    - 5987

    - 5999

    - **5986**

    - 3389

45. Your organization has a requirement that all Azure VM backups stored in Azure should be encrypted. What needs to be done to enable encryption at rest?

    - File system recovery

    - **File recovery**

    - Volume recovery

    - Folder recovery

    Using File Recovery, you will be able to mount the restore point as a drive to your VM and recover files without the need to restore the entire VM.

46. Which of the following statements is correct?

    - **RBAC targets authorization, and a policy targets resource properties.**

    - RBAC and a policy are required to grant access.

    - RBAC always supersedes the policy.

    - A policy is not required when you are using RBAC.

    RBAC targets authorization and access to a specific resource, while a policy targets resource properties such as size, location, type, etc.

47. In which of the following backup scenarios can you use the MARS agent?

    - VMware backup

    - **On-premises files and folders**

    - SharePoint backup

    - Azure Files backup

48. You are planning to set up a Log Analytics workspace for collecting logs. Your manager asked you to prepare a budget for Log Analytics. What are two meters you should include as part of the Log Analytics cost calculation?

    - **Data retention**

    - Data sources

    - Data queries

    - **Data ingestion**

49. You want to use allowedValues for one of your parameters. How can you supply values to allowedValues?

    - “allowedValues”: “one”, “two”, “three”

    - **“allowedValues”: [“one”, “two”, “three”]**

    - “allowedValues”: {“one”, “two”, “three”}

    - “allowedValues”: (“one”, “two”, “three”)

50. What is the maximum throughput offered by a VPN gateway?

    - 1 Gbps

    - **10 Gbps**

    - 100 Gbps

    - 1000 Gbps

    The bandwidth of the VPN gateway is limited to 10 Gbps.

# Mock Exam 3

1. Your organization added a ReadOnly lock to one of your production SQL databases. Which of the following operations cannot be accomplished?

   - Modify queries in the SQL database

   - Create a new table in the SQL database

   - **Resize the SQL database**

   - Delete the table from the SQL database

   Locks prevent changes to a resource, but they don’t restrict how resources perform their own functions. Any operations done within the SQL database cannot be prevented using locks.

2. How long will the metrics be retained by Microsoft?

   - 91 days

   - 90 days

   - 92 days

   - **93 days**

   There is no limit to the amount of metric data you can collect, but this data is stored for a maximum of 93 days.

3. Your manager has asked you to remove a deployment from the deployment history. How can you achieve this?

   - The deployment history cannot be cleared; Azure stores it for 90 days.

   - Use the az group deployment cancel command.

   - Use the az group deployment remove command.
   - **Use the az group deployment delete command.**

   You can use the "az group deployment delete" command to delete a deployment from the deployment history.

4. What are the additional cost implications if you are setting up an active-active configuration for a VPN gateway?

   - **There is no change in the cost as the redundant instances need to be deployed for passive as well.**

   - The cost will be comparatively higher as data transfer happens via both tunnels.

   - The VPN gateway cost will be doubled for VPN gateway as your second instance is active.

   - The cost will be double for data transfer as the data is transferred via both tunnels simultaneously.

   There won’t be any billing implications or additional cost for switching to active-active. The redundant instances are always running regardless of active-passive or active-active, so the cost of that is always included in the price of the VPN gateway.

5. Which of the following statements about custom domains is true? (Select all that apply.)

   - **You need to add a TXT/MX record to validate the domain.**

   - **You can add multiple domains.**

   - You can remove a domain where users are mapped to the domain.

   - You can delete the [onmicrosoft.com](http://onmicrosoft.com/) domain after adding the custom domain.

   You can add multiple custom domains to your Azure AD tenant by adding the TXT/MX record to your DNS domain for validation.

6. Your organization wants to bring your own keys for SSE. Which service should you use to store these keys?

   - **Azure Key Vault**

   - Key Management Service

   - Windows Key Store

   - Recovery Services Vault

   Azure Key Vault can be used to store SSE and ADE keys.

7. You have implemented a policy-based VPN gateway and set up an S2S connection. Later, you decide to switch to a route-based VPN. What’s the right approach to change from a policy-based VPN to a route-based VPN?

   - Delete the S2S connection and update the VPN gateway; then re-create the connection.

   - **Delete the connection, delete the gateway, and create a new route-based VPN.**

   - Changing via the portal is not supported; use PowerShell to change the gateway type.

   - Disable the connection, update the gateway, and enable the connection again.

   You cannot change a policy-based VPN to route-based VON without redeploying the VPN gateway. Deleting the connection, deleting the gateway, and creating a new route-based VPN is the right approach.

8. MARS takes a backup _____ time(s) per day.

   - 4

   - 1

   - 2

   - **3**

9. What option do you have if the region doesn’t support availability zones?

   - Flexible orchestration.

   - Azure Spot instance.

   - The availability zone is available for all regions.

   - **Use an availability set.**

   Use an availability set in regions where availability zones are not available.

10. Your security wants to make sure that public access to the storage account from all networks should be denied. All communications should happen via a VPN S2S connection from on-premises. What needs to be done about this requirement?

   - Create network rules and add the on-premises network to the storage account

   - **Create a private endpoint**

   - Create a service endpoint

   - Create Azure Firewall

   Private endpoints can be created for the storage account that will create an interface for the storage account in the virtual network that can be accessed privately.

11. Which one of the following can be used as a persistent storage for Azure Container Instances?

    - Azure Data Lake Storage

    - **Azure Files**

    - Azure Container Storage plug-in

    - Azure Blob Storage

12. Your organization is planning to save VHD files in Azure Blob Storage. Which type of blob should be selected for this?

    - Block blob

    - General blob

    - **Page blob**

    - Append blob

    A page blob is ideal for frequent read/write operations and can be up to 8 TB in size. Azure stores virtual machine OS disks and data disks in page blob format.

13. One of your Linux virtual machines has the following NSGs attached to it. ![question-image](https://res.cloudinary.com/dezmljkdo/image/upload/v1658341172/az104/az1042_xvcrzk.png) You are not able to connect to the VM over SSH. How can you fix this?

    - Delete the NIC level NSG

    - Change the priority of rule 1 of subnet level NSG to 100

    - Change the source of rule 1 of subnet level NSG

    - **Delete rule 1 from NIC level NSG**

    Delete rule 1 from the NIC level so NSG will allow SSH traffic.

14. Select the correct syntax to declare a variable with the name vmName and a value of webserver-01.

    - variables: { “vmName” = “webserver-01”}

    - variables: [ “vmName”: “webserver-01”]

    - **variables: { “vmName”: “webserver-01”}**

    - variables: ( “vmName”: “webserver-01”)

    Variables are declared in the format "variables": { "name": "value"}.

15. You are planning to implement an Azure VPN gateway, and you would like to direct packets through IPsec tunnels based on the combinations of address prefixes between your on-premises network and the Azure VNet. What configuration should you select to achieve this?

    - Zone-redundant VPN

    - IPsec VPN

    - Route-based VPN

    - **Policy-based VPN**

    Policy-based gateways implement policy-based VPNs. Policy-based VPNs encrypt and direct packets through IPsec tunnels based on the combinations of address prefixes between your on-premises network and the Azure virtual network. The policy (or traffic selector) is usually defined as an access list in the VPN configuration.

16. You are trying to add dynamic devices under M365 groups, and for some reason you are not able to perform that action. What could be the reason?

    - You should have only Windows 10 and Windows Server 2019 devices to add to M365 groups.

    - Dynamic devices are not supported for M365 groups.

    - You need to have a Premium P2 license to add dynamic devices under M365 groups.

    - **You need to have the Device Administrator role assigned to group devices in Azure AD.**

17. What is the maximum duration of the script that can be run using Custom Script Extension for Linux machines?

    - **90 minutes**

    - 9 minutes

    - 20 minutes

    - 95 minutes

18. You have deployed an AKS cluster and have downloaded the credentials; however, when using kubectl, you are not able to get the node information from your local computer. As per the terminal, kubectl is not recognized as a known command. What needs to be done to resolve this problem? (Select all that apply.)

    - **Install the AKS CLI tools using az aks install-cli**

    - Download the credentials again and save them to your home directory

    - **SSH to the nodes and verify if the kube-proxy service is running**

    - Try accessing the cluster from the cloud shell

    You can install the kubectl binaries to your local computer by executing "az aks install-cli". Kubectl is already installed in the cloud shell, so verify if you can get the node information to rule out any provisioning issues.

19. Which component in AKS managed nodes is responsible for managing requests coming from the master node?

    - api-server

    - **kubelet**

    - kube-proxy

    - docker

    Kubelet is responsible for processing the requests that are coming from the Azure managed node or the master node.

20. Which table should you query to verify if the data collection from the Log Analytics agent is stopped or not?

    - Syslog

    - **Heartbeat**

    - Event

    - AgentLogs

    The Heartbeat table will help you identify computers that haven’t had a heartbeat in a specific time frame.

21. You need to create a storage account using an ARM template. As per the naming conventions, you should take the name of the resource group and append that with a string that will be provided by the user during runtime. Assume that the string shared by the user will be stored in `name`. For example, if the name of the resource group is `rg-01` and the string provided by the user is storage, then the name should be `rg-01-storage`. What is the right format to construct the storage account name while writing the resource block?

    - [concat(resourceGroup().name(),’-’, variables(‘name’)]

    - [concat([resourceGroup.name](http://resourcegroup.name/)(),’-’, parameters(‘name’)]

    - [concat([resourceGroup.name](http://resourcegroup.name/)(),’-’, variables(‘name’)]

    - **[concat(resourceGroup().name,’-’, parameters(‘name’)]**

    As the user is providing the value during the runtime, you cannot use variables; you need to use parameters. The resource group name can be captured using resourcegroup().name. The values can be appended using the concat function.

22. You created a web app named azwebapp. What will the default URL of the web app be?

    - [https://azwebapp.azurewebapp.net](https://azwebapp.azurewebapp.net/)

    - [https://azwebapp.azure.websites.net](https://azwebapp.azure.websites.net/)

    - [https://azwebapp.app.azurewebsites.net](https://azwebapp.app.azurewebsites.net/)

    - **[https://azwebapp.azurewebsites.net](https://azwebapp.azurewebsites.net/)**

    The default domain will be azurewebsites.net

23. Your organization wants to ingest logs from Azure AD to a Log Analytics workspace. Which setting should be configured for this?

    - Ingestion setting

    - Data collection setting

    - **Diagnostic setting**

    - Data source setting

    Azure AD logs can be streamed to Azure Log Analytics by enabling the diagnostic settings.

24. Your security wants to make sure that public access to the storage account from all networks should be denied. All communications should happen via a VPN S2S connection from on-premises. What needs to be done about this requirement?

    - **Create a private endpoint**

    - Use Azure Firewall

    - Create network rules and add the on-premises network to the storage account

    - Create a service endpoint

    Private endpoints can be created for the storage account that will create an interface for the storage account in the virtual network that can be accessed privately.

25. You would like to enable Network Watcher for your subscription to view the topology. What needs to be done to enable Network Watcher?

    - **Network Watcher is enabled automatically for every subscription.**

    - You need to deploy the Network Watcher service manually in the region where your deployment is.

    - Manual deployment is required for only one region as Network Watcher is a global service.

    - Network Watcher gets enabled when you create a virtual network.

26. Your organization wants to use Custom Script Extension stored in one of the source controls to be executed on a Linux machine. Which property should be used to specify the command that needs to be executed?

    - commandsToExecute

    - **commandToExecute**

    - fileUris

    - scriptToExecute

    The URL to the script can be added using the fileUris property, and then you can execute the script using the commandToExecute option.

27. You have an Azure subscription named `az-sub01` that contains an Azure Log Analytics workspace named `la-workspace-01`. You need to view the error events from a table named Event. Which query should you run in `la-workspace-01`?

    - search in (Event) * | where EventType -eq “error”

    - **search in (Event) “error”**

    - Get-Event Event | where {$_.EventType == “error”}

    - select * from Event where EventType == “error”

    You can use search in followed by the table name and keyword for searching in a table. You can also use Event | search "error" or Event | where EventType == "error".

28. When you compare the features between Azure Application Gateway and Azure Front Door, you find that most of the features are the same. What is the key difference between Azure Front Door and Azure Application Gateway?

    - Azure Application Gateway is an L7 load balancer, while Azure Front Door is a DNS load balancer.

    - **Azure Application Gateway is a regional service, and Azure Front Door is a global service.**

    - Application Gateway supports only VMs, and Azure Front Door supports only App Services.

    - Azure Application Gateway supports path-based and multiple site routing, which is not supported by Azure Front Door.

    Azure Application Gateway is a regional service, and Azure Front Door is a global service.

29. Azure Hybrid Benefit can be used with which of the following services? (Select all that apply.)

    - **SQL servers**

    - **Linux servers**

    - **Windows VMs**

    - Azure Functions

    Azure Hybrid Benefit can be applied to Windows, SQL, and Linux servers. Azure Functions is a serverless service.

30. Which parameters are taken into consideration for a three-tuple hash?

    - Protocol, destination IP address, and destination port

    - Source IP address, source port, and destination IP address

    - **Source IP address, destination IP address, and protocol**

    - Source IP address, destination IP address, and destination port

31. You have been asked to access the table named customers in the storage account axfg03. Which is the right endpoint to access the table?

    - https:// [axfg03.table.core.windows.net/CUSTOMERS](http://axfg03.table.core.windows.net/CUSTOMERS)

    - **https:// [axfg03.table.core.windows.net/customers](http://axfg03.table.core.windows.net/customers)**

    - https:// [axfg03.table.core.windows.net/Customers](http://axfg03.table.core.windows.net/Customers)

    - https:// [axfg03.table.core.windows.net/tables/customers](http://axfg03.table.core.windows.net/tables/customers)

    Table names are case sensitive. The right approach is to use the table endpoint followed by the table name.

32. Which of the following statements about custom domains is true? (Select all that apply.)

    - You can delete the [onmicrosoft.com](http://onmicrosoft.com/) domain after adding the custom domain.

    - **You can add multiple domains.**

    - You can remove a domain where users are mapped to the domain.

    - **You need to add a TXT/MX record to validate the domain.**

33. You are using Azure DNS, and one of your colleagues has asked you to add the IPv6 address of a server to the DNS zone. What should you do?

    - Inform the colleague that Azure DNS only supports IPv4 records

    - Create a CNAME recording pointing to the IPv6 address

    - **Create an AAAA record**

    - Create an A record pointing to the IPv6 address

34. You are planning to implement an Azure VPN gateway, and you would like to direct packets through IPsec tunnels based on the combinations of address prefixes between your on-premises network and the Azure VNet. What configuration should you select to achieve this?- 

    - Zone-redundant VPN\

    - **Policy-based VPN**

    - Route-based VPN

    - IPsec VPN

    Policy-based gateways implement policy-based VPNs. Policy-based VPNs encrypt and direct packets through IPsec tunnels based on the combinations of address prefixes between your on-premises network and the Azure virtual network. The policy (or traffic selector) is usually defined as an access list in the VPN configuration.

35. Your organization wants to use a virtual WAN with an S2S VPN. Which is the cheapest WAN type you can use?

    - Advanced

    - Standard

    - **Basic**

    - Premium

    Basic Virtual WAN supports S2S VPN, and this is the cheapest option.

36. You need to use Azure Storage in AKS; what are the storage options available to you via Storage classes? (Select all that apply.)

    - **Azure Premium File Storage**

    - **Azure Standard SSD**

    - Azure Tables

    - **Azure Premium SSD**

    Azure Managed SSD Disks (Standard, Premium) and Azure Files (Standard, Premium) are supported for AKS Storage classes.

37. You have several Linux virtual machines running in a virtual network. Your management wants to deploy an Azure Firewall for securing the workloads. As soon as you deployed the firewall, the Linux machines are not able to download the updates. What needs to be done to make sure that the updates are allowed? Choose a solution that will have the lowest management overhead.

    - Ignore manual updates as Azure automatically updates all virtual machines

    - Whitelist IP addresses of update repositories to the firewall

    - Add a NAT rule to enable updates

    - **Add an application rule and whitelist the domains**

    Adding IP addresses is not an efficient solution as chances of these IP addresses getting changed are high. It’s easy to add the FQDNs to an application rule so that requests to these domains are not blocked.

38. In your organization, administrators created Azure DNS zones, and most of the production zones are hosted on an on-premises Windows DNS server. You want to implement name resolution for your on-premises servers; they should be able to resolve DNS names from both Azure DNS zones and on-premises DNS zones. The on-premises infrastructure is dynamic where VMs are created and deleted dynamically based on the demand. What would be the easiest solution to make the name resolution happen without management overhead?

    - Migrate the on-premises zones to Azure

    - Add Azure DNS servers to all the VMs

    - **Create a conditional forwarder on the on-premises domain controller**

    - Synchronize Azure DNS zones to on-premises

    Though you can add Azure DNS to all the VMs and make the name resolution happen, as the VMs are dynamically created, it’s not a feasible solution. The easiest way is to add a conditional forwarder to the on-premises DNS server, which will forward all the requests matching the condition to the Azure DNS for name resolution.

39. Which of the following is not mandatory for an ARM template? (Select all that apply.)

    - **variables**

    - **apiProfile**

    - **functions**

    - **parameters**

    The only required fields for an ARM template are $schema, contentVersion, and resources.

40. Which classic role is equivalent to the Contributor role?

    - Global administrator

    - Service administrator

    - **Co-administrator**

    - Account administrator

41. Which of the following facts are correct? (Select all that apply.)

    - **There is a size limit to which you can vertically scale; no further scaling will be possible beyond that.**

    - **A VM requires a reboot during vertical scaling.**

    - Vertical scaling can be used to implement true autoscaling.

    - Vertical scaling will increase the number of instances without changing the hardware.

    A VM requires a reboot during vertical scaling, and there is a size limit to which you can vertically scale; no further scaling will be possible beyond that.

42. You are setting up a VPN gateway and would like to add your custom DNS servers. Where will you configure this?

    - Under VPN configuration, you can specify the DNS servers.

    - **A VPN gateway inherits the DNS configuration of the virtual network.**

    - A VPN uses the DNS servers mentioned in the local network gateway.

    - A private DNS needs to be created to link the VPN gateway to use custom DNS.

    If you specified a DNS server or servers when you created your virtual network, the VPN gateway will use the DNS servers that you specified.

43. You would like to have VMs of different configurations in a virtual machine scale set. Which configuration should you select to achieve this?

    - Spreading algorithm

    - Azure Spot instance

    - **Flexible orchestration**

    - Uniform orchestration

44. Your reliability team wants to distribute the instances of a virtual machine scale set across fault domains. Which option do you need to configure to accomplish this requirement?

    - Scaling policy

    - Availability set

    - Uniform distribution

    - **Spreading algorithm**

45. Which Azure CLI command is used to validate if the ARM template is syntactically correct?

    - az group deployment whatif

    - **az group deployment validate**

    - az group template whatif

    - az group template validate

    In Azure CLI, you can use "az group deployment validate" to validate whether a template is syntactically correct.

46. You have linked a virtual network to a private zone with autoregistration enabled. In the virtual network there are 150 VMs, and you accidentally deleted all the DNS records. You need to recover these DNS records as soon as possible to avoid a DNS outage for the virtual network. What needs to be done?

    - Create a new zone and register the VMs there.

    - Export the VM and IP addresses to a CSV file and import to the zone.

    - The records cannot be recovered.

    - **No action is required.**

    The automatic registration happens again as long as the virtual machine still exists and has a private IP address attached to it. The DNS record is re-created automatically in the zone.

47. One of the previous administrators of your Azure environment created a General Purpose v1 Hot Standard Storage account in Azure. This account is used to store tables and blobs. Now your management is asking you to implement Lifecycle Management for blobs. However, you are not able to find this option in the Azure portal. What needs to be done?

    - Change the account to the Cool tier

    - Enable Lifecycle Management from Advanced Properties

    - **Upgrade to General Purpose v2**

    - Change the tier to Premium

    Only General Purpose v2 storage accounts support the Lifecycle Management option, so you need to upgrade your storage account.

48. You are trying to connect your Cost Management data to Power BI, and you are not able to do so. Currently, you have five pay-as-you-go subscriptions that run production workloads. What could be the reason for this failure?

    - **Only the subscription offer doesn’t support the Power BI connector.**

    - You need to generate the API key to connect to Power BI.

    - You need to sign in as the administrator to use the Power BI integration.

    - You need to enable Power BI access in Cost Management to download the data.

    The Power BI connector supports only the Enterprise Agreement and Microsoft Customer Agreement subscriptions.

49. ###### What does reclaimPolicy in AKS Storage do?

    - Helps to claim the pod configuration

    - Maps the underlying storage to the node pool

    - **Controls the persistence of the disk**

    - Chooses the type of storage used for the cluster

    When you delete the pod and the persistent volume is no longer required, reclaimPolicy controls the behavior of the underlying Azure storage resource. The underlying storage resource can be either deleted or kept for use with a future pod.

50. You have an Azure subscription. You are deploying an Azure Kubernetes Service (AKS) cluster that will contain multiple pods. The pods will use Kubernetes networking; you need to restrict network traffic between the pods. What should you configure on the AKS cluster?

    - Services

    - Kubernetes ingress policy

    - Security policy

    - **Azure network policy**

    An Azure network policy needs to be created to restrict the traffic between the pods.

51. Azure Cost Management can generate cost recommendations based on your usage. Which of the following services is responsible for deriving these recommendations?

    - **Azure Advisor**

    - Azure Cost Management Recommendations

    - Azure Cost Advisor

    - Azure Monitor

52. 
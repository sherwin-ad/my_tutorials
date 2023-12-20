### AZ-104 Microsoft Azure Administrator Exam Prep

### **Powershell and CLI**

#### Memorizing Powershell and CLI commands

##### **CLI**

```
# List all VMs
$ az vm list

# Create an Azure Virtual Machine.
$ az vm create

Delete a VM.
$ az vm delete
```

```
$ az keyvault list

$ az keyvault create

$ az keyvault delete
```

```
$ az network vnet list

$ az network vnet create

$ az network vnet delete
```

```
$ az network vnet subnet list

$ az network vnet subnet create

$ az network vnet subnet delete
```



##### **Powershell**

```
# Gets the properties of a virtual machine.
Get-AzVM 

# Creates a virtual machine.
New-AzVM 

# Removes a virtual machine from Azure.
Remove-AzVM 
```

```
Get-AzKeyVault

New-AzKeyVault

Remove-AzKeyVault
```

```
Get-AzVirtualNetwork

New-AzVirtualNetwork

Remove-AzVirtualNetwork
```

```
Get-AzVirtualNetworkSubnetConfig

New-AzVirtualNetworkSubnetConfig

Remove-AzVirtualNetworkSubnetConfig
```

#### Details about Powershell and CLI

##### **Powershell**

**Install a new AZ module**

Run as administrator

```
Install-Module -Name Az -AllowClobber -Repository PSGallery -Force
```

**Login to Azure account**

```
Connect-AzAccount
```

**List all VMs**

```
PS /home/sherwinowen> Get-AzVM 

ResourceGroupName                    Name      Location            VmSize  OsType                 NIC
-----------------                    ----      --------            ------  ------                 ---
DENR-FMD-RG                  denr-fmb-dev southeastasia     Standard_B4ms Windows  denr-fmb-dev487_z1
ERC-OFAS                    erc-db-server southeastasia      Standard_B2s Windows erc-db-server622_z1
ERC-OFAS               erc-db-server-prod southeastasia     Standard_B4ms Windows …-server-prod425_z1
ERC-OFAS                   erc-web-server southeastasia      Standard_B2s Windows …c-web-server863_z1
ERC-OFAS              erc-web-server-prod southeastasia     Standard_B4ms Windows …-server-prod550_z1
LMB                      lmb-pmis-staging southeastasia   Standard_F4s_v2 Windows …pmis-staging816_z1
PSA_RG                         postgresql southeastasia   Standard_F2s_v2   Linux    postgresql578_z1
PSA_RG                        postgresql1 southeastasia   Standard_F2s_v2   Linux   postgresql1243_z1
PSA_RG                   psa-web-app-prod southeastasia   Standard_F8s_v2 Windows …web-app-prod673_z1
PSA_RG                 psa-web-app-prod-1 southeastasia  Standard_F16s_v2 Windows …b-app-prod-1345_z1
PSA_RG                 psa-web-app-prod-2 southeastasia  Standard_F16s_v2 Windows …b-app-prod-2922_z2
PSA_RG            psa-web-app-prod-backup southeastasia  Standard_F16s_v2 Windows …-prod-backup227_z1
PSA_RG               psa-web-app-prod-lb1 southeastasia     Standard_B4ms Windows …b-app-prod-lb17_z1
PSA_RG                         survey-sol southeastasia Standard_D8lds_v5 Windows    survey-sol104_z1
PSA_RG                    survey-sol-beta southeastasia Standard_D16ls_v5 Windows …vey-sol-beta580_z1
PSA_RG                     survey-sol-dev southeastasia   Standard_F4s_v2 Windows …rvey-sol-dev411_z1
PSA_RG                    survey-sol-dev1 southeastasia     Standard_B4ms Windows …vey-sol-dev1394_z1
PSA_RG                     survey-sol-soc southeastasia     Standard_B4ms Windows …rvey-sol-soc774_z1
```

**List all VMs with only Name and Location object**

```
PS /home/sherwinowen> Get-AzVM | Select-Object Name, Location

Name                    Location
----                    --------
denr-fmb-dev            southeastasia
erc-db-server           southeastasia
erc-db-server-prod      southeastasia
erc-web-server          southeastasia
erc-web-server-prod     southeastasia
lmb-pmis-staging        southeastasia
postgresql              southeastasia
postgresql1             southeastasia
psa-web-app-prod        southeastasia
psa-web-app-prod-1      southeastasia
psa-web-app-prod-2      southeastasia
psa-web-app-prod-backup southeastasia
psa-web-app-prod-lb1    southeastasia
survey-sol              southeastasia
survey-sol-beta         southeastasia
survey-sol-dev          southeastasia
survey-sol-dev1         southeastasia
survey-sol-soc          southeastasia

```

```
PS /home/sherwinowen> Get-AzVM | Select-Object Name, Location | ConvertTo-Csv -NoTypeInformation
"Name","Location"
"denr-fmb-dev","southeastasia"
"erc-db-server","southeastasia"
"erc-db-server-prod","southeastasia"
"erc-web-server","southeastasia"
"erc-web-server-prod","southeastasia"
"lmb-pmis-staging","southeastasia"
"postgresql","southeastasia"
"postgresql1","southeastasia"
"psa-web-app-prod","southeastasia"
"psa-web-app-prod-1","southeastasia"
"psa-web-app-prod-2","southeastasia"
"psa-web-app-prod-backup","southeastasia"
"psa-web-app-prod-lb1","southeastasia"
"survey-sol","southeastasia"
"survey-sol-beta","southeastasia"
"survey-sol-dev","southeastasia"
"survey-sol-dev1","southeastasia"
"survey-sol-soc","southeastasia"
```

**List Subscriptions**

```
PS /home/sherwinowen> Get-AzSubscription

Name                 Id                                   TenantId                             State
----                 --                                   --------                             -----
Azure subscription 1 2120c628-c057-48b9-ace5-14fddbf72365 c710cb72-d86b-423a-ad42-9f4d6ed6dcb4 Enabl…
```

**Switching to another subscription**

```
PS /home/sherwinowen> $context = Get-AzSubscription -SubscriptionID 2120c628-c057-48b9-ace5-14fddbf72365

PS /home/sherwinowen> Set-AzContext $context
```



##### CLI

Install Azure CLI in Ubuntu

https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt

**Login to Azure account**

```
az login
```



### **Introduction to Azure Active Directory**

- **Microsoft Entra ID** - new name for Azure AD

#### Create Tenant

- Go to Microsoft Entra ID > Overview > Manage tenants > click Create

#### Add custom domain

- Go to Microsoft Entra ID > Custom domain names  Add

  

### Manage Role-based Access Control (RBAC) 

- Access management for cloud resources is a critical function for any organization that is using the cloud
- helps you manage who has access to Azure resources, what they can do with those resources, and what areas they have access to

#### Create custom RBAC Role

Goto Subscriptions > [subscription name] >  Access control (IAM) > Check access > Create a custom role > click Add



#### Resource Locks

Goto Resource groups > [resource group name] > Settings > Locks

- **Delete** means authorized users can read and modify a resource, but they can't delete it.

- **ReadOnly** means authorized users can read a resource, but they can't delete or update it. Applying this lock is similar to restricting all authorized users to the permissions that the Reader role provides.



#### Azure Policy

Goto Policy > Authoring > Definitions

- Azure Policy helps to enforce organizational standards and to assess compliance at-scale. 



#### Move Resources

Goto Resources > select resource > Click Move 

![image-20231016091909638](images/image-20231016091909638.png)



#### Managing Policy by PowerShell

Create new resource group

```
PS /home/sherwin> New-AzResourceGroup -Name "staging_vm" -Location 'Central US'

ResourceGroupName : staging_vm
Location          : centralus
ProvisioningState : Succeeded
Tags              : 
ResourceId        : /subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/staging_vm
```

List resource group

```
PS /home/sherwin> Get-AzResourceGroup -Name "staging_vm" -Location 'Central US'

ResourceGroupName : staging_vm
Location          : centralus
ProvisioningState : Succeeded
Tags              : 
ResourceId        : /subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/staging_vm
```

Create variable $rg

````
PS /home/sherwin> $rg = Get-AzResourceGroup -Name "staging_vm" -Location 'Central US'
````

Display  resource group properties using variable

```
PS /home/sherwin> $rg                  

ResourceGroupName : staging_vm
Location          : centralus
ProvisioningState : Succeeded
Tags              : 
ResourceId        : /subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/staging_vm

PS /home/sherwin> $rg.ResourceGroupName
staging_vm

PS /home/sherwin> $rg.Location         
centralus
```

Create variable $definition

```
$definition = Get-AzPolicyDefinition -Id '/providers/Microsoft.Authorization/policyDefinitions/0a914e76-4921-4c19-b460-a2d36003525a'
WARNING: Upcoming breaking changes in the cmdlet 'Get-AzPolicyDefinition' :
```

Display variable definition

```
PS /home/sherwin> $definition                                                                                                                         
Name               : 0a914e76-4921-4c19-b460-a2d36003525a
ResourceId         : /providers/Microsoft.Authorization/policyDefinitions/0a914e76-4921-4c19-b460-a2d36003525a
ResourceName       : 0a914e76-4921-4c19-b460-a2d36003525a
ResourceType       : Microsoft.Authorization/policyDefinitions
SubscriptionId     : 
Properties         : Microsoft.Azure.Commands.ResourceManager.Cmdlets.Implementation.Policy.PsPolicyDefinitionProperties
PolicyDefinitionId : /providers/Microsoft.Authorization/policyDefinitions/0a914e76-4921-4c19-b460-a2d36003525a
```

Create new policy assignment

```
PS /home/sherwin> New-AzPolicyAssignment -Name 'RGLocationMatch' -DisplayName 'Resource group matches resources location' -Scope $rg.ResourceId -PolicyDefinition $definition                              
WARNING: Upcoming breaking changes in the cmdlet 'New-AzPolicyAssignment' :

- The output type 'Microsoft.Azure.Commands.ResourceManager.Cmdlets.Implementation.Policy.PsPolicyAssignment' is changing
- The following properties in the output type are being deprecated : 'Properties'
- The following properties are being added to the output type : 'Description' 'DisplayName' 'EnforcementMode' 'Metadata' 'NonComplianceMessages' 'NotScopes' 'Parameters' 'PolicyDefinitionId' 'Scope'
- The change is expected to take effect in Az version : '11.0.0'
- The change is expected to take effect in Az.Resources version : '7.0.0'
Note : Go to https://aka.ms/azps-changewarnings for steps to suppress this breaking change warning, and other information on breaking changes in Azure PowerShell.
                                                                                                                        
Identity           : 
Location           : 
Name               : RGLocationMatch
ResourceId         : /subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/staging_vm/providers/Microsoft.Authorization/policyAssignments/RGLocationMatch
ResourceName       : RGLocationMatch
ResourceGroupName  : staging_vm
ResourceType       : Microsoft.Authorization/policyAssignments
SubscriptionId     : 2120c628-c057-48b9-ace5-14fddbf72365
Sku                : 
PolicyAssignmentId : /subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/staging_vm/providers/Microsoft.Authorization/policyAssignments/RGLocationMatch
Properties         : Microsoft.Azure.Commands.ResourceManager.Cmdlets.Implementation.Policy.PsPolicyAssignmentProperties
```

Check Policy Assignments

![image-20231016112252829](images/image-20231016112252829.png)

#### Subscription and Management Groups

Hierarchy of management groups and subscriptions

- Management group
- Subscription
- Resource group

### Configure access to storage

- An Azure storage account contains **blobs, files, queues, tables,** and **disks.**
- **Types of Storage Accounts: **
  - **General-purpose (v2 and v1)**
  - **BlockBlobStorage**
  - **FileStorage**
  - **BlobStorage**
- All storage accounts are encrypted using Storage Service Encryption (SSE) for data at rest
- Storage accounts endpoints:
  - **Blob storage:** https://*tutorialsdojo*.blob.core.windows.net
  - **Table storage:** https://*tutorialsdojo*.table.core.windows.net
  - **Queue storage**: https://*tutorialsdojo*.queue.core.windows.net
  - **Azure Files**: https://*tutorialsdojo*.file.core.windows.net
  - **Azure Data Lake Storage Gen2:** https://.dfs.core.windows.net

- Access tiers are: 
  - **Hot**
    - Highest storage costs, but lowest access costs
    - Store data that is accessed frequently
    - By default, new storage accounts are created in the hot tier
  - **Cool**
    - Lower storage costs, but higher access costs
    - **Store data that is infrequently accessed (at least 30 days)**
    - You can use a cool access tier for short-term backup.

- - **Archive**
    - Lowest storage costs, but the highest retrieval costs
    - Store data that is rarely accessed (at least 180 days)
    - Data needs to be stored for a long time.
- Storage redundancy includes:
  - **Locally redundant storage (LRS)** 
    - A low-cost redundancy strategy
    - Your data is copied synchronously three times within the primary region
  - **Zone-redundant storage (ZRS)**
    - Redundancy for high availability
    - The data is copied synchronously across three Azure availability zones in the primary region
  - **Geo-redundant storage (GRS)**
    - Cross-regional redundancy
    - In the primary region, data is synchronously copied three times, and then asynchronously copied to the secondary region.
    - Enable read-only geo-redundant storage (RA-GRS) to access data in the secondary region.
  - **Geo-zone-redundant storage (GZRS)**
    - Redundancy for both high availability and maximum durability
    - Data is copied synchronously across three Azure availability zones in the primary region, then copied asynchronously to the secondary region.
    - You can also enable RA-GZRS for read access data in the secondary region
- Moving of data into different storage account can be done automatically or manually
- You can migrate data manually using:
  - AzCopy uses a command-line utility
  - Data Movement Library is designed for high-performance, reliable, and easy data transfer operations similar to AzCopy
  - REST API or client library lets you create a custom application to migrate your data

**Types of Storage Accounts**

- **General-purpose v2 accounts**
  - Supports Data Lake Gen2, Blobs, Files Disks Queues Tables
  - Delivers the lowest per-gigabyte capacity prices for Azure Storage

- **General-purpose v1 accounts**

- - Supports Blobs, Files, Disks, Queues, Tables
  - You can upgrade a general-purpose v1 account to a general-purpose v2 account with no downtime and without copying the data.
  - You can use general-purpose v1 accounts since the General-purpose v2 accounts and Blob storage accounts only support the [Azure Resource Manager](https://tutorialsdojo.com/azure-resource-manager-arm/) deployment model.
  - If you don’t need a large capacity for transaction-intensive or significant geo-replication bandwidth, GPv1 is a suitable choice

- **BlockBlobStorage accounts**
  - Provides low, consistent latency, and higher transaction rates.
  - Upgrading a Blob storage account to a general-purpose v2 account has no downtime and you don’t need to copy the data
  - It doesn’t support hot, cool, and archive access tiers
  - You can use BlockBlobStorage for storing unstructured object data as block blobs or append blobs. 

- **FileStorage accounts**
  - Only supports file shares
  - Offers IOPS bursting

- **BlobStorage accounts**
  - Only supports block and append blobs.
  - BlobStorage account offers standard performance. While the BlockBlobStorage account supports premium performance.

| **Storage Account Type** | **Supported Services**                             | **Supported Performance Tiers** | **Supported Access Tiers** | **Replication Options**                                  | **Deployment Model**      | **Encryption** |
| ------------------------ | -------------------------------------------------- | ------------------------------- | -------------------------- | -------------------------------------------------------- | ------------------------- | -------------- |
| General-purpose V2       | Blob, File, Queue, Table, Disk, and Data Lake Gen2 | Standard, Premium               | Hot, Cool, Archive         | LRS, GRS, RA-GRS, ZRS, GZRS (preview), RA-GZRS (preview) | Resource Manager          | Encrypted      |
| General-purpose V1       | Blob, File, Queue, Table, and Disk                 | Standard, Premium               | N/A                        | LRS, GRS, RA-GRS                                         | Resource Manager, Classic | Encrypted      |
| BlockBlobStorage         | Blob (block blobs and append blobs only)           | Premium                         | N/A                        | LRS, ZRS                                                 | Resource Manager          | Encrypted      |
| FileStorage              | File only                                          | Premium                         | N/A                        | LRS, ZRS                                                 | Resource Manager          | Encrypted      |
| BlobStorage              | Blob (block blobs and append blobs only)           | Standard                        | Hot, Cool, Archive         | LRS, GRS, RA-GRS                                         | Resource Manager          | Encrypted      |

The following table describes key parameters for each redundancy option:

| Parameter                                             | LRS                                                   | ZRS                                                          | GRS/RA-GRS                                                   | GZRS/RA-GZRS                                                 |
| :---------------------------------------------------- | :---------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| Percent durability of objects over a given year       | at least 99.999999999% (11 9's)                       | at least 99.9999999999% (12 9's)                             | at least 99.99999999999999% (16 9's)                         | at least 99.99999999999999% (16 9's)                         |
| Availability for read requests                        | At least 99.9% (99% for cool or archive access tiers) | At least 99.9% (99% for cool access tier)                    | At least 99.9% (99% for cool or archive access tiers) for GRS  At least 99.99% (99.9% for cool or archive access tiers) for RA-GRS | At least 99.9% (99% for cool access tier) for GZRS  At least 99.99% (99.9% for cool access tier) for RA-GZRS |
| Availability for write requests                       | At least 99.9% (99% for cool or archive access tiers) | At least 99.9% (99% for cool access tier)                    | At least 99.9% (99% for cool or archive access tiers)        | At least 99.9% (99% for cool access tier)                    |
| Number of copies of data maintained on separate nodes | Three copies within a single region                   | Three copies across separate availability zones within a single region | Six copies total, including three in the primary region and three in the secondary region | Six copies total, including three across separate availability zones in the primary region and three locally redundant copies in the secondary region |

### Manage data in Azure storage accounts

#### Moving Large Files via Azure Data Disk

**Azure Import/Export service** 

- is used to securely import large amounts of data to Azure Blob storage and Azure Files by shipping disk drives to an Azure datacenter. 
- This service can also be used to transfer data from Azure Blob storage to disk drives and ship to your on-premises sites. 
- Data from one or more disk drives can be imported either to Azure Blob storage or Azure Files.

#### Copy files with AZCopy

**Syntax**

```
azcopy copy 'https://<source-storage-account-name>.<blob or dfs>.core.windows.net/<container-name>/<blob-path>' 'https://<destination-storage-account-name>.<blob or dfs>.core.windows.net/<container-name>/<blob-path>'
```

**Syntax**

```
azcopy copy 'https://<source-storage-account-name>.<blob or dfs>.core.windows.net/<container-name>/<blob-path>' 'https://<destination-storage-account-name>.<blob or dfs>.core.windows.net/<container-name>/<blob-path>'
```

```
azcopy copy 'cloud-sql-proxy' 'https://owenstorage001.blob.core.windows.net/owen-con?sp=racwdl&st=2023-12-12T23:02:06Z&se=2023-12-13T07:02:06Z&spr=https&sv=2022-11-02&sr=c&sig=038nDY4XBTFSJ85jw79UTZhiDys1Y%2BqABtZATjM0LUg%3D'
```

## Azure Virtual Machine

### Create a VM in powershell

```
New-AzVm `
    -ResourceGroupName 'myResourceGroup' `
    -Name 'myVM' `
    -Location 'East US' `
    -Image 'MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest' `
    -VirtualNetworkName 'myVnet' `
    -SubnetName 'mySubnet' `
    -SecurityGroupName 'myNetworkSecurityGroup' `
    -PublicIpAddressName 'myPublicIpAddress' `
    -OpenPorts 80,3389
```

### Install web server

```
Invoke-AzVMRunCommand -ResourceGroupName 'myResourceGroup' -VMName 'myVM' -CommandId 'RunPowerShellScript' -ScriptString 'Install-WindowsFeature -Name Web-Server -IncludeManagementTools'
```

### Start and Stop VM in Powershell

```
Start-AzVM -Name] <String> -ResourceGroupName <String>

Stop-AzVM -Name] <String> -ResourceGroupName <String>
```

### Restart and Delete VM in Powershell

```
Restart-AzVM -Name] <String> -ResourceGroupName <String>

Remove-AzVM -Name] <String> -ResourceGroupName <String>
```


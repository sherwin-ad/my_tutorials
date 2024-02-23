## AZ-104 Microsoft Azure Administrator Exam Prep

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



## Automate deployment of resources by using templates

### What is Azure Resource Manager?

- is the deployment and management service for Azure. 
- It allows users to manage and organize resources consistently. 
- The ARM acts as a conduit for deploying and managing Azure resources. 
- It provides a management layer that enables creating, updating, and deleting resources in your Azure account.

![Azure 101: Azure Resource Manager and ARM Templates](images/consistent-management-layer.png)

### What are ARM Templates?

- are a form of infrastructure as code, a concept where you define the infrastructure you need to be deployed. 
- You no longer need to click around the portal creating virtual machines or writing scripts to deploy a storage account. Instead, the template defines the resources, and the Azure ARM management layer is responsible for creating the infrastructure.

### ARM Template Basics

- Parameters
- Functions
- Variables
- Resources
- Outputs

#### Parameters

- allow you to pass different values to the ARM template for use during the deployment. 
- Some common examples include names of resources or which Azure region to host them. 
- Parameters enable your templates to be more dynamic and used across different environments.

```
"parameters": {

    "VMName": {

        "type": "string",

        "metadata": {

            "description": "The name of the virtual machine."

        }

    },




    "VMAdmin": {

        "type": "string",

        "metadata": {

            "description": "Name of the local virtual machine administrator account."

        },

        "defaultValue": "local_admin"

    },




    "VMAdminPassword": {

        "type": "securestring",

        "metadata": {

            "description": "Password for the local virtual machine administrator account."

        }

    },




    "VMSize": {

        "type": "string",

        "metadata": {

            "description": "Virtual Machine SKU Size"

        },

        "allowedValues": [

            "Standard_D2_v4",

            "Standard_D4_v4",

            "Standard_D8_v4",

            "Standard_D16_v4"

        ]

    }

}
```

Here is an example file named *virtualMachine.parameters.json* with values for the parameters defined earlier in this section. Note that the *VMAdmin* parameter is technically optional since it has a default value. If you did not include it in this file, the template uses the defined default value.

```
{

    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",

    "contentVersion": "1.0.0.0",

    "parameters": {

        "VMName": {

            "value": "webapp01"

        },

        "VMAdmin": {

            "value": "svr_admin"

        },

        "VMAdminPassword": {

            "value": "N0t@Rea!P@ss0wrd"

        },

        "VMSize": {

            "value": "Standard_D4_v4"

        }

    }

}
```

#### Functions

- allow you to create complicated expressions that you don’t want to repeat throughout the template. 
- ARM template functions are a lot of functions in other programming languages. 
- You call them when you need to run them, and you can pass information to them and expect a return value.

For example, say you need to create unique names for resources. Instead of copying and pasting the same code to generate the unique name, you create a function that makes the unique name. For example, here is a function called *uniqueName* with a parameter named *prefix* that returns a unique name using the resource group ID.

Note the *namespace* value. This value can be anything you want. Functions require a different namespace value to avoid naming conflicts with regular template functions.

```
"functions": [

  {

    "namespace": "varonis",

    "members": {

      "uniqueName": {

        "parameters": [

          {

            "name": "prefix",

            "type": "string"

          }

        ],

        "output": {

          "type": "string",

          "value": "[concat(toLower(parameters('prefix')), uniqueString(resourceGroup().id))]"

        }

      }

    }

  }

]
```

Here is an example of calling the *uniqueName* function passing *prodwebapp* as the value for the *prefix* parameter. Instead of passing the string, you can also give a template parameter or variable value.

```
"name": "[varonis.uniqueName('prodwebapp')]"
```

#### Variables

- Variables are not much different in ARM templates than you find in other programming languages. 
- Variables contain values that are used repeatedly throughout the template. 
- Like functions, you can use variables to create complicated expressions, so you don’t have to repeat them in the template.

Like parameters, variables have the same data types, such as strings, objects, and integers. You define variables using the colon as the assignment operator. For example, instead of passing the Azure region as a parameter, you can define it as a variable, like this:

```
"variables": {

    "location": "westus2"

}
```

To reference a variable later, using the *variable()* function with the variable name, like this:

```
"location": "[variables('location')]"
```

#### Resources

- defines what Azure resources to deploy with the template.
- Resources can be anything as small as a network security group all the way to virtual machines, storage accounts, or Azure Functions.

Most resources have a set of common properties. Here is a template of a resource definition with explanations of each part.

```
"name": “<resource name>”,

"type": "Microsoft.<resource provider>/<resource type>",

"apiVersion": "<api version>",

"tags": {

    "key": "value"

},

"location": "<location>",

"dependsOn": [ ],

"properties": { }
```

- **Name**: Name for the resource. This value can be set from a parameter, variable, or set manually.

- **Type**: The type of resource to deploy. The *<resource provider>* refers to the high-level family of resources to deploy. Examples include Microsoft.Compute, Microsoft.Storage, and Microsoft.Network. The *<resource type>* maps out more precisely the resource to deploy. For example, Microsoft.Compute contains resources related to compute infrastructure such as virtual machines, disks, and availability sets. The resource provider and resource type are separated by a forward slash ( / ).

- **ApiVersion**: The API version determines what properties are available to configure on the resource. As Azure grows, Microsoft often adds new features or settings to resources. The API version combined with the resource type determines what you can configure. The API version is formatted as YYYY-MM-DD.

- **Tags**: You can tag your resources just like when you create them in the Azure portal. Tags allow organizing resources and are made up of a key-value pair. For example, you can have a tag showing the resource’s environment, such as development or production.

- **Location**: Location is the Azure region to deploy the resource. You typically deploy resources to the same resource group when you create a deployment (you’ll see a demo of this later). To automatically set the location to the same location as the resource group, use the *resourceGroup()* function and the *location* property, like this:

```
“location”: "[resourceGroup().location]"
```

- **DependsOn**: Unlike other infrastructure as code languages like Terraform, ARM templates require that you manually create resource dependencies. Dependencies determine the order Azure should deploy the resources. For example, if an ARM template is deploying a virtual network and a virtual machine, the virtual network must exist first before creating the virtual machine.

- **Properties**: The properties section contains configuration information for the deployed resource. For example, virtual networks have properties like their address space and subnets. Storage accounts have their access tier and minimum allowed TLS version.

#### Outputs

The outputs section defines values and information returned from the deployment. Outputs are helpful for data that Azure dynamically generates during the deployment, like a public IP address.

Here is an example of an output section displaying the connection endpoints for a newly created storage account. The ARM template generates a storage account name in the *stgAccountName* variable.

```
"outputs": {

    "endpoints": {

        "type": "object",

        "value": "[reference(variables('stgAcctName')).primaryEndpoints]"

    }

}
```

### Deploy an ARM Template using Powershell

```
New-AzResourceGroupDeployment \
  -Name ExampleDeployment \
  -ResourceGroupName ExampleResourceGroup \
  -TemplateFile <path-to-template> \
  -TemplateParameterFile <path-to-parameter>
```

### Bicep

**Documentation**

https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/

- Bicep is a language for declaratively deploying Azure resources. You can use Bicep instead of JSON for developing your Azure Resource Manager templates (ARM templates).

### Hands-On Practice

https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator/blob/master/Instructions/Labs/LAB_03b-Manage_Azure_Resources_by_Using_ARM_Templates.md



## Azure Disk Encryption (ADE)

**Double Encryption**

Go to Virtual Machine > Settings > Disk and click Additional settings tab
![image-20240110094136964](images/image-20240110094136964.png)



**Check double encryption**

![image-20240110143007608](images/image-20240110143007608.png)

## Create and configure an Azure App Services

Go to Web App

### Hands-On Practice

https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator/blob/master/Instructions/Labs/LAB_09a-Implement_Web_Apps.md

## Azure Kubernetes Service

### Create AKS cluster

Go to Kubernetes services and click Create a Kubernetes cluster

### Communicate to AKS cluster

Go to cloud shell bash 

Get credentials

 ```
 sherwin [ ~ ]$ az aks get-credentials --resource-group test_rg --name test-aks 
 ```

```
sherwin [ ~ ]$ kubectl get nodes
NAME                                STATUS   ROLES   AGE   VERSION
aks-agentpool-25762512-vmss000000   Ready    agent   13m   v1.27.7
aks-agentpool-25762512-vmss000001   Ready    agent   13m   v1.27.7
```

### Deploy an image to an AKS cluster

deployment.yaml

```
 - apiVersion: v1
  kind: Namespace
  metadata:
    name: default-1704961745547
  spec:
    finalizers:
      - kubernetes
- apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: azuredocs
    namespace: default-1704961745547
  spec:
    replicas: 1
    selector:
      matchLabels:
        app: azuredocs
    template:
      metadata:
        labels:
          app: azuredocs
      spec:
        nodeSelector:
          kubernetes.io/os: linux
        containers:
          - name: azuredocs
            image: mcr.microsoft.com/azuredocs/aci-helloworld
            ports:
              - containerPort: 80
              - containerPort: 443
            resources:
              requests:
                cpu: '0'
                memory: '0'
              limits:
                cpu: '256'
                memory: 11400G
- apiVersion: v1
  kind: Service
  metadata:
    name: azuredocs-service
    namespace: default-1704961745547
  spec:
    type: LoadBalancer
    ports:
      - targetPort: 80
        name: port80
        port: 80
        protocol: TCP
      - targetPort: 443
        name: port443
        port: 443
        protocol: TCP
    selector:
      app: azuredocs
```



Go to Kubenetes Service and click Create a quick start application
![image-20240111155902302](images/image-20240111155902302.png)

Create a single image application

![image-20240111160024762](images/image-20240111160024762.png)

![image-20240111162636010](images/image-20240111162636010.png)

![image-20240111162842156](images/image-20240111162842156.png)

```
sherwin [ ~ ]$ az aks get-credentials --resource-group test_rg --name test-aks 
Merged "test-aks" as current context in /home/sherwin/.kube/config
```

**List namspace**

```
sherwin [ ~ ]$ kubectl get namespace
NAME                    STATUS   AGE
calico-system           Active   147m
default                 Active   148m
default-1704961745547   Active   93m
gatekeeper-system       Active   138m
kube-node-lease         Active   148m
kube-public             Active   148m
kube-system             Active   148m
tigera-operator         Active   147m
```

**List deployments**

```
sherwin [ ~ ]$ kubectl get deployments -n default-1704961745547
NAME        READY   UP-TO-DATE   AVAILABLE   AGE
azuredocs   1/1     1            1           94m
```

**List services**

```
sherwin [ ~ ]$ kubectl get services -n default-1704961745547
NAME                TYPE           CLUSTER-IP    EXTERNAL-IP    PORT(S)                      AGE
azuredocs-service   LoadBalancer   10.0.74.128   20.84.27.104   80:30559/TCP,443:31316/TCP   95m
```

**List nodes**

```
sherwin [ ~ ]$ kubectl get nodes -n default-1704961745547
NAME                                STATUS   ROLES   AGE    VERSION
aks-agentpool-25762512-vmss000000   Ready    agent   151m   v1.27.7
aks-agentpool-25762512-vmss000001   Ready    agent   151m   v1.27.7

```

**List pods**

```
sherwin [ ~ ]$ kubectl get pods -n default-1704961745547
NAME                         READY   STATUS    RESTARTS   AGE
azuredocs-58fd9f67d4-xqwd4   1/1     Running   0          97m

```

```
sherwin [ ~ ]$ kubectl get pods -n default-1704961745547 -o wide
NAME                         READY   STATUS    RESTARTS   AGE   IP            NODE                                NOMINATED NODE   READINESS GATES
azuredocs-58fd9f67d4-xqwd4   1/1     Running   0          97m   10.244.1.15   aks-agentpool-25762512-vmss000000   <none>           <none>
```

### Scaling Kubernetes

**List deployments**

```
sherwin [ ~ ]$ kubectl get deployments -n default-1704961745547 
NAME        READY   UP-TO-DATE   AVAILABLE   AGE
azuredocs   1/1     1            1           116
```

**Scale**

```
sherwin [ ~ ]$ kubectl scale --replicas=2 deployment/azuredocs -n default-1704961745547 
deployment.apps/azuredocs scaled
```

**List pods**

```
sherwin [ ~ ]$ kubectl get pods -n default-1704961745547 -o wide
NAME                         READY   STATUS    RESTARTS   AGE    IP            NODE                                NOMINATED NODE   READINESS GATES
azuredocs-58fd9f67d4-dqx8z   1/1     Running   0          101s   10.244.0.6    aks-agentpool-25762512-vmss000002   <none>           <none>
azuredocs-58fd9f67d4-xqwd4   1/1     Running   0          118m   10.244.1.15   aks-agentpool-25762512-vmss000000   <none>           <none>
```

### AKS Storage Options

#### **Data Volumes can be added using Azure Storage**

- Azure Disk
  - can only be attached to a single node
- Azure Files
  - Mount SMB 1.1.1 file share of NFS 4.1 file share
  - Multiple nodes and multiple pods can access once
  - Premium SSD or Standard HDD storage
- Azure NetApp Files
- Azure Blobs
  - Mount using NFS 3.0 protocol: Block Blobs

#### Volumes Types

- emptydir
  - Commonly used as temporary space for a pod.
- secret
  - You can use secret volumes to inject sensitive data into pods, such as passwords.
- configmap 
  - You can use *configMap* to inject key-value pair properties into pods, such as application configuration information

#### Steps creating persistent volume

1. Definition of storage class

   storage-class.yaml

   ```
   apiVersion: storage.k8s.io/v1
   kind: StorageClass
   metadata:
     name: managed-premium-retain
   provisioner: disk.csi.azure.com
   parameters:
     skuName: Premium_ZRS
   reclaimPolicy: Retain
   volumeBindingMode: WaitForFirstConsumer
   allowVolumeExpansion: true
   ```

   Apply

   ```
   kubectl apply -f storage-class.yaml
   ```

2. Configuration of persistent volume claim using this storage class

3. Create the persistent volume claim and provision the volume

   azure-pvc.yaml

   ```
   apiVersion: v1
   kind: PersistentVolumeClaim
   metadata:
     name: azure-managed-disk
   spec:
     accessModes:
     - ReadWriteOnce
     storageClassName: managed-premium-retain
     resources:
       requests:
         storage: 5Gi
   ```

   Apply

   ```
   kubectl apply -f azure-pvc.yaml
   ```

4. Attach the volume to the pod

   nginx.yaml

   ```
   kind: Pod
   apiVersion: v1
   metadata:
     name: nginx
   spec:
     containers:
       - name: myfrontend
         image: mcr.microsoft.com/oss/nginx/nginx:1.15.5-alpine
         volumeMounts:
         - mountPath: "/mnt/azure"
           name: volume
     volumes:
       - name: volume
         persistentVolumeClaim:
           claimName: azure-managed-disk
   ```

   Apply

   ```
   kubectl apply -f nginx.yaml
   ```



#### Hands-On Practice

There is a lab available on Github, which requires your own Azure account to use instead of one provided by Microsoft:

[AZ-104-MicrosoftAzureAdministrator/Instructions/Labs/Lab_09c-Implement-Azure-Container-Apps.md.md at master · MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator (github.com)](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator/blob/master/Instructions/Labs/Lab_09c-Implement-Azure-Container-Apps.md)

https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator/blob/master/Instructions/Labs/LAB_09b-Implement_Azure_Container_Instances.md

Install Docker Toolbox on Windows:

https://docs.docker.com/toolbox/toolbox_install_windows/

Install Docker Desktop on Windows:

https://docs.docker.com/docker-for-windows/install/

We've also created a real-life AKS lab for you where we teach you

Resources for this lecture

- AKS+scaling+lab.pdf
- testkubernetesapp.yaml



## ACI Azure Container Instance

**Azure Container Instance Features**

ACI provides direct control over containers, with no need to configure cloud virtual machines (VMs) or implement container orchestration platforms like Kubernetes. Key features include:

- Support for both Linux and Windows containers
- Ability to launch new containers through the Azure portal or command line interface (CLI)—underlying compute resources are automatically configured and scaled
- Support for standard Docker images and the use of public container registries, such as Docker Hub, as well as Azure Container Registry
- Ability to provide access to containers over Internet using a fully qualified domain name and IP address
- Ability to specify the number of CPU cores and memory required for container instances
- Support for [persistent storage](https://bluexp.netapp.com/blog/understanding-kubernetes-persistent-volume-provisioning) by mounting Azure file shares to the container
- Defining groups that organize multiple containers that share the same host, storage, and networking resources. This is similar to the concept of a pod in Kubernetes.

### ACI Container Groups

**What is a container group?**

A container group is a collection of containers that get scheduled on the same host machine. The containers in a container group share a lifecycle, resources, local network, and storage volumes. It's similar in concept to a *pod* in [Kubernetes](https://kubernetes.io/docs/concepts/workloads/pods/).

The following diagram shows an example of a container group that includes multiple containers:

![Container groups diagram](images/container-groups-example.png)

This example container group:

- Is scheduled on a single host machine.
- Is assigned a DNS name label.
- Exposes a single public IP address, with one exposed port.
- Consists of two containers. One container listens on port 80, while the other listens on port 5000.
- Includes two Azure file shares as volume mounts, and each container mounts one of the shares locally.

```
code azuredeploy.json
```

azuredeploy.json

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "containerGroupName": {
      "type": "string",
      "defaultValue": "myContainerGroup",
      "metadata": {
        "description": "Container Group name."
      }
    }
  },
  "variables": {
    "container1name": "aci-tutorial-app",
    "container1image": "mcr.microsoft.com/azuredocs/aci-helloworld:latest",
    "container2name": "aci-tutorial-sidecar",
    "container2image": "mcr.microsoft.com/azuredocs/aci-tutorial-sidecar"
  },
  "resources": [
    {
      "name": "[parameters('containerGroupName')]",
      "type": "Microsoft.ContainerInstance/containerGroups",
      "apiVersion": "2019-12-01",
      "location": "[resourceGroup().location]",
      "properties": {
        "containers": [
          {
            "name": "[variables('container1name')]",
            "properties": {
              "image": "[variables('container1image')]",
              "resources": {
                "requests": {
                  "cpu": 1,
                  "memoryInGb": 1.5
                }
              },
              "ports": [
                {
                  "port": 80
                },
                {
                  "port": 8080
                }
              ]
            }
          },
          {
            "name": "[variables('container2name')]",
            "properties": {
              "image": "[variables('container2image')]",
              "resources": {
                "requests": {
                  "cpu": 1,
                  "memoryInGb": 1.5
                }
              }
            }
          }
        ],
        "osType": "Linux",
        "ipAddress": {
          "type": "Public",
          "ports": [
            {
              "protocol": "tcp",
              "port": 80
            },
            {
                "protocol": "tcp",
                "port": 8080
            }
          ]
        }
      }
    }
  ],
  "outputs": {
    "containerIPv4Address": {
      "type": "string",
      "value": "[reference(resourceId('Microsoft.ContainerInstance/containerGroups/', parameters('containerGroupName'))).ipAddress.ip]"
    }
  }
}
```

**Deploy ACI container group** 

```
$ az deployment group create --resource-group test_rg --template-file azuredeploy.json 
```

**View deployment state**

```
$ az container show --resource-group test_rg --name myContainerGroup --output table
Name              ResourceGroup    Status    Image                                                                                               IP:ports               Network    CPU/Memory       OsType    Location
----------------  ---------------  --------  --------------------------------------------------------------------------------------------------  ---------------------  ---------  ---------------  --------  ----------
myContainerGroup  test_rg          Running   mcr.microsoft.com/azuredocs/aci-tutorial-sidecar,mcr.microsoft.com/azuredocs/aci-helloworld:latest  20.124.57.195:80,8080  Public     1.0 core/1.5 gb  Linux     eastus
```

**View ACI Cotainer Group in Azure console**

Go to All services > Resource groups > ACI Container group name

![image-20240115103552160](images/image-20240115103552160.png)



## Azure Container Apps (ACA)

 **What is an Azure Container App?**

Azure Container Apps (ACA) provide a serverless hosting service that sits on top of an AKS service, allowing you to deploy multiple containers without dealing with the underlying infrastructure. In fact, ACA do not even expose Kubernetes APIs to the users.

## Azure Container Registry (ACR)

- is a managed registry service based on the open-source Docker Registry 2.0. Create and maintain Azure container registries to store and manage your container images and related artifacts.

| Tier         | Description                                                  |
| :----------- | :----------------------------------------------------------- |
| **Basic**    | A cost-optimized entry point for developers learning about Azure Container Registry. Basic registries have the same programmatic capabilities as Standard and Premium (such as Microsoft Entra [authentication integration](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-authentication#individual-login-with-azure-ad), [image deletion](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-delete), and [webhooks](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-webhook)). However, the included storage and image throughput are most appropriate for lower usage scenarios. |
| **Standard** | Standard registries offer the same capabilities as Basic, with increased included storage and image throughput. Standard registries should satisfy the needs of most production scenarios. |
| **Premium**  | Premium registries provide the highest amount of included storage and concurrent operations, enabling high-volume scenarios. In addition to higher image throughput, Premium adds features such as [geo-replication](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-geo-replication) for managing a single registry across multiple regions, [content trust](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-content-trust) for image tag signing, [private link with private endpoints](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-private-link) to restrict access to the registry. |

### Push your first image to your Azure container registry using the Docker CLI

**Log in to a registry**

```
az login
az acr login --name myregistry
```

**Pull a public Nginx image**

```
docker pull nginx
```

**Run the container locally**

```
docker run -it --rm -p 8080:80 nginx
```

![Nginx on local computer](images/nginx.png)

**Create an alias of the image**

```
docker tag nginx myregistry.azurecr.io/samples/nginx
```

**Push the image to your registry**

```
docker push myregistry.azurecr.io/samples/nginx
```

**Pull the image from your registry**

```
docker pull myregistry.azurecr.io/samples/nginx
```

Start the Nginx **container**

```
docker run -it --rm -p 8080:80 myregistry.azurecr.io/samples/nginx
```

Browse to `http://localhost:8080` to view the running container.

To stop and remove the container, press `Control`+`C`.

**Remove the image (optional)**

```
docker rmi myregistry.azurecr.io/samples/nginx
```

Azure CLI

```
az acr repository delete --name myregistry --image samples/nginx:latest
```



## Manage Virtual Networking

### Add a Firewall to the Network

https://learn.microsoft.com/en-us/azure/firewall/tutorial-firewall-deploy-portal



### Create Virtual WAN

https://learn.microsoft.com/en-us/azure/virtual-wan/how-to-nva-hub



### Hands-On Practice

https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator/blob/master/Instructions/Labs/LAB_04-Implement_Virtual_Networking.md



## Implement and manage virtual networking

### VNET Peering

- VNet Peering connects two virtual networks for resource sharing in one region or across regions in Microsoft Azure
- Virtual network peering enables you to seamlessly connect two or more [Virtual Networks](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview) in Azure. 
- The virtual networks appear as one for connectivity purposes. 
- The traffic between virtual machines in peered virtual networks uses the Microsoft backbone infrastructure. 
- Like traffic between virtual machines in the same network, traffic is routed through Microsoft's *private* network only.

### Configure Global Peering

- **Global virtual network peering**: Connecting virtual networks across Azure regions.

### Virtual network peering pricing

Virtual network peering links virtual networks, enabling you to route traffic between them using private IP addresses. Ingress and egress traffic is charged at both ends of the peered networks.

#### VNET Peering within the same region

| Inbound data transfer  | $0.01 per GB |
| ---------------------- | ------------ |
| Outbound data transfer | $0.01 per GB |

#### Global VNET Peering

|                        | Zone 1        | Zone 2       | Zone 3       | US Gov1       |
| ---------------------- | ------------- | ------------ | ------------ | ------------- |
| Inbound data transfer  | $0.035 per GB | $0.09 per GB | $0.16 per GB | $0.044 per GB |
| Outbound data transfer | $0.035 per GB | $0.09 per GB | $0.16 per GB | $0.044 per GB |

- A sub-region is the lowest level geo-location that you may select to deploy your applications and associated data. For data transfers (except CDN), the following regions correspond to Zone 1, Zone 2, and Zone 3:

**Zone 1**—Australia Central, Australia Central 2, Canada Central, Canada East, Central US, East US, East US 2, France Central, France South, Germany North, Germany West Central, North Central US, North Europe, Norway East, Norway West, South Central US, Switzerland North, Switzerland West, UK South, UK West, West Central US, West Europe, West US, West US 2

**Zone 2**—Australia East, Australia Southeast, Central India, East Asia, Japan East, Japan West, Korea Central, Korea South, Southeast Asia, South India, West India

**Zone 3**—Brazil South, South Africa North, South Africa West, UAE Central, UAE North

**US Gov**—US Gov Arizona, US Gov Texas, US Gov Virginia



### Virtual Network Gateway

- Azure VPN Gateway is a service that uses a specific type of virtual network gateway to send encrypted traffic between an Azure virtual network and on-premises locations over the public Internet. 
- You can also use VPN Gateway to send encrypted traffic between Azure virtual networks over the Microsoft network.

#### VPN Gateways Pricing

Setting up a virtual network is free of charge. However, we do charge for the VPN gateway that connects to on-premises and other virtual networks in Azure. This charge is based on the amount of time that gateway is provisioned and available.

| VPN Gateway Type | Price      | Bandwidth | S2S Tunnels                                           | P2S Tunnels                                                  |
| ---------------- | ---------- | --------- | ----------------------------------------------------- | ------------------------------------------------------------ |
| Basic            | $0.04/hour | 100 Mbps  | Max 10 1-10: Included                                 | Max 128 1-128: Included                                      |
| VpnGw1           | $0.19/hour | 650 Mbps  | Max 30 1-10: Included 11-30: $0.015/hour per tunnel   | Max 250 1-128: Included 129-250: $0.01/hour per connection   |
| VpnGw2           | $0.49/hour | 1 Gbps    | Max 30 1-10: Included 11-30: $0.015/hour per tunnel   | Max 500 1-128: Included 129-500: $0.01/hour per connection   |
| VpnGw3           | $1.25/hour | 1.25 Gbps | Max 30 1-10: Included 11-30: $0.015/hour per tunnel   | Max 1,000 1-128: Included 129-1,000: $0.01/hour per connection |
| VpnGw4           | $2.10/hour | 5 Gbps    | Max 100 1-10: Included 11-100: $0.015/hour per tunnel | Max 5,000 1-128: Included 129-5,000: $0.01/hour per connection |
| VpnGw5           | $3.65/hour | 10 Gbps   | Max 100 1-10: Included 11-100: $0.015/hour per tunnel | Max 10,000 1-128: Included 129-10,000: $0.01/hour per connection |

#### Data Transfers Pricing

| Type                             | Example                                                      | Price                                                        |
| -------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Inbound Inter-virtual            | Data going into Azure data centers between two virtual networks | Free                                                         |
| Outbound Inter-virtual           | Data going out of Azure data centers between two virtual networks | From Zone 1*— **$0.035** per GBFrom Zone 2*— **$0.09** per GBFrom Zone 3*— **$0.16** per GB |
| Outbound P2S (Point-to-Site) VPN | Data going out of Azure Virtual Network via P2S VPNs         | Data transferred out of Azure Virtual Networks via the P2S VPNs will be charged at standard [data transfer](https://azure.microsoft.com/en-us/pricing/details/bandwidth/) rates. |

#### VPN Gateways — Availability Zones Pricing

As with all of Azure, we are continuously innovating, upgrading, and refining our virtual network gateways to further increase reliability and availability. By adding support for [Azure Availability Zones](https://docs.microsoft.com/en-us/azure/availability-zones/az-overview), we bring increased resiliency, scalability, and higher availability to virtual network gateways. You can deploy VPN and ExpressRoute gateways in Azure Availability Zones by using the new Zone Redundant Gateway SKUs. This physically and logically separates them into different Availability Zones protecting your on-premises network connectivity to Azure from zone-level failures. The bandwidth thresholds remain the same for the zone redundant gateways.

| VPN Gateway Type | Price       | Bandwidth | S2S Tunnels                                           | P2S Tunnels                |
| ---------------- | ----------- | --------- | ----------------------------------------------------- | -------------------------- |
| VpnGw1AZ         | $0.361/hour | 650 Mbps  | Max 30 1-10: Included 11-30: $0.015/hour per tunnel   | Max 250 1-128: Included    |
| VpnGw2AZ         | $0.564/hour | 1 Gbps    | Max 30 1-10: Included 11-30: $0.015/hour per tunnel   | Max 500 1-128: Included    |
| VpnGw3AZ         | $1.438/hour | 3 Gbps    | Max 30 1-10: Included 11-30: $0.015/hour per tunnel   | Max 1,000 1-128: Included  |
| VpnGw4AZ         | $2.42/hour  | 6 Gbps    | Max 100 1-10: Included 11-100: $0.015/hour per tunnel | Max 5,000 1-128: Included  |
| VpnGw5AZ         | $4.20/hour  | 10 Gbps   | Max 100 1-10: Included 11-100: $0.015/hour per tunnel | Max 10,000 1-128: Included |



#### Hands-On Practice

https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator/blob/master/Instructions/Labs/LAB_05-Implement_Intersite_Connectivity.md



### Configure Name Resolution

#### Azure DNS Services

- Azure DNS is a hosting service for DNS domains that provides name resolution by using Microsoft Azure infrastructure. 
- By hosting your domains in Azure, you can manage your DNS records by using the same credentials, APIs, tools, and billing as your other Azure services.

#### Create Private DNS Zone

![Summary diagram of the quickstart setup](images/private-dns-quickstart-summary.png)

The following example creates a DNS zone called **private.contoso.com** in a resource group called **MyAzureResourceGroup**.

A DNS zone contains the DNS entries for a domain. To start hosting your domain in Azure DNS, you create a DNS zone for that domain name.

![Screenshot of private DNS zones search.](https://learn.microsoft.com/en-us/azure/dns/media/private-dns-portal/search-private-dns.png)

1. On the portal search bar, type **private dns zones** in the search text box and press **Enter**.
2. Select **Private DNS zone**.
3. Select **Create private dns zone**.
4. On the **Create Private DNS zone** page, type or select the following values:
   - **Resource group**: Select **Create new**, enter *MyAzureResourceGroup*, and select **OK**. The resource group name must be unique within the Azure subscription.
   - **Name**: Type *private.contoso.com* for this example.
5. For **Resource group location**, select **West Central US**.
6. Select **Review + Create**.
7. Select **Create**.

It may take a few minutes to create the zone.



##### Virtual network and parameters

In this section you'll need to replace the following parameters in the steps with the information below:

Expand table

| Parameter                  | Value                                                 |
| :------------------------- | :---------------------------------------------------- |
| **<resource-group-name>**  | MyAzureResourceGroup (Select existing resource group) |
| **<virtual-network-name>** | MyAzureVNet                                           |
| **<region-name>**          | West Central US                                       |
| **<IPv4-address-space>**   | 10.2.0.0/16                                           |
| **<subnet-name>**          | MyAzureSubnet                                         |
| **<subnet-address-range>** | 10.2.0.0/24                                           |



##### Create the virtual network and subnet

In this section, you'll create a virtual network and subnet.

1. On the upper-left side of the screen, select **Create a resource > Networking > Virtual network** or search for **Virtual network** in the search box.

2. In **Create virtual network**, enter or select this information in the **Basics** tab:

   Expand table

   | **Setting**          | **Value**                                                    |
   | :------------------- | :----------------------------------------------------------- |
   | **Project Details**  |                                                              |
   | Subscription         | Select your Azure subscription                               |
   | Resource Group       | Select **Create new**, enter **<resource-group-name>**, then select OK, or select an existing **<resource-group-name>** based on parameters. |
   | **Instance details** |                                                              |
   | Name                 | Enter **<virtual-network-name>**                             |
   | Region               | Select **<region-name>**                                     |

3. Select the **IP Addresses** tab or select the **Next: IP Addresses** button at the bottom of the page.

4. In the **IP Addresses** tab, enter this information:

   Expand table

   | Setting            | Value                          |
   | :----------------- | :----------------------------- |
   | IPv4 address space | Enter **<IPv4-address-space>** |

5. Under **Subnet name**, select the word **default**.

6. In **Edit subnet**, enter this information:

   Expand table

   | Setting              | Value                            |
   | :------------------- | :------------------------------- |
   | Subnet name          | Enter **<subnet-name>**          |
   | Subnet address range | Enter **<subnet-address-range>** |

7. Select **Save**.

8. Select the **Review + create** tab or select the **Review + create** button.

9. Select **Create**.



##### Link the virtual network

To link the private DNS zone to a virtual network, you create a virtual network link.

![Screenshot of adding virtual network link.](images/dns-add-virtual-network-link.png)

1. Open the **MyAzureResourceGroup** resource group and select the **private.contoso.com** private zone.

2. On the left pane, select **Virtual network links**.

3. Select **Add**.

4. Type **myLink** for the **Link name**.

5. For **Virtual network**, select **myAzureVNet**.

6. Select the **Enable auto registration** check box.

7. Select **OK**.

   

##### Create the test virtual machines

Now, create two virtual machines so you can test your private DNS zone:

1. On the portal page upper left, select **Create a resource**, and then select **Windows Server 2016 Datacenter**.
2. Select **MyAzureResourceGroup** for the resource group.
3. Type **myVM01** - for the name of the virtual machine.
4. Select **West Central US** for the **Region**.
5. Enter a name for the administrator user name.
6. Enter a password and confirm the password.
7. For **Public inbound ports**, select **Allow selected ports**, and then select **RDP (3389)** for **Select inbound ports**.
8. Accept the other defaults for the page and then click **Next: Disks >**.
9. Accept the defaults on the **Disks** page, then click **Next: Networking >**.
10. Make sure that **myAzureVNet** is selected for the virtual network.
11. Accept the other defaults for the page, and then click **Next: Management >**.
12. For **Boot diagnostics**, select **Disable**, accept the other defaults, and then select **Review + create**.
13. Review the settings and then click **Create**.

Repeat these steps and create another virtual machine named **myVM02**.

It will take a few minutes for both virtual machines to complete.



##### Create an additional DNS record

The following example creates a record with the relative name **db** in the DNS Zone **private.contoso.com**, in resource group **MyAzureResourceGroup**. The fully qualified name of the record set is **db.private.contoso.com**. The record type is "A", with the IP address of **myVM01**.

1. Open the **MyAzureResourceGroup** resource group and select the **private.contoso.com** private zone.
2. Select **+ Record set**.
3. For **Name**, type **db**.
4. For **IP Address**, type the IP address you see for **myVM01**. This should be auto registered when the virtual machine started.
5. Select **OK**.

![Screenshot of creating dns record.](images/azure_documentation.md)



##### Test the private zone

Now you can test the name resolution for your **private.contoso.com** private zone.



##### Configure VMs to allow inbound ICMP

You can use the ping command to test name resolution. So, configure the firewall on both virtual machines to allow inbound ICMP packets.

1. Connect to myVM01, and open a Windows PowerShell window with administrator privileges.

2. Run the following command:

   PowerShell

   ```powershell
   New-NetFirewallRule –DisplayName "Allow ICMPv4-In" –Protocol ICMPv4
   ```

Repeat for myVM02.



##### Ping the VMs by name

1. From the myVM02 Windows PowerShell command prompt, ping myVM01 using the automatically registered host name:

   

   ```
   ping myVM01.private.contoso.com
   ```

   You should see output that looks similar to this:

   

   ```
   PS C:\> ping myvm01.private.contoso.com
   
   Pinging myvm01.private.contoso.com [10.2.0.4] with 32 bytes of data:
   Reply from 10.2.0.4: bytes=32 time<1ms TTL=128
   Reply from 10.2.0.4: bytes=32 time=1ms TTL=128
   Reply from 10.2.0.4: bytes=32 time<1ms TTL=128
   Reply from 10.2.0.4: bytes=32 time<1ms TTL=128
   
   Ping statistics for 10.2.0.4:
       Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
   Approximate round trip times in milli-seconds:
       Minimum = 0ms, Maximum = 1ms, Average = 0ms
   PS C:\>
   ```

2. Now ping the

    

   db

    

   name you created previously:

   

   ```
   ping db.private.contoso.com
   ```

   You should see output that looks similar to this:

   

   ```
   PS C:\> ping db.private.contoso.com
   
   Pinging db.private.contoso.com [10.2.0.4] with 32 bytes of data:
   Reply from 10.2.0.4: bytes=32 time<1ms TTL=128
   Reply from 10.2.0.4: bytes=32 time<1ms TTL=128
   Reply from 10.2.0.4: bytes=32 time<1ms TTL=128
   Reply from 10.2.0.4: bytes=32 time<1ms TTL=128
   
   Ping statistics for 10.2.0.4:
       Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
   Approximate round trip times in milli-seconds:
       Minimum = 0ms, Maximum = 0ms, Average = 0ms
   PS C:\>
   ```



#### Create Public DNS Zone

1. Sign in to the [Azure portal](https://portal.azure.com/).
2. On the top left-hand side of the screen, select **Create a resource** and search for **DNS zone**. Then select **Create**.

![Screenshot of create a resource search for DNS zone.](images/search-dns-zone.png)



### Network Security Group

- You can use an Azure network security group to filter network traffic between Azure resources in an Azure virtual network. 
- A network security group contains [security rules](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview#security-rules) that allow or deny inbound network traffic to, or outbound network traffic from, several types of Azure resources. 
- For each rule, you can specify source and destination, port, and protocol.

#### Application security groups

- Application security groups enable you to configure network security as a natural extension of an application's structure, allowing you to group virtual machines and define network security policies based on those groups. 
- You can reuse your security policy at scale without manual maintenance of explicit IP addresses. 
- The platform handles the complexity of explicit IP addresses and multiple rule sets, allowing you to focus on your business logic. 

#### Hands-on Practice

- https://learn.microsoft.com/en-us/azure/virtual-network/tutorial-filter-network-traffic
- https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator/blob/master/Instructions/Labs/LAB_04-Implement_Virtual_Networking.md

- Peering+and+NSG+labs.pdf

### Load Balancing

- *Load balancing* refers to efficiently distributing incoming network traffic across a group of backend servers or resources.

- Azure Load Balancer operates at layer 4 of the Open Systems Interconnection (OSI) model. It's the single point of contact for clients. Load balancer distributes inbound flows that arrive at the load balancer's front end to backend pool instances. These flows are according to configured load-balancing rules and health probes. The backend pool instances can be Azure Virtual Machines or instances in a Virtual Machine Scale Set.

- A **[public load balancer](https://learn.microsoft.com/en-us/azure/load-balancer/components#frontend-ip-configurations)** can provide outbound connections for virtual machines (VMs) inside your virtual network. These connections are accomplished by translating their private IP addresses to public IP addresses. Public Load Balancers are used to load balance internet traffic to your VMs.

- An **[internal (or private) load balancer](https://learn.microsoft.com/en-us/azure/load-balancer/components#frontend-ip-configurations)** is used where private IPs are needed at the frontend only. Internal load balancers are used to load balance traffic inside a virtual network. A load balancer frontend can be accessed from an on-premises network in a hybrid scenario.

![Diagram depicts public and internal load balancers directing traffic to web and business tiers.](images/load-balancer.png)

*Figure: Balancing multi-tier applications by using both public and internal Load Balancer*

#### Azure load-balancing services

- [Azure Front Door](https://learn.microsoft.com/en-us/azure/frontdoor/front-door-overview) is an application delivery network that provides global load balancing and site acceleration service for web applications. It offers Layer 7 capabilities for your application like SSL offload, path-based routing, fast failover, and caching to improve performance and high availability of your applications.

   Note

  At this time, Azure Front Door doesn't support Web Sockets.

- [Traffic Manager](https://learn.microsoft.com/en-us/azure/traffic-manager/traffic-manager-overview) is a DNS-based traffic load balancer that enables you to distribute traffic optimally to services across global Azure regions, while providing high availability and responsiveness. Because Traffic Manager is a DNS-based load-balancing service, it load balances only at the domain level. For that reason, it can't fail over as quickly as Azure Front Door, because of common challenges around DNS caching and systems not honoring DNS TTLs.

- [Application Gateway](https://learn.microsoft.com/en-us/azure/application-gateway/overview) provides application delivery controller as a service, offering various Layer 7 load-balancing capabilities. Use it to optimize web farm productivity by offloading CPU-intensive SSL termination to the gateway.

- [Load Balancer](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-overview) is a high-performance, ultra-low-latency Layer 4 load-balancing service (inbound and outbound) for all UDP and TCP protocols. It's built to handle millions of requests per second while ensuring your solution is highly available. Load Balancer is zone redundant, ensuring high availability across availability zones. It supports both a regional deployment topology and a [cross-region topology](https://learn.microsoft.com/en-us/azure/load-balancer/cross-region-overview).

#### Azure Load Balancer SKUs

- **Basic SKU** - only supports basic feature, free, up to 300 instances in the backend pool
- **Standard SKU** - recommended for production workloads, has SLA, NAT Gateway support, Private Link support, Availability Zone support, up to 1000 instances in the backend pool
- **Gateway SKU** - not covered on the exam

| Standard Load Balancer                                       | Basic Load Balancer                                          |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- | ------------------------------------------------------------ |
| Scenario                                                     | Equipped for load-balancing network layer traffic when high performance and ultra-low latency is needed. Routes traffic within and across regions, and to availability zones for high resiliency. | Equipped for small-scale applications that don't need high availability or redundancy. Not compatible with availability zones. |
| Backend type                                                 | IP based, NIC based                                          | NIC based                                                    |
| Protocol                                                     | TCP, UDP                                                     | TCP, UDP                                                     |
| Backend pool endpoints                                       | Any virtual machines or virtual machine scale sets in a single virtual network | Virtual machines in a single availability set or virtual machine scale set |
| [Health probes](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-custom-probe-overview#probe-protocol) | TCP, HTTP, HTTPS                                             | TCP, HTTP                                                    |
| [Health probe down behavior](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-custom-probe-overview#probe-down-behavior) | TCP connections stay alive on an instance probe down **and** on all probes down. | TCP connections stay alive on an instance probe down. All TCP connections end when all probes are down. |
| Availability Zones                                           | Zone-redundant and zonal frontends for inbound and outbound traffic | Not available                                                |
| Diagnostics                                                  | [Azure Monitor multi-dimensional metrics](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-standard-diagnostics) | Not supported                                                |
| HA Ports                                                     | [Available for Internal Load Balancer](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-ha-ports-overview) | Not available                                                |
| Secure by default                                            | Closed to inbound flows unless allowed by a network security group. Internal traffic from the virtual network to the internal load balancer is allowed. | Open by default. Network security group optional.            |
| Outbound Rules                                               | [Declarative outbound NAT configuration](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-outbound-connections#outboundrules) | Not available                                                |
| TCP Reset on Idle                                            | [Available on any rule](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-tcp-reset) | Not available                                                |
| [Multiple front ends](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-multivip-overview) | Inbound and [outbound](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-outbound-connections) | Inbound only                                                 |
| Management Operations                                        | Most operations < 30 seconds                                 | 60-90+ seconds typical                                       |
| SLA                                                          | [99.99%](https://azure.microsoft.com/support/legal/sla/load-balancer/v1_0/) | Not available                                                |
| Global VNet Peering Support                                  | Standard Internal Load Balancer is supported via Global VNet Peering | Not supported                                                |
| [NAT Gateway Support](https://learn.microsoft.com/en-us/azure/virtual-network/nat-gateway/nat-overview) | Both Standard Internal Load Balancer and Standard Public Load Balancer are supported via Nat Gateway | Not supported                                                |
| [Private Link Support](https://learn.microsoft.com/en-us/azure/private-link/private-link-overview) | Standard Internal Load Balancer is supported via Private Link | Not supported                                                |
| [Global tier](https://learn.microsoft.com/en-us/azure/load-balancer/cross-region-overview) | Standard Load Balancer supports the Global tier for Public Load Balancers enabling cross-region load balancing | Not supported                                                |

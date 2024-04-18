# Terraform on Azure

## Azure Provider

**Azurerm** 

https://registry.terraform.io/providers/hashicorp/azurerm/latest

main.tf

```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}
```

###### Rewrites all Terraform configuration files to a canonical format.

```
$ terraform fmt      
```

###### Validate the configuration files in a directory

```
$ terraform validate 
```

### Create resource group

main.tf

```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "eastus"
}
```

```
$  terraform apply 

Terraform used the selected providers to generate the following execution plan. Resource
actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.example will be created
  + resource "azurerm_resource_group" "example" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "example"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

azurerm_resource_group.example: Creating...
azurerm_resource_group.example: Creation complete after 6s [id=/subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/example]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```



### Variables

**main.tf**

```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

variable "azregion" {
  type = string
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = var.azregion
}
```

```
$ terraform apply -var="azregion=eastus"
```

**terraform.tfvars**

```
azregion = "westus"
```

```
$ terraform apply -var="azregion=eastus"
```



## azurerm_storage_account

main.tf

```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

variable "azregion" {
  type = string
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = var.azregion
}

resource "azurerm_storage_account" "mystorage" {
  name                     = "owenteststorage001"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
```



## Terraform Apply autoapprove

 Skip interactive approval of plan before applying.

```
$ terraform apply -auto-approve
```



## Locals

main.tf

```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

variable "azregion" {
  type = string
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = var.azregion
}

locals {
  name = "Sherwin Adriano"
}

resource "azurerm_storage_account" "mystorage" {
  name                     = "owenteststorage001"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
    owner = "Mr. ${local.name}"
  }
}
```



## Outputs

main.tf

```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

variable "azregion" {
  type = string
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = var.azregion
}

locals {
  name = "Sherwin Adriano"
}

resource "azurerm_storage_account" "mystorage" {
  name                     = "owenteststorage001"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
    owner = "Mr. ${local.name}"
  }
}

output "primarykey" {
    value = azurerm_storage_account.mystorage.primary_access_key
    sensitive = true
}
```

Update the state file of your infrastructure with metadata that matches the physical resources they are tracking.

```
$ terraform refresh
azurerm_resource_group.example: Refreshing state... [id=/subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/example]
azurerm_storage_account.mystorage: Refreshing state... [id=/subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/example/providers/Microsoft.Storage/storageAccounts/owenteststorage001]

Outputs:

primarykey = <sensitive>
```

Reads an output variable from a Terraform state file and prints the value.

```
$ terraform output 
primarykey = <sensitive>
```

main.tf

```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

variable "azregion" {
  type = string
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = var.azregion
}

locals {
  name = "Sherwin Adriano"
}

resource "azurerm_storage_account" "mystorage" {
  name                     = "owenteststorage001"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
    owner = "Mr. ${local.name}"
  }
}

output "primarykey" {
    value = azurerm_storage_account.mystorage.primary_access_key
    sensitive = true
}
```



```
$ terraform refresh    
azurerm_resource_group.example: Refreshing state... [id=/subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/example]
azurerm_storage_account.mystorage: Refreshing state... [id=/subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/example/providers/Microsoft.Storage/storageAccounts/owenteststorage001]

Outputs:

primaryblobhost = "owenteststorage001.blob.core.windows.net"
primarykey = <sensitive>
```



terraform.tfstate

```
{
  "version": 4,
  "terraform_version": "1.8.0",
  "serial": 28,
  "lineage": "4d24446e-dcc9-1389-275f-42d19650b3f6",
  "outputs": {
    "primaryblobhost": {
      "value": "owenteststorage001.blob.core.windows.net",
      "type": "string"
    },
    "primarykey": {
      "value": "VkSeR8ZLUhfbpcImGD39HpNjrxzfW4hE9SzaiSefw2P7Nh7Jupe9ERt6BFaCyUl1XyKTjA/Ufghv+ASte0xWgg==",
      "type": "string",
      "sensitive": true
    }
  },
```



## Using multiple files in Terraform

main.tf

```
resource "azurerm_resource_group" "example" {
  name     = "example"
  location = var.azregion
}

resource "azurerm_storage_account" "mystorage" {
  name                     = "owenteststorage001"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
    owner = "Mr. ${local.name}"
  }
}
```

provider.tf

```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}
```

variables.tf

```
variable "azregion" {
  type = string
}
```

Locals.tf

```
locals {
  name = "Sherwin Adriano"
}
```

Outputs.tf

```
output "primarykey" {
  value = azurerm_storage_account.mystorage[0].primary_access_key
  sensitive = true
}

output "primaryblobhost" {
  value = azurerm_storage_account.mystorage[1].primary_blob_host  
}
```

**Check if there are no chages** 

```
terraform plan
azurerm_resource_group.example: Refreshing state... [id=/subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/example]
azurerm_storage_account.mystorage: Refreshing state... [id=/subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/example/providers/Microsoft.Storage/storageAccounts/owenteststorage001]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration
and found no differences, so no changes are needed.
```

## Destroy Terraform-managed infrastructure.

```
$ terraform destroy
```



## Create an Azure VM with Terraform

main.tf

```
resource "azurerm_resource_group" "example-rg" {
  name     = "example-rg"
  location = "eastus"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example-rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example-rg.name
  location            = azurerm_resource_group.example-rg .location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
```

provisioner.tf

```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}
```

```
$ terraform init

$ terraform plan

$ terraform apply
```



## Local Exec Provisioner

-  The local-exec provisioner invokes a local executable after a resource  is created. This invokes a process on the machine running Terraform, not on the resource.

main.tf

```
resource "azurerm_resource_group" "example-rg" {
  name     = "example-rg"
  location = "eastus"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example-rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example-rg.name
  location            = azurerm_resource_group.example-rg .location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip_address} >> private_ip.txt"
  }
}
```

```
$ terraform destroy

@ terraform apply -auto-approve
...
azurerm_windows_virtual_machine.example: Provisioning with 'local-exec'...
azurerm_windows_virtual_machine.example (local-exec): Executing: ["/bin/sh" "-c" "echo 10.0.2.4 >> private_ip.txt"]
azurerm_windows_virtual_machine.example: Creation complete after 1m16s [id=/subscriptions/2120c628-c057-48b9-ace5-14fddbf72365/resourceGroups/example-rg/providers/Microsoft.Compute/virtualMachines/example-machine]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.
```



## Remote Exec Provisioner 

- The remote-exec provisioner invokes a script on a remote resource after  it is created. This can be used to run a configuration management tool,  bootstrap into a cluster, etc.

**Azurerm_linux_virtual_machine with public IP**

main.tf

```
# Deploy Azure Linux Virtual Machine
resource "azurerm_resource_group" "example-rg" {
  name     = "example-rg"
  location = "eastus"
}
# Create virtual network
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name
}
# Create subnet
resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example-rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "public_ip" {
  name                = "vm_public_ip"
  resource_group_name = azurerm_resource_group.example-rg.name
  location            = azurerm_resource_group.example-rg.location
  allocation_method   = "Dynamic"
}
# Create network interface
resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}
# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
  name                = "ssh_nsg"
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name

  security_rule {
    name                       = "allow_ssh_sg"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example-rg.name
  location            = azurerm_resource_group.example-rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo apt update -y",
      "echo linuxbox updated >> linuxbox-status.txt"
     ]
    connection {
      host = self.public_ip_address
      type = "ssh"
      user = azurerm_linux_virtual_machine.example.admin_username
      private_key = file("~/.ssh/id_rsa")
    }
  }
}
```

## File Provisioner

- The file provisioner is used to copy files or directories from the  machine executing Terraform to the newly created resource. The file  provisioner supports both ssh and winrm type connections.

main.tf

```
# Deploy Azure Linux Virtual Machine
resource "azurerm_resource_group" "example-rg" {
  name     = "example-rg"
  location = "eastus"
}
# Create virtual network
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name
}
# Create subnet
resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example-rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "public_ip" {
  name                = "vm_public_ip"
  resource_group_name = azurerm_resource_group.example-rg.name
  location            = azurerm_resource_group.example-rg.location
  allocation_method   = "Dynamic"
}
# Create network interface
resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}
# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
  name                = "ssh_nsg"
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name

  security_rule {
    name                       = "allow_ssh_sg"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example-rg.name
  location            = azurerm_resource_group.example-rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  provisioner "file" {
    source = "sherwin-src.txt"
    destination = "sherwin-des.txt"
    connection {
      host = self.public_ip_address
      type = "ssh"
      user = azurerm_linux_virtual_machine.example.admin_username
      private_key = file("~/.ssh/id_rsa")
    }
  }
}
```



## Using Null Resources

-  is similar to a standard resource. It adheres to the resource lifecycle model and serves as a placeholder for executing arbitrary actions  within Terraform configurations without actually provisioning any  physical resources. However, it does not perform any further actions  beyond initialization

- The null_resource is useful for  executing standard operations that do not require provisioning an actual resource. It can be declared as a simple resource block and used in [Terraform modules](https://spacelift.io/blog/what-are-terraform-modules-and-how-do-they-work) and other resources that depend on null resources. 

```
$ az vm get-instance-view --name example-machine --resource-group example-rg --query 'instanceView.statuses[1]' --output table
Code                Level    DisplayStatus
------------------  -------  ---------------
PowerState/running  Info     VM running
```

main.tf

```
# Deploy Azure Linux Virtual Machine
resource "azurerm_resource_group" "example-rg" {
  name     = "example-rg"
  location = "eastus"
}
# Create virtual network
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name
}
# Create subnet
resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example-rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "public_ip" {
  name                = "vm_public_ip"
  resource_group_name = azurerm_resource_group.example-rg.name
  location            = azurerm_resource_group.example-rg.location
  allocation_method   = "Dynamic"
}
# Create network interface
resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}
# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
  name                = "ssh_nsg"
  location            = azurerm_resource_group.example-rg.location
  resource_group_name = azurerm_resource_group.example-rg.name

  security_rule {
    name                       = "allow_ssh_sg"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example-rg.name
  location            = azurerm_resource_group.example-rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  }

  resource "null_resource" "status" {
    provisioner "local-exec" {
      command = "az vm get-instance-view --name example-machine --resource-group example-rg --query 'instanceView.statuses[1]' --output table"
    }
    depends_on = [ 
      azurerm_linux_virtual_machine.example 
    ]
  }
```

```
$ terraform init -upgrade
```

```
$ terraform apply -replace=azurerm_linux_virtual_machine.example
...
null_resource.status: Creating...
null_resource.status: Provisioning with 'local-exec'...
null_resource.status (local-exec): Executing: ["/bin/sh" "-c" "az vm get-instance-view --name example-machine --resource-group example-rg --query 'instanceView.statuses[1]' --output table"]
null_resource.status (local-exec): Code                Level    DisplayStatus
null_resource.status (local-exec): ------------------  -------  ---------------
null_resource.status (local-exec): PowerState/running  Info     VM running
null_resource.status: Creation complete after 2s [id=3036896430481140254]

Apply complete! Resources: 2 added, 0 changed, 1 destroyed.
```



## Data Source: azurerm_resource_group

- Use this data source to access information about an existing Resource Group.

main.tf

```
data "azurerm_resource_group" "NewRG" {
  name = "example-rg"
}
resource "azurerm_storage_account" "mystorage" {
  name                     = "owenteststorage001"
  resource_group_name      = data.azurerm_resource_group.NewRG.name
  location                 = data.azurerm_resource_group.NewRG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  tags = {
    environment = "staging"
    owner = "Sherwin"
  }
}
```



# HCL Language

## Using Count

main.tf

```
resource "azurerm_resource_group" "example" {
  name     = "example"
  location = var.azregion
}

resource "azurerm_storage_account" "mystorage" {
  count = 2
  name                     = "owenteststorage00${count.index}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
    owner = "Mr. ${local.name}"
  }
}
```

Outputs.tf

```
output "primarykey" {
  value = azurerm_storage_account.mystorage[0].primary_access_key
  sensitive = true
}

output "primaryblobhost" {
  value = azurerm_storage_account.mystorage[1].primary_blob_host  
}
```



![image-20240418153556312](images/image-20240418153556312.png)

## Using ForEach

Main.tf

```
resource "azurerm_resource_group" "example" {
  name     = "example"
  location = var.azregion
}

resource "azurerm_storage_account" "mystorage" {
  for_each = {
    lrs = "LRS"
    grs = "GRS"
  }
  name                     = "owenteststorage${each.key}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = each.value

  tags = {
    environment = "staging"
    owner = "Mr. ${local.name}"
  }  
}

```

Outputs.tf

```
output "primarykey" {
  value = values(azurerm_storage_account.mystorage)[0].primary_access_key
  sensitive = true
}

output "primaryblobhost" {
  value = values(azurerm_storage_account.mystorage)[1].primary_blob_host  
}
```

![image-20240418160732087](images/image-20240418160732087.png)

## Terraform Lifecycle

https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle


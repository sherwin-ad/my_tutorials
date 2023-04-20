## Terraform

* is a tool for building, changing, and versioing infrastructure safely and efficiently.
* can manage existing and popular service providers as well as custom in-house solutions.

Sample Template create  AWS instance

```
resource "aws_instance" "my-web" {
  ami = "ami-9ad37hhf2"
  instance_type = "t2.micro"
}
```



### Terraform

* Infrastructure as a code
* Automation of Infrastructure
* Maintain the state of infrastructure (state mgmt)
* Maintain infrastructure change history using version control like git



* Ansible, chef, puppet have focusing automation installation and configuration of software
  * Maintain system in compliance in certain mode
* Terraform can automate any cloud provider
  * AWS, Azure, GCP, Digital Ocean

### Terraform Installation

```
$ mkdir terraform
$ cd terraform/
$ wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
--2020-06-02 11:52:44--  https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
Resolving releases.hashicorp.com (releases.hashicorp.com)... 151.101.193.183, 151.101.129.183, 151.101.65.183, ...
Connecting to releases.hashicorp.com (releases.hashicorp.com)|151.101.193.183|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 16838433 (16M) [application/zip]
Saving to: ‘terraform_0.12.26_linux_amd64.zip’
terraform_0.12.26_l 100%[===================>]  16.06M  2.36MB/s    in 4.9s    
2020-06-02 11:52:49 (3.26 MB/s) - ‘terraform_0.12.26_linux_amd64.zip’ saved [16838433/16838433]

$ unzip terraform_0.12.26_linux_amd64.zip 
Archive:  terraform_0.12.26_linux_amd64.zip
  inflating: terraform               

$ export PATH=/home/sherwinowen/terraform/:$PATH

# Check version
$ terraform -version
Terraform v0.12.26

```



Creating EC2 Instance script

aws-instance-sample.tf

```
provider "aws" {
	region		= "ap-southeast-1"
	access_key	= "AKIAZNBIMVGNWZPT7T4R"
	secret_key	= "iaydBYsUqquhF8iHav6ix8MM29/Szb1Cg0Rhb4bi"
	version	= "~> 2.0"
}

resource "aws_instance" "web1" {
	ami				= "ami-0f7719e8b7ba25c61"
	instance_type	= "t2.micro"
```

Run the following terraform commands (where the script located)

```
sherwinowen@owenbox:~/Documents/my_tutorials/terraform/script$ terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.64.0...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```



```
sherwinowen@owenbox:~/Documents/my_tutorials/terraform/script$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.web1 will be created
  + resource "aws_instance" "web1" {
      + ami                          = "ami-0f7719e8b7ba25c61"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = (known after apply)
      + network_interface_id         = (known after apply)
      + outpost_arn                  = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```



```
sherwinowen@owenbox:~/Documents/my_tutorials/terraform/script$ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.web1 will be created
  + resource "aws_instance" "web1" {
      + ami                          = "ami-0f7719e8b7ba25c61"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = (known after apply)
      + network_interface_id         = (known after apply)
      + outpost_arn                  = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.web1: Creating...
aws_instance.web1: Still creating... [10s elapsed]
aws_instance.web1: Still creating... [20s elapsed]
aws_instance.web1: Creation complete after 24s [id=i-048c594248907b6cc]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```



```
sherwinowen@owenbox:~/Documents/my_tutorials/terraform/script$ terraform destroy
aws_instance.web1: Refreshing state... [id=i-048c594248907b6cc]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_instance.web1 will be destroyed
  - resource "aws_instance" "web1" {
      - ami                          = "ami-0f7719e8b7ba25c61" -> null
      - arn                          = "arn:aws:ec2:ap-southeast-1:646477293979:instance/i-048c594248907b6cc" -> null
      - associate_public_ip_address  = true -> null
      - availability_zone            = "ap-southeast-1a" -> null
      - cpu_core_count               = 1 -> null
      - cpu_threads_per_core         = 1 -> null
      - disable_api_termination      = false -> null
      - ebs_optimized                = false -> null
      - get_password_data            = false -> null
      - hibernation                  = false -> null
      - id                           = "i-048c594248907b6cc" -> null
      - instance_state               = "running" -> null
      - instance_type                = "t2.micro" -> null
      - ipv6_address_count           = 0 -> null
      - ipv6_addresses               = [] -> null
      - monitoring                   = false -> null
      - primary_network_interface_id = "eni-0298f5f3a1569e85c" -> null
      - private_dns                  = "ip-172-31-47-163.ap-southeast-1.compute.internal" -> null
      - private_ip                   = "172.31.47.163" -> null
      - public_dns                   = "ec2-13-250-65-174.ap-southeast-1.compute.amazonaws.com" -> null
      - public_ip                    = "13.250.65.174" -> null
      - security_groups              = [
          - "default",
        ] -> null
      - source_dest_check            = true -> null
      - subnet_id                    = "subnet-b007f6f8" -> null
      - tags                         = {} -> null
      - tenancy                      = "default" -> null
      - volume_tags                  = {} -> null
      - vpc_security_group_ids       = [
          - "sg-93e667e0",
        ] -> null

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "optional" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/sda1" -> null
          - encrypted             = false -> null
          - iops                  = 100 -> null
          - volume_id             = "vol-05109fdf48ed97507" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp2" -> null
        }
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.web1: Destroying... [id=i-048c594248907b6cc]
aws_instance.web1: Still destroying... [id=i-048c594248907b6cc, 10s elapsed]
aws_instance.web1: Still destroying... [id=i-048c594248907b6cc, 20s elapsed]
aws_instance.web1: Still destroying... [id=i-048c594248907b6cc, 30s elapsed]
aws_instance.web1: Destruction complete after 31s

Destroy complete! Resources: 1 destroyed.
```



### Terraform Basic Commands

#### Terraform plan

* The plan step check con guration to execute and write a plan to
  apply to target infrastructure provider.

* "+"  indicates a resource will be created
* "-" indocates a resource will be destroyed
* "~" indicates a resource will be update in plan
* "-/+" indicates a resource will be destroyed and recreated 

```
$ terraform plan

$ terraform plan -out plan.out
```



#### Terraform apply

* Now you have the desired state so you can execute the plan.

```
$ terraform apply

$ terraform apply plan.out
```



#### Terraform destroy

* Delete all the resources
* Does not touch infrastructure not managed by terraform

```
$ terraform destroy
```


# Terraform Basics Training Course

## LAB: Hashicorp Configuration Language BASICS

1. Welcome to the very first `Terraform Lab`!

   In this lab, we will learn how to get started with HashiCorp Configuration Language that is used by Terraform.

   OK

2. Navigate to the directory `/root/terraform-projects/HCL`. There is a file present in this location.
   What is the file extension used by this file?

   List the file by using the `ls` command.

   - **.tf**
   - .file
   - main
   - .dir

   ```
   iac-server $ cd /root/terraform-projects/HCL/
   
   iac-server $ ls
   main.tf
   ```

   

3. That's right! That is a `TF` file and is used for writing configuration files in Terraform using HCL.

   OK

4. What is the `resource type` specified in this file?

   From the terminal, inspect it using tools like `cat` or text editors such as `VI` .
   Alternatively, you can open this file on `VS Code`. So navigate to this directory and inspect the file.

   - **local_file**
   - file_content
   - games
   - aws_ec2

   main.tf

   ```tf
   resource "local_file" "games" {
     file     = "/root/favorite-games"
     content  = "FIFA 21"
   }
   ```

5. What is the resource name used for the `local_file` resource in this configuration file?

   - file
   - **games**
   - local
   - favorite-games
   - local_file

   main.tf

   ```tf
   resource "local_file" "games" {
     file     = "/root/favorite-games"
     content  = "FIFA 21"
   }
   ```

6. What is the name of the provider for which we are creating this resource?

   - local_file
   - game
   - file
   - **local**

7. Which one of the below is not an example of an argument used within the resource block?

   - **resource_type = "local_file"**
   - filename = "/root/favorite-games"
   - content = "FIFA 21"

   main.tf

   ```tf
   resource "local_file" "games" {
     file     = "/root/favorite-games"
     content  = "FIFA 21"
   }
   ```

8. If you run a `terraform plan` now? Would it work?

   - **NO**
   - YES

   ```
   $ terraform plan
   
   Error: Could not load plugin
   
   
   Plugin reinitialization required. Please run "terraform init".
   
   Plugins are external binaries that Terraform uses to access and manipulate
   resources. The configuration provided requires plugins which can't be located,
   don't satisfy the version constraints, or are otherwise incompatible.
   
   Terraform automatically discovers provider requirements from your
   configuration, including providers used in child modules. To see the
   requirements and constraints, run "terraform providers".
   
   Failed to instantiate provider "registry.terraform.io/hashicorp/local" to
   obtain schema: unknown provider "registry.terraform.io/hashicorp/local"
   ```

9. Run a `terraform init` inside the configuration directory: `/root/terraform-projects/HCL`

   Check

   - terraform init run successfully?

   ```
   $ terraform init
   
   Initializing the backend...
   
   Initializing provider plugins...
   - Finding latest version of hashicorp/local...
   - Installing hashicorp/local v2.4.0...
   - Installed hashicorp/local v2.4.0 (self-signed, key ID 34365D9472D7468F)
   
   Partner and community providers are signed by their developers.
   If you'd like to know more about provider signing, you can read about it here:
   https://www.terraform.io/docs/plugins/signing.html
   
   The following providers do not have any version constraints in configuration,
   so the latest version was installed.
   
   To prevent automatic upgrades to new major versions that may contain breaking
   changes, we recommend adding version constraints in a required_providers block
   in your configuration, with the constraint strings suggested below.
   
   * hashicorp/local: version = "~> 2.4.0"
   
   Terraform has been successfully initialized!
   
   You may now begin working with Terraform. Try running "terraform plan" to see
   any changes that are required for your infrastructure. All Terraform commands
   should now work.
   
   If you ever set or change modules or backend configuration for Terraform,
   rerun this command to reinitialize your working directory. If you forget, other
   commands will detect it and remind you to do so if necessary.
   ```

10. What was the `version` of the local provider plugin that was downloaded?

   - 0.13
   - 1.0.0
   - 2.01
   - 1.00
   - **2.4.0**

11. Now, try to run a `terraform plan`.

    Did it print an execution plan as expected?

    - YES
    - **NO**

    ```
    $ terraform plan
    
    Error: Missing required argument
    
      on main.tf line 1, in resource "local_file" "games":
       1: resource "local_file" "games" {
    
    The argument "filename" is required, but no definition was found.
    
    
    Error: Unsupported argument
    
      on main.tf line 2, in resource "local_file" "games":
       2:   file     = "/root/favorite-games"
    
    An argument named "file" is not expected here.
    ```

12. Why did the command fail?

    Inspect the error produced when the command was run.

    If unsure, refer to the documentation. The documentation tab is available at the top right.

    - Incorrect Resource Type
    - Incorrect Resource Name
    - Provider not downloaded
    - **Invalid Argument**

13. Which of the following is not a valid argument for the `local_file` resource?

    If unsure, refer to the documentation.

    - sensitive_content
    - filename
    - **file**
    - file_permission
    - content

14. Fix the argument in the configuration file and then run a `terraform plan` followed by `terraform apply` to create the `local_file` resource called `games`.

    Check

    - Resource created?

    Change the argument name from `file` to `filename` and then run `terraform plan` --> `terraform apply`

    ```
    resource "local_file" "games" {
      filename  = "/root/favorite-games"
      content  = "FIFA 21"
    }
    ```

    ```
    $ terraform plan
    Refreshing Terraform state in-memory prior to plan...
    The refreshed state will be used to calculate this plan, but will not be
    persisted to local or remote state storage.
    
    
    ------------------------------------------------------------------------
    
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      + create
    
    Terraform will perform the following actions:
    
      # local_file.games will be created
      + resource "local_file" "games" {
          + content              = "FIFA 21"
          + content_base64sha256 = (known after apply)
          + content_base64sha512 = (known after apply)
          + content_md5          = (known after apply)
          + content_sha1         = (known after apply)
          + content_sha256       = (known after apply)
          + content_sha512       = (known after apply)
          + directory_permission = "0777"
          + file_permission      = "0777"
          + filename             = "/root/favorite-games"
          + id                   = (known after apply)
        }
    
    Plan: 1 to add, 0 to change, 0 to destroy.
    
    ------------------------------------------------------------------------
    
    Note: You didn't specify an "-out" parameter to save this plan, so Terraform
    can't guarantee that exactly these actions will be performed if
    "terraform apply" is subsequently run.
    ```

15. We have now created our very first resource using Terraform! Next, let's work on updating the resource.

    If you look at the output produced by the `terraform plan` and `terraform apply` commands closely, we can see that the file content is printed on the screen.

    Since we do not want this to happen, we have updated the resource type.

    What is the resource type that we have updated?

    - local_file
    - **local_sensitive_file**
    - local_sensitive_content
    - local_hide_content

    main.tf

    ```
    resource "local_sensitive_file" "games" {
      filename     = "/root/favorite-games"
      content  = "FIFA 21"
      sensitive_content = "FIFA 21"
    }
    ```

16. That's right, we have made use of the `local_sensitive_file` resource type to mask the contents of the file from the execution plan.

    However, something is wrong. If we run `terraform plan` or `terraform apply` now we see an error!

    Identify and fix the issue.
    Remember, we don't want the content of the file to show up in the execution plan at all.

    Check

    - Issues fixed and the resource re-created?

    

    Delete the line containing the argument called `sensitive_content` and then run `terraform plan` and then `terraform apply` to re-create the file.

    ```tf
    resource "local_sensitive_file" "games" {
      filename     = "/root/favorite-games"
      content  = "FIFA 21"
    }
    ```

    ```
    $ terraform plan
    Refreshing Terraform state in-memory prior to plan...
    The refreshed state will be used to calculate this plan, but will not be
    persisted to local or remote state storage.
    
    local_file.games: Refreshing state... [id=f68b901eb16aff12e9458bdb656a7df8d3425d4c]
    
    ------------------------------------------------------------------------
    
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      + create
      - destroy
    
    Terraform will perform the following actions:
    
      # local_file.games will be destroyed
      - resource "local_file" "games" {
          - content              = "FIFA 21" -> null
          - content_base64sha256 = "0QatlfVl9H412mXNB5/Y9evwrDIxEW4ooJpmph2eoUY=" -> null
          - content_base64sha512 = "F0zLI9RS+tFB53xwISp1R3wvRQ/Sw4hsxwysWamsAk/cNyHr/X/pmmykTTCuvkRvr+3y+5c7Sc/J/ObRRX1mIg==" -> null
          - content_md5          = "44a271e06ddd134cdbeab299288422f3" -> null
          - content_sha1         = "f68b901eb16aff12e9458bdb656a7df8d3425d4c" -> null
          - content_sha256       = "d106ad95f565f47e35da65cd079fd8f5ebf0ac3231116e28a09a66a61d9ea146" -> null
          - content_sha512       = "174ccb23d452fad141e77c70212a75477c2f450fd2c3886cc70cac59a9ac024fdc3721ebfd7fe99a6ca44d30aebe446fafedf2fb973b49cfc9fce6d1457d6622" -> null
          - directory_permission = "0777" -> null
          - file_permission      = "0777" -> null
          - filename             = "/root/favorite-games" -> null
          - id                   = "f68b901eb16aff12e9458bdb656a7df8d3425d4c" -> null
        }
    
      # local_sensitive_file.games will be created
      + resource "local_sensitive_file" "games" {
          + content              = (sensitive value)
          + content_base64sha256 = (known after apply)
          + content_base64sha512 = (known after apply)
          + content_md5          = (known after apply)
          + content_sha1         = (known after apply)
          + content_sha256       = (known after apply)
          + content_sha512       = (known after apply)
          + directory_permission = "0700"
          + file_permission      = "0700"
          + filename             = "/root/favorite-games"
          + id                   = (known after apply)
        }
    
    Plan: 1 to add, 0 to change, 1 to destroy.
    
    ------------------------------------------------------------------------
    
    Note: You didn't specify an "-out" parameter to save this plan, so Terraform
    can't guarantee that exactly these actions will be performed if
    "terraform apply" is subsequently run.
    ```

    ```
    $ terraform apply
    local_file.games: Refreshing state... [id=f68b901eb16aff12e9458bdb656a7df8d3425d4c]
    
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      + create
      - destroy
    
    Terraform will perform the following actions:
    
      # local_file.games will be destroyed
      - resource "local_file" "games" {
          - content              = "FIFA 21" -> null
          - content_base64sha256 = "0QatlfVl9H412mXNB5/Y9evwrDIxEW4ooJpmph2eoUY=" -> null
          - content_base64sha512 = "F0zLI9RS+tFB53xwISp1R3wvRQ/Sw4hsxwysWamsAk/cNyHr/X/pmmykTTCuvkRvr+3y+5c7Sc/J/ObRRX1mIg==" -> null
          - content_md5          = "44a271e06ddd134cdbeab299288422f3" -> null
          - content_sha1         = "f68b901eb16aff12e9458bdb656a7df8d3425d4c" -> null
          - content_sha256       = "d106ad95f565f47e35da65cd079fd8f5ebf0ac3231116e28a09a66a61d9ea146" -> null
          - content_sha512       = "174ccb23d452fad141e77c70212a75477c2f450fd2c3886cc70cac59a9ac024fdc3721ebfd7fe99a6ca44d30aebe446fafedf2fb973b49cfc9fce6d1457d6622" -> null
          - directory_permission = "0777" -> null
          - file_permission      = "0777" -> null
          - filename             = "/root/favorite-games" -> null
          - id                   = "f68b901eb16aff12e9458bdb656a7df8d3425d4c" -> null
        }
    
      # local_sensitive_file.games will be created
      + resource "local_sensitive_file" "games" {
          + content              = (sensitive value)
          + content_base64sha256 = (known after apply)
          + content_base64sha512 = (known after apply)
          + content_md5          = (known after apply)
          + content_sha1         = (known after apply)
          + content_sha256       = (known after apply)
          + content_sha512       = (known after apply)
          + directory_permission = "0700"
          + file_permission      = "0700"
          + filename             = "/root/favorite-games"
          + id                   = (known after apply)
        }
    
    Plan: 1 to add, 0 to change, 1 to destroy.
    
    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.
    
      Enter a value: yes
    
    local_file.games: Destroying... [id=f68b901eb16aff12e9458bdb656a7df8d3425d4c]
    local_file.games: Destruction complete after 0s
    local_sensitive_file.games: Creating...
    local_sensitive_file.games: Creation complete after 0s [id=f68b901eb16aff12e9458bdb656a7df8d3425d4c]
    
    Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
    ```

17. Notice that the `content` of the file was not displayed when using `local_sensitive_file` instead of the `local_file` resource.

    Note: Refer to the documentation to see all the arguments supported by this resource.

    Also note that as Terraform follows an immutable infrastructure approach, the file was recreated although the contents are the same.

    OK

18. Finally, destroy this resource using `terraform destroy`.

    Check

    - Resource Destroyed?

    From the directory `/root/terraform-projects/HCL` run `terraform destroy` and answer `yes` when prompted.

    ```
    $ terraform destroy
    local_sensitive_file.games: Refreshing state... [id=f68b901eb16aff12e9458bdb656a7df8d3425d4c]
    
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      - destroy
    
    Terraform will perform the following actions:
    
      # local_sensitive_file.games will be destroyed
      - resource "local_sensitive_file" "games" {
          - content              = (sensitive value)
          - content_base64sha256 = "0QatlfVl9H412mXNB5/Y9evwrDIxEW4ooJpmph2eoUY=" -> null
          - content_base64sha512 = "F0zLI9RS+tFB53xwISp1R3wvRQ/Sw4hsxwysWamsAk/cNyHr/X/pmmykTTCuvkRvr+3y+5c7Sc/J/ObRRX1mIg==" -> null
          - content_md5          = "44a271e06ddd134cdbeab299288422f3" -> null
          - content_sha1         = "f68b901eb16aff12e9458bdb656a7df8d3425d4c" -> null
          - content_sha256       = "d106ad95f565f47e35da65cd079fd8f5ebf0ac3231116e28a09a66a61d9ea146" -> null
          - content_sha512       = "174ccb23d452fad141e77c70212a75477c2f450fd2c3886cc70cac59a9ac024fdc3721ebfd7fe99a6ca44d30aebe446fafedf2fb973b49cfc9fce6d1457d6622" -> null
          - directory_permission = "0700" -> null
          - file_permission      = "0700" -> null
          - filename             = "/root/favorite-games" -> null
          - id                   = "f68b901eb16aff12e9458bdb656a7df8d3425d4c" -> null
        }
    
    Plan: 0 to add, 0 to change, 1 to destroy.
    
    Do you really want to destroy all resources?
      Terraform will destroy all your managed infrastructure, as shown above.
      There is no undo. Only 'yes' will be accepted to confirm.
    
      Enter a value: yes
    
    local_sensitive_file.games: Destroying... [id=f68b901eb16aff12e9458bdb656a7df8d3425d4c]
    local_sensitive_file.games: Destruction complete after 0s
    
    Destroy complete! Resources: 1 destroyed.
    ```

# Terraform Basics

## LAB: TERRAFORM PROVIDERS

1. We have a new configuration directory located at the path `/root/terraform-projects/things-to-do`. Inspect this directory and find out the number of providers initialized within this directory.

   Do not run `terraform init` yet!

   - 2
   - 4
   - 3
   - **0**
   - 5

   Go to the `.terraform/plugins` directory and count the number of provider plugins installed. If the directory does not exist, there are no plugins downloaded yet.

2. How about now? How many provider plugins are installed in this configuration directory?

   -  3
   - 2
   - **1**
   - 0

3. How many configuration files exist in the directory: `/root/terraform-projects/things-to-do` ?

   - 0
   - 2
   - 3
   - **1**

   ```
   iac-server $ pwd
   /root/terraform-projects/things-to-do
   
   iac-server $ ls
   main.tf
   ```

4. How many resources are configured in this configuration directory?

   Count all the resource blocks used.

   - **2**
   - 1
   - 3
   - 0

   main.tf

   ```
   resource "local_file" "things-to-do" {
     filename     = "/root/things-to-do.txt"
     content  = "Clean my room before Christmas\nComplete the CKA Certification!"
   }
   resource "local_file" "more-things-to-do" {
     filename     = "/root/more-things-to-do.txt"
     content  = "Learn how to play Astronomia on the guitar!"
   }
   ```

5. What is the version of the plugin for the local provider that has been downloaded for this configuration?

   - **2.4.0**
   - 1.4.0
   - 1.3.0
   - 1.0.0

   Run `terraform init` and inspect the output or check the version of the plugin downloaded inside the `.terraform/plugins` directory.

   ```
   $ terraform init
   
   Initializing the backend...
   
   Initializing provider plugins...
   - Using previously-installed hashicorp/local v2.4.0
   
   The following providers do not have any version constraints in configuration,
   so the latest version was installed.
   
   To prevent automatic upgrades to new major versions that may contain breaking
   changes, we recommend adding version constraints in a required_providers block
   in your configuration, with the constraint strings suggested below.
   
   * hashicorp/local: version = "~> 2.4.0"
   
   Terraform has been successfully initialized!
   
   You may now begin working with Terraform. Try running "terraform plan" to see
   any changes that are required for your infrastructure. All Terraform commands
   should now work.
   
   If you ever set or change modules or backend configuration for Terraform,
   rerun this command to reinitialize your working directory. If you forget, other
   commands will detect it and remind you to do so if necessary.
   ```

6. Now, go ahead and create these resources using terraform!

   Once done, the two files defined inside the resource blocks should be created with the correct file names and content.

   Check

   - Resources created?

   Run `terraform plan (optional)` and then `terraform apply` in the directory `/root/terraform-projects/things-to-do`.

   ```
   $ terraform plan
   Refreshing Terraform state in-memory prior to plan...
   The refreshed state will be used to calculate this plan, but will not be
   persisted to local or remote state storage.
   
   
   ------------------------------------------------------------------------
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
     + create
   
   Terraform will perform the following actions:
   
     # local_file.more-things-to-do will be created
     + resource "local_file" "more-things-to-do" {
         + content              = "Learn how to play Astronomia on the guitar!"
         + content_base64sha256 = (known after apply)
         + content_base64sha512 = (known after apply)
         + content_md5          = (known after apply)
         + content_sha1         = (known after apply)
         + content_sha256       = (known after apply)
         + content_sha512       = (known after apply)
         + directory_permission = "0777"
         + file_permission      = "0777"
         + filename             = "/root/more-things-to-do.txt"
         + id                   = (known after apply)
       }
   
     # local_file.things-to-do will be created
     + resource "local_file" "things-to-do" {
         + content              = <<~EOT
               Clean my room before Christmas
               Complete the CKA Certification!
           EOT
         + content_base64sha256 = (known after apply)
         + content_base64sha512 = (known after apply)
         + content_md5          = (known after apply)
         + content_sha1         = (known after apply)
         + content_sha256       = (known after apply)
         + content_sha512       = (known after apply)
         + directory_permission = "0777"
         + file_permission      = "0777"
         + filename             = "/root/things-to-do.txt"
         + id                   = (known after apply)
       }
   
   Plan: 2 to add, 0 to change, 0 to destroy.
   
   ------------------------------------------------------------------------
   
   Note: You didn't specify an "-out" parameter to save this plan, so Terraform
   can't guarantee that exactly these actions will be performed if
   "terraform apply" is subsequently run.
   ```

   ```
   $ terraform apply
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
     + create
   
   Terraform will perform the following actions:
   
     # local_file.more-things-to-do will be created
     + resource "local_file" "more-things-to-do" {
         + content              = "Learn how to play Astronomia on the guitar!"
         + content_base64sha256 = (known after apply)
         + content_base64sha512 = (known after apply)
         + content_md5          = (known after apply)
         + content_sha1         = (known after apply)
         + content_sha256       = (known after apply)
         + content_sha512       = (known after apply)
         + directory_permission = "0777"
         + file_permission      = "0777"
         + filename             = "/root/more-things-to-do.txt"
         + id                   = (known after apply)
       }
   
     # local_file.things-to-do will be created
     + resource "local_file" "things-to-do" {
         + content              = <<~EOT
               Clean my room before Christmas
               Complete the CKA Certification!
           EOT
         + content_base64sha256 = (known after apply)
         + content_base64sha512 = (known after apply)
         + content_md5          = (known after apply)
         + content_sha1         = (known after apply)
         + content_sha256       = (known after apply)
         + content_sha512       = (known after apply)
         + directory_permission = "0777"
         + file_permission      = "0777"
         + filename             = "/root/things-to-do.txt"
         + id                   = (known after apply)
       }
   
   Plan: 2 to add, 0 to change, 0 to destroy.
   
   Do you want to perform these actions?
     Terraform will perform the actions described above.
     Only 'yes' will be accepted to approve.
   
     Enter a value: yes
   
   local_file.things-to-do: Creating...
   local_file.more-things-to-do: Creating...
   local_file.more-things-to-do: Creation complete after 0s [id=85e6ec1cf7be591e68345cbaf27a4529a4f25eb0]
   local_file.things-to-do: Creation complete after 0s [id=57de5ed15ca8120dba3bd950bad6d5e55b97f635]
   
   Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
   ```

7. We have created another directory containing configuration files at `/root/terraform-projects/christmas-wishlist`.

   Inspect this configuration directory.

   OK

8. How many resources are configured within this configuration directory?

   Make sure to check all the `.tf` files.

   - 0
   - **2**
   - 1
   - 5

   ```
   iac-server $ cd christmas-wishlist/
   
   iac-server $ ls
   cyberpunk.tf  ps5.tf
   ```

9. What is the `filename` that will be created by the resource called `cyberpunk`?

   - cyberpunk
   - /root/ps5.txt
   - /root/cyberpunk.txt
   - **/root/cyberpunk2077.txt**

   cyberpunk.tf

   ```
   resource "local_file" "cyberpunk" {
     filename     = "/root/cyberpunk2077.txt"
     content  = "All I need for Christmas is Cyberpunk 2077!"
   }
   ```

10. Create a new configuration file within the same directory called `xbox.tf`. This file should make use of the same `local_file` resource type with the below requirements:

   Resource Name: `xbox`

   filename: `/root/xbox.txt`

   content: `Wouldn't mind an XBox either!`

   Once the configuration file has been created, use the terraform workflow to create this resource.

   Check

   - resource created as specified?

   Solution for `xbox.tf` :-

   ```
   resource "local_file" "xbox" {
     filename = "/root/xbox.txt"
     content  = "Wouldn't mind an XBox either!"
   }
   ```

   ```
   $ terraform init
   
   $ terraform plan
   
   $ terraform apply
   ```

11. Now, navigate to the directory `/root/terraform-projects/provider-a`. We have downloaded a plugin in this directory. Identify the name and type of provider.

    If the configuration files in this directory seem unfamiliar, do not worry, these are covered later in the course.

    - **Verified - linode**
    - Official - google
    - Official - linode
    - Third-Party - linode

    Run `terraform init` or inspect the `.terraform` directory. Also, make use of the documentation to determine the type of provider used.

    ```
    iac-server $ pwd
    /root/terraform-projects/provider-a
    ```

    ```
    $ terraform init
    
    Initializing the backend...
    
    Initializing provider plugins...
    - Using previously-installed linode/linode v1.13.3
    
    Terraform has been successfully initialized!
    
    You may now begin working with Terraform. Try running "terraform plan" to see
    any changes that are required for your infrastructure. All Terraform commands
    should now work.
    
    If you ever set or change modules or backend configuration for Terraform,
    rerun this command to reinitialize your working directory. If you forget, other
    commands will detect it and remind you to do so if necessary.
    ```

    ```
    iac-server $ ls -la .terraform/plugins/registry.terraform.io/linode/linode/1.13.3/linux_amd64/
    total 42368
    drwxr-xr-x 2 root root     4096 Apr 20 03:29 .
    drwxr-xr-x 3 root root     4096 Apr 20 03:29 ..
    -rw-r--r-- 1 root root     7520 Apr 20 03:29 CHANGELOG.md
    -rw-r--r-- 1 root root    16725 Apr 20 03:29 LICENSE
    -rw-r--r-- 1 root root     3428 Apr 20 03:29 README.md
    -rwxr-xr-x 1 root root 43343872 Apr 20 03:29 terraform-provider-linode_v1.13.3
    ```

12. Now, navigate to the directory `/root/terraform-projects/provider-b`. We have downloaded a plugin in this directory. Identify the name and type of provider.

    If the configuration files in this directory seem unfamiliar, do not worry, these are covered later in the course.

    Run `terraform init` or inspect the `.terraform` directory. Also, make use of the documentation to determine the type of provider used.

    - Verified - ansible
    - Official - ansible
    - **Community - ansible**

    ```
     $ terraform init
    
    Initializing the backend...
    
    Initializing provider plugins...
    - Using previously-installed nbering/ansible v1.0.4
    
    Terraform has been successfully initialized!
    
    You may now begin working with Terraform. Try running "terraform plan" to see
    any changes that are required for your infrastructure. All Terraform commands
    should now work.
    
    If you ever set or change modules or backend configuration for Terraform,
    rerun this command to reinitialize your working directory. If you forget, other
    commands will detect it and remind you to do so if necessary.
    ```



##  LAB: MULTIPLE PROVIDERS

1. Can we use multiple providers in the same configuration directory?

   - YES
   - NO

2. We have a new configuration directory located at the path `/root/terraform-projects/multi-provider`. Inspect this directory and find out the number of providers initialized.

   Don't run the `terraform init` command yet!

   - 4
   - 3
   - 2
   - **0**

   Go to the `.terraform/plugins` directory and count the number of provider plugins installed. If the directory does not exist, there are no plugins downloaded yet.

3. Now, run the `terraform init` command and inspect the `.terraform/plugins` directory. Count the number of plugins downloaded.

   OK

   ```
   $ terraform init
   
   Initializing the backend...
   
   Initializing provider plugins...
   - Finding latest version of hashicorp/random...
   - Finding latest version of hashicorp/local...
   - Installing hashicorp/local v2.4.0...
   - Installed hashicorp/local v2.4.0 (self-signed, key ID 34365D9472D7468F)
   - Installing hashicorp/random v3.5.1...
   - Installed hashicorp/random v3.5.1 (self-signed, key ID 34365D9472D7468F)
   
   Partner and community providers are signed by their developers.
   If you'd like to know more about provider signing, you can read about it here:
   https://www.terraform.io/docs/plugins/signing.html
   
   The following providers do not have any version constraints in configuration,
   so the latest version was installed.
   
   To prevent automatic upgrades to new major versions that may contain breaking
   changes, we recommend adding version constraints in a required_providers block
   in your configuration, with the constraint strings suggested below.
   
   * hashicorp/local: version = "~> 2.4.0"
   * hashicorp/random: version = "~> 3.5.1"
   
   Terraform has been successfully initialized!
   
   You may now begin working with Terraform. Try running "terraform plan" to see
   any changes that are required for your infrastructure. All Terraform commands
   should now work.
   
   If you ever set or change modules or backend configuration for Terraform,
   rerun this command to reinitialize your working directory. If you forget, other
   commands will detect it and remind you to do so if necessary.
   ```

4. How many plugins are available now in this configuration directory?

   - 1
   - 3
   - 0
   - **2**

   ```
   iac-server $ ls -la .terraform/plugins/registry.terraform.io/hashicorp/
   total 16
   drwxr-xr-x 4 root root 4096 Apr 20 03:50 .
   drwxr-xr-x 3 root root 4096 Apr 20 03:50 ..
   drwxr-xr-x 3 root root 4096 Apr 20 03:50 local
   drwxr-xr-x 3 root root 4096 Apr 20 03:50 random
   ```

5. Now, Navigate to the directory `/root/terraform-projects/MPL`. Create a new configuration file called `pet-name.tf`.
   This file should make use of the `local_file` and `random_pet` resource type with the below requirements:

   `local_file` resource details:

   Resource name = `"my-pet"`

   File name = `"/root/pet-name"`

   Content = `"My pet is called finnegan!!"`


   `random_pet` resource details:

   Resource name = `"other-pet"`

   Length = `"1"`

   Prefix = `"Mr"`

   Separator = `"."`

   Once the configuration file has been created, use the terraform workflow to create this resource.

   Check

   - resources configured correctly?
   - resources created successfully?

   The solution is provided below:

   Create pet-name.tf file with following contents:

   ```
   resource "local_file" "my-pet" {
        filename = "/root/pet-name"
        content = "My pet is called finnegan!!"
   
   }
   resource "random_pet" "other-pet" {
        length = 1
        prefix = "Mr"
        separator = "."
   
   }
   ```

   ```
   $ terraform init
   
   $ terraform plan
   
   $ terraform apply
   ```

6. Now change into the directory `/root/terraform-projects/provider` and inspect the file `cloud-provider.tf`.
   What is the `instance_type` configured with the resource type called `aws_instance`?

   Don't worry if you are not familiar with the aws providers. We will cover it later on.

   - t2.medium
   - **t2.large**
   - t2.micro
   - t2.mini

   cloud-proviver.tf

   ```
   resource "aws_instance" "ec2_instance" {
   	  ami       =  "ami-0eda277a0b884c5ab" 
   	  instance_type = "t2.large"
   }
   
   
   resource "aws_ebs_volume" "ec2_volume" {
   	  availability_zone = "eu-west-1"
   	  size  =    10
   }
   ```

7. What is the name of the resource configured with the resource type `kubernetes_namespace` in `kube.tf` file within the same directory?

   - aws-ops
   - aws-dev
   - web
   - **dev**

   kube.tf

   ```
   resource "local_file" "data" {
   	filename = "/root/k8s.txt"
   	content = "kubernetes the hard way!"
   }
   
   
   resource "kubernetes_namespace" "dev" {
     metadata {
       name = "development"
     }
   }
   ```

8. Let's get some more practice! Now navigate to the directory path `/root/terraform-projects/provider-a`. Create a configuration file called `code.tf`.

   Using the `local_file` resource type, write the resource block with the below requirements into the file:

   Resource name = `iac_code`

   File name = `/opt/practice`

   Content = `Setting up infrastructure as code`

   When ready, only run the `terraform init` command, we will run the `terraform apply` command later on.

   Check

   - configured file correctly?
   - terraform init run successfully?

   The solution is provided below:

   Create code.tf file with following contents:

   ```
   resource "local_file" "iac_code" {
             filename = "/opt/practice"
             content = "Setting up infrastructure as code"
   }
   ```

   ```
   $ terraform init
   
   $ terraform apply
   ```

9. We have made some changes to the configuration file. Are you able to run `terraform apply` command?

   - YES
   - **NO**

10. This is because whenever we add a resource for a provider that has not been used so far in the configuration directory, we have to initialize the directory by running `terraform init` command.

   Let's do that now. Run `terraform init` followed by `terraform apply` command.

   Check

   - terraform init run successfully?
   - resources created successfully?

   code.tf

   ```
   resource "local_file" "iac_code" {
   	  filename = "/opt/practice"
   	  content = "Setting up infrastructure as code"
   }
   
   
   resource "random_string" "iac_random" {
     length = 10
     min_upper = 5
   }
   ```

   

   
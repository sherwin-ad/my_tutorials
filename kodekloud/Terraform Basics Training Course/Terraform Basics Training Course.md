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

   

## LAB: VARIABLES

1. Which of the following is not a valid `variable type`?'

   - tuple
   - list
   - object
   - **item**
   - map

2. Which one of the below is not a valid data type in `terraform`?

   - map
   - tuple
   - **array**
   - list
   - set

3. Navigate to the directory `/root/terraform-projects/variables`. Which `type` does the variable called `number` belong to?

   - **bool**	
   - string
   - list
   - number

   variable.tf

   ```
   variable "name" {
        type = string
        default = "Mark"
     
   }
   variable "number" {
        type = bool
        default = true
     
   }
   variable "distance" {
        type = number
        default = 5
     
   }
   variable "jedi" {
        type = map
        default = {
        filename = "/root/first-jedi"
        content = "phanius"
        }
     
   }
   
   variable "gender" {
        type = list(string)
        default = ["Male", "Female"]
   }
   variable "hard_drive" {
        type = map
        default = {
             slow = "HHD"
             fast = "SSD"
        }
   }
   variable "users" {
        type = set(string)
        default = ["tom", "jerry", "pluto", "daffy", "donald", "jerry", "chip", "dale"]
   
     
   }
   ```

4. How would you fetch the value of the key called `slow` from the variable called `hard_drive` in a `terraform` configuration?

   This variable is defined in the file `variables.tf`.

   - var.hard_drive[0]
   - hard_drive["slow"]
   - var.hard_drive.slow
   - var.hard_drive.0
   - **var.hard_drive["slow"]**

   variables.tf

   ```
   variable "name" {
        type = string
        default = "Mark"
     
   }
   variable "number" {
        type = bool
        default = true
     
   }
   variable "distance" {
        type = number
        default = 5
     
   }
   variable "jedi" {
        type = map
        default = {
        filename = "/root/first-jedi"
        content = "phanius"
        }
     
   }
   
   variable "gender" {
        type = list(string)
        default = ["Male", "Female"]
   }
   variable "hard_drive" {
        type = map
        default = {
             slow = "HHD"
             fast = "SSD"
        }
   }
   variable "users" {
        type = set(string)
        default = ["tom", "jerry", "pluto", "daffy", "donald", "jerry", "chip", "dale"]
   
     
   }
   ```

5. What is the index of the element called `Female` in the variable called `gender`?

   - Female
   - 3
   - var.gender["female"]
   - **1**
   - 0

6. What is the type of variable called `users`?

   - list(string)
   - **set(string)**
   - list
   - set

7. However, this variable has been defined incorrectly! Identify the mistake.

   - **duplicate elements**
   - type used is incorrect
   - syntax error
   - elements should not be enclosed in double quotes

8. We have now updated the `main.tf` file in the same directory (`/root/terraform-projects/variables`) and added some resource blocks.

   Inspect them.

   OK

9. What is the value for the argument called `content` used in the resource block for the resource `jedi`?

   - first-jedi
   - **phanius**
   - jedi
   - obi-wan
   - yoda

10. Now, let's update this resource and add variables instead. Use the default value declared in the variable called `jedi`.
      This variable is a map. For the argument called `content` use the value of the key by the same name.
      And, similarly, for the argument called `filename` use the value by the same name.

   When ready, run `terraform init, plan and apply` to create this resource.

   Check

   - terraform init and apply run?
   - resource uses variables?

   main.tf

   ```
   resource "local_file" "jedi" {
        filename = "/root/first-jedi"
        content = "phanius"
   }
   ```

   Variable called `jedi` is a map, so we have to use below syntax :-

   ```
   resource "local_file" "jedi" {
        filename = var.jedi["filename"]
        content = var.jedi["content"]
   }
   ```



## LAB: USING VARIABLES IN TERRAFORM

1. How can we use `environment` variables to pass `input variables` in `terraform` scripts?

   - export variable
   - **TF_VAR_<variable_name>**
   - .var
   - .tf

2. Which method has the highest priority in Variable Definition Precedence?

   If unsure, Refer to the documentation. Documentation tab is available at the top right.

   - using .auto.tfvars
   - **command line flag of -var or -var-file**
   - variable definition file terraform.tfvars.json
   - using terraform.tfvars

3. Which one of the following commands is a valid way to make use of a custom variable file with the `terraform apply` command?

   - terraform apply -var-file variables.vars
   - **terraform apply -var-file variables.tfvars**
   - terraform apply -var-file variables.tf

4. We have created some files under the directory `/root/terraform-projects/variables`. Inspect it.

   OK

5. What will happen if we run `terraform plan` command right now?

   Try it.

   - **Error**
   - Success

6. The `terraform plan` command did not run as there was no reference for the input variable called `filename` in the configuration files.

   Let's fix that now.

   OK

7. Declare the variable called `filename` with type `string` in the file `variables.tf`.
   Don't have to specify a `default` value.

   Check

   - Syntax Check

   Solution available for `variables.tf` file :-

   ```
   variable filename {
     type = string
   }
   ```

8. If we run `terraform apply` with a `-var` command line flag as shown below, which value would be considered by `terraform`?

   ```
   terraform apply -var filename=/root/tennis.txt
   ```

   - default value in variables.tf
   - None of this
   - **/root/tennis.txt**
   - /root/basketball.txt

9. `Terraform` follows a variable definition precedence order to determine the value and
   the command line flag of `–var or –var-file` takes the highest priority.

   OK

## LAB: RESOURCE ATTRIBUTES

1. Navigate to the configuration directory `/root/terraform-projects/project-chronos` and inspect the files created inside.

   OK

2. What is the `resource_type` of the resource that's currently defined in the `main.tf` file?

   If unsure, refer to the documentation. Documentation tab is available at the top right panel.

   - **time_static**
   - time
   - time_stamp
   - time_update

   main.tf

   ```
    resource "time_static" "time_update" {
   }
   ```

3. As you can see, the resource block is empty. This is because `time_static` does not need any arguments to be supplied to work.

   When applied as it is, `terraform` creates a logical resource locally (similar to `random_pet`) with the current time.

   OK

4. Which of the following `attributes` are exported by the `time_static` resource?

   If unsure, refer to the documentation. Documentation tab is available at the top right panel.

   - **Id**
   - content
   - century
   - filename
   - decade

5. How do we refer to the attribute called `id` using a reference expression?

   - time_static["id"]
   - time_static.time_update["id"]
   - time_update.id
   - time_static_time
   - **time_static.time_update.id**

6. Now, update the `main.tf` file and add a new `local_file` resource called `time` with the following requirements:

   1. filename: `/root/time.txt`

   2. content: `Time stamp of this file is <id from time_update resource>`

   Use a reference expression and interpolation.

   When ready, run `terraform init, plan and apply`.

   Check

   - resource created as specified?

   Solution for `main.tf` :-

   ```
   resource "local_file" "time" {
     filename = "/root/time.txt"
     content = "Time stamp of this file is ${time_static.time_update.id}"
   
    }
    resource "time_static" "time_update" {
   }
   ```

7. What is the attribute called `id` that is created for the `local file` resource called `time`?

   Make use of the `terraform show` command and identify the attribute values.

   - 3395a1ce5b05fd3395a1ce5b05fd
   - 3f43292fd8d4e8dffef53f43292fd8d4e8dffef5
   - **313bd49f17d4637edbd6597f120b2c5990e826c2**
   - 5fdb66d473f43295fdb66d473f4329

   ```
   $ terraform show
   # local_file.time:
   resource "local_file" "time" {
       content              = "Time stamp of this file is 2023-04-24T01:23:00Z"
       content_base64sha256 = "DTgwwRr4vQ/h6PfRpp5DH48NvIAQpDGA1YJiENN26Vw="
       content_base64sha512 = "3F2SydUIUFKrKJ/tM0juJOmNgJdccXrBqCtGVM0IlDKZNn2AHkGjTyqON+VaVysdL/wJw93S2nMs9Ndv4LMvTA=="
       content_md5          = "912de55d6d251dd6ecc766ea31458f99"
       content_sha1         = "313bd49f17d4637edbd6597f120b2c5990e826c2"
       content_sha256       = "0d3830c11af8bd0fe1e8f7d1a69e431f8f0dbc8010a43180d5826210d376e95c"
       content_sha512       = "dc5d92c9d5085052ab289fed3348ee24e98d80975c717ac1a82b4654cd08943299367d801e41a34f2a8e37e55a572b1d2ffc09c3ddd2da732cf4d76fe0b32f4c"
       directory_permission = "0777"
       file_permission      = "0777"
       filename             = "/root/time.txt"
       id                   = "313bd49f17d4637edbd6597f120b2c5990e826c2"
   }
   
   # time_static.time_update:
   resource "time_static" "time_update" {
       day     = 24
       hour    = 1
       id      = "2023-04-24T01:23:00Z"
       minute  = 23
       month   = 4
       rfc3339 = "2023-04-24T01:23:00Z"
       second  = 0
       unix    = 1682299380
       year    = 2023
   }
   ```

8. What is the attribute called `rfc3339` that is created for the `time_static` resource called `time_update`?

   Make use of the `terraform show` command and identify the attribute values.

   - 2020
   - **2023-04-24T01:23:00Z**
   - 2020-01-14T00:00:00Z
   - 2020-11-22T17:23:17Z

   time.txt

   ```
   Time stamp of this file is 2023-04-24T01:23:00Z
   ```



## LAB: RESOURCE DEPENDENCIES

1. Which argument should be used to explicitly set dependencies for a resource?

   - **depends_on**
   - resource_depend
   - dependent
   - depend_on

2. `Resource A` relies on another `Resource B` but doesn't access any of its attributes in its own arguments. What is this type of dependency called?

   - implicit dependency
   - external_dependency
   - internal_dependency
   - **explicit dependency**

3. How do we make use of `implicit dependency`?

   - variables
   - datasources
   - **reference expressions**
   - depends_on

4. n the configuration directory `/root/terraform-projects/key-generator`, create a file called `key.tf` with the following specifications:


   Resource Type: `tls_private_key`

   Resource Name: `pvtkey`

   algorithm: `RSA`

   rsa_bits: `4096`

   When ready, run `terraform init, plan and apply`.

   If unsure, refer to the documentation.

   Check

   - resource created as specified?

   Solution for `key.tf` :-

   ```
   resource "tls_private_key" "pvtkey" {
     algorithm = "RSA"
     rsa_bits  = 4096
   }
   ```

5. Resource `tls_private_key` generates a secure private key and encodes it as PEM. It is a logical resource that lives only in the `terraform state`.

   You can see the details of the resource, including the private key by running the `terraform show` command.

   You can read the documentation for more details. `https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key`

   OK

   ```
   $ terraform show
   # tls_private_key.pvtkey:
   resource "tls_private_key" "pvtkey" {
       algorithm                     = "RSA"
       ecdsa_curve                   = "P224"
       id                            = "32be13e37f94f1ed9e9b56be7daeda1d98509c22"
       private_key_openssh           = (sensitive value)
       private_key_pem               = (sensitive value)
       private_key_pem_pkcs8         = (sensitive value)
       public_key_fingerprint_md5    = "e0:80:2b:8d:b8:23:79:0c:ba:19:ac:73:07:9a:58:12"
       public_key_fingerprint_sha256 = "SHA256:T/KiSiya8hwOCiztFr6EjZaAeoPD6RYet4DUWD6Ayto"
       public_key_openssh            = <<~EOT
           ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDTLyzHY+BXFdP8PjImzSR2D9rvstIUvgVUpKf2CiosohYd7cDflcWtuwJRojPWp14vXH5HwXbDJLu2T9BJqBpZZIwMYjcdrxeyRXHH+0UbpsLRMEpyXA0nq8heE4e6DZOPxQwANDokLWxJp2VBGbhGI1CcF0cSKArxSfndPQ7FMTP82lRX0MbNXjwXoM8WjUb0VSjwfTbfHcSA8eFbjdEJ+HSBivrZs0M5/mpHTzye+q8a00aWuqQ+ODjnW+4S/QDGCWLhOcWeFNslYaQ9vAnAf8y0hvdGchtSR7tcnNCk+xwtLS3hO5v0sna/A1oiU6BCOLwN1Nw/4PJssuhO3DbguR9cDIEOkcCTIV2QO6cVwxcg9gOoDBHjIHCLxt5bAb5M8L+Tn5JfpVFjgc48knshM0/k0N7EHZZ6VN4NKP158fE9KJqOx0bXnWm5sSEc+GIX4byWQC5KnsaFokozy9k1bqtLMzOjO5xPO5sLiiNe9DO0zI9iLAnl4KUupCjrKbS7QNouHBzCiLluQ/BS30eyqAYuGEnVuWAZAdj+mY/UUoFtcV3IovrSLHHUBNtjOs8wb4v9apyjK6aQC+elT52lfrahSQMURW5NLRb9dXjLnsyM8KeRfI89mR4yYUQHOT23YIoyTgwhCjTurVe+ZqN9WBXMI93me21MPWaUsPJYEQ==
       EOT
       public_key_pem                = <<~EOT
           -----BEGIN PUBLIC KEY-----
           MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA0y8sx2PgVxXT/D4yJs0k
           dg/a77LSFL4FVKSn9goqLKIWHe3A35XFrbsCUaIz1qdeL1x+R8F2wyS7tk/QSaga
           WWSMDGI3Ha8XskVxx/tFG6bC0TBKclwNJ6vIXhOHug2Tj8UMADQ6JC1sSadlQRm4
           RiNQnBdHEigK8Un53T0OxTEz/NpUV9DGzV48F6DPFo1G9FUo8H023x3EgPHhW43R
           Cfh0gYr62bNDOf5qR088nvqvGtNGlrqkPjg451vuEv0Axgli4TnFnhTbJWGkPbwJ
           wH/MtIb3RnIbUke7XJzQpPscLS0t4Tub9LJ2vwNaIlOgQji8DdTcP+DybLLoTtw2
           4LkfXAyBDpHAkyFdkDunFcMXIPYDqAwR4yBwi8beWwG+TPC/k5+SX6VRY4HOPJJ7
           ITNP5NDexB2WelTeDSj9efHxPSiajsdG151pubEhHPhiF+G8lkAuSp7GhaJKM8vZ
           NW6rSzMzozucTzubC4ojXvQztMyPYiwJ5eClLqQo6ym0u0DaLhwcwoi5bkPwUt9H
           sqgGLhhJ1blgGQHY/pmP1FKBbXFdyKL60ixx1ATbYzrPMG+L/WqcoyumkAvnpU+d
           pX62oUkDFEVuTS0W/XV4y57MjPCnkXyPPZkeMmFEBzk9t2CKMk4MIQo07q1Xvmaj
           fVgVzCPd5nttTD1mlLDyWBECAwEAAQ==
           -----END PUBLIC KEY-----
       EOT
       rsa_bits                      = 4096
   }
   ```

6. Now, let's use the `private key` created by this resource in another resource of type `local file`. Update the `key.tf` file with the requirements:


   Resource Name: `key_details`

   File Name: `/root/key.txt`

   Content: use a reference expression to use the attribute called `private_key_pem` of the `pvtkey` resource.

   When ready, run `terraform init, plan and apply`.

   Check

   Solution for `key.tf` :-

   ```
   resource "tls_private_key" "pvtkey" {
     algorithm = "RSA"
     rsa_bits  = 4096
   }
   
   resource "local_file" "key_details" {
     content  = tls_private_key.pvtkey.private_key_pem
     filename = "/root/key.txt"
   }
   ```

7. Now destroy these two resources.

   Use `terraform destroy`.

   Check

   - resource destroyed?

   ```
   $ terraform destroy
   ```

8. For the next question, navigate to the directory `/root/terraform-projects/explicit-dependency`.

   OK

9. Within this directory, create two `local_file` type resources in `main.tf` file.

   
   Resource 1:

   Resource Name: `whale`

   File Name: `/root/whale`

   content: `whale`

   
   Resource 2:

   Resource Name: `krill`

   File Name: `/root/krill`

   content: `krill`

   
   Resource called `whale` should depend on `krill` but do not use reference expressions.

   When ready, run `terraform init, plan and apply`.

   Check

   - Syntax Check

   Solution for `main.tf` :-

   ```
   resource "local_file" "whale" {
     filename   = "/root/whale"
     content    = "whale"
     depends_on = [local_file.krill]
   }
   resource "local_file" "krill" {
     filename = "/root/krill"
     content  = "krill"
   }
   ```



## LAB: OUTPUT VARIABLES

1. Navigate to the directory called `/root/terraform-projects/data`. We have used the configuration files created in this directory to create some resources. Inspect them.

   OK

2. Navigate to the directory called `/root/terraform-projects/data`. We have used the configuration files created in this directory to create some resources. Inspect them.

   - **random**
   - local
   - tls
   - time

   main.tf

   ```
   resource "random_uuid" "id1" {
      
   }
   resource "random_uuid" "id2" {
      
   }
   resource "random_uuid" "id3" {
      
   }
   resource "random_uuid" "id4" {
      
   }
   resource "random_uuid" "id5" {
      
   }
   resource "random_uuid" "id6" {
      
   }
   resource "random_uuid" "id7" {
      
   }
   resource "random_integer" "order1" {
     min     = 1
     max     = 99999
    
   }
   resource "random_integer" "order2" {
     min     = 1
     max     = 222222
    
   }
   ```

3. Which two resource types are configured in the configuration files?

   - random_password && random_pet
   - random_uuid && random_shuffle
   - random_pet && random_id
   - **random_uuid && random_integer**

4. We also defined a few output variables in the `output.tf` file in this configuration directory. Inspect them.

   OK

   output.tf

   ```
   output "id1" {
      value = random_uuid.id1.result
   }
   output "id2" {
       value = random_uuid.id2.result
      
   }
   output "id3" {
       value = random_uuid.id3.result
      
   }
   
   output "id4" {
       value = random_uuid.id4.result
      
   }
   output "id5" {
       value = random_uuid.id5.result
   }
      
   output "id6" {
       value = random_uuid.id6.result
      
   }
   output "id7" {
       value = random_uuid.id7.result
      
   }
   output "order1" {
    value = random_integer.order1.result
    
   }
   output "order2" {
    value = random_integer.order1.result
    
   }
   ```

5. Run `terraform init, plan and apply` to create these resources.

   Check

   - terraform applied correctly?

6. What is the value of the `output` variable called `id2` ?

   Use the `terraform output` command.

   - daaf6371-eacb-6996-b497-5491879cdcdd
   - b48f3418-400e-3c31-735e-8bc713711bce
   - **74c68a8c-73f8-706e-e438-aa8c64d71ed6**

   ```
   $ terraform output
   id1 = 10538602-96fd-9b8f-5842-b4d2d3e963e9
   id2 = 74c68a8c-73f8-706e-e438-aa8c64d71ed6
   id3 = 88be9bf7-4a26-1e63-c41b-7873661764ab
   id4 = 3121b21f-2de8-ad78-2999-c4b10c48ea2a
   id5 = 8ef26852-8f38-8abb-b39e-62440d2be7f0
   id6 = 524f978d-795d-0a25-a25b-18554c41d723
   id7 = 08261662-a3e7-6c97-1294-2477cd8e0150
   order1 = 21351
   order2 = 21351
   ```

7. What is the value of the `output` variable called `order1` ?

   Use the `terraform output` command.

   - **21351**
   - 2222
   - 040385
   - 141612
   - 240187

   ```
   $ terraform output
   id1 = 10538602-96fd-9b8f-5842-b4d2d3e963e9
   id2 = 74c68a8c-73f8-706e-e438-aa8c64d71ed6
   id3 = 88be9bf7-4a26-1e63-c41b-7873661764ab
   id4 = 3121b21f-2de8-ad78-2999-c4b10c48ea2a
   id5 = 8ef26852-8f38-8abb-b39e-62440d2be7f0
   id6 = 524f978d-795d-0a25-a25b-18554c41d723
   id7 = 08261662-a3e7-6c97-1294-2477cd8e0150
   order1 = 21351
   order2 = 21351
   ```

8. We have a new configuration directory located at the path `/root/terraform-projects/output`. Inspect the configuration files that are created in this directory.

   What is the value of the `output` variable `pet-name` ?

   Use the `terraform output` command within the new configuration directory.

   - joy
   - **herring**
   - rox
   - fin

   main.tf

   ```
   resource "random_pet" "my-pet" {
   
     length    = var.length 
   }
   
   output "pet-name" {
   	
   	value = random_pet.my-pet.id
   	description = "Record the value of pet ID generated by the random_pet resource"
   }
   ```

   variables.tf

   ```
   variable "prefix" {
     default = "Mrs"	
   }
   
   variable "separator" {
   	default = "."
   }
   
   variable "length" {
   	default = "1"
   }
   ```

   ```
   $ terraform output pet-name
   herring
   ```

9. We have just updated the `main.tf` file in this directory with a new resource block.
   Add a new `output` variable with the following specifications:

   Output Variable Name: `welcome_message`

   Value: `content` of the resource called `welcome`

   When ready, run `terraform init, plan and apply`

   Check

   - resource and output variable created?

   main.tf

   ```
   resource "random_pet" "my-pet" {
   
     length = var.length
   }
   
   output "pet-name" {
   
     value       = random_pet.my-pet.id
     description = "Record the value of pet ID generated by the random_pet resource"
   }
   
   resource "local_file" "welcome" {
     filename = "/root/message.txt"
     content  = "Welcome to Kodekloud."
   }
   output "welcome_message" {
     value = local_file.welcome.content
   }
   ```

   ```
   terraform apply
   random_pet.my-pet: Refreshing state... [id=herring]
   local_file.welcome: Refreshing state... [id=d2d3e44fe87af01e8f96ec1b0e467845109264b2]
   
   Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
   
   Outputs:
   
   pet-name = herring
   welcome_message = Welcome to Kodekloud.
   ```



# Terraform State

## LAB: TERRAFORM STATE

1. Which location is the terraform `state file` stored by default?

   - **Inside the configuration directory**
   - /root
   - /tmp
   - /root/terraform-projects

2. Which option should we use to disable state?

   - -state=false
   - **We cannot disable state!**
   - -refresh=false
   - --nostate

3. Which format is the state file stored in by default?

   - TOML
   - XML
   - YAML
   - **JSON**

4. Which of the following commands does NOT refresh the state?

   - terraform plan
   - **terraform init**
   - terraform apply

5. What is the name of the state file that is created by default?

   - state.tf
   - terraform.tfvars
   - .terraform
   - **terraform.tfstate**

6. Navigate to the configuration directory `/root/terraform-projects/project-flash` we have created a few configuration files here. The directory has been initialized and the provider plugins downloaded inside the `.terraform` directory. However, there is no `terraform.tfstate` file created. Why is that?

   - terraform plan was not run
   - **terraform apply was not run**
   - syntax error
   - terraform init was not run correctly

7. Run the `terraform show` command and identify the `id` created for the resource called `speed_force`.

   - 121212-232323
   - 75c434n343-43c9323
   - **No Details Printed - There is No State**
   - 2c23232-23cdc4r23

   ```
   $ terraform show
   No state.
   ```

8. Now, run `terraform apply` in this directory.

   Check

   - Syntax Check

   main.tf

   ```
   resource "local_file" "speed_force" {
       filename = "/root/speed-force"
       content = "speed-force"
   }
   ```

   reverse-flash.tf

   ```
   resource "local_file" "reverse-flash" {
       filename = "/root/reverse-flash"
       content = "reverse-flash"
   }
   ```

   ridller.tf

   ```
   resource "local_file" "riddler" {
       filename = "/root/riddler"
       content = "riddler"
   }
   ```

   zoom.tf

   ```
   resource "local_file" "zoom" {
       filename = "/root/zoom"
       content = "zoom"
   }
   ```

   

9. Now, check `terraform show` again. What is the value of id for the resource called `speed_force`?

   - e6b4b0d3255bfef95e6b4b0d3255bfef95
   - **ebeb8b595c8eb4a6e81cacf244146e742fab2981**
   - da39a3ee5e6b4b0d32da39a3ee5e6b4b0d32
   - 55bfef95601890afd8070955bfef95601890afd80709

   ```
   $ terraform show
   # local_file.reverse-flash:
   resource "local_file" "reverse-flash" {
       content              = "reverse-flash"
       content_base64sha256 = "Kace3gKIeU2ZCrzpIfitqTpaWRR2kK9h1SfG7HQX9g8="
       content_base64sha512 = "B02UG9wp6Czo23pn2gT/+YreJPaAoMf5fvjDpnymQiXsSfNSHvLfhyn4qXmNQUqborgGFq3imi6wMp7GYHQnPg=="
       content_md5          = "f6cc31cf8b2e4d5868b646567f2c8edb"
       content_sha1         = "eebf1b0eee8ccea695bf7925def3d540801e16c7"
       content_sha256       = "29a71ede0288794d990abce921f8ada93a5a59147690af61d527c6ec7417f60f"
       content_sha512       = "074d941bdc29e82ce8db7a67da04fff98ade24f680a0c7f97ef8c3a67ca64225ec49f3521ef2df8729f8a9798d414a9ba2b80616ade29a2eb0329ec66074273e"
       directory_permission = "0777"
       file_permission      = "0777"
       filename             = "/root/reverse-flash"
       id                   = "eebf1b0eee8ccea695bf7925def3d540801e16c7"
   }
   
   # local_file.riddler:
   resource "local_file" "riddler" {
       content              = "riddler"
       content_base64sha256 = "ZovOaJeJQ6wk+LukJRF4IvHfbvLwrjID3HoP9Mrvo6A="
       content_base64sha512 = "ZzOhD2IhUO4zPafhb8xoi1zMpVzfiOcprBlhCY7waUIS1/zHmvtbVYqS5aQdXnTQEFjEmuvjlwqaV9kErD/7TA=="
       content_md5          = "426c70c360c4b0c5ef58e6dc535cf520"
       content_sha1         = "4a99c9eed6c660f5874cc2505558d5abf940a498"
       content_sha256       = "668bce68978943ac24f8bba425117822f1df6ef2f0ae3203dc7a0ff4caefa3a0"
       content_sha512       = "6733a10f622150ee333da7e16fcc688b5ccca55cdf88e729ac1961098ef0694212d7fcc79afb5b558a92e5a41d5e74d01058c49aebe3970a9a57d904ac3ffb4c"
       directory_permission = "0777"
       file_permission      = "0777"
       filename             = "/root/riddler"
       id                   = "4a99c9eed6c660f5874cc2505558d5abf940a498"
   }
   
   # local_file.speed_force:
   resource "local_file" "speed_force" {
       content              = "speed-force"
       content_base64sha256 = "+hI5F86aVJG7nQ6K0VEOJHTIhlj5aRLnpODNbyZExtI="
       content_base64sha512 = "COfaah4Goo2T1qerQ8gYg5uR6onGpW1IjlpCtZuOW3UT+MH0rzPSj/LSKTJHHCfYVL0w3Q0B78u8RsRpueUNqg=="
       content_md5          = "b5db1e5be7170beefea11ae7271a06a8"
       content_sha1         = "ebeb8b595c8eb4a6e81cacf244146e742fab2981"
       content_sha256       = "fa123917ce9a5491bb9d0e8ad1510e2474c88658f96912e7a4e0cd6f2644c6d2"
       content_sha512       = "08e7da6a1e06a28d93d6a7ab43c818839b91ea89c6a56d488e5a42b59b8e5b7513f8c1f4af33d28ff2d22932471c27d854bd30dd0d01efcbbc46c469b9e50daa"
       directory_permission = "0777"
       file_permission      = "0777"
       filename             = "/root/speed-force"
       id                   = "ebeb8b595c8eb4a6e81cacf244146e742fab2981"
   }
   
   # local_file.zoom:
   resource "local_file" "zoom" {
       content              = "zoom"
       content_base64sha256 = "0hu1N3JdYD7i2635w9Hikaa3rtIV02o05YoaOw2qUIQ="
       content_base64sha512 = "3Y2YQB1BY5V4oYMn3EG3BuLyLFtEZINT1DQ+37JtqKgecw0RXR4hvh4dfrMJNcD0jYgwfh1k64noe1NNjLZx8w=="
       content_md5          = "15913c103a5238e5a80ac2f498ee090d"
       content_sha1         = "92298812107bb17eff1b85e15547ae13b6fee3a1"
       content_sha256       = "d21bb537725d603ee2dbadf9c3d1e291a6b7aed215d36a34e58a1a3b0daa5084"
       content_sha512       = "dd8d98401d41639578a18327dc41b706e2f22c5b44648353d4343edfb26da8a81e730d115d1e21be1e1d7eb30935c0f48d88307e1d64eb89e87b534d8cb671f3"
       directory_permission = "0777"
       file_permission      = "0777"
       filename             = "/root/zoom"
       id                   = "92298812107bb17eff1b85e15547ae13b6fee3a1"
   }
   ```

10. We have just added a new configuration file called `aws-infra.tf` into this configuration directory and provisioned the resources.

   These are `AWS` resources. Don't worry if they are unfamiliar to you, we will soon be learning about them in the upcoming lectures!

   OK

   aws-inra.tf

   ```
   resource "aws_instance" "dev-server" {
       instance_type = "t2.micro"
       ami         = "ami-02cff456777cd"
   }
   resource "aws_s3_bucket" "falshpoint"  {
       bucket = "project-flashpoint-paradox"
   }
   ```

11. Inspect the `terraform.tfstate` file or run `terraform show` command.

    You will notice that all the attribute details for all the resources created by this configuration is now printed on the screen!

    Among them is an `EC2 Instance` which is created by the resource called `dev-server`. See if you can find out the `private_ip` for the instance that was created.

    - **10.23.169.44**

    terraform.tfstate

    ```
    {
      "version": 4,
      "terraform_version": "0.13.3",
      "serial": 7,
      "lineage": "6f0c078f-5b40-5f46-a8af-3d17e5601567",
      "outputs": {},
      "resources": [
        {
          "mode": "managed",
          "type": "aws_instance",
          "name": "dev-server",
          "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
          "instances": [
            {
              "status": "tainted",
              "schema_version": 1,
              "attributes": {
                "ami": "ami-02cff456777cd",
                "arn": "arn:aws:ec2:us-east-1::instance/i-133bbe9035332521b",
                "associate_public_ip_address": true,
                "availability_zone": "us-east-1a",
                "capacity_reservation_specification": null,
                "cpu_core_count": null,
                "cpu_threads_per_core": null,
                "credit_specification": [],
                "disable_api_stop": null,
                "disable_api_termination": null,
                "ebs_block_device": [],
                "ebs_optimized": false,
                "enclave_options": [],
                "ephemeral_block_device": [],
                "get_password_data": false,
                "hibernation": null,
                "host_id": "",
                "host_resource_group_arn": null,
                "iam_instance_profile": "",
                "id": "i-133bbe9035332521b",
                "instance_initiated_shutdown_behavior": "",
                "instance_state": "running",
                "instance_type": "t2.micro",
                "ipv6_address_count": 0,
                "ipv6_addresses": [],
                "key_name": "None",
                "launch_template": [],
                "maintenance_options": [],
                "metadata_options": [],
                "monitoring": false,
                "network_interface": [],
                "outpost_arn": "",
                "password_data": null,
                "placement_group": "",
                "placement_partition_number": 0,
                "primary_network_interface_id": "eni-50ca749e",
                "private_dns": "ip-10-23-169-44.ec2.internal",
                "private_dns_name_options": [],
                "private_ip": "10.23.169.44",
                "public_dns": "ec2-54-214-47-218.compute-1.amazonaws.com",
                "public_ip": "54.214.47.218",
                "root_block_device": [
                  {
                    "delete_on_termination": true,
                    "device_name": "/dev/sda1",
                    "encrypted": false,
                    "iops": 0,
                    "kms_key_id": "",
                    "tags": {},
                    "throughput": 0,
                    "volume_id": "vol-1ef9b058",
                    "volume_size": 8,
                    "volume_type": "gp2"
                  }
                ],
                "secondary_private_ips": [],
                "security_groups": [],
                "source_dest_check": true,
                "subnet_id": "subnet-cb9adb7e",
                "tags": null,
                "tags_all": null,
                "tenancy": "default",
                "timeouts": null,
                "user_data": null,
                "user_data_base64": null,
                "user_data_replace_on_change": false,
                "volume_tags": null,
                "vpc_security_group_ids": []
              },
              "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMCwidXBkYXRlIjo2MDAwMDAwMDAwMDB9LCJzY2hlbWFfdmVyc2lvbiI6IjEifQ=="
            }
          ]
        },
        {
          "mode": "managed",
          "type": "aws_s3_bucket",
          "name": "falshpoint",
          "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
          "instances": [
            {
              "schema_version": 0,
              "attributes": {
                "acceleration_status": "",
                "acl": null,
                "arn": "arn:aws:s3:::project-flashpoint-paradox",
                "bucket": "project-flashpoint-paradox",
                "bucket_domain_name": "project-flashpoint-paradox.s3.amazonaws.com",
                "bucket_prefix": "",
                "bucket_regional_domain_name": "project-flashpoint-paradox.s3.amazonaws.com",
                "cors_rule": [],
                "force_destroy": false,
                "grant": [
                  {
                    "id": "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a",
                    "permissions": [
                      "FULL_CONTROL"
                    ],
                    "type": "CanonicalUser",
                    "uri": ""
                  }
                ],
                "hosted_zone_id": "Z3AQBSTGFYJSTF",
                "id": "project-flashpoint-paradox",
                "lifecycle_rule": [],
                "logging": [],
                "object_lock_configuration": [],
                "object_lock_enabled": false,
                "policy": "",
                "region": "us-east-1",
                "replication_configuration": [],
                "request_payer": "BucketOwner",
                "server_side_encryption_configuration": [],
                "tags": null,
                "tags_all": {},
                "timeouts": null,
                "versioning": [
                  {
                    "enabled": false,
                    "mfa_delete": false
                  }
                ],
                "website": [],
                "website_domain": null,
                "website_endpoint": null
              },
              "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjM2MDAwMDAwMDAwMDAsInJlYWQiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19"
            }
          ]
        },
        {
          "mode": "managed",
          "type": "local_file",
          "name": "reverse-flash",
          "provider": "provider[\"registry.terraform.io/hashicorp/local\"]",
          "instances": [
            {
              "schema_version": 0,
              "attributes": {
                "content": "reverse-flash",
                "content_base64": null,
                "content_base64sha256": "Kace3gKIeU2ZCrzpIfitqTpaWRR2kK9h1SfG7HQX9g8=",
                "content_base64sha512": "B02UG9wp6Czo23pn2gT/+YreJPaAoMf5fvjDpnymQiXsSfNSHvLfhyn4qXmNQUqborgGFq3imi6wMp7GYHQnPg==",
                "content_md5": "f6cc31cf8b2e4d5868b646567f2c8edb",
                "content_sha1": "eebf1b0eee8ccea695bf7925def3d540801e16c7",
                "content_sha256": "29a71ede0288794d990abce921f8ada93a5a59147690af61d527c6ec7417f60f",
                "content_sha512": "074d941bdc29e82ce8db7a67da04fff98ade24f680a0c7f97ef8c3a67ca64225ec49f3521ef2df8729f8a9798d414a9ba2b80616ade29a2eb0329ec66074273e",
                "directory_permission": "0777",
                "file_permission": "0777",
                "filename": "/root/reverse-flash",
                "id": "eebf1b0eee8ccea695bf7925def3d540801e16c7",
                "sensitive_content": null,
                "source": null
              }
            }
          ]
        },
        {
          "mode": "managed",
          "type": "local_file",
          "name": "riddler",
          "provider": "provider[\"registry.terraform.io/hashicorp/local\"]",
          "instances": [
            {
              "schema_version": 0,
              "attributes": {
                "content": "riddler",
                "content_base64": null,
                "content_base64sha256": "ZovOaJeJQ6wk+LukJRF4IvHfbvLwrjID3HoP9Mrvo6A=",
                "content_base64sha512": "ZzOhD2IhUO4zPafhb8xoi1zMpVzfiOcprBlhCY7waUIS1/zHmvtbVYqS5aQdXnTQEFjEmuvjlwqaV9kErD/7TA==",
                "content_md5": "426c70c360c4b0c5ef58e6dc535cf520",
                "content_sha1": "4a99c9eed6c660f5874cc2505558d5abf940a498",
                "content_sha256": "668bce68978943ac24f8bba425117822f1df6ef2f0ae3203dc7a0ff4caefa3a0",
                "content_sha512": "6733a10f622150ee333da7e16fcc688b5ccca55cdf88e729ac1961098ef0694212d7fcc79afb5b558a92e5a41d5e74d01058c49aebe3970a9a57d904ac3ffb4c",
                "directory_permission": "0777",
                "file_permission": "0777",
                "filename": "/root/riddler",
                "id": "4a99c9eed6c660f5874cc2505558d5abf940a498",
                "sensitive_content": null,
                "source": null
              }
            }
          ]
        },
        {
          "mode": "managed",
          "type": "local_file",
          "name": "speed_force",
          "provider": "provider[\"registry.terraform.io/hashicorp/local\"]",
          "instances": [
            {
              "schema_version": 0,
              "attributes": {
                "content": "speed-force",
                "content_base64": null,
                "content_base64sha256": "+hI5F86aVJG7nQ6K0VEOJHTIhlj5aRLnpODNbyZExtI=",
                "content_base64sha512": "COfaah4Goo2T1qerQ8gYg5uR6onGpW1IjlpCtZuOW3UT+MH0rzPSj/LSKTJHHCfYVL0w3Q0B78u8RsRpueUNqg==",
                "content_md5": "b5db1e5be7170beefea11ae7271a06a8",
                "content_sha1": "ebeb8b595c8eb4a6e81cacf244146e742fab2981",
                "content_sha256": "fa123917ce9a5491bb9d0e8ad1510e2474c88658f96912e7a4e0cd6f2644c6d2",
                "content_sha512": "08e7da6a1e06a28d93d6a7ab43c818839b91ea89c6a56d488e5a42b59b8e5b7513f8c1f4af33d28ff2d22932471c27d854bd30dd0d01efcbbc46c469b9e50daa",
                "directory_permission": "0777",
                "file_permission": "0777",
                "filename": "/root/speed-force",
                "id": "ebeb8b595c8eb4a6e81cacf244146e742fab2981",
                "sensitive_content": null,
                "source": null
              }
            }
          ]
        },
        {
          "mode": "managed",
          "type": "local_file",
          "name": "zoom",
          "provider": "provider[\"registry.terraform.io/hashicorp/local\"]",
          "instances": [
            {
              "schema_version": 0,
              "attributes": {
                "content": "zoom",
                "content_base64": null,
                "content_base64sha256": "0hu1N3JdYD7i2635w9Hikaa3rtIV02o05YoaOw2qUIQ=",
                "content_base64sha512": "3Y2YQB1BY5V4oYMn3EG3BuLyLFtEZINT1DQ+37JtqKgecw0RXR4hvh4dfrMJNcD0jYgwfh1k64noe1NNjLZx8w==",
                "content_md5": "15913c103a5238e5a80ac2f498ee090d",
                "content_sha1": "92298812107bb17eff1b85e15547ae13b6fee3a1",
                "content_sha256": "d21bb537725d603ee2dbadf9c3d1e291a6b7aed215d36a34e58a1a3b0daa5084",
                "content_sha512": "dd8d98401d41639578a18327dc41b706e2f22c5b44648353d4343edfb26da8a81e730d115d1e21be1e1d7eb30935c0f48d88307e1d64eb89e87b534d8cb671f3",
                "directory_permission": "0777",
                "file_permission": "0777",
                "filename": "/root/zoom",
                "id": "92298812107bb17eff1b85e15547ae13b6fee3a1",
                "sensitive_content": null,
                "source": null
              }
            }
          ]
        }
      ]
    }
    ```

12. We will soon be working with `AWS` services and deploying resources on `AWS` with `Terraform`!

    OK

# Working with Terraform



## LAB: TERRAFORM COMMANDS

1. Which command can be used to create a visual representation of our `terraform` resources?

   - terraform map
   - **terraform graph**
   - terraform console
   - terraform view
   - terraform flow

2. We have created a configuration directory `/root/terraform-projects/project-shazam`. The configuration file inside will be used to create an `RSA` type private key and then a `certificate signing request` or a `csr` using this key.

   However, there is an error with the configuration.

   Use the `terraform validate` command, troubleshoot, and fix the issue.

   You don't have to create the resources yet! You only need to fix the errors reported by `terraform validate`.

   Check

   - validation working ?

   ```
   $ terraform validate
   
   Error: Unsupported argument
   
     on main.tf line 8, in resource "tls_private_key" "private_key":
      8:   dsa_bits  = 2048
   
   An argument named "dsa_bits" is not expected here. Did you mean "rsa_bits"?
   ```

   The argument called `dsa_bits` in the resource block for creating the private key is incorrect. For `RSA` algorithm, the correct argument to use is `rsa_bits`.

   main.tf

   ```
   resource "local_file" "key_data" {
           filename       = "/tmp/.pki/private_key.pem"
           content = tls_private_key.private_key.private_key_pem
           file_permission =  "0400"
   }
   resource "tls_private_key" "private_key" {
     algorithm   = "RSA"
     rsa_bits  = 2048
     ecdsa_curve = "P384"
   }
   resource "tls_cert_request" "csr" {
     private_key_pem = file("/tmp/.pki/private_key.pem")
     depends_on = [ local_file.key_data ]
   
     subject {
       common_name  = "flexit.com"
       organization = "FlexIT Consulting Services"
     }
   }
   ```

   ```
   $ terraform validate
   Success! The configuration is valid.
   ```

3. Great! If you completed the previous question correctly, `terraform validate` should have passed!
   Now run `terraform plan` and generate a configuration plan.

   Did it work?

   - NO
   - **YES**

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
   
     # local_file.key_data will be created
     + resource "local_file" "key_data" {
         + content              = (known after apply)
         + content_base64sha256 = (known after apply)
         + content_base64sha512 = (known after apply)
         + content_md5          = (known after apply)
         + content_sha1         = (known after apply)
         + content_sha256       = (known after apply)
         + content_sha512       = (known after apply)
         + directory_permission = "0777"
         + file_permission      = "0400"
         + filename             = "/tmp/.pki/private_key.pem"
         + id                   = (known after apply)
       }
   
     # tls_cert_request.csr will be created
     + resource "tls_cert_request" "csr" {
         + cert_request_pem = (known after apply)
         + id               = (known after apply)
         + key_algorithm    = (known after apply)
   
         + subject {
             + common_name  = "flexit.com"
             + organization = "FlexIT Consulting Services"
           }
       }
   
     # tls_private_key.private_key will be created
     + resource "tls_private_key" "private_key" {
         + algorithm                     = "RSA"
         + ecdsa_curve                   = "P384"
         + id                            = (known after apply)
         + private_key_openssh           = (sensitive value)
         + private_key_pem               = (sensitive value)
         + private_key_pem_pkcs8         = (sensitive value)
         + public_key_fingerprint_md5    = (known after apply)
         + public_key_fingerprint_sha256 = (known after apply)
         + public_key_openssh            = (known after apply)
         + public_key_pem                = (known after apply)
         + rsa_bits                      = 2048
       }
   
   Plan: 3 to add, 0 to change, 0 to destroy.
   
   ------------------------------------------------------------------------
   
   Note: You didn't specify an "-out" parameter to save this plan, so Terraform
   can't guarantee that exactly these actions will be performed if
   "terraform apply" is subsequently run.
   ```

   

4. Now, try creating the resources with a `terraform apply`.

   Did that work?

   - YES
   - NO

   ```
   $ terraform apply
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
     + create
   
   Terraform will perform the following actions:
   
     # local_file.key_data will be created
     + resource "local_file" "key_data" {
         + content              = (known after apply)
         + content_base64sha256 = (known after apply)
         + content_base64sha512 = (known after apply)
         + content_md5          = (known after apply)
         + content_sha1         = (known after apply)
         + content_sha256       = (known after apply)
         + content_sha512       = (known after apply)
         + directory_permission = "0777"
         + file_permission      = "0400"
         + filename             = "/tmp/.pki/private_key.pem"
         + id                   = (known after apply)
       }
   
     # tls_cert_request.csr will be created
     + resource "tls_cert_request" "csr" {
         + cert_request_pem = (known after apply)
         + id               = (known after apply)
         + key_algorithm    = (known after apply)
   
         + subject {
             + common_name  = "flexit.com"
             + organization = "FlexIT Consulting Services"
           }
       }
   
     # tls_private_key.private_key will be created
     + resource "tls_private_key" "private_key" {
         + algorithm                     = "RSA"
         + ecdsa_curve                   = "P384"
         + id                            = (known after apply)
         + private_key_openssh           = (sensitive value)
         + private_key_pem               = (sensitive value)
         + private_key_pem_pkcs8         = (sensitive value)
         + public_key_fingerprint_md5    = (known after apply)
         + public_key_fingerprint_sha256 = (known after apply)
         + public_key_openssh            = (known after apply)
         + public_key_pem                = (known after apply)
         + rsa_bits                      = 2048
       }
   
   Plan: 3 to add, 0 to change, 0 to destroy.
   
   Do you want to perform these actions?
     Terraform will perform the actions described above.
     Only 'yes' will be accepted to approve.
   
     Enter a value: yes
   
   tls_private_key.private_key: Creating...
   tls_private_key.private_key: Creation complete after 0s [id=4169e6e325ef7afafc28eb09d126fba238a1630e]
   local_file.key_data: Creating...
   local_file.key_data: Creation complete after 0s [id=18a09b9e733779d39d6628af9e5f28ed358af16c]
   
   Error: Provider produced inconsistent final plan
   
   When expanding the plan for tls_cert_request.csr to include new values learned
   so far during apply, provider "registry.terraform.io/hashicorp/tls" produced
   an invalid new value for .private_key_pem: inconsistent values for sensitive
   attribute.
   
   This is a bug in the provider, which should be reported in the provider's own
   issue tracker.
   ```

5. The `terraform apply` failed in spite of our validation working! This is because the validate command only carries out a general verification of the configuration. It validated the resource block and the argument syntax but not the `values` the arguments expect for a specific resource!

   OK

6. The error in the configuration is inside the resource block for the `tls_private_key` type resource.
   It contains the configuration that we needed for generating `rsa` type key..

   Inspect the resource block and fix the issue.

   Once done, run `terraform plan and then apply` to created the resources.

   Check

   - Issues fixed and resources created?

   The Algorithm used by the `tls_private_key` is `RSA` but the configuration also mentions `ecdsa_curve` argument.

   main.tf

   ```
   resource "local_file" "key_data" {
           filename       = "/tmp/.pki/private_key.pem"
           content = tls_private_key.private_key.private_key_pem
           file_permission =  "0400"
   }
   resource "tls_private_key" "private_key" {
     algorithm   = "RSA"
     rsa_bits  = 2048
   }
   resource "tls_cert_request" "csr" {
     private_key_pem = file("/tmp/.pki/private_key.pem")
     depends_on = [ local_file.key_data ]
   
     subject {
       common_name  = "flexit.com"
       organization = "FlexIT Consulting Services"
     }
   }
   ```

7. Now format the `main.tf` file into a canonical format.

   Check

   - Syntax Check

   ```
   $ terraform fmt
   main.tf
   ```

   main.tf

   ```
   resource "local_file" "key_data" {
     filename        = "/tmp/.pki/private_key.pem"
     content         = tls_private_key.private_key.private_key_pem
     file_permission = "0400"
   }
   resource "tls_private_key" "private_key" {
     algorithm = "RSA"
     rsa_bits  = 2048
   }
   resource "tls_cert_request" "csr" {
     private_key_pem = file("/tmp/.pki/private_key.pem")
     depends_on      = [local_file.key_data]
   
     subject {
       common_name  = "flexit.com"
       organization = "FlexIT Consulting Services"
     }
   }
   ```

8. Now, navigate to the directory `/root/terraform-projects/project-a`. We have already created the resources specified in this configuration.

   Fetch details from the state file and identify the value of the `filename` argument.

   Note: Do not rely on the current value in the configuration file.

   - filename = "/var/codes"
   - filename = "/opt/log"
   - filename = "/tmp/apps"
   - **filename = "/root/codes"**

   Use the `terraform show` command to inspect the `terraform.tfstate` file.

   data.tf

   ```
   resource "local_file" "data" {
   	  filename = "/opt/codes"
   	  content = "You've to write this code."
   ```

   ```
   $ terraform show
   # local_file.data:
   resource "local_file" "data" {
       content              = "You've to write this code."
       content_base64sha256 = "FZy1Bn26UEIGgBj6E/3aMFPPo0z8wmDp4ljqh+WYuWQ="
       content_base64sha512 = "4pC7k3YFVhg+Cu2fo0I5b1/h1JH9HpbFLHG2MFuCEHh5UYsZyWciDm0KkkwBqvlrYxzbYuCq2fuSvH4hV31i5Q=="
       content_md5          = "55403026bfc0ce8205d712ed68891251"
       content_sha1         = "fc307f99d6490d988433ce246d60eb4ca005a87c"
       content_sha256       = "159cb5067dba5042068018fa13fdda3053cfa34cfcc260e9e258ea87e598b964"
       content_sha512       = "e290bb93760556183e0aed9fa342396f5fe1d491fd1e96c52c71b6305b82107879518b19c967220e6d0a924c01aaf96b631cdb62e0aad9fb92bc7e21577d62e5"
       directory_permission = "0777"
       file_permission      = "0777"
       filename             = "/root/codes"
       id                   = "fc307f99d6490d988433ce246d60eb4ca005a87c"
   }
   ```

9. In these `terraform` labs, we have used multiple providers so far. But, what are `providers`?

   - **Plugins**
   - Registry
   - None
   - Protocol

10. Which one is a valid `sub-command` of the `terraform providers` command?

   - list
   - **mirror**
   - update
   - status

   ```
   $ terraform providers --help
   
   Usage: terraform providers [dir]
   
     Prints out a tree of modules in the referenced configuration annotated with
     their provider requirements.
   
     This provides an overview of all of the provider requirements across all
     referenced modules, as an aid to understanding why particular provider
     plugins are needed and why particular versions are selected.
   
   
   Subcommands:
       mirror    Mirrors the provider plugins needed for the current configuration
       schema    Prints the schemas of the providers used in the configuration
   ```

11. A new configuration directory `/root/terraform-projects/provider` has been created. We have already run the `terraform init` command.
    Now check the provider plugins that have been downloaded from the command line utility (instead of inspecting the `.terraform` directory). After that choose the correct option.

    - kubernetes && random
    - azurerm && dns
    - google && helm
    - **local && aws**

    project.tf

    ```
    resource "local_file" "cloud" {
    	   filename = "/tmp/plugins"
    	   content = "multiple cloud providers."
    
    }
    
    resource "aws_ebs_volume" "myvolume" {
      availability_zone = "us-east-2"
      size              = 20
    }
    ```

    ```
    $ terraform providers
    
    Providers required by configuration:
    .
    ├── provider[registry.terraform.io/hashicorp/local]
    └── provider[registry.terraform.io/hashicorp/aws]
    ```



## LAB: LIFECYCLE RULES

1. We have a directory created called `/root/terraform-projects/project-mysterio`. The `main.tf` file already has a couple of resource blocks.

   Which resource types do they use?

   - **local_file && random_string**
   - random_pet && local_file
   - local_file && tls_private_Key
   - random_pet && rls_private_key

   main.tf

   ```
   resource "local_file" "file" {
       filename = var.filename
       file_permission =  var.permission
       content = random_string.string.id
       
   }
   
   resource "random_string" "string" {
       length = var.length
       keepers = {
           length = var.length
       }  
       
   }
   ```

   variables.tf

   ```
   variable "length" {
       default = 10
     
   }
   variable "filename" {
       default = "/root/random_text"
   }
   variable "content" {
       default = "This file contains a single line of data"
   }
   variable "permission" {
       default = 0700
   }
   ```

2. Now, create these two resources that have been defined in this configuration file.

   Check

   - resources created?

   ```
   $ terraform init
   
   $ terraform plan
   
   $ terraform apply
   ```

3. Which resource is created first in this case?

   - file
   - **string**

4. We have modified the resource configuration again. Run a `terraform plan` now. What would happen?

   - resource called string will be replaced
   - neither will be replaced
   - resource called file will be replaced
   - **both resources will be replaced**'

   variables.tf

   ```
   variable "length" {
       default = 12
     
   }
   variable "filename" {
       default = "/root/random_text"
   }
   variable "content" {
       default = "This file contains a single line of data"
   }
   variable "permission" {
       default = 0770
   }
   ```

   ```
   $ terraform plan
   Refreshing Terraform state in-memory prior to plan...
   The refreshed state will be used to calculate this plan, but will not be
   persisted to local or remote state storage.
   
   random_string.string: Refreshing state... [id=(eW8A:oVW3]
   local_file.file: Refreshing state... [id=cf1dba2e2d842e6dda5650074cab3923a611f61b]
   
   ------------------------------------------------------------------------
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
   -/+ destroy and then create replacement
   
   Terraform will perform the following actions:
   
     # local_file.file must be replaced
   -/+ resource "local_file" "file" {
         ~ content              = "(eW8A:oVW3" -> (known after apply) # forces replacement
         ~ content_base64sha256 = "IRdN77C5QwwYaATjlHnIlsICM2BpcxGdmwLHcAk4bNo=" -> (known after apply)
         ~ content_base64sha512 = "fPBzpAqmBNPSqQ2HLEMHu1FS8QLmCxDwbqXnhn1DhXG0voNi5kDpBngJealJSfvtreZGgfEOyYk5tTcbDQmMRw==" -> (known after apply)
         ~ content_md5          = "f3328cf0d864e16e73f661abce9de6af" -> (known after apply)
         ~ content_sha1         = "cf1dba2e2d842e6dda5650074cab3923a611f61b" -> (known after apply)
         ~ content_sha256       = "21174defb0b9430c186804e39479c896c20233606973119d9b02c77009386cda" -> (known after apply)
         ~ content_sha512       = "7cf073a40aa604d3d2a90d872c4307bb5152f102e60b10f06ea5e7867d438571b4be8362e640e906780979a94949fbedade64681f10ec98939b5371b0d098c47" -> (known after apply)
           directory_permission = "0777"
         ~ file_permission      = "700" -> "770" # forces replacement
           filename             = "/root/random_text"
         ~ id                   = "cf1dba2e2d842e6dda5650074cab3923a611f61b" -> (known after apply)
       }
   
     # random_string.string must be replaced
   -/+ resource "random_string" "string" {
         ~ id          = "(eW8A:oVW3" -> (known after apply)
         ~ keepers     = { # forces replacement
             ~ "length" = "10" -> "12"
           }
         ~ length      = 10 -> 12 # forces replacement
           lower       = true
           min_lower   = 0
           min_numeric = 0
           min_special = 0
           min_upper   = 0
           number      = true
           numeric     = true
         ~ result      = "(eW8A:oVW3" -> (known after apply)
           special     = true
           upper       = true
       }
   
   Plan: 2 to add, 0 to change, 2 to destroy.
   
   ------------------------------------------------------------------------
   
   Note: You didn't specify an "-out" parameter to save this plan, so Terraform
   can't guarantee that exactly these actions will be performed if
   "terraform apply" is subsequently run.
   ```

5. Why is the `string` resource being re-created?

   - **The value for the argument called keepers has changed**
   - the resource name was changed
   - the variable name has changed

6. All the resources for the `random` provider can be recreated by using a `map` type argument called `keepers`. A change in the value will force the resource to be recreated.

   This argument accepts arbitrary key/value pairs and in our example, it is set to the key called length whose value was updated from `10` to `12` in the `variables.tf` file.

   Running a `terraform apply` now will destroy the current `random_string` resource and then create a new one with the length that is `12` characters long.

   OK

7. Let's change the order in which the resource called `string` is recreated. Update the configuration so that when applied, a new `random string` is created first before the old one is destroyed.

   When ready, apply the changes with `terraform apply`

   Check

   - Syntax Check

   Update the `main.tf`as shown:

   ```
   resource "local_file" "file" {
       filename = var.filename
       file_permission =  var.permission
       content = random_string.string.id
   
   }
   
   resource "random_string" "string" {
       length = var.length
       keepers = {
           length = var.length
       }  
       lifecycle {
           create_before_destroy =  true
       }
   
   }
   ```

   ```
   $ terraform apply
   random_string.string: Refreshing state... [id=(eW8A:oVW3]
   local_file.file: Refreshing state... [id=cf1dba2e2d842e6dda5650074cab3923a611f61b]
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
   -/+ destroy and then create replacement
   +/- create replacement and then destroy
   
   Terraform will perform the following actions:
   
     # local_file.file must be replaced
   -/+ resource "local_file" "file" {
         ~ content              = "(eW8A:oVW3" -> (known after apply) # forces replacement
         ~ content_base64sha256 = "IRdN77C5QwwYaATjlHnIlsICM2BpcxGdmwLHcAk4bNo=" -> (known after apply)
         ~ content_base64sha512 = "fPBzpAqmBNPSqQ2HLEMHu1FS8QLmCxDwbqXnhn1DhXG0voNi5kDpBngJealJSfvtreZGgfEOyYk5tTcbDQmMRw==" -> (known after apply)
         ~ content_md5          = "f3328cf0d864e16e73f661abce9de6af" -> (known after apply)
         ~ content_sha1         = "cf1dba2e2d842e6dda5650074cab3923a611f61b" -> (known after apply)
         ~ content_sha256       = "21174defb0b9430c186804e39479c896c20233606973119d9b02c77009386cda" -> (known after apply)
         ~ content_sha512       = "7cf073a40aa604d3d2a90d872c4307bb5152f102e60b10f06ea5e7867d438571b4be8362e640e906780979a94949fbedade64681f10ec98939b5371b0d098c47" -> (known after apply)
           directory_permission = "0777"
         ~ file_permission      = "700" -> "770" # forces replacement
           filename             = "/root/random_text"
         ~ id                   = "cf1dba2e2d842e6dda5650074cab3923a611f61b" -> (known after apply)
       }
   
     # random_string.string must be replaced
   +/- resource "random_string" "string" {
         ~ id          = "(eW8A:oVW3" -> (known after apply)
         ~ keepers     = { # forces replacement
             ~ "length" = "10" -> "12"
           }
         ~ length      = 10 -> 12 # forces replacement
           lower       = true
           min_lower   = 0
           min_numeric = 0
           min_special = 0
           min_upper   = 0
           number      = true
           numeric     = true
         ~ result      = "(eW8A:oVW3" -> (known after apply)
           special     = true
           upper       = true
       }
   
   Plan: 2 to add, 0 to change, 2 to destroy.
   
   Do you want to perform these actions?
     Terraform will perform the actions described above.
     Only 'yes' will be accepted to approve.
   
     Enter a value: yes
   
   local_file.file: Destroying... [id=cf1dba2e2d842e6dda5650074cab3923a611f61b]
   local_file.file: Destruction complete after 0s
   random_string.string: Creating...
   random_string.string: Creation complete after 0s [id=2PaIXCzYC}xf]
   local_file.file: Creating...
   local_file.file: Creation complete after 0s [id=a78add2c302a2746ecd5112b978639141d0317d8]
   random_string.string: Destroying... [id=(eW8A:oVW3]
   random_string.string: Destruction complete after 0s
   
   Apply complete! Resources: 2 added, 0 changed, 2 destroyed.
   ```

8. The resource block for the `file` resource has been updated! This will force the resource to be recreated during the next `apply`! But, before that, let's also add a `lifecycle` rule of `create_before_destroy` to this resource block.
   When ready, apply the changes with `terraform apply`

   Important: Once the lifecycle rule has been added, only run the `apply` command *once*. We will learn why soon.

   Check

   - Syntax Check

   The `main.tf` file should be:

   ```
   resource "local_file" "file" {
       filename = var.filename
       file_permission =  var.permission
       content = "This is a random string - ${random_string.string.id}"
       lifecycle {
           create_before_destroy =  true
       }
   
   }
   
   resource "random_string" "string" {
       length = var.length
       keepers = {
           length = var.length
       }
       lifecycle {
           create_before_destroy =  true
       }
   
   }
   ```

   ```
   $ terraform apply
   random_string.string: Refreshing state... [id=2PaIXCzYC}xf]
   local_file.file: Refreshing state... [id=a78add2c302a2746ecd5112b978639141d0317d8]
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
   +/- create replacement and then destroy
   
   Terraform will perform the following actions:
   
     # local_file.file must be replaced
   +/- resource "local_file" "file" {
         ~ content              = "2PaIXCzYC}xf" -> "This is a random string - 2PaIXCzYC}xf" # forces replacement
         ~ content_base64sha256 = "RL7o2H//ybu1tU7UCS8hCmDk5rG0WjjgTjj0VT+ibXg=" -> (known after apply)
         ~ content_base64sha512 = "E0V9fGgOjPbUasFPuYHxQQdQPpdpW+uwjxoW9gT3BRPirhpWqvcXGSoMiN5xLNcyD1t/IRFf1xN21748Lc3PGA==" -> (known after apply)
         ~ content_md5          = "f2c9f9e5fd20cc833b158c53543c18fc" -> (known after apply)
         ~ content_sha1         = "a78add2c302a2746ecd5112b978639141d0317d8" -> (known after apply)
         ~ content_sha256       = "44bee8d87fffc9bbb5b54ed4092f210a60e4e6b1b45a38e04e38f4553fa26d78" -> (known after apply)
         ~ content_sha512       = "13457d7c680e8cf6d46ac14fb981f14107503e97695bebb08f1a16f604f70513e2ae1a56aaf717192a0c88de712cd7320f5b7f21115fd71376d7be3c2dcdcf18" -> (known after apply)
           directory_permission = "0777"
           file_permission      = "770"
           filename             = "/root/random_text"
         ~ id                   = "a78add2c302a2746ecd5112b978639141d0317d8" -> (known after apply)
       }
   
   Plan: 1 to add, 0 to change, 1 to destroy.
   
   Do you want to perform these actions?
     Terraform will perform the actions described above.
     Only 'yes' will be accepted to approve.
   
     Enter a value: yes
   
   local_file.file: Creating...
   local_file.file: Creation complete after 0s [id=3cf9279227e6af3145997610b6e1e2e5838289ef]
   local_file.file: Destroying... [id=a78add2c302a2746ecd5112b978639141d0317d8]
   local_file.file: Destruction complete after 0s
   
   Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
   ```

9. Great! We have now added the `lifecycle` rule and forced the resources to be created first and then destroyed.

   What is the `id` of the `file` resource we just created?

   Run `terraform show` or `terraform state show local_file.file` to find out.

   - **3cf9279227e6af3145997610b6e1e2e5838289ef**
   - fe678f5d15fe678f5d15fe678f5d15
   - 5bf50b4c68073fe678f5d151259b549ae
   - ce5bf50b4c68073fe678f5d151259b549aeb41a9

   ```
   $ terraform state show local_file.file
   # local_file.file:
   resource "local_file" "file" {
       content              = "This is a random string - 2PaIXCzYC}xf"
       content_base64sha256 = "xZUgmLEtGu6xjhsS/IElYN7/YguSr9eXw6OIZgvogfU="
       content_base64sha512 = "T1457CEBc9Ew3T4HDAhAUuA1DSxi5gGHZ+m41meI6kLKGmJqIsOKbiH/pcOSMJiBrfcOICQ1HZc12m2unDaNEw=="
       content_md5          = "a9a95318289acb0fd785d98abc2837dd"
       content_sha1         = "3cf9279227e6af3145997610b6e1e2e5838289ef"
       content_sha256       = "c5952098b12d1aeeb18e1b12fc812560deff620b92afd797c3a388660be881f5"
       content_sha512       = "4f5e39ec210173d130dd3e070c084052e0350d2c62e6018767e9b8d66788ea42ca1a626a22c38a6e21ffa5c392309881adf70e2024351d9735da6dae9c368d13"
       directory_permission = "0777"
       file_permission      = "770"
       filename             = "/root/random_text"
       id                   = "3cf9279227e6af3145997610b6e1e2e5838289ef"
   }
   ```

10. Read the contents of the file `/root/random_text` manually. (Try opening with Visual Studio Code / cat command or a text editor)

   What is the content of this file?

   - **No such file or directory!**
   - This is the updated content
   - This file contains a single line of data
   - This is the new content

11. Where did the file go?!!?

    If you observe the output of the previous apply (scroll up!), you will see that the lifecycle rule we applied caused the local file to the created first and the *same* file to be destroyed during the `recreate` operation.

    This goes to show that it is not always advisable to use this rule!

    In this example, the `filename` argument for the `local_file` resource has to be unique which means that we cannot have two instances of the same file created at the same time!
    The `random_string` resource on the other hand is a logical resource that is only recorded in the state and does not have such a restriction.

    If you run `terraform apply` again, the `file` resource will be `created` as it does not exist currently.

    OK

12. We have now wiped out the resources that were created in this configuration directory and updated the `main.tf` file.
    Now, it only contains a single `random_pet` resource called `super_pet`.

    Under which circumstances will a new `pet id` be created?

    - **Both**
    - change in the length
    - Neither
    - change in the prefix

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
    
      # random_pet.super_pet will be created
      + resource "random_pet" "super_pet" {
          + id        = (known after apply)
          + length    = 10
          + prefix    = "Mr"
          + separator = "-"
        }
    
    Plan: 1 to add, 0 to change, 0 to destroy.
    
    ------------------------------------------------------------------------
    
    Note: You didn't specify an "-out" parameter to save this plan, so Terraform
    can't guarantee that exactly these actions will be performed if
    "terraform apply" is subsequently run.
    ```

13. Now, update the configuration so that the resource `super_pet` is not destroyed under any circumstances with a `terraform apply` command.

    Check

    - Syntax Check

    Add the lifecycle rule in the `main.tf` as shown:

    ```
    resource "random_pet" "super_pet" {
        length = var.length
        prefix = var.prefix
        lifecycle {
          prevent_destroy = true
        }
    }
    ```

    ```
    $ terraform apply
    
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      + create
    
    Terraform will perform the following actions:
    
      # random_pet.super_pet will be created
      + resource "random_pet" "super_pet" {
          + id        = (known after apply)
          + length    = 10
          + prefix    = "Mr"
          + separator = "-"
        }
    
    Plan: 1 to add, 0 to change, 0 to destroy.
    
    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.
    
      Enter a value: yes
    
    random_pet.super_pet: Creating...
    random_pet.super_pet: Creation complete after 0s [id=Mr-heavily-mildly-arguably-possibly-seemingly-early-rapidly-similarly-central-jaguar]
    
    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
    ```



##  LAB: DATASOURCES

1. A `data source` once created, can be used to create, update, and destroy infrastructure?

   True or False?

   - TRUE
   - **FALSE**

2. A `data source` can be created using the `data` block.

   True or False?

   - FALSE
   - **TRUE**

3. A new configuration directory has been created at `/root/terraform-projects/project-lexcorp`. A `data source` block is defined in the `main.tf` file to read the contents of an existing file.

   There is also an output variable that uses reference expression to print the file content using this `data source`. However, there is something wrong!
   Troubleshoot and fix the issue.

   When ready, run `terraform init, plan and apply` to create the datasource. The configuration should print the output variable correctly.

   Check

   - datasource and output variable created correctly?

   main.tf

   ```
   output "os-version" {
     value = data.local_file.content
   }
   datasource "local_file" "os" {
     filename = "/etc/os-release"
   }
   ```

   Solution for `main.tf` :-

   ```
   output "os-version" {
     value = data.local_file.os.content
   }
   data "local_file" "os" {
     filename = "/etc/os-release"
   }
   ```

   ```
   $ terraform apply
   data.local_file.os: Refreshing state...
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
   
   Terraform will perform the following actions:
   
   Plan: 0 to add, 0 to change, 0 to destroy.
   
   Do you want to perform these actions?
     Terraform will perform the actions described above.
     Only 'yes' will be accepted to approve.
   
     Enter a value: yes
   
   
   Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
   
   Outputs:
   
   os-version = NAME="Ubuntu"
   VERSION="18.04.5 LTS (Bionic Beaver)"
   ID=ubuntu
   ID_LIKE=debian
   PRETTY_NAME="Ubuntu 18.04.5 LTS"
   VERSION_ID="18.04"
   HOME_URL="https://www.ubuntu.com/"
   SUPPORT_URL="https://help.ubuntu.com/"
   BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
   PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
   VERSION_CODENAME=bionic
   UBUNTU_CODENAME=bionic
   ```

4. Now let's practice how to work with `data sources` from other providers.

   The next few questions will be based on the `aws` provider.
   Although we have only predominantly worked with `local` and the `random` provider, this exercise will help you learn how to work with different `data sources` using the documentation.

   Don't worry if the configuration blocks and the arguments are unfamiliar. We will cover them in detail in the upcoming section.

   OK

5. We have now created a new configuration file called `ebs.tf` within the same configuration directory we have been working on.

   What is the resource type that we are working with here?

   - gp2_volume
   - **aws_ebs_volume**
   - data
   - gp2

   ebs.tf

   ```
   data "aws_ebs_volume" "gp2_volume" {
     most_recent = true
   
     filter {
       name   = "volume-type"
       values = ["gp2"]
     }
   }
   ```

6. Once this `data source` is created, how do we fetch the `Volume Id` for the resource that is created in `AWS`?

   You may have to look up the documentation for this one. Documentation tab is available at the top right.

   - **volume_id**
   - volume_ID
   - volume_name
   - volume

7. Another file called `s3.tf` has now been created. It too has a `data source` that will be used to read data of an existing `s3` bucket.

   However, there is a mistake in the argument used. What is wrong here?

   You may have to look up the documentation for this one. Documentation tab is available at the top right.

   - resource_type used is incorrect
   - resource name is incorrect
   - datasource cannot be created for aws_s3_bucket
   - **bucket_name is not a valid argument**

   Replace argument "bucket_name" with "bucket"

   s3.tf

   ```
   data "aws_s3_bucket" "selected" {
     bucket_name = "bucket.test.com"
   }
   ```

8. We will get more practice with data sources and AWS resources in the upcoming lectures.

   OK



## LAB: COUNT AND FOR EACH

1. A new configuration directory has been created at `/root/terraform-projects/project-shade`. Inspect it. How many files will be created by this configuration?

   - 2
   - 0
   - **1**
   - 3

   main.tf

   ````
   resource "local_file" "name" {
       filename = "/root/user-data"
       sensitive_content = "password: S3cr3tP@ssw0rd"
     
   }
   ````

2. Now add a `count` argument to create `3` instances of this resource.

   When ready, run `terraform init, plan and apply`

   Check

   - 3 instances of the resource created?

   The `main.tf` file should be updated as provided below:

   ```
   resource "local_file" "name" {
       filename = "/root/user-data"
       sensitive_content = "password: S3cr3tP@ssw0rd"
       count = 3 
   }
   ```

3. The resource `local_file.name` is now created as a:

   - set
   - map
   - array
   - **list**

   Since we used count, the resources are now created as `list`.

4. what is the `id` for the resource element at index 1?

   - b32344cb73c40d126d99b32344cb73c40d126d99
   - 2309878befca64ce2309878befca64ce
   - 9ce62309878befca64ce9ce62309878befca64ce
   - **6b32344cb73c40d126d99ce62309878befca64ce**

   ```
   $ terraform state show local_file.name[1]
   # local_file.name[1]:
   resource "local_file" "name" {
       content_base64sha256 = "UKHUK6B1218hZ3Ol3r+tIk7sp63j47ZUBa/GKbFWJec="
       content_base64sha512 = "5Nozea4bZ8PG2K4iZjQYz9wy6ww6stUoezX4xlJqvml7udlB+d0qtLkMfljB/YLPnL493+paeO28lVUlSp//ng=="
       content_md5          = "fda7d68399be93ab193e02bcaaf1cde3"
       content_sha1         = "6b32344cb73c40d126d99ce62309878befca64ce"
       content_sha256       = "50a1d42ba075db5f216773a5debfad224eeca7ade3e3b65405afc629b15625e7"
       content_sha512       = "e4da3379ae1b67c3c6d8ae22663418cfdc32eb0c3ab2d5287b35f8c6526abe697bb9d941f9dd2ab4b90c7e58c1fd82cf9cbe3ddfea5a78edbc9555254a9fff9e"
       directory_permission = "0777"
       file_permission      = "0777"
       filename             = "/root/user-data"
       id                   = "6b32344cb73c40d126d99ce62309878befca64ce"
       sensitive_content    = (sensitive value)
   }
   ```

   OR

   ```
   $ terraform show
   # local_file.name[0]:
   resource "local_file" "name" {
       content_base64sha256 = "UKHUK6B1218hZ3Ol3r+tIk7sp63j47ZUBa/GKbFWJec="
       content_base64sha512 = "5Nozea4bZ8PG2K4iZjQYz9wy6ww6stUoezX4xlJqvml7udlB+d0qtLkMfljB/YLPnL493+paeO28lVUlSp//ng=="
       content_md5          = "fda7d68399be93ab193e02bcaaf1cde3"
       content_sha1         = "6b32344cb73c40d126d99ce62309878befca64ce"
       content_sha256       = "50a1d42ba075db5f216773a5debfad224eeca7ade3e3b65405afc629b15625e7"
       content_sha512       = "e4da3379ae1b67c3c6d8ae22663418cfdc32eb0c3ab2d5287b35f8c6526abe697bb9d941f9dd2ab4b90c7e58c1fd82cf9cbe3ddfea5a78edbc9555254a9fff9e"
       directory_permission = "0777"
       file_permission      = "0777"
       filename             = "/root/user-data"
       id                   = "6b32344cb73c40d126d99ce62309878befca64ce"
       sensitive_content    = (sensitive value)
   }
   
   # local_file.name[1]:
   resource "local_file" "name" {
       content_base64sha256 = "UKHUK6B1218hZ3Ol3r+tIk7sp63j47ZUBa/GKbFWJec="
       content_base64sha512 = "5Nozea4bZ8PG2K4iZjQYz9wy6ww6stUoezX4xlJqvml7udlB+d0qtLkMfljB/YLPnL493+paeO28lVUlSp//ng=="
       content_md5          = "fda7d68399be93ab193e02bcaaf1cde3"
       content_sha1         = "6b32344cb73c40d126d99ce62309878befca64ce"
       content_sha256       = "50a1d42ba075db5f216773a5debfad224eeca7ade3e3b65405afc629b15625e7"
       content_sha512       = "e4da3379ae1b67c3c6d8ae22663418cfdc32eb0c3ab2d5287b35f8c6526abe697bb9d941f9dd2ab4b90c7e58c1fd82cf9cbe3ddfea5a78edbc9555254a9fff9e"
       directory_permission = "0777"
       file_permission      = "0777"
       filename             = "/root/user-data"
       id                   = "6b32344cb73c40d126d99ce62309878befca64ce"
       sensitive_content    = (sensitive value)
   }
   
   # local_file.name[2]:
   resource "local_file" "name" {
       content_base64sha256 = "UKHUK6B1218hZ3Ol3r+tIk7sp63j47ZUBa/GKbFWJec="
       content_base64sha512 = "5Nozea4bZ8PG2K4iZjQYz9wy6ww6stUoezX4xlJqvml7udlB+d0qtLkMfljB/YLPnL493+paeO28lVUlSp//ng=="
       content_md5          = "fda7d68399be93ab193e02bcaaf1cde3"
       content_sha1         = "6b32344cb73c40d126d99ce62309878befca64ce"
       content_sha256       = "50a1d42ba075db5f216773a5debfad224eeca7ade3e3b65405afc629b15625e7"
       content_sha512       = "e4da3379ae1b67c3c6d8ae22663418cfdc32eb0c3ab2d5287b35f8c6526abe697bb9d941f9dd2ab4b90c7e58c1fd82cf9cbe3ddfea5a78edbc9555254a9fff9e"
       directory_permission = "0777"
       file_permission      = "0777"
       filename             = "/root/user-data"
       id                   = "6b32344cb73c40d126d99ce62309878befca64ce"
       sensitive_content    = (sensitive value)
   }
   ```

5. How many files were actually created when `apply` was run?

   - 3
   - 0
   - 2
   - **1**

6. We have now created a `variables.tf` file in the same configuration directory. Update the `main.tf` file to make use of the list type variable defined for the `filename` argument.
   Use count to loop through all the elements of this list and do not use hard-coded values.

   Use the variable called `content` for the argument called `sensitive_content`.

   Check

   - Syntax Check

   The `main.tf` should be as provided below:

   ```
   resource "local_file" "name" {
       filename = var.users[count.index]
       sensitive_content = var.content
       count = length(var.users)
   
   }
   ```

7. We have reverted back to the `old` configuration file and cleaned up the resources created so far.
   A variable called `users` now has default values added to it.

   What type of variable is it?

   - list
   - map
   - **list(string)**
   - set(string)
   - set

   main.tf

   ```
   resource "local_file" "name" {
       filename = "/root/user-data"
       sensitive_content = "password: S3cr3tP@ssw0rd"
     
   }
   
   ```

   variables.tf

   ```
   variable "users" {
       type = list(string)
       default = [ "/root/user10", "/root/user11", "/root/user12", "/root/user10"]
   }
   variable "content" {
       default = "password: S3cr3tP@ssw0rd"
     
   }
   ```

   

8. Can the same elements in this `list` be used as it is for a `set` instead?

   - **No - There are duplicate elements!**
   - Yes !

9. Let's do the same exercise as before but this time we will make use of the `for_each` meta argument to create the files in this configuration.


   Just like before don't use any hard-coded values.

   Use `for_each` to loop through the list type variable called `users`.

   Use the variable called `content` as the value of the argument `sensitive_content`.

   When ready, run `terraform init, plan and apply`.

   Check

   - Syntax Check

   The `main.tf` should be as provided below:

   ```
   resource "local_file" "name" {
       filename = each.value
       for_each = toset(var.users)
       sensitive_content = var.content
   
   }
   ```

   variables.tf

   ```
   variable "users" {
       type = list(string)
       default = [ "/root/user10", "/root/user11", "/root/user12", "/root/user10"]
   }
   variable "content" {
       default = "password: S3cr3tP@ssw0rd"
     
   }
   ```

10. The resource called `name` is now created as:

    - list
    - **map**
    - list(string)
    - set(string)
    - set

11. The resource address with the filename - `/root/user11` is now represented as:

    - local_file.name[1]
    - **local_file.name["/root/user11"]**
    - local_file.name("/root/user11")
    - local_file.name[/root/user11]
    - local_file.name[0]

    ```
     $ terraform state list
    local_file.name["/root/user10"]
    local_file.name["/root/user11"]
    local_file.name["/root/user12"]
    ```



## LAB: VERSION CONSTRAINTS

1. Navigate to the directory `/root/terraform-projects/omega` where we have added a configuration file. Inspect the file and choose the correct `version` of the provider from the below options:

   - 1.1.0
   - **1.2.2**
   - 1.4.0
   - 1.2.0

   main.tf

   ```
   terraform {
     required_providers {
       local = {
         source  = "hashicorp/local"
         version = "1.2.2"
       }
     }
   }
   
   resource "local_file" "innovation" {
     filename = var.path
     content  = var.message
   }
   ```

   

2. Now, change to the directory `/root/terraform-projects/rotate`. We have already initialized the configuration directory using the `terraform init` command.
   Inspect the `rotation.tf` file and find out the correct `version` of the `provider` plugin that is downloaded.
   Choose the correct `version` from the below options:

   You don't have to create the resources!!

   - **3.47.0**
   - 3.44.0
   - 3.45.0
   - 3.46.0

   ```
   $ ls -l .terraform/plugins/registry.terraform.io/hashicorp/google/
   total 4
   drwxr-xr-x 3 root root 4096 Apr 25 23:31 3.47.0
   ```

3. Which one of the below is not a valid `version` constraint operator?

   - <=
   - ->
   - **==**
   - \>=
   - !=

4. We have been working on a project called `nautilus` under the configuration directory `/root/terraform-projects/nautilus`.
   Due to a version `mismatch`, we don't want to download the `aws` provider version `3.17.0`. Which version constraint can be used to achieve this?

   You can try to add the below options in `nautilus.tf` to verify the correct syntax.

   - version = "=!3.17.0"
   - **version = "!=3.17.0"**
   - version = "*=3.17.0"
   - version = "!3.17.0"

   nautilus.tf

   ```
   terraform {
     required_providers {
       aws = {
         source  = "hashicorp/aws"
         version = ""
       }
     }
   }
   
   resource "aws_ebs_volume" "soft-volume" {
     availability_zone = "us-west-2a"
     size              = 15
     tags = {
       Name = "temporary"
     }
   }
   ```

5. Now, navigate to the directory `/root/terraform-projects/lexicorp` where we have added the configuration files. Inspect the file and find out which `version` of providers will be download.

   If unsure, refer to the documentation. Documentation tab is available at the top right panel.

   - helm 1.3.0 && kubernetes 1.13.1
   - helm 1.3.1 && kubernetes 1.13.2
   - helm 1.3.2 && kubernetes 1.13.0
   - **helm 1.2.4 && kubernetes 1.13.2**

   tectn.tf

   ```
   terraform {
     required_providers {
       k8s = {
         source  = "hashicorp/kubernetes"
         version = "> 1.12.0, != 1.13.1, < 1.13.3 "
       }
   
       helm = {
         source  = "hashicorp/helm"
         version = "~> 1.2.0"
       }
     }
   }
   ```

   ![image-20230426074109657](images/image-20230426074109657-1682466073603-1-1682466079457-3-1682466083513-5.png)

   ![image-20230426074312003](images/image-20230426074312003.png)



# Terraform with AWS



## LAB: AWS CLI AND IAM

1. From this lab onwards, we will be working with `aws` services! In this lab, we will learn how to make use of `aws cli` to explore and deploy `IAM resources` that we learnt in the previous lecture.
   As explained in the Lab Demonstration video, we are making use of localstack as the mocking framework to work with `AWS`.

   This framework is exposed at ``. Hence, throughout this lab, we will be making use of the command option and parameter like this: `--endpoint http://aws:4566`

   OK

2. First, let's explore the `AWS CLI` configuration.
   What is the exact `version` of the CLI installed on the `iac-server`?

   - **aws-cli/2.2.20**
   - aws-cli/1.0.0
   - aws-cli/3.0.0
   - aws-cli/2.0.0

   ```
   $ aws --version
   aws-cli/2.2.20 Python/3.8.8 Linux/5.4.0-1103-gcp exe/x86_64.ubuntu.18 prompt/off
   ```

3. Which `command` should be used to interact with `Identity and Access Management` in `AWS` using the `CLI`?

   If unsure, use the CLI help by running: `aws <command> help`

   - access
   - identiy-and-access
   - **iam**
   - identity

4. Which `subcommand` with `iam` can be used to list all the users created in `aws`?

   If unsure, use the CLI help by running: `aws iam <subcommand> help`

   - user-show
   - user-list
   - **list-users**
   - show-users

5. Now, let's learn how to make use of the mocking framework used in the labs.

   Run: `aws iam list-users`

   Does it work?

   - **NO**
   - YES

   ```
   $ aws iam list-users
   
   An error occurred (InvalidClientTokenId) when calling the ListUsers operation: The security token included in the request is invalid.
   ```

6. This is because, we have not provided the `--endpoint` option.
   Now, run the same command but with the `--endpoint http://aws:4566` as the option, like this:
   `aws --endpoint http://aws:4566 iam list-users`

   OK

7. How many `IAM Users` do you see listed now?

   - **2**
   - 5
   - 3
   - 1
   - 0

   ```
   $ aws --endpoint http://aws:4566  iam list-users
   {
       "Users": [
           {
               "Path": "/",
               "UserName": "jill",
               "UserId": "vkfjaw87hqu94bppod7c",
               "Arn": "arn:aws:iam::000000000000:user/jill",
               "CreateDate": "2023-04-26T02:33:52.519000+00:00"
           },
           {
               "Path": "/",
               "UserName": "jack",
               "UserId": "ed56tzi8wurcbxtsg7sf",
               "Arn": "arn:aws:iam::000000000000:user/jack",
               "CreateDate": "2023-04-26T02:33:53.626000+00:00"
           }
       ]
   }
   ```

8. Now let's add a few more users! To add more users, we need to make use of the `create-user` sub-command.
   However, we also need to pass in a mandatory option with this command for it to work?

   Which option should we use?

   - --username
   - --tags
   - **--user-name**
   - --user

9. Create a new user called `mary` using the `AWS CLI`.

   Make sure to use the `--endpoint http://aws:4566` option with the command.

   Check

   - User created?

   ```
   $ aws --endpoint http://aws:4566 iam create-user --user-name mary
   {
       "User": {
           "Path": "/",
           "UserName": "mary",
           "UserId": "n6pwol5wnpj39t4fxl9v",
           "Arn": "arn:aws:iam::000000000000:user/mary",
           "CreateDate": "2023-04-26T02:48:17.505000+00:00"
       }
   }
   ```

10. Now, inspect the newly created user `mary` and find out its `ARN (Amazon Resource Name)`.

   - "arn:aws:iam::000000000001:user/mary"
   - **"arn:aws:iam::000000000000:user/mary"**
   - "arn:aws:iam::000000000022:user/lucy"
   - "arn:aws:iam::000000000000:user/lucy"

   ```
   $ aws --endpoint http://aws:4566 iam list-users
   {
       "Users": [
           {
               "Path": "/",
               "UserName": "jill",
               "UserId": "vkfjaw87hqu94bppod7c",
               "Arn": "arn:aws:iam::000000000000:user/jill",
               "CreateDate": "2023-04-26T02:33:52.519000+00:00"
           },
           {
               "Path": "/",
               "UserName": "jack",
               "UserId": "ed56tzi8wurcbxtsg7sf",
               "Arn": "arn:aws:iam::000000000000:user/jack",
               "CreateDate": "2023-04-26T02:33:53.626000+00:00"
           },
           {
               "Path": "/",
               "UserName": "mary",
               "UserId": "n6pwol5wnpj39t4fxl9v",
               "Arn": "arn:aws:iam::000000000000:user/mary",
               "CreateDate": "2023-04-26T02:48:17.505000+00:00"
           }
       ]
   }
   ```

11. What is the default region that has been configured for use with the `AWS CLI`?

    - ca-central-1
    - **us-east-1**
    - us-west-1
    - us-east-2

    ```
    $ cat .aws/c
    config       credentials  
    iac-server $ cat .aws/config 
    [default]
    region = us-east-1
    ```

12. What is the `aws_access_key_id` used in the configuration?

    - AKIAI44QH8DHBEXAMPLE
    - AXXBYYCZZ2567
    - **foo**
    - bar

    ```
    $ cat .aws/credentials 
    [default]
    aws_access_key_id = foo
    aws_secret_access_key = bar
    ```

13. What is the value of `aws_secret_access_key` used?

    - je7MtGbClwBF2Zp9Utkh3yCo8nvbEXAMPLEKEY
    - foo
    - je7MtGbClwBF2Zp9Utkh3
    - **bar**

    ```
    $ cat .aws/credentials 
    [default]
    aws_access_key_id = foo
    aws_secret_access_key = bar
    ```

14. Now that we have a few users created, let's grant them privileges.
    Let's start with `mary`, grant her full `administrator` access by making use of the policy called `AdministratorAccess`.

    Make use of the subcommand `attach-user-policy`.
    The `ARN` of the `AdministratorAccess` policy is `arn:aws:iam::aws:policy/AdministratorAccess`.

    Check

    - AdministratorAccess Policy attached to mary ?

    ```
    $ aws --endpoint http://aws:4566 iam attach-user-policy --user-name mary --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
    ```

15. `jack` and `jill` are developers and are part of a project called `project-sapphire`.
    Create a new `IAM Group` called `project-sapphire-developers`.

    Use the subcommand `create-group` to create the group.

    Check

    - Group Created ?

    ```
    $ aws --endpoint http://aws:4566 iam create-group --group-name project-sapphire-developers
    {
        "Group": {
            "Path": "/",
            "GroupName": "project-sapphire-developers",
            "GroupId": "3x5w8a42sqbp73a0ti5r",
            "Arn": "arn:aws:iam::000000000000:group/project-sapphire-developers",
            "CreateDate": "2023-04-26T03:09:29.425000+00:00"
        }
    }
    ```

16. Add the IAM users called `jack` and `jill`, who are developers to the new IAM Group called `project-sapphire-developers`.

    Use the subcommand `add-user-to-group` to add users into the group.

    Check

    - Users added to the Group?

    ```
    $ aws --endpoint http://aws:4566 iam add-user-to-group --user-name jack --group-name project-sapphire-developers
    
    $ aws --endpoint http://aws:4566 iam add-user-to-group --user-name jill --group-name project-sapphire-developers
    ```

17. What privileges are granted for `jack` and `jill` who are part of the group `project-sapphire-developers`?

    Check for their permissions individually and the ones granted to the group.

    - EC2FullAccess
    - AdminstratorAccess
    - S3FullAccess
    - BillingAdministrator
    - **NONE**

    ```
    $ aws --endpoint http://aws:4566 iam list-attached-group-policies --group-name project-sapphire-developers
    {
        "AttachedPolicies": []
    }
    ```

    ```
    $ aws --endpoint http://aws:4566 iam list-attached-user-policies --user-name jack 
    {
        "AttachedPolicies": []
    }
    ```

    ```
    $ aws --endpoint http://aws:4566 iam list-attached-user-policies --user-name jill{
        "AttachedPolicies": []
    }
    ```

18. Both `jack` and `jill` need complete access to the `EC2` service.

    Attach the `AmazonEC2FullAccess` policy with the ARN: `arn:aws:iam::aws:policy/AmazonEC2FullAccess` to the group `project-sapphire-developers`.

    Check

    - AmazonEC2FullAccess Managed Policy added to the group?

    ```
    $ aws --endpoint http://aws:4566 iam attach-group-policy --group-name project-sapphire-developers --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess
    ```





## LAB: IAM WITH TERRAFORM

1. In this lab, we will learn how to deploy AWS resources using `Terraform` with the same mocking service that we use in the `AWS CLI` lab.

   OK

2. Let's start off by creating an `IAM User` called `mary` but this time by making use of Terraform. In the configuration directory `/root/terraform-projects/IAM`, create a file called `iam-user.tf` with the following specifications:


   Resource Type: `aws_iam_user`

   Resource Name: `users`

   Name: `mary`

   Once the file has been created, run `terraform init`.

   Check

   - configuration file created and terraform init run?

   Create a file called `iam-user.tf` and add following contents:

   ```
   resource "aws_iam_user" "users" {
        name = "mary"
   }
   ```

   ```
   $ terraform init
   
   Initializing the backend...
   
   Initializing provider plugins...
   - Finding latest version of hashicorp/aws...
   - Installing hashicorp/aws v4.64.0...
   - Installed hashicorp/aws v4.64.0 (self-signed, key ID 34365D9472D7468F)
   
   Partner and community providers are signed by their developers.
   If you'd like to know more about provider signing, you can read about it here:
   https://www.terraform.io/docs/plugins/signing.html
   
   The following providers do not have any version constraints in configuration,
   so the latest version was installed.
   
   To prevent automatic upgrades to new major versions that may contain breaking
   changes, we recommend adding version constraints in a required_providers block
   in your configuration, with the constraint strings suggested below.
   
   * hashicorp/aws: version = "~> 4.64.0"
   
   Terraform has been successfully initialized!
   
   You may now begin working with Terraform. Try running "terraform plan" to see
   any changes that are required for your infrastructure. All Terraform commands
   should now work.
   
   If you ever set or change modules or backend configuration for Terraform,
   rerun this command to reinitialize your working directory. If you forget, other
   commands will detect it and remind you to do so if necessary.
   ```

3. Great! We now have a configuration file with a simple resource block for creating an IAM User with Terraform!

   Let's check if everything is in order for us to create this resource.

   Run `terraform plan` within this configuration.

   Did that work?

   - **NO**
   - YES

   ```
   $ terraform plan
   Refreshing Terraform state in-memory prior to plan...
   The refreshed state will be used to calculate this plan, but will not be
   persisted to local or remote state storage.
   
   
   ------------------------------------------------------------------------
   
   Error: configuring Terraform AWS Provider: validating provider credentials: retrieving caller identity from STS: operation error STS: GetCallerIdentity, failed to resolve service endpoint, an AWS region is required, but was not found
   
     on <empty> line 0:
     (source code not available)
   ```

4. Why did the previous command fail?

   Inspect the error message.

   - Error in the configuration file
   - Configuration Directory is not initialized
   - Unable to connect to AWS Cloud
   - **Region is not set**

5. Let's do that now. We will add the argument `region` in our provider block called `aws`.

   We can do this via other means as well ( like the ones we saw in the lecture).

   However, we will be making use of the provider block to define additional arguments to make use of the mocking framework. We will see those in the later questions of this lab.

   OK

6. Add a new file called `provider.tf` containing a provider block for `aws`.
   Inside this block add a single argument called `region` with the value `ca-central-1`

   You don't have to run a `terraform plan` or `apply` at this stage.

   Check

   - provider.tf created correctly?

   Create a file `provider.tf` with contents below:

   ```
   provider "aws" {
        region = "ca-central-1"
   
   }
   ```

7. Run a `terraform plan` now. Does it work?

   - YES
   - **NO**

   ```
    $ terraform plan
   Refreshing Terraform state in-memory prior to plan...
   The refreshed state will be used to calculate this plan, but will not be
   persisted to local or remote state storage.
   
   
   ------------------------------------------------------------------------
   
   Error: configuring Terraform AWS Provider: validating provider credentials: retrieving caller identity from STS: operation error STS: GetCallerIdentity, https response error StatusCode: 403, RequestID: 5ff02479-a417-43ad-9185-fe939d9f3b23, api error InvalidClientTokenId: The security token included in the request is invalid.
   
     on provider.tf line 1, in provider "aws":
      1: provider "aws" {
   ```

8. Since we are making use of the mocking framework, the credentials defined using `aws configure` (stored within the file `/root/.aws/credentials`) do not work as it is.

   We have now updated the `provider.tf` file with additional arguments to make it work. Take a look.

   The `endpoint` argument is similar to the one we saw with the `AWS CLI` where we used the `--endpoint http://aws:4566`. Here we have defined it to make it work with the `IAM` service.


   Please note that these additional configurations are not needed when working directly with the AWS Cloud. It is only needed by the lab as it is using an AWS mock framework.

   OK

9. Now, run a `terraform plan` and then a `terraform apply`

   Check

   - IAM User created?

   provider.tf

   ```
   provider "aws" {
     region                      = "us-east-1"
     skip_credentials_validation = true
     skip_requesting_account_id  = true
   
     endpoints {
       iam                       = "http://aws:4566"
     }
   }
   ```

10. Great! We have added one user called `mary`. However, `project_sapphire` has 5 more people who need access to the `AWS` Account!

   Let's use the `count` meta-argument and the new `variables.tf` file created in the configuration directory to create these additional users!

   Inspect the newly created `variables.tf` file and answer the subsequent questions.

   OK

   variables.tf

   ```
   variable "project-sapphire-users" {
        type = list(string)
        default = [ "mary", "jack", "jill", "mack", "buzz", "mater"]
   ```

11. What is the name of the variable that has been added to the `variables.tf` file?

    - mary
    - **project-sapphire-users**
    - buzz
    - jill
    - jack

12. What is the data type used for the variable called `project-sapphire-users`?

    - map
    - list(number)
    - any
    - set
    - **list(string)**

13. Now, update the `iam-user.tf` to make use of the `count` meta-argument to loop through the `project-sapphire-users` variable and create all the users in the list.

    You may want to make use of the `length` function to get the length of the list.

    Check

    - Syntax Check
    - Configuration file uses count expression?
    - All users created?

    Update the `iam-user.tf` with contents as below:

    ```
    resource "aws_iam_user" "users" {
         name = var.project-sapphire-users[count.index]
         count = length(var.project-sapphire-users)
    }
    ```

    ```
    $ terraform plan
    Refreshing Terraform state in-memory prior to plan...
    The refreshed state will be used to calculate this plan, but will not be
    persisted to local or remote state storage.
    
    aws_iam_user.users[0]: Refreshing state... [id=mary]
    
    ------------------------------------------------------------------------
    
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      + create
    
    Terraform will perform the following actions:
    
      # aws_iam_user.users[1] will be created
      + resource "aws_iam_user" "users" {
          + arn           = (known after apply)
          + force_destroy = false
          + id            = (known after apply)
          + name          = "jack"
          + path          = "/"
          + tags_all      = (known after apply)
          + unique_id     = (known after apply)
        }
    
      # aws_iam_user.users[2] will be created
      + resource "aws_iam_user" "users" {
          + arn           = (known after apply)
          + force_destroy = false
          + id            = (known after apply)
          + name          = "jill"
          + path          = "/"
          + tags_all      = (known after apply)
          + unique_id     = (known after apply)
        }
    
      # aws_iam_user.users[3] will be created
      + resource "aws_iam_user" "users" {
          + arn           = (known after apply)
          + force_destroy = false
          + id            = (known after apply)
          + name          = "mack"
          + path          = "/"
          + tags_all      = (known after apply)
          + unique_id     = (known after apply)
        }
    
      # aws_iam_user.users[4] will be created
      + resource "aws_iam_user" "users" {
          + arn           = (known after apply)
          + force_destroy = false
          + id            = (known after apply)
          + name          = "buzz"
          + path          = "/"
          + tags_all      = (known after apply)
          + unique_id     = (known after apply)
        }
    
      # aws_iam_user.users[5] will be created
      + resource "aws_iam_user" "users" {
          + arn           = (known after apply)
          + force_destroy = false
          + id            = (known after apply)
          + name          = "mater"
          + path          = "/"
          + tags_all      = (known after apply)
          + unique_id     = (known after apply)
        }
    
    Plan: 5 to add, 0 to change, 0 to destroy.
    
    ------------------------------------------------------------------------
    
    Note: You didn't specify an "-out" parameter to save this plan, so Terraform
    can't guarantee that exactly these actions will be performed if
    "terraform apply" is subsequently run.
    ```

    ```
    $ terraform apply
    aws_iam_user.users[0]: Refreshing state... [id=mary]
    
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      + create
    
    Terraform will perform the following actions:
    
      # aws_iam_user.users[1] will be created
      + resource "aws_iam_user" "users" {
          + arn           = (known after apply)
          + force_destroy = false
          + id            = (known after apply)
          + name          = "jack"
          + path          = "/"
          + tags_all      = (known after apply)
          + unique_id     = (known after apply)
        }
    
      # aws_iam_user.users[2] will be created
      + resource "aws_iam_user" "users" {
          + arn           = (known after apply)
          + force_destroy = false
          + id            = (known after apply)
          + name          = "jill"
          + path          = "/"
          + tags_all      = (known after apply)
          + unique_id     = (known after apply)
        }
    
      # aws_iam_user.users[3] will be created
      + resource "aws_iam_user" "users" {
          + arn           = (known after apply)
          + force_destroy = false
          + id            = (known after apply)
          + name          = "mack"
          + path          = "/"
          + tags_all      = (known after apply)
          + unique_id     = (known after apply)
        }
    
      # aws_iam_user.users[4] will be created
      + resource "aws_iam_user" "users" {
          + arn           = (known after apply)
          + force_destroy = false
          + id            = (known after apply)
          + name          = "buzz"
          + path          = "/"
          + tags_all      = (known after apply)
          + unique_id     = (known after apply)
        }
    
      # aws_iam_user.users[5] will be created
      + resource "aws_iam_user" "users" {
          + arn           = (known after apply)
          + force_destroy = false
          + id            = (known after apply)
          + name          = "mater"
          + path          = "/"
          + tags_all      = (known after apply)
          + unique_id     = (known after apply)
        }
    
    Plan: 5 to add, 0 to change, 0 to destroy.
    
    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.
    
      Enter a value: yes
    
    aws_iam_user.users[3]: Creating...
    aws_iam_user.users[2]: Creating...
    aws_iam_user.users[4]: Creating...
    aws_iam_user.users[1]: Creating...
    aws_iam_user.users[5]: Creating...
    aws_iam_user.users[1]: Creation complete after 0s [id=jack]
    aws_iam_user.users[2]: Creation complete after 0s [id=jill]
    aws_iam_user.users[3]: Creation complete after 0s [id=mack]
    aws_iam_user.users[4]: Creation complete after 0s [id=buzz]
    aws_iam_user.users[5]: Creation complete after 0s [id=mater]
    
    Apply complete! Resources: 5 added, 0 changed, 0 destroyed.
    ```



## LAB: S3

1. In this lab, we will work on `configuration directories` that have been created under `/root/terraform-projects/S3-Buckets`.

   OK

2. Let's first inspect the `configuration files` in the directory called `MCU`.

   What is the `AWS region` configured for use in the provider block? (Assuming we do not pass in additional variables during command execution)

   - us-west-2
   - **us-east-1**
   - us-west-1
   - ca-central-1

   terraform.tfvars

   ```
   region = "us-east-1"
   ```

3. There is a resource block configured in the `main.tf` file in this configuration directory. What is the `resource name` that will be provisioned when we run `terraform apply`?

   - mcu-202011121359
   - MCU
   - aws_s3_bucket
   - **marvel-cinematic-universe**

   main.tf

   ```
   resource "aws_s3_bucket" "marvel-cinematic-universe" {
     bucket = "mcu-202011121359"
   
   }
   
   ```

4. What is the current state of this `configuration` directory?

   - Directory Initialized
   - Directory is not initialized
   - **Resources provisioned**
   - Resource not provisioned

5. What is the name of the `s3 bucket` that has been created by this configuration?

   - marvel-cinematic-universe
   - aws_s3_bucket.marvel-cinematic-universe.mcu-202011121359
   - **mcu-202011121359**
   - mcu-202011122340

   ```
   $ terraform show
   # aws_s3_bucket.marvel-cinematic-universe:
   resource "aws_s3_bucket" "marvel-cinematic-universe" {
       arn                         = "arn:aws:s3:::mcu-202011121359"
       bucket                      = "mcu-202011121359"
       bucket_domain_name          = "mcu-202011121359.s3.amazonaws.com"
       bucket_regional_domain_name = "mcu-202011121359.s3.amazonaws.com"
       force_destroy               = false
       hosted_zone_id              = "Z3AQBSTGFYJSTF"
       id                          = "mcu-202011121359"
       object_lock_enabled         = false
       region                      = "us-east-1"
       request_payer               = "BucketOwner"
       tags                        = {}
       tags_all                    = {}
   
       grant {
           id          = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a"
           permissions = [
               "FULL_CONTROL",
           ]
           type        = "CanonicalUser"
       }
   
       versioning {
           enabled    = false
           mfa_delete = false
       }
   }
   ```

6. What is the DNS domain name that is created for this bucket?

   - marvel-cinematic-universe.amazonaws.com
   - mcu-202011121359.ca-central-1.amazonaws.com
   - **mcu-202011121359.s3.amazonaws.com**
   - arn:aws:s3:::mcu-202011121359

   Run `terraform show` inside this configuration directory and inspect the attribute called `bucket_domain_name`.

   ```
   $ terraform show
   # aws_s3_bucket.marvel-cinematic-universe:
   resource "aws_s3_bucket" "marvel-cinematic-universe" {
       arn                         = "arn:aws:s3:::mcu-202011121359"
       bucket                      = "mcu-202011121359"
       bucket_domain_name          = "mcu-202011121359.s3.amazonaws.com"
       bucket_regional_domain_name = "mcu-202011121359.s3.amazonaws.com"
       force_destroy               = false
       hosted_zone_id              = "Z3AQBSTGFYJSTF"
       id                          = "mcu-202011121359"
       object_lock_enabled         = false
       region                      = "us-east-1"
       request_payer               = "BucketOwner"
       tags                        = {}
       tags_all                    = {}
   
       grant {
           id          = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a"
           permissions = [
               "FULL_CONTROL",
           ]
           type        = "CanonicalUser"
       }
   
       versioning {
           enabled    = false
           mfa_delete = false
       }
   }
   ```

7. Now, let's move on and work on a different configuration directory called `DC`.

   OK

8. The `main.tf` file is empty. Use it to create a new S3 with the following specifications:
   resource name: `dc_bucket`
   bucket name: `dc_is_better_than_marvel`

   Once the resource block is complete, run a `terraform init, plan and apply` to try and create the bucket.

   If unsure, refer to the documentation. The documentation tab is available at the top right panel.

   (it's ok if you get an error! Move on to the next question!)

   Check

   - Resource block created as per the specifications?
   - terraform init, plan and apply run?

   Solution for `main.tf` :-

   ```
   resource "aws_s3_bucket" "dc_bucket" {
     bucket = "dc_is_better_than_marvel"
     }
   ```

9. Why did the `terraform apply` command fail?

   - ACL should not be public-read-write
   - Incorrect Arguments used
   - **Invalid Bucket Name**
   - Syntax error in the resource block

   ```
   $ terraform apply
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
     + create
   
   Terraform will perform the following actions:
   
     # aws_s3_bucket.dc_bucket will be created
     + resource "aws_s3_bucket" "dc_bucket" {
         + acceleration_status         = (known after apply)
         + acl                         = (known after apply)
         + arn                         = (known after apply)
         + bucket                      = "dc_is_better_than_marvel"
         + bucket_domain_name          = (known after apply)
         + bucket_regional_domain_name = (known after apply)
         + force_destroy               = false
         + hosted_zone_id              = (known after apply)
         + id                          = (known after apply)
         + object_lock_enabled         = (known after apply)
         + policy                      = (known after apply)
         + region                      = (known after apply)
         + request_payer               = (known after apply)
         + tags_all                    = (known after apply)
         + website_domain              = (known after apply)
         + website_endpoint            = (known after apply)
   
         + cors_rule {
             + allowed_headers = (known after apply)
             + allowed_methods = (known after apply)
             + allowed_origins = (known after apply)
             + expose_headers  = (known after apply)
             + max_age_seconds = (known after apply)
           }
   
         + grant {
             + id          = (known after apply)
             + permissions = (known after apply)
             + type        = (known after apply)
             + uri         = (known after apply)
           }
   
         + lifecycle_rule {
             + abort_incomplete_multipart_upload_days = (known after apply)
             + enabled                                = (known after apply)
             + id                                     = (known after apply)
             + prefix                                 = (known after apply)
             + tags                                   = (known after apply)
   
             + expiration {
                 + date                         = (known after apply)
                 + days                         = (known after apply)
                 + expired_object_delete_marker = (known after apply)
               }
   
             + noncurrent_version_expiration {
                 + days = (known after apply)
               }
   
             + noncurrent_version_transition {
                 + days          = (known after apply)
                 + storage_class = (known after apply)
               }
   
             + transition {
                 + date          = (known after apply)
                 + days          = (known after apply)
                 + storage_class = (known after apply)
               }
           }
   
         + logging {
             + target_bucket = (known after apply)
             + target_prefix = (known after apply)
           }
   
         + object_lock_configuration {
             + object_lock_enabled = (known after apply)
   
             + rule {
                 + default_retention {
                     + days  = (known after apply)
                     + mode  = (known after apply)
                     + years = (known after apply)
                   }
               }
           }
   
         + replication_configuration {
             + role = (known after apply)
   
             + rules {
                 + delete_marker_replication_status = (known after apply)
                 + id                               = (known after apply)
                 + prefix                           = (known after apply)
                 + priority                         = (known after apply)
                 + status                           = (known after apply)
   
                 + destination {
                     + account_id         = (known after apply)
                     + bucket             = (known after apply)
                     + replica_kms_key_id = (known after apply)
                     + storage_class      = (known after apply)
   
                     + access_control_translation {
                         + owner = (known after apply)
                       }
   
                     + metrics {
                         + minutes = (known after apply)
                         + status  = (known after apply)
                       }
   
                     + replication_time {
                         + minutes = (known after apply)
                         + status  = (known after apply)
                       }
                   }
   
                 + filter {
                     + prefix = (known after apply)
                     + tags   = (known after apply)
                   }
   
                 + source_selection_criteria {
                     + sse_kms_encrypted_objects {
                         + enabled = (known after apply)
                       }
                   }
               }
           }
   
         + server_side_encryption_configuration {
             + rule {
                 + bucket_key_enabled = (known after apply)
   
                 + apply_server_side_encryption_by_default {
                     + kms_master_key_id = (known after apply)
                     + sse_algorithm     = (known after apply)
                   }
               }
           }
   
         + versioning {
             + enabled    = (known after apply)
             + mfa_delete = (known after apply)
           }
   
         + website {
             + error_document           = (known after apply)
             + index_document           = (known after apply)
             + redirect_all_requests_to = (known after apply)
             + routing_rules            = (known after apply)
           }
       }
   
   Plan: 1 to add, 0 to change, 0 to destroy.
   
   Do you want to perform these actions?
     Terraform will perform the actions described above.
     Only 'yes' will be accepted to approve.
   
     Enter a value: yes
   
   aws_s3_bucket.dc_bucket: Creating...
   
   Error: error creating S3 Bucket (dc_is_better_than_marvel): InvalidBucketName: The specified bucket is not valid.
           status code: 400, request id: 3BCA0C8738E7159C, host id: MzRISOwyjmnup3BCA0C8738E7159C7/JypPGXLh0OVFGcJaaO3KW/hRAqKOpIEEp
   
     on main.tf line 1, in resource "aws_s3_bucket" "dc_bucket":
      1: resource "aws_s3_bucket" "dc_bucket" {
   ```

10. That's right! The `bucket name` we used does not conform to a DNS Name standard as it uses `underscores`.

    OK

11. Let's fix that now and change the bucket name so that it uses `dashes (-)` instead of `underscore(_)`.

    resource name: `dc_bucket`
    bucket name: `dc-is-better-than-marvel`

    Once the resource block is complete, run a `terraform init, plan and apply` to try and create the bucket.

    Check

    - Resource block created as per the new specifications?
    - resource created successfully?

    Solution for `main.tf` :-

    ```
    resource "aws_s3_bucket" "dc_bucket" {
         bucket = "dc-is-better-than-marvel" 
    }
    ```

12. Let's move on to the next `configuration directory` called `Pixar`.
    Same as the directory called `DC`, we have the `provider.tf`, `variables.tf`, `terraform.tfvars` and an empty `main.tf` file that is already created.

    Change directory to `Pixar` and move on to the next question.

    OK

13. We have a file called `woody.jpg` stored at `/root` that has to be uploaded to a bucket called `pixar-studios-2020`. This bucket already exists though and was created using the `AWS CLI`.

    OK

14. Let's do that now and upload this image to the s3 bucket! Update the `main.tf` file with the following specifications:
    Bucket: `pixar-studios-2020`
    Key: `woody.jpg`
    Source: `/root/woody.jpg`

    Once ready, proceed to run `terraform init, plan and apply`.

    Check

    - Syntax Check

    Solution for `main.tf` :-

    ```
    resource "aws_s3_object" "upload" {
      bucket = "pixar-studios-2020"
      key    = "woody.jpg"
      source = "/root/woody.jpg"
    }
    ```



## LAB: DYNAMODB

1. In this lab, we will work with `DynamoDB` tables using `terraform`.

   The configuration directories have been created under `/root/terraform-projects/DynamoDB`.

   OK

2. We have already created a resource block for a `DynamoDB` table inside `/root/terraform-projects/DynamoDB/project-sapphire-user-data/`.

   But something is wrong with this configuration. Try running a `terraform plan or validate` and identify the cause of the failure.

   - Primary Key not Defined
   - **Attribute for Primary Key is Missing**
   - Range Key not Defined
   - Hash Key not Defined

   Refer the resource documentation here: `https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table`

3. That's right! At a minimum, the `Primary Key` should be defined as an `attribute` when creating a `DynamoDB` table.
   In this configuration, we should add the attribute for `UserId` for it to work.

   OK

4. Let's fix that now! Update the `main.tf` file so that it uses an `attribute` for the `Primary/Hash Key`.
   Note that the `UserId` should be a number.

   Once ready, run a `terraform init, plan and apply`.

   Check

   - main.tf created correctly?
   - terraform init, plan and apply run?

   The solution to update `main.tf` is provided below:

   ```
   resource "aws_dynamodb_table" "project_sapphire_user_data" {
     name           = "userdata"
     billing_mode   = "PAY_PER_REQUEST"
     hash_key       = "UserId"
   
     attribute {
       name = "UserId"
       type = "N"
     }
   }
   ```

5. Another table has been created using the configuration in the directory `/root/terraform-projects/DynamoDB/project-sapphire-inventory`.

   Navigate to this directory and inspect the configuration.

   OK

6. What is the name of the `DynamoDB` table resource that is created by this configuration?

   - project-sapphire-user-data
   - inventory
   - userdata
   - dynamo_db_table
   - **project_sapphire_inventory**

   main.tf

   ```
   resource "aws_dynamodb_table" "project_sapphire_inventory" {
     name           = "inventory"
     billing_mode   = "PAY_PER_REQUEST"
     hash_key       = "AssetID"
   
     attribute {
       name = "AssetID"
       type = "N"
     }
     attribute {
       name = "AssetName"
       type = "S"
     }
     attribute {
       name = "age"
       type = "N"
     }
     attribute {
       name = "Hardware"
       type = "B"
     }
     global_secondary_index {
       name             = "AssetName"
       hash_key         = "AssetName"
       projection_type    = "ALL"
       
     }
     global_secondary_index {
       name             = "age"
       hash_key         = "age"
       projection_type    = "ALL"
       
     }
     global_secondary_index {
       name             = "Hardware"
       hash_key         = "Hardware"
       projection_type    = "ALL"
       
     }
   }
   ```

7. What is the name of the `DynamoDB Table` that is created this configuration?

   - AssetId
   - **inventory**
   - project_sapphire_inventory
   - project_sapphire_user_data
   - userdata
   - UserId

8. How many attributes are defined in this table currently?

   - **4**
   - 2
   - 1
   - 6

9. What is the name and type of the Primary Key used by this table?

   - Hardware - Boolean
   - AssetName - String
   - **AssetId - Number**
   - AssetId - String

10. Now, let's add an item to this table called `inventory`. Use the following specifications and update the `main.tf` file:

   Resource Name: `upload`

   Table = Use reference expression to the table called `inventory`

   Hash Key = Use reference expression to use the primary key used by the table `inventory`

   Use the below data for item:

   {

   "AssetID": {"N": "1"},

   "AssetName": {"S": "printer"},

   "age": {"N": "5"},

   "Hardware": {"B": "true" }

   }

   when ready, run `terraform init, plan and apply`

   Check

   - item uploaded to the table?

   The updated solution main.tf file:

   ```
   resource "aws_dynamodb_table" "project_sapphire_inventory" {
     name           = "inventory"
     billing_mode   = "PAY_PER_REQUEST"
     hash_key       = "AssetID"
   
     attribute {
       name = "AssetID"
       type = "N"
     }
     attribute {
       name = "AssetName"
       type = "S"
     }
     attribute {
       name = "age"
       type = "N"
     }
     attribute {
       name = "Hardware"
       type = "B"
     }
     global_secondary_index {
       name             = "AssetName"
       hash_key         = "AssetName"
       projection_type    = "ALL"
   
     }
     global_secondary_index {
       name             = "age"
       hash_key         = "age"
       projection_type    = "ALL"
   
     }
     global_secondary_index {
       name             = "Hardware"
       hash_key         = "Hardware"
       projection_type    = "ALL"
   
     }
   }
   resource "aws_dynamodb_table_item" "upload" {
     table_name = aws_dynamodb_table.project_sapphire_inventory.name
     hash_key   = aws_dynamodb_table.project_sapphire_inventory.hash_key
     item = <<EOF
    {
     "AssetID": {"N": "1"},
     "AssetName": {"S": "printer"},
     "age": {"N": "5"},
     "Hardware": {"B": "true" }
   }
   EOF
   }
   ```



# Remote State

## LAB: REMOTE STATE

1. In this lab, we will work with `remote terraform state` files.
   We will first start with the `local` state and then migrate it to `remote` state with an `S3` backend.

   The configuration directory we will work with is `/root/terraform-projects/RemoteState`

   OK

2. First, create a simple configuration to create a `local_file` resource within the directory called `RemoteState`. The resource block should be created inside the `main.tf` file. Follow the below specifications for provisioning this resource:

   Resource Name: `state`

   filename: /root/`<variable local-state>`

   content: "This configuration uses `<variable local-state>` state"

   Use the variable called `local-state` in the `variables.tf` file which is already created for you and make use of `variable interpolation` syntax `${..}`.

   Once the configuration is ready, run a `terraform init, plan and apply`.

   CheckCompleteIncomplete

   - main.tf created correctly?
   - terraform init, plan and apply run?

   Solution for `main.tf` :-

   ```
   resource "local_file" "state" {
     filename = "/root/${var.local-state}"
     content  = "This configuration uses ${var.local-state} state"
   
   }
   ```

3. Has a `state` file been created after you run `terraform apply`?

   - NO
   - **YES**

4. What is the name of the state file created for this configuration?

   - terraform.state
   - **terraform.tfstate**
   - .terraform/plugins/state
   - .terraform

5. Let's now move the `state` to a remote `S3` backend. For this, we will make use of an `S3` compatible storage called `minio`.

   \```Minio` provides an S3-compatible API and allows us to configure the `s3` backend in the same way as the actual S3 service in AWS Cloud.

   To explore `minio` and the S3 bucket that has been created, click on the `Minio Browser` tab on the top of the `terminal` window..

   Use the following credentials to login:

   Access Key: `foofoo`

   Secret Key: `barbarbar`

   **Minio Browser**

   https://30080-port-0529af433e13448b.labs.kodekloud.com/buckets

   OK

6. We have already created an `s3` bucket that we will use to store the `remote state`. From the `Minio Browser`, identify the name of this bucket. (There is only one bucket created as of now)

   - kodekloud-bucket
   - minio-remote-state
   - s3-remote-state-bucket
   - state-bucket
   - **remote-state**

   Click on the `Minio Browser` tab in the `terminal` window and identify the name of the single bucket that is available (Look under the `Buckets` tab).

7. Before we add the configuration for the `s3` backend, let's first change the local file resource. Change the variable used to `remote-state` instead of `local-state`.

   Once done, run `terraform plan and apply`.

   Check

   - s3 backend configuration created correctly?

   Solution for `main.tf` :-

   ```
   resource "local_file" "state" {
     filename = "/root/${var.remote-state}"
     content  = "This configuration uses ${var.remote-state} state"
   
   }
   ```

   variables.tf

   ```
   variable remote-state {
       type = string
       default = "remote"
   }
   variable local-state {
       type = string
       default = "local"
   }
   ```

8. Great! Now, let us configure the remote backend with `s3`. Add a terraform block in a new file called `terraform.tf` with the following arguments:

   bucket: `remote-state`

   key: `terraform.tfstate`

   region: `us-east-1`

   Do not run `terraform init` yet! Since we are making use of `minio` we also have to add a couple of additional arguments to get this to work!
   We will do that in the next step. When using the regular `s3` service from AWS the above arguments should be sufficient to configure remote state.

   Check

   - s3 backend configuration created correctly?

   Backend configuration for `terraform.tf` :-

   ```
   terraform {
     backend "s3" {
       key = "terraform.tfstate"
       region = "us-east-1"
       bucket = "remote-state"
   
     }
   }
   ```

9. To make the `s3` backend with `Minio` to work, we have to add a few additional arguments. The `terraform.tf` file has been updated. Check it out.

   Please note that these arguments are optional and not needed when working with the regular S3 service in AWS.

   OK

   terraform.tf

   ```
   terraform {
     backend "s3" {
       key = "terraform.tfstate"
       region = "us-east-1"
       bucket = "remote-state"
       endpoint = "http://172.16.238.105:9000"
       force_path_style = true
   
   
       skip_credentials_validation = true
   
       skip_metadata_api_check = true
       skip_region_validation = true
     }
   }
   ```

10. Try running `terraform apply`, are you able to do it? If not why?

- Error in backend configuration

   - remote-state bucket does not exist
   - Syntax error in main.tf
   - **Backend reinitialization required**

   ```
   $ terraform apply
   Backend reinitialization required. Please run "terraform init".
   Reason: Initial configuration of the requested backend "s3"
   
   The "backend" is the interface that Terraform uses to store state,
   perform operations, etc. If this message is showing up, it means that the
   Terraform configuration you're using is using a custom configuration for
   the Terraform backend.
   
   Changes to backend configurations require reinitialization. This allows
   Terraform to setup the new configuration, copy existing state, etc. This is
   only done during "terraform init". Please run that command now then try again.
   
   If the change reason above is incorrect, please verify your configuration
   hasn't changed and try again. At this point, no changes to your existing
   configuration or state have been made.
   
   
   Error: Initialization required. Please see the error message above.
   ```

11. Run `terraform init` in our configuration directory now.

    Once done you can proceed to delete the `terraform.tfstate` file from the local directory.

    From the `Minio Browser`, you should now be able to see the state file uploaded to the bucket called `remote-state`.
    Login credentials -
    Access Key: `foofoo`
    Secret Key: `barbarbar`

    Check

    - Syntax Check

    ```
    $ terraform init
    
    Initializing the backend...
    Do you want to copy existing state to the new backend?
      Pre-existing state was found while migrating the previous "local" backend to the
      newly configured "s3" backend. No existing state was found in the newly
      configured "s3" backend. Do you want to copy this state to the new "s3"
      backend? Enter "yes" to copy and "no" to start with an empty state.
    
      Enter a value: yes
    
    
    Successfully configured the backend "s3"! Terraform will automatically
    use this backend unless the backend configuration changes.
    
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



## LAB: TERRAFORM STATE COMMANDS

1. We have created a few resources in the configuration directory `/root/terraform-projects/project-anime`. Inspect it.

   Which of the following resources names are not part of the `terraform state`?

   - **super_pets**
   - top10
   - hall_of_fame
   - classics
   - new_shows

   ```
   $ terraform state list
   local_file.classics
   local_file.hall_of_fame
   local_file.new_shows
   local_file.top10
   ```

   main.tf

   ```
   resource "local_file" "top10" {
       filename = "/root/anime/top10.txt"
       content  = "1. Naruto\n2. DragonBallZ\n3. Death Note\nFullmetal Alchemist\nOne-Punch Man\n"
     
   }
   resource "local_file" "hall_of_fame" {
     filename = "/root/anime/hall-of-fame.txt"
     content = "1.Attack On Titan\n2. Naruto\n3. Bleach\n"
   
   }
   resource "local_file" "new_shows" {
     filename = "/root/anime/new_shows.txt"
     content = "1. Cannon Busters\n2. Last Hope\n3. Lost Song\n"
   
   }
   resource "local_file" "classics" {
     filename = "/root/anime/classic_shows.txt"
     content = "1. DragonBall\n"
   
   }
   
   ```

   

2. Which command would you use to show the attributes of the resource called `classics` stored in the `terraform state`?

   - terraform show classics
   - **terraform state show local_file.classics**
   - terraform list local_file.classics
   - terraform state show classics

   ```
   $ terraform state show local_file.classics
   # local_file.classics:
   resource "local_file" "classics" {
       content              = <<~EOT
           1. DragonBall
       EOT
       content_base64sha256 = "6Ity8EEWB9hY2pJUjJQsdyBi7iDtrqnHg7E0VR9KS4A="
       content_base64sha512 = "lRKrxM4reT5okTZxIy6k/HdgLiXIJ+L1LIr2FUWcLldv44rFq/kOmiB6qOO0ny3Yl6w6C+79BdTy3TLHG0G5fg=="
       content_md5          = "13d46e58bee23e8d0560d9cf3cef8966"
       content_sha1         = "69f539876d8db4e6873466ab5b4d56ebf32667b2"
       content_sha256       = "e88b72f0411607d858da92548c942c772062ee20edaea9c783b134551f4a4b80"
       content_sha512       = "9512abc4ce2b793e68913671232ea4fc77602e25c827e2f52c8af615459c2e576fe38ac5abf90e9a207aa8e3b49f2dd897ac3a0beefd05d4f2dd32c71b41b97e"
       directory_permission = "0777"
       file_permission      = "0777"
       filename             = "/root/anime/classic_shows.txt"
       id                   = "69f539876d8db4e6873466ab5b4d56ebf32667b2"
   }
   ```

3. What is the value of the attribute called `id` that is created for the local file resource called `top10`?

   - "274856702c7d532583e312e12647232"
   - "456274702c7d532583e312e123a216e357222113321f"
   - "9988c5n502c7d532583e312e123a216e35721021f"
   - "a96174702c7d532583e312e123a216e35721021f"

   ```
   $ terraform state show local_file.top10
   # local_file.top10:
   resource "local_file" "top10" {
       content              = <<~EOT
           1. Naruto
           2. DragonBallZ
           3. Death Note
           Fullmetal Alchemist
           One-Punch Man
       EOT
       content_base64sha256 = "E1+CvFzTzYIFBGHKR7PslnAA/Fy5GsdbD0DF32Vvh1c="
       content_base64sha512 = "qhCSaRzN1IBed4NY9elGp28ybdw+zbQD9DCTsQatrrnFtanJP9UgMaj39r4Zq65vHNmAmC1kc4CHvxgw4hiRJQ=="
       content_md5          = "dd34c45437f5a7a0c66835a80ed8c58e"
       content_sha1         = "a96174702c7d532583e312e123a216e35721021f"
       content_sha256       = "135f82bc5cd3cd82050461ca47b3ec967000fc5cb91ac75b0f40c5df656f8757"
       content_sha512       = "aa1092691ccdd4805e778358f5e946a76f326ddc3ecdb403f43093b106adaeb9c5b5a9c93fd52031a8f7f6be19abae6f1cd980982d64738087bf1830e2189125"
       directory_permission = "0777"
       file_permission      = "0777"
       filename             = "/root/anime/top10.txt"
       id                   = "a96174702c7d532583e312e123a216e35721021f"
   }
   ```

4. We no longer wish to manage the file located at `/root/anime/hall-of-fame.txt` by `Terraform`. Remove the resource responsible for this file completely from the management of `terraform`.

   Check

   - Resource removed?

   Remove the resource block called `hall_of_fame` from the `main.tf` and also remove it from the state file by running `terraform state rm local_file.hall_of_fame`.

   ```
   $ terraform state rm local_file.hall_of_fame
   Removed local_file.hall_of_fame
   Successfully removed 1 resource instance(s).
   ```

5. Now navigate to the directory `/root/terraform-projects/super-pets`. Just like the previous configuration directory, we have already created the resource. Inspect the configuration and identify the only resource type used.

   - aws_s3_bucket
   - random_pet
   - tls_private_key
   - aws_dynamodb_table
   - local_file

   Either inspect the `main.tf` file (which contains the configuration) or run `terraform state list` and identify the resource type from the resource address.

   ```
   $ terraform state list
   random_pet.super_pet_1
   random_pet.super_pet_2
   ```

   main.tf

   ```
   resource "random_pet" "super_pet_1" {
       length = var.length1
       prefix = var.prefix1
   }
   resource "random_pet" "super_pet_2" {
       length = var.length2
       prefix = var.prefix2
   }
   ```

6. Within this configuration the `terraform state` commands are working (Try it!) but there is no `terraform.tfstate` file present!

   What is the reason for this behavior?

   - state file is hidden
   - "terraform apply" not run
   - **We are using remote state**
   - State file deleted using "terraform state rm"

   terraform.tf

   ```
   terraform {
     backend "s3" {
       key = "terraform.tfstate"
       region = "us-east-1"
       bucket = "remote-state"
       endpoint = "http://172.16.238.105:9000"
       force_path_style = true
   
   
       skip_credentials_validation = true
   
       skip_metadata_api_check = true
       skip_region_validation = true
     }
   }
   ```

7. What is the `id` of the `random_pet` resource called `super_pet_2` in the state file?

   - Super-kitty
   - **"Wonder-noble-mule"**
   - Ultra-mad-goat
   - Ultra-bull

   Run `terraform state show random_pet.super_pet_2` and inspect the `id`.

   ```
   $ terraform state show random_pet.super_pet_2
   # random_pet.super_pet_2:
   resource "random_pet" "super_pet_2" {
       id        = "Wonder-noble-mule"
       length    = 2
       prefix    = "Wonder"
       separator = "-"
   }
   ```

8. Rename the resource from `super_pet_1` to `ultra_pet`.

   Change the name in the `main.tf` file as well as the state.

   Check

   - Resource renamed?

   Change the name in the `main.tf` and also run `terraform state mv random_pet.super_pet_1 random_pet.ultra_pet`.

   main.tf

   ```
   resource "random_pet" "ultra_pet" {
       length = var.length1
       prefix = var.prefix1
   }
   resource "random_pet" "super_pet_2" {
       length = var.length2
       prefix = var.prefix2
   }
   ```

   ```
   $ terraform state mv random_pet.super_pet_1 random_pet.ultra_pet
   Move "random_pet.super_pet_1" to "random_pet.ultra_pet"
   Successfully moved 1 object(s).
   ```

   ```
   $ terraform state list
   random_pet.super_pet_2
   random_pet.ultra_pet
   ```



# TERRAFORM PROVISIONERS

## LAB: AWS EC2 AND PROVISIONERS

1. Navigate to the directory `/root/terraform-projects/project-cerberus`. We have an empty `main.tf` file in this directory.
   Using this configuration file write a resource block to provision a simple EC2 instance with the following specifications:


   Resource Name: `cerberus`

   AMI: `ami-06178cf087598769c`, use variable named `ami`

   region: `eu-west-2`, use variable named `region`

   Instance Type: `m5.large`, use variable named `instance_type`

   Once ready, run terraform `init, plan and apply` to provision this EC2 instance.

   Check

   - ec2 instance created correctly?

   Solution for `main.tf` :-

   ```
   variable "ami" {
     default = "ami-06178cf087598769c"
   }
   
   variable "instance_type" {
     default = "m5.large"
   }
   
   variable "region" {
     default = "eu-west-2"
   }
   
   resource "aws_instance" "cerberus" {
     ami           = var.ami
     instance_type = var.instance_type
   }
   ```

2. Perfect! The instance has been created by `terraform`. To inspect the details of this instance, you can run `terraform show` command from the configuration directory.

   This will print the resource attributes from the `state` file in a human-readable format.

   OK

3. The AMI ID we have used is an `RHEL 8` image in the `London` region that only accepts SSH-Key based authentication. However, when we created the instance, we did not make use of a key!

   Let's create a new key-pair!

   OK

4. A new SSH key pair has been created in the directory `/root/terraform-projects/project-cerberus/.ssh`.

   The private key is called `cerberus` and the public key is called `cerberus.pub`


   Using the public key, create a new key-pair in `AWS` with the following specifications:

   Resource Name: `cerberus-key`

   key_name: `cerberus`

   Use the `file` functions to read the public key `cerberus.pub`


   When ready, run a `terrafom plan and apply` to create this `key pair`.

   If unsure, refer to the documentation to create a key-pair. Documentation tab is available at the top right.

   Check

   - Syntax Check

   Solution for `main.tf` :-

   ```
   variable "ami" {
     default = "ami-06178cf087598769c"
   }
   variable "instance_type" {
       default = "m5.large"
   
   }
   variable "region" {
     default = "eu-west-2"
   }
   resource "aws_instance" "cerberus" {
       ami = var.ami
       instance_type = var.instance_type
   
   }
   #You can also use variable for key_name
   resource "aws_key_pair" "cerberus-key" {
       key_name = "cerberus"
       public_key = file(".ssh/cerberus.pub")
   }
   ```

5. Let us now configure the `cerberus` resource to make use of this key. Update the resource block to make use of the key called `cerberus`.

   Once the configuration is updated, run a `terraform plan` and `terraform apply`. This will trigger the replacement of the instance with the new one having the **key-pair** created in our previous step.

   Check

   - Syntax Check

   Add an argument called `key_name` with the value `cerberus` :-

   ```
   resource "aws_instance" "cerberus" {
     ami           = var.ami
     instance_type = var.instance_type
     key_name      = "cerberus"
   }
   ```

   main.tf

   ```
   variable "ami" {
     default = "ami-06178cf087598769c"
   }
   
   variable "instance_type" {
     default = "m5.large"
   }
   
   variable "region" {
     default = "eu-west-2"
   }
   
   resource "aws_instance" "cerberus" {
     ami           = var.ami
     instance_type = var.instance_type
     key_name      = "cerberus"
   }
   #You can also use variable for key_name
   resource "aws_key_pair" "cerberus-key" {
       key_name = "cerberus"
       public_key = file(".ssh/cerberus.pub")
   }
   ```

6. Let us now install `nginx` with EC2 instance. To do this, let's make use of the `user_data` argument.

   Using the `file` function again or by making use of the `heredoc` syntax, use the script called `install-nginx.sh` as the value for the `user_data` argument.

   Do not run `terraform apply` yet!

   Check

   - user_data added ?

   Solution for `main.tf` :-

   ```
   variable "ami" {
     default = "ami-06178cf087598769c"
   }
   variable "instance_type" {
       default = "m5.large"
   
   }
   variable "region" {
     default = "eu-west-2"
   }
   resource "aws_instance" "cerberus" {
       ami = var.ami
       instance_type = var.instance_type
       key_name  = "cerberus"
       user_data = file("./install-nginx.sh")
   
   }
   resource "aws_key_pair" "cerberus-key" {
       key_name = "cerberus"
       public_key = file(".ssh/cerberus.pub")
   }
   ```

   install-nginx.sh

   ```
   #!/bin/bash
   sudo yum update -y
   sudo yum install nginx -y
   sudo systemctl start nginx
   ```

   ```
   $ terraform apply
   aws_key_pair.cerberus-key: Refreshing state... [id=cerberus]
   aws_instance.cerberus: Refreshing state... [id=i-10c5d24fe1ded3c4e]
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
     ~ update in-place
   
   Terraform will perform the following actions:
   
     # aws_instance.cerberus will be updated in-place
     ~ resource "aws_instance" "cerberus" {
           ami                          = "ami-06178cf087598769c"
           arn                          = "arn:aws:ec2:eu-west-2::instance/i-10c5d24fe1ded3c4e"
           associate_public_ip_address  = true
           availability_zone            = "eu-west-2a"
           disable_api_termination      = false
           ebs_optimized                = false
           get_password_data            = false
           id                           = "i-10c5d24fe1ded3c4e"
           instance_state               = "running"
           instance_type                = "m5.large"
           ipv6_address_count           = 0
           ipv6_addresses               = []
           key_name                     = "cerberus"
           monitoring                   = false
           primary_network_interface_id = "eni-323a67d4"
           private_dns                  = "ip-10-230-29-42.eu-west-2.compute.internal"
           private_ip                   = "10.230.29.42"
           public_dns                   = "ec2-54-214-167-209.eu-west-2.compute.amazonaws.com"
           public_ip                    = "54.214.167.209"
           secondary_private_ips        = []
           security_groups              = []
           source_dest_check            = true
           subnet_id                    = "subnet-d74a832a"
           tags                         = {}
           tags_all                     = {}
           tenancy                      = "default"
         + user_data                    = "ace853dfcd5deb36a3802184e0347bf471f627ed"
           user_data_replace_on_change  = false
           vpc_security_group_ids       = []
   
           root_block_device {
               delete_on_termination = true
               device_name           = "/dev/sda1"
               encrypted             = false
               iops                  = 0
               tags                  = {}
               throughput            = 0
               volume_id             = "vol-a4fd80e2"
               volume_size           = 8
               volume_type           = "gp2"
           }
       }
   
   Plan: 0 to add, 1 to change, 0 to destroy.
   
   Do you want to perform these actions?
     Terraform will perform the actions described above.
     Only 'yes' will be accepted to approve.
   
     Enter a value: yes
   
   aws_instance.cerberus: Modifying... [id=i-10c5d24fe1ded3c4e]
   aws_instance.cerberus: Still modifying... [id=i-10c5d24fe1ded3c4e, 10s elapsed]
   aws_instance.cerberus: Still modifying... [id=i-10c5d24fe1ded3c4e, 20s elapsed]
   aws_instance.cerberus: Modifications complete after 20s [id=i-10c5d24fe1ded3c4e]
   ```

7. What will happen if we run `terraform apply` now?

   - **current server will be modified, but nginx will not be installed**
   - no changes to be applied
   - nginx will be installed on the current server
   - configuration error
   - current server will be destroyed and nginx will be installed on the new server

8. In this case, an instance will be modified, but nginx will not be installed. It is due to the fact that **User data scripts** only run at `first boot` whereas the instance modification causes a reboot.

   Let's apply the updated configuration in the next step!

   OK

9. Run `terraform apply` and let the EC2 instance be modified.

   Check

   - Syntax Check

   ```
   $ terraform apply
   aws_key_pair.cerberus-key: Refreshing state... [id=cerberus]
   aws_instance.cerberus: Refreshing state... [id=i-10c5d24fe1ded3c4e]
   
   Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
   ```

10. Where should you add a `provisioner` block?

    - Outside the resource block
    - **Nested block inside the resource block**
    - Inside the terraform block
    - Nested block inside the provider block

11. Which of the following provisioners does not need a `connection` block defined?

    - **local-exec**
    - file provisioner
    - remote-exec

    `local-exec` provisioner does not need a connection block as it does not connect to a remote instance to run tasks.

12. What is the `public IPv4` address that has been allocated to this `EC2` instance?

    - 10.234.120.132
    - 1.1.1.1
    - 100.24.6.20
    - 172.17.0.33
    - **54.214.63.136**

    Inspect the output of `terraform show` and lookup the value for `public_ip`.

    ```
    $ terraform show | grep public_ip
        associate_public_ip_address  = true
        public_ip                    = "54.214.63.136"
    ```

13. We use the `public IPv4` address to access this server. However, when this server is rebooted or recreated, this IP address would change.

    To fix this, let's create an `Elastic IP Address`.

    An Elastic IP address is a static IPv4 address which does not change over time.


    Create an `Elastic IP` resource with the following specifications:
    
    1. Resource Name: `eip`
    2. vpc: `true`
    3. instance: id of the `EC2` instance created for resource `cerberus` (use a reference expression)
    4. create a local-exec provisioner for the `eip` resource and use it to print the attribute called `public_dns` to a file `/root/cerberus_public_dns.txt` on the `iac-server`.
    
    If unsure, refer to the documentation. Documentation tab is available at the top right.
    
    Check
    
    - Elastic IP created and associated with EC2?
    
    Solution for `main.tf` :-
    
    ```
    resource "aws_instance" "cerberus" {
      ami           = var.ami
      instance_type = var.instance_type
      user_data     = file("./install-nginx.sh")
    
    }
    resource "aws_key_pair" "cerberus-key" {
      key_name   = "cerberus"
      public_key = file(".ssh/cerberus.pub")
    }
    resource "aws_eip" "eip" {
      vpc      = true
      instance = aws_instance.cerberus.id
      provisioner "local-exec" {
        command = "echo ${aws_eip.eip.public_dns} >> /root/cerberus_public_dns.txt"
      }
    
    }
    variable "ami" {
      default = "ami-06178cf087598769c"
    }
    variable "instance_type" {
      default = "m5.large"
    
    }
    variable "region" {
      default = "eu-west-2"
    }
    ```
    
    ```
    $ terraform apply
    aws_key_pair.cerberus-key: Refreshing state... [id=cerberus]
    aws_instance.cerberus: Refreshing state... [id=i-10c5d24fe1ded3c4e]
    
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      + create
    
    Terraform will perform the following actions:
    
      # aws_eip.eip will be created
      + resource "aws_eip" "eip" {
          + allocation_id        = (known after apply)
          + association_id       = (known after apply)
          + carrier_ip           = (known after apply)
          + customer_owned_ip    = (known after apply)
          + domain               = (known after apply)
          + id                   = (known after apply)
          + instance             = "i-10c5d24fe1ded3c4e"
          + network_border_group = (known after apply)
          + network_interface    = (known after apply)
          + private_dns          = (known after apply)
          + private_ip           = (known after apply)
          + public_dns           = (known after apply)
          + public_ip            = (known after apply)
          + public_ipv4_pool     = (known after apply)
          + tags_all             = (known after apply)
          + vpc                  = true
        }
    
    Plan: 1 to add, 0 to change, 0 to destroy.
    
    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.
    
      Enter a value: yes
    
    aws_eip.eip: Creating...
    aws_eip.eip: Provisioning with 'local-exec'...
    aws_eip.eip (local-exec): Executing: ["/bin/sh" "-c" "echo ec2-127-74-124-172.eu-west-2.compute.amazonaws.com >> /root/cerberus_public_dns.txt"]
    aws_eip.eip: Creation complete after 0s [id=eipalloc-16fc6871]
    
    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
    ```

14. What is the `public` ip address that was created for this `Elastic IP`?

    - 25.36.44.2
    - **127.74.124.172**
    - 100.112.22.54
    - 192.168.1.1
    - 54.34.26.4

    Run: `terraform show` and inspect the public ip for the `eip` resource.

    Or, just inspect the file `/root/cerberus_public_dns.txt`.

    ```
    $ terraform show 
    # aws_eip.eip:
    resource "aws_eip" "eip" {
        allocation_id     = "eipalloc-16fc6871"
        association_id    = "eipassoc-0fd60e00"
        domain            = "vpc"
        id                = "eipalloc-16fc6871"
        instance          = "i-10c5d24fe1ded3c4e"
        network_interface = "eni-323a67d4"
        public_dns        = "ec2-127-74-124-172.eu-west-2.compute.amazonaws.com"
        public_ip         = "127.74.124.172"
        tags_all          = {}
        vpc               = true
    }
    ```

    OR

    cerberus_public_dns.txt

    ```
    ec2-127-74-124-172.eu-west-2.compute.amazonaws.com
    ```

15. In the current configuration, which `dependency` is NOT true?

    - **Resource called eip depends on the resource called cerberus**
    - Resource called cerberus depends on the resource called eip
    - Resource cerberus depends on the cerberus-key



# TERRAFORM IMPORT, TAINTING RESOURCES AND DEBUGGING



## LAB: TAINT AND DEBUGGING

1. Which environment variable should be used to export the logs to a specific path?

   If unsure, refer to the documentation. Documentation tab is available at the top right.

   - VAR_TF_LOG
   - var.TF_LOG
   - **TF_LOG_PATH**
   - TF_LOG

2. Can you export the debug logs from `terraform` just by setting `TF_LOG_PATH` environment variable and providing a path as the value to this variable?

   - **NO**
   - YES

3. We have a configuration directory called `/root/terraform-projects/ProjectA`. Enable logging with the log level set to `ERROR` and then export the logs the path `/tmp/ProjectA.log`.

   Once the environment variables are set, run a `terraform init and apply`.

   It's OK if this results in an error. Do not change any configuration files before you export the logs!

   Check

   - Logs exported?

   Run: `export TF_LOG=ERROR` and `export TF_LOG_PATH=/tmp/ProjectA.log`

   Then run command such as `terraform init; terraform apply` inside the directory called `/root/terraform-projects/ProjectA`

   Main.tf

   ```
   resource "aws_instance" "ProjectA" {
       ami = "ami-0c9bfc21ac5bf10eb"
       instance_type = "t2.large"
     
   }
   ```

   Provider.tf

   ```
   terraform {
     required_providers {
       aws = {
         source = "hashicorp/aws"
         version = "4.15.0"
       }
     }
   }
   
   provider "aws" {
     region                      = "ca-central-1"
     skip_credentials_validation = true
     skip_requesting_account_id  = true
   
     endpoints {
       iam                       = "http://aws:4566"
     }
   }
   ```

   

4. Which Log Level provides the most details when you run `terraform` commands?

   - ERROR
   - **TRACE**
   - LOG_LEVEL=5
   - --v=5
   - WARN

5. Now navigate to `/root/terraform-projects/ProjectB`. We already have a `main.tf` file created for provisioning an `AWS EC2` instance with the tag `Name: projectb_webserver`.

   Run a `terraform init and apply` to provision this instance.

   Check

   - ProjectB webserver created?

   main.tf

   ```
   resource "aws_instance" "ProjectB" {
       ami = "ami-0c9bfc21ac5bf10eb"
       instance_type = "t2.large"
       tags = {
           Name = "projectb_webserver"
           Description = "Oversized Webserver"
       }
     
   }
   ```

   provider.tf

   ```
   terraform {
     required_providers {
       aws = {
         source = "hashicorp/aws"
         version = "4.15.0"
       }
     }
   }
   
   provider "aws" {
     region                      = "ca-central-1"
     skip_credentials_validation = true
     skip_requesting_account_id  = true
   
     endpoints {
       ec2                       = "http://aws:4566"
     }
   }
   ```

   Run: `terraform init` and `terraform apply` from the configuration directory.

6. Now, try running a `terraform plan` again. What is the effect?

   - No Changes
   - **Resource will be replaced**
   - Resource will be destroyed
   - Another EC2 instance will be created

   ```
   $ terraform plan
   Refreshing Terraform state in-memory prior to plan...
   The refreshed state will be used to calculate this plan, but will not be
   persisted to local or remote state storage.
   
   aws_instance.ProjectB: Refreshing state... [id=i-055123d402a8e3a4e]
   
   ------------------------------------------------------------------------
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
   -/+ destroy and then create replacement
   
   Terraform will perform the following actions:
   
     # aws_instance.ProjectB is tainted, so must be replaced
   -/+ resource "aws_instance" "ProjectB" {
   ```

   

7. Why is the resource called `ProjectB` being replaced?

   - ProjectB configuration updated
   - ProjectB instance was manually updated
   - **ProjectB resource is tainted**
   - Provider was updated

8. Untaint the resource called `ProjectB` so that the resource is not replaced any more.

   The resource is currently tainted.

   Check

   - Resource Untainted?

   ```
   $ terraform untaint aws_instance.ProjectB
   Resource instance aws_instance.ProjectB has been successfully untainted.
   ```



## Lab Terrraform import

1. Navigate to the directory `/root/terraform-projects/project-jade`. We have a few resources created using the configuration files.

   Inspect them first.

   OK

   main.tf

   ```
   resource "aws_instance" "ruby" {
     ami           = var.ami
     instance_type = var.instance_type
     for_each      = var.name
     key_name      = var.key_name
     tags = {
       Name = each.value
     }
   }
   output "instances" {
     value = aws_instance.ruby
   }
   ```

   provider.tf

   ```
   terraform {
     required_providers {
       aws = {
         source = "hashicorp/aws"
         version = "4.15.0"
       }
     }
   }
   
   provider "aws" {
     region                      = "us-east-1"
     skip_credentials_validation = true
     skip_requesting_account_id  = true
   
     endpoints {
       ec2 = "http://aws:4566"
     }
   }
   ```

   variables.tf

   ```
   variable "name" {
     type    = set(string)
     default = ["jade-webserver", "jade-lbr", "jade-app1", "jade-agent", "jade-app2"]
   
   }
   variable "ami" {
     default = "ami-0c9bfc21ac5bf10eb"
   }
   variable "instance_type" {
     default = "t2.nano"
   }
   variable "key_name" {
     default = "jade"
   
   }
   ```

   

2. Which of the below resources is not part of this configuration?

   - **EC2 Instance named jade-mw**
   - EC2 Instance named jade-app2
   - EC2 Instance named jade-app1
   - EC2 Instance named jade-lbr
   - EC2 Instance named jade-webserver

   ```
   Run terraform show to see details of all the resources. To see just the list of resources from the state run terraform state list.
   
   You can inspect also inspect the instances created using the terraform output command.
   
   We are making use of for_each expression to create the ec2 instances which creates the resources in the form of a map.
   
   
   This configuration loops through the variable called name and creates 5 ec2 instances.
   The ec2-instance called jade-mw is not created by this configuration.
   ```

   ```
   $ terraform state list
   aws_instance.ruby["jade-agent"]
   aws_instance.ruby["jade-app1"]
   aws_instance.ruby["jade-app2"]
   aws_instance.ruby["jade-lbr"]
   aws_instance.ruby["jade-webserver"]
   ```

3. What is the name of the `ssh key` which is used by all of these instances?

   - **jade**
   - jade.pem
   - jade.pub
   - ruby

   variables.tf

   ```
   variable "name" {
     type    = set(string)
     default = ["jade-webserver", "jade-lbr", "jade-app1", "jade-agent", "jade-app2"]
   
   }
   variable "ami" {
     default = "ami-0c9bfc21ac5bf10eb"
   }
   variable "instance_type" {
     default = "t2.nano"
   }
   variable "key_name" {
     default = "jade"
   
   }
   ```

4. Is the `key pair` resource created by this `terraform` configuration?

   - **NO**
   - YES

   Inspect the configuration files. There is no resource of the type `aws_key_pair` created by the configuration in this directory.

   A better way would be to inspect the resource listed in the state.

   Run: `terraform state list`. This should only list the ec2 instances.

5. That's right, the key called `jade` has been created using the `AWS CLI`.

   The command used to create this key is `aws ec2 create-key-pair --endpoint http://aws:4566 --key-name jade --query 'KeyMaterial' --output text > /root/terraform-projects/project-jade/jade.pem`.
   The private key is created in the same configuration directory we have been working on.

   OK

6. We have another `EC2` instance created called `jade-mw` using the the `AWS CLI`.

   Using the `AWS CLI` inspect this `EC2` instance and find the ID that is created by it.

   Here are some of the specifications of this `EC2` Instance:

   AMI: `ami-082b3eca746b12a89`

   Instance Type: `t2.large`

   Key Name: `jade`

   Remember the syntax to use the `AWS CLI`: aws command sub-command options

   Also make sure to pass in the `--endpoint http://aws:4566` (As we are using the `AWS` test framework. This is not required to interact with actual `EC2` instances)

   - i-07205755ce4370109
   - i-50322383708d02401
   - i-24062383708d01401
   - i-24062383708d01401

   Run the command: `aws ec2 describe-instances --endpoint http://aws:4566`

   Alternatively to just get the `id` of the `EC2` created with this AMI and Instance Type, use filters and `jq` tool to filter the data: -

   ```
   aws ec2 describe-instances --endpoint http://aws:4566 --filters "Name=image-id,Values=ami-082b3eca746b12a89" | jq -r '.Reservations[].Instances[].InstanceId'
   ```

   ```
   $ aws ec2 describe-instances --endpoint http://aws:4566 --filters "Name=image-id,Values=ami-082b3eca746b12a89" | jq -r '.Reservations[].Instances[].InstanceId'
   i-07205755ce4370109
   ```

7. Let's manage this instance called `jade-mw` with `Terraform`! First, create an empty resource block for this instance in the `main.tf` file in the configuration directory `/root/terraform-projects/project-jade`

   Use `jade-mw` as the resource name.

   We will fill in the arguments for this block later.

   Check

   - resource block created?

   The updated config file should be:

   ```
   resource "aws_instance" "ruby" {
     ami           = var.ami
     instance_type = var.instance_type
     for_each      = var.name
     key_name      = var.key_name
     tags = {
       Name = each.value
     }
   }
   output "instances" {
    value = aws_instance.ruby
   }
   resource "aws_instance" "jade-mw" {
   
   }
   ```

8. Now, import this instance into the `terraform state`.

   The resource name should be the same as the one used in the previous question - `jade-mw`

   Check

   - resource imported?

   Run the `terraform import` command: `terraform import aws_instance.jade-mw id-of-the-resource`.

   Where, `id-of-the-resource` is the id of the instance that we determined in the previous question.

   Here is the command to fetch the id of the resource: -

   ```sh
   $ aws ec2 describe-instances --endpoint http://aws:4566 --filters "Name=image-id,Values=ami-082b3eca746b12a89" | jq -r '.Reservations[].Instances[].InstanceId'
   i-07205755ce4370109
   ```

   ```
    $ terraform import aws_instance.jade-mw i-07205755ce4370109aws_instance.jade-mw: Importing from ID "i-07205755ce4370109"...
   aws_instance.jade-mw: Import prepared!
     Prepared aws_instance for import
   aws_instance.jade-mw: Refreshing state... [id=i-07205755ce4370109]
   
   Import successful!
   
   The resources that were imported are shown above. These resources are now in
   your Terraform state and will henceforth be managed by Terraform.
   ```

9. Great! We are nearly there. What would happen if we run `terraform apply`?

   - Resource will be created
   - Resource will be replaced
   - **Error - Resource Arguments not defined**
   - Resource will be destroyed

   If we run `terraform plan or apply` now, we will run into an error as the resource block is incomplete.

   ```
   $ terraform plan
   
   Error: Missing required argument
   
     on main.tf line 13, in resource "aws_instance" "jade-mw":
     13: resource "aws_instance" "jade-mw" {
   
   "ami": one of `ami,launch_template` must be specified
   
   
   Error: Missing required argument
   
     on main.tf line 13, in resource "aws_instance" "jade-mw":
     13: resource "aws_instance" "jade-mw" {
   
   "instance_type": one of `instance_type,launch_template` must be specified
   
   
   Error: Missing required argument
   
     on main.tf line 13, in resource "aws_instance" "jade-mw":
     13: resource "aws_instance" "jade-mw" {
   
   "launch_template": one of `ami,instance_type,launch_template` must be
   specified
   ```

10. Let us fix that now. Complete the resource block for `jade-mw`. Inspect the state to make sure all the arguments used to create this resource are defined in the resource block.

   If unsure, run `terraform apply` after filling in the arguments and correct them until a plan shows no changes to apply.

   Check

   - resource configuration updated?

   You can use the `jq` tool to display the details of a specific resource instance from the `terraform show` command.

   We are doing this for the `jade-mw` instance.

   ```sh
   terraform show -json | jq '.values.root_module.resources[] | select(.type == "aws_instance" and .name == "jade-mw")'
   ```

   Or

   You can check the instance details from the aws cli, also: -

   ```sh
   aws ec2 describe-instances --filters "Name=tag:Name,Values=jade-mw" --query "Reservations[*].Instances[*].[ImageId, InstanceType, KeyName, Tags]" --endpoint http://aws:4566
   ```

   Define the required arguments to create this resource looks like the below: -

   ```sh
   ...
   resource "aws_instance" "jade-mw" {
     ami           = "ami-082b3eca746b12a89"
     instance_type = "t2.large"
     key_name      = "jade"
     tags = {
       Name = "jade-mw"
     }
   ```

   Here `ami` and `instance_type` values could be different in your lab environment.



# Terraform Modules

## LAB: TERRAFORM MODULES

1. A configuration directory has been created at the path `/root/terraform-projects/project-sapphire`. Inspect the `main.tf` file created in this directory and answer the following questions.

   OK

   main.tf

   ```
   module "iam_iam-user" {
     source  = "terraform-aws-modules/iam/aws//modules/iam-user"
     version = "3.4.0"
     # insert the 1 required variable here
   }
   ```

2. Which configuration block is defined in the `main.tf` file at the moment?

   - resource
   - provider
   - variable
   - data
   - terraform
   - **module**
   - provisioner

3. What is the source of the `module` used in this configuration?

   - local module
   - private terraform registry
   - **public terraform registry**

4. What is the version of the module used?

   - 3.0.0
   - 3.2.0
   - 3.3.0
   - **3.4.0**

5. How many `required` arguments does this module expect?

   You may need to look up the documentation to figure this one out.
   Refer: `https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/latest/submodules/iam-user`

   - 5
   - 2
   - 3
   - **1**
   - 4

6. Which `argument` is to be specified, just to create an `IAM User with this module?`

   You may need to look up the documentation to figure this one out.
   Refer: `https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/latest/submodules/iam-user`

   - **name**
   - password_length
   - iam_user_name
   - password_reset_required
   - tags

7. Now, update this module block that will allow it to create an `IAM User` called `max`. Adhere to the following requirements:

   1. Only use the `module` block in the `main.tf` file, do not add a separate `resource` block.

   2. Module Name - `iam_iam-user`

   3. Only add the single `required` argument at this time.

      
      The `provider.tf` and `variables.tf` files have been added to this configuration directory now.

   When ready, run a `terraform init and plan`. You don't have to provision the resources at this moment but you can try should you wish to!

   Check

   - configuration updated and init run?

   The solution is provided below:

   Update the main.tf file:

   ```
   module "iam_iam-user" {
     source  = "terraform-aws-modules/iam/aws//modules/iam-user"
     version = "3.4.0"
     # insert the 1 required variable here
     name = "max"
   }
   ```

   provider.tf

   ```
   terraform {
     required_providers {
       aws = {
         source = "hashicorp/aws"
         version = "4.15.0"
       }
     }
   }
   
   provider "aws" {
     region                      = var.region
     skip_credentials_validation = true
     skip_requesting_account_id  = true
     s3_force_path_style = true
     endpoints {
       iam = "http://aws:4566"
       ec2 = "http://aws:4566"
       s3 = "http://aws:4566"
     }
   }
   ```

   variables.tf

   ```
   variable "region" {
       default = "us-east-1"
   }
   ```

8. How many resources are set to be created in the `execution plan` ?

   Inspect the output of the `terraform plan` command.

   - 1
   - 0
   - 2
   - 5
   - **3**

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
   
     # module.iam_iam-user.aws_iam_access_key.this_no_pgp[0] will be created
     + resource "aws_iam_access_key" "this_no_pgp" {
         + create_date                    = (known after apply)
         + encrypted_secret               = (known after apply)
         + encrypted_ses_smtp_password_v4 = (known after apply)
         + id                             = (known after apply)
         + key_fingerprint                = (known after apply)
         + secret                         = (sensitive value)
         + ses_smtp_password_v4           = (sensitive value)
         + status                         = "Active"
         + user                           = "max"
       }
   
     # module.iam_iam-user.aws_iam_user.this[0] will be created
     + resource "aws_iam_user" "this" {
         + arn           = (known after apply)
         + force_destroy = false
         + id            = (known after apply)
         + name          = "max"
         + path          = "/"
         + tags_all      = (known after apply)
         + unique_id     = (known after apply)
       }
   
     # module.iam_iam-user.aws_iam_user_login_profile.this[0] will be created
     + resource "aws_iam_user_login_profile" "this" {
         + encrypted_password      = (known after apply)
         + id                      = (known after apply)
         + key_fingerprint         = (known after apply)
         + password                = (known after apply)
         + password_length         = 20
         + password_reset_required = true
         + user                    = "max"
       }
   
   Plan: 3 to add, 0 to change, 0 to destroy.
   
   Warning: Argument is deprecated
   
   Use s3_use_path_style instead.
   
   
   ------------------------------------------------------------------------
   
   Note: You didn't specify an "-out" parameter to save this plan, so Terraform
   can't guarantee that exactly these actions will be performed if
   "terraform apply" is subsequently run.
   ```

9. Which resources are set to be created?

   - none
   - aws_iam_user and aws_iam_user_login_profile
   - aws_iam_user
   - **aws_iam_access_key, aws_iam_user and aws_iam_user_login_profile**

10. Why is the module creating additional resources, when only the `name` for creating an `IAM User` was defined in the `main.tf` file?

   Inspect the `Inputs` for this module in the documentation:
   `https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/latest/submodules/iam-user`

   - **the three resources will be created by default as per the module configuration**
   - incorrect module used
   - bug in the module
   - module not available

11. We only want to create the `IAM User`. Update the `module` block to only allow `create_user`. Disable `create_iam_access_key` and `create_iam_user_login_profile`.

    When ready, run the `terraform` workflow to create the resources.

    Check

    - Syntax Check

    The solution is provided below:

    Update the main.tf file as shown

    ```
    module "iam_iam-user" {
      source  = "terraform-aws-modules/iam/aws//modules/iam-user"
      version = "3.4.0"
      # insert the 1 required variable here
      name                          = "max"
      create_iam_user_login_profile = false
      create_iam_access_key         = false
    }
    ```

    ```
    $ terraform apply
    
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      + create
    
    Terraform will perform the following actions:
    
      # module.iam_iam-user.aws_iam_user.this[0] will be created
      + resource "aws_iam_user" "this" {
          + arn           = (known after apply)
          + force_destroy = false
          + id            = (known after apply)
          + name          = "max"
          + path          = "/"
          + tags_all      = (known after apply)
          + unique_id     = (known after apply)
        }
    
    Plan: 1 to add, 0 to change, 0 to destroy.
    
    
    Warning: Argument is deprecated
    
    Use s3_use_path_style instead.
    
    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.
    
      Enter a value: yes
    
    module.iam_iam-user.aws_iam_user.this[0]: Creating...
    module.iam_iam-user.aws_iam_user.this[0]: Creation complete after 1s [id=max]
    
    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
    ```



# TERRAFORM FUNCTIONS AND CONDITIONAL EXPRESSIONS

## LAB: FUNCTIONS AND CONDITIONAL EXPRESSIONS

1. In this lab, we will work on functions. Just like we did in the lecture, make use of the `terraform console` command through this lab to test different functions, and see how they transform and manipulate values.

   OK

2. What value does `floor(10.9)` produce?

   - **10**
   - 10.5
   - 10.9
   - 11

   ```
   $ echo "floor(10.9)" | terraform console
   10
   ```

3. What value does `title("user-generated password file")` produce?

   - user-generated password file
   - User-generated password file
   - User-generated Password File
   - **User-Generated Password File**

   ```
   $ echo 'title("user-generated password file")' | terraform console
   User-Generated Password File
   ```

4. Which type of variable does the function `lookup` working with?

   - string
   - set
   - **map**
   - list
   - tuple

   lookup retrieves the value of a single element from a `map`.

5. Navigate to the configuration directory `/root/terraform-projects/project-sonic`. Here, we have a number of variables declared in the `variables.tf` file.
   What type of variable is `cloud_users`?

   - **string**
   - set
   - map
   - list
   - tuple

   variables.tf

   ```
   variable "region" {
     default = "ca-central-1"
   }
   variable "cloud_users" {
        type = string
        default = "andrew:ken:faraz:mutsumi:peter:steve:braja"
     
   }
   variable "bucket" {
     default = "sonic-media"
     
   }
   
   variable "media" {
     type = set(string)
     default = [ 
       "/media/tails.jpg",
       "/media/eggman.jpg",
       "/media/ultrasonic.jpg",
       "/media/knuckles.jpg",
       "/media/shadow.jpg",
         ]
     
   }
   variable "sf" {
     type = list
     default = [
       "ryu",
       "ken",
       "akuma",
       "seth",
       "zangief",
       "poison",
       "gen",
       "oni",
       "thawk",
       "fang",
       "rashid",
       "birdie",
       "sagat",
       "bison",
       "cammy",
       "chun-li",
       "balrog",
       "cody",
       "rolento",
       "ibuki"
   
     ]
   }
   ```

6. This variable contains the names of the developers for `project-sonic` with the names separated by a `:`.
   Using this variable and the `count` meta-argument, create `IAM` users for all developers. Write the resource block in the `main.tf` file.

   Convert this variable from a `string` to a `list`.
   Do not change the variable defined in `variables.tf`.

   When ready, create the users by running a `terraform init, plan, apply`

   Check

   - Users created as specified?

   The `main.tf` file should be:

   ```
   resource "aws_iam_user" "cloud" {
        name = split(":",var.cloud_users)[count.index]
        count = length(split(":",var.cloud_users))
   
   }
   ```

   variables.tf

   ```
   variable "region" {
     default = "ca-central-1"
   }
   variable "cloud_users" {
        type = string
        default = "andrew:ken:faraz:mutsumi:peter:steve:braja"
     
   }
   variable "bucket" {
     default = "sonic-media"
     
   }
   
   variable "media" {
     type = set(string)
     default = [ 
       "/media/tails.jpg",
       "/media/eggman.jpg",
       "/media/ultrasonic.jpg",
       "/media/knuckles.jpg",
       "/media/shadow.jpg",
         ]
     
   }
   variable "sf" {
     type = list
     default = [
       "ryu",
       "ken",
       "akuma",
       "seth",
       "zangief",
       "poison",
       "gen",
       "oni",
       "thawk",
       "fang",
       "rashid",
       "birdie",
       "sagat",
       "bison",
       "cammy",
       "chun-li",
       "balrog",
       "cody",
       "rolento",
       "ibuki"
   
     ]
   }
   
   ```

   providers.tf

   ```
   terraform {
     required_providers {
       aws = {
         source = "hashicorp/aws"
         version = "4.15.0"
       }
     }
   }
   
   provider "aws" {
     region                      = var.region
     skip_credentials_validation = true
     skip_requesting_account_id  = true
     s3_use_path_style = true
     endpoints {
       ec2 = "http://aws:4566"
       iam = "http://aws:4566"
       s3 = "http://aws:4566"
     }
   }
   
   ```

   ```
   $ terraform apply
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
     + create
   
   Terraform will perform the following actions:
   
     # aws_iam_user.cloud[0] will be created
     + resource "aws_iam_user" "cloud" {
         + arn           = (known after apply)
         + force_destroy = false
         + id            = (known after apply)
         + name          = "andrew"
         + path          = "/"
         + tags_all      = (known after apply)
         + unique_id     = (known after apply)
       }
   
     # aws_iam_user.cloud[1] will be created
     + resource "aws_iam_user" "cloud" {
         + arn           = (known after apply)
         + force_destroy = false
         + id            = (known after apply)
         + name          = "ken"
         + path          = "/"
         + tags_all      = (known after apply)
         + unique_id     = (known after apply)
       }
   
     # aws_iam_user.cloud[2] will be created
     + resource "aws_iam_user" "cloud" {
         + arn           = (known after apply)
         + force_destroy = false
         + id            = (known after apply)
         + name          = "faraz"
         + path          = "/"
         + tags_all      = (known after apply)
         + unique_id     = (known after apply)
       }
   
     # aws_iam_user.cloud[3] will be created
     + resource "aws_iam_user" "cloud" {
         + arn           = (known after apply)
         + force_destroy = false
         + id            = (known after apply)
         + name          = "mutsumi"
         + path          = "/"
         + tags_all      = (known after apply)
         + unique_id     = (known after apply)
       }
   
     # aws_iam_user.cloud[4] will be created
     + resource "aws_iam_user" "cloud" {
         + arn           = (known after apply)
         + force_destroy = false
         + id            = (known after apply)
         + name          = "peter"
         + path          = "/"
         + tags_all      = (known after apply)
         + unique_id     = (known after apply)
       }
   
     # aws_iam_user.cloud[5] will be created
     + resource "aws_iam_user" "cloud" {
         + arn           = (known after apply)
         + force_destroy = false
         + id            = (known after apply)
         + name          = "steve"
         + path          = "/"
         + tags_all      = (known after apply)
         + unique_id     = (known after apply)
       }
   
     # aws_iam_user.cloud[6] will be created
     + resource "aws_iam_user" "cloud" {
         + arn           = (known after apply)
         + force_destroy = false
         + id            = (known after apply)
         + name          = "braja"
         + path          = "/"
         + tags_all      = (known after apply)
         + unique_id     = (known after apply)
       }
   
   Plan: 7 to add, 0 to change, 0 to destroy.
   
   Do you want to perform these actions?
     Terraform will perform the actions described above.
     Only 'yes' will be accepted to approve.
   
     Enter a value: yes
   
   aws_iam_user.cloud[2]: Creating...
   aws_iam_user.cloud[3]: Creating...
   aws_iam_user.cloud[5]: Creating...
   aws_iam_user.cloud[4]: Creating...
   aws_iam_user.cloud[1]: Creating...
   aws_iam_user.cloud[6]: Creating...
   aws_iam_user.cloud[0]: Creating...
   aws_iam_user.cloud[5]: Creation complete after 0s [id=steve]
   aws_iam_user.cloud[1]: Creation complete after 1s [id=ken]
   aws_iam_user.cloud[4]: Creation complete after 1s [id=peter]
   aws_iam_user.cloud[0]: Creation complete after 1s [id=andrew]
   aws_iam_user.cloud[2]: Creation complete after 1s [id=faraz]
   aws_iam_user.cloud[6]: Creation complete after 1s [id=braja]
   aws_iam_user.cloud[3]: Creation complete after 1s [id=mutsumi]
   
   Apply complete! Resources: 7 added, 0 changed, 0 destroyed.
   ```

7. What is the name of the IAM User that is created at the `Index 6`, of the `IAM` User at address `aws_iam_user.cloud` ?

   Use the `terraform console` to find out.

   - matt
   - **braja**
   - kevin
   - fraser
   - andrew

   ```
   $ echo 'aws_iam_user.cloud[6].name' | terraform console
   braja
   ```

8. Locate the index of the element called `oni` in the variable called `sf`.

   - 6
   - 13
   - 4
   - 11
   - 9
   - **7**

   Use terraform console and check `index(var.sf,"oni")` OR to use a one liner:
   `echo "index(var.sf,\"oni\")" | terraform console`

   ```
   $ echo "index(var.sf,\"oni\")" | terraform console
   7
   ```

9. What type is the variable called `media`?

   - list
   - list(strings)
   - **set(string)**
   - set
   - list(numbers)
   - tuple

   Inspect the `variables.tf` file and look at the type argument for `media`.

   variables.tf

   ```
   variable "region" {
     default = "ca-central-1"
   }
   variable "cloud_users" {
        type = string
        default = "andrew:ken:faraz:mutsumi:peter:steve:braja"
     
   }
   variable "bucket" {
     default = "sonic-media"
     
   }
   
   variable "media" {
     type = set(string)
     default = [ 
       "/media/tails.jpg",
       "/media/eggman.jpg",
       "/media/ultrasonic.jpg",
       "/media/knuckles.jpg",
       "/media/shadow.jpg",
         ]
     
   }
   variable "sf" {
     type = list
     default = [
       "ryu",
       "ken",
       "akuma",
       "seth",
       "zangief",
       "poison",
       "gen",
       "oni",
       "thawk",
       "fang",
       "rashid",
       "birdie",
       "sagat",
       "bison",
       "cammy",
       "chun-li",
       "balrog",
       "cody",
       "rolento",
       "ibuki"
   
     ]
   }
   
   ```

10. We have now, updated the `main.tf` in this configuration directory and added a new resource block to create a `S3` bucket called `sonic-media`.

   Create an additional resource called `upload_sonic_media` to upload the files listed in the variable called `media` to this bucket.

   Use the following specifications:

   1. Use the `for_each` meta-argument to upload all the elements of the `media` variable.
   2. bucket: Use reference expression to the bucket `sonic-media`.
   3. source: Each element in the variable called `media`.
   4. key: Should be the name of the files being uploaded (minus the `/root`). For an example, `eggman.jpg, shadow.jpg` e.t.c.

   Do not alter the variables!
   When ready, run `terraform apply` to create the bucket and upload the items.

   Check

   - Bucket created and items uploaded?

   Use substr with the `each.value` expression. Choose `7` as the offset and a length greater than the longest element.

   Update the `main.tf` as shown:

   ```
   resource "aws_iam_user" "cloud" {
        name = split(":",var.cloud_users)[count.index]
        count = length(split(":",var.cloud_users))
   
   }
   resource "aws_s3_bucket" "sonic_media" {
        bucket = var.bucket
   
   }
   resource "aws_s3_object" "upload_sonic_media" {
        bucket = aws_s3_bucket.sonic_media.id
        key =  substr(each.value, 7, 20)
        source = each.value
        for_each = var.media 
   
   }
   ```

   ```
   $ terraform apply
   aws_iam_user.cloud[1]: Refreshing state... [id=ken]
   aws_iam_user.cloud[2]: Refreshing state... [id=faraz]
   aws_iam_user.cloud[5]: Refreshing state... [id=steve]
   aws_iam_user.cloud[0]: Refreshing state... [id=andrew]
   aws_iam_user.cloud[6]: Refreshing state... [id=braja]
   aws_iam_user.cloud[4]: Refreshing state... [id=peter]
   aws_iam_user.cloud[3]: Refreshing state... [id=mutsumi]
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
     + create
   
   Terraform will perform the following actions:
   
     # aws_s3_bucket.sonic_media will be created
     + resource "aws_s3_bucket" "sonic_media" {
         + acceleration_status         = (known after apply)
         + acl                         = (known after apply)
         + arn                         = (known after apply)
         + bucket                      = "sonic-media"
         + bucket_domain_name          = (known after apply)
         + bucket_regional_domain_name = (known after apply)
         + force_destroy               = false
         + hosted_zone_id              = (known after apply)
         + id                          = (known after apply)
         + object_lock_enabled         = (known after apply)
         + policy                      = (known after apply)
         + region                      = (known after apply)
         + request_payer               = (known after apply)
         + tags_all                    = (known after apply)
         + website_domain              = (known after apply)
         + website_endpoint            = (known after apply)
   
         + cors_rule {
             + allowed_headers = (known after apply)
             + allowed_methods = (known after apply)
             + allowed_origins = (known after apply)
             + expose_headers  = (known after apply)
             + max_age_seconds = (known after apply)
           }
   
         + grant {
             + id          = (known after apply)
             + permissions = (known after apply)
             + type        = (known after apply)
             + uri         = (known after apply)
           }
   
         + lifecycle_rule {
             + abort_incomplete_multipart_upload_days = (known after apply)
             + enabled                                = (known after apply)
             + id                                     = (known after apply)
             + prefix                                 = (known after apply)
             + tags                                   = (known after apply)
   
             + expiration {
                 + date                         = (known after apply)
                 + days                         = (known after apply)
                 + expired_object_delete_marker = (known after apply)
               }
   
             + noncurrent_version_expiration {
                 + days = (known after apply)
               }
   
             + noncurrent_version_transition {
                 + days          = (known after apply)
                 + storage_class = (known after apply)
               }
   
             + transition {
                 + date          = (known after apply)
                 + days          = (known after apply)
                 + storage_class = (known after apply)
               }
           }
   
         + logging {
             + target_bucket = (known after apply)
             + target_prefix = (known after apply)
           }
   
         + object_lock_configuration {
             + object_lock_enabled = (known after apply)
   
             + rule {
                 + default_retention {
                     + days  = (known after apply)
                     + mode  = (known after apply)
                     + years = (known after apply)
                   }
               }
           }
   
         + replication_configuration {
             + role = (known after apply)
   
             + rules {
                 + delete_marker_replication_status = (known after apply)
                 + id                               = (known after apply)
                 + prefix                           = (known after apply)
                 + priority                         = (known after apply)
                 + status                           = (known after apply)
   
                 + destination {
                     + account_id         = (known after apply)
                     + bucket             = (known after apply)
                     + replica_kms_key_id = (known after apply)
                     + storage_class      = (known after apply)
   
                     + access_control_translation {
                         + owner = (known after apply)
                       }
   
                     + metrics {
                         + minutes = (known after apply)
                         + status  = (known after apply)
                       }
   
                     + replication_time {
                         + minutes = (known after apply)
                         + status  = (known after apply)
                       }
                   }
   
                 + filter {
                     + prefix = (known after apply)
                     + tags   = (known after apply)
                   }
   
                 + source_selection_criteria {
                     + sse_kms_encrypted_objects {
                         + enabled = (known after apply)
                       }
                   }
               }
           }
   
         + server_side_encryption_configuration {
             + rule {
                 + bucket_key_enabled = (known after apply)
   
                 + apply_server_side_encryption_by_default {
                     + kms_master_key_id = (known after apply)
                     + sse_algorithm     = (known after apply)
                   }
               }
           }
   
         + versioning {
             + enabled    = (known after apply)
             + mfa_delete = (known after apply)
           }
   
         + website {
             + error_document           = (known after apply)
             + index_document           = (known after apply)
             + redirect_all_requests_to = (known after apply)
             + routing_rules            = (known after apply)
           }
       }
   
     # aws_s3_object.upload_sonic_media["/media/eggman.jpg"] will be created
     + resource "aws_s3_object" "upload_sonic_media" {
         + acl                    = "private"
         + bucket                 = (known after apply)
         + bucket_key_enabled     = (known after apply)
         + content_type           = (known after apply)
         + etag                   = (known after apply)
         + force_destroy          = false
         + id                     = (known after apply)
         + key                    = "eggman.jpg"
         + kms_key_id             = (known after apply)
         + server_side_encryption = (known after apply)
         + source                 = "/media/eggman.jpg"
         + storage_class          = (known after apply)
         + tags_all               = (known after apply)
         + version_id             = (known after apply)
       }
   
     # aws_s3_object.upload_sonic_media["/media/knuckles.jpg"] will be created
     + resource "aws_s3_object" "upload_sonic_media" {
         + acl                    = "private"
         + bucket                 = (known after apply)
         + bucket_key_enabled     = (known after apply)
         + content_type           = (known after apply)
         + etag                   = (known after apply)
         + force_destroy          = false
         + id                     = (known after apply)
         + key                    = "knuckles.jpg"
         + kms_key_id             = (known after apply)
         + server_side_encryption = (known after apply)
         + source                 = "/media/knuckles.jpg"
         + storage_class          = (known after apply)
         + tags_all               = (known after apply)
         + version_id             = (known after apply)
       }
   
     # aws_s3_object.upload_sonic_media["/media/shadow.jpg"] will be created
     + resource "aws_s3_object" "upload_sonic_media" {
         + acl                    = "private"
         + bucket                 = (known after apply)
         + bucket_key_enabled     = (known after apply)
         + content_type           = (known after apply)
         + etag                   = (known after apply)
         + force_destroy          = false
         + id                     = (known after apply)
         + key                    = "shadow.jpg"
         + kms_key_id             = (known after apply)
         + server_side_encryption = (known after apply)
         + source                 = "/media/shadow.jpg"
         + storage_class          = (known after apply)
         + tags_all               = (known after apply)
         + version_id             = (known after apply)
       }
   
     # aws_s3_object.upload_sonic_media["/media/tails.jpg"] will be created
     + resource "aws_s3_object" "upload_sonic_media" {
         + acl                    = "private"
         + bucket                 = (known after apply)
         + bucket_key_enabled     = (known after apply)
         + content_type           = (known after apply)
         + etag                   = (known after apply)
         + force_destroy          = false
         + id                     = (known after apply)
         + key                    = "tails.jpg"
         + kms_key_id             = (known after apply)
         + server_side_encryption = (known after apply)
         + source                 = "/media/tails.jpg"
         + storage_class          = (known after apply)
         + tags_all               = (known after apply)
         + version_id             = (known after apply)
       }
   
     # aws_s3_object.upload_sonic_media["/media/ultrasonic.jpg"] will be created
     + resource "aws_s3_object" "upload_sonic_media" {
         + acl                    = "private"
         + bucket                 = (known after apply)
         + bucket_key_enabled     = (known after apply)
         + content_type           = (known after apply)
         + etag                   = (known after apply)
         + force_destroy          = false
         + id                     = (known after apply)
         + key                    = "ultrasonic.jpg"
         + kms_key_id             = (known after apply)
         + server_side_encryption = (known after apply)
         + source                 = "/media/ultrasonic.jpg"
         + storage_class          = (known after apply)
         + tags_all               = (known after apply)
         + version_id             = (known after apply)
       }
   
   Plan: 6 to add, 0 to change, 0 to destroy.
   
   Do you want to perform these actions?
     Terraform will perform the actions described above.
     Only 'yes' will be accepted to approve.
   
     Enter a value: yes
   
   aws_s3_bucket.sonic_media: Creating...
   aws_s3_bucket.sonic_media: Creation complete after 1s [id=sonic-media]
   aws_s3_object.upload_sonic_media["/media/ultrasonic.jpg"]: Creating...
   aws_s3_object.upload_sonic_media["/media/knuckles.jpg"]: Creating...
   aws_s3_object.upload_sonic_media["/media/tails.jpg"]: Creating...
   aws_s3_object.upload_sonic_media["/media/eggman.jpg"]: Creating...
   aws_s3_object.upload_sonic_media["/media/shadow.jpg"]: Creating...
   aws_s3_object.upload_sonic_media["/media/shadow.jpg"]: Creation complete after 0s [id=shadow.jpg]
   aws_s3_object.upload_sonic_media["/media/knuckles.jpg"]: Creation complete after 0s [id=knuckles.jpg]
   aws_s3_object.upload_sonic_media["/media/ultrasonic.jpg"]: Creation complete after 0s [id=ultrasonic.jpg]
   aws_s3_object.upload_sonic_media["/media/tails.jpg"]: Creation complete after 0s [id=tails.jpg]
   aws_s3_object.upload_sonic_media["/media/eggman.jpg"]: Creation complete after 0s [id=eggman.jpg]
   
   Apply complete! Resources: 6 added, 0 changed, 0 destroyed.
   ```

11. For the final question, navigate to the configuration directory called `/root/terraform-projects/project-mario`.

    We have an empty `main.tf` file here. The `provider` and `variables` have already been configured for you.

    OK

    provider.tf

    ```
    terraform {
      required_providers {
        aws = {
          source = "hashicorp/aws"
          version = "4.15.0"
        }
      }
    }
    
    provider "aws" {
      region                      = var.region
      skip_credentials_validation = true
      skip_requesting_account_id  = true
      s3_use_path_style = true
      endpoints {
        ec2 = "http://aws:4566"
        iam = "http://aws:4566"
        s3 = "http://aws:4566"
      }
    }
    
    ```

    variables.tf

    ```
    variable "region" {
        default = "us-east-1"
    }
    variable  "name" {
        type = string
    }
    variable "ami" {
        type = string
        default = "ami-09331245601cf"
    }
    variable "small" {
        type = string
        default = "t2.nano"
    }
    variable "large" {
        type = string
        default = "t2.2xlarge"
    }
    ```

12. What is the value of the variable called `small`?

    - **t2.nano**
    - t2.small
    - t2.micro
    - small

    Run: `terraform init` and then `echo 'var.small' | terraform console` or simply inspect the `variables.tf` file.

    variables.tf

    ```
    variable "region" {
        default = "us-east-1"
    }
    variable  "name" {
        type = string
    }
    variable "ami" {
        type = string
        default = "ami-09331245601cf"
    }
    variable "small" {
        type = string
        default = "t2.nano"
    }
    variable "large" {
        type = string
        default = "t2.2xlarge"
    }
    ```

13. What is the current value for the variable called `name`?

    - **undefined**
    - tiny
    - t2.2xlarge
    - large
    - t2.nano

14. Create an `EC2 Instance` with the resource name `mario_servers`.

    Use the following specifications:

    `AMI`: Use variable called `ami`.

    
    `Tags`: Create a tag with key `Name` and value set to the `variable` called `name`.

    
    `Instance_type`: Use a conditional expression so that - If the instance is created with a tag `Name = "tiny"`, it should use the variable called `small` else the variable called `large`.

    We will supply the variable called `name` using the `-var` command line flag.

    Check

    - resource created as specified?

    The `main.tf` file should be:

    ```
    resource "aws_instance" "mario_servers" {
         ami = var.ami
         instance_type = var.name == "tiny" ? var.small : var.large
         tags = {
              Name = var.name
    
         }
    
    }
    ```

    

## LAB: TERRAFORM WORKSPACES

1. When we start off and create a configuration in `terraform`, what is the workspace that is created, to begin with?

   - cloud
   - cloud
   - **default**
   - remote

2. Navigate to the configuration directory `/root/terraform-projects/project-sapphire`. We have a few configuration files already created here. How may `workspaces` are created for this configuration currently?

   - 0
   - 4
   - 2
   - **1**
   - 3

   ```
   $ terraform workspace list
   * default
   ```

3. Create three new workspaces called `us-payroll`, `uk-payroll` and `india-payroll`.

   Check

   - workspaces created?

   Run the following commands:

   ```
   terraform workspace new us-payroll
   terraform workspace new uk-payroll
   terraform workspace new india-payroll
   ```

4. Now, switch to the workspace called `us-payroll`.

   Check

   - Syntax Check

   ```
   $ terraform workspace select us-payroll
   Switched to workspace "us-payroll".
   ```

5. Where would the state file for the workspace called `india-payroll` be stored??

   Choose the correct path relative to the current configuration directory (`/root/terraform-projects/project-sapphire`)

   - ./terraform.tfstate.d
   - terraform.tfstate
   - **./terraform.tfstate.d/india-payroll**
   - .terraform/india-payroll

6. Let's now write the `main.tf` file to make use of the same module that we saw in the `terraform modules` lecture.

   The `project-sapphire` configuration directory will be used to deploy the same payroll application stack in different regions.

   The module is located at the path `/root/terraform-projects/modules/payroll-app`.

   OK

7. Inside the configuration directory, we have already added the `variables.tf` and the `provider.tf` file. Inspect them.

   What type of variable is `region`?

   - **map**
   - string
   - set
   - list
   - array

   Inspect the `variables.tf` file.

   variables.tf

   ```
   variable "region" {
       type = map
       default = {
           "us-payroll" = "us-east-1"
           "uk-payroll" = "eu-west-2"
           "india-payroll" = "ap-south-1"
       }
   
   }
   variable "ami" {
       type = map
       default = {
           "us-payroll" = "ami-24e140119877avm"
           "uk-payroll" = "ami-35e140119877avm"
           "india-payroll" = "ami-55140119877avm"
       }
   }
   ```

8. What is the default value of the `key` called `india-payroll` for the variable `region`?

   - ami-55140119877avm
   - **ap-south-1**
   - ami-24e140119877avm
   - ap-south-2

   Inspect the variable block for `region`.

   variables.tf

   ```
   variable "region" {
       type = map
       default = {
           "us-payroll" = "us-east-1"
           "uk-payroll" = "eu-west-2"
           "india-payroll" = "ap-south-1"
       }
   
   }
   variable "ami" {
       type = map
       default = {
           "us-payroll" = "ami-24e140119877avm"
           "uk-payroll" = "ami-35e140119877avm"
           "india-payroll" = "ami-55140119877avm"
       }
   }
   ```

9. What is the default value of the `key` called `india-payroll` for the variable `ami`?

   - **ami-55140119877avm**
   - us-east-1
   - ap-south-1
   - ami-35e140119877avm

   Inspect the variable block for `ami`.

   variables.tf

   ```
   variable "region" {
       type = map
       default = {
           "us-payroll" = "us-east-1"
           "uk-payroll" = "eu-west-2"
           "india-payroll" = "ap-south-1"
       }
   
   }
   variable "ami" {
       type = map
       default = {
           "us-payroll" = "ami-24e140119877avm"
           "uk-payroll" = "ami-35e140119877avm"
           "india-payroll" = "ami-55140119877avm"
       }
   }
   ```

10. Now, update the `main.tf` of the `root module` to call the `child module` located at `/root/terraform-projects/modules/payroll-app`. Adhere to the following specifications:

   1. module name: `payroll_app`

   2. This module expects two mandatory arguments:

      a. `app_region` - use the values from variable called `region`

      b. `ami` - use the values from the variable called `ami`

   3. The values for these two arguments should be selected based on the workspace you are on.

      
      For example, if on `us-payroll` workspace, the `app_region` should be `us-east-1` and the ami `ami-24e140119877avm` OR for `uk-payroll`, the `app_region` should be `eu-west-2` and the ami `ami-35e140119877avm` e.t.c .

   Once ready, run `terraform init`. You don't have to create(`apply`) the resources yet!
   Refer to the `README.md` file located at `/root/terraform-projects/modules/payroll-app` to see how to use this module.

   Check

   - main.tf created with the module block as specified?

   Use the `lookup` function and `terraform.workspace` expression to lookup the correct values from the map.

   Solution for `main.tf` :-

   ```
   module "payroll_app" {
     source = "/root/terraform-projects/modules/payroll-app"
     app_region = lookup(var.region, terraform.workspace)
     ami        = lookup(var.ami, terraform.workspace)
   }
   ```

11. Now, using the same configuration, create the resources on all three workspaces that you created earlier!

    Check

    - resources created in all 3 workspaces?
    - single configuration used?

    ```
    Run: 
    
    $ terraform workspace select us-payroll; terraform apply
    
    $ terraform workspace select uk-payroll; terraform apply
    
    $ terraform workspace select india-payroll; terraform apply
    ```

    provider.tf

    ```
    terraform {
      required_providers {
        aws = {
          source = "hashicorp/aws"
          version = "4.15.0"
        }
      }
    }
    
    
    provider "aws" {
      region                      = lookup(var.region, terraform.workspace)
      skip_credentials_validation = true
      skip_requesting_account_id  = true
      s3_force_path_style = true
      endpoints {
        ec2 = "http://aws:4566"
        dynamodb = "http://aws:4566"
        s3 = "http://aws:4566"
      }
    }
    ```

    
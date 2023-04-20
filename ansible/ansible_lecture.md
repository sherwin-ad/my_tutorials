[TOC]



## Ansible

* is an open source automation platform
* ansible is agent less compared to Chef and Puppet
* is an open-source automation tool, or platform, used for IT tasks such  as configuration management, application deployment, intraservice  orchestration, and provisioning.

## Advantages of Ansible

- **Free**: Ansible is an open-source tool.
- **Very simple to set up and use**: No special coding skills are necessary to use Ansible’s playbooks (more on playbooks later).
- **Powerful**: Ansible lets you model even highly complex IT workflows. 
- **Flexible**: You can orchestrate the entire  application environment no matter where it’s deployed. You can also  customize it based on your needs.
- **Agentless**: You don’t need to install any other  software or firewall ports on the client systems you want to automate.  You also don’t have to set up a separate management structure.
- **Efficient**: Because you don’t need to install any extra software, there’s more room for application resources on your server.



## Ansible architecture

## [Modules](https://docs.ansible.com/ansible/latest/dev_guide/overview_architecture.html#id1)

Ansible works by connecting to your nodes and pushing out scripts  called “Ansible modules” to them. Most modules accept parameters that  describe the desired state of the system. Ansible then executes these modules (over SSH by default), and removes  them when finished. Your library of modules can reside on any machine,  and there are no servers, daemons, or databases required.

You can [write your own modules](https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_general.html#developing-modules-general), though you should first consider [whether you should](https://docs.ansible.com/ansible/latest/dev_guide/developing_modules.html#developing-modules). Typically you’ll work with your favorite terminal program, a text  editor, and probably a version control system to keep track of changes  to your content. You may write specialized modules in any language that  can return JSON (Ruby, Python, bash, etc).

## [Module utilities](https://docs.ansible.com/ansible/latest/dev_guide/overview_architecture.html#id2)

When multiple modules use the same code, Ansible stores those  functions as module utilities to minimize duplication and maintenance.  For example, the code that parses URLs is `lib/ansible/module_utils/url.py`. You can [write your own module utilities](https://docs.ansible.com/ansible/latest/dev_guide/developing_module_utilities.html#developing-module-utilities) as well. Module utilities may only be written in Python or in PowerShell.

## [Plugins](https://docs.ansible.com/ansible/latest/dev_guide/overview_architecture.html#id3)

[Plugins](https://docs.ansible.com/ansible/latest/plugins/plugins.html#plugins-lookup) augment Ansible’s core functionality. While modules execute on the  target system in separate processes (usually that means on a remote  system), plugins execute on the control node within the `/usr/bin/ansible` process. Plugins offer options and extensions for the core features of  Ansible - transforming data, logging output, connecting to inventory,  and more. Ansible ships with a number of handy plugins, and you can  easily [write your own](https://docs.ansible.com/ansible/latest/dev_guide/developing_plugins.html#developing-plugins). For example, you can write an [inventory plugin](https://docs.ansible.com/ansible/latest/dev_guide/developing_inventory.html#developing-inventory) to connect to any datasource that returns JSON. Plugins must be written in Python.

## [Inventory](https://docs.ansible.com/ansible/latest/dev_guide/overview_architecture.html#id4)

By default, Ansible represents the machines it manages in a file  (INI, YAML, etc.) that puts all of your managed machines in groups of  your own choosing.

To add new machines, there is no additional SSL signing server  involved, so there’s never any hassle deciding why a particular machine  didn’t get linked up due to obscure NTP or DNS issues.

If there’s another source of truth in your infrastructure, Ansible  can also connect to that. Ansible can draw inventory, group, and  variable information from sources like EC2, Rackspace, OpenStack, and  more.

Here’s what a plain text inventory file looks like:

```
---
[webservers]
www1.example.com
www2.example.com

[dbservers]
db0.example.com
db1.example.com
```

Once inventory hosts are listed, variables can be assigned to them in simple text files (in a subdirectory called ‘group_vars/’ or  ‘host_vars/’ or directly in the inventory file.

Or, as already mentioned, use a dynamic inventory to pull your inventory from data sources like EC2, Rackspace, or OpenStack.

## [Playbooks](https://docs.ansible.com/ansible/latest/dev_guide/overview_architecture.html#id5)

Playbooks can finely orchestrate multiple slices of your  infrastructure topology, with very detailed control over how many  machines to tackle at a time.  This is where Ansible starts to get most  interesting.

Ansible’s approach to orchestration is one of finely-tuned  simplicity, as we believe your automation code should make perfect sense to you years down the road and there should be very little to remember  about special syntax or features.

Here’s what a simple playbook looks like:

```
---
- hosts: webservers
serial: 5 # update 5 machines at a time
roles:
- common
- webapp

- hosts: content_servers
roles:
- common
- content
```



**YAML** - Yet Another Markup Language

All members of a list are lines beginning at the same indentation level starting with a `"- "` (a dash and a space):

```
---
# A list of tasty fruits
- Apple
- Orange
- Strawberry
- Mango
...
```

A dictionary is represented in a simple `key: value` form (the colon must be followed by a space):

```
# An employee record
martin:
    name: Martin D'vloper
    job: Developer
    skill: Elite
```

More complicated data structures are possible, such as lists of  dictionaries, dictionaries whose values are lists or a mix of both:

```
# Employee records
-  martin:
    name: Martin D'vloper
    job: Developer
    skills:
      - python
      - perl
      - pascal
-  tabitha:
    name: Tabitha Bitumen
    job: Developer
    skills:
      - lisp
      - fortran
      - erlang
```

Dictionaries and lists can also be represented in an abbreviated form if you really want to:

```
---
martin: {name: Martin D'vloper, job: Developer, skill: Elite}
['Apple', 'Orange', 'Strawberry', 'Mango']
```

These are called “Flow collections”.

Ansible doesn’t really use these too much, but you can also specify a boolean value (true/false) in several forms:

```
create_key: yes
needs_agent: no
knows_oop: True
likes_emacs: TRUE
uses_cvs: false
```

**Validate YAML**

http://www.yamllint.com



### Install Ansible

```
sudo apt-add-repository ppa:ansible/ansible

sudo apt update

sudo apt install ansible
```



### Ansible Inventory

* /etc/ansible/hosts
* written in INI format
* Host Variables
* Group Variables
* Groups of Group

/etc/ansible/hosts

```
[demo_hosts]
node1 ansible_user=ubuntu
node2 ansible_user=ubuntu
```

/etc/hosts

```
172.31.19.123 node1
172.31.29.114 node2
```



Add the aws keypair in the ansible-host  so that we ssh to the nodes 

```
eval `ssh-agent -s

# key.pem is the aws key pair
ssh-add key.pem

# try to ssh to node1
ssh ubuntu@node1
```



Verify if ansible inventory is working

```
ansible -m ping all
node1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
node2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
```

```
ansible demo_hosts -m ping 
node2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
node1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
```



###  Introduction to ad-hoc commands

* uses the /usr/bin/ansible command-line tool to automate a single task on one or more managed nodes.
* are quick and easy, but they are not reusable.
* demonstrate the simplicity and power of Ansible.

ansible <target> -m <module name> -a arguments

### Use cases for ad-hoc tasks

- [Rebooting servers](#Rebooting-servers)
- [Managing files](#Managing-files)
- [Managing packages](#Managing-packages)
- [Managing users and groups](#Managing-users-and-groups)
- [Managing services](#Managing-services)
- [Gathering facts](#Gathering-facts)


#### Rebooting servers

```
 To reboot all the servers in the [atlanta] group:
$ ansible atlanta -a "/sbin/reboot"

# To reboot the [atlanta] servers with 10 parallel forks:
$ ansible atlanta -a "/sbin/reboot" -f 10

# To connect as a different user:
# If you add --ask-become-pass or -K, Ansible prompts you for the password to use for privilege escalation (sudo/su/pfexec/doas/etc).
$ ansible atlanta -a "/sbin/reboot" -f 10 -u username --become [--ask-become-pass]

# To use a different module, pass -m for module name. For example, to use the shell module:
$ ansible raleigh -m shell -a 'echo $TERM'
```


#### Managing files

```
# To transfer a file directly to all servers in the [atlanta] group:
$ ansible atlanta -m copy -a "src=/etc/hosts dest=/tmp/hosts"

#The file module allows changing ownership and permissions on files. These same options can be passed directly to the copy module as well:
$ ansible webservers -m file -a "dest=/srv/foo/a.txt mode=600"
$ ansible webservers -m file -a "dest=/srv/foo/b.txt mode=600 owner=mdehaan group=mdehaan"

# The file module can also create directories, similar to mkdir -p:
$ ansible webservers -m file -a "dest=/path/to/c mode=755 owner=mdehaan group=mdehaan state=directory"

# As well as delete directories (recursively) and delete files:
$ ansible webservers -m file -a "dest=/path/to/c state=absent"

```

#### Managing Packages

```
# To ensure a package is installed without updating it:
$ ansible webservers -m yum -a "name=acme state=present"

# To ensure a specific version of a package is installed:
$ ansible webservers -m yum -a "name=acme-1.5 state=present"

# To ensure a package is at the latest version:
$ ansible webservers -m yum -a "name=acme state=latest"

# To ensure a package is not installed:
$ ansible webservers -m yum -a "name=acme state=absent"
```

#### Managing users and groups

You can create, manage, and remove user accounts on your managed nodes with ad-hoc tasks:

```
$ ansible all -m user -a "name=foo password=<crypted password here>"
$ ansible all -m user -a "name=foo state=absent"
```

#### Managing services

```
# Ensure a service is started on all webservers:
$ ansible webservers -m service -a "name=httpd state=started"

# Alternatively, restart a service on all webservers:
$ ansible webservers -m service -a "name=httpd state=restarted"

Ensure a service is stopped:
$ ansible webservers -m service -a "name=httpd state=stopped"
```

#### Gathering facts ansible all -m setup

```
$ ansible all -m setup
```



**List available modules in ansible**

```
ansible-doc -l
```



**Display the manual of the module **

```
ansible-doc copy
```



### Ansible Facts

* Ansible collects pretty much all the information about the remote hosts as it runs a playbook. 
* The task of collecting this remote system  information is called as `Gathering Facts` by ansible and the details collected are generally known as `facts` or `variables`

This information can be obtained manually using Ansible ad-hoc command and a specialized module named **setup.** In fact, ansible playbooks call this **setup** module by default to perform `Gathering Facts` task

The ansible ad-hoc command to invoke the ansible setup module is given below.

```
$ ansible <hostname (or) hostgroup> -m setup
```



### Ansible Variables

#### Valid Variable Name

* Variable names should be letters, numbers, and underscores.  
* Variables should always start with a letter.



### Ansible Playbook Sections

#### Target Section

* specify the host group

#### Variable Section

* write the list of variables that we will be use in the playbook

#### Task Section

* write the list of all the task which our playbook will perform

#### Handler Section



#### Loops

* is a sequence of instructions  that is continually repeated until a certain condition is reach

#### Conditionals



#### Until



#### Notify

Playbook sample with copmple section

```
---
  - hosts: web_portal
    tasks:
      - name: Apt get update
        apt: update_cache=yes

      - name: Install Apache2, nginx, nmap
        apt: name={{ item }} update_cache=no
        with_items:
          - apache2
          - nginx
          - nmap

      - name: Copy data files
        copy: src=index.html dest=/var/www/html/
        register: copy_status

      - name: Stop Apache2 service
        service: name=apache2 state=stopped

      - name: Copy template files
        template: src=current.html.j2 dest=/var/www/html/current.html
        notify:
          - start apache

      - name: Testing conditional
        shell: uptime
        when: ansible_hostname == "node1"

      - name: Testing until
        shell: service apache2 status
        register: result
        until: result.stdout.find("active (running)") != -1
        retries: 5
        delay: 5

      - name: Check uptime
        shell: uptime
        register: uptime_var

      - name: Print uptime
        debug: var=uptime_var

      - name: Copy status
        debug: var=copy_status

    handlers:
      - name: start apache
        service: name=apache2 state=restarted
```





This will run the playbook but it will not change anything in the  target hosts

```
ansible-playbook install_apache2.yaml -b --check

PLAY [web_portal] *******************************************************************************

TASK [Gathering Facts] **************************************************************************
ok: [node1]

TASK [Apt get update] ***************************************************************************
changed: [node1]

TASK [Install Apache2] **************************************************************************
ok: [node1]

TASK [Copy data files] **************************************************************************
ok: [node1]

TASK [Stop Apache2 service] *********************************************************************
changed: [node1]

TASK [Copy template files] **********************************************************************
changed: [node1]

RUNNING HANDLER [start apache] ******************************************************************
changed: [node1]

PLAY RECAP **************************************************************************************
node1                      : ok=7    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

```



### Ansible Vault

* Ansible Vault is a feature of ansible that allows you to keep sensitive  data such as passwords or keys in encrypted files, rather than as  plaintext in playbooks or roles.
* These vault files can then be  distributed or placed in source control.

To create a new encrypted data file, run the following command:

```
ansible-vault create foo.yml
```

To create a new encrypted data file with the Vault ID ‘password1’ assigned to it and be prompted for the password, run:

```
ansible-vault create --vault-id password1@prompt foo.yml
```

To view ecrypted data file

```
ansible-vault view foo.yml
```

To edit an encrypted file

```
ansible-vault edit foo.yml
```

To use the vault in playbook

```
ansible-playbook site.yml --ask-vault-pass
```

To edit a file encrypted with the ‘vault2’ password file and assigned the ‘pass2’ vault ID:

```
ansible-vault edit --vault-id pass2@vault2 foo.yml
```

Should you wish to change your password on a vault-encrypted file or files, you can do so with the rekey command:

```
ansible-vault rekey foo.yml bar.yml baz.yml
```

To rekey files encrypted with the ‘preprod2’ vault ID and the ‘ppold’ file and be prompted for the new password:

```
ansible-vault rekey --vault-id preprod2@ppold --new-vault-id preprod2@prompt foo.yml bar.yml baz.yml
```



### Modules

#### Setup Module

* Gathers facts about remote hosts

```
ansible node1 -m setup
```

#### User Module

Create user in host node1

```
ansible node1 -m user -a "user=tetracloud" -b
```

#### Shell Module

```
ansible node1 -m shell -a "tail /var/log/syslog"
node1 | CHANGED | rc=0 >>
May 31 13:57:37 node1 systemd[16668]: Listening on GnuPG network certificate management daemon.
May 31 13:57:37 node1 systemd[16668]: Listening on GnuPG cryptographic agent and passphrase cache (restricted).
May 31 13:57:37 node1 systemd[16668]: Reached target Sockets.
May 31 13:57:37 node1 systemd[16668]: Reached target Basic System.
May 31 13:57:37 node1 systemd[1]: Started User Manager for UID 1000.
May 31 13:57:37 node1 systemd[16668]: Reached target Default.
May 31 13:57:37 node1 systemd[16668]: Startup finished in 26ms.
May 31 13:57:38 node1 python3[16780]: ansible-command Invoked with _uses_shell=True _raw_params=tail /var/log/syslog warn=True stdin_add_newline=True strip_empty_ends=True argv=None chdir=None executable=None creates=None removes=None stdin=None
May 31 13:57:56 node1 python3[16808]: ansible-command Invoked with _uses_shell=True _raw_params=tail /var/log/syslog | grep 26 warn=True stdin_add_newline=True strip_empty_ends=True argv=None chdir=None executable=None creates=None removes=None stdin=None
May 31 13:58:03 node1 python3[16837]: ansible-command Invoked with _uses_shell=True _raw_params=tail /var/log/syslog warn=True stdin_add_newline=True strip_empty_ends=True argv=None chdir=None executable=None creates=None removes=None stdin=None
```



### Ansible Roles

* Roles are ways of automatically loading certain vars_files, tasks,  and handlers based on a known file structure. 

*  Grouping content by roles also allows easy sharing of roles with other users.

#### Role Directory Structure

Example project structure:

```
site.yml
webservers.yml
fooservers.yml
roles/
    common/
        tasks/
        handlers/
        files/
        templates/
        vars/
        defaults/
        meta/
    webservers/
        tasks/
        defaults/
        meta/
```

- `tasks` - contains the main list of tasks to be executed by the role.
- `handlers` - contains handlers, which may be used by this role or even anywhere outside this role.
- `defaults` - default variables for the role (see [Using Variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#playbooks-variables) for more information).
- `vars` - other variables for the role (see [Using Variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#playbooks-variables) for more information).
- `files` - contains files which can be deployed via this role.
- `templates` - contains templates which can be deployed via this role.
- `meta` - defines some meta data for this role. See below for more details.

Other YAML files  may be included in certain directories. For example, it is common  practice to have platform-specific tasks included from the `tasks/main.yml` file:

```
# roles/example/tasks/main.yml
- name: added in 2.4, previously you used 'include'
  import_tasks: redhat.yml
  when: ansible_facts['os_family']|lower == 'redhat'
- import_tasks: debian.yml
  when: ansible_facts['os_family']|lower == 'debian'

# roles/example/tasks/redhat.yml
- yum:
    name: "httpd"
    state: present

# roles/example/tasks/debian.yml
- apt:
    name: "apache2"
    state: present
```

Roles may also include modules and other plugin types. For more information, please refer to the [Embedding Modules and Plugins In Roles](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html#embedding-modules-and-plugins-in-roles) section below.

#### Using Roles

The classic (original) way to use roles is via the `roles:` option for a given play:

```
---
- hosts: webservers
  roles:
    - common
    - webservers
```



#### Ansible playbook to manage AWS EC2 instances

**Start AWS EC2 instance**

```
$ ansible localhost -m ec2 -a "instance_ids=i-019eafe54b5202f70 state=running region=ap-southeast-1"
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit
localhost does not match 'all'

localhost | SUCCESS => {
    "changed": true, 
    "instance_ids": [
        "i-019eafe54b5202f70"
    ], 
    "instances": [
        {
            "ami_launch_index": "2", 
            "architecture": "x86_64", 
            "block_device_mapping": {
                "/dev/sda1": {
                    "delete_on_termination": true, 
                    "status": "attached", 
                    "volume_id": "vol-0979c0f25a80d5ed3"
                }
            }, 
            "dns_name": "", 
            "ebs_optimized": false, 
            "groups": {
                "sg-02760e54b3eb5404d": "MyWebDMZ"
            }, 
            "hypervisor": "xen", 
            "id": "i-019eafe54b5202f70", 
            "image_id": "ami-0f7719e8b7ba25c61", 
            "instance_type": "t2.micro", 
            "kernel": null, 
            "key_name": "sherwinowen_aws_keypair", 
            "launch_time": "2020-06-02T14:03:35.000Z", 
            "placement": "ap-southeast-1b", 
            "private_dns_name": "ip-172-31-31-30.ap-southeast-1.compute.internal", 
            "private_ip": "172.31.31.30", 
            "public_dns_name": "", 
            "public_ip": null, 
            "ramdisk": null, 
            "region": "ap-southeast-1", 
            "root_device_name": "/dev/sda1", 
            "root_device_type": "ebs", 
            "state": "stopped", 
            "state_code": 80, 
            "tags": {
                "Name": "ansible-host"
            }, 
            "tenancy": "default", 
            "virtualization_type": "hvm"
        }
    ], 
    "tagged_instances": []
```

**Stop AWS EC2 instance**

```
$ ansible localhost -m ec2 -a "instance_ids=i-019eafe54b5202f70 state=stopped region=ap-southeast-1"
localhost | SUCCESS => {
    "changed": true, 
    "instance_ids": [
        "i-019eafe54b5202f70"
    ], 
    "instances": [
        {
            "ami_launch_index": "2", 
            "architecture": "x86_64", 
            "block_device_mapping": {
                "/dev/sda1": {
                    "delete_on_termination": true, 
                    "status": "attached", 
                    "volume_id": "vol-0979c0f25a80d5ed3"
                }
            }, 
            "dns_name": "ec2-18-140-61-81.ap-southeast-1.compute.amazonaws.com", 
            "ebs_optimized": false, 
            "groups": {
                "sg-02760e54b3eb5404d": "MyWebDMZ"
            }, 
            "hypervisor": "xen", 
            "id": "i-019eafe54b5202f70", 
            "image_id": "ami-0f7719e8b7ba25c61", 
            "instance_type": "t2.micro", 
            "kernel": null, 
            "key_name": "sherwinowen_aws_keypair", 
            "launch_time": "2020-06-02T14:32:39.000Z", 
            "placement": "ap-southeast-1b", 
            "private_dns_name": "ip-172-31-31-30.ap-southeast-1.compute.internal", 
            "private_ip": "172.31.31.30", 
            "public_dns_name": "ec2-18-140-61-81.ap-southeast-1.compute.amazonaws.com", 
            "public_ip": "18.140.61.81", 
            "ramdisk": null, 
            "region": "ap-southeast-1", 
            "root_device_name": "/dev/sda1", 
            "root_device_type": "ebs", 
            "state": "running", 
            "state_code": 16, 
            "tags": {
                "Name": "ansible-host"
            }, 
            "tenancy": "default", 
            "virtualization_type": "hvm"
        }
    ], 
    "tagged_instances": []
}
```

#### Deploy new AWS EC2 instances 

ec2_create.yaml

```
---
- hosts: localhost
  tasks: 
    - name: Create AWS instance
      ec2:
        key_name: mykey
        instance_type: t2.micro
        image: ami-0f7719e8b7ba25c61
        wait: yes
        count: 3
        vpc_subnet_id: subnet-838242e5
        assign_public_ip: no
        region: ap-southeast-1
        key_name: "sherwinowen_aws_keypair"

```



```
$ ansible-playbook ec2_create.yaml 
 [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit
localhost does not match 'all'

 [WARNING]: While constructing a mapping from
/home/sherwinowen/Documents/my_tutorials/ansible/playbooks/ec2_create.yaml, line 6, column 9,
found a duplicate dict key (key_name). Using last defined value only.


PLAY [localhost] *********************************************************************************

TASK [Gathering Facts] ***************************************************************************
ok: [localhost]

TASK [Create AWS instance] ***********************************************************************
changed: [localhost]

PLAY RECAP ***************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0   

```


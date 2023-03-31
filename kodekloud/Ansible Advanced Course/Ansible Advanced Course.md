# Ansible Advanced Course

# Core Components

## Playbook run options

### Check Mode or Dry Run

```
---
- name: Install httpd
hosts: all
tasks:
- yum:
name: httpd
state: installed
```

```
$ ansible-playbook playbook.yml –-check
```

### Start at

```
---
- name: Install httpd
hosts: all
tasks:
- name: Install httpd
yum:
name: httpd
state: installed
- name: Start httpd service
service:
name: httpd
state: started
```

```
$ ansible-playbook playbook.yml –-start-at-task “Start httpd service”
```

### Tags

```
---
- name: Install httpd
tags: install and start
hosts: all
tasks:
- yum:
name: httpd
state: installed
tags: install
- service:
name: httpd
state: started
tags: start httpd service
```

```
$ ansible-playbook playbook.yml –-tags “install”

$ ansible-playbook playbook.yml –-skip-tags “install”
```

## LABS – PLAYBOOKS

1. In which format are Ansible playbooks expressed?

   - jinja2
   - xml
   - **yaml**
   - python

2. Which of the following statement is correct.

   - Playbooks contains all secret variables and values.
   - Playbooks contains all configuration parameters for Ansible.
   - Playbook contains all hosts group and associated variables.
   - **Playbooks contains tasks and plays that need to be run on managed nodes.**

3. We can have multiple plays in a single playbook.

   - no 
   - **yes**

4. We have a playbook `~/playbooks/copy.yml`, which hosts would this playbook run against?

   Refer to the inventory file as well.

   - **web1 and web2**
   - web1
   - web
   - web2

   inventory

   ```
   [web]
   web1 ansible_host=172.20.1.100 ansible_ssh_pass=Passw0rd ansible_user=root
   web2 ansible_host=172.20.1.101 ansible_ssh_pass=Passw0rd ansible_user=root
   ```

   copy.yml

   ```
   ---
   - hosts: web
     tasks:
       - name: copy test.txt file
         copy:
           src: test.txt
           dest: /tmp/test.txt
   ```

5. There is another playbook `~/playbooks/file.yml`. Identify how many plays it contains.

   - 4
   - 3
   - **2**
   - 1

   file.yml

   ```
   ---
   - hosts: web1
     tasks:
       - name: Create /tmp/testfile.txt
         file:
           path: /tmp/testfile.txt
           state: touch
   
   - hosts: web2
     tasks:
       - name: Create /tmp/testfile.txt
         file:
           path: /tmp/testfile.txt
           state: touch
   ```

6. Under `~/playbooks/` directory create a playbook `web1.yml` to create a blank file named as `/root/myfile.txt` under root’s home on `web1` node, also make sure this must run for `web1` node only.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   web1.yml

   ```
   ---
   - name: Create a myfile.txt
     hosts: web1
     gather_facts: no
     tasks:
       - name: Create myfile.txt
         file:
           path: /root/myfile.txt
           state: touch
   ```

   ```
   $ ansible-playbook -i inventory web1.yml 
   
   PLAY [Create a myfile.txt] *********************************************************************************
   
   TASK [Create myfile.txt] ***********************************************************************************
   changed: [web1]
   
   PLAY RECAP *************************************************************************************************
   web1                       : ok=1    changed=1    unreachable=0    failed=0   
   ```

7. We have a playbook `httpd.yml` under `~/playbooks/` directory to install httpd package on `web1` and `web2` nodes, try to run the playbook and fix issues if you face any.

   Check

   - Syntax Check

   ```
   ]$ ansible-playbook -i inventory httpd.yml 
   ERROR! 'host' is not a valid attribute for a Play
   
   The error appears to have been in '/home/thor/playbooks/httpd.yml': line 2, column 3, but may
   be elsewhere in the file depending on the exact syntax problem.
   
   The offending line appears to be:
   
   ---
   - host: web
     ^ here
   ```

   httpd.yml

   - change "host" to "hosts"

   ```
   ---
   - hosts: web
     tasks:
       - name: Install httpd
         yum:
           name: httpd
           state: present
   ```

   ```
   $ ansible-playbook -i inventory httpd.yml     
   
   PLAY [web] *************************************************************************************************
   
   TASK [Gathering Facts] *************************************************************************************
   ok: [web2]
   ok: [web1]
   
   TASK [Install httpd] ***************************************************************************************
   changed: [web2]
   
   changed: [web1]
   
   PLAY RECAP *************************************************************************************************
   web1                       : ok=2    changed=1    unreachable=0    failed=0   
   web2                       : ok=2    changed=1    unreachable=0    failed=0   
   ```

8. While running `web2.yml` playbook we are facing some syntax errors, playbook is under `~/playbooks/`. Please fix the issue.

   Check

   - Syntax Check

   ```
   $ ansible-playbook -i inventory web2.yml 
   ERROR! Syntax Error while loading YAML.
     did not find expected '-' indicator
   
   The error appears to have been in '/home/thor/playbooks/web2.yml': line 4, column 2, but may
   be elsewhere in the file depending on the exact syntax problem.
   
   The offending line appears to be:
   
     tasks:
    - name: echo Welcome!
    ^ here
   ```

   web2.yml

   ```
   ---
   - hosts: web2
     tasks:
    - name: echo Welcome!
       shell: 'echo "Welcome!" > /tmp/welcome.txt'
   ```

   edit web2.yml

   ```
   ---
   - hosts: web2
     tasks:
       - name: echo Welcome!
         shell: 'echo "Welcome!" > /tmp/welcome.txt'
   ```

   ```
   $ ansible-playbook -i inventory web2.yml 
   
   PLAY [web2] ************************************************************************************************
   
   TASK [Gathering Facts] *************************************************************************************
   ok: [web2]
   
   TASK [echo Welcome!] ***************************************************************************************
   changed: [web2]
   
   PLAY RECAP *************************************************************************************************
   web2                       : ok=2    changed=1    unreachable=0    failed=0   
   ```

9. Create a playbook `user.yml` under `~/playbooks` directory to create a user named as `angel` on `web1` node.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   user,yml

   ```
   ---
   - hosts: web1
     tasks:
       - name: Create user angel
         user:
           name: angel
   ```

   ```
   $ ansible-playbook -i inventory user.yml 
   
   PLAY [web1] ************************************************************************************************
   
   TASK [Gathering Facts] *************************************************************************************
   ok: [web1]
   
   TASK [Create user angel] ***********************************************************************************
   changed: [web1]
   
   PLAY RECAP *************************************************************************************************
   web1                       : ok=2    changed=1    unreachable=0    failed=0   
   ```

   

# Facts

debug.yml

```
---
- name: Print hello message
  hosts: localhost
  tasks:
    - debug:
        var: ansible_facts
```

```
$ ansible-playbook -i localhost debug.yml
[WARNING]: Unable to parse /home/sherwinowen/test-project/localhost as an inventory source
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does
not match 'all'

PLAY [Print hello message] ************************************************************************************

TASK [Gathering Facts] ****************************************************************************************
ok: [localhost]

TASK [debug] **************************************************************************************************
ok: [localhost] => {
    "ansible_facts": {
        "all_ipv4_addresses": [
            "192.168.102.11"
        ], 
        "all_ipv6_addresses": [
            "fe80::21d:ad8f:465c:6d83"
        ], 
        "ansible_local": {}, 
        "apparmor": {
            "status": "disabled"
        }, 
        "architecture": "x86_64", 
        "bios_date": "12/01/2006", 
        "bios_version": "VirtualBox", 
        "cmdline": {
            "BOOT_IMAGE": "/vmlinuz-3.10.0-1160.88.1.el7.x86_64", 
            "LANG": "en_US.UTF-8", 
            "crashkernel": "auto", 
            "quiet": true, 
            "rd.lvm.lv": "centos/swap", 
            "rhgb": true, 
            "ro": true, 
            "root": "/dev/mapper/centos-root", 
            "spectre_v2": "retpoline"
        }, 
        "date_time": {
            "date": "2023-03-30", 
            "day": "30", 
            "epoch": "1680169269", 
            "hour": "17", 
.................
```

debug.yml

```
---
- name: Print hello message
  hosts: localhost
  gather_facts: no
  tasks:
    - debug:
        var: ansible_facts
```

```
$ ansible-playbook -i localhost debug.yml
[WARNING]: Unable to parse /home/sherwinowen/test-project/localhost as an inventory source
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does
not match 'all'

PLAY [Print hello message] ************************************************************************************

TASK [debug] **************************************************************************************************
ok: [localhost] => {
    "ansible_facts": {}
}

PLAY RECAP ****************************************************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

/etc/ansible/ansible.cfg

```
# plays will gather facts by default, which contain information about
# the remote system.
#
# smart - gather by default, but don't regather if already gathered
# implicit - gather by default, turn off with gather_facts: False
# explicit - do not gather by default, must say gather_facts: True
#gathering = implicit
```

## LABS – FACTS

1. By default ansible…

   - …does not collect facts from any managed node
   - **…collects facts from all managed nodes**

2. What `module` is used by ansible internally to collect facts?

   - **setup**
   - facts
   - gather
   - info

3. What is the setting in the ansible configuration file that defines the default behaviour of gathering facts in ansible?

   - gather
   - **gathering**
   - setup
   - facts

4. Identify the OS `distribution_version` of the `localhost` using ansible facts

   - 6.1.2
   - 8.0
   - **7.6.1810**

   ```
   $ ansible -m setup localhost | grep distribution_version
    [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit
   localhost does not match 'all'
           "ansible_distribution_version": "7.6.1810", 
   ```

5. Identify the OS `distribution` of the `web1` host using ansible facts

   Use the inventory file given in `/home/thor/playbooks/web`

   - OpenSuse
   - Redhat
   - Centos
   - **Ubuntu**

   ```
   $ ansible -i inventory -m setup web1 | grep distribution
           "ansible_distribution": "Ubuntu", 
           "ansible_distribution_file_parsed": true, 
           "ansible_distribution_file_path": "/etc/os-release", 
           "ansible_distribution_file_variety": "Debian", 
           "ansible_distribution_major_version": "16", 
           "ansible_distribution_release": "xenial", 
           "ansible_distribution_version": "16.04", 
   ```

6. A playbook is given at `/home/thor/playbooks/db/playbook.yml`. We are trying to print the server architecture. However it prints that the variable is not defined.

   Identify and fix the issue.

   Check

   - Syntax Check
   - Check Playbook

   invertory

   ```
   db1 ansible_host=172.20.1.101 ansible_user=ansible ansible_ssh_pass=Passw0rd
   ```

   playbook.yml

   ```
   ---
   - hosts: db1
     gather_facts: True
     tasks:
       - name: Get server architecture
         debug:
           var: ansible_facts.architecture
   ```

   ```
   $ ansible-playbook -i inventory playbook.yml 
   [WARNING]: log file at /var/log/ansible.log is not writeable and we cannot create it, aborting
   
   
   PLAY [db1] *****************************************************************************************
   
   TASK [Gathering Facts] *****************************************************************************
   ok: [db1]
   
   TASK [Get server architecture] *********************************************************************
   ok: [db1] => {
       "ansible_facts.architecture": "x86_64"
   }
   
   PLAY RECAP *****************************************************************************************
   db1                        : ok=2    changed=0    unreachable=0    failed=0   
   ```

7. Retreive all the facts of the `web1` server and store them in a file at `/home/thor/playbooks/web/web-facts.txt`

   Inventory file is at `/home/thor/playbooks/web`

   Check

   - File exists
   - Content exists

   inventory

   ```ini
   web1 ansible_host=172.20.1.100 ansible_ssh_pass=Passw0rd ansible_user=root
   ```

   ```
   $ ansible -m setup web1 -i inventory > /home/thor/playbooks/web/web-facts.txt
   ```



# Configuration Files

## LABS – CONFIGURATION FILES

1. What is the default location of `Ansible` configuration file?

   - ./ansible.cfg
   - /etc/ansible.cfg
   - ~/.ansible.cfg
   - /etc/ansible/ansible.cfg

2. Can we override the default `Ansible` config file?

   - no 
   - **yes**

3. What is the command to display the current config file used by `Ansible`?

   - ansible-config -c
   - ansible-config -v
   - ansible-config list
   - **ansible-config view**

4. Can we override the `Ansible` configuration file settings without actually making changes inside the configuration file?

   - **yes**
   - no

5. As per `Ansible` configuration file precedence, what value of `SSH timeout` will be used by `Ansible` while running the playbooks from `~/playbooks` directory.

   Currently, there are two `ansible.cfg` files on the controller host. One is inside the `/etc/ansible` directory and the other one is in user's home directory.

   - 30s
   - 60s
   - 20s
   - 10s

   ```
   $ ansible-config view | grep "SSH timeout" -A5 
   [WARNING]: log file at /var/log/ansible.log is not writeable and we cannot create it, aborting
   
   # SSH timeout
   timeout = 20
   
   # default user to use for playbooks if user is not specified
   # (/usr/bin/ansible will use current user as default)
   #remote_user = root
   ```

6. We have `playbooks` directory inside the user's home, where we have all the playbooks and inventories. We would like to override some of the configuration parameters without making changes inside the default configuration. Make a copy of `ansible.cfg` file under `~/playbooks` directory.

   Check

   ```
   cp -v /etc/ansible/ansible.cfg playbooks/
   ```

7. Change the default inventory source/file to `~/playbooks/inventory` inside the local `ansible.cfg` file.

   Check

   Run the following command as follows: -

   Make use of the editor to edit the `ansible.cfg` configuration file.

   ```sh
   vi /home/thor/playbooks/ansible.cfg 
   ```

   Uncomment the `inventory` line and update the value `/etc/ansible/hosts` to `~/playbooks/inventory`: -

   ```sh
   inventory   = ~/playbooks/inventory
   ```

   After updating the value, save and exit.

8. Our hosts are available on port `2222`, make sure by default `Ansible` tries to use port `2222` for SSH connections for all managed hosts instead of the default SSH port.

   Check

   Run the following command as follows: -

   Make use of the editor to edit the `ansible.cfg` configuration file.

   ```sh
   vi /home/thor/playbooks/ansible.cfg 
   ```

   Uncomment the `remote_port` line and update the value `22` to `2222`: -

   ```sh
   remote_port = 2222
   ```

   After updating the value, save and exit.

9. Our hosts are spread worldwide, and it takes normally `30 seconds` to establish an SSH connection, make the necessary changes so that Ansible doesn't face SSH timeout issues 

   Check

   Run the following command as follows: -

   Make use of the editor to edit the `ansible.cfg` configuration file.

   ```
   vi /home/thor/playbooks/ansible.cfg 
   ```

   Uncomment the `timeout` line and update the value `10` to `30`: -

   ```
   timeout = 30 
   ```

   After updating the value, save and exit.

10. Disable deprecation warnings for `Ansible`.

   Check

   Run the following command as follows: -

   Make use of the editor to edit the `ansible.cfg` configuration file.

   ```sh
   vi /home/thor/playbooks/ansible.cfg 
   ```

   Uncomment the `deprecation_warnings` line and update the value `True` to `False`: -

   ```sh
   deprecation_warnings = False
   ```

    After updating the value, save and exit.

11. Disable facts gathering for all hosts so that you don't have to `explicitly` disable facts gathering within the playbooks.

    Check

    Run the following command as follows: -

    Make use of the editor to edit the `ansible.cfg` configuration file.

    ```sh
    vi /home/thor/playbooks/ansible.cfg 
    ```

    Uncomment the `gathering` line and update the value `implicit` to `explicit`: -

    ```sh
    gathering = explicit
    ```

    After updating the value, save and exit.

    

# Install and Configure

##  LABS – INSTALL

1. Install Ansible package using yum on ansible controller.

   Check

   ```
   $ sudo yum install epel-release -y
   
   $ sudo yum install ansible -y
   ```

2. What version of Ansible you just installed on the host?

   - **2.9.27**
   - 2.8.1
   - 2.7.1
   - 2.7.8

   ```
   $ ansible --version
   ansible 2.9.27
     config file = /etc/ansible/ansible.cfg
     configured module search path = [u'/home/thor/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
     ansible python module location = /usr/lib/python2.7/site-packages/ansible
     executable location = /bin/ansible
     python version = 2.7.5 (default, Jun 20 2019, 20:27:34) [GCC 4.8.5 20150623 (Red Hat 4.8.5-36)]
   ```

3. For debugging purposes, we would like to configure Ansible to write logs to a different path than default. Configure Ansible to write logs to `/var/log/ansible/ansible.log`.

   Check

   vi /home/thor/playbooks/ansible.cfg

   ```
   log_path = /var/log/ansible/ansible.log
   ```




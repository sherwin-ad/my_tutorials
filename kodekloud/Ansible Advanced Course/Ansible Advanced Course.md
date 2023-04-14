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



# Creating and Distributing SSH Keys

## LABS – Distribute 

1. What type of connection does Ansible establish to manage Unix based hosts ?

   - ftp
   - rdp
   - sftp
   - **ssh**

2. Which command is used to generate an SSH key?

   - **ssh-keygen**
   - ssh-keyscan
   - sshpass
   - ssh

3. Among the following options, which file stores the SSH public keys of remote users that are allowed to establish an SSH connection to this host.

   - **~/.ssh/authorized_keys**
   - ~/.ssh/config
   - /etc/ssh/sshd_config
   - /etc/ssh/ssh_config

4. We want to establish password-less SSH connectivity for a user from Ansible controller to web1 managed host, what exactly needs to be done.

   - Add Ansible managed host’s user’s SSH private key in Ansible controller’s user’s “authorized_keys”
   - **Add Ansible controller’s user’s SSH public key in Ansible managed node’s user’s “authorized_keys”**
   - Add Ansible controller’s user’s SSH private key in Ansible managed node’s user’s “authorized_keys”
   - Add Ansible managed host’s user’s SSH public key in Ansible controller’s user’s “authorized_keys”

5. On Ansible controller node generate an SSH key with filename `ansible` under default location (`~/.ssh`).

   No passphrase to be configured

   Check

   - Check private key

   ```
   $ ssh-keygen -t rsa -f ~/.ssh/ansible
   Generating public/private rsa key pair.
   Created directory '/home/thor/.ssh'.
   Enter passphrase (empty for no passphrase): 
   Enter same passphrase again: 
   Your identification has been saved in /home/thor/.ssh/ansible.
   Your public key has been saved in /home/thor/.ssh/ansible.pub.
   The key fingerprint is:
   SHA256:0CZhiRMd7IqJS43RDNXJwCZ/bRvlPZucriH9usfm40c thor@ansible-controller
   The key's randomart image is:
   +---[RSA 2048]----+
   |  oo===o         |
   | o oo=+o .       |
   |  B  o+ = .      |
   | . + ..B . o     |
   | .+o... S . =    |
   |.oo..  ..  = E   |
   |..     . oo .    |
   |.       . o* .   |
   |         +O+o    |
   +----[SHA256]-----+
   ```

6. We would like to establish password-less secure authentication between Ansible controller and `web1` node. Use the keys generated in the previous step and do the needful.

   User `ansible`'s SSH password for `web1` node is `ansible` and during testing the SSH connection use `-i <path-to-your-ssh-private-key>` with `ssh` command.

   Check

   - Setup password-less authentication

   ```
   $ ssh-copy-id -i /home/thor/.ssh/ansible ansible@web1
   /bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/ansible.pub"
   The authenticity of host 'web1 (172.20.1.100)' can't be established.
   ECDSA key fingerprint is SHA256:lU7Y3UkDnS2oCUnTsO1aNQbTZwSSrSNipj1vK+T+/3g.
   ECDSA key fingerprint is MD5:26:95:2c:d0:0d:c3:46:09:7a:cd:e1:63:2b:26:a3:77.
   Are you sure you want to continue connecting (yes/no)? yes
   /bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
   /bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
   ansible@web1's password: 
   
   Number of key(s) added: 1
   
   Now try logging into the machine, with:   "ssh 'ansible@web1'"
   and check to make sure that only the key(s) you wanted were added.
   ```

7. An inventory file is given at `/home/thor/playbooks/inventory`. Configure it to use the private ssh key.

   Use the ping module to test connectivity through Ansible - `ansible -m ping -i inventory web1`

   Check

   - Configure Inventory file to use private key

   inventory

   ```
   web1 ansible_host=172.20.1.100 ansible_user=ansible ansible_ssh_private_key_file=/home/thor/.ssh/ansible
   ```

   ```
   $ ansible -m ping -i inventory web1
   web1 | SUCCESS => {
       "changed": false, 
       "ping": "pong"
   }
   ```



# AdHoc Commands
## LABS – ADHOC COMMANDS

1. Run the Ansible command to display the version and save the output in `/tmp/ansible_version.txt` file.

   Check

   - Output contains Version

   ```
   $ ansible --version > /tmp/ansible_version.txt
   
   $ cat /tmp/ansible_version.txt 
   ansible 2.7.13
     config file = /etc/ansible/ansible.cfg
     configured module search path = [u'/home/thor/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
     ansible python module location = /usr/lib/python2.7/site-packages/ansible
     executable location = /bin/ansible
     python version = 2.7.5 (default, Jun 20 2019, 20:27:34) [GCC 4.8.5 20150623 (Red Hat 4.8.5-36)]
   ```

   

2. Run the ansible command to gather facts of the `localhost` and save the output in `/tmp/ansible_facts.txt` file.

   Check

   - Output contains facts

   ```
   $ ansible -m setup localhost > /tmp/ansible_facts.txt
    [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit
   localhost does not match 'all'
   
   $ cat /tmp/ansible_facts.txt
   localhost | SUCCESS => {
       "ansible_facts": {
           "ansible_apparmor": {
               "status": "disabled"
           }, 
           "ansible_architecture": "x86_64", 
           "ansible_bios_date": "03/16/2023", 
           "ansible_bios_version": "Google", 
           "ansible_cmdline": {
               "BOOT_IMAGE": "/boot/vmlinuz-5.4.0-1102-gcp", 
               "console": "ttyS0", 
               "ro": true, 
               "root": "UUID=f29ff51b-3bd9-4b0f-81c0-d7378763a3bd"
           }, 
           "ansible_date_time": {
               "date": "2023-04-03", 
               "day": "03", 
               "epoch": "1680480626", 
               "hour": "00", 
               "iso8601": "2023-04-03T00:10:26Z", 
               "iso8601_basic": "20230403T001026902587", 
               "iso8601_basic_short": "20230403T001026", 
               "iso8601_micro": "2023-04-03T00:10:26.902700Z", 
               "minute": "10", 
               "month": "04", 
               "second": "26", 
               "time": "00:10:26", 
               "tz": "UTC", 
               "tz_offset": "+0000", 
               "weekday": "Monday", 
               "weekday_number": "1", 
               "weeknumber": "14", 
               "year": "2023"
   ...........
   ```

3. Execute an ad-hoc command to perform a `ping` connectivity test for the `localhost` and save the output in `/tmp/ansible_ping.txt` file.

   Check

   - Connectivity Successful

   ```
   $ ansible -m ping localhost > /tmp/ansible_ping.txt
    [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit
   localhost does not match 'all'
   
   $ cat /tmp/ansible_ping.txt
   localhost | SUCCESS => {
       "changed": false, 
       "ping": "pong"
   }
   ```

4. Run an adhoc command to perform a `ping` connectivity to `all` hosts in the `/home/thor/playbooks/inventory` file and save the output in `/tmp/ansible_all.txt` file.

   Check

   - Connectivity Successfull

   ```
   $ ansible -m ping -i /home/thor/playbooks/inventory all > /tmp/ansible_all.txt
   
   $ cat /tmp/ansible_all.txt
   web1 | SUCCESS => {
       "changed": false, 
       "ping": "pong"
   }
   web2 | SUCCESS => {
       "changed": false, 
       "ping": "pong"
   ```

5. Run an adhoc command to run a command on host `web1` to print the `date` and save the output in `/tmp/ansible_date.txt` file on the ansible controller.

   Use the `command` module and argument `date`. Inventory file is available at `/home/thor/playbooks/`.

   Check

   - Print date on web1

   ```
   $ ansible -m command -a date -i inventory web1 > /tmp/ansible_date.txt
   
   $ cat /tmp/ansible_date.txt
   web1 | CHANGED | rc=0 >>
   Mon Apr  3 00:23:09 UTC 2023
   ```

   

# Shell Scripts

##  LABS – SHELL SCRIPTS

1. Create a shell script called `host_details.sh` under `~/playbooks/` directory and make it executable.

   The shell script should run ad-hoc ansible commands to:

   1. Print the `hostname` of all managed nodes in the inventory file `~/playbooks/inventory`
   2. Using `copy` module copy the `/etc/resolv.conf` file from ansible controller to `/tmp/resolv.conf` on `node00` host. Use the inventory file `~/playbooks/inventory`.

   Check

   - Script Check: Execute bit set
   - Script Check: Print hostnames
   - Script Check: File copied successfully

   host_detail.sh

   ```
   ansible all -a "hostname" -i inventory
   ansible node00 -m copy -a "src=/etc/resolv.conf dest=/tmp/resolv.conf" -i inventory
   ```

   Make it executable.

   ```
   chmod +x host_details.sh
   ```

   ```
   ./host_details.sh 
   node01 | CHANGED | rc=0 >>
   node01
   
   node00 | CHANGED | rc=0 >>
   node00
   
   node00 | CHANGED => {
       "changed": true, 
       "checksum": "ac5732980258ed1b8ad2480d53c3d3811fa3fd5b", 
       "dest": "/tmp/resolv.conf", 
       "gid": 0, 
       "group": "root", 
       "md5sum": "84a2ae80097527ab769a8846fcd41003", 
       "mode": "0644", 
       "owner": "root", 
       "size": 76, 
       "src": "/root/.ansible/tmp/ansible-tmp-1680481947.31-187400035423761/source", 
       "state": "file", 
       "uid": 0
   }
   ```

2. Create a shell script called `host_data.sh` under `~/playbooks/` directory and make it executable.

   The shell script should:

   1. Set `ANSIBLE_GATHERING` to `False`
   2. Run an ad-hoc command to print the `uptime` of all managed nodes in the inventory file `~/playbooks/inventory`
   3. Create and run a playbook `~/playbooks/playbook.yml` to cat the file `/etc/redhat-release` on all managed nodes in the inventory file `~/playbooks/inventory`. Also please make sure to run this playbook in verbose mode i.e just add `-vv` at the end of your ansible-playbook command.

   Check

   - Script Check: Execute bit set
   - Script Check: prints uptime
   - Script Check: prints the OS version

   Create `playbook.yml`.

   ```unix
   vi playbook.yml
   ```

   Add below given code.

   ```yaml
   ---
   - hosts: all
     tasks:
       - shell: cat /etc/redhat-release
   ```

   Create `host_data.sh` script.

   ```unix
   vi host_data.sh
   ```

   Add below given code.

   ```unix
   export ANSIBLE_GATHERING=False
   ansible all -m shell -a uptime -i inventory
   ansible-playbook -i inventory playbook.yml -vv
   ```

   Make it executable.

   ```unix
   chmod +x host_data.sh
   ```

   ```
   $ ./host_data.sh 
   node00 | CHANGED | rc=0 >>
    00:41:57 up 52 min,  1 user,  load average: 2.44, 2.23, 3.28
   
   node01 | CHANGED | rc=0 >>
    00:41:57 up 52 min,  1 user,  load average: 2.44, 2.23, 3.28
   
   ansible-playbook 2.7.13
     config file = /etc/ansible/ansible.cfg
     configured module search path = [u'/home/thor/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
     ansible python module location = /usr/lib/python2.7/site-packages/ansible
     executable location = /bin/ansible-playbook
     python version = 2.7.5 (default, Jun 20 2019, 20:27:34) [GCC 4.8.5 20150623 (Red Hat 4.8.5-36)]
   Using /etc/ansible/ansible.cfg as config file
   /home/thor/playbooks/inventory did not meet host_list requirements, check plugin documentation if this is unexpected
   
   PLAYBOOK: playbook.yml ******************************************************************************
   1 plays in playbook.yml
   
   PLAY [all] ******************************************************************************************
   META: ran handlers
   
   TASK [shell] ****************************************************************************************
   task path: /home/thor/playbooks/playbook.yml:4
   changed: [node01] => {"changed": true, "cmd": "cat /etc/redhat-release", "delta": "0:00:00.030990", "end": "2023-04-03 00:41:59.123815", "rc": 0, "start": "2023-04-03 00:41:59.092825", "stderr": "", "stderr_lines": [], "stdout": "CentOS Linux release 7.6.1810 (Core) ", "stdout_lines": ["CentOS Linux release 7.6.1810 (Core) "]}
   changed: [node00] => {"changed": true, "cmd": "cat /etc/redhat-release", "delta": "0:00:00.030524", "end": "2023-04-03 00:41:59.123747", "rc": 0, "start": "2023-04-03 00:41:59.093223", "stderr": "", "stderr_lines": [], "stdout": "CentOS Linux release 7.6.1810 (Core) ", "stdout_lines": ["CentOS Linux release 7.6.1810 (Core) "]}
   META: ran handlers
   META: ran handlers
   
   PLAY RECAP ******************************************************************************************
   node00                     : ok=1    changed=1    unreachable=0    failed=0   
   node01                     : ok=1    changed=1    unreachable=0    failed=0   
   ```



# Privilege Escalation

## LABS – PRIVILEGE ESCALATION

1. Setting `become_user` directive automatically sets `become` as well.

   - True
   - **False**

2. What is the default value of `become_user` directive?

   - admin
   - ansible
   - superuser
   - **root**

3. Which of the following can be passed in as an inventory variable to activate privilege escalation?

   - become_user
   - **ansible_become**
   - ansible_become_method
   - become

4. Which of the following option can be used to enable Ansible to ask for `sudo` password while running an ad hoc command.

   - --ask-password
   - --ansible-become-password
   - **--ask-become-pass**
   - --password

5. We want to change the login shell for a remote user while running an Ansible task, which directive will be used to do so?

   - become_method
   - **become_flags**
   - become_shell
   - become

6. We have a playbook `file.yml` under `~/playbooks/web1` that simply creates a file `test.txt` on node `web1`. The user used to connect to the host does not have sufficient privileges to create the file on the desired location but has `sudo` access. Make the appropriate changes so that the user's privileges as elevated when the playbook is run.

   You can use the command `ansible-playbook -i inventory file.yml` to run the playbook.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   ##### Update the `file.yml` playbook as given below.

   ```
   ---
   -  hosts: web1
      gather_facts: no
      become: true
      tasks:
        - name: Create a blank file under admin home
          file:
            path: /home/admin/test.txt
            state: touch
   ```

   ##### If you see below given error

   ```
   fatal: [web1]: FAILED! => {"msg": "Using a SSH password instead of a key is not possible because Host Key checking is enabled and sshpass does not support this.  Please add this host's fingerprint to your known_hosts file to manage this host."}
   ```

   ##### Update `ansible.cfg` and uncomment `#host_key_checking`

   ```unix
   sudo vi /etc/ansible/ansible.cfg
   ```

   ##### It should look like.

   ```
   host_key_checking = False
   ```

7. When the file was created on the host, the owner of the file became `root` user. However, file was to be created for the `admin` user. Please make the appropriate changes to the `file.yml` playbook so that the file is created as user `admin`.

   You can use the command `ansible-playbook -i inventory file.yml` to run the playbook. To test you may have to delete the file manually once. However if you are confident about your solution then hit the `Check` button and we will test that for you.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   ###### Update the `file.yml` playbook as given below.

   ```yaml
   ---
   -  hosts: web1
      gather_facts: no
      become: true
      become_user: admin
      tasks:
        - name: Create a blank file under admin home
          file:
            path: /home/admin/test.txt
            state: touch
   ```

8. There is a playbook `file.yml` under `~/playbooks/web2/` directory. We want to run `file.yml` playbook as `admin` user on `web2` node, so modify the playbook accordingly. To run the playbook we have created a script `web2.sh` on the same location, so you can execute the script with command `sh web2.sh`. We don’t want to store the sudo password in any file due to security reasons. Make the necessary changes so that when the script is run, the playbook must prompt for the become password.

   ansible` user's password on `web2` is `Passw0rd


   Check

   - Syntax Check
   - Prepare Environment
   - Playbook must run and ask for SUDO password
   - Verify Tasks

   Update the `file.yml` playbook as given below.

```yaml
---
- hosts: all
  gather_facts: no
  become: true
  become_user: admin
  tasks:
    - name: Create a blank file
      file:
        path: /home/admin/test.txt
        state: touch
```

###### Edit the `web2.sh` script and add `--ask-become-pass`.

```unix
vi web2.sh
```

###### It should look like.

```unix
#!/bin/bash
ansible-playbook -i inventory file.yml --ask-become-pass
```



9. We need privilege escalation to be enabled across all playbooks without having to specify in each play, make the necessary changes in `/etc/ansible/ansible.cfg` file to activate privilege escalation.

   Check

   ##### Edit ansible configuration file and set `become=True`.

   ```unix
   sudo vi /etc/ansible/ansible.cfg
   ```

   ##### It should look like.

   ```
   [privilege_escalation]
   become=True
   ```

10. Our organization recently introduced changes in security. Going forward we'd like to use `doas` as privilege escalation tool for all managed nodes without having to update inventories or passing in command line parameters for each node. Make the necessary changes.

   Check

   ##### Edit ansible configuration file and set `become_method=doas`.

   ```unix
   sudo vi /etc/ansible/ansible.cfg
   ```

   ##### It should look like.

   ```
   [privilege_escalation]
   become=True
   become_method=doas
   ```



# FAQ

## LABS – YAML SYNTAX AND ERRORS IN PLAYBOOKS

1. Let us explore the environment for our `KodeKloud e-commerce LAMP stack` application. There are 2 servers - `lamp-web` and `lamp-db`. Let us setup the inventory files for that. Create an inventory file at `/home/thor/playbooks/lamp-stack-playbooks/inventory` to include the following data:

   **Hosts:** `lamp-web, lamp-db`

   **Groups:** `db_servers` contains `lamp-db`; `web_servers` contains `lamp-web`

   **IP Addresses:** `lamp-web: 172.20.1.100; lamp-db: 172.20.1.101`

   **Credentials for lamp-web:** `Username=john Password=john`

   **Credentials for lamp-db** `Username=maria Password=maria`

   Check

   - Inventory must contain hosts
   - Inventory must contain groups
   - lamp-web server: Host, User and Password
   - lamp-db server: Host, User & Password

   inventory

   ```
   [db_servers]
   lamp-db ansible_host=172.20.1.101 ansible_ssh_pass=maria ansible_user=maria
   
   [web_servers]
   lamp-web ansible_host=172.20.1.100 ansible_ssh_pass=john ansible_user=john
   ```

   ```
   $ ansible all -m ping -i inventory 
   lamp-db | SUCCESS => {
       "changed": false, 
       "ping": "pong"
   }
   lamp-web | SUCCESS => {
       "changed": false, 
       "ping": "pong"
   }
   ```

2. Let's add some additional data required for setting up the database and web servers. The data should be associated with the respective servers.

   **Database Info:**

   ```
   mysqlservice=mysqld
   mysql_port=3306
   dbname=ecomdb
   dbuser=ecomuser
   dbpassword=ecompassword
   ```

   **Web Info:**

   ```
   httpd_port=80
   repository=https://github.com/kodekloudhub/learning-app-ecommerce.git
   ```

   Check

   - lamp-db server: dbname, dbpassword, dbuser
   - lamp-db server: mysql_port
   - lamp-db server: mysql_port
   - lamp-web server: httpd_port
   - lamp-web server: repository

   ```
   [db_servers]
   lamp-db ansible_host=172.20.1.101 ansible_user=maria mysqlservice=mysqld mysql_port=3306 dbname=ecomdb dbuser=ecomuser dbpassword=ecompassword
   
   [web_servers]
   lamp-web ansible_host=172.20.1.100 ansible_user=john httpd_port=80 repository=https://github.com/kodekloudhub/learning-app-ecommerce.git
   ```

3. Let us setup password less authentication between `Ansible Controller` and the web/db servers.

   Create a pair of SSH keys for each user (without any passphrase) at `/home/thor/.ssh/maria` and `/home/thor/.ssh/john`

   And distribute the public keys to the web and database servers - `lamp-db` and `lamp-web`.

   DB server user is `maria` and its password is `maria`. Web server user is `john` and its password is `john`.

   Check

   - Generate SSH Keys for Maria
   - Generate SSH Keys for John
   - Distribute Maria's keys to lamp-db
   - Distribute John's keys to web server

   Create ssh key

   ```
   $ ssh-keygen -f /home/thor/.ssh/maria
   Generating public/private rsa key pair.
   Enter passphrase (empty for no passphrase): 
   Enter same passphrase again: 
   Your identification has been saved in /home/thor/.ssh/maria.
   Your public key has been saved in /home/thor/.ssh/maria.pub.
   The key fingerprint is:
   SHA256:4W6jdeVxiPCABPy5iS1ooJm7JeBDkBqUTrYavR/kmNk thor@ansible-controller
   The key's randomart image is:
   +---[RSA 2048]----+
   | ......          |
   |.=  .. .         |
   |B..  ...+        |
   |=+. . o. = . .   |
   |=* X o oS o + .  |
   |O B E +.   o o   |
   |.=.. o  = . .    |
   |.o. .  + o       |
   |..    .          |
   +----[SHA256]-----+
   ```

   ```
   $ ssh-keygen -f /home/thor/.ssh/john 
   Generating public/private rsa key pair.
   Enter passphrase (empty for no passphrase): 
   Enter same passphrase again: 
   Your identification has been saved in /home/thor/.ssh/john.
   Your public key has been saved in /home/thor/.ssh/john.pub.
   The key fingerprint is:
   SHA256:N0pLdVvb40sImKwBvZ1RSXNvLJaYjecdVMsjonx7j1k thor@ansible-controller
   The key's randomart image is:
   +---[RSA 2048]----+
   |          .+.. .o|
   |      .   ..B * .|
   |     . . ..=.B.O |
   |      . =.*.=o=oo|
   |       oSOoo...o.|
   |       oo+..o o .|
   |       .o  . o E |
   |            . * .|
   |             o o |
   +----[SHA256]-----+
   ```

   

   Copy ssh public key in remote servers

   ```
   $ ssh-copy-id -i /home/thor/.ssh/maria maria@lamp-db
   /bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/maria.pub"
   The authenticity of host 'lamp-db (172.20.1.101)' can't be established.
   ECDSA key fingerprint is SHA256:uNTmVywMAW6xMJp4vFGlRAsQelwcEBOr/ThU7LexNbc.
   ECDSA key fingerprint is MD5:83:49:cd:9f:e7:ef:a1:c8:73:ef:c0:76:7b:ba:48:d7.
   Are you sure you want to continue connecting (yes/no)? yes
   /bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
   /bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
   maria@lamp-db's password: 
   
   Number of key(s) added: 1
   
   Now try logging into the machine, with:   "ssh 'maria@lamp-db'"
   and check to make sure that only the key(s) you wanted were added.
   ```

   ```
   $ ssh-copy-id -i /home/thor/.ssh/john john@lamp-web
   /bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/john.pub"
   The authenticity of host 'lamp-web (172.20.1.100)' can't be established.
   ECDSA key fingerprint is SHA256:uNTmVywMAW6xMJp4vFGlRAsQelwcEBOr/ThU7LexNbc.
   ECDSA key fingerprint is MD5:83:49:cd:9f:e7:ef:a1:c8:73:ef:c0:76:7b:ba:48:d7.
   Are you sure you want to continue connecting (yes/no)? yes
   /bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
   /bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
   john@lamp-web's password: 
   
   Number of key(s) added: 1
   
   Now try logging into the machine, with:   "ssh 'john@lamp-web'"
   and check to make sure that only the key(s) you wanted were added.
   ```

4. Update the inventory file to use the newly created private keys for the respective hosts

   Check

   - Inventory uses private key file for lamp-db
   - Inventory uses private key file for lamp-web
   - Inventory no longer contains passwords for lamp-web
   - Inventory no longer contains passwords for lamp-db

   inventory

   ```
   [db_servers]
   lamp-db ansible_host=172.20.1.101 ansible_ssh_private_key_file=/home/thor/.ssh/maria ansible_user=maria mysqlservice=mysqld mysql_port=3306 dbname=ecomdb dbuser=ecomuser dbpassword=ecompassword
   
   [web_servers]
   lamp-web ansible_host=172.20.1.100 ansible_ssh_private_key_file=/home/thor/.ssh/john ansible_user=john httpd_port=80 repository=https://github.com/kodekloudhub/learning-app-ecommerce.git
   ```

5. A playbook `deploy-lamp-stack.yml` is given with a basic tasks to install basic libraries. Execute the playbook and fix any issues.

   You are not required to add any tasks or plays. Only fix the issue with execution.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   ```
   $ ansible-playbook -i inventory deploy-lamp-stack.yml 
   
   PLAY [Deploy lamp stack application] ****************************************************************
   
   TASK [Gathering Facts] ******************************************************************************
   ok: [lamp-web]
   ok: [lamp-db]
   
   TASK [Install common dependencies] ******************************************************************
   fatal: [lamp-db]: FAILED! => {"changed": false, "msg": "ovl: Error while doing RPMdb copy-up:\n[Errno 13] Permission denied: '/var/lib/rpm/Sigmd5'\nYou need to be root to perform this command.\n", "rc": 1, "results": ["Loaded plugins: fastestmirror, ovl\n"]}
   fatal: [lamp-web]: FAILED! => {"changed": false, "msg": "ovl: Error while doing RPMdb copy-up:\n[Errno 13] Permission denied: '/var/lib/rpm/Sigmd5'\nYou need to be root to perform this command.\n", "rc": 1, "results": ["Loaded plugins: fastestmirror, ovl\n"]}
           to retry, use: --limit @/home/thor/playbooks/lamp-stack-playbooks/deploy-lamp-stack.retry
   
   PLAY RECAP ******************************************************************************************
   lamp-db                    : ok=1    changed=0    unreachable=0    failed=1   
   lamp-web                   : ok=1    changed=0    unreachable=0    failed=1   
   ```

   Edit deploy-lamp-stack.yml

   ```
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - libselinux-python
             - libsemanage-python
             - firewalld
           state: installed
   ```

   ```
   $ ansible-playbook -i inventory deploy-lamp-stack.yml 
   
   PLAY [Deploy lamp stack application] ****************************************************************
   
   TASK [Gathering Facts] ******************************************************************************
   ok: [lamp-db]
   ok: [lamp-web]
   
   TASK [Install common dependencies] ******************************************************************
   changed: [lamp-db]
   changed: [lamp-web]
   
   PLAY RECAP ******************************************************************************************
   lamp-db                    : ok=2    changed=1    unreachable=0    failed=0   
   lamp-web                   : ok=2    changed=1    unreachable=0    failed=0   
   ```



# Ansible Modules

inventory

```
web1 ansible_host=172.20.1.100 ansible_ssh_pass=Passw0rd ansible_user=root
```

ansible.cfg

```
# config file for ansible -- https://ansible.com/
# ===============================================

# nearly all parameters can be overridden in ansible-playbook
# or with command line flags. ansible will read ANSIBLE_CONFIG,
# ansible.cfg in the current working directory, .ansible.cfg in
# the home directory or /etc/ansible/ansible.cfg, whichever it
# finds first

[defaults]

# some basic default values...

#inventory      = /etc/ansible/hosts
#library        = /usr/share/my_modules/
#module_utils   = /usr/share/my_module_utils/
#remote_tmp     = ~/.ansible/tmp
#local_tmp      = ~/.ansible/tmp
#plugin_filters_cfg = /etc/ansible/plugin_filters.yml
#forks          = 5
#poll_interval  = 15
#sudo_user      = root
#ask_sudo_pass = True
#ask_pass      = True
#transport      = smart
#remote_port    = 22
#module_lang    = C
#module_set_locale = False

# plays will gather facts by default, which contain information about
# the remote system.
#
# smart - gather by default, but don't regather if already gathered
# implicit - gather by default, turn off with gather_facts: False
# explicit - do not gather by default, must say gather_facts: True
gathering = explicit

# This only affects the gathering done by a play's gather_facts directive,
# by default gathering retrieves all facts subsets
# all - gather all subsets
# network - gather min and network facts
# hardware - gather hardware facts (longest facts to retrieve)
# virtual - gather min and virtual facts
# facter - import facts from facter
# ohai - import facts from ohai
# You can combine them using comma (ex: network,virtual)
# You can negate them using ! (ex: !hardware,!facter,!ohai)
# A minimal set of facts is always gathered.
#gather_subset = all

# some hardware related facts are collected
# with a maximum timeout of 10 seconds. This
# option lets you increase or decrease that
# timeout to something more suitable for the
# environment.
# gather_timeout = 10

# Ansible facts are available inside the ansible_facts.* dictionary
# namespace. This setting maintains the behaviour which was the default prior
# to 2.5, duplicating these variables into the main namespace, each with a
# prefix of 'ansible_'.
# This variable is set to True by default for backwards compatibility. It
# will be changed to a default of 'False' in a future release.
# ansible_facts.
# inject_facts_as_vars = True

# additional paths to search for roles in, colon separated
#roles_path    = /etc/ansible/roles

# uncomment this to disable SSH key host checking
host_key_checking = False

# change the default callback, you can only have one 'stdout' type  enabled at a time.
#stdout_callback = skippy


## Ansible ships with some plugins that require whitelisting,
## this is done to avoid running all of a type by default.
## These setting lists those that you want enabled for your system.
## Custom plugins should not need this unless plugin author specifies it.

# enable callback plugins, they can output to stdout but cannot be 'stdout' type.
#callback_whitelist = timer, mail

# Determine whether includes in tasks and handlers are "static" by
# default. As of 2.0, includes are dynamic by default. Setting these
# values to True will make includes behave more like they did in the
# 1.x versions.
#task_includes_static = False
#handler_includes_static = False

# Controls if a missing handler for a notification event is an error or a warning
#error_on_missing_handler = True

# change this for alternative sudo implementations
#sudo_exe = sudo

# What flags to pass to sudo
# WARNING: leaving out the defaults might create unexpected behaviours
#sudo_flags = -H -S -n

# SSH timeout
#timeout = 10

# default user to use for playbooks if user is not specified
# (/usr/bin/ansible will use current user as default)
#remote_user = root

# logging is off by default unless this path is defined
# if so defined, consider logrotate
#log_path = /var/log/ansible.log

# default module name for /usr/bin/ansible
#module_name = command

# use this shell for commands executed under sudo
# you may need to change this to bin/bash in rare instances
# if sudo is constrained
#executable = /bin/sh

# if inventory variables overlap, does the higher precedence one win
# or are hash values merged together?  The default is 'replace' but
# this can also be set to 'merge'.
#hash_behaviour = replace

# by default, variables from roles will be visible in the global variable
# scope. To prevent this, the following option can be enabled, and only
# tasks and handlers within the role will see the variables there
#private_role_vars = yes

# list any Jinja2 extensions to enable here:
#jinja2_extensions = jinja2.ext.do,jinja2.ext.i18n

# if set, always use this private key file for authentication, same as
# if passing --private-key to ansible or ansible-playbook
#private_key_file = /path/to/file

# If set, configures the path to the Vault password file as an alternative to
# specifying --vault-password-file on the command line.
#vault_password_file = /path/to/vault_password_file

# format of string {{ ansible_managed }} available within Jinja2
# templates indicates to users editing templates files will be replaced.
# replacing {file}, {host} and {uid} and strftime codes with proper values.
#ansible_managed = Ansible managed: {file} modified on %Y-%m-%d %H:%M:%S by {uid} on {host}
# {file}, {host}, {uid}, and the timestamp can all interfere with idempotence
# in some situations so the default is a static string:
#ansible_managed = Ansible managed

# by default, ansible-playbook will display "Skipping [host]" if it determines a task
# should not be run on a host.  Set this to "False" if you don't want to see these "Skipping"
# messages. NOTE: the task header will still be shown regardless of whether or not the
# task is skipped.
#display_skipped_hosts = True

# by default, if a task in a playbook does not include a name: field then
# ansible-playbook will construct a header that includes the task's action but
# not the task's args.  This is a security feature because ansible cannot know
# if the *module* considers an argument to be no_log at the time that the
# header is printed.  If your environment doesn't have a problem securing
# stdout from ansible-playbook (or you have manually specified no_log in your
# playbook on all of the tasks where you have secret information) then you can
# safely set this to True to get more informative messages.
#display_args_to_stdout = False

# by default (as of 1.3), Ansible will raise errors when attempting to dereference
# Jinja2 variables that are not set in templates or action lines. Uncomment this line
# to revert the behavior to pre-1.3.
#error_on_undefined_vars = False

# by default (as of 1.6), Ansible may display warnings based on the configuration of the
# system running ansible itself. This may include warnings about 3rd party packages or
# other conditions that should be resolved if possible.
# to disable these warnings, set the following value to False:
#system_warnings = True

# by default (as of 1.4), Ansible may display deprecation warnings for language
# features that should no longer be used and will be removed in future versions.
# to disable these warnings, set the following value to False:
#deprecation_warnings = True

# (as of 1.8), Ansible can optionally warn when usage of the shell and
# command module appear to be simplified by using a default Ansible module
# instead.  These warnings can be silenced by adjusting the following
# setting or adding warn=yes or warn=no to the end of the command line
# parameter string.  This will for example suggest using the git module
# instead of shelling out to the git command.
# command_warnings = False


# set plugin path directories here, separate with colons
#action_plugins     = /usr/share/ansible/plugins/action
#cache_plugins      = /usr/share/ansible/plugins/cache
#callback_plugins   = /usr/share/ansible/plugins/callback
#connection_plugins = /usr/share/ansible/plugins/connection
#lookup_plugins     = /usr/share/ansible/plugins/lookup
#inventory_plugins  = /usr/share/ansible/plugins/inventory
#vars_plugins       = /usr/share/ansible/plugins/vars
#filter_plugins     = /usr/share/ansible/plugins/filter
#test_plugins       = /usr/share/ansible/plugins/test
#terminal_plugins   = /usr/share/ansible/plugins/terminal
#strategy_plugins   = /usr/share/ansible/plugins/strategy


# by default, ansible will use the 'linear' strategy but you may want to try
# another one
#strategy = free

# by default callbacks are not loaded for /bin/ansible, enable this if you
# want, for example, a notification or logging callback to also apply to
# /bin/ansible runs
#bin_ansible_callbacks = False


# don't like cows?  that's unfortunate.
# set to 1 if you don't want cowsay support or export ANSIBLE_NOCOWS=1
#nocows = 1

# set which cowsay stencil you'd like to use by default. When set to 'random',
# a random stencil will be selected for each task. The selection will be filtered
# against the `cow_whitelist` option below.
#cow_selection = default
#cow_selection = random

# when using the 'random' option for cowsay, stencils will be restricted to this list.
# it should be formatted as a comma-separated list with no spaces between names.
# NOTE: line continuations here are for formatting purposes only, as the INI parser
#       in python does not support them.
#cow_whitelist=bud-frogs,bunny,cheese,daemon,default,dragon,elephant-in-snake,elephant,eyes,\
#              hellokitty,kitty,luke-koala,meow,milk,moofasa,moose,ren,sheep,small,stegosaurus,\
#              stimpy,supermilker,three-eyes,turkey,turtle,tux,udder,vader-koala,vader,www

# don't like colors either?
# set to 1 if you don't want colors, or export ANSIBLE_NOCOLOR=1
#nocolor = 1

# if set to a persistent type (not 'memory', for example 'redis') fact values
# from previous runs in Ansible will be stored.  This may be useful when
# wanting to use, for example, IP information from one group of servers
# without having to talk to them in the same playbook run to get their
# current IP information.
#fact_caching = memory

#This option tells Ansible where to cache facts. The value is plugin dependent.
#For the jsonfile plugin, it should be a path to a local directory.
#For the redis plugin, the value is a host:port:database triplet: fact_caching_connection = localhost:6379:0

#fact_caching_connection=/tmp



# retry files
# When a playbook fails by default a .retry file will be created in ~/
# You can disable this feature by setting retry_files_enabled to False
# and you can change the location of the files by setting retry_files_save_path

#retry_files_enabled = False
#retry_files_save_path = ~/.ansible-retry

# squash actions
# Ansible can optimise actions that call modules with list parameters
# when looping. Instead of calling the module once per with_ item, the
# module is called once with all items at once. Currently this only works
# under limited circumstances, and only with parameters named 'name'.
#squash_actions = apk,apt,dnf,homebrew,pacman,pkgng,yum,zypper

# prevents logging of task data, off by default
#no_log = False

# prevents logging of tasks, but only on the targets, data is still logged on the master/controller
#no_target_syslog = False

# controls whether Ansible will raise an error or warning if a task has no
# choice but to create world readable temporary files to execute a module on
# the remote machine.  This option is False by default for security.  Users may
# turn this on to have behaviour more like Ansible prior to 2.1.x.  See
# https://docs.ansible.com/ansible/become.html#becoming-an-unprivileged-user
# for more secure ways to fix this than enabling this option.
#allow_world_readable_tmpfiles = False

# controls the compression level of variables sent to
# worker processes. At the default of 0, no compression
# is used. This value must be an integer from 0 to 9.
#var_compression_level = 9

# controls what compression method is used for new-style ansible modules when
# they are sent to the remote system.  The compression types depend on having
# support compiled into both the controller's python and the client's python.
# The names should match with the python Zipfile compression types:
# * ZIP_STORED (no compression. available everywhere)
# * ZIP_DEFLATED (uses zlib, the default)
# These values may be set per host via the ansible_module_compression inventory
# variable
#module_compression = 'ZIP_DEFLATED'

# This controls the cutoff point (in bytes) on --diff for files
# set to 0 for unlimited (RAM may suffer!).
#max_diff_size = 1048576

# This controls how ansible handles multiple --tags and --skip-tags arguments
# on the CLI.  If this is True then multiple arguments are merged together.  If
# it is False, then the last specified argument is used and the others are ignored.
# This option will be removed in 2.8.
#merge_multiple_cli_flags = True

# Controls showing custom stats at the end, off by default
#show_custom_stats = True

# Controls which files to ignore when using a directory as inventory with
# possibly multiple sources (both static and dynamic)
#inventory_ignore_extensions = ~, .orig, .bak, .ini, .cfg, .retry, .pyc, .pyo

# This family of modules use an alternative execution path optimized for network appliances
# only update this setting if you know how this works, otherwise it can break module execution
#network_group_modules=eos, nxos, ios, iosxr, junos, vyos

# When enabled, this option allows lookups (via variables like {{lookup('foo')}} or when used as
# a loop with `with_foo`) to return data that is not marked "unsafe". This means the data may contain
# jinja2 templating language which will be run through the templating engine.
# ENABLING THIS COULD BE A SECURITY RISK
#allow_unsafe_lookups = False

# set default errors for all plays
#any_errors_fatal = False

[inventory]
# enable inventory plugins, default: 'host_list', 'script', 'yaml', 'ini', 'auto'
#enable_plugins = host_list, virtualbox, yaml, constructed

# ignore these extensions when parsing a directory as inventory source
#ignore_extensions = .pyc, .pyo, .swp, .bak, ~, .rpm, .md, .txt, ~, .orig, .ini, .cfg, .retry

# ignore files matching these patterns when parsing a directory as inventory source
#ignore_patterns=

# If 'true' unparsed inventory sources become fatal errors, they are warnings otherwise.
#unparsed_is_failed=False

[privilege_escalation]
#become=True
#become_method=sudo
#become_user=root
#become_ask_pass=False

[paramiko_connection]

# uncomment this line to cause the paramiko connection plugin to not record new host
# keys encountered.  Increases performance on new host additions.  Setting works independently of the
# host key checking setting above.
#record_host_keys=False

# by default, Ansible requests a pseudo-terminal for commands executed under sudo. Uncomment this
# line to disable this behaviour.
#pty=False

# paramiko will default to looking for SSH keys initially when trying to
# authenticate to remote devices.  This is a problem for some network devices
# that close the connection after a key failure.  Uncomment this line to
# disable the Paramiko look for keys function
#look_for_keys = False

# When using persistent connections with Paramiko, the connection runs in a
# background process.  If the host doesn't already have a valid SSH key, by
# default Ansible will prompt to add the host key.  This will cause connections
# running in background processes to fail.  Uncomment this line to have
# Paramiko automatically add host keys.
#host_key_auto_add = True

[ssh_connection]

# ssh arguments to use
# Leaving off ControlPersist will result in poor performance, so use
# paramiko on older platforms rather than removing it, -C controls compression use
#ssh_args = -C -o ControlMaster=auto -o ControlPersist=60s

# The base directory for the ControlPath sockets.
# This is the "%(directory)s" in the control_path option
#
# Example:
# control_path_dir = /tmp/.ansible/cp
#control_path_dir = ~/.ansible/cp

# The path to use for the ControlPath sockets. This defaults to a hashed string of the hostname,
# port and username (empty string in the config). The hash mitigates a common problem users
# found with long hostames and the conventional %(directory)s/ansible-ssh-%%h-%%p-%%r format.
# In those cases, a "too long for Unix domain socket" ssh error would occur.
#
# Example:
# control_path = %(directory)s/%%h-%%r
#control_path =

# Enabling pipelining reduces the number of SSH operations required to
# execute a module on the remote server. This can result in a significant
# performance improvement when enabled, however when using "sudo:" you must
# first disable 'requiretty' in /etc/sudoers
#
# By default, this option is disabled to preserve compatibility with
# sudoers configurations that have requiretty (the default on many distros).
#
#pipelining = False

# Control the mechanism for transferring files (old)
#   * smart = try sftp and then try scp [default]
#   * True = use scp only
#   * False = use sftp only
#scp_if_ssh = smart

# Control the mechanism for transferring files (new)
# If set, this will override the scp_if_ssh option
#   * sftp  = use sftp to transfer files
#   * scp   = use scp to transfer files
#   * piped = use 'dd' over SSH to transfer files
#   * smart = try sftp, scp, and piped, in that order [default]
#transfer_method = smart

# if False, sftp will not use batch mode to transfer files. This may cause some
# types of file transfer failures impossible to catch however, and should
# only be disabled if your sftp version has problems with batch mode
#sftp_batch_mode = False

# The -tt argument is passed to ssh when pipelining is not enabled because sudo
# requires a tty by default.
#use_tty = True

# Number of times to retry an SSH connection to a host, in case of UNREACHABLE.
# For each retry attempt, there is an exponential backoff,
# so after the first attempt there is 1s wait, then 2s, 4s etc. up to 30s (max).
#retries = 3

[persistent_connection]

# Configures the persistent connection timeout value in seconds.  This value is
# how long the persistent connection will remain idle before it is destroyed.
# If the connection doesn't receive a request before the timeout value
# expires, the connection is shutdown. The default value is 30 seconds.
#connect_timeout = 30

# Configures the persistent connection retry timeout.  This value configures the
# the retry timeout that ansible-connection will wait to connect
# to the local domain socket. This value must be larger than the
# ssh timeout (timeout) and less than persistent connection idle timeout (connect_timeout).
# The default value is 15 seconds.
#connect_retry_timeout = 15

# The command timeout value defines the amount of time to wait for a command
# or RPC call before timing out. The value for the command timeout must
# be less than the value of the persistent connection idle timeout (connect_timeout)
# The default value is 10 second.
#command_timeout = 10

[accelerate]
#accelerate_port = 5099
#accelerate_timeout = 30
#accelerate_connect_timeout = 5.0

# The daemon timeout is measured in minutes. This time is measured
# from the last activity to the accelerate daemon.
#accelerate_daemon_timeout = 30

# If set to yes, accelerate_multi_key will allow multiple
# private keys to be uploaded to it, though each user must
# have access to the system via SSH to add a new key. The default
# is "no".
#accelerate_multi_key = yes

[selinux]
# file systems that require special treatment when dealing with security context
# the default behaviour that copies the existing context or uses the user default
# needs to be changed to use the file system dependent context.
#special_context_filesystems=nfs,vboxsf,fuse,ramfs,9p

# Set this to yes to allow libvirt_lxc connections to work without SELinux.
#libvirt_lxc_noseclabel = yes

[colors]
#highlight = white
#verbose = blue
#warn = bright purple
#error = red
#debug = dark gray
#deprecate = purple
#skip = cyan
#unreachable = red
#ok = green
#changed = yellow
#diff_add = green
#diff_remove = red
#diff_lines = cyan


[diff]
# Always print diff when running ( same as always running with -D/--diff )
# always = no

# Set how many context lines to show in diff
# context = 3
```



## LABS – MODULES – PACKAGES

1. Create a playbook `httpd.yml` under `~/playbooks/` to install `httpd` package on `web1` node using Ansible’s `yum` module.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   httpd.yml

   ```
   ---
   - name: Install web server
     hosts: web1
     tasks:
     - yum:
         name: httpd
         state: installed
   ```

   OR

   ```
   ---
   - hosts: web1
     tasks:
     - package:
         name: httpd
         state: installed
   ```

   ```
   ---
   - hosts: web1
     tasks:
     - yum:
         name: httpd
         state: installed
   ```

2. We have an rpm available for `wget` package on URL `http://mirror.centos.org/centos/7/os/x86_64/Packages/wget-1.14-18.el7_6.1.x86_64.rpm`. Create a playbook with name `wget.yml` under `~/playbooks` to install that rpm on `web1` node using `yum` module.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   wget.yml

   ```
   ---
   - hosts: web1
     tasks:
     - yum:
         name: http://mirror.centos.org/centos/7/os/x86_64/Packages/wget-1.14-18.el7_6.1.x86_64.rpm
         state: present
   ```

   ```
   $ ansible-playbook wget.yml -i inventory -v
   Using /home/thor/playbooks/ansible.cfg as config file
   /home/thor/playbooks/inventory did not meet host_list requirements, check plugin documentation if this is unexpected
   
   PLAY [web1] *************************************************************************************************
   
   TASK [yum] **************************************************************************************************
   changed: [web1] => {"ansible_facts": {"pkg_mgr": "yum"}, "changed": true, "msg": "", "rc": 0, "results": ["Loaded plugins: fastestmirror, ovl\nExamining /root/.ansible/tmp/ansible-tmp-1680563608.99-40185687345602/wget-1.14-18.el7_6.1.x86_646bBy6x.rpm: wget-1.14-18.el7_6.1.x86_64\nMarking /root/.ansible/tmp/ansible-tmp-1680563608.99-40185687345602/wget-1.14-18.el7_6.1.x86_646bBy6x.rpm to be installed\nResolving Dependencies\n--> Running transaction check\n---> Package wget.x86_64 0:1.14-18.el7_6.1 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package\n        Arch     Version             Repository                            Size\n================================================================================\nInstalling:\n wget   x86_64   1.14-18.el7_6.1     /wget-1.14-18.el7_6.1.x86_646bBy6x   2.0 M\n\nTransaction Summary\n================================================================================\nInstall  1 Package\n\nTotal size: 2.0 M\nInstalled size: 2.0 M\nDownloading packages:\nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : wget-1.14-18.el7_6.1.x86_64                                  1/1 \ninstall-info: No such file or directory for /usr/share/info/wget.info.gz\n  Verifying  : wget-1.14-18.el7_6.1.x86_64                                  1/1 \n\nInstalled:\n  wget.x86_64 0:1.14-18.el7_6.1                                                 \n\nComplete!\n"]}
   
   PLAY RECAP **************************************************************************************************
   web1                       : ok=1    changed=1    unreachable=0    failed=0   
   ```

3. There is a playbook under `~/playbooks` named as `unzip.yml` to install `unzip` package on `web1` node. We want to install `unzip-5.52` version of this package so before running the playbook make the required changes.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   unzip.yml

   ```
   ---
   - hosts: web1
     tasks:
       - name: Install unzip package
         yum:
           name: unzip-5.52
           state: present
   ```

   ```
   $ ansible-playbook unzip.yml -i inventory -v
   Using /home/thor/playbooks/ansible.cfg as config file
   /home/thor/playbooks/inventory did not meet host_list requirements, check plugin documentation if this is unexpected
   
   PLAY [web1] ************************************************************************************************
   
   TASK [Install unzip package] *******************************************************************************
   changed: [web1] => {"ansible_facts": {"pkg_mgr": "yum"}, "changed": true, "msg": "", "rc": 0, "results": ["Loaded plugins: fastestmirror, ovl\nLoading mirror speeds from cached hostfile\n * base: tx-mirror.tier.net\n * extras: mirrors.greenmountainaccess.net\n * updates: mirror.genesisadaptive.com\nResolving Dependencies\n--> Running transaction check\n---> Package unzip.x86_64 0:5.52-8mdv2009.1 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package       Arch           Version                   Repository         Size\n================================================================================\nInstalling:\n unzip         x86_64         5.52-8mdv2009.1           localrepo         180 k\n\nTransaction Summary\n================================================================================\nInstall  1 Package\n\nTotal download size: 180 k\nInstalled size: 621 k\nDownloading packages:\nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : unzip-5.52-8mdv2009.1.x86_64                                 1/1 \n  Verifying  : unzip-5.52-8mdv2009.1.x86_64                                 1/1 \n\nInstalled:\n  unzip.x86_64 0:5.52-8mdv2009.1                                                \n\nComplete!\n"]}
   
   PLAY RECAP *************************************************************************************************
   web1                       : ok=1    changed=1    unreachable=0    failed=0   
   ```

4. Our playbook - `iotop.yml` - to install the latest version of `iotop` package keeps failing. Please fix the issue so that playbook can work.

   The playbook is located under `~/playbooks` directory. And the inventory file is `inventory`

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   ```
   $ ansible-playbook iotop.yml -i inventory -v
   Using /home/thor/playbooks/ansible.cfg as config file
   /home/thor/playbooks/inventory did not meet host_list requirements, check plugin documentation if this is unexpected
   ERROR! 'host' is not a valid attribute for a Play
   
   The error appears to have been in '/home/thor/playbooks/iotop.yml': line 2, column 3, but may
   be elsewhere in the file depending on the exact syntax problem.
   
   The offending line appears to be:
   
   ---
   - host: all
     ^ here
   ```

   iotop.yml

   ```
   ---
   - hosts: all
     tasks:
       - name: Install iotop package
         yum:
           name: iotop
           state: latest
   ```

5. We want to install some more packages on `web1` node. Create a playbook `~/playbooks/multi-pkgs.yml` to install the latest version of `sudo` package, moreover we already have `vsftpd` `v3.0.2` installed but due to some compatibility issues we want to install `vsftpd` `v2.2.2` so add a task in same playbook to do so.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   ```
   ---
   - hosts: web1
     tasks:
     - yum: name=sudo state=latest
     - yum: name=vsftpd-2.2.2 state=present allow_downgrade=yes
   ```



## LABS – MODULES – SERVICES

1. Create a playbook `httpd.yml` under `~/playbooks` directory to make sure `httpd` service is started on `web1` node. You can use `~/playbooks/inventory`

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   httpd.yml

   ```
   ---
   - name: Start httpd
     hosts: all
     gather_facts: no
     tasks:
       - name: Start httpd service
         service:
           name: httpd
           state: started
   ```

2. We have a playbook `~/playbooks/file.yml` to copy a file with a welcome message under httpd server's document root on `web1` node. Make changes in the playbook so that httpd server reloads after copying the file, make sure it does not restart the httpd server.

   Check

   - Cleanup Environment
   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   ```
   ---
   - hosts: all
     gather_facts: no
     tasks:
       - name: Copy Apache welcome file
         copy:
           src: index.html
           dest: /var/www/html/index.html
       - service:
           name: httpd
           state: reloaded
   ```

3. We would like the `httpd` service on `web1` node to always start automatically after the system reboots. Update the `httpd.yml` playbook you created earlier with the required changes.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   httpd.yml

   ```
   ---
   - name: Start httpd
     hosts: all
     gather_facts: no
     tasks:
       - name: Start httpd service
         service:
           name: httpd
           state: started
           enabled: true
   ```

4. We created a playbook `~/playbooks/config.yml` to enable port `443` for httpd on `web1` node as we want to run nginx on the default port `80` so port `80` needs to be free. Make changes in the playbook so that httpd service restarts after making these change.

   Check

   - Cleanup Environment
   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   config.yml

   ```
   ---
   - hosts: all
     gather_facts: no
     tasks:
       - name: Make changes in Apache config
         replace:
           path: /etc/httpd/conf/httpd.conf
           regexp: "^Listen 80"
           replace: "Listen 443"
       
       - name: Restart Apache
         service: 
           name: httpd
           state: restarted
   ```

5. Create a playbook `~/playbooks/nginx.yml` to install nginx on `web1` node and make sure nginx service is started and should always start even after the system reboots.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   nginx.yml

   ```
   ---
   - hosts: all
     gather_facts: no
     tasks:
       - name: Install nginx
         yum:
           name: nginx
           state: present
   
       - name: Start and enable Nginx
         service:
           name: nginx
           state: started
           enabled: yes
   ```



## LABS – MODULES – FIREWALLS RULES

1. Using an Ansible playbook install `firewalld` on `web1` node, start and enable its service as well. Name the playbook as `firewall.yml` and keep it under `~/playbooks`.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   firewall.yml

   ```
   ---
   - hosts: web1
     tasks:
      - yum: name=firewalld state=installed
      - service: name=firewalld state=started
   ```

2. We have a requirement on `web1` node to white list `web2` node's IP address `172.20.1.101` in firewall. Create and run a playbook `~/playbooks/whitelist.yml` to do so.

   Add IP in `internal` zone.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   whitelist.yml

   ```
   ---
   - hosts: web1
     tasks:
      - firewalld:
         source: 172.20.1.101
         state: enabled
         zone: internal
         permanent: yes
         immediate: yes
   ```

3. We want to block `161/udp` port on `web1` node permanently. Make a playbook `block.yml` under `~/playbooks/` directory to do so.

   Use `zone: block`

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   block.yml

   ```yaml
   --- 
   - hosts: web1
     tasks:
       - firewalld:        
           port: 161/udp
           zone: block
           permanent: yes
           immediate: yes
           state: enabled
   ```

   To verify, SSH to `web1` server and run the following command:-

   ```sh
   [root@web1 ~]# firewall-cmd --list-ports --zone=block
   161/udp
   ```

4. On `web1` node add firewall rule in `internal` zone to enable `https` connection from Ansible controller machine and make sure that rule must persist even after system reboot. You can create a playbook `https.yml` under `~/playbooks/` directory.

   IP address of ansible controller is `172.20.1.2`.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   https.yml

   ```
   ---
   - hosts: web1
     tasks:
       - name: Enable HTTPS for ansible controller
         firewalld:
           source: 172.20.1.2
           service: https
           zone: internal
           state: enabled
           permanent: yes
   
       - service:
           name: firewalld
           state: reloaded
   ```

   TO verify, SSH to `web1` server and run the following command:-

   ```shell
   [root@web1 ~]# firewall-cmd --list-all --zone=internal
   internal (active)
     target: default
     icmp-block-inversion: no
     interfaces: 
     sources: 172.20.1.101 172.20.1.2
     services: dhcpv6-client https mdns samba-client ssh
     ports: 
     protocols: 
     masquerade: no
     forward-ports: 
     source-ports: 
     icmp-blocks: 
     rich rules: 
   ```

5. We have a playbook `~/playbooks/web2-config.yml`, it has some existing code to change apache’s default port `80` to port `8082` as we want to run Apache on port `8082` on `web2` node. Make some changes as given below before running the playbook.

   **A**. Add an entry in `~/playbooks/inventory` for `web2` node, IP address of `web2` node is `172.20.1.101` and ssh password and username are same as of `web1` (username = root and password = Passw0rd).

   **B**. Update `web2-config.yml` to install `httpd` before updating its port in config, also `start/enable` its service.

   **C**. Install `firewalld` package and `start/enable` its service.

   **D**. As now Apache will listen on port `8082` so edit the playbook to add firewall rule in `public` zone so that Apache can allow all incoming traffic.

   Check

   - Check Inventory
   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   Add the following details to the `inventory` file:-

   ```
   web2 ansible_host=172.20.1.101 ansible_ssh_pass=Passw0rd ansible_user=root
   ```

   Use the following YAML file to perform the given tasks:-

   ```yaml
   ---
   - hosts: web2
     tasks:
       - name: Install pkgs
         yum:
           name: httpd, firewalld
           state: present
   
       - name: Start/Enable services
         service:
           name: "{{ item }}"
           state: started
           enabled: yes
         with_items:
           - httpd
           - firewalld
   
       - name: Change Apache port
         replace:
           path: /etc/httpd/conf/httpd.conf
           regexp: "Listen 80"
           replace: "Listen 8082"
   
       - name: restart Apache
         service:
           name: httpd
           state: restarted
   
       - name: Add firewall rule for Apache
         firewalld:
           port: 8082/tcp
           zone: public
           permanent: yes
           state: enabled
           immediate: true
   ```

   To verify firewall rules, SSH to `web2` server and run the following commands:-

   ```shell
   [root@web2 ~]# firewall-cmd --list-ports --zone=public
   8082/tcp
   ```



## LABS – MODULES – FILECONTENT

1. Create a playbook `~/playbooks/perm.yml` to create a blank file `/opt/data/perm.txt` with `0640` permissions on `web1` node.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   perm.yml

   ```
   ---
   - name: Create file perm.txt
     hosts: web1
     tasks:
      - name: Create file perm.txt
        file: path=/opt/data/perm.txt mode=0640 state=touch
   ```

2. Using a playbook `~/playbooks/index1.yml` create `/var/www/html/index.html` file on `web1` node with content `This line was added using Ansible lineinfile module!`.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   index1.yml

   ```
   ---
   - name: Create index.html on web1
     hosts: web1
     tasks:
     - lineinfile:
         path: /var/www/html/index.html
         line: 'This line was added using Ansible lineinfile module!'
         create: yes
   ```

3. We have a playbook `~/playbooks/find.yml` that recursively finds files in `/opt/data` directory older than 2 minutes and equal or greater than 1 megabyte in size. It also copies those files under `/opt` directory. However it has some missing parameters so its not working as expected, take a look into it and make appropriate changes.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   find.yml

   ```
   ---
   - hosts: web1
     tasks:
       - name: Find files
         find:
           paths: /opt/data
           age: 2m
           size: 1m
           recurse: yes
         register: file
   
       - name: Copy files
         command: "cp {{ item.path }} /opt"
         with_items: "{{ file.files }}"
   ```

4. In `/var/www/html/index.html` file on `web1` node add some additional content using `blockinfile` module. Below is the content:

   ```
   Welcome to KodeKloud!
   This is Ansible Lab.
   ```

   Make sure user owner and group owner of the file is `apache`, also make sure the block is added at beginning of the file. Create a new playbook for this `~/playbooks/index2.yml`

   CheckCompleteIncomplete

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   index2.yml

   ```
   ---
   - name: Add block to index.html
     hosts: web1
     tasks:
      - blockinfile:
         owner: apache
         group: apache
         insertbefore: BOF
         path: /var/www/html/index.html
         block: |
          Welcome to KodeKloud!
          This is Ansible Lab.
   ```

   ```
   [root@web1 ~]# cat /var/www/html/index.html 
   # BEGIN ANSIBLE MANAGED BLOCK
   Welcome to KodeKloud!
   This is Ansible Lab.
   # END ANSIBLE MANAGED BLOCK
   This line was added using Ansible lineinfile module!
   ```

5. On `web1` node we want to run our `httpd` server on port `8080`. Create a playbook `~/playbooks/httpd.yml` to change port `80` to `8080` in `/etc/httpd/conf/httpd.conf` file using `replace` module. Also make sure Ansible restarts `httpd` service after making the change.

   ```
   Listen 80` is the parameter that need to be changed in `/etc/httpd/conf/httpd.conf
   ```

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   httpd.yml

   ```
   ---
   - name: replace port 80 to 8080
     hosts: web1
     tasks:
     - replace:
         path: /etc/httpd/conf/httpd.conf
         regexp: 'Listen 80'
         replace: 'Listen 8080'
     - service: name=httpd state=restarted
   ```

   ```
   [root@web1 ~]# grep "Listen" /etc/httpd/conf/httpd.conf 
   # Listen: Allows you to bind Apache to specific IP addresses and/or
   # Change this to Listen on specific IP addresses as shown below to 
   #Listen 12.34.56.78:80
   Listen 8080
   ```



## LABS – MODULES – ARCHIVING

1. Create an `inventory` file under `~/playbooks` directory on Ansible controller host and add `web1` as managed node. IP address of the web1 node is `172.20.1.100`, SSH user is `root` and password is `Passw0rd`.

   Create a playbook `~/playbooks/zip.yml` to make a zip archive `opt.zip` of `/opt` directory on `web1` node and save it under `/root` directory on `web1` node itself.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   ###### Create an `inventory` and`zip.yml` playbook and add below given code

   ```ini
   web1 ansible_host=172.20.1.100 ansible_ssh_pass=Passw0rd ansible_user=root
   ```

   zip.yml

   ```
   ---
   - name: Zip archive opt.zip
     hosts: web1
     tasks:
      - archive:
          path: /opt
          dest: /root/opt.zip
          format: zip
   ```

2. On Ansible controller, we have a zip archive `local.zip`. We want to extract its contents on `web1` under `/tmp` directory. Create a playbook `local.yml` under `~/playbooks` directory to complete the task.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   local.yml

   ```
   ---
   - name: extract local.zip to web1
     hosts: web1
     tasks:
     - unarchive:
         src: local.zip
         dest: /tmp
   ```

3. On `web1` node we have an archive `data.tar.gz` under `/root` directory, extract it under `/srv` directory by developing a playbook `~/playbooks/data.yml` and make sure `data.tar.gz` archive is removed after that.

   Check

   - Syntax Check
   - Apply Playbook
   - Verify Tasks
   - Verify Tasks

   data.yml

   ```
   ---
   - name: Extract data.tar.gz on web1
     hosts: web1
     tasks:
     - unarchive:
         src: /root/data.tar.gz
         dest: /srv
         remote_src: yes
   
     - file: path=/root/data.tar.gz state=absent
   ```

4. Create a playbook `download.yml` under `~/playbooks` directory to download and extract the `https://github.com/kodekloudhub/Hello-World/archive/master.zip` zip archive under `/root` directory on the `web1` node.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   download.yml

   ```
   ---
   - name: Download and extract from URL
     hosts: web1
     tasks:
     -   unarchive:
          src: https://github.com/kodekloudhub/Hello-World/archive/master.zip
          dest: /root
          remote_src: yes
   ```

5. We have three files on `web1` node `/root/file1.txt`, `/usr/local/share/file2.txt` and `/var/log/lastlog`. Create a `bz2` archive of all these files and save it under `/root` directory, name the archive as `files.tar.bz2`. You can create `~/playbooks/files.yml` playbook for it.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   files.yml

   ```
   - name: Compress multiple files
     hosts: web1
     tasks:
     - archive:
        path:
         - /root/file1.txt
         - /usr/local/share/file2.txt
         - /var/log/lastlog
        dest: /root/files.tar.bz2
        format: bz2
   ```

   ```
   [root@web1 ~]# ls -l 
   total 768
   -rw------- 1 root root   3415 Aug  1  2019 anaconda-ks.cfg
   -rw-r--r-- 1 root root      6 Oct  3  2019 file1.txt
   -rw-r--r-- 1 root root    258 Apr  4 02:23 files.tar.bz2
   drwxr-xr-x 2 root root   4096 Oct  7  2019 Hello-World-master
   -rw-r--r-- 1 root root    304 Oct  3  2019 nginx.zip
   -rw-r--r-- 1 root root 761901 Apr  4 02:06 opt.zip
   ```

6. We want to setup `nginx` on `web1` node with some sample html code. Create a playbook `~/playbooks/nginx.yml` to do so. Below are the details about the task:

   **a.** Install `nginx` package and `start/enable` its service.

   **b.** Extract `/root/nginx.zip` archive under `/usr/share/nginx/html` directory.

   **c.** Inside `/usr/share/nginx/html/index.html` replace line `This is sample html code` with line `This is KodeKloud Ansible lab`.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   ```
   ---
   - name: Install and configure nginx on web1
     hosts: web1
     tasks:
     - name: Install nginx
       yum:
         name: nginx
         state: installed
    
     - name: Start/Enable nginx
       service: 
         name: nginx
         state: started
         enabled: true
   
     - name: Extract nginx.zip
       unarchive:
         src: /root/nginx.zip
         dest: /usr/share/nginx/html
         remote_src: yes
   
     - name: Replace line in index.html
       replace:
         path: /usr/share/nginx/html/index.html
         regexp: 'This is sample html code'
         replace: 'This is KodeKloud Ansible lab'
   ```



## LABS – MODULES – SCHEDULED TASKS

1. Create a playbook `~/playbooks/lastlog.yml` to add a cron job `Clear Lastlog` on `node00` to empty the `/var/log/lastlog` logs file. The job must run at `12am everyday`.

   You can use the command `echo “” > /var/log/lastlog` to empty the lastlog file and schedule should be `0 0 * * *`.

   CheckCompleteIncomplete

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   inventory 

   ```
   node00 ansible_host=172.20.1.100 ansible_ssh_pass=Passw0rd ansible_user=root
   ```

   lastlog,yml

   ```
   ---
   - name: Create a cron job to clear last log
     hosts: node00
     tasks:
      - name: Create cron job
        cron:
          name: "Clear Lastlog"
          minute: "0"
          hour: "0"
          job: echo "" > /var/log/lastlog
   ```

2. We have a script `/root/free.sh` on `node00` that is used to check the free system memory. We would like to create a cron `Free Memory Check` to execute this script after `every 2 hour` (i.e 12am, 2am, 4am etc), the command to execute the script is `sh /root/free.sh` and schedule should be `0 */2 * * *`.

   You can create a playbook `~/playbooks/script_cron.yml` for this.

   Check

   - Syntax Check

   - Prepare Environment

   - Apply Playbook

   - Verify Tasks

   script_cron.yml

   ```
   ---
   - name: Create a cron job to run free.sh script
     hosts: node00
     tasks:
      - name: Create cron job
        cron:
          name: "Free Memory Check"
          minute: "0"
          hour: "*/2"
          job: "sh /root/free.sh"
   ```

3. We had a different cron earlier by the name `Check Memory`, to execute a different script - `/root/free.sh` on `node00`. That job was configured to run every 1 hour. However as we have now a new Cronjob configured let us get rid of the old one. Create a playbook `~/playbooks/remove_cron.yml` to remove this cron from `node00`.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   remove_cron.yml

   ```
   ---
   - name: remove cron job from node00
     hosts: node00
     tasks:
     - name: Remove cron job
       cron:
         name: "Check Memory"
         state: absent
   ```

4. Due to some disk space limitations, we want to cleanup the `/tmp` location on `node00` host after every reboot. Create a playbook `~/playbooks/reboot.yml` to add a cron named `cleanup` on `node00` that will execute after every reboot and will clean `/tmp` location.

   The command should be `rm -rf /tmp/*`.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   reboot.yml

   ```
   ---
   - name: "Cleanup /tmp after every reboot"
     hosts: node00
     tasks:
       - cron:
           name: "cleanup"
           job: "rm -rf /tmp/*"
           special_time: reboot
   ```

5. On `node00` we want to keep the installed packages up to date, so we would like to run yum updates regularly. Create a playbook `~/playbooks/yum_update.yml` and create a cron job as described below:

   **a**. Do not add cron directly using crontab instead create a cron file `/etc/cron.d/ansible_yum`.

   **b**. The cron must run on `every Sunday at 8:05 am`.

   **c**. The name of the cron must be `yum update`.

   **d**. Cron should be added for user `root`

   Use command `yum -y update`

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks



## LABS – MODULES – USERS AND GROUPS

1. Which of these options is used with `Users` module to expire a user account

   - **expires**
   - expires_at
   - expiry
   - remove_after

2. Write a playbook `create_user.yml` to create a user named `admin` with `group: admin` and `uid: 2048`

   *NOTE: Your playbook must be placed inside folder: `/home/thor/playbooks/`. Run this playbook for all servers which are listed in `/home/thor/playbooks/inventory` file.*

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   inventory 

   ```
   node00 ansible_host=172.20.1.100 ansible_ssh_pass=Passw0rd ansible_user=root
   node01 ansible_host=172.20.1.101 ansible_ssh_pass=Passw0rd ansible_user=root
   ```

   create_user.yml

   ```
   ---
   - hosts: all
     gather_facts: no
     tasks:
       - group:
           name: 'admin'
           state: present
       - user:
           name: 'admin'
           uid: 2048
           group: 'admin'
   ```

3. Suppose `Sabin Nepal` joined your team on the first day of 2020 as a special contractor to work for a span of 3 years, ie, till the end of the year 2023. He needs his accounts on the remote hosts till his work span.

   Write a playbook `add_user.yml` to create his user account with username `neymarsabin` that would be expiring after 3 years. The `expires` option on the users module is in the epoch. So `Sunday, December 31, 2023 11:59:59 PM GMT`== `1704067199` as epoch time

   Remember: your playbook must be placed inside `/home/thor/playbooks` and use `inventory` file there.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   add_user.yml

   ```
   ---
   - hosts: all
     gather_facts: no
     tasks:
       - user:
           name: 'neymarsabin'
           expires: 1704067199
   ```

4. The `admin` user you created earlier got compromised for some reason, and you need to remove it asap from the system.

   Write a playbook `remove_user.yml` to remove the admin account created earlier.

   Remember, your playbook must be placed inside `/home/thor/playbooks` and use `inventory` file there.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   remove_user.yml

   ```
   ---
   - hosts: all
     gather_facts: no
     tasks:
       - user:
           name: 'admin'
           state: absent
       - group:
           name: 'admin'
           state: absent
   ```

   

## Project Introduction

https://github.com/kodekloudhub/learning-app-ecommerce

**Install Firewall**

```
$ sudo yum install firewalld
$ sudo service firewalld start
$ sudo systemctl enable firewalld
```

**Install MariaDB**

```
$ sudo yum install mariadb-server
```

**Configure MariaDB**

```
$ sudo vi /etc/my.cnf # configure the file with the right port
```

**Start and Enable MariaDB**

```
$ sudo service mariadb start
$ sudo systemctl enable mariadb
```

**Configure Firewall**

```
$ sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
$ sudo firewall-cmd --reload
```

**Configure Database**

```
$ mysql
MariaDB > CREATE DATABASE ecomdb;
MariaDB > CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword’;
MariaDB > GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
MariaDB > FLUSH PRIVILEGES;
```

**Load Data**

```
$ mysql < db-load-script.sql
```

**Install httpd / Install php / Configure Firewall**

```
$ sudo yum install –y httpd php php-mysql
$ sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
$ sudo firewall-cmd --reload
```

**Configure httpd**

```
$ sudo vi /etc/httpd/conf/httpd.conf #
# configure DirectoryIndex to use index.php instead of index.html
```

**Start and Enable httpd**

```
$ sudo service httpd start
$ sudo systemctl enable httpd
```

**Download Code**

```
$ sudo yum install –y git
$ git clone https://github.com/<application>.git /var/www/html/
# Update index.php to use the right database address, name and credentials
```

**Test**

```
$ curl http://localhost
```

## PROJECT – ENVIRONMENT SETUP

1. Let us explore the environment for our `KodeKloud e-commerce LAMP stack` application. There are 2 servers - `lamp-web` and `lamp-db`. Let us setup the inventory files for that. Create an inventory file at `/home/thor/playbooks/lamp-stack-playbooks/inventory` to include the following data:

   **Hosts:** `lamp-web, lamp-db`

   **Groups:** `db_servers` contains `lamp-db`; `web_servers` contains `lamp-web`

   **IP Addresses:** `lamp-web: 172.20.1.100; lamp-db: 172.20.1.101`

   **Credentials for lamp-web:** `Username=john Password=john`

   **Credentials for lamp-db** `Username=maria Password=maria`

   Check

   - Inventory must contain hosts
   - Inventory must contain groups
   - lamp-web server: Host, User and Password
   - lamp-db server: Host, User & Password

   inventory

   ```
   [db_servers]
   lamp-db ansible_host=172.20.1.101 ansible_ssh_pass=maria ansible_user=maria
   
   [web_servers]
   lamp-web ansible_host=172.20.1.100 ansible_ssh_pass=john ansible_user=john
   ```

2. Let's add some additional data required for setting up the database and web servers. The data should be associated with the respective servers.

   **Database Info:**

   ```
   mysqlservice=mysqld
   mysql_port=3306
   dbname=ecomdb
   dbuser=ecomuser
   dbpassword=ecompassword
   ```

   **Web Info:**

   ```
   httpd_port=80
   repository=https://github.com/kodekloudhub/learning-app-ecommerce.git
   ```

   Check

   - lamp-db server: dbname, dbpassword, dbuser
   - lamp-db server: mysql_port
   - lamp-db server: mysql_port
   - lamp-web server: httpd_port
   - lamp-web server: repository

   inventory

   ```
   [db_servers]
   lamp-db ansible_host=172.20.1.101 ansible_user=maria mysqlservice=mysqld mysql_port=3306 dbname=ecomdb dbuser=ecomuser dbpassword=ecompassword
   
   [web_servers]
   lamp-web ansible_host=172.20.1.100 ansible_user=john httpd_port=80 repository=https://github.com/kodekloudhub/learning-app-ecommerce.git
   ```

3. Let us setup password less authentication between `Ansible Controller` and the web/db servers.

   Create a pair of SSH keys for each user (without any passphrase) at `/home/thor/.ssh/maria` and `/home/thor/.ssh/john`

   And distribute the public keys to the web and database servers - `lamp-db` and `lamp-web`.

   DB server user is `maria` and its password is `maria`. Web server user is `john` and its password is `john`.

   Check

   - Generate SSH Keys for Maria
   - Generate SSH Keys for John
   - Distribute Maria's keys to lamp-db
   - Distribute John's keys to web server

   ```
   ssh-keygen -f /home/thor/.ssh/maria 
   
   ssh-keygen -f /home/thor/.ssh/john 
   
   ssh-copy-id -i /home/thor/.ssh/maria maria@lamp-db and 
   
   ssh-copy-id -i /home/thor/.ssh/john john@lamp-web
   ```

4. Update the inventory file to use the newly created private keys for the respective hosts

   Check

   - Inventory uses private key file for lamp-db
   - Inventory uses private key file for lamp-web
   - Inventory no longer contains passwords for lamp-web
   - Inventory no longer contains passwords for lamp-db

   inventory

   ```
   [db_servers]
   lamp-db ansible_host=172.20.1.101 ansible_ssh_private_key_file=/home/thor/.ssh/maria ansible_user=maria mysqlservice=mysqld mysql_port=3306 dbname=ecomdb dbuser=ecomuser dbpassword=ecompassword
   
   [web_servers]
   lamp-web ansible_host=172.20.1.100 ansible_ssh_private_key_file=/home/thor/.ssh/john ansible_user=john httpd_port=80 repository=https://github.com/kodekloudhub/learning-app-ecommerce.git
   ```

5. A playbook `deploy-lamp-stack.yml` is given with a basic tasks to install basic libraries. Execute the playbook and fix any issues.

   You are not required to add any tasks or plays. Only fix the issue with execution.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   deploy-lamp-stack.yml

   ```
   ---
   - name: Deploy lamp stack application
     hosts: all
     become: yes 
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - libselinux-python
             - libsemanage-python
             - firewalld
           state: installed
   ```

6. Perfect! We are all set with our environment to start building our playbooks. Once you go through more Ansible concepts through the course, we will resume developing this project to write playbooks to configure the LAMP stack application.

   OK

## PROJECT – PLAYBOOK

1. Let us continue to improve our `LAMP stack E-Commerce` application. Now that we have learned to develop playbooks and various modules, let's further develop our playbooks to install packages and configure applications.

   Let us start with the first step of installing common dependencies on both the servers. We need the following packages installed on both web and db servers.

   ```
   libselinux-python
   libsemanage-python
   ```

   `firewalld`.

   Playbook: `~/playbooks/lamp-stack-playbooks/deploy-lamp-stack.yml`

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   inventory

   ```
   [db_servers]
   lamp-db ansible_host=172.20.1.101 ansible_ssh_private_key_file=/home/thor/.ssh/maria ansible_user=maria mysqlservice=mysqld mysql_port=3306 dbname=ecomdb dbuser=ecomuser dbpassword=ecompassword
   
   [web_servers]
   lampweb ansible_host=172.20.1.100 ansible_ssh_private_key_file=/home/thor/.ssh/john ansible_user=john httpd_port=80 repository=https://github.com/kodekloudhub/learning-app-ecommerce.git
   ```

   deploy-lamp-stack.yml

   ```
   ---
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - libselinux-python
             - libsemanage-python
             - firewalld
           state: installed
   ```

   ```
   $ ansible-playbook -i inventory deploy-lamp-stack.yml 
   
   PLAY [Deploy lamp stack application] **********************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [lampweb]
   ok: [lamp-db]
   
   TASK [Install common dependencies] ************************************************************************
   changed: [lamp-db]
   changed: [lampweb]
   
   PLAY RECAP ************************************************************************************************
   lamp-db                    : ok=2    changed=1    unreachable=0    failed=0   
   lampweb                    : ok=2    changed=1    unreachable=0    failed=0   
   ```

   

2. Let us now configure MariaDB Service on the `lamp-db` server. Update the playbook to add a play to perform the following tasks on `lamp-db`

   ##### 1. Install the following packages: 

   ```
   mariadb-server
   MySQL-python
   ```

   ##### 2. Copy the MySQL Configuration file

   located at `files/my.cnf` to `/etc/my.cnf`

   ##### 3. Start and enable the `mariadb` Service

   ##### 4. Start and enable the `firewalld` Service

   ##### 5. Insert `firewalld` rule

   Allow mysql_port - `3306/tcp`
   `zone - public`

   Playbook: `~/playbooks/lamp-stack-playbooks/deploy-lamp-stack.yml`

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   **my.cnf**

   ```
   [mysqld]
   innodb-buffer-pool-size=5242880
   # datadir=/var/lib/mysql
   # socket=/var/lib/mysql/mysql.sock
   user=mysql
   # Disabling symbolic-links is recommended to prevent assorted security risks
   symbolic-links=0
   port=3306
   ```

   **deploy-lamp-stack.yml**

   ```
   ---
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - libselinux-python
             - libsemanage-python
             - firewalld
           state: installed
   
   # Install and Configure Database
   - name: Deploy lamp stack application
     hosts: lamp-db
     become: yes
     tasks:
       - name: Install MariaDB package
         yum:
           name:
             - mariadb-server
             - MySQL-python
           state: installed
   
       - name: Create Mysql configuration file
         copy: src=files/my.cnf dest=/etc/my.cnf
   
       - name: Start MariaDB Service
         service: name=mariadb state=started enabled=yes
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule
         firewalld: port={{ mysql_port }}/tcp permanent=true state=enabled immediate=yes
   ```

   ```
   $ ansible-playbook -i inventory deploy-lamp-stack.yml 
   
   PLAY [Deploy lamp stack application] **********************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [lamp-db]
   ok: [lampweb]
   
   TASK [Install common dependencies] ************************************************************************
   ok: [lamp-db]
   ok: [lampweb]
   
   PLAY [Deploy lamp stack application] **********************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [lamp-db]
   
   TASK [Install MariaDB package] ****************************************************************************
   changed: [lamp-db]
   
   TASK [Create Mysql configuration file] ********************************************************************
   changed: [lamp-db]
   
   TASK [Start MariaDB Service] ******************************************************************************
   changed: [lamp-db]
   
   TASK [Start firewalld] ************************************************************************************
   changed: [lamp-db]
   
   TASK [insert firewalld rule] ******************************************************************************
   changed: [lamp-db]
   
   PLAY RECAP ************************************************************************************************
   lamp-db                    : ok=8    changed=5    unreachable=0    failed=0   
   lampweb                    : ok=2    changed=0    unreachable=0    failed=0   
   ```

   

3. Let us now configure MariaDB Database and add some inventory data for our e-commerce store. Update the playbook to add a play to perform the following tasks on `lamp-db`

   ##### 1. Create Application Database

   Use the `dbname` variable from inventory as the name of the database

   ##### 2. Create Application Database User

   Use inventory variables `dbuser` `dbpassword` from inventory.

   ```
   host` should be set to IP address of web server `172.20.1.100
   priv` should be set to `*.*:ALL
   ```

   ##### 3. Copy `db-load-script.sql` file to `/tmp` directory on the database server

   ##### 4. Load Inventory data by running the below `shell` command on the database server

   ```
   mysql -f < /tmp/db-load-script.sql
   ```

   Playbook: `~/playbooks/lamp-stack-playbooks/deploy-lamp-stack.yml`

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Database
   - Verify Data

   db-load-script.sql 

   ```
   USE ecomdb;
   CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;
   
   INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");
   ```

   Update `deploy-lamp-stack.yml` playbook as per below given code

   ```
   ---
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - libselinux-python
             - libsemanage-python
             - firewalld
           state: installed
   
       # Install and Configure Database
   - name: Deploy lamp stack application
     hosts: lamp-db
     become: yes
     tasks:
       - name: Install MariaDB package
         yum:
           name:
             - mariadb-server
             - MySQL-python
           state: installed
   
       - name: Create Mysql configuration file
         copy: src=files/my.cnf dest=/etc/my.cnf
   
       - name: Start MariaDB Service
         service: name=mariadb state=started enabled=yes
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule
         firewalld: port={{ mysql_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Create Application Database
         mysql_db: name={{ dbname }} state=present
   
       - name: Create Application DB User
         mysql_user: name={{ dbuser }} password={{ dbpassword }} priv=*.*:ALL host='172.20.1.100' state=present
   
       - name: Move db-load-script to db host
         copy:
           src: files/db-load-script.sql
           dest: /tmp/db-load-script.sql
   
       - name: Load Inventory Data
         shell: mysql -f < /tmp/db-load-script.sql
   ```

   ```
   $ ansible-playbook -i inventory deploy-lamp-stack.yml 
   
   PLAY [Deploy lamp stack application] **********************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [lampweb]
   ok: [lamp-db]
   
   TASK [Install common dependencies] ************************************************************************
   ok: [lamp-db]
   ok: [lampweb]
   
   PLAY [Deploy lamp stack application] **********************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [lamp-db]
   
   TASK [Install MariaDB package] ****************************************************************************
   ok: [lamp-db]
   
   TASK [Create Mysql configuration file] ********************************************************************
   ok: [lamp-db]
   
   TASK [Start MariaDB Service] ******************************************************************************
   ok: [lamp-db]
   
   TASK [Start firewalld] ************************************************************************************
   ok: [lamp-db]
   
   TASK [insert firewalld rule] ******************************************************************************
   ok: [lamp-db]
   
   TASK [Create Application Database] ************************************************************************
   changed: [lamp-db]
   
   TASK [Create Application DB User] *************************************************************************
   changed: [lamp-db]
   
   TASK [Move db-load-script to db host] *********************************************************************
   changed: [lamp-db]
   
   TASK [Load Inventory Data] ********************************************************************************
   changed: [lamp-db]
   
   PLAY RECAP ************************************************************************************************
   lamp-db                    : ok=12   changed=4    unreachable=0    failed=0   
   lampweb                    : ok=2    changed=0    unreachable=0    failed=0   
   ```

   

4. We now proceed to Installing web service on the web server.

   ##### 1. Install Web Server

   Install `httpd`, `php` and `php-mysql` packages

   ##### 2. Install Git to download source code

   package: `git`

   ##### 3. Start and enable the `firewalld` service

   ##### 4. Insert `firewalld` rule for httpd

   For port use `httpd_port`/tcp variable.

   ##### 4. Set `index.php` as the default page

   Modify line `"DirectoryIndex index.html"` to `"DirectoryIndex index.php"` in file `/etc/httpd/conf/httpd.conf`

   ##### 5. Start and enable the `httpd` service

   Playbook: `~/playbooks/lamp-stack-playbooks/deploy-lamp-stack.yml`

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   Update `deploy-lamp-stack.yml` playbook as per below given code

   ```
   ---
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - libselinux-python
             - libsemanage-python
             - firewalld
           state: installed
   
   # Install and Configure Database
   - name: Deploy lamp stack application
     hosts: lamp-db
     become: yes
     tasks:
       - name: Install MariaDB package
         yum:
           name:
             - mariadb-server
             - MySQL-python
           state: installed
   
       - name: Create Mysql configuration file
         copy: src=files/my.cnf dest=/etc/my.cnf
   
       - name: Start MariaDB Service
         service: name=mariadb state=started enabled=yes
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule
         firewalld: port={{ mysql_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Create Application Database
         mysql_db: name={{ dbname }} state=present
   
       - name: Create Application DB User
         mysql_user: name={{ dbuser }} password={{ dbpassword }} priv=*.*:ALL host='172.20.1.100' state=present
   
       - name: Move db-load-script to db host
         copy:
           src: files/db-load-script.sql
           dest: /tmp/db-load-script.sql
   
       - name: Load Inventory Data
         shell: mysql -f < /tmp/db-load-script.sql
   
   - name: Deploy lamp stack application
     hosts: lampweb
     become: yes
     tasks:
       - name: Install httpd and php
         yum:
           name:
             - httpd
             - php
             - php-mysql
           state: present
   
       - name: Install web role specific dependencies
         yum: name=git state=installed
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule for httpd
         firewalld: port={{ httpd_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Set index.php as the default page
         tags: "Set index.php as the default page"
         replace:
           path: /etc/httpd/conf/httpd.conf
           regexp: 'DirectoryIndex index.html'
           replace: 'DirectoryIndex index.php'
   
       - name: http service state
         service: name=httpd state=started enabled=yes
   ```

   ```
   $ ansible-playbook -i inventory deploy-lamp-stack.yml 
   
   PLAY [Deploy lamp stack application] **********************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [lampweb]
   ok: [lamp-db]
   
   TASK [Install common dependencies] ************************************************************************
   ok: [lampweb]
   ok: [lamp-db]
   
   PLAY [Deploy lamp stack application] **********************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [lamp-db]
   
   TASK [Install MariaDB package] ****************************************************************************
   ok: [lamp-db]
   
   TASK [Create Mysql configuration file] ********************************************************************
   ok: [lamp-db]
   
   TASK [Start MariaDB Service] ******************************************************************************
   ok: [lamp-db]
   
   TASK [Start firewalld] ************************************************************************************
   ok: [lamp-db]
   
   TASK [insert firewalld rule] ******************************************************************************
   ok: [lamp-db]
   
   TASK [Create Application Database] ************************************************************************
   ok: [lamp-db]
   
   TASK [Create Application DB User] *************************************************************************
   ok: [lamp-db]
   
   TASK [Move db-load-script to db host] *********************************************************************
   ok: [lamp-db]
   
   TASK [Load Inventory Data] ********************************************************************************
   changed: [lamp-db]
   
   PLAY [Deploy lamp stack application] **********************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [lampweb]
   
   TASK [Install httpd and php] ******************************************************************************
   changed: [lampweb]
   
   TASK [Install web role specific dependencies] *************************************************************
   changed: [lampweb]
   
   TASK [Start firewalld] ************************************************************************************
   changed: [lampweb]
   
   TASK [insert firewalld rule for httpd] ********************************************************************
   changed: [lampweb]
   
   TASK [Set index.php as the default page] ******************************************************************
   changed: [lampweb]
   
   TASK [http service state] *********************************************************************************
   changed: [lampweb]
   
   PLAY RECAP ************************************************************************************************
   lamp-db                    : ok=12   changed=1    unreachable=0    failed=0   
   lampweb                    : ok=9    changed=6    unreachable=0    failed=0   
   ```

5. Finally, let us download the latest source code of our web application and upload the `index.php` file.

   ##### 1. Clone the source code from the repository

   The address of the URL is given in the inventory file. Use the right variable. Clone it to `/var/www/html/`

   ##### 2. Copy the custom index.php file

   from `files/index.php` to `/var/www/html/index.php`

   Playbook: `~/playbooks/lamp-stack-playbooks/deploy-lamp-stack.yml`

   CheckCompleteIncomplete

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   Update `deploy-lamp-stack.yml` playbook as per below given code

   ```
   ---
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - libselinux-python
             - libsemanage-python
             - firewalld
           state: installed
   
   # Install and Configure Database
   - name: Deploy lamp stack application
     hosts: lamp-db
     become: yes
     tasks:
       - name: Install MariaDB package
         yum:
           name:
             - mariadb-server
             - MySQL-python
           state: installed
   
       - name: Create Mysql configuration file
         copy: src=files/my.cnf dest=/etc/my.cnf
   
       - name: Start MariaDB Service
         service: name=mariadb state=started enabled=yes
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule
         firewalld: port={{ mysql_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Create Application Database
         mysql_db: name={{ dbname }} state=present
   
       - name: Create Application DB User
         mysql_user: name={{ dbuser }} password={{ dbpassword }} priv=*.*:ALL host='172.20.1.100' state=present
   
       - name: Move db-load-script to db host
         copy:
           src: files/db-load-script.sql
           dest: /tmp/db-load-script.sql
   
       - name: Load Inventory Data
         shell: mysql -f < /tmp/db-load-script.sql
   
   - name: Deploy lamp stack application
     hosts: lampweb
     become: yes
     tasks:
       - name: Install httpd and php
         yum:
           name:
             - httpd
             - php
             - php-mysql
           state: present
   
       - name: Install web role specific dependencies
         yum: name=git state=installed
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule for httpd
         firewalld: port={{ httpd_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Set index.php as the default page
         tags: "Set index.php as the default page"
         replace:
           path: /etc/httpd/conf/httpd.conf
           regexp: 'DirectoryIndex index.html'
           replace: 'DirectoryIndex index.php'
   
       - name: http service state
         service: name=httpd state=started enabled=yes
   
       - name: Copy the code from repository
         git: repo={{ repository }} dest=/var/www/html/  force=yes
   
       - name: Creates the index.php file
         copy: src=files/index.php dest=/var/www/html/index.php
   ```

   ```
   $ ansible-playbook -i inventory deploy-lamp-stack.yml 
   
   PLAY [Deploy lamp stack application] **********************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [lamp-db]
   ok: [lampweb]
   
   TASK [Install common dependencies] ************************************************************************
   ok: [lampweb]
   ok: [lamp-db]
   
   PLAY [Deploy lamp stack application] **********************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [lamp-db]
   
   TASK [Install MariaDB package] ****************************************************************************
   ok: [lamp-db]
   
   TASK [Create Mysql configuration file] ********************************************************************
   ok: [lamp-db]
   
   TASK [Start MariaDB Service] ******************************************************************************
   ok: [lamp-db]
   
   TASK [Start firewalld] ************************************************************************************
   ok: [lamp-db]
   
   TASK [insert firewalld rule] ******************************************************************************
   ok: [lamp-db]
   
   TASK [Create Application Database] ************************************************************************
   ok: [lamp-db]
   
   TASK [Create Application DB User] *************************************************************************
   ok: [lamp-db]
   
   TASK [Move db-load-script to db host] *********************************************************************
   ok: [lamp-db]
   
   TASK [Load Inventory Data] ********************************************************************************
   changed: [lamp-db]
   
   PLAY [Deploy lamp stack application] **********************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [lampweb]
   
   TASK [Install httpd and php] ******************************************************************************
   ok: [lampweb]
   
   TASK [Install web role specific dependencies] *************************************************************
   ok: [lampweb]
   
   TASK [Start firewalld] ************************************************************************************
   ok: [lampweb]
   
   TASK [insert firewalld rule for httpd] ********************************************************************
   ok: [lampweb]
   
   TASK [Set index.php as the default page] ******************************************************************
   ok: [lampweb]
   
   TASK [http service state] *********************************************************************************
   ok: [lampweb]
   
   TASK [Copy the code from repository] **********************************************************************
   changed: [lampweb]
   
   TASK [Creates the index.php file] *************************************************************************
   changed: [lampweb]
   
   PLAY RECAP ************************************************************************************************
   lamp-db                    : ok=12   changed=1    unreachable=0    failed=0   
   lampweb                    : ok=11   changed=2    unreachable=0    failed=0 
   ```

6. If not done already you may optionally execute the playbook and wait to completion. Then view the application by clicking the `Web App` link at the top of your terminal.

   OK

# Variables and Jinja2

## LABS – VARIABLE REGISTER

1. A register variable is created when we:

   - execute a task and save the necessary variables to a cache file
   - execute a playbook and debug the variable to inspect it
   - **execute a task and save the returned value in a variable to use in the tasks later**
   - every time we execute an ansible playbook with flag -v

2. How do we print the results, a command is returning?

   - **-v**
   - --debug
   - --trace
   - --verbose

3. Which of the following keywords is used to create a registered variable?

   - set_facts
   - **register**

4. The registered variable is stored in:

   - /tmp
   - **memory**
   - ~/.ansible/tmp
   - remote hosts

5. We need to find the uptime of remote hosts. Out of the following options, which one would print the uptime in your playbook?

   A sample playbook is provided to you to answer this question.
   It is located at `/home/thor/playbooks/uptime.yml` and your remote hosts are listed in the inventory file: `/home/thor/playbooks/inventory`.

   Using options below, make changes to the playbook and run the playbook: `ansible-playbook -i inventory uptime.yml`, and find the uptime.

   - debug: msg=uptime_result.stdout
   - debug: var=uptime_result.output
   - **debug: var=uptime_result.stdout**
   - debug: msg=uptime_result.stdoutput

   inventory

   ```
   web1 ansible_host=172.20.1.100 ansible_ssh_pass=Passw0rd ansible_user=root
   web2 ansible_host=172.20.1.101 ansible_ssh_pass=Passw0rd ansible_user=root[thor@ansible-controller playbooks
   ```

   Modify the playbook and it should look like this:

   uptime.yml

   ```
   - hosts: all
     tasks:
        - shell: uptime
          register: uptime_result
   
        - debug: var=uptime_result.stdout
   ```

   ```
   $ ansible-playbook -i inventory uptime.yml -v
   Using /etc/ansible/ansible.cfg as config file
   /home/thor/playbooks/inventory did not meet host_list requirements, check plugin documentation if this is unexpected
   
   PLAY [all] ************************************************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [web2]
   ok: [web1]
   
   TASK [shell] **********************************************************************************************
   changed: [web2] => {"changed": true, "cmd": "uptime", "delta": "0:00:00.086990", "end": "2023-04-05 08:27:53.682391", "rc": 0, "start": "2023-04-05 08:27:53.595401", "stderr": "", "stderr_lines": [], "stdout": " 08:27:53 up  1:29,  1 user,  load average: 5.18, 5.52, 6.06", "stdout_lines": [" 08:27:53 up  1:29,  1 user,  load average: 5.18, 5.52, 6.06"]}
   changed: [web1] => {"changed": true, "cmd": "uptime", "delta": "0:00:00.083509", "end": "2023-04-05 08:27:53.675469", "rc": 0, "start": "2023-04-05 08:27:53.591960", "stderr": "", "stderr_lines": [], "stdout": " 08:27:53 up  1:29,  1 user,  load average: 5.18, 5.52, 6.06", "stdout_lines": [" 08:27:53 up  1:29,  1 user,  load average: 5.18, 5.52, 6.06"]}
   
   TASK [debug] **********************************************************************************************
   ok: [web1] => {
       "msg": "uptime_result.stdout"
   }
   ok: [web2] => {
       "msg": "uptime_result.stdout"
   }
   
   PLAY RECAP ************************************************************************************************
   web1                       : ok=3    changed=1    unreachable=0    failed=0   
   web2                       : ok=3    changed=1    unreachable=0    failed=0   
   ```

   

6. Symlinks are common in practice while configuring services. Write a playbook which when executed, creates a file `/tmp/by_ansible` on the remote hosts. This file must contains the facts/info of `/var/run` file.

   A playbook is already at `/home/thor/playbooks/playbook.yml` for you to start.
   The remote hosts are listed in the inventory file: `/home/thor/playbooks/inventory`.
   Please complete the task on that file.

   To test it with: `ansible-playbook -i inventory playbook.yml`

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   Update `playbook.yml` playbook as per below given code

   ```
   ---
   - hosts: all
     gather_facts: no  
     tasks:    
       - name: stat module help to find the file info
         stat:
           path: /var/run
         register: your_variable
   
       # for your reference, check the outputs of these
       - debug:
          var=your_variable.stat
   
       # your code goes here...
       - shell: echo "{{your_variable.stat}}" > /tmp/by_ansible
   ```

   ```
   $ ansible-playbook -i inventory playbook.yml 
   
   PLAY [all] ************************************************************************************************
   
   TASK [stat module help to find the file info] *************************************************************
   ok: [web1]
   ok: [web2]
   
   TASK [debug] **********************************************************************************************
   ok: [web1] => {
       "your_variable.stat": {
           "atime": 1680677911.7133505, 
           "attr_flags": "", 
           "attributes": [], 
           "block_size": 4096, 
           "blocks": 0, 
           "charset": "unknown", 
           "ctime": 1680677915.3217132, 
           "dev": 15728778, 
           "device_type": 0, 
           "executable": true, 
           "exists": true, 
           "gid": 0, 
           "gr_name": "root", 
           "inode": 14789261, 
           "isblk": false, 
           "ischr": false, 
           "isdir": false, 
           "isfifo": false, 
           "isgid": false, 
           "islnk": true, 
           "isreg": false, 
           "issock": false, 
           "isuid": false, 
           "lnk_source": "/run", 
           "lnk_target": "../run", 
           "mimetype": "unknown", 
           "mode": "0777", 
           "mtime": 1564621774.0, 
           "nlink": 1, 
           "path": "/var/run", 
           "pw_name": "root", 
           "readable": true, 
           "rgrp": true, 
           "roth": true, 
           "rusr": true, 
           "size": 6, 
           "uid": 0, 
           "version": null, 
           "wgrp": true, 
           "woth": true, 
           "writeable": true, 
           "wusr": true, 
           "xgrp": true, 
           "xoth": true, 
           "xusr": true
       }
   }
   ok: [web2] => {
       "your_variable.stat": {
           "atime": 1680677911.7133505, 
           "attr_flags": "", 
           "attributes": [], 
           "block_size": 4096, 
           "blocks": 0, 
           "charset": "unknown", 
           "ctime": 1680677915.3217132, 
           "dev": 16777402, 
           "device_type": 0, 
           "executable": true, 
           "exists": true, 
           "gid": 0, 
           "gr_name": "root", 
           "inode": 14789261, 
           "isblk": false, 
           "ischr": false, 
           "isdir": false, 
           "isfifo": false, 
           "isgid": false, 
           "islnk": true, 
           "isreg": false, 
           "issock": false, 
           "isuid": false, 
           "lnk_source": "/run", 
           "lnk_target": "../run", 
           "mimetype": "unknown", 
           "mode": "0777", 
           "mtime": 1564621774.0, 
           "nlink": 1, 
           "path": "/var/run", 
           "pw_name": "root", 
           "readable": true, 
           "rgrp": true, 
           "roth": true, 
           "rusr": true, 
           "size": 6, 
           "uid": 0, 
           "version": null, 
           "wgrp": true, 
           "woth": true, 
           "writeable": true, 
           "wusr": true, 
           "xgrp": true, 
           "xoth": true, 
           "xusr": true
       }
   }
   
   TASK [shell] **********************************************************************************************
   changed: [web2]
   changed: [web1]
   
   PLAY RECAP ************************************************************************************************
   web1                       : ok=3    changed=1    unreachable=0    failed=0   
   web2                       : ok=3    changed=1    unreachable=0    failed=0   
   ```

7. A friend of yours came to you with this broken playbook: `/home/thor/playbooks/help_me_fix_it.yml`. Help him fix it.

   The playbook is supposed to get information about the operating system of the remote hosts and save it to file `/tmp/output.txt` . Please use the inventory: `/home/thor/playbooks/inventory` for this task.

   Once completed, please test as: `ansible-playbook -i inventory help_me_fix_it.yml`

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   Update `help_me_fix_it.yml` playbook as per below given code

   ```
   ---
   - name: help me fix it playbook
     hosts: all
     gather_facts: yes
     tasks:
       - name: alternative way to gather facts about remote host
         setup: filter='ansible_dist*'
         register: facts
       - debug: var=facts.ansible_facts.ansible_distribution
       - shell: echo "{{facts.ansible_facts.ansible_distribution}}" > /tmp/output.txt
   ```

   ```
   $ ansible-playbook -i inventory help_me_fix_it.yml 
   
   PLAY [help me fix it playbook] ****************************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [web2]
   ok: [web1]
   
   TASK [alternative way to gather facts about remote host] **************************************************
   ok: [web1]
   ok: [web2]
   
   TASK [debug] **********************************************************************************************
   ok: [web1] => {
       "facts.ansible_facts.ansible_distribution": "CentOS"
   }
   ok: [web2] => {
       "facts.ansible_facts.ansible_distribution": "CentOS"
   }
   
   TASK [shell] **********************************************************************************************
   changed: [web1]
   changed: [web2]
   
   PLAY RECAP ************************************************************************************************
   web1                       : ok=4    changed=1    unreachable=0    failed=0   
   web2                       : ok=4    changed=1    unreachable=0    failed=0   
   ```



## Magic Variables

## LABS – MAGIC VARIABLES

1. Which of the following is not a magic variable ?

   - playbook_dir
   - **ansible_node_name**
   - inventory_dir
   - hostvars

2. Which of the following magic variable is used to fetch the information about current running version of ansible ?

   - **ansible_version**
   - ansible_host_version
   - ansible_versions
   - ansible-version

3. Is it compulsory to turn on `gather_facts` for all special variables ?

   - yes
   - **no**

4. We have an inventory file `~/playbooks/inventory` in which two hosts are defined, we have defined `dns_server=8.8.8.8` variable for `node01.host` managed node only. Write a playbook `~/playbooks/variable.yml` to run a shell task for all managed nodes so that it picks `node01.host` hosts’s `dns_server` for all managed nodes and save the output of this task in `/tmp/variable.txt` on each managed node.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   inventory

   ```
   node00.host ansible_host=172.20.1.100 ansible_ssh_pass=Passw0rd ansible_user=root
   node01.host ansible_host=172.20.1.101 ansible_ssh_pass=Passw0rd ansible_user=root dns_server=8.8.8.8
   ```

   variable.yml

   ```
   ---
   - name: print_dns server
     hosts: all
     tasks:
       - shell: "echo {{hostvars['node01.host'].dns_server}} >> /tmp/variable.txt"
   ```

   ```
   $ ansible-playbook -i inventory variable.yml 
   
   PLAY [print_dns server] ********************************************************************************
   
   TASK [shell] *******************************************************************************************
   changed: [node01.host]
   changed: [node00.host]
   
   PLAY RECAP *********************************************************************************************
   node00.host                : ok=1    changed=1    unreachable=0    failed=0   
   node01.host                : ok=1    changed=1    unreachable=0    failed=0   
   ```

5. We have a template `~/playbooks/templates/hostinfo.j2` in which some values need to be updated. There is a playbook `~/playbooks/hostinfo.yml` to copy this template to `/root/hostinfo` destination on `node00` managed node. In the template update values for full inventory hostname, short inventory hostname and inventory file.

   Check

   - Syntax Check

   - Prepare Environment

   - Apply Playbook

   - Verify Tasks

     hostinfo.yml

     ```
     ---
     - hosts: node00.host
       gather_facts: false
       tasks:
         - name : hostinfo
           template:
             src: hostinfo.j2
             dest: /root/hostinfo
     ```

     templates/hostinfo.j2

     ```
     This is my full inventory hostname {{inventory_hostname}} #Fill variable for full inventory hostname
     This is my short inventory hostname {{inventory_hostname_short}} #Fill variable for short inventory hostname
     This is my inventory file {{inventory_file}} #Fill variable for inventory file
     ```

     ```
     $ ansible-playbook -i inventory hostinfo.yml 
     
     PLAY [node00.host] ****************************************************************************************
     
     TASK [hostinfo] *******************************************************************************************
     changed: [node00.host]
     
     PLAY RECAP ************************************************************************************************
     node00.host                : ok=1    changed=1    unreachable=0    failed=0   
     ```

     ```
     [root@node00 ~]# cat /root/hostinfo 
     This is my full inventory hostname node00.host #Fill variable for full inventory hostname
     This is my short inventory hostname node00 #Fill variable for short inventory hostname
     This is my inventory file /home/thor/playbooks/inventory #Fill variable for inventory file
     ```

6. We have a playbook `~/playbooks/hosts.yml` to add some entries in `/etc/hosts` file on `node00.host` managed node. It has a missing variable for inventory hostname of the node. Add the variable and run the playbook.

   `Note`: If IP address of the node is `1.1.1.1` then, the final entry in `/etc/hosts` file should look like:

   ```
   node00.host 1.1.1.1
   ```

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   Update the `hosts.yml` playbook as per below given code

   ```
   ---
   - hosts: node00.host
     gather_facts: yes
     tasks:
     - shell: "echo  {{inventory_hostname}} {{ ansible_default_ipv4.address }} >> /etc/hosts"
   ```

   ```
   ]$ ansible-playbook -i inventory hosts.yml   
   
   PLAY [node00.host] ****************************************************************************************
   
   TASK [Gathering Facts] ************************************************************************************
   ok: [node00.host]
   
   TASK [shell] **********************************************************************************************
   changed: [node00.host]
   
   PLAY RECAP ************************************************************************************************
   node00.host                : ok=2    changed=1    unreachable=0    failed=0   
   ```

   ```
   [root@node00 ~]# cat /etc/hosts
   127.0.0.1       localhost
   ::1     localhost ip6-localhost ip6-loopback
   fe00::0 ip6-localnet
   ff00::0 ip6-mcastprefix
   ff02::1 ip6-allnodes
   ff02::2 ip6-allrouters
   172.20.1.100    node00.host node00
   172.17.0.6      node00.host node00
   node00.host 172.20.1.100
   ```



## Jinja2 Basics

## LABS – JINJA2 – BASICS

1. Develop a Jinja2 Expression to use the variable `name` that generates the expected output.

   ##### Source Data:

   ```
   {
     "name": "Bond"
   }
   ```

   ##### Expected Output:

   ```
   The name is Bond
   ```

   **Solution:**

   ```
   The name is {{ name }}
   ```

2. Update the jinja2 expression to display the `name` in UPPERCASE

   ##### Source Data:

   ```
   {
     "name": "Bond"
   }
   ```

   ##### Expected Output:

   ```
   The name is BOND
   ```

   **Solution:**

   ```
   The name is {{ name | upper}}
   ```

3. Update the jinja2 expression to display the `book_name` in title case

   ##### Source Data:

   ```
   {
     "book_name": "Title of books are usually title cased"
   }
   ```

   ##### Expected Output:

   ```
   Title Of Books Are Usually Title Cased
   ```

   **Solution:**

   ```
   {{ book_name | title }}
   ```

4. Update the jinja2 expression to display the correct name in the `dialogue`

   `Replace` the wrong name with the right name

   ##### Source Data:

   ```
   {
     "dialogue": "The name is Bourne, James Bourne!"
   }
   ```

   ##### Expected Output:

   ```
   The name is Bond, James Bond!
   ```

   **Solution:**

   ```
   {{ dialogue | replace('Bourne', 'Bond') }}
   ```

5. Use a Jinja2 expression to display the highest number in the given array

   ##### Source Data:

   ```
   {
     "numbers": [
       13,
       32,
       53,
       34,
       25,
       76,
       17
     ]
   }
   ```

   ##### Expected Output:

   ```
   76
   ```

   **Solution:**

   ```
   {{ numbers | max }}
   ```

6. Use a Jinja2 expression to display the last number in the given array

   ##### Source Data:

   ```
   {
     "numbers": [
       13,
       32,
       53,
       34,
       25,
       76,
       17
     ]
   }
   ```

   ##### Expected Output:

   ```
   17
   ```

   **Solution:**

   ```
   {{ numbers | last }}
   ```

7. You are given an array of words. Use a Jinja2 expression to join them to form a single sentence.

   ##### Source Data:

   ```
   {
     "words": [
       "we",
       "are",
       "meant",
       "to",
       "be",
       "together"
     ]
   }
   ```

   ##### Expected Output:

   ```
   we are meant to be together
   ```

   **Solution:**

   ```
   {{ words | join(' ') }}
   ```

8. That was actually a movie name. Make sure its shown in title case.

   ##### Source Data:

   ```
   {
     "words": [
       "we",
       "are",
       "meant",
       "to",
       "be",
       "together"
     ]
   }
   ```

   ##### Expected Output:

   ```
   We Are Meant To Be Together
   ```

   **Solution:**

   ```
   {{ words | join(' ') | title }}
   ```

9. Use a Jinja2 expression to count the number of words.

   ##### Source Data:

   ```
   {
     "words": "Everyone was busy, so I went to the movie alone. I was very proud of my nickname throughout high school but today- I couldn’t be any different to what my nickname was. Wow, does that work? She works two jobs to make ends meet; at least, that was her reason for not having time to join us."
   }
   ```

   ##### Expected Output:

   ```
   58
   ```

   **Solution:**

   ```
   {{ words | wordcount }}
   ```



## Jinja2 in Ansible

## LABS – JINJA2 – ANSIBLE

1. Develop a jinja2 expression to print the given words in a new line.

   Use Jina2 Blocks

   ##### Source Data:

   ```
   {
     "names": [
       "Alpha",
       "Beta",
       "Charlie",
       "Delta",
       "Echo"
     ]
   }
   ```

   ##### Expected Output:

   ```
   Alpha
   Beta
   Charlie
   Delta
   Echo
   ```

   **Solution:**

   ```
   {% for name in names -%}
   {{ name}}
   {% endfor %}
   ```
   
2. Develop a jinja2 expression to generate a resolv.conf file using the given name server details.

   	Use Jina2 Blocks

##### 		Source Data:

```
{
  "name_servers": [
    "10.1.1.5",
    "10.1.1.6",
    "10.1.1.8",
    "10.8.8.1",
    "8.8.8.8"
  ]
}
```

##### Expected Output:

```
nameserver 10.1.1.5
nameserver 10.1.1.6
nameserver 10.1.1.8
nameserver 10.8.8.1
nameserver 8.8.8.8
```

**Solution:**

```
{% for ips in name_servers -%}
nameserver {{ ips }}
{% endfor %}
```



3. Develop a jinja2 expression to generate an /etc/hosts file using the given information.

   Use Jina2 Blocks

   ##### Source Data:

   ```
   {
     "hosts": [
       {
         "name": "web1",
         "ip_address": "192.168.5.4"
       },
       {
         "name": "web2",
         "ip_address": "192.168.5.5"
       },
       {
         "name": "web3",
         "ip_address": "192.168.5.8"
       },
       {
         "name": "db1",
         "ip_address": "192.168.5.9"
       }
     ]
   }
   ```

   ##### Expected Output:

   ```
   web1 192.168.5.4
   web2 192.168.5.5
   web3 192.168.5.8
   db1 192.168.5.9
   ```

   **Solution:**

   ```
   {% for host in hosts -%}
   {{ host.name }} {{ host.ip_address }}
   {% endfor %}
   ```

4. Update the jinja2 expression to use an if block to update /etc/hosts file only if the hostname contains web.

   ##### Source Data:

   ```
   {
     "hosts": [
       {
         "name": "web1",
         "ip_address": "192.168.5.4"
       },
       {
         "name": "web2",
         "ip_address": "192.168.5.5"
       },
       {
         "name": "web3",
         "ip_address": "192.168.5.8"
       },
       {
         "name": "db1",
         "ip_address": "192.168.5.9"
       }
     ]
   }
   ```

   ##### Expected Output:

   ```
   web1 192.168.5.4
   web2 192.168.5.5
   web3 192.168.5.8
   ```

   **Solution:**

   ```
   {% for host in hosts -%}
     {% if "web" in host.name -%}
   {{ host.name }} {{ host.ip_address -}}
     {% endif %}
   {% endfor %}
   ```

## Ansible Templates

## LABS – JINJA2 – TEMPLATES

1. Let us continue to improve our `LAMP stack E-Commerce` application. Now that we have learned about variables and jinja2 templates, let's put those to use.

   In the `~/playbooks/lamp-stack-playbooks/deploy-lamp-stack.yml` playbook, we have the IP address of the `lampweb` host hard coded in `Create Application DB User` task. This is not a good idea as this IP could change in different environments. Update the task to use a variable to get the IP address of the `lampweb` host. Note that this task is running on the `lamp-db` server.

   Check

   - Apply Playbook
   - Playbook should not contain IP 172.20.1.100

   inventory

   ```
   [db_servers]
   lamp-db ansible_host=172.20.1.101 ansible_ssh_private_key_file=/home/thor/.ssh/maria ansible_user=maria mysqlservice=mysqld mysql_port=3306 dbname=ecomdb dbuser=ecomuser dbpassword=ecompassword
   
   [web_servers]
   lampweb ansible_host=172.20.1.100 ansible_ssh_private_key_file=/home/thor/.ssh/john ansible_user=john httpd_port=80 repository=https://github.com/kodekloudhub/learning-app-ecommerce.git
   ```

   Update `deploy-lamp-stack.yml` playbook as per below given code

   ```
   ---
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - libselinux-python
             - libsemanage-python
             - firewalld
           state: installed
   
   # Install and Configure Database
   - name: Deploy lamp stack application
     hosts: lamp-db
     become: yes
     tasks:
       - name: Install MariaDB package
         yum:
           name:
             - mariadb-server
             - MySQL-python
           state: installed
   
       - name: Create Mysql configuration file
         copy: src=files/my.cnf dest=/etc/my.cnf
   
       - name: Start MariaDB Service
         service: name=mariadb state=started enabled=yes
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule
         firewalld: port={{ mysql_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Create Application Database
         mysql_db: name={{ dbname }} state=present
   
       - name: Create Application DB User
         mysql_user: name={{ dbuser }} password={{ dbpassword }} priv=*.*:ALL host={{ ansible_host }} state=present
   
       - name: Move db-load-script to db host
         copy:
           src: files/db-load-script.sql
           dest: /tmp/db-load-script.sql
   
       - name: Load Inventory Data
         shell: mysql -f < /tmp/db-load-script.sql
   
   - name: Deploy lamp stack application
     hosts: lampweb
     become: yes
     tasks:
       - name: Install httpd and php
         yum:
           name:
             - httpd
             - php
             - php-mysql
           state: present
   
       - name: Install web role specific dependencies
         yum: name=git state=installed
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule for httpd
         firewalld: port={{ httpd_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Set index.php as the default page
         tags: "Set index.php as the default page"
         replace:
           path: /etc/httpd/conf/httpd.conf
           regexp: 'DirectoryIndex index.html'
           replace: 'DirectoryIndex index.php'
   
       - name: http service state
         service: name=httpd state=started enabled=yes
   
       - name: Copy the code from repository
         git: repo={{ repository }} dest=/var/www/html/  force=yes
   
       - name: Creates the index.php file
         copy: src=files/index.php dest=/var/www/html/index.php
   ```

2. We have few configuration files that use hard-coded values as well.

   The `files/db-load-script.sql` used to load data into the database, it has the database name hardcoded into it at the first line. Convert this file into a template and store it as `db-load-script.sql.j2` in the `templates` folder. Modify the contents of the file to use the `dbname` variable instead of the hardcoded value.

   Check

   - Template file exists
   - Template file does not have dbname hardcoded in it.
   - Template file valid
   - Template file uses the right variable

   Edit files/db-load-script.sql

   ```
   USE {{ dbname }};
   CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;
   
   INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");
   ```

   Copy  files/db-load-script.sql to templates/db-load-script.sql

   Edit deploy-lamp-stack.yml

   - ​    - name: Move db-load-script to db host

   ```
      - name: Move db-load-script to db host
         template:
           src: templates/db-load-script.sql.j2
           dest: /tmp/db-load-script.sql.j2
   ```

3. The next file is the database configuration file named `my.cnf`

   Create a template file `my.cnf.j2` for it under the `templates` directory and replace the hardcoded port number with the variable `mysql_port`

   Check

   - Template file my.cnf.j2 exists
   - Template file does not have port number hardcoded in it.
   - Template file valid
   - Template file uses the right variable

   templates/my.cnf.j2

   ```
   [mysqld]
   innodb-buffer-pool-size=5242880
   # datadir=/var/lib/mysql
   # socket=/var/lib/mysql/mysql.sock
   user=mysql
   # Disabling symbolic-links is recommended to prevent assorted security risks
   symbolic-links=0
   port={{ mysql_port }}
   ```

4. The next file is the index file named `index.php`

   Create a template file for this as `index.php.j2`. You must replace the following hard-coded values in it:

   `172.20.1.101` : IP address of `lamp-db` server

   ```
   ecomuser` : `dbuser
   ecompassword` : `dbpassword
   ecomdb` : `dbname
   ```

   Note that the values must be encoded in quotes as a string

   Also Note that this task is running on the web server, however the variables are defined for the database server. But we already know how to get variables from another host.

   Check

   - Template file index.php.j2 exists
   - Template file does not have port number hardcoded in it.
   - Template file valid
   - Template file uses the right username
   - Uses the right dbname

   Create `index.php.j2` template and add below given code

   ```html
   <!DOCTYPE html>
   <html lang="en">
       <head>
           <meta charset="utf-8">
           <meta http-equiv="X-UA-Compatible" content="IE=edge">
           <meta name="viewport" content="width=device-width, initial-scale=1">
   
           <title>Kodekloud E-Commerce</title>
   
           <!-- Favicon -->
           <link rel="icon" href="img/favicon.png" type="image/png" />
           <!-- Bootstrap CSS -->
           <link href="css/bootstrap.min.css" rel="stylesheet">
           <!-- Icon CSS-->
           <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
           <link rel="stylesheet" href="vendors/linearicons/linearicons-1.0.0.css">
           <!-- Animations CSS-->
           <link rel="stylesheet" href="vendors/wow-js/animate.css">
           <!-- owl_carousel-->
           <link rel="stylesheet" href="vendors/owl_carousel/owl.carousel.css">
   
           <!-- Theme style CSS -->
           <link href="css/style.css" rel="stylesheet">
   <!--        <link href="css/responsive.css" rel="stylesheet">  -->
   
           <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
           <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
           <!--[if lt IE 9]>
             <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
             <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
           <![endif]-->
       </head>
       <body>
           <!--==========Main Header==========-->
           <header class="main_header_area">
               <nav class="navbar navbar-default navbar-fixed-top" id="main_navbar">
                   <div class="container-fluid searchForm">
                       <form action="#" class="row">
                           <div class="input-group">
                               <span class="input-group-addon"><i class="lnr lnr-magnifier"></i></span>
                               <input type="search" name="search" class="form-control" placeholder="Type & Hit Enter">
                               <span class="input-group-addon form_hide"><i class="lnr lnr-cross"></i></span>
                           </div>
                       </form>
                   </div>
                   <div class="container">
                       <div class="row">
                       <!-- Brand and toggle get grouped for better mobile display -->
                       <div class="col-md-2 p0">
                           <div class="navbar-header">
                               <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                               <span class="sr-only">Toggle navigation</span>
                               <span class="icon-bar"></span>
                               <span class="icon-bar"></span>
                               <span class="icon-bar"></span>
                               </button>
                               <a class="navbar-brand" href="index.html">
                                   <img src="img/logo.png" alt="">
                                   <img src="img/logo-2.png" alt="">
                               </a>
                           </div>
                       </div>
   
                       <!-- Collect the nav links, forms, and other content for toggling -->
                       <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                           <div class="col-md-9 p0">
                               <ul class="nav navbar-nav main_nav">
                                 <li><a href="#">Laptops</a></li>
                                 <li><a href="#">Drones</a></li>
                                   <li><a href="#">Gadgets</a></li>
                                   <li><a href="#">Phones</a></li>
                                   <li><a href="#">VR</a></li>
                                   <li><a href="#">Contact us</a></li>
                               </ul>
                           </div>
                           <div class="col-md-1 p0">
                               <ul class="nav navbar-nav navbar-right">
                                   <li><a href="#" class="nav_searchFrom"><i class="lnr lnr-magnifier"></i></a></li>
                               </ul>
                           </div>
                       </div><!-- /.navbar-collapse -->
                       </div>
                   </div><!-- /.container-fluid -->
               </nav>
           </header>
           <!--==========Main Header==========-->
   
           <!--==========Slider area==========-->
           <section class="slider_area row m0">
               <div class="slider_inner">
                   <div class="camera_caption">
                       <h2 class="wow fadeInUp animated">Make Your Shopping Easy</h2>
                       <h5 class="wow fadeIn animated" data-wow-delay="0.3s">Find everything accordingly</h5>
                       <a class="learn_mor wow fadeInU" data-wow-delay="0.6s" href="#product-list">Show Now!</a>
                   </div>
               </div>
           </section>
           <!--==========End Slider area==========-->
   
           <section class="best_business_area row">
               <div class="check_tittle wow fadeInUp" data-wow-delay="0.7s" id="product-list">
                   <h2>Product List</h2>
               </div>
               <div class="row it_works">
                 <?php
   
                           $link = mysqli_connect("{{ hostvars['lamp-db']['ansible_facts']['eth0']['ipv4']['address'] }}", "{{ hostvars['lamp-db']['dbuser'] }}", "{{ hostvars['lamp-db']['dbpassword'] }}", "{{ hostvars['lamp-db']['dbname'] }}");
   
                           if ($link) {
                           $res = mysqli_query($link, "select * from products;");
                           while ($row = mysqli_fetch_assoc($res)) { ?>
   
                   <div class="col-md-3 col-sm-6 business_content">
                       <?php echo '<img src="img/' . $row['ImageUrl'] . '" alt="">' ?>
                       <div class="media">
                           <div class="media-left">
   
                           </div>
                           <div class="media-body">
                               <a href="#"><?php echo $row['Name'] ?></a>
                               <p>Purchase <?php echo $row['Name'] ?> at the lowest price <span><?php echo $row['Price'] ?>$</span></p>
                           </div>
                       </div>
                   </div>
   
                   <?php
                           }
                       }
                       else {
                   ?>
                   <div style="width: 100%">
                   <div class="error-content">
   
                       <h1>Database connection error</h1>
                       <p>
                       <?php
                             echo mysqli_connect_errno() . ":" . mysqli_connect_error();
                       ?>
                       </p>
                     </div>
                     </div>
                     <?php
                       }
                     ?>
   
   
               </div>
           </section>
   
   
           <footer class="footer_area row">
               <div class="container custom-container">
   
   
   
                   <div class="copy_right_area">
                       <h4 class="copy_right">© Copyright 2019 Kodekloud Ecommerce | All Rights Reserved</h4>
                   </div>
               </div>
           </footer>
   
           <!-- jQuery -->
           <script src="js/jquery-1.12.4.min.js"></script>
           <!-- Bootstrap -->
           <script src="js/bootstrap.min.js"></script>
           <!-- Wow js -->
           <script src="vendors/wow-js/wow.min.js"></script>
           <!-- Wow js -->
           <script src="vendors/Counter-Up/waypoints.min.js"></script>
           <script src="vendors/Counter-Up/jquery.counterup.min.js"></script>
           <!-- Stellar js -->
           <script src="vendors/stellar/jquery.stellar.js"></script>
           <!-- owl_carousel js -->
           <script src="vendors/owl_carousel/owl.carousel.min.js"></script>
           <!-- Theme js -->
           <script src="js/theme.js"></script>
       </body>
   </html>
   ```

5. Finally, update the playbook `deploy-lamp-stack.yml` to use these template files instead of static files.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks - 1
   - Verify Tasks - 2
   - Verify Tasks - 3
   - Verify Tasks - 4
   - Verify Tasks - 5

   Update `deploy-lamp-stack.yml` playbook as per below given code\

   ```
   ---
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - libselinux-python
             - libsemanage-python
             - firewalld
           state: installed
   - name: Deploy lamp stack application
     hosts: lamp-db
     become: yes
     tasks:
       - name: Install MariaDB package
         yum:
           name:
             - mariadb-server
             - MySQL-python
           state: installed
   
       - name: Create Mysql configuration file
         template: src=templates/my.cnf.j2 dest=/etc/my.cnf
   
       - name: Start MariaDB Service
         service: name=mariadb state=started enabled=yes
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule
         firewalld: port={{ mysql_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Create Application Database
         mysql_db: name={{ dbname }} state=present
   
       - name: Create Application DB User
         tags: Create Application DB User
         mysql_user: name={{ dbuser }} password={{ dbpassword }} priv=*.*:ALL host={{ hostvars['lampweb']['ansible_facts']['eth0']['ipv4']['address'] }} state=present
   
       - name: Move db-load-script to db host
         template:
           src: templates/db-load-script.sql.j2
           dest: /tmp/db-load-script.sql
   
       - name: Load Inventory Data
         shell: mysql -f < /tmp/db-load-script.sql
   
   - name: Deploy lamp stack application
     hosts: lampweb
     become: yes
     tasks:
       - name: Install httpd and php
         yum:
           name:
             - httpd
             - php
             - php-mysql
           state: present
   
       - name: Install web role specific dependencies
         yum: name=git state=installed
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule for httpd
         firewalld: port={{ httpd_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Set index.php as the default page
         tags: "Set index.php as the default page"
         replace:
           path: /etc/httpd/conf/httpd.conf
           regexp: 'DirectoryIndex index.html'
           replace: 'DirectoryIndex index.php'
   
       - name: http service state
         service: name=httpd state=started enabled=yes
   
       - name: Copy the code from repository
         git: repo={{ repository }} dest=/var/www/html/  force=yes
   
       - name: Creates the index.php file
         template: src=templates/index.php.j2 dest=/var/www/html/index.php
   ```

6. If not done already you may optionally view the application by clicking the `Web App` link at the top of your terminal and make sure the site opens up correct and displays all correct data.

   If you run into issues inspect the connectivity details in the `index.php` file.



## PROJECT – VARIABLES AND JINJA2 TEMPLATES

1. Let us continue to improve our `LAMP stack E-Commerce` application. Now that we have learned about variables and jinja2 templates, let's put those to use.

   In the `~/playbooks/lamp-stack-playbooks/deploy-lamp-stack.yml` playbook, we have the IP address of the `lampweb` host hard coded in `Create Application DB User` task. This is not a good idea as this IP could change in different environments. Update the task to use a variable to get the IP address of the `lampweb` host. Note that this task is running on the `lamp-db` server.

   Check

   - Apply Playbook
   - Playbook should not contain IP 172.20.1.100

   inventory

   ```
   [db_servers]
   lamp-db ansible_host=172.20.1.101 ansible_ssh_private_key_file=/home/thor/.ssh/maria ansible_user=maria mysqlservice=mysqld mysql_port=3306 dbname=ecomdb dbuser=ecomuser dbpassword=ecompassword
   
   [web_servers]
   lampweb ansible_host=172.20.1.100 ansible_ssh_private_key_file=/home/thor/.ssh/john ansible_user=john httpd_port=80 repository=https://github.com/kodekloudhub/learning-app-ecommerce.git
   ```

   Update `deploy-lamp-stack.yml` playbook as per below given code

   ```
   ---
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - libselinux-python
             - libsemanage-python
             - firewalld
           state: installed
   
   # Install and Configure Database
   - name: Deploy lamp stack application
     hosts: lamp-db
     become: yes
     tasks:
       - name: Install MariaDB package
         yum:
           name:
             - mariadb-server
             - MySQL-python
           state: installed
   
       - name: Create Mysql configuration file
         copy: src=files/my.cnf dest=/etc/my.cnf
   
       - name: Start MariaDB Service
         service: name=mariadb state=started enabled=yes
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule
         firewalld: port={{ mysql_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Create Application Database
         mysql_db: name={{ dbname }} state=present
   
       - name: Create Application DB User
         mysql_user: name={{ dbuser }} password={{ dbpassword }} priv=*.*:ALL host={{ ansible_host }} state=present
   
       - name: Move db-load-script to db host
         copy:
           src: files/db-load-script.sql
           dest: /tmp/db-load-script.sql
   
       - name: Load Inventory Data
         shell: mysql -f < /tmp/db-load-script.sql
   
   - name: Deploy lamp stack application
     hosts: lampweb
     become: yes
     tasks:
       - name: Install httpd and php
         yum:
           name:
             - httpd
             - php
             - php-mysql
           state: present
   
       - name: Install web role specific dependencies
         yum: name=git state=installed
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule for httpd
         firewalld: port={{ httpd_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Set index.php as the default page
         tags: "Set index.php as the default page"
         replace:
           path: /etc/httpd/conf/httpd.conf
           regexp: 'DirectoryIndex index.html'
           replace: 'DirectoryIndex index.php'
   
       - name: http service state
         service: name=httpd state=started enabled=yes
   
       - name: Copy the code from repository
         git: repo={{ repository }} dest=/var/www/html/  force=yes
   
       - name: Creates the index.php file
         copy: src=files/index.php dest=/var/www/html/index.php
   ```

2. We have few configuration files that use hard-coded values as well.

   The `files/db-load-script.sql` used to load data into the database, it has the database name hardcoded into it at the first line. Convert this file into a template and store it as `db-load-script.sql.j2` in the `templates` folder. Modify the contents of the file to use the `dbname` variable instead of the hardcoded value.

   Check

   - Template file exists
   - Template file does not have dbname hardcoded in it.
   - Template file valid
   - Template file uses the right variable

   templates/db-load-script.sql.j2

   ```
   USE {{ dbname }};
   CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;
   
   INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");
   ```

3. The next file is the database configuration file named `my.cnf`

   Create a template file `my.cnf.j2` for it under the `templates` directory and replace the hardcoded port number with the variable `mysql_port`

   Check

   - Template file my.cnf.j2 exists
   - Template file does not have port number hardcoded in it.
   - Template file valid
   - Template file uses the right variable

   templates/my.cnf.j2

   ```
   [mysqld]
   innodb-buffer-pool-size=5242880
   # datadir=/var/lib/mysql
   # socket=/var/lib/mysql/mysql.sock
   user=mysql
   # Disabling symbolic-links is recommended to prevent assorted security risks
   symbolic-links=0
   port={{ mysql_port }}
   ```

4. The next file is the index file named `index.php`

   Create a template file for this as `index.php.j2`. You must replace the following hard-coded values in it:

   `172.20.1.101` : IP address of `lamp-db` server

   ```
   ecomuser` : `dbuser
   ecompassword` : `dbpassword
   ecomdb` : `dbname
   ```

   Note that the values must be encoded in quotes as a string

   Also Note that this task is running on the web server, however the variables are defined for the database server. But we already know how to get variables from another host.

   Check

   - Template file index.php.j2 exists
   - Template file does not have port number hardcoded in it.
   - Template file valid
   - Template file uses the right username
   - Uses the right dbname

   templates/index.php.j2

   ```
   <!DOCTYPE html>
   <html lang="en">
       <head>
           <meta charset="utf-8">
           <meta http-equiv="X-UA-Compatible" content="IE=edge">
           <meta name="viewport" content="width=device-width, initial-scale=1">
   
           <title>Kodekloud E-Commerce</title>
   
           <!-- Favicon -->
           <link rel="icon" href="img/favicon.png" type="image/png" />
           <!-- Bootstrap CSS -->
           <link href="css/bootstrap.min.css" rel="stylesheet">
           <!-- Icon CSS-->
           <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
           <link rel="stylesheet" href="vendors/linearicons/linearicons-1.0.0.css">
           <!-- Animations CSS-->
           <link rel="stylesheet" href="vendors/wow-js/animate.css">
           <!-- owl_carousel-->
           <link rel="stylesheet" href="vendors/owl_carousel/owl.carousel.css">
   
           <!-- Theme style CSS -->
           <link href="css/style.css" rel="stylesheet">
   <!--        <link href="css/responsive.css" rel="stylesheet">  -->
   
           <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
           <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
           <!--[if lt IE 9]>
             <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
             <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
           <![endif]-->
       </head>
       <body>
           <!--==========Main Header==========-->
           <header class="main_header_area">
               <nav class="navbar navbar-default navbar-fixed-top" id="main_navbar">
                   <div class="container-fluid searchForm">
                       <form action="#" class="row">
                           <div class="input-group">
                               <span class="input-group-addon"><i class="lnr lnr-magnifier"></i></span>
                               <input type="search" name="search" class="form-control" placeholder="Type & Hit Enter">
                               <span class="input-group-addon form_hide"><i class="lnr lnr-cross"></i></span>
                           </div>
                       </form>
                   </div>
                   <div class="container">
                       <div class="row">
                       <!-- Brand and toggle get grouped for better mobile display -->
                       <div class="col-md-2 p0">
                           <div class="navbar-header">
                               <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                               <span class="sr-only">Toggle navigation</span>
                               <span class="icon-bar"></span>
                               <span class="icon-bar"></span>
                               <span class="icon-bar"></span>
                               </button>
                               <a class="navbar-brand" href="index.html">
                                   <img src="img/logo.png" alt="">
                                   <img src="img/logo-2.png" alt="">
                               </a>
                           </div>
                       </div>
   
                       <!-- Collect the nav links, forms, and other content for toggling -->
                       <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                           <div class="col-md-9 p0">
                               <ul class="nav navbar-nav main_nav">
                                 <li><a href="#">Laptops</a></li>
                                 <li><a href="#">Drones</a></li>
                                   <li><a href="#">Gadgets</a></li>
                                   <li><a href="#">Phones</a></li>
                                   <li><a href="#">VR</a></li>
                                   <li><a href="#">Contact us</a></li>
                               </ul>
                           </div>
                           <div class="col-md-1 p0">
                               <ul class="nav navbar-nav navbar-right">
                                   <li><a href="#" class="nav_searchFrom"><i class="lnr lnr-magnifier"></i></a></li>
                               </ul>
                           </div>
                       </div><!-- /.navbar-collapse -->
                       </div>
                   </div><!-- /.container-fluid -->
               </nav>
           </header>
           <!--==========Main Header==========-->
   
           <!--==========Slider area==========-->
           <section class="slider_area row m0">
               <div class="slider_inner">
                   <div class="camera_caption">
                       <h2 class="wow fadeInUp animated">Make Your Shopping Easy</h2>
                       <h5 class="wow fadeIn animated" data-wow-delay="0.3s">Find everything accordingly</h5>
                       <a class="learn_mor wow fadeInU" data-wow-delay="0.6s" href="#product-list">Show Now!</a>
                   </div>
               </div>
           </section>
           <!--==========End Slider area==========-->
   
           <section class="best_business_area row">
               <div class="check_tittle wow fadeInUp" data-wow-delay="0.7s" id="product-list">
                   <h2>Product List</h2>
               </div>
               <div class="row it_works">
                 <?php
   
                           $link = mysqli_connect("{{ hostvars['lamp-db']['ansible_facts']['eth0']['ipv4']['address'] }}", "{{ hostvars['lamp-db']['dbuser'] }}", "{{ hostvars['lamp-db']['dbpassword'] }}", "{{ hostvars['lamp-db']['dbname'] }}");
   
                           if ($link) {
                           $res = mysqli_query($link, "select * from products;");
                           while ($row = mysqli_fetch_assoc($res)) { ?>
   
                   <div class="col-md-3 col-sm-6 business_content">
                       <?php echo '<img src="img/' . $row['ImageUrl'] . '" alt="">' ?>
                       <div class="media">
                           <div class="media-left">
   
                           </div>
                           <div class="media-body">
                               <a href="#"><?php echo $row['Name'] ?></a>
                               <p>Purchase <?php echo $row['Name'] ?> at the lowest price <span><?php echo $row['Price'] ?>$</span></p>
                           </div>
                       </div>
                   </div>
   
                   <?php
                           }
                       }
                       else {
                   ?>
                   <div style="width: 100%">
                   <div class="error-content">
   
                       <h1>Database connection error</h1>
                       <p>
                       <?php
                             echo mysqli_connect_errno() . ":" . mysqli_connect_error();
                       ?>
                       </p>
                     </div>
                     </div>
                     <?php
                       }
                     ?>
   
   
               </div>
           </section>
   
   
           <footer class="footer_area row">
               <div class="container custom-container">
   
   
   
                   <div class="copy_right_area">
                       <h4 class="copy_right">© Copyright 2019 Kodekloud Ecommerce | All Rights Reserved</h4>
                   </div>
               </div>
           </footer>
   
           <!-- jQuery -->
           <script src="js/jquery-1.12.4.min.js"></script>
           <!-- Bootstrap -->
           <script src="js/bootstrap.min.js"></script>
           <!-- Wow js -->
           <script src="vendors/wow-js/wow.min.js"></script>
           <!-- Wow js -->
           <script src="vendors/Counter-Up/waypoints.min.js"></script>
           <script src="vendors/Counter-Up/jquery.counterup.min.js"></script>
           <!-- Stellar js -->
           <script src="vendors/stellar/jquery.stellar.js"></script>
           <!-- owl_carousel js -->
           <script src="vendors/owl_carousel/owl.carousel.min.js"></script>
           <!-- Theme js -->
           <script src="js/theme.js"></script>
       </body>
   </html>
   ```

5. Finally, update the playbook `deploy-lamp-stack.yml` to use these template files instead of static files.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks - 1
   - Verify Tasks - 2
   - Verify Tasks - 3
   - Verify Tasks - 4
   - Verify Tasks - 5

   Update `deploy-lamp-stack.yml` playbook as per below given code

   ```
   ---
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - libselinux-python
             - libsemanage-python
             - firewalld
           state: installed
   - name: Deploy lamp stack application
     hosts: lamp-db
     become: yes
     tasks:
       - name: Install MariaDB package
         yum:
           name:
             - mariadb-server
             - MySQL-python
           state: installed
   
       - name: Create Mysql configuration file
         template: src=templates/my.cnf.j2 dest=/etc/my.cnf
   
       - name: Start MariaDB Service
         service: name=mariadb state=started enabled=yes
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule
         firewalld: port={{ mysql_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Create Application Database
         mysql_db: name={{ dbname }} state=present
   
       - name: Create Application DB User
         tags: Create Application DB User
         mysql_user: name={{ dbuser }} password={{ dbpassword }} priv=*.*:ALL host={{ hostvars['lampweb']['ansible_facts']['eth0']['ipv4']['address'] }} state=present
   
       - name: Move db-load-script to db host
         template:
           src: templates/db-load-script.sql.j2
           dest: /tmp/db-load-script.sql
   
       - name: Load Inventory Data
         shell: mysql -f < /tmp/db-load-script.sql
   
   - name: Deploy lamp stack application
     hosts: lampweb
     become: yes
     tasks:
       - name: Install httpd and php
         yum:
           name:
             - httpd
             - php
             - php-mysql
           state: present
   
       - name: Install web role specific dependencies
         yum: name=git state=installed
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule for httpd
         firewalld: port={{ httpd_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Set index.php as the default page
         tags: "Set index.php as the default page"
         replace:
           path: /etc/httpd/conf/httpd.conf
           regexp: 'DirectoryIndex index.html'
           replace: 'DirectoryIndex index.php'
   
       - name: http service state
         service: name=httpd state=started enabled=yes
   
       - name: Copy the code from repository
         git: repo={{ repository }} dest=/var/www/html/  force=yes
   
       - name: Creates the index.php file
         template: src=templates/index.php.j2 dest=/var/www/html/index.php
   ```

6. If not done already you may optionally view the application by clicking the `Web App` link at the top of your terminal and make sure the site opens up correct and displays all correct data.

   If you run into issues inspect the connectivity details in the `index.php` file.

   OK



# PLAYBOOK FLOW

## Ansible Conditionals
## LABS – CONDITIONALS

1. Which of the following is a valid conditional clause in an Ansible Playbook?

   - if
   - else
   - then
   - **when**

2. Which of the following is a valid conditional statement?

   - when: ansible_distribution == "Ubuntu" && foo=="bar"
   - when: ansible_distribution == "Ubuntu" and if foo=="bar"
   - **when: ansible_distribution == "CentOS" and foo=="bar"**
   - when: ansible_distribution == "Archlinux" || foo=="bar"

3. We are tasked to deploy an HTTP webserver using Ansible Playbooks. Install `apache` web server on all the hosts in the inventory `/home/thor/playbooks/inventory`. Note that they are of different flavours i,e. `Ubuntu` and `CentOS`.

   Develop a playbook `/home/thor/playbooks/install_apache.yml` that would install apache on both Ubuntu and CentOS. Note that the package name is `apache2` on Ubuntu and `httpd` on CentOS

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   inventory

   ```
   web1 ansible_host=172.20.1.100 ansible_ssh_pass=Passw0rd ansible_user=root
   web2 ansible_host=172.20.1.101 ansible_ssh_pass=Passw0rd ansible_user=roo
   ```

   Update `install_apache.yml` playbook as per below given code

   ```
   ---
   - name: Install apache
     hosts: all
     gather_facts: True
     tasks:
       - name: install apache2 when Ubuntu
         package:
           name: apache2
           state: present
         when: ansible_distribution == "Ubuntu"
       - name: install httpd when CentOS
         package:
           name: httpd
           state: present
         when: ansible_distribution == "CentOS"
   ```

   ```
   $ ansible-playbook -i inventory install_apache.yml 
   
   PLAY [Install apache] ************************************************************************************
   
   TASK [Gathering Facts] ***********************************************************************************
   ok: [web2]
   ok: [web1]
   
   TASK [install apache2 when Ubuntu] ***********************************************************************
   skipping: [web1]
   ok: [web2]
   
   TASK [install httpd when CentOS] *************************************************************************
   skipping: [web2]
   ok: [web1]
   
   PLAY RECAP ***********************************************************************************************
   web1                       : ok=2    changed=0    unreachable=0    failed=0   
   web2                       : ok=2    changed=0    unreachable=0    failed=0   
   ```

4. Help your friend fix this playbook `/home/thor/playbooks/copy_file_only_if.yml`.

   Your firend is trying to copy this script `/home/thor/playbooks/report_status.sh` to `web2` at location `/usr/local/bin/report_status.sh` based on a condition: if variable `copy_file_only_if=true`.

   Problem is: Even though (s)he is passing `True` or `true` the boolean variable set this way is being evaulated as string and the conditional is being skipped as `Conditional result was False`

   Please use the inventory file `/home/thor/playbooks/inventory`.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   Update `copy_file_only_if.yml` playbook as per below given code

   ```
   ---
   - name: copy script if not present
     gather_facts: yes
     hosts: web2
     vars:
       remote_dest: /usr/local/bin/report_status.sh
     tasks:
       - copy:
           src: report_status.sh
           dest: "{{remote_dest}}"
         when: copy_file_only_if is defined and copy_file_only_if|bool
         ###......................................problem is here ^
         ### modify this so copy_file_only_if is evaluated as boolean.
   ```

   ```
   $ ansible-playbook -i inventory copy_file_only_if.yml 
   
   PLAY [copy script if not present] ************************************************************************
   
   TASK [copy] **********************************************************************************************
   skipping: [web2]
   
   PLAY RECAP ***********************************************************************************************
   web2                       : ok=0    changed=0    unreachable=0    failed=0   
   ```

   

5. Check if `report_status.sh` copied earlier to `web2` remote host is executable or not.
   If it is not executable, log the message: `File report_status.sh is not executable, making it executable...` in file `/tmp/change.log` on `web2` remote host and make it executable.

   Develop a playbook `/home/thor/playbooks/make_it_executable.yml` and use the inventory file `/home/thor/playbooks/inventory`

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   Update `make_it_executable.yml` playbook as per below given code

   ```yaml
   ---
   - hosts: web2
     gather_facts: no
     vars:
       remote_dest: /usr/local/bin/report_status.sh
     tasks:
       - stat:
           path: "{{remote_dest}}"
         register: file_status
   
       - debug: var=file_status
       - shell: echo "File report_status.sh is not executable, making it executable..." > /tmp/change.log
         when: file_status.stat.exists and file_status.stat.executable == false
   
       - name: Make the script executable
         file:
           path: "{{remote_dest}}"
           mode: 0775
   ```

   ```
   $ ansible-playbook -i inventory make_it_executable.yml 
   
   PLAY [web2] **********************************************************************************************
   
   TASK [stat] **********************************************************************************************
   ok: [web2]
   
   TASK [debug] *********************************************************************************************
   ok: [web2] => {
       "file_status": {
           "changed": false, 
           "failed": false, 
           "stat": {
               "atime": 1681288211.7117717, 
               "attr_flags": "", 
               "attributes": [], 
               "block_size": 4096, 
               "blocks": 8, 
               "charset": "us-ascii", 
               "checksum": "ec68b3da7e7dc798cdd89d385a8a4ac56e6612a7", 
               "ctime": 1681288213.183875, 
               "dev": 3145905, 
               "device_type": 0, 
               "executable": true, 
               "exists": true, 
               "gid": 0, 
               "gr_name": "root", 
               "inode": 22732103, 
               "isblk": false, 
               "ischr": false, 
               "isdir": false, 
               "isfifo": false, 
               "isgid": false, 
               "islnk": false, 
               "isreg": true, 
               "issock": false, 
               "isuid": false, 
               "mimetype": "text/plain", 
               "mode": "0755", 
               "mtime": 1681287719.0291424, 
               "nlink": 1, 
               "path": "/usr/local/bin/report_status.sh", 
               "pw_name": "root", 
               "readable": true, 
               "rgrp": true, 
               "roth": true, 
               "rusr": true, 
               "size": 99, 
               "uid": 0, 
               "version": null, 
               "wgrp": false, 
               "woth": false, 
               "writeable": true, 
               "wusr": true, 
               "xgrp": true, 
               "xoth": true, 
               "xusr": true
           }
       }
   }
   
   TASK [shell] *********************************************************************************************
   skipping: [web2]
   
   TASK [Make the script executable] ************************************************************************
   changed: [web2]
   
   PLAY RECAP ***********************************************************************************************
   web2                       : ok=3    changed=1    unreachable=0    failed=0   
   ```

6. The script `report_status.sh` executes a command to test if you are still vulnerable to Shellshock Vulnerability.
   The script outputs `vulnerable` if you are still vulnerable else echos `not vulnerable`. Note: You don't need to modify anything on the script.

   Write a playbook `/home/thor/playbooks/check_if_vulnerable.yml` and execute that script `report_status.sh` you copied earlier to test if you are vulnerable. If you are still vulnerable add a play to `update package bash` to the latest version.
   Use inventory `/home/thor/playbooks/inventory`.

   Check

   - Apply Playbook

   ###### Create `check_if_vulnerable.yml` playbook and add below given code

   ```yaml
   ---
   - hosts: web2
     gather_facts: no
     tasks:
       - name: Run a script
         shell: sh /usr/local/bin/report_status.sh
         register: test
       - debug:
           var: test
   ```

   ```
   $ ansible-playbook -i inventory check_if_vulnerable.yml 
   
   PLAY [web2] **********************************************************************************************
   
   TASK [Run a script] **************************************************************************************
   changed: [web2]
   
   TASK [debug] *********************************************************************************************
   ok: [web2] => {
       "test": {
           "changed": true, 
           "cmd": "sh /usr/local/bin/report_status.sh", 
           "delta": "0:00:00.005212", 
           "end": "2023-04-12 08:46:59.665555", 
           "failed": false, 
           "rc": 0, 
           "start": "2023-04-12 08:46:59.660343", 
           "stderr": "", 
           "stderr_lines": [], 
           "stdout": "not vulnerable", 
           "stdout_lines": [
               "not vulnerable"
           ]
       }
   }
   
   PLAY RECAP ***********************************************************************************************
   web2                       : ok=2    changed=1    unreachable=0    failed=0   
   ```

7. Develop a playbook - `/home/thor/playbooks/install_packages.yml` - to install an extra package `htop` on `web2` node. The package name `htop` must be passed as a value to a variable `extra_packages` with the `-e` option in the command line while running the playbook. The playbook `install_packages.yml` already has some exiting code, modify the task `install extra packages` so that it only runs if `extra_packages` variable is defined and it has value `htop`. At the end playbook must be able to install this extra package on `web2` node while passing correct values in the extra vars i.e `-e`.

   Use inventory from `/home/thor/playbooks/inventory`.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   ###### Update `install_packages.yml` playbook as per below given code

   ```yaml
   ---
   - hosts: web2
     gather_facts: no
     tasks:
       - name: install nginx
         apt: name=nginx state=present
         tags: [install_core]
   
       - name: install extra packages
         apt: name={{item}}
         with_items: "{{extra_packages}}"
         when: extra_packages is defined and extra_packages == "htop"
   ```

## Ansible Blocks
## LABS – BLOCKS

1. How do we do logical grouping of the tasks in Ansible?

   - Using roles
   - Using inventory
   - Using tags
   - **Using blocks**

2. Which of the following is useful for error handling in Ansible blocks?

   - when
   - **rescue**
   - ignore_errors
   - tags

3. We have three web nodes that are managed by Ansible. There is an inventory file `~/playbooks/inventory` on `Ansible controller` which has all these three nodes added. Create a playbook `~/playbooks/blocks.yml` on `Ansible controller` to `install httpd web server` and `start its service`. We need the tasks to be run only on `CentOS` based web nodes.

   Create the playbook using blocks to logically group the tasks (installation and service start) so that even if we run playbook for all hosts that are in inventory, the tasks are run only on `CentOS` based nodes.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify web1
   - Verify web2
   - Verify web3
   - Ensure Ansible's blocks were used
   - Check skipped server

   inventory

   ```
   web1 ansible_host=172.20.1.100 ansible_user=root ansible_ssh_pass=Passw0rd
   web2 ansible_host=172.20.1.101 ansible_user=root ansible_ssh_pass=Passw0rd
   web3 ansible_host=172.20.1.102 ansible_user=root ansible_ssh_pass=Passw0rd
   ```

   Create `blocks.yml` playbook and add below given code

   ```yaml
   ---
   - hosts: all
     tasks:
       - name: Install and configure httpd web server
         when: ansible_facts['distribution'] == 'CentOS'
         block:
           - yum:
               name: httpd
               state: present
           - service:
               name: httpd
               state: started
   ```

   ```
   $ ansible-playbook -i inventory blocks.yml 
   
   PLAY [all] ***********************************************************************************************
   
   TASK [Gathering Facts] ***********************************************************************************
   ok: [web2]
   ok: [web3]
   ok: [web1]
   
   TASK [yum] ***********************************************************************************************
   skipping: [web2]
   changed: [web3]
   changed: [web1]
   
   TASK [service] *******************************************************************************************
   skipping: [web2]
   changed: [web1]
   changed: [web3]
   
   PLAY RECAP ***********************************************************************************************
   web1                       : ok=3    changed=2    unreachable=0    failed=0   
   web2                       : ok=1    changed=0    unreachable=0    failed=0   
   web3                       : ok=3    changed=2    unreachable=0    failed=0   
   ```

4. Make a copy of the playbook you just created - `~/playbooks/blocks.yml` to `~/playbooks/blocks_rescue.yml`. Update the new playbook as per below details:

   a. Add a rescue section under the block so that if the task fails for any of the managed node the rescue section should display a message in the form:

   `Playbook has failed for web3 node`
   Use `{{ inventory_hostname}}` in place of `web3` so that correct value can be picked for each node

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks
   - Make sure rescue was used.

   Copy `blocks.yml` to `blocks_rescue.yml`, Updated `blocks_rescue.yml` playbook as per below given code

   ```unix
   ---
   - hosts: all
     tasks:
       - name: Install and configure httpd web server
         when: ansible_facts['distribution'] == 'CentOS'
         block:
           - yum:
               name: httpd
               state: present
           - service:
               name: httpd
               state: started
         rescue:
           - debug:
               msg: "Playbook has failed for {{ inventory_hostname }} node"
   ```

   ```
   $ ansible-playbook -i inventory blocks_rescue.yml 
   
   PLAY [all] ***********************************************************************************************
   
   TASK [Gathering Facts] ***********************************************************************************
   ok: [web2]
   ok: [web1]
   ok: [web3]
   
   TASK [yum] ***********************************************************************************************
   skipping: [web2]
   fatal: [web3]: FAILED! => {"changed": false, "msg": "No package matching 'httpd' found available, installed or updated", "rc": 126, "results": ["No package matching 'httpd' found available, installed or updated"]}
   ok: [web1]
   
   TASK [service] *******************************************************************************************
   skipping: [web2]
   ok: [web1]
   
   TASK [debug] *********************************************************************************************
   ok: [web3] => {
       "msg": "Playbook has failed for web3 node"
   }
   
   PLAY RECAP ***********************************************************************************************
   web1                       : ok=3    changed=0    unreachable=0    failed=0   
   web2                       : ok=1    changed=0    unreachable=0    failed=0   
   web3                       : ok=2    changed=0    unreachable=0    failed=1   
   ```

5. We just created a new playbook at `~/playbooks/blocks_always.yml`. This playbook creates a file on all web nodes and performs some tasks on them. The last task that prints `This task always runs!` must always run. However, the playbook fails at the second task and as a result the third and fourth task does not run. We do not need to fix the second task for now, but by using `always` section we want the last task to always run regardless of status of other tasks before it.

   Add an `always` section and configure the last task to always run. Do not modify any other task.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify
   - Verify always: section was used

   Update `blocks_always.yml` playbook as per below given code

   ```yaml
   ---
   - hosts: all
     tasks:
       - name: Create a file
         block:
           - file:
               path: /tmp/file.txt
               state: touch
           - name: This will fail
             command: /bin/false
           - debug:
               msg: "This will never run"
         always:
           - debug:
               msg: "This task always runs!"
   ```

   ```
   $ ansible-playbook -i inventory blocks_always.yml 
   
   PLAY [all] ***********************************************************************************************
   
   TASK [Gathering Facts] ***********************************************************************************
   ok: [web2]
   ok: [web1]
   ok: [web3]
   
   TASK [file] **********************************************************************************************
   changed: [web2]
   changed: [web1]
   changed: [web3]
   
   TASK [This will fail] ************************************************************************************
   fatal: [web2]: FAILED! => {"changed": true, "cmd": ["/bin/false"], "delta": "0:00:00.005408", "end": "2023-04-13 03:01:29.510395", "msg": "non-zero return code", "rc": 1, "start": "2023-04-13 03:01:29.504987", "stderr": "", "stderr_lines": [], "stdout": "", "stdout_lines": []}
   fatal: [web1]: FAILED! => {"changed": true, "cmd": ["/bin/false"], "delta": "0:00:00.037017", "end": "2023-04-13 03:01:29.836797", "msg": "non-zero return code", "rc": 1, "start": "2023-04-13 03:01:29.799780", "stderr": "", "stderr_lines": [], "stdout": "", "stdout_lines": []}
   fatal: [web3]: FAILED! => {"changed": true, "cmd": ["/bin/false"], "delta": "0:00:00.082844", "end": "2023-04-13 03:01:29.897543", "msg": "non-zero return code", "rc": 1, "start": "2023-04-13 03:01:29.814699", "stderr": "", "stderr_lines": [], "stdout": "", "stdout_lines": []}
   
   TASK [debug] *********************************************************************************************
   ok: [web1] => {
       "msg": "This task always runs!"
   }
   ok: [web2] => {
       "msg": "This task always runs!"
   }
   ok: [web3] => {
       "msg": "This task always runs!"
   }
           to retry, use: --limit @/home/thor/playbooks/blocks_always.retry
   
   PLAY RECAP ***********************************************************************************************
   web1                       : ok=3    changed=1    unreachable=0    failed=1   
   web2                       : ok=3    changed=1    unreachable=0    failed=1   
   web3                       : ok=3    changed=1    unreachable=0    failed=1   
   ```

   

## Error Handling

## LABS – ERROR HANDLING

1. Which of the following options can be used to ignore a particular failed task in a play?

   - any_errors_fatal
   - **ignore_errors**
   - changed_when
   - failed_when

2. While running a playbook for multiple servers how can we force interrupt the entire play if a task fails for a single host?

   - Ansible by default interrupt the entire play for all servers in loop if any of them fails
   - Use ignore_errors
   - **Set any_errors_fatal to true**
   - Use failed_when

3. We have a playbook at `~/playbooks/httpd.yml` to install `httpd` web server on all web nodes. The inventory file at `~/playbooks/inventory` has these web nodes added. Update playbook so that if any task fails for any of the web nodes the playbook should exit for all hosts.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify
   - Verify "any_errors_fatal" was used

   inventory

   ```
   web1 ansible_host=172.20.1.100 ansible_user=root ansible_ssh_pass=Passw0rd
   web2 ansible_host=172.20.1.101 ansible_user=root ansible_ssh_pass=Passw0rd
   ```

   Use the following YAML file to correct a playbook called `httpd.yml` as follows:-

   ```yaml
   ---
   - name: Install httpd
     hosts: all
     any_errors_fatal: true
     gather_facts: no
     tasks:
       - name: Install httpd
         yum:
           name: httpd
           state: present
   
       - name: start service
         service:
           name: httpd
           state: started
   ```

   ```
   $ ansible-playbook -i inventory httpd.yml 
   
   PLAY [Install httpd] *************************************************************************************
   
   TASK [Install httpd] *************************************************************************************
   fatal: [web2]: FAILED! => {"ansible_facts": {"pkg_mgr": "yum"}, "changed": false, "msg": "No package matching 'httpd' found available, installed or updated", "rc": 126, "results": ["No package matching 'httpd' found available, installed or updated"]}
   changed: [web1]
   
   NO MORE HOSTS LEFT ***************************************************************************************
           to retry, use: --limit @/home/thor/playbooks/httpd.retry
   
   PLAY RECAP ***********************************************************************************************
   web1                       : ok=1    changed=1    unreachable=0    failed=0   
   web2                       : ok=0    changed=0    unreachable=0    failed=1   
   ```

4. A playbook at `~/playbooks/httpd_errors.yml` runs tasks on `web1` node only. However, there is a faulty task in it. We want to ignore the failed task so that the playbook can proceed to the next task. Make the appropriate changes inside the playbook to ignore the second task. Use inventory file `~/playbooks/inventory` .

   Do not try to fix the failed task.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify
   - Make sure ignore_errors was used.

   Use the following YAML file to correct a playbook called `httpd_errors.yml` as follows:-

   ```yaml
   ---
   - name: Install httpd
     hosts: web1
     gather_facts: no
     tasks:
       - name: Install httpd
         yum:
           name: httpd
           state: present
   
       - name: Do not remove this task
         command: /bin/false
         register: results
         ignore_errors: yes
   
       - shell: "echo {{ results.msg }} > /tmp/output"
   
       - name: start service
         service:
           name: httpd
           state: started
   ```

   ```
   $ ansible-playbook -i inventory httpd_errors.yml 
   
   PLAY [Install httpd] *************************************************************************************
   
   TASK [Install httpd] *************************************************************************************
   ok: [web1]
   
   TASK [Do not remove this task] ***************************************************************************
   fatal: [web1]: FAILED! => {"changed": true, "cmd": ["/bin/false"], "delta": "0:00:00.030210", "end": "2023-04-13 03:38:46.902563", "msg": "non-zero return code", "rc": 1, "start": "2023-04-13 03:38:46.872353", "stderr": "", "stderr_lines": [], "stdout": "", "stdout_lines": []}
   ...ignoring
   
   TASK [shell] *********************************************************************************************
   changed: [web1]
   
   TASK [start service] *************************************************************************************
   changed: [web1]
   
   PLAY RECAP ***********************************************************************************************
   web1                       : ok=4    changed=3    unreachable=0    failed=0   
   ```

5. The playbook `~/playbooks/httpd_check_errors.yml` installs `httpd` on `web1` node, then checks for errors in the error log and then starts the `httpd` service.

   Our goal is for the playbook to fail if the error check (second task) detects errors in the log file. However, with the current playbook, the error check (second task) has no impact as it is only viewing the error log file. Update the playbook so that it fails if it detects a string `Error` in the file `/var/log/httpd/error_log`.

   The task is already there. Only implement error handling. Use `~/playbooks/inventory` file to test the playbook that is already present on `ansible controller`.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify
   - Make sure "failed_when" was used

   Use the following YAML file to correct a playbook called `httpd_check_errors.yml` as follows:-

   ```yaml
   ---
   - name: Install httpd
     hosts: web1
     gather_facts: no
     tasks:
       - name: Install httpd
         yum:
           name: httpd
           state: present
       - name: Check httpd error logs
         command: cat /var/log/httpd/error_log
         register: results
   
       - name: start service
         service:
           name: httpd
           state: started
         failed_when: '"Error" in results.stdout'
   
       - name: Create a file
         file:
           path: /tmp/file
           state: touch
   ```

   ```
   $ ansible-playbook -i inventory httpd_check_errors.yml 
   
   PLAY [Install httpd] *************************************************************************************
   
   TASK [Install httpd] *************************************************************************************
   ok: [web1]
   
   TASK [Check httpd error logs] ****************************************************************************
   changed: [web1]
   
   TASK [start service] *************************************************************************************
   fatal: [web1]: FAILED! => {"changed": false, "failed_when_result": true, "name": "httpd", "state": "started", "status": {"ActiveEnterTimestamp": "Thu 2023-04-13 03:40:51 UTC", "ActiveEnterTimestampMonotonic": "83101580605", "ActiveExitTimestampMonotonic": "0", "ActiveState": "active", "After": "systemd-journald.socket system.slice nss-lookup.target tmp.mount network.target remote-fs.target -.mount basic.target", "AllowIsolate": "no", "AmbientCapabilities": "0", "AssertResult": "yes", "AssertTimestamp": "Thu 2023-04-13 03:40:51 UTC", "AssertTimestampMonotonic": "83101529432", "Before": "shutdown.target", "BlockIOAccounting": "no", "BlockIOWeight": "18446744073709551615", "CPUAccounting": "no", "CPUQuotaPerSecUSec": "infinity", "CPUSchedulingPolicy": "0", "CPUSchedulingPriority": "0", "CPUSchedulingResetOnFork": "no", "CPUShares": "18446744073709551615", "CanIsolate": "no", "CanReload": "yes", "CanStart": "yes", "CanStop": "yes", "CapabilityBoundingSet": "18446744073709551615", "ConditionResult": "yes", "ConditionTimestamp": "Thu 2023-04-13 03:40:51 UTC", "ConditionTimestampMonotonic": "83101529432", "Conflicts": "shutdown.target", "ControlGroup": "/docker/673f953bac1a21ce2c06c8fa76679e6f0811e88197423fafe9cc6eba0674ad85/system.slice/httpd.service", "ControlPID": "0", "DefaultDependencies": "yes", "Delegate": "no", "Description": "The Apache HTTP Server", "DevicePolicy": "auto", "Documentation": "man:httpd(8) man:apachectl(8)", "EnvironmentFile": "/etc/sysconfig/httpd (ignore_errors=no)", "ExecMainCode": "0", "ExecMainExitTimestampMonotonic": "0", "ExecMainPID": "4647", "ExecMainStartTimestamp": "Thu 2023-04-13 03:40:51 UTC", "ExecMainStartTimestampMonotonic": "83101530779", "ExecMainStatus": "0", "ExecReload": "{ path=/usr/sbin/httpd ; argv[]=/usr/sbin/httpd $OPTIONS -k graceful ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }", "ExecStart": "{ path=/usr/sbin/httpd ; argv[]=/usr/sbin/httpd $OPTIONS -DFOREGROUND ; ignore_errors=no ; start_time=[Thu 2023-04-13 03:40:51 UTC] ; stop_time=[n/a] ; pid=4647 ; code=(null) ; status=0/0 }", "ExecStop": "{ path=/bin/kill ; argv[]=/bin/kill -WINCH ${MAINPID} ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }", "FailureAction": "none", "FileDescriptorStoreMax": "0", "FragmentPath": "/usr/lib/systemd/system/httpd.service", "GuessMainPID": "yes", "IOScheduling": "4", "Id": "httpd.service", "IgnoreOnIsolate": "no", "IgnoreOnSnapshot": "no", "IgnoreSIGPIPE": "yes", "InactiveEnterTimestampMonotonic": "0", "InactiveExitTimestamp": "Thu 2023-04-13 03:40:51 UTC", "InactiveExitTimestampMonotonic": "83101530848", "JobTimeoutAction": "none", "JobTimeoutUSec": "0", "KillMode": "control-group", "KillSignal": "18", "LimitAS": "18446744073709551615", "LimitCORE": "18446744073709551615", "LimitCPU": "18446744073709551615", "LimitDATA": "18446744073709551615", "LimitFSIZE": "18446744073709551615", "LimitLOCKS": "18446744073709551615", "LimitMEMLOCK": "67108864", "LimitMSGQUEUE": "819200", "LimitNICE": "0", "LimitNOFILE": "1048576", "LimitNPROC": "18446744073709551615", "LimitRSS": "18446744073709551615", "LimitRTPRIO": "0", "LimitRTTIME": "18446744073709551615", "LimitSIGPENDING": "837932", "LimitSTACK": "18446744073709551615", "LoadState": "loaded", "MainPID": "4647", "MemoryAccounting": "no", "MemoryCurrent": "18446744073709551615", "MemoryLimit": "18446744073709551615", "MountFlags": "0", "Names": "httpd.service", "NeedDaemonReload": "no", "Nice": "0", "NoNewPrivileges": "no", "NonBlocking": "no", "NotifyAccess": "main", "OOMScoreAdjust": "0", "OnFailureJobMode": "replace", "PermissionsStartOnly": "no", "PrivateDevices": "no", "PrivateNetwork": "no", "PrivateTmp": "yes", "ProtectHome": "no", "ProtectSystem": "no", "RefuseManualStart": "no", "RefuseManualStop": "no", "RemainAfterExit": "no", "Requires": "basic.target", "RequiresMountsFor": "/var/tmp", "Restart": "no", "RestartUSec": "100ms", "Result": "success", "RootDirectoryStartOnly": "no", "RuntimeDirectoryMode": "0755", "SameProcessGroup": "no", "SecureBits": "0", "SendSIGHUP": "no", "SendSIGKILL": "yes", "Slice": "system.slice", "StandardError": "inherit", "StandardInput": "null", "StandardOutput": "journal", "StartLimitAction": "none", "StartLimitBurst": "5", "StartLimitInterval": "10000000", "StartupBlockIOWeight": "18446744073709551615", "StartupCPUShares": "18446744073709551615", "StatusErrno": "0", "StatusText": "Total requests: 0; Current requests/sec: 0; Current traffic:   0 B/sec", "StopWhenUnneeded": "no", "SubState": "running", "SyslogLevelPrefix": "yes", "SyslogPriority": "30", "SystemCallErrorNumber": "0", "TTYReset": "no", "TTYVHangup": "no", "TTYVTDisallocate": "no", "TasksAccounting": "no", "TasksCurrent": "18446744073709551615", "TasksMax": "18446744073709551615", "TimeoutStartUSec": "1min 30s", "TimeoutStopUSec": "1min 30s", "TimerSlackNSec": "50000", "Transient": "no", "Type": "notify", "UMask": "0022", "UnitFilePreset": "disabled", "UnitFileState": "disabled", "Wants": "system.slice", "WatchdogTimestamp": "Thu 2023-04-13 03:40:51 UTC", "WatchdogTimestampMonotonic": "83101580539", "WatchdogUSec": "0"}}
           to retry, use: --limit @/home/thor/playbooks/httpd_check_errors.retry
   
   PLAY RECAP ***********************************************************************************************
   web1                       : ok=2    changed=1    unreachable=0    failed=1   
   ```

## Strategy

## LABS – PARELLELISM

1. Which of the following is not a valid strategy in Ansible?

   - debug
   - linear
   - **host**
   - free

2. Which of the following is the default strategy configured by Ansible.

   - host_pinned
   - **linear**
   - debug
   - free

3. What is the default value for `forks` configured in Ansible?

   - 2
   - **5**
   - 3
   - 4

4. There are three nodes we are managing using Ansible. All of them are already added in `~/playbooks/inventory` file present on `Ansible controller`. We have a playbook at path `~/playbooks/httpd.yml` to install/configure `httpd` web server on all managed nodes. Update the playbook to use `free` strategy.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify
   - Make sure free strategy was used.

   inventory

   ```
   web1 ansible_host=172.20.1.100 ansible_user=root ansible_ssh_pass=Passw0rd
   web2 ansible_host=172.20.1.101 ansible_user=root ansible_ssh_pass=Passw0rd
   web3 ansible_host=172.20.1.102 ansible_user=root ansible_ssh_pass=Passw0rd
   ```

   The solution yaml is placed below for `~/playbooks/httpd.yml`:

   ```yaml
   ---
   - name: Install httpd
     hosts: all
     strategy: free
     gather_facts: no
     tasks:
       - name: Install htpd
         yum:
           name: httpd
           state: present
   
       - name: start service
         service:
           name: httpd
           state: started
   ```

   ```
   $ ansible-playbook -i inventory httpd.yml 
   
   PLAY [Install httpd] *************************************************************************************
   
   TASK [Install htpd] **************************************************************************************
   changed: [web3]
   
   TASK [start service] *************************************************************************************
   changed: [web3]
   
   TASK [Install htpd] **************************************************************************************
   changed: [web2]
   changed: [web1]
   
   TASK [start service] *************************************************************************************
   changed: [web2]
   changed: [web1]
   
   PLAY RECAP ***********************************************************************************************
   web1                       : ok=2    changed=2    unreachable=0    failed=0   
   web2                       : ok=2    changed=2    unreachable=0    failed=0   
   web3                       : ok=2    changed=2    unreachable=0    failed=0   
   ```

5. Revert the previous change made to the playbook `~/playbooks/httpd.yml` to remove the `free` strategy and let Ansible use the default `linear` strategy. Make changes in this playbook to process only `1` server in a single batch i.e Ansible must execute tasks on a single server at a time.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify
   - Make sure at a time only 1 host in the batch was processed by Ansible

   The solution yaml is placed below for `~/playbooks/httpd.yml`:

   ```yaml
   ---
   - name: Install httpd
     hosts: all
     serial: 1
     gather_facts: no
     tasks:
       - name: Install htpd
         yum:
           name: httpd
           state: present
   
       - name: start service
         service:
           name: httpd
           state: started
   ```

   ```
   $ ansible-playbook -i inventory httpd.yml 
   
   PLAY [Install httpd] *************************************************************************************
   
   TASK [Install htpd] **************************************************************************************
   ok: [web1]
   
   TASK [start service] *************************************************************************************
   ok: [web1]
   
   PLAY [Install httpd] *************************************************************************************
   
   TASK [Install htpd] **************************************************************************************
   ok: [web2]
   
   TASK [start service] *************************************************************************************
   ok: [web2]
   
   PLAY [Install httpd] *************************************************************************************
   
   TASK [Install htpd] **************************************************************************************
   ok: [web3]
   
   TASK [start service] *************************************************************************************
   ok: [web3]
   
   PLAY RECAP ***********************************************************************************************
   web1                       : ok=2    changed=0    unreachable=0    failed=0   
   web2                       : ok=2    changed=0    unreachable=0    failed=0   
   web3                       : ok=2    changed=0    unreachable=0    failed=0   
   ```



# Include and Roles

## Includes

## LABS – FILE SEPARATION

1. We have an inventory file defined in the `/home/thor/playbooks/web-playbooks` directory. Move all host variables into a file for each of the server under a `host_vars` directory

   The inventory file is located at `/home/thor/playbooks/web-playbooks/inventory`. You may edit its contents but not its filename or location.

   Check

   - host_vars exists
   - Move web1 variables to host_vars
   - Move web2 variables to host_vars
   - No variables to be defined in the inventory file for web1
   - No variables to be defined in the inventory file for web2
   - web1 inventory data
   - web2 inventory data

   inventory

   ```
   [web_servers]
   web1 ansible_host=172.20.1.100 dns_server=8.8.8.8 size=big
   web2 ansible_host=172.20.1.101 dns_server=8.8.8.8 size=small
   ```

   Follow below given steps:

   ```unix
   cd playbooks/web-playbooks/
   mkdir host_vars
   ```

   Create vars file for web1

   ```unix
   vi host_vars/web1.yml
   ```

   Add below given content

   ```unix
   ansible_host: 172.20.1.100
   dns_server: 8.8.8.8
   size: big
   ```

   Create vars file for web2

   ```unix
   vi host_vars/web2.yml
   ```

   Add below given content

   ```unix
   ansible_host: 172.20.1.101
   dns_server: 8.8.8.8
   size: small
   ```

   Remove all vars from the inventory file
   `inventory` should look like

   ```
   [web_servers]
   web1
   web2
   ```

2. The `dns_server` details are common to both servers. Move it to a separate variable file under `group_vars` (create if doesn't exist) and remove from `host_vars`.

   Check

   - `dns_server` must not present in inventory or host_vars for web1
   - `dns_server` must not present in inventory or host_vars for web2
   - web1 inventory data
   - web2 inventory data

   Follow below given steps:

   ```unix
   cd playbooks/web-playbooks/
   mkdir group_vars
   ```

   Create group vars file

   ```unix
   vi group_vars/web_servers.yml
   ```

   Add below given content

   ```unix
   dns_server: 8.8.8.8
   ```

   Remove the `dns_server` var from the hosts var files i.e web1.yml and web2.yml

   `web1.yml` should look like

   ```
   ansible_host: 172.20.1.100
   size: big
   ```

   `web2.yml` should look like

   ```
   ansible_host: 172.20.1.101
   size: small
   ```

3. We have a playbook playbook.yml, inventory and other data in `/home/thor/playbooks/db-playbooks` directory. When we run the playbook it should print the value of the `ntp_server` configured on the `db` servers. However right now it says `VARIABLE IS NOT DEFINED`. Identify and fix the issue.

   Check

   - Fix the issue

   inventory

   ```
   [db_servers]
   db1
   db2
   ```

   host_vars/db1.yml 

   ```
   ansible_host: 192.168.1.2
   dns_server: 8.8.8.8
   ```

   host_vars/db2.yml 

   ```
   ansible_host: 192.168.1.3
   dns_server: 8.8.8.8
   ```

   group_vars/db.yml 

   ```
   ntp_server: 192.168.1.10
   ```

   Follow below given steps:

   ```unix
   cd /home/thor/playbooks/db-playbooks/
   mv group_vars/db.yml group_vars/db_servers.yml
   ```

4. We have some additional inventory data about database stored at `/home/thor/playbooks/general/common/db/db.yml`

   Include this in the playbook `playbook-2.yml`. We are trying to print the `db_version`.

   Check

   - Include Variable

   /home/thor/playbooks/general/common/db/db.yml

   ```
   db_kind: mysql
   db_version: 8.0.17
   db_name: student
   ```

   Update `playbook-2.yml` as per below given code

   /home/thor/playbooks/db-playbooks/playbook-2.yml

   ```yaml
   ---
   - name: Print DB server data
     hosts: all
     gather_facts: no
     tasks:
       - include_vars: /home/thor/playbooks/general/common/db/db.yml
       - debug:
           var: db_version
   ```

5. We must now install and configure db and web server packages on 2 servers. Some playbooks and task files have been created in the `/home/thor/playbooks/full-stack-playbooks` directory.

   Finish the `playbook.yml` to include the tasks in the tasks directory.

   Check

   - Must use include_tasks

   Follow below given steps:

   ###### Update `playbook.yml` as per below given code

   ```yaml
   ---
   - name: Configure full stack server
     hosts: f-server-1
     gather_facts: no
     tasks:
       - include_tasks: tasks/install-db-server.yml
       - include_tasks: tasks/install-web-server.yml
   ```

   tasks/install-db-server.yml

   ```
   - name: 556847-Install dependencies
     yum:
       enablerepo: extras
       name:
         - epel-release
       state: installed
   
   - name: 556847-Install dependencies
     yum:
       name:
         - python-pip
       state: installed
   
   - name: Install MySQL database
     yum:
       name:
         - mysql-server
         - MySQL-python
       state:  installed
   
   - name: Start Mysql Service
     service:
       name: mysqld
       state: started
       enabled: yes
   
   - name: Create Application Database
     mysql_db: name='employee_db' state=present
   
   - name: Create Application DB User
     # For web and db on the same server
     mysql_user: name='db_user' password='Passw0rd' priv='*.*:ALL' host='localhost' state='present'
     # For web and db on the different server
     # mysql_user: name='db_user' password='Passw0rd' priv='*.*:ALL' host='%' state='present'
   ```

   tasks/install-web-server.yml 

   ```
   - name: 5563947-Install dependencies
     yum:
       enablerepo: extras
       name:
         - epel-release
       state: installed
   
   - name: 5563947-Install dependencies
     yum:
       name:
         - python-pip
       state: installed
   
   - name: 5563948-Install Python Flask dependencies
     pip:
       name:
         - flask
         - flask-mysql
       state: present
   
   - name: Copy web-server code
     copy: src=app.py dest=/opt/app.py
   
   - name: Start web-application
     shell: FLASK_APP=/opt/app.py nohup flask run --host=0.0.0.0 &
   ```



## PROJECT – FILE SEPARATION

Let us continue to improve our lamp stack project. Now that we have learned to organize tasks into separate files, let's move the variables to it's respective files. Create a host_vars and group_vars directory and move all variables to them. No variables to be defined in the main inventory file. Only the below parameters are to be configured as host variables. All other parameters are to be configured as group variables for the respective groups:

**Host Variables:**

```
ansible_host
ansible_ssh_private_key_file
ansible_user
```

The inventory file is located at `/home/thor/playbooks/lamp-stack-playbooks/inventory`. You may edit its contents but not its filename or location.

Check

- Move host variables to host_vars for lampweb
- Move group variables to group_vars for lampweb
- No variables to be defined in the inventory file for lampweb
- Move host variables to host_vars for lamp-db
- Move group variables to group_vars for lampweb
- No variables to be defined in the inventory file for lamp-db
- All inventory data intact for lampweb
- All inventory data intact for lamp-db

inventory

```
[db_servers]
lamp-db ansible_host=172.20.1.101 ansible_ssh_private_key_file=/home/thor/.ssh/maria ansible_user=maria mysqlservice=mysqld mysql_port=3306 dbname=ecomdb dbuser=ecomuser dbpassword=ecompassword

[web_servers]
lampweb ansible_host=172.20.1.100 ansible_ssh_private_key_file=/home/thor/.ssh/john ansible_user=john httpd_port=80 repository=https://github.com/kodekloudhub/learning-app-ecommerce.git
```

##### Follow below given steps:

```unix
cd /home/thor/playbooks/lamp-stack-playbooks/
mkdir host_vars
```

Create vars file for lamp-db

```unix
vi host_vars/lamp-db.yml
```

Add below given content

```
ansible_host: 172.20.1.101
ansible_ssh_private_key_file: /home/thor/.ssh/maria
ansible_user: maria
```

Create vars file for lampweb

```unix
vi host_vars/lampweb.yml
```

Add below given content

```
ansible_host: 172.20.1.100
ansible_ssh_private_key_file: /home/thor/.ssh/john
ansible_user: john
```

Create `group_vars` directory

```unix
mkdir group_vars
```

Create group vars file for db_servers

```unix
vi group_vars/db_servers.yml
```

Add below given content

```
mysqlservice: mysqld
mysql_port: 3306
dbname: ecomdb
dbuser: ecomuser
dbpassword: ecompassword
```

Create group vars file for web_servers

```unix
vi group_vars/web_servers.yml
```

Add below given content

```
httpd_port: 80
repository: https://github.com/kodekloudhub/learning-app-ecommerce.git
```

Update inventory

```unix
vi inventory
```

Add below given content

```
[db_servers]
lamp-db

[web_servers]
lampweb
```



2. Let's move the tasks to 3 separate files under the `tasks` directory. Create 3 files `common.yml`, `db.yml` and `web.yml` and move the associated tasks into each of them. Then include the tasks in the main playbook.

   Do not modify the tasks or task names. Only move them to the respective files

   Check

   - Tasks directory exists
   - common.yml exists
   - db.yml exists
   - web.yml exists

   deploy-lamp-stack.yml

   ```
   ---
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - libselinux-python
             - libsemanage-python
             - firewalld
           state: installed
   
   # Install and Configure Database
   - name: Deploy lamp stack application
     hosts: lamp-db
     become: yes
     tasks:
       - name: Install MariaDB package
         yum:
           name:
             - mariadb-server
             - MySQL-python
           state: installed
   
       - name: Create Mysql configuration file
         template: src=templates/my.cnf.j2 dest=/etc/my.cnf
   
       - name: Start MariaDB Service
         service: name=mariadb state=started enabled=yes
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule
         firewalld: port={{ mysql_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Create Application Database
         mysql_db: name={{ dbname }} state=present
      
       - name: gather facts from lampweb
         setup:
         delegate_to: "{{ item }}"
         delegate_facts: True
         with_items: "{{ hostvars[groups['web_servers'][0]].groups.web_servers }}"
   
       - name: Create Application DB User
         tags: Create Application DB User
         mysql_user: name={{ dbuser }} password={{ dbpassword }} priv=*.*:ALL host={{ hostvars['lampweb']['ansible_facts']['eth0']['ipv4']['address'] }} state=present
   
       - name: Move db-load-script to db host
         template:
           src: templates/db-load-script.sql.j2
           dest: /tmp/db-load-script.sql
   
       - name: Load Inventory Data
         shell: mysql -f < /tmp/db-load-script.sql
         
   - name: Deploy lamp stack application
     hosts: lampweb
     become: yes
     tasks:
       - name: Install httpd and php
         yum:
           name:
             - httpd
             - php
             - php-mysql
           state: present
   
       - name: Install web role specific dependencies
         yum: name=git state=installed
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   
       - name: insert firewalld rule for httpd
         firewalld: port={{ httpd_port }}/tcp permanent=true state=enabled immediate=yes
   
       - name: Set index.php as the default page
         tags: "Set index.php as the default page"
         replace:
           path: /etc/httpd/conf/httpd.conf
           regexp: 'DirectoryIndex index.html'
           replace: 'DirectoryIndex index.php'
   
       - name: http service state
         service: name=httpd state=started enabled=yes
   
       - name: Copy the code from repository
         git: repo={{ repository }} dest=/var/www/html/  force=yes
   
       - name: Creates the index.php file
         template: src=templates/index.php.j2 dest=/var/www/html/index.php
   ```

   

   ##### Follow below given steps:

   ```unix
   mkdir tasks
   vi tasks/common.yml
   ```

   Add below given content

   ```yaml
   - name: Install common dependencies
     yum:
       name:
         - libselinux-python
         - libsemanage-python
         - firewalld
   ```

   ```
   vi tasks/db.yml
   ```

   Add below given content

   ```yaml
   - name: Install MariaDB package
     yum:
       name:
         - mariadb-server
         - MySQL-python
       state: installed
   
   - name: Create Mysql configuration file
     template: src=templates/my.cnf.j2 dest=/etc/my.cnf
   
   - name: Start MariaDB Service
     service: name=mariadb state=started enabled=yes
   
   - name: Start firewalld
     service: name=firewalld state=started enabled=yes
   
   - name: insert firewalld rule
     firewalld: port={{ mysql_port }}/tcp permanent=true state=enabled immediate=yes
   
   - name: Create Application Database
     mysql_db: name={{ dbname }} state=present
   
   - name: gather facts from lampweb
     setup:
     delegate_to: "{{ item }}"
     delegate_facts: True
     with_items: "{{ hostvars[groups['web_servers'][0]].groups.web_servers }}"
   
   - name: Create Application DB User
     mysql_user: name={{ dbuser }} password={{ dbpassword }} priv=*.*:ALL host={{ hostvars['lampweb']['ansible_facts']['eth0']['ipv4']['address'] }} state=present
   
   - name: Move db-load-script to db host
     template:
       src: templates/db-load-script.sql.j2
       dest: /tmp/db-load-script.sql
   
   - name: Load Inventory Data
     shell: mysql -f < /tmp/db-load-script.sql
   ```

   ```
   vi tasks/web.yml
   ```

   Add below given content

   ```yaml
   - name: Install httpd and php
     yum:
       name:
         - httpd
         - php
         - php-mysql
       state: present
   
   - name: Install web role specific dependencies
     yum: name=git state=installed
   
   - name: Start firewalld
     service: name=firewalld state=started enabled=yes
   
   - name: insert firewalld rule for httpd
     firewalld: port={{ httpd_port }}/tcp permanent=true state=enabled immediate=yes
   
   - name: Set index.php as the default page
     tags: "Set index.php as the default page"
     replace:
       path: /etc/httpd/conf/httpd.conf
       regexp: 'DirectoryIndex index.html'
       replace: 'DirectoryIndex index.php'
   
   - name: http service state
     service: name=httpd state=started enabled=yes
   
   - name: Copy the code from repository
     git: repo={{ repository }} dest=/var/www/html/  force=yes
   
   - name: Creates the index.php file
     template: src=templates/index.php.j2 dest=/var/www/html/index.php
   ```

3. If not done already include the tasks in the main `deploy-lamp-stack.yml`

   Check

   - Include task files in the main playbook

   ##### Follow below given steps:

   ```unix
   vi deploy-lamp-stack.yml
   ```

   Add below given content

   ```yaml
   ---
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     tasks:
       - include_tasks: tasks/common.yml
       # Install and Configure Database
   - name: Deploy lamp stack application
     hosts: lamp-db
     gather_facts: yes
     become: yes
     tasks:
       - include_tasks: tasks/db.yml
   - name: Deploy lamp stack application
     hosts: lampweb
     gather_facts: yes
     become: yes
     tasks:
       - include_tasks: tasks/web.yml
   ```

4. Finally, test your playbook `deploy-lamp-stack.yml` and ensure it runs successfully.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks - 1
   - Verify Tasks - 2
   - Verify Tasks - 3
   - Verify Tasks - 4
   - Verify Tasks - 5

   ```
   $ ansible-playbook -i inventory deploy-lamp-stack.yml 
   
   PLAY [Deploy lamp stack application] *********************************************************************
   
   TASK [include_tasks] *************************************************************************************
   included: /home/thor/playbooks/lamp-stack-playbooks/tasks/common.yml for lamp-db, lampweb
   
   TASK [Install common dependencies] ***********************************************************************
   ok: [lamp-db]
   ok: [lampweb]
   
   PLAY [Deploy lamp stack application] *********************************************************************
   
   TASK [Gathering Facts] ***********************************************************************************
   ok: [lamp-db]
   
   TASK [include_tasks] *************************************************************************************
   included: /home/thor/playbooks/lamp-stack-playbooks/tasks/db.yml for lamp-db
   
   TASK [Install MariaDB package] ***************************************************************************
   ok: [lamp-db]
   
   TASK [Create Mysql configuration file] *******************************************************************
   ok: [lamp-db]
   
   TASK [Start MariaDB Service] *****************************************************************************
   ok: [lamp-db]
   
   TASK [Start firewalld] ***********************************************************************************
   ok: [lamp-db]
   
   TASK [insert firewalld rule] *****************************************************************************
   ok: [lamp-db]
   
   TASK [Create Application Database] ***********************************************************************
   ok: [lamp-db]
   
   TASK [gather facts from lampweb] *************************************************************************
   ok: [lamp-db -> 172.20.1.100] => (item=lampweb)
   
   TASK [Create Application DB User] ************************************************************************
   ok: [lamp-db]
   
   TASK [Move db-load-script to db host] ********************************************************************
   ok: [lamp-db]
   
   TASK [Load Inventory Data] *******************************************************************************
   changed: [lamp-db]
   
   PLAY [Deploy lamp stack application] *********************************************************************
   
   TASK [Gathering Facts] ***********************************************************************************
   ok: [lampweb]
   
   TASK [include_tasks] *************************************************************************************
   included: /home/thor/playbooks/lamp-stack-playbooks/tasks/web.yml for lampweb
   
   TASK [Install httpd and php] *****************************************************************************
   changed: [lampweb]
   
   TASK [Install web role specific dependencies] ************************************************************
   changed: [lampweb]
   
   TASK [Start firewalld] ***********************************************************************************
   changed: [lampweb]
   
   TASK [insert firewalld rule for httpd] *******************************************************************
   changed: [lampweb]
   
   TASK [Set index.php as the default page] *****************************************************************
   changed: [lampweb]
   
   TASK [http service state] ********************************************************************************
   changed: [lampweb]
   
   TASK [Copy the code from repository] *********************************************************************
   changed: [lampweb]
   
   TASK [Creates the index.php file] ************************************************************************
   changed: [lampweb]
   
   PLAY RECAP ***********************************************************************************************
   lamp-db                    : ok=14   changed=1    unreachable=0    failed=0   
   lampweb                    : ok=12   changed=8    unreachable=0    failed=0   
   ```

5. If not done already you may optionally execute the playbook and wait to completion. Then view the application by clicking the `Web App` link at the top of your terminal.

   OK

## Roles

## LABS – ROLES

1. Let's start using roles. In the `~/playbooks/db` directory we are attempting to configure mysql on a database server. A partially developed playbook is available. We have planned to use a role in the playbook.

   First, install the `kodekloud1.mysql` role on the ansible controller.

   Check

   - Role installed

   inventory

   ```
   db_server ansible_host=172.20.1.100 ansible_ssh_pass=Passw0rd ansible_user=root
   ```

   Install the `kodekloud1.mysql` role on the ansible controller using below given command.

   ```unix
   $ ansible-galaxy install kodekloud1.mysql
   - downloading role 'mysql', owned by kodekloud1
   - downloading role from https://github.com/kodekloudhub/mysql/archive/master.tar.gz
   - extracting kodekloud1.mysql to /home/thor/.ansible/roles/kodekloud1.mysql
   - kodekloud1.mysql (master) was installed successfully
   ```

2. Update the playbook to use the newly created role to configure the database server.

   CheckCompleteIncomplete

   - Playbook uses the Role
   - Check playbook syntax

   Update `deploy_db.yml` playbook as per below given code

   ```yaml
   ---
   - name: Deploy MySQL Server
     hosts: db_server
     roles:
       - kodekloud1.mysql
   ```

3. Let's configure a web server now. Navigate to the `web` directory. Install the `geerlingguy.nginx` role inside `roles` directory within the `web` directory.

   Check

   - Install Role in current directory'

   Install the `geerlingguy.nginx` role in `roles` directory within the `web` directory

   ```unix
   $ ansible-galaxy install geerlingguy.nginx -p roles
   - downloading role 'nginx', owned by geerlingguy
   - downloading role from https://github.com/geerlingguy/ansible-role-nginx/archive/3.1.4.tar.gz
   - extracting geerlingguy.nginx to /home/thor/playbooks/web/roles/geerlingguy.nginx
   - geerlingguy.nginx (3.1.4) was installed successfully
   ```

4. Update the playbook to use the role `geerlingguy.nginx` to install `nginx` web server

   Pass in an additional parameter to the role to `NOT` configure the service to be `enabled` at startup. Use the parameter `nginx_service_enabled`. Check `roles/geerlingguy.nginx/defaults/main.yml` for more details.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks

   inventory

   ````
   web_server ansible_host=172.20.1.101 ansible_ssh_pass=Passw0rd ansible_user=root
   ````

   Update `deploy_web.yml` playbook as per below given code

   ```yaml
   ---
   - name: Deploy Web Server
     hosts: web_server
     roles:
       - name: geerlingguy.nginx
         vars:
           nginx_service_enabled: no
   ```

   ```
   [thor@ansible-controller web]$ ansible-playbook -i inventory deploy_web.yml 
   
   PLAY [Deploy Web Server] *********************************************************************************
   
   TASK [Gathering Facts] ***********************************************************************************
   ok: [web_server]
   
   TASK [geerlingguy.nginx : Include OS-specific variables.] ************************************************
   ok: [web_server]
   
   TASK [geerlingguy.nginx : Define nginx_user.] ************************************************************
   ok: [web_server]
   
   TASK [geerlingguy.nginx : include_tasks] *****************************************************************
   included: /home/thor/playbooks/web/roles/geerlingguy.nginx/tasks/setup-RedHat.yml for web_server
   
   TASK [geerlingguy.nginx : Enable nginx repo.] ************************************************************
   changed: [web_server]
   
   TASK [geerlingguy.nginx : Ensure nginx is installed.] ****************************************************
   changed: [web_server]
   
   TASK [geerlingguy.nginx : include_tasks] *****************************************************************
   skipping: [web_server]
   
   TASK [geerlingguy.nginx : include_tasks] *****************************************************************
   skipping: [web_server]
   
   TASK [geerlingguy.nginx : include_tasks] *****************************************************************
   skipping: [web_server]
   
   TASK [geerlingguy.nginx : include_tasks] *****************************************************************
   skipping: [web_server]
   
   TASK [geerlingguy.nginx : include_tasks] *****************************************************************
   skipping: [web_server]
   
   TASK [geerlingguy.nginx : Remove default nginx vhost config file (if configured).] ***********************
   skipping: [web_server]
   
   TASK [geerlingguy.nginx : Ensure nginx_vhost_path exists.] ***********************************************
   ok: [web_server]
   
   TASK [geerlingguy.nginx : Add managed vhost config files.] ***********************************************
   
   TASK [geerlingguy.nginx : Remove managed vhost config files.] ********************************************
   
   TASK [geerlingguy.nginx : Remove legacy vhosts.conf file.] ***********************************************
   ok: [web_server]
   
   TASK [geerlingguy.nginx : Copy nginx configuration in place.] ********************************************
   changed: [web_server]
   
   TASK [geerlingguy.nginx : Ensure nginx service is running as configured.] ********************************
   changed: [web_server]
   
   RUNNING HANDLER [geerlingguy.nginx : reload nginx] *******************************************************
   changed: [web_server]
   
   PLAY RECAP ***********************************************************************************************
   web_server                 : ok=11   changed=5    unreachable=0    failed=0   
   ```

5. Let us now create our own role. Navigate to the `firewalld` directory. A playbook `deploy_firewalld.yml` is given that installs and starts the `firewalld` service. Let us first create our own role and move the tasks into it.

   Create a role named `ansible-role-firewalld` under in the `firewalld/roles` directory.

   Check

   - Role created

   inventory

   ```
   db_server ansible_host=172.20.1.100 ansible_ssh_pass=Passw0rd ansible_user=root
   ```

   Create a role named `ansible-role-firewalld` under in the `firewalld/roles` directory

   ```unix
   [thor@ansible-controller firewalld]$ ansible-galaxy init roles/ansible-role-firewalld
   - roles/ansible-role-firewalld was created successfully
   
   [thor@ansible-controller firewalld]$ ls
   deploy_firewalld.yml  inventory  roles
   ```

6. Move the tasks from the playbook to the `tasks/main.yml` file inside the role. Then use the newly created role in the playbook

   Check

   - Move tasks to main.yml
   - Playbook uses new role
   - Syntax Check
   - Prepare Environment
   - Apply playbook
   - Verify Tasks

   Move the tasks into `tasks/main.yml` and update `deploy_firewalld.yml` as per below given code

   deploy_firewalld.yml

   ```
   - name: Configure Firewalld
     hosts: all
     tasks:
       - name: Install common dependencies
         yum:
           name:
             - firewalld
           state: installed
   
       - name: Start firewalld
         service: name=firewalld state=started enabled=yes
   ```

   tasks/main.yml

   ```yaml
   ---
   - name: Install common dependencies
     yum:
       name:
         - firewalld
       state: installed
   - name: Start firewalld
     service: name=firewalld state=started enabled=yes
   ```

   Playbook should look like

   ```yaml
   - name: Configure Firewalld
     hosts: all
     roles:
       - ansible-role-firewalld
   
   ```

   ```
   [thor@ansible-controller firewalld]$ ansible-playbook -i inventory deploy_firewalld.yml 
   
   PLAY [Configure Firewalld] *******************************************************************************
   
   TASK [Gathering Facts] ***********************************************************************************
   ok: [db_server]
   
   TASK [ansible-role-firewalld : Install common dependencies] **********************************************
   changed: [db_server]
   
   TASK [ansible-role-firewalld : Start firewalld] **********************************************************
   changed: [db_server]
   
   PLAY RECAP ***********************************************************************************************
   db_server                  : ok=3    changed=2    unreachable=0    failed=0   
   ```



## PROJECT – ROLES CREATION

1. Let us continue to improve our lamp stack project. Now that we have learned about roles, let's create re-usable roles and use them in our project.

   Start by creating 3 roles named `common`, `httpd-php` and `mysql` under the roles directory under your project at `/home/thor/playbooks/lamp-stack-playbooks`

   Check

   - httpd-php role created
   - mysql role created
   - common role created

   inventory

   ```
   [db_servers]
   lamp-db
   
   [web_servers]
   lampweb
   ```

   Create roles

   ```
   [thor@ansible-controller lamp-stack-playbooks]$ ansible-galaxy init roles/httpd-php
   - roles/httpd-php was created successfully
   
   [thor@ansible-controller lamp-stack-playbooks]$ ansible-galaxy init roles/common
   - roles/common was created successfully
   
   [thor@ansible-controller lamp-stack-playbooks]$ ansible-galaxy init roles/mysql
   - roles/mysql was created successfully
   ```

2. Let's move the tasks from the `tasks` directory to the `tasks/main.yml` file inside each role.

   Do not modify the tasks or task names. Only move them to the respective files

   Check

   - Tasks directory exists
   - common/tasks/main.yml contains common tasks
   - roles/mysql/tasks/main.yml contains database tasks
   - roles/httpd-php/tasks/main.yml contains database tasks

   tasks/common.yml 

   ```
   - name: Install common dependencies
     yum:
       name:
         - libselinux-python
         - libsemanage-python
         - firewalld
       state: installed
   ```

   tasks/db.yml

   ```
   - name: Install MariaDB package
     yum:
       name:
         - mariadb-server
         - MySQL-python
       state: installed
   
   - name: Create Mysql configuration file
     template: src=templates/my.cnf.j2 dest=/etc/my.cnf
   
   - name: Start MariaDB Service
     service: name=mariadb state=started enabled=yes
   
   - name: Start firewalld
     service: name=firewalld state=started enabled=yes
   
   - name: insert firewalld rule
     firewalld: port={{ mysql_port }}/tcp permanent=true state=enabled immediate=yes
   
   - name: Create Application Database
     mysql_db: name={{ dbname }} state=present
   
   - name: Create Application DB User
     mysql_user: name={{ dbuser }} password={{ dbpassword }} priv=*.*:ALL host='172.20.1.100' state=present
   
   - name: Move db-load-script to db host
     template:
       src: templates/db-load-script.sql.j2
       dest: /tmp/db-load-script.sql
   
   - name: Load Inventory Data
     shell: mysql -f < /tmp/db-load-script.sql
   ```

   tasks/web.yml 

   ```
   - name: Install httpd and php
     yum:
       name:
         - httpd
         - php
         - php-mysql
       state: present
   
   - name: Install web role specific dependencies
     yum: name=git state=installed
   
   - name: Start firewalld
     service: name=firewalld state=started enabled=yes
   
   - name: insert firewalld rule for httpd
     firewalld: port={{ httpd_port }}/tcp permanent=true state=enabled immediate=yes
   
   - name: Set index.php as the default page
     tags: "Set index.php as the default page"
     replace:
       path: /etc/httpd/conf/httpd.conf
       regexp: 'DirectoryIndex index.html'
       replace: 'DirectoryIndex index.php'
   
   - name: http service state
     service: name=httpd state=started enabled=yes
   
   - name: Copy the code from repository
     git: repo={{ repository }} dest=/var/www/html/  force=yes
   
   - name: Creates the index.php file
     template: src=templates/index.php.j2 dest=/var/www/html/index.php
   ```

   Move the tasks to the tasks/main.yml file inside each role.

   ```unix
   cp tasks/common.yml roles/common/tasks/main.yml
   cp tasks/db.yml roles/mysql/tasks/main.yml
   cp tasks/web.yml roles/httpd-php/tasks/main.yml
   ```

3. If not done already, update the main playbook - `deploy-lamp-stack.yml` - to use the newly created roles.

   Check

   - Use httpd-php role in the main playbook
   - Use mysql role in the main playbook
   - Use common role in the main playbook

   Update `deploy-lamp-stack.yml` playbook as per below given code

   ```yaml
   ---
   
   - name: Deploy lamp stack application
     hosts: all
     become: yes
     roles:
       - common
   
       # Install and Configure Database
   - name: Deploy lamp stack application
     hosts: lamp-db
     become: yes
     roles:
       - mysql
   
   - name: Deploy lamp stack application
     hosts: lampweb
     become: yes
     roles:
       - httpd-php
   ```

4. Finally, test your playbook `deploy-lamp-stack.yml` and ensure it runs successfully.

   Check

   - Syntax Check
   - Prepare Environment
   - Apply Playbook
   - Verify Tasks - 1
   - Verify Tasks - 2
   - Verify Tasks - 3
   - Verify Tasks - 4
   - Verify Tasks - 5

   ```
   [thor@ansible-controller lamp-stack-playbooks]$ ansible-playbook -i inventory deploy-lamp-stack.yml 
   
   PLAY [Deploy lamp stack application] *********************************************************************
   
   TASK [Gathering Facts] ***********************************************************************************
   ok: [lamp-db]
   ok: [lampweb]
   
   TASK [common : Install common dependencies] **************************************************************
   changed: [lampweb]
   changed: [lamp-db]
   
   PLAY [Deploy lamp stack application] *********************************************************************
   
   TASK [Gathering Facts] ***********************************************************************************
   ok: [lamp-db]
   
   TASK [mysql : Install MariaDB package] *******************************************************************
   changed: [lamp-db]
   
   TASK [mysql : Create Mysql configuration file] ***********************************************************
   changed: [lamp-db]
   
   TASK [mysql : Start MariaDB Service] *********************************************************************
   changed: [lamp-db]
   
   TASK [mysql : Start firewalld] ***************************************************************************
   changed: [lamp-db]
   
   TASK [mysql : insert firewalld rule] *********************************************************************
   changed: [lamp-db]
   
   TASK [mysql : Create Application Database] ***************************************************************
   changed: [lamp-db]
   
   TASK [mysql : Create Application DB User] ****************************************************************
   changed: [lamp-db]
   
   TASK [mysql : Move db-load-script to db host] ************************************************************
   changed: [lamp-db]
   
   TASK [mysql : Load Inventory Data] ***********************************************************************
   changed: [lamp-db]
   
   PLAY [Deploy lamp stack application] *********************************************************************
   
   TASK [Gathering Facts] ***********************************************************************************
   ok: [lampweb]
   
   TASK [httpd-php : Install httpd and php] *****************************************************************
   changed: [lampweb]
   
   TASK [httpd-php : Install web role specific dependencies] ************************************************
   changed: [lampweb]
   
   TASK [httpd-php : Start firewalld] ***********************************************************************
   changed: [lampweb]
   
   TASK [httpd-php : insert firewalld rule for httpd] *******************************************************
   changed: [lampweb]
   
   TASK [httpd-php : Set index.php as the default page] *****************************************************
   changed: [lampweb]
   
   TASK [httpd-php : http service state] ********************************************************************
   changed: [lampweb]
   
   TASK [httpd-php : Copy the code from repository] *********************************************************
   changed: [lampweb]
   
   TASK [httpd-php : Creates the index.php file] ************************************************************
   changed: [lampweb]
   
   PLAY RECAP ***********************************************************************************************
   lamp-db                    : ok=12   changed=10   unreachable=0    failed=0   
   lampweb                    : ok=11   changed=9    unreachable=0    failed=0   
   ```

5. If not done already you may optionally execute the playbook and wait to completion. Then view the application by clicking the `Web App` link at the top of your terminal.

   OK

# Other Topics

## Vault






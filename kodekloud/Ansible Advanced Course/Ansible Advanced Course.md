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
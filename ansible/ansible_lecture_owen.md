[TOC]



# Ansible

## Inventory

### ini file

**hosts.ini**

```ini
# Indiviual
web.mydomain.local


# Group
[db]
db1.mydomain.local
db2.mydomain.local
db3.mydomain.local


[web]
web1.mydomain.local
web2.mydomain.local
web3.mydomain.local

# Group within Groups
[custumer1:children]
db
web
```

**owen.ini**

```ini
web ansible_host=192.168.101.103 ansible_port=22 ansible_user=root
```

### yaml file

**hosts.yaml**

```yaml
all:
  hosts:
     web.mydomain.local:
  children:
    customer1:
      children:
        db:
          hosts:
            db1.mydomain.local:
            db2.mydomain.local:
        web:
          hosts:
            web1.mydomain.local:
            web2.mydomain,web1.local:
```

**owen.yaml**

```yaml
all:
  hosts:
    web:
      ansible_host: 192.168.101.103
      ansible_port: 22
      ansble_user: root
```



## Playbooks

**Install and remove apache**

playbook.yaml

```yaml
- hosts: web
  remote_user: root
  become: yes
  tasks:
  - name: Install Apache
    yum:
      name: httpd
      state: installed
  - name: Remove Apache
    yum:
      name: httpd
      state: removed
```

**Running the playbook**

```
ansible-playbook -i hosts/owen.ini playbook.yaml 

PLAY [web] ***********************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [web]

TASK [Install Apache] ************************************************************
changed: [web]

TASK [Remove Apache] *************************************************************
changed: [web]

PLAY RECAP ***********************************************************************
web                        : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```



## Working with Services

**service.yaml**

```yaml
- hosts: web
  remote_user: root
  become: yes
  tasks:
  - name: Install Apache
    yum:
      name: httpd
      state: installed
  - name: Restart Apache
    service:
      name: httpd
      state: restarted
  - name: Remove Apache
    yum:
      name: httpd
      state: removed
```

**Running the playbook**

```
ansible-playbook -i hosts/owen.yaml playbook/service.yaml 

PLAY [web] ***********************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [web]

TASK [Install Apache] ************************************************************
changed: [web]

TASK [Restart Apache] ************************************************************
changed: [web]

TASK [Remove Apache] *************************************************************
changed: [web]

PLAY RECAP ***********************************************************************
web                        : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```



## Handlers

- Sometimes you want a task to run only when a change is made on a machine. For example, you may want to restart a service if a task updates the configuration of that service, but not if the configuration is unchanged. Ansible uses handlers to address this use case. 
- Handlers are tasks that only run when notified. Each handler should have a globally unique name.

handler.yaml

```yaml
- hosts: web
  remote_user: root
  become: yes
  tasks:
  - name: Install Apache
    yum:
      name: httpd 
      state: installed
    notify:
      - Restart Apache
  - name: Install Nano
    yum: 
      name: nano
      state: installed
    notify:
      - Restart Apache 
  - name: Install Mysql
    yum:
      name: mysql
      state: installed
    notify:
      - Restart Apache
  handlers:
    - name: Restart Apache
      service:
        name: httpd
        state: restarte
```

**Running the playbook**

```
ansible-playbook -i hosts/owen.ini playbook/handler.yaml 

PLAY [web] ***********************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [web]

TASK [Install Apache] ************************************************************
changed: [web]

TASK [Install Nano] **************************************************************
ok: [web]

TASK [Install Mysql] *************************************************************
changed: [web]

RUNNING HANDLER [Restart Apache] *************************************************
changed: [web]

PLAY RECAP ***********************************************************************
web                        : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

**cleanup.yaml**

```yaml
- hosts: web
  remote_user: root
  become: yes
  tasks:
  - name: Install Apache
    yum:
      name: httpd 
      state: installed
    notify:
      - Restart Apache
  - name: Install Nano
    yum: 
      name: nano
      state: installed
    notify:
      - Restart Apache 
  - name: Install Mysql
    yum:
      name: mysql
      state: installed
    notify:
      - Restart Apache
  - name: Remove Apache
    yum:
      name: httpd 
      state: removed
  - name: Remove Nano
    yum:
      name: nano
      state: removed
  - name: Remove Mysql
    yum:
      name: mysql
      state: removed            
  handlers:
    - name: Restart Apache
      service:
        name: httpd
        state: restarted
```

**Running the playbook**

```
ansible-playbook -i hosts/owen.ini playbook/cleanup.yaml 

PLAY [web] ***********************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [web]

TASK [Install Apache] ************************************************************
ok: [web]

TASK [Install Nano] **************************************************************
ok: [web]

TASK [Install Mysql] *************************************************************
ok: [web]

TASK [Remove Apache] *************************************************************
changed: [web]

TASK [Remove Nano] ***************************************************************
changed: [web]

TASK [Remove Mysql] **************************************************************
changed: [web]

PLAY RECAP ***********************************************************************
web                        : ok=7    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

## Working with the Shell

**cmd.yaml**

```yaml
- hosts: web
  remote_user: root
  become: yes
  tasks:
    - name: executing sample command 
      shell: echo "Hello, World!" 
```

**Running the playbook  with verbosity**

```
ansible-playbook -i hosts/owen.ini -v playbook/cmd.yaml 
Using /etc/ansible/ansible.cfg as config file

PLAY [web] ***********************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [web]

TASK [executing sample command] **************************************************
changed: [web] => {"changed": true, "cmd": "echo \"Hello, World!\"", "delta": "0:00:00.007513", "end": "2021-09-30 23:17:10.239855", "rc": 0, "start": "2021-09-30 23:17:10.232342", "stderr": "", "stderr_lines": [], "stdout": "Hello, World!", "stdout_lines": ["Hello, World!"]}

PLAY RECAP ***********************************************************************
web                        : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

### Using Debug module

debug.yaml

```yaml
- hosts: web
  remote_user: root
  become: yes
  tasks:
    - name: executing sample command 
      shell: echo "Hello, World!" 
      register: abcd
    - debug: var=abcd.stdout_lines  
```

**Running the playbook**

```
ansible-playbook -i hosts/owen.ini playbook/debug.yaml 

PLAY [web] ***********************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [web]

TASK [executing sample command] **************************************************
changed: [web]

TASK [debug] *********************************************************************
ok: [web] => {
    "abcd.stdout_lines": [
        "Hello, World!"
    ]
}

PLAY RECAP ***********************************************************************
web                        : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

## 2 ways to see the output

1. **Running the playbook  with verbosity**

   ```
   ansible-playbook -i hosts/owen.ini -v playbook/cmd.yaml
   ```

   

2. **Using Debug module**

## Web Challege2

**challege2/playbook.yaml**

```yaml
- hosts: web
  remote_user: root
  become: yes
  tasks:
  - name: Update All Packages
    yum:
      name: '*'
      state: latest
  - name: Install Apache
    yum: 
      name: httpd
      state: installed
  - name: Create The HTML File
    shell: echo "Hello From The Ansible Challenge" > /var/www/html/index.html
    args:
      executable: /bin/bash
    notify:
      - Reload Apache
  - name: Show host IP 
    debug:
      msg: "{{ ansible_ssh_host }}"
  - name: FirewallD rules
    firewalld:
      zone: public
      service: http
      permanent: yes
      state: enabled
  - name: reload service firewalld
    systemd:
      name: firewalld
      state: reloaded
  # - name: Uninstall Apache
  #  yum: 
  #    name: httpd
  #    state: removed
  handlers:
    - name: Reload Apache
      service:
        name: httpd
        state: reloaded
```

**Running playbook**

```
ansible-playbook -i hosts/owen.ini challenge2/playbook.yaml 

PLAY [web] ***********************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [web]

TASK [Update All Packages] *******************************************************
ok: [web]

TASK [Install Apache] ************************************************************
changed: [web]

TASK [Create The HTML File] ******************************************************
changed: [web]

TASK [Show host IP] **************************************************************
ok: [web] => {
    "msg": "192.168.101.112"
}

TASK [FirewallD rules] ***********************************************************
ok: [web]

TASK [reload service firewalld] **************************************************
changed: [web]

RUNNING HANDLER [Reload Apache] **************************************************
changed: [web]

PLAY RECAP ***********************************************************************
web                        : ok=8    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

## Variables

**basic.yaml**

```yaml
- hosts: localhost
  vars:
    basic_var: My First Variable
  tasks:
  - name: Display Value
    debug:
      msg: "{{ basic_var }}
```

**Running playbook**

```
ansible-playbook variables/vardemo/basic.yaml 
[WARNING]: provided hosts list is empty, only localhost is available. Note that
the implicit localhost does not match 'all'

PLAY [localhost] *****************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [localhost]

TASK [Display Value] *************************************************************
ok: [localhost] => {
    "msg": "My First Variable"
}

PLAY RECAP ***********************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

**vars.yaml**

```yaml
http_port: 80
server_name: prod_dc01
```

**var_file_demo.yaml**

```yaml
- hosts: localhost
  tasks:
  - name: Display 1st Value
    debug:
      msg: "{{ http_port }}"
  - name: Display 2nd Value
    debug:
      msg: "{{ server_name }}"
```

**Running playbook**

```
ansible-playbook -e "@vars.yaml" var_file_demo.yaml 
[WARNING]: provided hosts list is empty, only localhost is available. Note that
the implicit localhost does not match 'all'

PLAY [localhost] *****************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [localhost]

TASK [Display 1st Value] *********************************************************
ok: [localhost] => {
    "msg": 80
}

TASK [Display 2nd Value] *********************************************************
ok: [localhost] => {
    "msg": "prod_dc01"
}

PLAY RECAP ***********************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

## Declaratively using variables

**vars.yaml**

```yaml
http_port: 80
server_name: prod_dc01
```

**var_file_demo.yaml**

```yaml
- hosts: localhost
  vars_files:
    - vars.yaml
  tasks:
  - name: Display 1st Value
    debug:
      msg: "{{ http_port }}"
  - name: Display 2nd Value
    debug:
      msg: "{{ server_name }}"
```

**Running playbook**

```
ansible-playbook variables/vardemo/var_file_demo.yaml 
[WARNING]: provided hosts list is empty, only localhost is available. Note that
the implicit localhost does not match 'all'

PLAY [localhost] *****************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [localhost]

TASK [Display 1st Value] *********************************************************
ok: [localhost] => {
    "msg": 80
}

TASK [Display 2nd Value] *********************************************************
ok: [localhost] => {
    "msg": "prod_dc01"
}

PLAY RECAP ***********************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

## Variables Using CLI

**cli.yaml**

```yaml
- hosts: localhost
  tasks:
  - name: Display Value
    debug:
      msg: "{{ basic_var }}"
```

**Running playbook**

```
ansible-playbook -e "basic_var=CLI" variables/vardemo/cli.yaml 
[WARNING]: provided hosts list is empty, only localhost is available. Note that
the implicit localhost does not match 'all'

PLAY [localhost] *****************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [localhost]

TASK [Display Value] *************************************************************
ok: [localhost] => {
    "msg": "CLI"
}

PLAY RECAP ***********************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```



## Arrays

**arrays.yaml**

```yaml
- hosts: localhost
  vars:
    courses:
      - ansible
      - terraform
      - docker
  tasks:
  - name: Display Value
    debug:
      msg: "{{ courses [0] }}"
```

**Running playbook**

```
 ansible-playbook variables/vardemo/arrays.yaml 
[WARNING]: provided hosts list is empty, only localhost is available. Note that
the implicit localhost does not match 'all'

PLAY [localhost] *****************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [localhost]

TASK [Display Value] *************************************************************
ok: [localhost] => {
    "msg": "ansible"
}

PLAY RECAP ***********************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```



## Loops

multi.yaml

```yaml
- hosts: web
  remote_user: root
  become: yes
  vars:
    packages:
      - httpd 
      - nano 
      - mysql
  tasks:
  - name: Install Software
    yum:
      name: "{{ item }}"
      state: installed
    loop: "{{ packages }}"
  - name: Remove Software
    yum: 
      name: 
        - httpd 
        - nano 
        - mysql
      state: removed
```

**Running playbook**

```
ansible-playbook -i hosts/owen.ini variables/multi.yaml 

PLAY [web] ***********************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [web]

TASK [Install Software] **********************************************************
ok: [web] => (item=httpd)
ok: [web] => (item=nano)
ok: [web] => (item=mysql)

TASK [Remove Software] ***********************************************************
changed: [web]

PLAY RECAP ***********************************************************************
web                        : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

##  Creating a Role

### Create role apache

```
ansible-galaxy init apache
- Role apache was created successfully
```



### Folder structure

- `tasks/main.yml` - the main list of tasks that the role executes.
- `handlers/main.yml` - handlers, which may be used within or outside this role.
- `library/my_module.py` - modules, which may be used within this role (see [Embedding modules and plugins in roles](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html#embedding-modules-and-plugins-in-roles) for more information).
- `defaults/main.yml` - default variables for the role (see [Using Variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#playbooks-variables) for more information). These variables have the lowest priority of any variables available, and can be easily overridden by any other variable, including inventory variables.
- `vars/main.yml` - other variables for the role (see [Using Variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#playbooks-variables) for more information).
- `files/main.yml` - files that the role deploys.
- `templates/main.yml` - templates that the role deploys.
- `meta/main.yml` - metadata for the role, including role dependencies.

### Creating the playbook

**roles/apache/handlers/main.yml**

```yaml
---
# handlers file for apache
- name: Reload Apache
  service:
    name: httpd
    state: reloaded
```

**roles/apache/tasks/main.yml**

```yaml
---
# tasks file for apache
- name: Update All Packages
  yum:
    name: '*'
    state: latest
- name: Install Apache
  yum: 
    name: httpd
    state: installed
- name: Create The HTML File
  shell: echo "Hello From The Ansible Challenge" > /var/www/html/index.html
  args:
    executable: /bin/bash
  notify:
    - Reload Apache
- name: Show host IP 
  debug:
    msg: "{{ ansible_ssh_host }}"
- name: FirewallD rules
  firewalld:
    zone: public
    service: http
    permanent: yes
    state: enabled
- name: reload service firewalld
  systemd:
    name: firewalld
    state: reloaded
```

**roles/playbook.yaml**

```yaml
- hosts: web
  remote_user: root
  become: yes
  roles:
    - apache 
```

**Running playbook**

```
ansible-playbook -i hosts/owen.ini roles/playbook.yaml 

PLAY [web] ***********************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [web]

TASK [apache : Update All Packages] **********************************************
ok: [web]

TASK [apache : Install Apache] ***************************************************
ok: [web]

TASK [apache : Create The HTML File] *********************************************
changed: [web]

TASK [apache : Show host IP] *****************************************************
ok: [web] => {
    "msg": "192.168.101.116"
}

TASK [apache : FirewallD rules] **************************************************
ok: [web]

TASK [apache : reload service firewalld] *****************************************
changed: [web]

RUNNING HANDLER [apache : Reload Apache] *****************************************
changed: [web]

PLAY RECAP ***********************************************************************
web                        : ok=8    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

### Create role cleaner

```
ansible-galaxy init cleaner
```

**roles/cleaner/tasks/main.yml**

```yaml
---
# tasks file for cleaner
- name: Uninstall Apache
  yum: 
    name: httpd
    state: removed
- name: Remove index.html
  file:
    path: /var/www/html/index.html
    state: absent
```

**roles/playbook.yaml**

```yaml
- hosts: web
  remote_user: root
  become: yes
  roles:
    - apache 
    - cleaner
```

**Running playbook**

```
ansible-playbook -i hosts/owen.ini roles/playbook.yaml 

PLAY [web] ***********************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [web]

TASK [apache : Update All Packages] **********************************************
ok: [web]

TASK [apache : Install Apache] ***************************************************
changed: [web]

TASK [apache : Create The HTML File] *********************************************
changed: [web]

TASK [apache : Show host IP] *****************************************************
ok: [web] => {
    "msg": "192.168.101.116"
}

TASK [apache : FirewallD rules] **************************************************
ok: [web]

TASK [apache : reload service firewalld] *****************************************
changed: [web]

TASK [cleaner : Uninstall Apache] ************************************************
changed: [web]

TASK [cleaner : Remove index.html] ***********************************************
changed: [web]

RUNNING HANDLER [apache : Reload Apache] *****************************************
fatal: [web]: FAILED! => {"changed": false, "msg": "Could not find the requested service httpd: host"}

NO MORE HOSTS LEFT ***************************************************************

PLAY RECAP ***********************************************************************
web                        : ok=9    changed=5    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
```

## Ansible Galaxy

https://galaxy.ansible.com/

### Downloading Roles

**Installing multiple roles from a file link**

https://docs.ansible.com/ansible/latest/galaxy/user_guide.html#id21

**roles/requirements.yaml**

```yaml
- name: geerlingguy.docker
- src: https://github.com/companieshouse/ansible-role-apache
  name: apache-ch
```

**Downloading roles**

```
ansible-galaxy install --roles-path . -r requirements.yaml 
- downloading role 'docker', owned by geerlingguy
- downloading role from https://github.com/geerlingguy/ansible-role-docker/archive/4.1.0.tar.gz
- extracting geerlingguy.docker to /home/sherwinowen/Documents/my_tutorials/ansible/codes/roles/geerlingguy.docker
- geerlingguy.docker (4.1.0) was installed successfully
- extracting apache-ch to /home/sherwinowen/Documents/my_tutorials/ansible/codes/roles/apache-ch
- apache-ch was installed successfully
```

### Roles and Collection

**roles/requirements.yaml**

```yaml
- name: geerlingguy.docker
- src: https://github.com/companieshouse/ansible-role-apache
  name: apache-ch
- name: geerlingguy.k8s
```

**Downloading collections**

```
ansible-galaxy collection install -p . -r requirements.yaml 
[WARNING]: The specified collections path
'/home/sherwinowen/Documents/my_tutorials/ansible/codes/roles' is not part of the
configured Ansible collections paths
'/home/sherwinowen/.ansible/collections:/usr/share/ansible/collections'. The
installed collection won't be picked up in an Ansible run.
Process install dependency map
Starting collection install process
Installing 'geerlingguy.k8s:0.10.0' to '/home/sherwinowen/Documents/my_tutorials/ansible/codes/roles/ansible_collections/geerlingguy/k8s'
```

## Roles and Variables



```
ansible-galaxy init vardemo1 
- Role vardemo1 was created successfully
```

**vardemo1/tasks/main.yml**

```yaml
- hosts: localhost
  vars:
    basic_var: My First Variable
  tasks:
  - name: Display Value
    debug:
      msg: "{{ basic_var }}
```



**vardemo1/defaults/main.yml**

```yaml
---
# defaults file for vardemo1
basic_var: My First Variable
```

**Run playbook**

```
ansible-playbook -i hosts/owen.ini variables/var_role.yaml 

PLAY [localhost] *****************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [localhost]

TASK [vardemo1 : Display Value] **************************************************
ok: [localhost] => {
    "msg": "My First Variable"
}

PLAY RECAP ***********************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

**vardemo1/vars/main.yml**

```yaml
---
# defaults file for vardemo1
basic_var: My MAIN Variable
```



**Run playbook**

```
ansible-playbook -i hosts/owen.ini variables/var_role.yaml 

PLAY [localhost] *****************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [localhost]

TASK [vardemo1 : Display Value] **************************************************
ok: [localhost] => {
    "msg": "My MAIN Variable"
}

PLAY RECAP ***********************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```



**Run playbook with -e option**

```
ansible-playbook -i hosts/owen.ini -e "basic_var=CLI" variables/var_role.yaml 

PLAY [localhost] *****************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [localhost]

TASK [vardemo1 : Display Value] **************************************************
ok: [localhost] => {
    "msg": "CLI"
}

PLAY RECAP ***********************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

```

**Note:** 

1. **defaults folder** lowest priority

2. **vars folder** overwrite values inside defaults folder
3. **extra variable ( -e )** highest priority

## Dependencies

- they run first

roles/apache/meta/main.yml

**edit dependencies part**

```yaml
dependencies:
  - cleaner
```

**Run playbook**

```
$ ansible-playbook -i hosts/owen.ini roles/playbook.yaml 

PLAY [web] ***********************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [web]

TASK [cleaner : Uninstall Apache] ************************************************
ok: [web]

TASK [cleaner : Remove index.html] ***********************************************
ok: [web]

TASK [apache : Update All Packages] **********************************************
ok: [web]

TASK [apache : Install Apache] ***************************************************
changed: [web]

TASK [apache : Create The HTML File] *********************************************
changed: [web]

TASK [apache : Show host IP] *****************************************************
ok: [web] => {
    "msg": "192.168.101.116"
}

TASK [apache : FirewallD rules] **************************************************
ok: [web]

TASK [apache : reload service firewalld] *****************************************
changed: [web]

RUNNING HANDLER [apache : Reload Apache] *****************************************
changed: [web]

PLAY RECAP ***********************************************************************
web                        : ok=10   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```



## Role Challege

1) Create a web-server role that installs apache (httpd) and starts the service
2) Create a DB role that installs MariaDB by default but we want to install MySQL and start the service
3) The DB MUST START before the web server

**Create role web**

```
ansible-galaxy init web
- Role web was created successfully
```

**Create role db**

```
ansible-galaxy init db
- Role db was created successfully
```

**/challenge3/playbook.yaml**

```yaml
- hosts: web
  remote_user: root
  become: yes
  roles: 
    - web
    - db
```

**/challenge3/web/tasks/main.yml**

```
---
# tasks file for web
- name: Install Apache
  yum:
    name: httpd
    state: installed
  notify:
    - Start Web  
```

**/challenge3/web/handlers/main.yml**

```
---
# handlers file for web
- name: Start Web
  service:
    name: httpd
    state: started
```

**/challenge3/web/meta/main.yml**

```
dependencies:
  - db
```

**/challenge3/db/tasks/main.yml**

```
---
# tasks file for db
- name: Install DB
  yum:
    name: "{{ db_server }}"
    state: installed
  notify:
    - Start DB
- name: Display DB Installed
  debug:
    msg: "{{ db_server }}"
```

**/challenge3/db/defaults/main.yml**

```
---
# defaults file for db
db_server: mariadb
```

**/challenge3/db/vars/main.yml**

```
---
# vars file for db
db_server: mysql
```

**/challenge3/db/handlers/main.yml**

```
---
# handlers file for db
- name: Start DB
  service:
    name: "{{ db_server }}"
    state: started
```

**Run playbook**

```
ansible-playbook -i hosts/owen.ini challenge3/playbook.yaml 

PLAY [web] ***********************************************************************

TASK [Gathering Facts] ***********************************************************
ok: [web]

TASK [db : Install DB] ***********************************************************
ok: [web]

TASK [db : Display DB Installed] *************************************************
ok: [web] => {
    "msg": "mysql"
}

TASK [web : Install Apache] ******************************************************
ok: [web]

PLAY RECAP ***********************************************************************
web                        : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

## Dynamic Inventory


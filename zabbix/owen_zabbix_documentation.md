# Installation of Zabbix 

## Table of Contents
* [Zabbix Installation in Dockers](#Zabbix-Installation-in-Dockers)
* [Zabbix Server Installation](#Zabbix-Server-Installation)
* [Installation of Zabbix Agent in Window](#Installation-of-Zabbix-Agent-in-Window)
* [Add windows host in Zabbix Server](#Add-windows-host-in-Zabbix-Server)
* [Installation of Zabbix Agent in Linux ](#Installation-of-Zabbix-Agent-in-Linux)
* [Add Linux host in Zabbix Server](#Add-Linux-host-in-Zabbix-Server)
* [Adding Cisco device in Zabbix Server](#Adding-Cisco-device-in-Zabbix-Server)
* [Configure Zabbix to send email notifications](#Configure-Zabbix-to-send-email-notifications)

## Zabbix Installation in Dockers

```
# Deploy a mysql container for zabbix to use.
docker run -d \
  --name="zabbix-mysql-database" \
  --restart=always \
  -p 3306:3306 \
  -e MYSQL_DATABASE=zabbix \
  -e MYSQL_USER=zabbixadmin \
  -e MYSQL_PASSWORD=zabbixpassword \
  -e MYSQL_ROOT_PASSWORD=zabbixroot \
  -v $HOME/mysql:/var/lib/mysql \
  mysql:5.7

# Deploy the zabbix-server application container
docker run -d \
  --name zabbix-server \
  --restart=always \
  -e DB_SERVER_HOST=172.17.0.2 \
  -e MYSQL_USER="zabbixadmin" \
  -e MYSQL_PASSWORD=zabbixpassword \
  -v $HOME/volumes/zabbix/alertscripts:/usr/lib/zabbix/alertscripts \
  -v $HOME/volumes/zabbix/externalscripts:/usr/lib/zabbix/externalscripts \
  -v $HOME/volumes/zabbix/modules:/var/lib/zabbix/modules \
  -v $HOME/volumes/zabbix/enc:/var/lib/zabbix/enc \
  -v $HOME/volumes/zabbix/ssh_keys:/var/lib/zabbix/ssh_keys \
  -v $HOME/volumes/zabbix/ssl/certs:/var/lib/zabbix/ssl/certs \
  -v $HOME/volumes/zabbix/ssl/keys:/var/lib/zabbix/ssl/keys \
  -v $HOME/volumes/zabbix/ssl_ca:/var/lib/zabbix/ssl/ssl_ca \
  -v $HOME/volumes/zabbix/snmptraps:/var/lib/zabbix/snmptraps \
  -v $HOME/volumes/zabbix/mibs:/var/lib/zabbix/mibs \
  -p 10050:10050 \
  -p 10051:10051 \
  zabbix/zabbix-server-mysql:ubuntu-3.4-latest


# Deploy the webserver frontend.
docker run -d \
  --name zabbix-web-nginx \
  --restart=always \
  -e DB_SERVER_HOST="172.17.0.2" \
  -e MYSQL_USER="zabbixadmin" \
  -e MYSQL_PASSWORD=zabbixpassword \
  -e ZBX_SERVER_HOST=172.17.0.3 \
  -e PHP_TZ="Asia/Manila" \
  -p 80:80 \
  -p443:443 \
  zabbix/zabbix-web-nginx-mysql:ubuntu-3.4-latest
```

## Zabbix Server Installation

1. Disable SELinux
a. Open SELinux configuration and edit the file:
```
vi /etc/sysconfig/selinux
```
Change “SELINUX=enforcing” to  “SELINUX=disabled”

​		b. Save and exit the file. Then reboot the system.

```
reboot
```

2. Install Apache
```
yum -y install httpd

# Enable apache service on system boot.
systemctl enable httpd

# Start  apache service
systemctl start httpd.service

# Allow http service in firewall
firewall-cmd --add-service=http --permanent
firewall-cmd --reload
```

3. Install and Configure PHP
```
# Use the following command:

yum -y install php php-pear php-cgi php-common php-mbstring php-snmp php-gd php-xml php-mysql php-gettext php-bcmath

# Modify the PHP time Zone by editing the php.ini file
vi /etc/php.ini

# Uncomment the following line and change the time zone.
date.timezone = Philippines/Manila
```

4. Install MariaDB
```
# Use the following command:
yum --enablerepo=remi install mariadb-server

# Enable MariaDB on system boot.
systemctl enable mariadb

# Start the MariaDB service.
systemctl start mariadb.service

# Run the following command to secure MariaDB.
mysql_secure_installation

# Add a new root password and continue. Then it will ask a few questions. Type “Y” to agree to that.
```

5. Create a Database for Zabbix
```
# Login to DB server using the following command
mysql -u root –p

# Create Database
$ MariaDB [(none)]> create database zabbixdb character set utf8 collate utf8_bin;

# Create a DB user and grant privileges.
$ MariaDB [(none)]>  create user 'zabbixadmin'@'localhost' identified BY 'P@ssw0rd';
$ MariaDB [(none)]> grant all privileges on zabbixdb.* to zabbixadmin@localhost ;$ MariaDB [(noConfigure Zabbix to send email notificationsne)]> flush privileges;
$ MariaDB [(none)] > quit

# Run the following command to install the default Zabbix tables to the newly created database:
zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql –u zabbixadmin  -D zabbixdb  -p
```

6. Install Zabbix and needed dependencies

```
# Adding Zabbix repository.
rpm -ivh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm

# Install Zabbix.
yum install zabbix-server-mysql  zabbix-web-mysql zabbix-agent zabbix-get

# Change Time Zone by editing the Zabbix Apache configuration file
vi /etc/httpd/conf.d/zabbix.conf

Uncomment the following line and add your Time Zone.
php_value date.timezone Asia/Manila

PHP Parameters should look like as follows:
php_value max_execution_time 300
php_value memory_limit 128M
php_value post_max_size 16M
php_value upload_max_filesize 2M
php_value max_input_time 300
php_value max_input_vars 10000
php_value always_populate_raw_post_data -1
php_value date.timezone Asia/Manila

# Edit Zabbix configuration file
vi /etc/zabbix/zabbix_server.conf

# Find the DBUser=zabbix  and DBPassword=zabbix  line and replace it with DB user and password that you set for the MariaDB.

# Allow port used by Zabbix in firewall
firewall-cmd --add-port={10051/tcp,10050/tcp} --permanent
firewall-cmd --reload

# Restart the zabbix-server, zabbix –agent and httpd services 
systemctl restart zabbix-server zabbix-agent httpd
```

7. Setup Zabbix

 You can access Zabbix using following URL:
http://Server-Host-Name/zabbix or http://192.168.100.1/zabbix/


## Installation of Zabbix Agent in Window

1. Download Zabbix Agent on Windows

   You can find Zabbix agent for different OS on Zabbix’s Download page (https://www.zabbix.com/download_agents). Choose Zabbix Agent  version 3.2.

2. Install Zabbix Agent on Windows Server

   a. Unzip the archive folder.

   b. Create a folder named zabbix on your C: drive and copy the following files there: zabbix_agentd.exe, zabbix_get.exe, zabbix_sender.exe, zabbix_agentd.win.conf.

   c. Open zabbix_agentd.win.conf with any text editor and change the following parameters:

   ```
   Server=Your_Zabbix_server_IP
   ServerActive=Your_Zabbix_server_IP
   Hostname=Win10-01
   ```

   d. Open the command prompt with administrative rights and run the next command:

```
   c:/zabbix/zabbix_agentd.exe --config c:/zabbix/zabbix_agentd.win.conf --install```
```

   e. Now open Service Manager, find the Zabbix Agent and start it.

## Add windows host in Zabbix Server

  1. Go to the Zabbix web browser panel, open Configuration -> Hosts, and click Create host.
  2. Enter your Host Name. Add Windows Servers group.  Add Zabbix Server IP and click Update
  3. Then, go to the Template tab and click Select. Select Template OS Windows and click Add.

## Installation of Zabbix Agent in Linux 

  1. Install Zabbix repository configuration package on the client system

```
rpm -ivh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm
rpm -ivh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm

apt update
```

  2. Install Zabbix Agent

```
yum install -y zabbix-agent
```

  3. Configure Zabbix Agent configuration file

```
vi /etc/zabbix/zabbix_agentd.conf

# Update the following details on the Zabbix agent configuration file.

### Zabbix Server IP Address or Hostname ###
Server=[Server IP]

### Client Hostname ###
Hostname=centos.itzgeek.local
```

4. Start zabbix agent service at bootup

```
systemctl enable zabbix-agent
```

5. Restart zabbix agent service

```
systemctl restart zabbix-agent
```



## Add Linux host in Zabbix Server

1. Go to the Zabbix web browser panel, open Configuration -> Hosts, and click Create host.

2. Enter your Host Name, add Linux Servers group, add Zabbix Server IP and click Update.

3. Click Select to add new template. Choose Template OS Linux. Add button to add the Template to new hosts. Click Update to complete the process.



## Adding Cisco device in Zabbix Server

1. Configure SNMP on the Cisco device

   Configure SNMPv2c on Cisco routers and switches with one command as shown below:

```
switch> enable
switch# configure terminal
switch(config)# snmp-server community MyCommunity RO
switch(config)# exit
switch# copy running-config startup-config
```

2. Go to “Host” menu under “Configuration” tab and then click “Create host” option to create a host in Zabbix:
3. Define “Hostname” and set “Groups”.Then remove “Agent interfaces” (because we can’t use Zabbix agent on router or switch) and add “SNMP interfaces“: 
4. Under the “SNMP interfaces” set the management IP address or DNS name of the device:
5. Then switch to tab “Templates” and choose the appropriate template for your Cisco device under section “Link new template” by typing “net cisco”. Use “Template Net Cisco IOS SNMPv2”. Then click update.
6. Click the macro option and set the SNMP_Community variable with the SNMP community configured on Cisco switch.

```
Macro					Value
{$SNMP_COMMUNITY}		MyCommunity
```


## Configure Zabbix to send email notifications

To configure e-mail as the delivery channel for messages, you need to configure e-mail as the media type and assign specific addresses to users.

1. Go to Administration → Media types. Click on Create media type (or click on E-mail in the list of pre-defined media types).

   The Media type tab contains general media type attributes:

   To configure e-mail as the delivery channel for messages, you need to configure e-mail as the media type and assign specific addresses to users.

   Go to Administration → Media types. Click on Create media type (or click on E-mail in the list of pre-defined media types).

   The Media type tab contains general media type attributes:

   Assign a specific email address to the user: 

   Go to Administration → Users. Open the user properties form In Media tab, click on Add

![img](file:////tmp/wps-sherwinowen/ksohtml/wpsK8lntH.jpg)

2. Assign a specific email address to the user: 

   Go to Administration → Users. Open the user properties form In Media tab, click on Add

![img](file:////tmp/wps-sherwinowen/ksohtml/wpsfItycK.jpg) 

 
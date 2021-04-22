[TOC]



# Moodle

## Install moodle



### Setup web server

```
# Install Apache/MySQL server and client/PHP
$ sudo apt install apache2 mysql-client mysql-server php libapache2-mod-php


# Install Additional Software
$ sudo apt install graphviz aspell ghostscript clamav php7.4-pspell php7.4-curl php7.4-gd php7.4-intl php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-ldap php7.4-zip php7.4-soap php7.4-mbstring

# Restart apachebasesudo service apache2 restart

$ Install Git
$ sudo apt install git

# Download moodle
$ cd /opt
$ sudo git clone git://git.moodle.org/moodle.git

# Change directory into the downloaded Moodle folder
$ cd moodle

# Retrieve a list of each branch available
sudo git branch -a

# Tell git which branch to track or use
sudo git branch --track MOODLE_39_STABLE origin/MOODLE_39_STABLE

# Finally, Check out the Moodle version specified
sudo git checkout MOODLE_39_STABLE


# Copy local repository to /var/www/html/
$ sudo cp -R /opt/moodle /var/www/html/
$ sudo mkdir /var/moodledata
$ sudo chown -R www-data /var/moodledata
$ sudo chmod -R 777 /var/moodledata
$ sudo chmod -R 0755 /var/www/html/moodle

```



###  Setup MySQL Server

```
# Connect to mysql server
$ mysql -h cdm-lms-db.cpuur4cknf6y.ap-southeast-1.rds.amazonaws.com -u admin -p

# Create DB
FLUSH PRIVILEGES;
mysql> CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


# Create user
mysql>create user 'moodle_dbuser'@'localhost' IDENTIFIED BY 'passwordformoodledude';

OR 

mysql>create user 'moodle_dbuser'@'172.16.31.%' IDENTIFIED BY 'passwordformoodledude';

# Grant user privilege 
mysql>GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON 
moodle.* TO 'moodledude'@'localhost';

mysql> GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'localhost';

FLUSH PRIVILEGES;

mysql>quit;
```



### List users in mysql

```
# List users
mysql> select user,host from mysql.user;
+------------------+-------------+
| user             | host        |
+------------------+-------------+
| admin            | %           |
| moodle_dbuser    | 172.16.31.% |
| mysql.infoschema | localhost   |
| mysql.session    | localhost   |
| mysql.sys        | localhost   |
| rdsadmin         | localhost   |
+------------------+-------------+
6 rows in set (0.00 sec)

mysql> SHOW GRANTS FOR 'moodle_dbuser'@'172.16.31.%';
+---------------------------------------------------------------------------------------------------------------------------------------------+
| Grants for moodle_dbuser@172.16.31.%                                                                                                        |
+---------------------------------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `moodle_dbuser`@`172.16.31.%`                                                                                         |
| GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON `moodle_db`.* TO `moodle_dbuser`@`172.16.31.%` |
+---------------------------------------------------------------------------------------------------------------------------------------------+
2 rows in set (0.01 sec)

```







### Backup and restore moodle contents

```
# Create tar file
$ cd /var/moodledata
$ tar -cpzvf dar-lms-moodledata.tar.gz *

# Without directory structure
$ sudo tar -cpzvf dar-beesuite-lms-htdocs-01072021.tar.gz -C /var/www/html/beesuite .



# Extract tar file
$ tar -xpzvf dar-lms-moodledata.tar.gz 

# List files in tar file
$ tar tvf dar-lms-moodledata.tar.gz
```



### Backup and restore moodle database



```
Backup database
$ mysqldump -u [user] -p [database_name] > [filename].sql

Restore database
$ mysql -u [user] -p [database_name] < [filename].sql
```



### Upgrade

```
Linux
# mv moodle moodle.backup
# tar xvzf moodle-latest-3.9.tgz
Next, copy across your config.php, any custom plugins, and your .htaccess file if you created one (check that custom plugins are the correct version for your new Moodle first):

# cp moodle.backup/config.php moodle
# cp -pr moodle.backup/theme/mytheme moodle/theme/mytheme
# cp -pr moodle.backup/mod/mymod moodle/mod/mymod
Don't forget to make moodle/config.php (and the rest of the source code) readable by your www server. For maximum security the files should not be writeable by your server. This is especially important on a 'production' server open to the public internet.

# chown -R root:root moodle (Linux debian - or even create a user especially for moodle. Don't use the web server user, e.g. www-data)
# chmod -R 755 moodle
```



### Moodle instance template

```
#!/bin/bash

sudo mkdir -p /var/moodledata1

sudo mount 172.22.122.82:/dar_lms_data  /var/moodledata1

sudo cp -R /var/moodledata/* /var/moodledata1/

sudo chown -R www-data /var/moodledata1

sudo chmod -R 777 /var/moodledata1
```



## Resize Disk of a VM Instance in Google Cloud


### Step 1: Check Disk Size

Before resizing your disk size you can check your available disk space so you will get an idea about the available space in your disk. It is recommended to increase the size if your used space is more than 80%.

Execute the following command to check the disk space.

```
df -h
```

You will get an output similar to the one below.

```
Output
Filesystem      Size  Used Avail Use% Mounted on
udev            286M     0  286M   0% /dev
tmpfs            60M  2.4M   57M   4% /run
/dev/sda1       9.8G  1.1G  8.2G  12% /
tmpfs           297M     0  297M   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           297M     0  297M   0% /sys/fs/cgroup
```

Here `/dev/sda1` is the one which shows the available and used space of your disk. I tested this on a new fresh disk with 10GB space.



### Step 2: Check Partition

Now you need to check the partitions available on the your disk.

```
lsblk
```

This command shows the available partitions. You will get an output similar to this.

```
Output
NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
sda      8:0    0  10G  0 disk 
└─sda1   8:1    0  10G  0 part /
```

In this case we having only one partition.

As you can see, `sda` is the `DEVICE_ID` and `1` is the partition number.



### Step 3: Increase Disk Size

Go to your Google Cloud Console and navigate to **Compute >> VM Instances**.

Click the name of the instance where you want to add a disk.



Scroll down to **Boot disk** and click on the disk name.

Now you will be taken to the Disk Management page.

Click **Edit** on the top.

Here you can specify the size of you need.

Click **Save** in the bottom to apply the changes.

![Resize Disk](https://media.cloudbooklet.com/wp-content/uploads/2019/10/03104217/resize-disk.jpg)

### Step 4: Grow Partition

Now you need to resize the partition using the `growpart` command with your device id and partition number.

```
sudo growpart /dev/sda 1
```

You will get something similar.

```
Output
CHANGED: partition=1 start=4096 old: size=20967424 end=20971520 new: size=1048571871,end=1048575967
```

### Step 5: Resize File System

The last step is to resize the filesystem with the `resize2fs` command.

```
sudo resize2fs /dev/sda1
```

The output will be like this.

```
Output
resize2fs 1.43.4 (31-Jan-2017)
Filesystem at /dev/sda1 is mounted on /; on-line resizing required
old_desc_blocks = 2, new_desc_blocks = 63
The filesystem on /dev/sda1 is now 131071483 (4k) blocks long.
```

### Step 6: Verify the Setup

Now you can verify the disk space using the `df` command. Your disk space must have rezised to the additional space you added.

```
df -h
Output
Filesystem      Size  Used Avail Use% Mounted on
udev            286M     0  286M   0% /dev
tmpfs            60M  2.4M   57M   4% /run
/dev/sda1       493G  1.2G  471G   1% /
tmpfs           297M     0  297M   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           297M     0  297M   0% /sys/fs/cgroup
```



### Error connecting to database

```
php admin/cli/mysql_collation.php --collation=utf8mb4_unicode_ci
```



## Increase upload size 

```
# nano /etc/php5/apache2/php.ini
Press Ctrl and W and type "post_max_size"
Change the value to the number of Mb you want your site to accept as uploads
Press Ctrl and W and type "upload_max_filesize"
Change the value to the number of Mb you want your site to accept as uploads
Press Ctrl and W and type "max_execution_time"
Change the value to 600
Press Ctrl and O
Press Ctrl and X
Type sudo apachectl restart
```


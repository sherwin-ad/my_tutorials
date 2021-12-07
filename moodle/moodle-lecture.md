[TOC]



# Moodle

## Install moodle



### Setup web server with mysql

```
# Install Apache/MySQL server and client/PHP
$ sudo apt install apache2 mysql-client mysql-server php libapache2-mod-php


# Install Additional Software
$ sudo apt install graphviz aspell ghostscript clamav php7.4-pspell php7.4-curl php7.4-gd php7.4-intl php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-ldap php7.4-zip php7.4-soap php7.4-mbstring

# Restart apachebase
sudo service apache2 restart

# Install Git
$ sudo apt install git

# Download moodle
cd /opt
git clone git://git.moodle.org/moodle.git

# Change directory into the downloaded Moodle folder
cd moodle

# Retrieve a list of each branch available
git branch -a

# Tell git which branch to track or use
git branch --track MOODLE_311_STABLE origin/MOODLE_31_STABLE

# Finally, Check out the Moodle version specified
sudo git checkout MOODLE_39_STABLE


# Copy local repository to /var/www/html/
$ sudo cp -R /opt/moodle /var/www/html/
$ sudo mkdir /var/moodledata
$ sudo chown -R www-data /var/moodledata
$ sudo chmod -R 777 /var/moodledata
$ sudo chmod -R 0755 /var/www/html/moodle

```



## Hide Apache server info

```
vi /etc/apache2/apache2.conf 
```

add the following

```
ServerTokens Prod
ServerSignature Off 
```





## Setup web server with psql

```sh
$ sudo apt install apache2

$ sudo apt-get install postgresql 

$ sudo apt install php7.4 libapache2-mod-php7.4 openssl php-imagick php7.4-common php7.4-curl php7.4-gd php7.4-imap php7.4-intl php7.4-json php7.4-ldap php7.4-mbstring php7.4-pgsql php-ssh2 php7.4-xml php7.4-zip unzip php7.4-xmlrpc php7.4-soap
```



## Setup Postgresql

```
$ sudo apt install postgresql
```

### Connection To PostgreSQL

Now, establish a connection with the newly installed Postgres database server. First switch to the system’s postgres user account:

```
sudo su - postgres 
```

then type “psql” to get the postgress prompt:

```
psql 

psql (13.2 (Ubuntu 13.2-1.pgdg20.04+1))
Type "help" for help.

postgres=#
```



### Secure PostgreSQL

PostgreSQL installer creates a user “postgres” on your system. Default this user is not protected.

First, create a password for “postgres” user account by running the following command.

```
$ sudo passwd postgres 
```

Next, switch to the “postgres” account Then switch to the Postgres system account and create a secure and strong password for PostgreSQL administrative database user/role as follows.

```
$  su - postgres 
psql -c "ALTER USER postgres WITH PASSWORD 'secure_password_here';" 
exit 
```

Restart the service to apply security changes.

```
sudo systemctl restart postgresql 
```

### Creating Moodle Database

These instructions assume that the database server and web server are on the same machine. If that is not the case you have some more work to do. See the PostgreSQL documentation for further details.

- Log into the PostgreSQL command line client. The exact form depends on how your PostgreSQL is configured but will be something like

```sh
$ psql -U postgres
Password for user postgres:
```

Enter the password for your 'postgres' user set during installation. After some preamble you should see the prompt *postgres=#*.

- Create the user for the Moodle database and assign a password:

```sh
$ postgres=# CREATE USER moodleuser WITH PASSWORD 'yourpassword';
```

Provide a suitably strong password. Please note that the actual authentication method depends on your PostgreSQL server's pg_hba.conf file. Some authentication methods (like ident) do not require the password. See the 'Client Authentication' section below for further details.

- Create the database:

```sh
$ postgres=# CREATE DATABASE moodle WITH OWNER moodleuser;
```

- Drop database
```
$ postgres=# DROP DATABASE moodle;
```

  

### Backup postgres db

```sh
$ pg_dump rtudblms | gzip > rtu-db-11052021.gz
```

### Restore postgres db

```sh
$gunzip -c mydb.sql.gz | psql -h localhost -U postgres -W -d mydb 
```





##  Setup MySQL Server

```
# Connect to mysql server
$ mysql -h cdm-lms-db.cpuur4cknf6y.ap-southeast-1.rds.amazonaws.com -u admin -p

# Create DB
FLUSH PRIVILEGES;
mysql> CREATE DATABASE moodleDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


# Create user
mysql>create user 'moodleUser'@'localhost' IDENTIFIED BY 'Cn48tk9uGnhsaf5';

OR 

mysql>create user 'moodleUser'@'172.16.31.%' IDENTIFIED BY 'passwordformoodledude';

# Grant user privilege 
mysql>GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON 
moodle.* TO 'moodledude'@'localhost';

mysql> GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'localhost';

FLUSH PRIVILEGES;

mysql>quit;
```

To make sure the database was created correctly, use the \l at the psql console or execute psql -l shell command. You should get something like

```
 postgres=# \l
                                      List of databases
      Name    |  Owner     | Encoding |  Collation  |    Ctype    |   Access privileges   
   -----------+------------+----------+-------------+-------------+-----------------------
    moodle    | moodleuser | UTF8     | cs_CZ.utf8  | cs_CZ.utf8  | 
    postgres  | postgres   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
    template0 | postgres   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres
                                                                  : postgres=CTc/postgres
    template1 | postgres   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres
                                                                  : postgres=CTc/postgres
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



## Moodle Upgrade

1. Before you upgrade your site for real

- You are strongly advised to make a copy of your entire Moodle site onto another computer (see [Moodle migration](https://docs.moodle.org/20/en/Moodle_migration)) and run the upgrade there to verify it will work.

2. Check the version

- Administration > Server > Environment

3. Put your Site into Maintenance Mode

4. Backup important data

- There are three areas that should be backed up before any upgrade:
  - Moodle software (For example, everything in server/htdocs/moodle)
  - Moodle uploaded files (For example, server/moodledata)
  - Moodle database (For example, the SQL or Postgres database)





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

```
# Download moodle

$ git clone git://git.moodle.org/moodle.git

# Change directory into the downloaded Moodle folder
$ cd moodle

# Retrieve a list of each branch available
git branch -a

# Tell git which branch to track or use
git branch --track MOODLE_311_STABLE origin/MOODLE_311_STABLE

# Finally, Check out the Moodle version specified
git checkout MOODLE_311_STABLE

```

## Debug mode

```
$CFG->debug = 38911;

$CFG->debugdisplay = 1;
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



### CLI Upgrade

```
cd /var/www/html/moodle

# Retrieve a list of each branch available
sudo git branch -a

# Tell git which branch to track or use
sudo git branch --track MOODLE_310_STABLE origin/MOODLE_310_STABLE

# Finally, Check out the Moodle version specified
sudo git checkout MOODLE_39_STABLE

```

```
# sudo -u www-data php admin/cli/maintenance.php --enable
== Maintenance mode (https://104.199.170.168) ==
Your site is currently in CLI maintenance mode, no web access is allowed.
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

Moodle site -> Site adminsitration -> Security -> Site security settings -> Maximum upload file size

## Running Moodle on a dedicated server

Assuming you are running Moodle on a sealed server (i.e. no user logins allowed on the machine) and that root takes care of the modifications to both moodle code and moodle config (config.php), then this are the most tight permissions I can think of:

1. moodledata directory and all of its contents (and subdirectories, includes sessions):

```
owner: apache user (apache, httpd, www-data, whatever; see above)
group: apache group (apache, httpd, www-data, whatever; see above)
permissions: 700 on directories, 600 on files
```

**Change directories and files permission**

First, apply file system permissions to files and folder by running chmod in recursive mode:

```
chmod -R 600 /var/moodledata
```

Next, execute the command for directories only:

```
find /var/moodledata -type d -print0 | xargs -0 chmod 700
```



2. moodle directory and all of its contents and subdirectories (including config.php):

```
owner: root
group: root
permissions: 755 on directories, 644 on files.
```

If you allow local logins for regular users, then 2. should be:

```
owner: root
group: apache group (apache, httpd, www-data, whatever; see above)
permissions: 750 on directories, 640 on files.
```

## Get Public IP automatically

```
$CFG->wwwroot   = 'https://'.$_SERVER['HTTP_HOST'].'';
```

 

## Reset Admin password

1. Login to your moodle database and find the user table mdl_user (moodle ver. 3.3)

![moodle user table](images/moodle_user.JPG)

2. which admin password is stored using php function 'password_hash' so run the following code with your desired password (I have used 'test' as password).

```php
<?php
$pass=password_hash("test", PASSWORD_BCRYPT);
echo "password: " . $pass;
?>
```



output:

![user password](images/user_password.JPG)

3. copy the password and update the table with copied password.

![update password](images/update_password.JPG)

 that's all now login with the password you used in php encryption.



OR

```sql
UPDATE mdl_user SET password=MD5('NEW_PASSWORD') WHERE username='admin';
```





## Maintenace Mode

1. Go to Site administration > Server > Maintenance mode in the Settings navigation.

## Setup SSL

1. Create a certificate signing request to send to a certificate authority

```
openssl req -new -newkey rsa:2048 -nodes -keyout server.key -out server.csr
```



```
# openssl req -new -nodes -newkey rsa:<key size in bytes> -config <custom config file> -keyout <FQDN>.key -out <FQDN>.csr -<hashing algorithm>   
Example:
openssl req -new -nodes -newkey rsa:1024 -config /var/tmp/mySSL/myssl.cnf -keyout /var/tmp/mySSL/www.example.com.key -out /var/tmp/mySSL/www.example.com.csr -md5
```



 ```
 CountryName = PH
 StateOrProvinceName = Metro Manila
 localityName = Quezon City
 0.organizationName  = Rizal Technological University
 organizationalUnitName  = IT Department
 commonName   = rtu
 emailAddress = franz@mybusybee.net
 ```

2. Send the CSR to a certificate authority to obtain an SSL certificate

3. Install SSL certificate

   default-ssl.conf

```
SSLCertificateFile      /etc/ssl/certs/6a124f857c92bc2e.crt
SSLCertificateKeyFile   /etc/ssl/certs/server.key
SSLCertificateChainFile /etc/ssl/certs/gd_bundle-g2-g1.crt

```

## How to change your URL in Moodle

1. [Login to the Moodle Dashboard](https://www.inmotionhosting.com/support/edu/moodle/moodle-login-administrator/).

2. Add /admin/tool/replace/index.php to the end of the URL, and hit Enter on your keyboard. The address will look like this:

   https://example.com/admin/tool/replace/index.php

   (Be sure to replace example.com with your Moodle site. With older versions of Moodle add /admin/replace.php to the end of the URL.)

   You will then be on the *DB search and replace* page. It will look like this:
   [![Find and replace in Moodle](images/moodle_change-url_moodle-db-search-replace.png)](https://www.inmotionhosting.com/support/wp-content/uploads/2014/06/moodle_change-url_moodle-db-search-replace.png)

    

   You will also see a message stating “*This script is not supported, always make complete backup before proceeding! This operation can not be reverted! Several tables are not updated as part of the text replacement. This include configuration, log, events, and session tables.*“

3. In the Search whole database for field, enter your existing URL. in my test I entered:

   ```
   https://example.com
   ```

4. In the Replace with this string field, enter the new URL. In my test I entered:

   ```
   https://newdomain.example.com
   ```

5. Check the box for Shorten result if necessary . Confirm the change, by checking the box for I understand the risks of this operation , then click the Yes, do it! button.

   ![Changing URL in Moodle](images/moodle_change-url_search-replace-moodle-url.png)

    

6. It is finished when you see a message stating “ …finished ” at the bottom. Click the Continue button to return to the Moodle dashboard.

   ![URL changed in Moodle with replace.php script](images/moodle_change-url_url-change-finished.png)

    

7. Using FTP or File Manager, navigate to where Moodle is installed. Open the **config.php** file, and locate the line starting with:
   **$CFG->wwwroot**

8. Update the line to your new address, in my test I changed from this:

   ```
   $CFG->wwwroot = 'https://example.com';
   ```

   To this:

   Copy

   ```
   $CFG->wwwroot = 'https://newdomain.example.com';
   ```

   Here is a screenshot of the updated line:
   [![Updating URL in config.php file in Moodle](images/moodle_change-url_updated-wwwroot-moodle.png)](https://www.inmotionhosting.com/support/wp-content/uploads/2014/06/moodle_change-url_updated-wwwroot-moodle.png)

    

9. **Save** your changes and you are done. Now you can move your site (if necessary) to the new folder location.

## Count the number of courses

```sql
select count(*) from mdl_course;
```



## Apache Performance recommendations

/etc/apache2/mods-enabled/mpm_prefork.conf

- Set the **MaxRequestWorkers** directive correctly (**MaxClients** before Apache 2.4). Use this formula to help (which uses 80% of available memory to leave room for spare):

```
MaxRequestWorkers = Total available memory * 80% / Max memory usage of apache process
```

Memory usage of apache process is usually 10MB but Moodle can easily use up to 100MB per process, so a general rule of thumb is to divide your available memory in megabytes by 100 to get a conservative setting for MaxClients. You are quite likely to find yourself lowering the MaxRequestWorkers from its default of 150 on a Moodle server. To get a more accurate estimate read the value from the shell command:

```
# ps -ylC apache2 --sort:rss

# ps -ylC apache2 --sort:rss | wc -l
```

## Php Performance recommendations

- *memory_limit* needs to be at least 96M (although some functions may not work if this low). Moodle will refuse to install if lower. 128M is recommended. Large systems may need an even higher setting.
- *session.save_handler* needs to be set to FILES.
- *magic_quotes_runtime* needs to be OFF. (DEPRECATED in PHP 5.3.0, and REMOVED as of PHP 7.0.0.)
- *file_uploads* needs to be ON.
- *session.auto_start* needs to be OFF.
- The temp folder must be defined and writeable by your webserver user
- Check the error display/logging section. Make sure the settings are appropriate for your server use.
- *post_max_size* and *upload_max_filesize* restrict the maximum file size that can be uploaded.
- Check the *[mail function]* and database section (for your chosen database) to make sure they match your server configuration.

### Finding the correct php.ini

```
php -i | grep php.ini
```

## Cron

The CLI (command line interpreter) script. This will be at the path

```
/path/to/moodle/admin/cli/cron.php
```

If in doubt, this is the correct script to use. This needs to be run by a 'PHP CLI' program on your computer. So the final command may look something like

```
/usr/bin/php /path/to/moodle/admin/cli/cron.php
```

```
$ crontab -u www-data -e
```

*This will open an editor window. To run the cli cron script every 1 minute, add the line:*

```
* * * * * /usr/bin/php  /path/to/moodle/admin/cli/cron.php >/dev/null
```

## Generate SSH key pair using puttygen

```sh
# Install Puttygen
$ sudo apt install putty-tools

# Generate Key Pair for Authentication in Linux
$ puttygen -t rsa -b 2048 -C "user@host" -o keyfile.ppk

# Out public key
$ puttygen -L reine.ppk 

# Changing the Passphrase of a Key
$ puttygen keyfile.ppk -P

# Convert .ppk to .pem
$ puttygen privatekey.ppk -O private-openssh -o privatekey.pem

# Converting .pem to .ppk
$ puttygen pemKey.pem -o ppkKey.ppk -O private
```

## Generate SSH key pair using ssh-keygen

```
ssh-keygen -t rsa -b 4096 -C "your_email@domain.com"
```



## Finding large backup files 



```sql
SELECT contenthash, contextid, filearea, filepath, filename, filesize FROM mdl_files ORDER BY filesize DESC LIMIT 10;
               contenthash                | contextid |     filearea      | filepath |                                    filename                                    |  filesize  
------------------------------------------+-----------+-------------------+----------+--------------------------------------------------------------------------------+------------
 5ae141a5a1a03b9faf8b76fc7e8f0b4e74891de5 |      4060 | course            | /        | backup-moodle2-course-221-computer_1_basic_computer_concepts-20210912-2031.mbz | 3760227875
 3d1d939b7e9f033904a8afbc1eeaf22aa3a2ee8a |      8198 | course            | /        | backup-moodle2-course-494-comp3-20210908-1848.mbz                              | 3284946028
 736ade65c2d7145cee0c0948aa4afd58b1c83067 |    247604 | course            | /        | backup-moodle2-course-3016-ict-ss-20210922-1210.mbz                            |  725733580
 3bfbb91fe10686cbf542ea5dcaefbe2d947ec5cc |    167694 | course            | /        | backup-moodle2-course-1330-ict-vg8l-20210912-2335.mbz                          |  685473345
 57427e536996c80ef8a459835fcbcec5ec2c48bd |     83453 | course            | /        | backup-moodle2-course-1113-profed11-20210920-1658.mbz                          |  649615370
 152559eb1192f63ac7f88bbb0f1c0927b482c4f1 |     15956 | course            | /        | Dr. Diaz- PROGRAMMING LANGUAGES-Backup File.mbz                                |  386337845
 d620e75b82ee6b0a1dbb19f7f1a43924e28ae792 |      5589 | recyclebin_course | /        | backup.mbz                                                                     |  361862046
 5c7c50714656c4f3c087bc55508ca53c2d98f950 |      8621 | course            | /        | backup-moodle2-course-516-e-tech-20210201-0903.mbz                             |  345812878
 590f8d5b67339d4afd57fe8619c472ac47cce0d2 |    231986 | combined          | /        | combined.pdf                                                                   |  277471599
 ca6b6cdfcdaf5629b98456abb73e43b12bd4b8ec |    114968 | course            | /        | backup-moodle2-course-1216-entrep-shs-20210315-1821.mbz                        |  268911240
(10 rows)
```



```
SELECT contenthash, contextid, filearea, filepath, filename, filesize FROM mdl_files WHERE contenthash = '5ae141a5a1a03b9faf8b76fc7e8f0b4e74891de5';
```



```sh
$ find . -xdev -type f -size +100M -print | xargs ls -lh | sort -k5,5 -h -r | head
-rwxrwxrwx 1 www-data ubuntu 3.6G Nov  9 04:11 ./filedir/5a/e1/5ae141a5a1a03b9faf8b76fc7e8f0b4e74891de5
-rwxrwxrwx 1 www-data ubuntu 3.1G Nov  9 12:55 ./filedir/3d/1d/3d1d939b7e9f033904a8afbc1eeaf22aa3a2ee8a
-rwxrwxrwx 1 www-data ubuntu 696M Nov  9 09:31 ./filedir/6d/f1/6df1c4506a8857685002c1a3586ed36de850d753
-rwxrwxrwx 1 www-data ubuntu 696M Nov  8 14:51 ./trashdir/6d/f1/6df1c4506a8857685002c1a3586ed36de850d753
-rwxrwxrwx 1 www-data ubuntu 693M Nov  9 02:47 ./filedir/73/6a/736ade65c2d7145cee0c0948aa4afd58b1c83067
-rwxrwxrwx 1 www-data ubuntu 654M Nov  8 23:36 ./filedir/3b/fb/3bfbb91fe10686cbf542ea5dcaefbe2d947ec5cc
-rwxrwxrwx 1 www-data ubuntu 620M Nov  9 04:29 ./filedir/57/42/57427e536996c80ef8a459835fcbcec5ec2c48bd
-rwxrwxrwx 1 www-data ubuntu 369M Nov  9 12:38 ./filedir/15/25/152559eb1192f63ac7f88bbb0f1c0927b482c4f1
-rwxrwxrwx 1 www-data ubuntu 346M Nov  9 12:16 ./filedir/d6/20/d620e75b82ee6b0a1dbb19f7f1a43924e28ae792
-rwxrwxrwx 1 www-data ubuntu 330M Nov  9 01:42 ./filedir/5c/7c/5c7c50714656c4f3c087bc55508ca53c2d98f950
```



```
SELECT sum(filesize) as filesize FROM `mdl_files` f INNER JOIN mdl_context cn ON cn.id = f.contextid INNER JOIN mdl_course c ON c.id = cn.instanceid AND cn.contextlevel = 50 where c.id = "4060"
```


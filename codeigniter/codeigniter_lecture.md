# CodeIgniter

## Step 1: Install Apache

Install the `apache2`package by running:

```
sudo apt -y install apache2 libapache2-mod-php
```

Set proper permissions for `/srv/CodeIgniter`

```
sudo chown -R www-data:www-data /var/www/html/codeigniter4
```

Create an apache configuration file for CodeIgniter



```
sudo vim /etc/apache2/sites-enabled/codeigniter.conf
```

Add:

```
<VirtualHost *:80>
    ServerName code.example.com
    ServerAlias www.code.example.com
    ServerAdmin webmaster@example.com
    DocumentRoot /srv/CodeIgniter/public
    ErrorLog /var/log/apache2/codeigniter-error_log
    CustomLog /var/log/apache2/codeigniter-access_log combined
    <Directory /srv/CodeIgniter/public>
		Require all granted
        AllowOverride All
        Options +Indexes
    </Directory>
</VirtualHost>
```

Enable rewrite module:

```
sudo a2enmod rewrite
sudo systemctl restart apache2.service
```

Restart apache2 service

## Step 2: Install Mysql

```
sudo apt install mysql-server -y
```

**Configure Mysql**

```
mysql> alter user 'root'@'localhost' identified by 'U2345636/_F.}C';
Query OK, 0 rows affected (0.01 sec)

mysql> create database doh_intra_db;
Query OK, 1 row affected (0.02 sec)

mysql> create user 'intra_user'@'localhost' identified by 'q@123451&q7T8G8';
Query OK, 0 rows affected (0.02 sec)

mysql> grant all privileges on doh_intra_db.* to 'intra_user'@'localhost';
Query OK, 0 rows affected (0.01 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

mysql> \q
```



## Step 3: Install PHP

```
sudo apt install php php-cli php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-intl
```

**Confirm PHP version:**

```
$ php -v
PHP 7.4.3-4ubuntu2.17 (cli) (built: Jan 10 2023 15:37:44) ( NTS )
Copyright (c) The PHP Group
Zend Engine v3.4.0, Copyright (c) Zend Technologies
    with Zend OPcache v7.4.3-4ubuntu2.17, Copyright (c), by Zend Technologies
```
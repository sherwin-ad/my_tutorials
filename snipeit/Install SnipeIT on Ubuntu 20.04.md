# Install SnipeIT on Ubuntu 20.04

Snipe it is a versatile asset management sytem – this guide will get you started.

Install a Ubuntu 20.04 LTS server and set a fixed IP – then get you basic packages ready:

```
apt-get install openssh-server net-tools -y
apt-get update
apt-get upgrade
reboot
```

Then install all the packages needed by SnipeIt

```
apt-get install php php-json php-mbstring php-tokenizer php-curl php-mysql php-ldap php-zip php-bcmath php-gd php-xml -y
apt-get install mariadb-server -y
apt-get install git curl -y
```

Ensure mysql and apache start up at boot (and start them)

```
systemctl enable mariadb
systemctl enable apache2
systemctl start mariadb
systemctl start apache2
```

Create database and user (here are the values I used
dbhost: localhost
dbname: snipeit
dbuser: snipeituser
dbpasswd: snipeitpasswd

```
mysql -u root -p
CREATE DATABASE snipeit CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL ON snipeit.* TO 'snipeituser'@'localhost' IDENTIFIED BY 'snipeitpasswd';
exit
```

Get the software

```
mkdir /var/www/html/snipe-it
cd /var/www/html/snipe-it

git clone https://github.com/snipe/snipe-it .
```

Now use the sample env file to create one matching your environment

```
cp .env.example .env

vi .env (these are the lines I set)
APP_TIMEZONE='Europe/Copenhagen'
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_DATABASE=snipeit
DB_USERNAME=snipeituser
DB_PASSWORD=snipeitpasswd
DB_PREFIX=ver1_
DB_DUMP_PATH='/usr/bin'
DB_CHARSET=utf8mb4
DB_COLLATION=utf8mb4_unicode_ci
IMAGE_LIB=gd
```

setup composer to download dependencies:

```
cd /var/www/html/snipe-it
curl -sS https://getcomposer.org/installer | php
php composer.phar install --no-dev --prefer-source
```

Generate app key (keep it safe at you might need it later.

```
php artisan key:generate
```

Now fix all the permissions

```
chown -R www-data:www-data /var/www/html/snipe-it
chmod -R g-w /var/www/html/snipe-it
chmod -R g+w /var/www/html/snipe-it/storage
chmod -R g+w /var/www/html/snipe-it/public/uploads
```

Create a new apache default config file

```
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/snipe-it.conf
```

Make the content of your new file like this
(vi /etc/apache2/sites-available/snipe-it.conf)

```
<VirtualHost *:80>

        #Use the email address of whoever is responsible for this server
        ServerAdmin you@youremail.domain

        #this should be the public directory under your snipe-it installation
        DocumentRoot /var/www/html/snipe-it/public

        #this should match the APP_URL in the .env configuration file
        ServerName 192.168.1.161

        <Directory /var/www/html/snipe-it/public>
                Allow From All
                AllowOverride All
                Options -Indexes
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
```

Then disable the old default, enable the new one, add mod_rewrite and restart apache

```
a2dissite 000-default.conf
a2ensite snipe-it.conf
a2enmod rewrite
systemctl restart apache2
```
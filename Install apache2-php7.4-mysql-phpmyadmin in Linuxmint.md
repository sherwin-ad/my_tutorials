## Install apache2/php/mysql/phpmyadmin in Linuxmint



```
sudo apt-get install apache2
```

The installer will start the service automatically, and you can test to make sure it’s working by opening up a browser and typing **http://localhost** or **http://127.0.0.1** on the local machine.

Next, we’ll install PHP. The latest version at the time of this writing is 7.2. We’ll also install some libraries, which will allow everything to play nice when we’re finished.

```
sudo apt-get install php7.4
sudo apt-get install libapache2-mod-php7.4
```

We’ll then need to restart the Apache service to ensure PHP functions properly.

```
sudo /etc/init.d/apache2 restart
```

Linux Mint comes with the **xed** GUI text editor, which we can use to create a test PHP file.

```
sudo xed /var/www/html/test.php
```

You’ll want to populate the file with the following code:

```
<?php phpinfo(); ?>
```

Point a browser at http://localhost/test.php to test the code and make sure PHP is working properly. If it is, you should see a bunch of information about the version of PHP that we just installed.

Next, we’ll install MySQL.

```
sudo apt-get install mysql-server
```

After the install is complete you’ll want to do a couple things. The first is to set a password for root in MySQL.

```
sudo mysql -u root
```

This will dump you in to the MySQL command line, where you can set a password for root.

```
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('breach');
```

Next you’ll want to create a user that can be used to log in to PHPMyAdmin. For whatever reason, after I installed PHPMyAdmin, it would not let me log in as root. It did create an initial user called **phpmyadmin**, but that account only had read access to everything. To be safe we’ll create a new account called **admin** from within the MySQL command line.

```
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'secretpassword';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit
```

You’ll obviously want to replace *secretpassword* with something secure.

Now we’re ready to install the libraries to tie everything together, as well as PHPMyAdmin itself.

```
apt-get install libapache2-mod-log-sql-mysql
apt-get install php7.0-mysql
apt-get install phpmyadmin
```

When the installer asks if you want it to create a blank database, tell it Yes. When prompted for a password, set it to the same thing as you set the SQL admin account password you created above.

Next we’ll need to make a small change to a PHP configuration file.

```
sudo xed /etc/php/7.2/apache2/php.ini
```

Uncomment (remove the # from the beginning) the line **extension=mysqli**, save and close the configuration file. Next we’ll need to restart Apache again to ensure everything works.

```
sudo /etc/init.d/apache2 restart
```
##### 

[TOC]



# Wordpress

# Migrate to another URL

````
MariaDB [wpress_db]> select option_name, option_value from wp_options where option_name="siteurl";
+-------------+------------------------+
| option_name | option_value           |
+-------------+------------------------+
| siteurl     | https://35.201.144.168 |
+-------------+------------------------+
1 row in set (0.000 sec)

MariaDB [wpress_db]> update wp_options set option_value="https://34.80.90.53" where option_name="siteurl";
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [wpress_db]> select option_name, option_value from wp_options where option_name="siteurl";
+-------------+---------------------+
| option_name | option_value        |
+-------------+---------------------+
| siteurl     | https://34.80.90.53 |
+-------------+---------------------+
1 row in set (0.000 sec)

MariaDB [wpress_db]> select option_name, option_value from wp_options where option_name="home";
+-------------+------------------------+
| option_name | option_value           |
+-------------+------------------------+
| home        | https://35.201.144.168 |
+-------------+------------------------+
1 row in set (0.001 sec)

MariaDB [wpress_db]> update wp_options set option_value="https://34.80.90.53" where option_name="home";
Query OK, 1 row affected (0.004 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [wpress_db]> select option_name, option_value from wp_options where option_name="home";
+-------------+---------------------+
| option_name | option_value        |
+-------------+---------------------+
| home        | https://34.80.90.53 |
+-------------+---------------------+
1 row in set (0.001 sec)

MariaDB [wpress_db]> flush privileges;
Query OK, 0 rows affected (0.017 sec)

````

```
UPDATE wp_options SET option_value = replace(option_value, 'oldurl', 'newurl') WHERE option_name = 'home' OR option_name = 'siteurl';

UPDATE wp_posts SET guid = replace(guid, 'oldurl','newurl');

UPDATE wp_posts SET post_content = replace(post_content, 'oldurl', 'newurl');

UPDATE wp_postmeta SET meta_value = replace(meta_value,'oldurl','newurl');
```



```
UPDATE wp_posts SET guid = REPLACE(guid, 'https://stg1.beesites.net/bmb/', 'http://35.194.169.22/') WHERE guid LIKE 'https://stg1.beesites.net/bmb/%';

```





````
UPDATE wp_options SET option_value = replace(option_value, 'https://34.80.101.244/', 'https://34.81.126.117/') WHERE option_name = 'home' OR option_name = 'siteurl';

UPDATE wp_posts SET guid = replace(guid, 'https://34.80.101.244/','https://34.81.126.117/');

UPDATE wp_posts SET post_content = replace(post_content, 'https://34.80.101.244/', 'https://34.81.126.117/');

UPDATE wp_postmeta SET meta_value = replace(meta_value,'https://34.80.101.244/','https://34.81.126.117/');
````



# Creating a MySQL Database and User 

```
# Change root password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'SetRootPasswordHere';

# Create Database
CREATE DATABASE wordpress;

# Create User
CREATE USER wordpress@localhost IDENTIFIED BY '<your-password>';

# Grant Privilege
GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost;

FLUSH PRIVILEGES;

EXIT;
```



# Configuring the WordPress Directory

Update the ownership with the `chown` command which allows you to modify file ownership. Be sure to point to your server’s relevant directory:

```bash
sudo chown -R www-data:www-data /var/www/wordpress
```

Next, run two `find` commands to set the correct permissions on the WordPress directories and files. This first `find` command sets every directory within the `/var/www/<>^wordpress<^>` directory and sets each one’s permissions to `750`:

```bash
sudo find /var/www/wordpress/ -type d -exec chmod 750 {} \;
```

This one finds each file within the directory and sets their permissions to `640`:

```bash
sudo find /var/www/wordpress/ -type f -exec chmod 640 {} \;
```



### Apache configuration

```vhdl
sudo a2enmod rewrite

sudo systemctl restart apache2

sudo nano /etc/apache2/sites-available/000-default.conf

    DocumentRoot "/var/www/html"
    <Directory "/var/www/html">
            Options FollowSymLinks
            AllowOverride All
            Require all granted
    </Directory>
```


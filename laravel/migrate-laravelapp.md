**Introduction**
The purpose of this plan is to have a step-by-step instruction on how to setup and configure web server (Apache), a PHP runtime, a database (MySQL), and Composer for managing Laravel's dependencies.
This guide will walk you through the essential steps to get your Laravel application up and running on an Ubuntu 24.04 (Server), covering everything from preparing the server environment to configuring your web server and deploying your application code.the database connection, email credentials, sharepoint credentials, and notification service on the appsettings.json file.

**Assumption and Constraints**
These requirements are assumed to be in place before implementing the enhancements and fixes to the issues.
- An Ubuntu 24.04 server
- SSH accessAccess on the ubuntu server
- A non-root user with sudo privilege

**Implementation**

**Update Ubuntu**

1. Before installing the package, run the following command to update your Ubuntu repository.

    ```
    $ sudo apt update
    ```



**Create a MySQL Database**

1. Install MySQL server
    ```
    sudo apt install mysql-server -y
    ```   	

2. Verify that the MySQL database server is active and running.

    ```
    $ sudo systemctl status mysql
    ```

3.	Log in to the MySQL database server.

    ```
    $ sudo mysql -u root
    ```

4. Create a new database for your Laravel project.
    ```
    CREATE DATABASE [database_name];
    ```

5. Create a new user with a strong password to use with the Laravel application. Replace password with a strong password of your choice.

    ```
    CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
    ```

6. Grant the new laravelapp user full privileges to the Laravel database.

    ```
    GRANT ALL PRIVILEGES ON [database_name].* TO 'user'@'localhost';
    ```

7. Flush the MySQL privileges table to apply the database changes.
    ```
    FLUSH PRIVILEGES;
    ```
8. Exit the MySQL database console.
    ```
    EXIT;
    ```

9. Import database backup
    ```
    $ sudo mysql -u root -p your_db_name < [database_backup].sql
    ```
     

**Install Composer and Required PHP Extensions**

1. Install Composer and all required extensions.
   ```
   $ sudo apt install apache2 composer php php-curl php-bcmath php-json php-mysql php-mbstring php-xml php-tokenizer php-zip git -y
   ```

2. View the installed PHP version.
   ```
   $ php -v
   ```

3. View the installed Composer version.

   ```
   $ sudo -u www-data composer -v
   ```

4. View the Apache service status and verify that it's active.
   ```
   $ sudo systemctl status apache2
   ```

5. Create a new info.php file in the default /var/www/html web root directory to display all PHP configuration details.

   ```
   $ sudo nano /var/www/html/info.php
   ```
   Add the following phpinfo function to the file.

   ```
   hp phpinfo(); ?>
   ```
   Save and close the file.

6. Restart Apache web server
   ```
   $ sudo systemctl restart apache2
   ```

7. Access your server's IP address using the /info.php path in a web browser such as Chrome.
   ``` 
   http://SERVER-IP/info.php
   ```
   View all installed extensions on your server and verify that thefileinfo, mbstring, and openssl are available on the PHP information page.

**Install PCC KHUB web files**
1. Unzip PCC KHUB web files and Set Permissions
   ```
   cd /var/www/
   sudo unzip laravel-app.zip -d myapp
   sudo chown -R www-data:www-data /var/www/myapp
   sudo chmod -R 775 /var/www/myapp/storage /var/www/myapp/bootstrap/cache
   ```

2. Configure .env
   ```
   APP_URL=http://yourdomain.com

   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=your_db_name
   DB_USERNAME=your_db_user
   DB_PASSWORD=your_db_password
   ```

**Create a New Apache Virtual Host Configuration**

1. Enable the Apache rewrite module mod_rewrite to enable Laravel to process clean URLs.

    ```
    $ sudo a2enmod rewrite
    ```
2. Create a new virtual host configuration file.
    ```
    $ sudo nano /etc/apache2/sites-available/laravelapp.conf
    ```
    Add the following contents to the file. Replace laravelapp.example.com with your actual domain.

    ```
    <VirtualHost *:80>

    ServerAdmin admin@example.com
    ServerName laravelapp.example.com
    DocumentRoot /var/www/laravelapp/public

    <Directory />
    Options FollowSymLinks
    AllowOverride None
    </Directory>
    <Directory /var/www/laravelapp>
    AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    </VirtualHost>
    ```
    Save and close the file.

    The above apache virtual host configuration listens for connection requests on the HTTP port 80 and serves the Laravel web application files from the /var/www/laravelapp directory.

3. Enable the Laravel virtual host configuration.
    ```
    $ sudo a2ensite laravelapp.conf
    ```
4. Disable the default Apache virtual host configuration to avoid port conflicts.
    ```
    $ sudo a2dissite 000-default.conf
    ```
5. Test the Apache configuration for errors.
    ```
    $ sudo apachectl configtest
    ```

    Output:

    ```
    Enabling site laravelapp.
    To activate the new configuration, you need to run:
    systemctl reload apache2
    Syntax OK
    ```

    If you see Syntax OK, the configuration is valid.

6. Restart the Apache service to apply the configuration changes.

    ```
    $ sudo systemctl restart apache2
    ```








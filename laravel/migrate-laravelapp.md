# Step 1: Prepare the Ubuntu 24.04 Server Environment

1. Update System Packages:
    Always start by ensuring your system's package list is up-to-date and all existing packages are upgraded.
```    
sudo apt update
sudo apt upgrade -y
```

2. Install Apache2:
Apache will be your web server.

```
sudo apt install apache2 -y
```

To verify Apache is running, open your web browser and navigate to http://your_server_ip_address. You should see the Apache2 Ubuntu Default Page.

3. Install PHP 8.3 and Required Extensions:
Ubuntu 24.04 includes PHP 8.3 by default, which is compatible with recent Laravel versions (Laravel 9, 10, 11).

```
sudo apt install php8.3 libapache2-mod-php8.3 php8.3-cli php8.3-mysql php8.3-mbstring php8.3-xml php8.3-bcmath php8.3-curl php8.3-zip php8.3-gd php8.3-dom php8.3-intl php8.3-sqlite3 -y
```
- libapache2-mod-php8.3: The Apache module that enables Apache to process PHP files.

- php8.3-cli: PHP Command-Line Interface, essential for running php artisan commands.

- php8.3-mysql: Required for MySQL database connectivity. (Adjust if you use PostgreSQL: php8.3-pgsql).

- Other extensions (mbstring, xml, bcmath, curl, zip, gd, dom, intl, sqlite3): These are commonly required or recommended for most Laravel applications.

4. Enable Apache's Rewrite Module:
Laravel uses URL rewriting (e.g., example.com/posts instead of example.com/index.php/posts), which requires Apache's mod_rewrite.

```
sudo a2enmod rewrite
```

5. Restart Apache:
Apply the Apache module changes.

```
sudo systemctl restart apache2
```

6. Install Composer:
Composer is PHP's dependency manager, vital for installing Laravel's dependencies.

```
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer --version # Verify Composer is installed and working
```

7. Install Database Server (e.g., MySQL):
If your Laravel application uses MySQL, install it.

```
sudo apt install mysql-server -y
```

Secure MySQL Installation:
Run the security script to set a root password, remove anonymous users, and strengthen security.

```
sudo mysql_secure_installation
```
Follow the prompts:

- It's recommended to enable VALIDATE PASSWORD COMPONENT.

- Set a strong password for the MySQL root user.

- Answer Y for the remaining questions (remove anonymous users, disallow remote root login, remove test database, reload privilege tables).

Create Database and User for your Laravel Application:
Log in to MySQL as root:

```
sudo mysql -u root -p
```

At the MySQL prompt (mysql>), create your database and a dedicated user with permissions for it.

```
CREATE DATABASE your_app_database CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'your_db_user'@'localhost' IDENTIFIED BY 'your_db_password';
GRANT ALL PRIVILEGES ON your_app_database.* TO 'your_db_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

- Replace your_app_database, your_db_user, and your_db_password with the actual values your application will use. Ensure your_db_password is strong.

# Step 2: Deploy Your Laravel Application Code

1. Choose a Deployment Location:
    The standard location for web applications served by Apache is within /var/www/. Create a dedicated directory for your Laravel application.

```
sudo mkdir -p /var/www/your_laravel_app_name
# Give your current user temporary ownership to place files
sudo chown -R $USER:$USER /var/www/your_laravel_app_name
cd /var/www/your_laravel_app_name
```

(Replace your_laravel_app_name with your actual application's desired directory name).

2. Transfer Your Application Code:

- Recommended: Using Git: If your code is in a Git repository (GitHub, GitLab, Bitbucket, etc.), clone it directly.

```
git clone your_repository_url . # The dot clones into the current directory
# Example: git clone https://github.com/youruser/your_laravel_app.git .
```
- Alternative: Using a ZIP/Tar Archive:
    - Compress your Laravel project on your local machine (e.g., zip -r your_laravel_app.zip .).

    - Use scp to copy the archive to your server:
    
```
scp /path/to/your_laravel_app.zip your_user@your_server_ip:/var/www/your_laravel_app_name/
```
- On the server, navigate to the directory and unzip:

```
cd /var/www/your_laravel_app_name
sudo apt install unzip -y # If not already installed
unzip your_laravel_app.zip
# If unzip creates an extra subdirectory (e.g., your_laravel_app/your_laravel_app/...)
# you might need to move contents up:
# mv your_laravel_app/* . && mv your_laravel_app/.* . # Move all files/folders including dotfiles
# rm -rf your_laravel_app # Remove the now-empty subdirectory
```

3. Install PHP Dependencies (Composer):
After your code is in place, install all PHP libraries required by your application.

```
cd /var/www/your_laravel_app_name
composer install --no-dev --prefer-dist
# --no-dev excludes development-only dependencies (good for production)
# --prefer-dist uses packaged versions (faster)
```

# Step 3: Configure Laravel for the New Server Environment

1. Update .env File:
    Laravel uses the .env file for environment-specific configurations.

```
# If .env doesn't exist, copy from example:
# cp .env.example .env
nano .env
```
Adjust the following variables to match your new server's settings:

- APP_URL: Set this to your domain name or server IP (e.g., http://yourdomain.com).

- APP_DEBUG: Set to false for production environments. Keep it true for debugging during migration, but change it to false when live.

- DB_CONNECTION: mysql (or pgsql if using PostgreSQL)

- DB_HOST: 127.0.0.1 (or your database server's IP if it's external)

- DB_PORT: 3306 (for MySQL)

- DB_DATABASE: your_app_database (from Step 1)

- DB_USERNAME: your_db_user (from Step 1)

- DB_PASSWORD: your_db_password (from Step 1)

- Review and update any other environment variables (MAIL_MAILER, AWS_ACCESS_KEY_ID, etc.) relevant to your application and the new server.

2. Generate Application Key:
If APP_KEY is not set in .env (it usually is after composer create-project), or if you cloned a repository that might not have it, generate it. This key is crucial for session encryption and other security features.
```
php artisan key:generate
```
3. Import Database Data:
Import your backed-up database data into the newly created database.
```
mysql -u your_db_user -p your_app_database < /path/to/your/backup.sql
```
- Replace your_db_user and your_app_database with your actual values.

- Replace /path/to/your/backup.sql with the actual path to your database dump file. You might need to scp this file to your server first.

4. Run Database Migrations (and optionally seeders):
This step ensures your database schema is up-to-date for your Laravel application. Even after importing old data, php artisan migrate is often needed if your application uses migrations for schema management and you've had recent schema changes.
```
php artisan migrate
# If you have seeders to populate initial data (e.g., for testing or initial setup):
# php artisan db:seed
```
5. Create Storage Symlink (if needed):
If your application uses Laravel's public disk for file storage (e.g., storage/app/public symlinked to public/storage), create the symlink:
```
php artisan storage:link
```
6. Clear Caches:
Clear any old cached configurations, routes, and views that might have been carried over or generated by previous environments.
```
php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear
php artisan optimize:clear # Important for a clean start on a new server
```

# Step 4: Configure Apache Virtual Host

1. Create Virtual Host Configuration File:
```
sudo nano /etc/apache2/sites-available/your_laravel_app_name.conf
```
(Replace your_laravel_app_name with your chosen directory name from Step 2).

2. Add Configuration:
Paste the following content, carefully adjusting ServerName, ServerAlias, and DocumentRoot to match your setup.
Apache
```
<VirtualHost *:80>
    ServerName yourdomain.com       # Replace with your actual domain name or server IP
    ServerAlias www.yourdomain.com  # Optional: include if you use 'www.'
    DocumentRoot /var/www/your_laravel_app_name/public # <--- CRITICAL: Point to the 'public' directory

    <Directory /var/www/your_laravel_app_name/public>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All   # <--- ESSENTIAL for Laravel's .htaccess and routing
        Require all granted # <--- For Apache 2.4 and newer
    </Directory>

    # Optional: Custom log files for your app
    ErrorLog ${APACHE_LOG_DIR}/your_laravel_app_error.log
    CustomLog ${APACHE_LOG_DIR}/your_laravel_app_access.log combined
</VirtualHost>
```
3. Enable Your Virtual Host and Disable Default:
```
sudo a2ensite your_laravel_app_name.conf
sudo a2dissite 000-default.conf # Disable the default Apache welcome page
```
4. Test Apache Configuration and Restart:
Always test for syntax errors before restarting.
```
sudo apache2ctl configtest # Check for syntax errors
sudo systemctl restart apache2
```
# Step 5: Set File System Permissions (Crucial for "Forbidden" errors)

This is a very common source of "Forbidden" (403) or "500 Internal Server Error" messages. Apache needs proper permissions to read your application files and write to specific directories.

1. Navigate to your Laravel Project Root:
```
cd /var/www/your_laravel_app_name
```
2. Set Correct Ownership:
Make the web server user (www-data on Ubuntu) the owner of all your Laravel application files and directories. This is the most secure and recommended approach for web content.
```
sudo chown -R www-data:www-data . # The dot '.' means current directory, -R is recursive
```
3. Set General File and Directory Permissions:

- Directories: 755 (read, write, execute for owner; read, execute for group and others)

- Files: 644 (read, write for owner; read for group and others)

```
sudo find . -type d -exec chmod 755 {} \;
sudo find . -type f -exec chmod 644 {} \;
```

4. Grant Write Permissions to Specific Directories (storage, bootstrap/cache):
These directories must be writable by the web server user for Laravel to function (e.g., for logs, sessions, compiled views, cache).

```
sudo chmod -R 775 storage bootstrap/cache
```
Important Note on CLI User Access (Optional but common):
If you, as your SSH user (e.g., your_ssh_username), also need to run php artisan commands that write to storage or other parts of the app (like artisan migrate, artisan make:controller), and you've set ownership to www-data, you might add your user to the www-data group:
```
sudo usermod -aG www-data your_ssh_username
```
(You must log out of your SSH session and log back in for this group change to take effect for your_ssh_username.) After this, the 775 permissions on storage and bootstrap/cache will allow both the owner (www-data) and the group (which now includes your_ssh_username) to write.

# Step 6: Configure Firewall (UFW)

If you have UFW (Uncomplicated Firewall) enabled (which is recommended for security), you need to allow HTTP (port 80) and HTTPS (port 443) traffic.

```
sudo ufw allow 'Apache Full' # Allows both HTTP (80) and HTTPS (443)
sudo ufw enable              # Enable UFW if it's not already enabled
sudo ufw status verbose      # Verify the rules are active
```

# Step 7: Final Test

Open your web browser and navigate to http://yourdomain.com (or http://your_server_ip_address). You should now see your Laravel application.

Troubleshooting Recap:

- If you see a blank page or "Whoops! Something went wrong.": Check Laravel's logs in /var/www/your_laravel_app_name/storage/logs/laravel.log.

- If you see "Forbidden" (403): Revisit Step 5 (Permissions) and Step 4 (Apache Virtual Host config, especially AllowOverride All and DocumentRoot pointing to public). Also check Apache error logs (/var/log/apache2/error.log).

- If you see "Database connection error": Double-check your .env file's database credentials (Step 3) and ensure your MySQL server is running.

- If the domain doesn't resolve: Check your DNS settings.

- If you can't access the site at all (timeout): Check your firewall (Step 6) and ensure Apache is running (sudo systemctl status apache2).

This comprehensive guide should help you successfully migrate your Laravel application to Ubuntu 24.04 with Apache.





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








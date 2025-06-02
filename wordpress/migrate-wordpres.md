**Copying of source code files in the production server**

1. Navigate to the parent directory of your Apache Document Root. Let's assume your Document Root is `/var/www/html`. 

   ```
   cd /var/www/html
   ```

2. Create the new folder: Use `mkdir` followed by the name of your new folder.

   Bash

   ```
   sudo mkdir mynewfolder
   ```

3. Copy the source code files in the newly created folder

4. Set correct permissions of the folder

   Change ownership: Give ownership of the new folder to the Apache user and group.

   ```
   sudo chown -R www-data:www-data /var/www/html/mynewfolder
   ```

   Set permissions: Grant read and execute permissions for directories, and read for files.

   ```
   sudo chmod -R 755 /var/www/html/mynewfolder
   ```

5. Edit `wp-config.php`:

   - Open the `wp-config.php` file on your new server.

   - Update the database connection details to match your newdatabase:

     ```
     define('DB_NAME', 'new_database_name');
     define('DB_USER', 'new_database_user');
     define('DB_PASSWORD', 'new_database_password');
     define('DB_HOST', 'localhost'); // Usually 'localhost', check your host's info
     ```

   

**Importing of  MySQL Database in the production server**

1. Log in to the MySQL database server.

    ```
    $ sudo mysql -u root
    ```

2. Create a new database for your Laravel project.
    ```
    CREATE DATABASE [database_name];
    ```

3. Create a new user with a strong password to use with the Laravel application. Replace password with a strong password of your choice.

    ```
    CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
    ```

4. Grant the new laravelapp user full privileges to the Laravel database.

    ```
    GRANT ALL PRIVILEGES ON [database_name].* TO 'user'@'localhost';
    ```

5. Flush the MySQL privileges table to apply the database changes.
    ```
    FLUSH PRIVILEGES;
    ```

6. Exit the MySQL database console.
    ```
    EXIT;
    ```

7. Import database backup
    ```
    $ sudo mysql -u root -p your_db_name < [database_backup].sql
    ```

8. Update Site URLs in Database:

    Run this SQL query

    ```
    UPDATE wp_options SET option_value = replace(option_value, 'http://www.oldurl', 'http://www.newurl') WHERE option_name = 'home' OR option_name = 'siteurl';
    
    UPDATE wp_posts SET guid = replace(guid, 'http://www.oldurl','http://www.newurl');
    
    UPDATE wp_posts SET post_content = replace(post_content, 'http://www.oldurl', 'http://www.newurl');
    
    UPDATE wp_postmeta SET meta_value = replace(meta_value,'http://www.oldurl','http://www.newurl');
    ```

    

    








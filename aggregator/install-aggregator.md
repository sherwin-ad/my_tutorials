# Install Aggregator



```
sudo apt update && sudo apt upgrade -y

sudo apt install apache2 php libapache2-mod-php php-mysql php-xml php-mbstring php-mcrypt php-curl php-zip -y

sudo apt install apache2 mysql-server php php-curl php-bcmath php-json php-mysql php-mbstring php-xml php-tokenizer php-zip composer git -y
```



**Setup Mysql**

```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'cuZ18RreoFItcyxo9MAg';

create database nexel_agg_db;

create database db_project_agg;

CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';

CREATE USER 'db-user-1401253'@'localhost' IDENTIFIED BY 'w3w4AecBuEh1svTcGJKP';

GRANT ALL PRIVILEGES ON pcckhub_db.* TO 'khubuser'@'localhost';
```



**Clone aggregator repo**

```
git clone https://github.com/mybusybee-inc/aggregator-portal-management.git

sudo mv aggregator-portal-management /var/www/html/aggregator
```



**Set proper permissions:**

```
sudo chown -R www-data:www-data /var/www/aggregator
sudo chmod -R 775 /var/www/aggregator/storage /var/www/aggregator/bootstrap/cache
```



**Create Apache virtual host configuration file:**
sudo vim /etc/apache2/sites-available/aggre.conf

```
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/aggregator/public

    <Directory /var/www/aggregator>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
```



```
sudo systemctl enable apache2
sudo a2enmod rewrite
sudo a2dissite 000-default.conf
sudo a2ensite aggre.conf
sudo systemctl reload apache2
```



**Duplicate .env.example and rename to .env (make necessary changes to db name etc.)**

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel_app
DB_USERNAME=laravel_user
DB_PASSWORD=changeme
```

**Install composer**

```
curl -sS https://getcomposer.org/installer | php

sudo mv composer.phar /usr/local/bin/composer

sudo chmod +x /usr/local/bin/composer
```



**run composer install**

```
composer install 
```



**run php artisan key:gen**

```
php artisan key:generate
```



**php artisan migrate**

```
php artisan migrate

php artisan db:seed UserSeeder
```



# Apache: Generate CSR (Certificate Signing Request)

Follow these instructions to generate a certificate signing request (CSR) for your Apache Web server. When you have completed generating your CSR, cut/copy and paste it into the CSR field on the SSL certificate-request page.

**To Generate a Certificate Signing Request for Apache 2.x**

1. Log in to your server's terminal (SSH).

2. At the prompt, type the following command:

   ```
   openssl req -new -newkey rsa:2048 -nodes -keyout *yourdomain*.key -out *yourdomain*.csr
   ```

    **Note:** Replace *yourdomain* with the domain name you're securing. For example, if your domain name is *coolexample.com*, you would type *coolexample*.key and *coolexample*.csr.

3. Enter the requested information:

   - **Common Name:** The fully-qualified domain name, or URL, you're securing.
     If you are requesting a Wildcard certificate, add an asterisk (*) to the left of the common name where you want the wildcard, for example **.coolexample.com*.

   - **Organization:** The legally-registered name for your business. If you are enrolling as an individual, enter the certificate requestor's name.

   - **Organizational Unit:** If applicable, enter the DBA (doing business as) name. It is not necessary to specify an organizational unit when generating a CSR.

   - **City or Locality:** Name of the city where your organization is registered/located. Do not abbreviate.

   - **State or Province:** Name of the state or province where your organization is located. Do not abbreviate.

   - Country:

      

     The two-letter International Organization for Standardization (ISO) format

      

     country code

      

     for where your organization is legally registered.

      **Note:** If you do not want to enter a password for this SSL, you can leave the Passphrase field blank. However, please understand there might be additional risks.

4. Open the CSR in a text editor and copy all of the text.

5. Paste the full CSR into the SSL enrollment form in your account.



# Manually install an SSL certificate on my Apache server (Ubuntu)

Not the right server type? Go back to the [list of installation instructions.](https://www.godaddy.com/en-ph/help/manually-install-an-ssl-certificate-on-my-server-16623)

After your [certificate request](https://www.godaddy.com/en-ph/help/generate-a-csr-certificate-signing-request-5343) is approved, you can [download your certificate](https://www.godaddy.com/en-ph/help/download-my-ssl-certificate-files-4754) from the SSL manager and install it on your Apache server. If your server is running CentOS instead of Ubuntu, please see [Manually install an SSL certificate on my Apache server (CentOS)](https://www.godaddy.com/en-ph/help/manually-install-an-ssl-certificate-on-my-apache-server-centos-5238).

1. Find the directory on your server where certificate and key files are stored, then upload your intermediate certificate (`gd_bundle.crt` or similar) and primary certificate (`.crt` file with randomized name) into that folder.

   - For security, you should make these files readable by root only.

2. Find your Apache configuration file.

   - On default configurations, you can find a file named `apache2.conf` in the `/etc/apache2` folder.

   - If you have configured your server differently, you may be able to find the file with the following command:

     ```
     grep -i -r "SSLCertificateFile" /etc/apache2/
     ```

     - `/etc/apache2/` may be replaced with the base directory of your Apache installation.

3. Open this file with your favorite text editor.

4. Inside your `apache2.conf` file, find the < VirtualHost > block.

5. To have your site available on both secure (https) and non-secure (http) connections, make a copy of this block and paste it directly below the existing < VirtualHost > block.

6. You can now customize this copy of the < VirtualHost > block for secure connections. Here is an example configuration:

   ```
   <VirtualHost xxx.xxx.x.x:443>
   	DocumentRoot /var/www/coolexample
   	ServerName coolexample.com www.coolexample.com
   		SSLEngine on
   		SSLCertificateFile /path/to/coolexample.crt
   		SSLCertificateKeyFile /path/to/privatekey.key
   		SSLCertificateChainFile /path/to/intermediate.crt
   </VirtualHost>
   ```

7. Don't forget the added `443` port at the end of your server IP.

8. **DocumentRoot** and **ServerName** should match your original < VirtualHost > block.

9. The remaining`/path/to/...` file locations can be replaced with your custom directory and file names.

10. First, run the following command to check your Apache configuration file for errors:

11. apache2ctl configtest

12. Confirm that the test returns a **Syntax OK** response. If it does not, review your configuration files.

13.  **Warning:** The Apache service will not start again if your config files have syntax errors.

14. After confirming a **Syntax OK** response, run the following command to restart Apache:

15. apache2ctl restart



```
<VirtualHost *:443>
    #ServerAdmin webmaster@localhost
    ServerName portal.nexusstrades.com

    DocumentRoot /var/www/html/aggregator/public

    SSLEngine on
    SSLCertificateFile /etc/ssl/portal-nexusstrades-com/portal.nexusstrades.com-certificate.crt
    SSLCertificateKeyFile /etc/ssl/portal-nexusstrades-com/portal-nexusstrades-com.key
    SSLCertificateChainFile /etc/ssl/portal-nexusstrades-com/portal.nexusstrades.com-intermediate.pem

    <Directory /var/www/html/aggregator>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```



```
<VirtualHost *:443>

 #ServerAdmin admin@example.com
 ServerName hire.pasigcity.gov.ph

 DocumentRoot /var/www/hireportal/public

 SSLEngine on

 SSLCertificateFile      /etc/ssl/hire/certificate.crt
 SSLCertificateKeyFile   /etc/ssl/hire/hire.key
 SSLCertificateChainFile /etc/ssl/hire/ca_bundle.crt

 <Directory />
 Options FollowSymLinks
 AllowOverride None
 </Directory>
 <Directory /var/www/hireportal>
 AllowOverride All
 </Directory>

 ErrorLog ${APACHE_LOG_DIR}/error.log
 CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
```


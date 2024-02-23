

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

### https://cwis.bmb.gov.ph/

```
UPDATE wp_options SET option_value = replace(option_value, 'https://stg12.beesites.net/bmb/', 'https://cwis.bmb.gov.ph/') WHERE option_name = 'home' OR option_name = 'siteurl';
UPDATE wp_posts SET guid = replace(guid, 'https://stg12.beesites.net/bmb/','https://cwis.bmb.gov.ph/');
UPDATE wp_posts SET post_content = replace(post_content, 'https://stg12.beesites.net/bmb/', 'https://cwis.bmb.gov.ph/');
UPDATE wp_postmeta SET meta_value = replace(meta_value,'https://stg12.beesites.net/bmb/','https://cwis.bmb.gov.ph/');
```



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



# Hardening WordPress Security Using .htaccess

The default .htaccess file created by WordPress during the installation process on Apache contains only the basic directives needed for WordPress to function. Additional directives may be included in .htaccess to further secure and harden WordPress from common attacks. Many of the below suggestions are not specific to WordPress so they may be used to increase the security posture of any site served by Apache. Other directives are also included below to reduce bandwidth consumption and improve site performance through HTTP compression and browser caching.

The following examples and suggestions assume a single WordPress installation in the document root (not installed in a sub-directory). It also assumes the typical user with a modern browser. If you have a large userbase of early generation browsers, then please adjust accordingly. Remember, defense in depth, so combine these methods with others to create a balance of security and usability.

## Prevent Directory Listings

The first directive in the file disables directory listings by including `-Indexes` in the directive. If a user attempts to browse a directory, Apache won’t serve a listing of all subdirectories or files at that location. This limits exposure of the underlying file system structure and content.

```
Options -Indexes +FollowSymLinks -MultiViews
```

## Hide Apache Version

The next directive instructs Apache to not display its version information on server generated error pages, listings, etc. If a bad actor is scanning for a version of Apache with a known vulnerability, this makes it slightly more difficult to fingerprint.

```
ServerSignature Off
```

## Limit Allowed HTTP Request Methods

Allowed request methods are limited to POST, GET, and HEAD. If the site is using other methods, then adjust the list accordingly. By leaving unused request methods open, it increases the attack surface and exposes the site to potential attacks. Bad actors attempt to exploit vulnerabilities in the server configuration by sending crafted requests or malformed request methods.

```
<LimitExcept POST GET HEAD OPTIONS>
  Require all denied
</LimitExcept>
```

## Block IP Addresses and Ranges

Known IP addresses of spammers or other bad actors are blocked from accessing the site in the following directive. If you monitor the server log files for any period of time, you will find certain IP addresses are constantly scanning for vulnerabilities. Specific addresses or ranges can be blocked by adjusting the `Require not ip` lines. Replace the addresses in the example with the appropriate address numbers or ranges. If a user with a listed IP address attempts to connect to the site, the request fails and no further directives are evaluated. This directive can quickly grow too large to realistically maintain. Consider leveraging stronger firewall solutions for easier and automated blocking.

```
<RequireAll>
    Require all granted
    Require not ip 10.0.0.1
    Require not ip 10.32.64.250
</RequireAll>
```

## Block Referrer Links

If the site receives referral traffic from either undesirable sites or entire generic top-level domains, this directive prevents incoming traffic from those sites when the supplied referrer information matches the RewriteCond lines. While this does not prevent other sites from simply including a link on their site or copying content, it does block incoming traffic from those sites. In the example, traffic from all .cc, .eu. and .ru top-level domains are blocked as well as traffic from example1.com and example2.com. When the referrer data matches either condition, the request fails and no further directives are evaluated. Adjust the conditions to meet the specific needs of your site as this directive is rather restrictive.

```
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{HTTP_REFERER} ^http(?:s)?://(?:.*)?\.(?:cc|eu|ru)(?:/.*)?$ [NC,OR]
  RewriteCond %{HTTP_REFERER} ^http(?:s)?://(?:.*\.)?(?:example1.com|example2.com)(?:/.*)?$ [NC]
  RewriteRule ^ - [NC,F,L]
</IfModule>
```

## Block HTTP/1.0 Requests

The following directive blocks any user attempting to access the site using HTTP/1.0. I chose to block this protocol because it is outdated and I assume any connection attempt using this protocol is likely not coming from a typical user. If a user attempts to connect to the site using HTTP/1.0, the request fails and no further directives are evaluated.

```
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{SERVER_PROTOCOL} ^HTTP/1\.0$
  RewriteRule ^ - [NC,F,L]
</IfModule>
```

## Block Requests with Empty HTTP_USER_AGENT String

This directive assumes that all typical users have an HTTP_USER_AGENT string which signals to the server the product name / browser and version used to access the site. If the user-agent string is blank or whitespace or dashes, then the request fails and no further directives are evaluated.

```
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{HTTP_USER_AGENT} ^(?:\s|-)*$
  RewriteRule ^ - [NC,F,L]
</IfModule>
```

## Block Access to WordPress Configuration Files and XML-RPC

If a user attempts to access a file listed in the directive, the request fails. The files listed here are common configuration files or log files for WordPress which should not be exposed to general users for security reasons. The XML-RPC endpoint is commonly used by bad actors for DDoS and brute force attacks since it provides programmatic remote access to a site.

```
<FilesMatch "wp-config\.php|error_log|readme\.html|license\.txt|wp-config-sample\.php">
  Require all denied
</FilesMatch>
```

## Restrict WordPress Login to Known IP Addresses

This directive restricts access to wp-login to specific IP addresses or ranges. If an installation only has a handful of registered users, this directive limits login attempts to those known user IP addresses. This reduces a bad actor’s ability to brute force login attempts. Ensure the allowed IP list includes the site’s public IP address otherwise WordPress will indicate an issue in Site Health because it is unable to perform loopback requests. Replace the addresses in the example with the appropriate address numbers or ranges. Please keep in mind that this is very restrictive and you will not be able to login if you are accessing the site from a different IP address, e.g. mobile vs. home Wi-Fi.

```
<FilesMatch "wp-login\.php|xmlrpc\.php">
  <RequireAny>
    Require ip 172.16.0.1
    Require ip 172.30.254.1
  </RequireAny>
</FilesMatch>
```

## Block Hotlinking

The following directive prevents hotlinking of images and common files. Hotlinking occurs when another site links directly to an image/file on your site instead of hosting the image/file itself. If the other site has high traffic, it will consume your site’s bandwidth and potentially degrade server performance. It may also have a cost impact if your bandwidth threshold is exceeded. Adjust the RewriteCond to your domain(s). Again, if the request is not coming from a specified domain, then the request fails and no further directives are evaluated.

```
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{HTTP_REFERER} !^$
  RewriteCond %{HTTP_REFERER} !^http(?:s)?://(?:.*\.)?dalesandro\.net(?:/.*)?$ [NC]
  RewriteRule \.(?:jpe?g|gif|png|svg|webp|zip|rar|pdf)$ - [NC,F,L]
</IfModule>
```

## Block Direct Access to /wp-includes

This section restricts direct access to the wp-includes directory which contains core WordPress code and scripts. Public access to this directory is not required or intended for a WordPress site to function so direct access should be restricted.

```
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteRule ^wp-admin/includes/ - [NC,F,L]
  RewriteRule !^wp-includes/ - [S=3]
  RewriteRule ^wp-includes/[^/]+\.php$ - [NC,F,L]
  RewriteRule ^wp-includes/js/tinymce/langs/.+\.php - [NC,F,L]
  RewriteRule ^wp-includes/theme-compat/ - [NC,F,L]
</IfModule>
```

## Block WordPress Author Scans

Author scans are performed to enumerate usernames for WordPress based sites. Any usernames identified through these scans can be used in brute force attempts to access the admin section of the site. If you browse to a WordPress site and include /author=1 (or 2, 3, 4, etc.), WordPress will return author details for that particular ID. This directive blocks these requests.

```
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteCond %{QUERY_STRING} (author=\d+) [NC]
  RewriteRule ^ - [NC,F,L]
</IfModule>
```

## Return 410 Gone Response for Deleted Posts/Pages

While not security focused, this is an example of how to handle removed posts/pages. The “G” flag in the RewriteRule returns a 410 Gone response status code which informs browsers and bots that the resource has been intentionally removed.

```
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{REQUEST_URI} ^/post-permalink(?:/.*)?$ [OR,NC]
  RewriteCond %{REQUEST_URI} ^/2021/02/28/another-post-permalink(?:/.*)?$ [OR,NC]
  RewriteCond %{REQUEST_URI} ^/yet-another-post-permalink(?:/.*)?$ [NC]
  RewriteRule ^ - [NC,G,L]
</IfModule>
```

## Permanent Redirects (301) for Renamed Permalinks

Again, not a security focused example, but this example demonstrates how to handle changed permalinks. If the permalink for a specific post/page has changed, these directives return a 301 Moved Permanently response status code. This provides browsers/bots with the new resource location for the redirect and avoids a 404 Not Found response status code while informing bots to update its index. Adjust the RewriteCond to your domain(s).

```
RedirectMatch 301 ^/post-permalink(?:/.*)?$ https://www.dalesandro.net/updated-post-permalink/
RedirectMatch 301 ^/another-post-permalink(?:/.*)?$ https://www.dalesandro.net/replacement-permalink/
```

RedirectMatch may also be used for more significant and sitewide changes to the permalink structure such as changing from the “Day and name” permalink structure which includes the year, month, and day followed by the post name, e.g. /2013/07/06/sample-post/, to the “Post name” permalink structure which only includes the post name, e.g. /sample-post/. Assuming the site has been previously indexed under the old permalink structure, the search results will return the old “Day and name” URLs which will generate 404 Not Found response status codes.

This directive returns the more appropriate response code of 301 (moved permanently) and redirects users to the appropriate URL in the new permalink structure (assuming a change from “Day and name” to “Post name”).

```
RedirectMatch 301 ^/([0-9]{4})/([0-9]{2})/([0-9]{2})/(?:.*)$ https://www.dalesandro.net/$4
```

## Reduce Automated WordPress Comment Spam

WordPress sites that allow comment submissions will receive comment spam. These comments are usually submitted through automated bots. In many cases, these bots don’t actually submit the comment through the form displayed on a post/page. Instead, the comment is submitted programmatically and directly through wp-comments-post.php. This directive assumes that any POST submissions to wp-comments-post.php are spam where the referrer is not your own domain or the user-agent string is empty. When these conditions are met, then the request fails and no further directives are evaluated. Adjust the RewriteCond to your domain(s).

```
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{REQUEST_METHOD} POST [NC]
  RewriteCond %{REQUEST_URI} wp-comments-post\.php [NC]
  RewriteCond %{HTTP_REFERER} !^http(s)?://(.*\.)?dalesandro\.net(/.*)?$ [OR,NC]
  RewriteCond %{HTTP_USER_AGENT} ^(?:\s|-)*$
  RewriteRule ^ - [NC,F,L]
</IfModule>
```

## Add Secure Headers

The following section adds secure headers to HTTP responses. In modern browsers, these headers help prevent some vulnerabilities such a cross-site scripting and clickjacking. These should be adjusted for your particular site. For more information, review [OWASP Secure Headers Project](https://owasp.org/www-project-secure-headers/).

```
<IfModule mod_headers.c>
  Header set X-XSS-Protection "1; mode=block"
  Header set X-Frame-Options SAMEORIGIN
  Header set X-Content-Type-Options nosniff
  Header set Referrer-Policy "same-origin"
</IfModule>
```

## Add HTTP Compression

With the exception of already compressed file types, e.g. image files, zip/rar, pdf, the following directive instructs Apache to compress any other served files. While this isn’t security related, it reduces bandwidth consumption and improves performance.

```
<IfModule mod_deflate.c>
  SetOutputFilter DEFLATE
  <IfModule mod_setenvif.c>
    SetEnvIfNoCase Request_URI \.(?:jpe?g|gif|png|svg|webp|zip|rar|pdf)$ no-gzip dont-vary
  </IfModule>
</IfModule>
```

## Add Browser Caching Directives

In addition to HTTP compression above, the following directive instructs browser how long to cache certain file types. Obviously, this will reduce bandwidth consumption and improve performance since browsers won’t request the same file over and over with each post/page view. These file types are assumed to be mostly static and remain unchanged for long periods of time. The cache time should be adjusted to meet your own requirements and file rules should be added/removed as needed. These directives require mod_expires which can be enabled in httpd.conf. For instructions on how to load mod_expires, read [Enable Browser Caching Directives in Amazon Lightsail Apache Server](https://www.dalesandro.net/enable-browser-caching-directives-in-amazon-lightsail-apache-server/).

```
<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresDefault "access plus 1 month"
  ExpiresByType text/cache-manifest "access plus 0 seconds"
  ExpiresByType text/html "access plus 0 seconds"
  ExpiresByType text/xml "access plus 0 seconds"
  ExpiresByType application/xml "access plus 0 seconds"
  ExpiresByType application/json "access plus 0 seconds"
  ExpiresByType application/rss+xml "access plus 1 hour"
  ExpiresByType application/atom+xml "access plus 1 hour"
  ExpiresByType image/x-icon "access plus 1 year"
  ExpiresByType image/gif "access plus 1 year"
  ExpiresByType image/png "access plus 1 year"
  ExpiresByType image/jpg "access plus 1 year"
  ExpiresByType image/jpeg "access plus 1 year"
  ExpiresByType image/webp "access plus 1 year"
  ExpiresByType image/svg+xml "access plus 1 year"
  ExpiresByType image/vnd.microsoft.icon "access plus 1 year"
  ExpiresByType video/ogg "access plus 1 year"
  ExpiresByType audio/ogg "access plus 1 year"
  ExpiresByType video/mp4 "access plus 1 year"
  ExpiresByType video/webm "access plus 1 year"
  ExpiresByType video/mpeg "access plus 1 year"
  ExpiresByType text/x-component "access plus 1 year"
  ExpiresByType font/ttf "access plus 1 year"
  ExpiresByType font/otf "access plus 1 year"
  ExpiresByType font/woff "access plus 1 year"
  ExpiresByType font/woff2 "access plus 1 year"
  ExpiresByType application/font-woff "access plus 1 year"
  ExpiresByType application/x-font-ttf "access plus 1 year"
  ExpiresByType font/opentype "access plus 1 year"
  ExpiresByType application/vnd.ms-fontobject "access plus 1 year"
  ExpiresByType text/css "access plus 1 month"
  ExpiresByType text/javascript "access plus 1 month"
  ExpiresByType text/x-javascript "access plus 1 month"
  ExpiresByType application/javascript "access plus 1 month"
  ExpiresByType application/x-javascript "access plus 1 month"
  ExpiresByType application/pdf "access plus 1 month"
  ExpiresByType application/zip "access plus 1 month"
  <IfModule mod_headers.c>
    Header append Cache-Control "public"
  </IfModule>
</IfModule>
```

## Source Code

Finally, this is the complete .htaccess file containing all of the directives reviewed above.

```
Options -Indexes +FollowSymLinks -MultiViews

ServerSignature Off

<LimitExcept POST GET HEAD OPTIONS>
  Require all denied
</LimitExcept>

<RequireAll>
    Require all granted
    Require not ip 10.0.0.1
    Require not ip 10.32.64.250
</RequireAll>

<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{HTTP_REFERER} ^http(?:s)?://(?:.*)?\.(?:cc|eu|ru)(?:/.*)?$ [NC,OR]
  RewriteCond %{HTTP_REFERER} ^http(?:s)?://(?:.*\.)?(?:example1.com|example2.com)(?:/.*)?$ [NC]
  RewriteRule ^ - [NC,F,L]
</IfModule>

<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{SERVER_PROTOCOL} ^HTTP/1\.0$
  RewriteRule ^ - [NC,F,L]
</IfModule>

<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{HTTP_USER_AGENT} ^(?:\s|-)*$
  RewriteRule ^ - [NC,F,L]
</IfModule>

<FilesMatch "wp-config\.php|error_log|readme\.html|license\.txt|wp-config-sample\.php">
  Require all denied
</FilesMatch>

<FilesMatch "wp-login\.php|xmlrpc\.php">
  <RequireAny>
    Require ip 172.16.0.1
    Require ip 172.30.254.1
  </RequireAny>
</FilesMatch>

<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{HTTP_REFERER} !^$
  RewriteCond %{HTTP_REFERER} !^http(?:s)?://(?:.*\.)?dalesandro\.net(?:/.*)?$ [NC]
  RewriteRule \.(?:jpe?g|gif|png|svg|webp|zip|rar|pdf)$ - [NC,F,L]
</IfModule>

<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteRule ^wp-admin/includes/ - [NC,F,L]
  RewriteRule !^wp-includes/ - [S=3]
  RewriteRule ^wp-includes/[^/]+\.php$ - [NC,F,L]
  RewriteRule ^wp-includes/js/tinymce/langs/.+\.php - [NC,F,L]
  RewriteRule ^wp-includes/theme-compat/ - [NC,F,L]
</IfModule>

<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteCond %{QUERY_STRING} (author=\d+) [NC]
  RewriteRule ^ - [NC,F,L]
</IfModule>

<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{REQUEST_URI} ^/post-permalink(?:/.*)?$ [OR,NC]
  RewriteCond %{REQUEST_URI} ^/2021/02/28/another-post-permalink(?:/.*)?$ [OR,NC]
  RewriteCond %{REQUEST_URI} ^/yet-another-post-permalink(?:/.*)?$ [NC]
  RewriteRule ^ - [NC,G,L]
</IfModule>

RedirectMatch 301 ^/post-permalink(?:/.*)?$ https://www.dalesandro.net/updated-post-permalink/
RedirectMatch 301 ^/another-post-permalink(?:/.*)?$ https://www.dalesandro.net/replacement-permalink/

RedirectMatch 301 ^/([0-9]{4})/([0-9]{2})/([0-9]{2})/(?:.*)$ https://www.dalesandro.net/$4

<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{REQUEST_METHOD} POST [NC]
  RewriteCond %{REQUEST_URI} wp-comments-post\.php [NC]
  RewriteCond %{HTTP_REFERER} !^http(s)?://(.*\.)?dalesandro\.net(/.*)?$ [OR,NC]
  RewriteCond %{HTTP_USER_AGENT} ^(?:\s|-)*$
  RewriteRule ^ - [NC,F,L]
</IfModule>

<IfModule mod_headers.c>
  Header set X-XSS-Protection "1; mode=block"
  Header set X-Frame-Options SAMEORIGIN
  Header set X-Content-Type-Options nosniff
  Header set Referrer-Policy "same-origin"
</IfModule>

<IfModule mod_deflate.c>
  SetOutputFilter DEFLATE
  <IfModule mod_setenvif.c>
    SetEnvIfNoCase Request_URI \.(?:jpe?g|gif|png|svg|webp|zip|rar|pdf)$ no-gzip dont-vary
  </IfModule>
</IfModule>

<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresDefault "access plus 1 month"
  ExpiresByType text/cache-manifest "access plus 0 seconds"
  ExpiresByType text/html "access plus 0 seconds"
  ExpiresByType text/xml "access plus 0 seconds"
  ExpiresByType application/xml "access plus 0 seconds"
  ExpiresByType application/json "access plus 0 seconds"
  ExpiresByType application/rss+xml "access plus 1 hour"
  ExpiresByType application/atom+xml "access plus 1 hour"
  ExpiresByType image/x-icon "access plus 1 year"
  ExpiresByType image/gif "access plus 1 year"
  ExpiresByType image/png "access plus 1 year"
  ExpiresByType image/jpg "access plus 1 year"
  ExpiresByType image/jpeg "access plus 1 year"
  ExpiresByType image/webp "access plus 1 year"
  ExpiresByType image/svg+xml "access plus 1 year"
  ExpiresByType image/vnd.microsoft.icon "access plus 1 year"
  ExpiresByType video/ogg "access plus 1 year"
  ExpiresByType audio/ogg "access plus 1 year"
  ExpiresByType video/mp4 "access plus 1 year"
  ExpiresByType video/webm "access plus 1 year"
  ExpiresByType video/mpeg "access plus 1 year"
  ExpiresByType text/x-component "access plus 1 year"
  ExpiresByType font/ttf "access plus 1 year"
  ExpiresByType font/otf "access plus 1 year"
  ExpiresByType font/woff "access plus 1 year"
  ExpiresByType font/woff2 "access plus 1 year"
  ExpiresByType application/font-woff "access plus 1 year"
  ExpiresByType application/x-font-ttf "access plus 1 year"
  ExpiresByType font/opentype "access plus 1 year"
  ExpiresByType application/vnd.ms-fontobject "access plus 1 year"
  ExpiresByType text/css "access plus 1 month"
  ExpiresByType text/javascript "access plus 1 month"
  ExpiresByType text/x-javascript "access plus 1 month"
  ExpiresByType application/javascript "access plus 1 month"
  ExpiresByType application/x-javascript "access plus 1 month"
  ExpiresByType application/pdf "access plus 1 month"
  ExpiresByType application/zip "access plus 1 month"
  <IfModule mod_headers.c>
    Header append Cache-Control "public"
  </IfModule>
</IfModule>

# BEGIN WordPress
# The directives (lines) between "BEGIN WordPress" and "END WordPress" are
# dynamically generated, and should only be modified via WordPress filters.
# Any changes to the directives between these markers will be overwritten.
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>

# END WordPress
```

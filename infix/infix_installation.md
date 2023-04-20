# Infix Installation

**Please try changing the below info on php.ini**

```
max_execution_time 30000
max_input_time 30000
memory_limit 512MB
post_max_size 512MB
upload_max_filesize 1028M
```

also, make sure PHP -v see in command line min 7.4.x


Please check the installation video https://www.youtube.com/watch?v=tfQ9htbQIog&t
we have a simple process

1. Upload file
2. Unzip make sure to show all hidden files
3. Move the desired location and enter that URL
4. Start auto installation.

**Configure Apache**

```
<VirtualHost *:80>
                # ServerName www.example.com
                Redirect / https://e-uis.beesuite.ph/
        </VirtualHost>
        <VirtualHost _default_:443>
                ServerAdmin webmaster@localhost

                DocumentRoot /var/www/html/infix

                <Directory /var/www/html/infix>
                  AllowOverride All
                </Directory>


                # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
                # error, crit, alert, emerg.
                # It is also possible to configure the loglevel for particular
                # modules, e.g.
                #LogLevel info ssl:warn

                ErrorLog ${APACHE_LOG_DIR}/error.log
                CustomLog ${APACHE_LOG_DIR}/access.log combined

                # For most configuration files from conf-available/, which are
                # enabled or disabled at a global level, it is possible to
                # include a line for only one particular virtual host. For example the
                # following line enables the CGI configuration for this host only
                # after it has been globally disabled with "a2disconf".
                #Include conf-available/serve-cgi-bin.conf
        </VirtualHost>
</IfModule>
```



After installation infix School to work properly, you must make few directories/files writable. **Below are a list of directories/files you should ensure that have write permissions.**

- installation_dir/storage/app/
- installation_dir/storage/framework/cache
- installation_dir/storage/framework/session
- installation_dir/storage/framework/testing
- installation_dir/public/uploads/

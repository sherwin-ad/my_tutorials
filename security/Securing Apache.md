[TOC]



# Securing Apache 

## mod_reqtimeout

```
# Check if mod_reqtimeout is enabled
$ apachectl -M | grep reqtimeout
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
 reqtimeout_module (shared)

# Enable mod_reqtimeout
a2enmod reqtimeout
```

Check reqtimeout configuration file
/etc/apache2/mods-available/reqtimeout.conf

```
<IfModule reqtimeout_module>

	# mod_reqtimeout limits the time waiting on the client to prevent an
	# attacker from causing a denial of service by opening many connections
	# but not sending requests. This file tries to give a sensible default
	# configuration, but it may be necessary to tune the timeout values to
	# the actual situation. Note that it is also possible to configure
	# mod_reqtimeout per virtual host.


	# Wait max 20 seconds for the first byte of the request line+headers
	# From then, require a minimum data rate of 500 bytes/s, but don't
	# wait longer than 40 seconds in total.
	# Note: Lower timeouts may make sense on non-ssl virtual hosts but can
	# cause problem with ssl enabled virtual hosts: This timeout includes
	# the time a browser may need to fetch the CRL for the certificate. If
	# the CRL server is not reachable, it may take more than 10 seconds
	# until the browser gives up.
	RequestReadTimeout header=20-40,minrate=500

	# Wait max 10 seconds for the first byte of the request body (if any)
	# From then, require a minimum data rate of 500 bytes/s
	RequestReadTimeout body=10,minrate=500

</IfModule>
```



## mod_security

1. ModSecurity can be installed by running the following command in your terminal:

   ```
   sudo apt install libapache2-mod-security2 -y
   ```

2. After installing ModSecurity, enable the Apache 2 `headers` module by running the following command:

   ```
   sudo a2enmod security2
   
   sudo a2enmod headers
   ```

​		After installing ModSecurity and enabling the header module, you need to restart the apache2 service, this can be done by running the following command:

```
sudo systemctl restart apache2
```

3. Remove the `.recommended` extension from the ModSecurity configuration file name with the following command:

   ```
   sudo cp /etc/modsecurity/modsecurity.conf-recommended etc/modsecurity/modsecurity.conf
   ```

4. With a text editor such as vim, open `/etc/modsecurity/modsecurity.conf` and change the value for `SecRuleEngine` to `On`:

   ```
   # -- Rule engine initialization ----------------------------------------------
   
   # Enable ModSecurity, attaching it to every transaction. Use detection
   # only to start with, because that minimises the chances of post-installation
   # disruption.
   #
   SecRuleEngine On
   ...
   ```

   Restart Apache to apply the changes:

   ```
   systemctl restart apache2
   ```

**Setting Up the OWASP ModSecurity Core Rule Set**

https://owasp.org/www-project-modsecurity-core-rule-set/

https://github.com/coreruleset/coreruleset

5. First, delete the current rule set that comes prepackaged with ModSecurity by running the following command:

   ```
   sudo rm -rf /usr/share/modsecurity-crs
   ```

6. Clone the OWASP-CRS GitHub repository into the `/usr/share/modsecurity-crs` directory:

   ```
   sudo git clone https://github.com/coreruleset/coreruleset /usr/share/modsecurity-crs
   ```

7. Rename the `crs-setup.conf.example` to `crs-setup.conf`:

   ```
   cd /usr/share/modsecurity-crs
   
   sudo mv crs-setup.conf.example crs-setup.conf
   ```

8. Rename the default request exclusion rule file:

   ```
   cd /usr/share/modsecurity-crs/rule
   
   sudo mv REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf.example REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf
   
   ```

**Enabling ModSecurity in Apache 2**

	9. Using a text editor such as vim, edit the `/etc/apache2/mods-available/security2.conf` file to include the OWASP-CRS files you have downloaded:

```
<IfModule security2_module>
        SecDataDir /var/cache/modsecurity
        Include /usr/share/modsecurity-crs/crs-setup.conf
        Include /usr/share/modsecurity-crs/rules/*.conf
</IfModule>
```



**Testing the ModSecurity Configuration on Ubuntu**

10. Lastly, we need to test that **ModSecurity** can detect and block suspicious HTTP traffic. To achieve this, we need to edit the default virtual host file.

    ```
    <VirtualHost *:80>
            # The ServerName directive sets the request scheme, hostname and port that
            # the server uses to identify itself. This is used when creating
            # redirection URLs. In the context of virtual hosts, the ServerName
            # specifies what hostname must appear in the request's Host: header to
            # match this virtual host. For the default virtual host (this file) this
            # value is not decisive as it is used as a last resort host regardless.
            # However, you must set it for any further virtual host explicitly.
            #ServerName www.example.com
    
            ServerAdmin webmaster@localhost
            DocumentRoot /var/www/html/wordpress
    
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
    
            SecRuleEngine On
            SecRule ARGS:testparam "@contains test" "id:254,deny,status:403,msg:'Test Successful'"
    
    </VirtualHost>
    ```

    Then restart the **Apache** webserver to apply the changes made to the virtual host configuration file.

    ```
    sudo systemctl restart apache2
    ```

    On your web browser, try to visit the URL shown with `?testparam=test` at the end.

    ```
    http://server-ip/?testparam=test
    ```

    You get a **‘403 Forbidden error’** indicating that you have been blocked from accessing the resource.

    You can further confirm the client was blocked by checking the error logs as follows.

    ```
    $ cat /var/log/apache2/error.log | grep “Test Successful”
    ```

    

## mod_qos

https://www.howtoforge.com/how-to-defend-slowloris-ddos-with-mod_qos-apache2-on-debian-lenny

https://mod-qos.sourceforge.net/

https://sourceforge.net/projects/mod-qos/files/

    sudo apt-get install libapache2-mod-qos



## fail2ban



​		




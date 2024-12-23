[TOC]

# Install Odoo 17 on Ubuntu 22.04

## STEP 1 ~ Update and Upgrade Packages

```
sudo apt-get update -y
sudo apt-get upgrade -y
```

## STEP 2 ~ Create a New User

```
sudo sudo adduser --system --home=/opt/[odoo17] --group [odoo17]
```

## STEP 3 ~ Fail2ban

```
sudo apt-get install openssh-server fail2ban
```

## STEP 4 ~ Install Necessary Packages

Install Wkhtmltopdf

```
sudo wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
sudo dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.deb
sudo apt install -f
```

Install Python Packages

```
sudo apt-get install -y python3-pip
sudo apt-get install python-dev python3-dev libxml2-dev libxslt1-dev zlib1g-dev libsasl2-dev libldap2-dev build-essential libssl-dev libffi-dev libmysqlclient-dev libjpeg-dev libpq-dev libjpeg8-dev liblcms2-dev libblas-dev libatlas-base-dev
```

Install Node.js and NPM

```
sudo apt-get install -y npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g less less-plugin-clean-css
sudo apt-get install -y node-less
```

## STEP 5 ~ Create and Setup Database



Install PostgreSQL is the database server used by Odoo

```
sudo apt-get install postgresql
```

Create Database User

```
sudo su - postgres
createuser --createdb --username postgres --no-createrole --no-superuser --pwprompt [odoo17]
```

The user and the password are needed for the conf file. Postgres uses a distinct system user to perform tasks.

To switch between users, run sudo su -postgres. Next, create a database user for Odoo 17.

```
psql
ALTER USER [odoo17] WITH SUPERUSER;
\q
exit
```

## STEP 6 ~ Create System User



```
sudo adduser --system --home=/opt/[odoo17] --group [odoo17]
```



## STEP 7 ~ Clone Odoo17 From Github

Install git

```
sudo apt-get install git
```

Change to the system user to [odoo17]

```
sudo su - [odoo17] -s /bin/bash
```

Clone Odoo 17

```
git clone https://www.github.com/odoo/odoo --depth 1 --branch 17.0 --single-branch .
```

Once Done Exit From System User

```
exit
```

## STEP 8 ~ Run Requirements File



```
sudo pip3 install -r /opt/[odoo17]/requirements.txt
```



## STEP 9 ~ Setup Conf File



Copy /opt/odoo17/debian/odoo.conf file to /etc.

```
sudo cp /opt/[odoo17]/debian/odoo.conf /etc/[odoo17].conf
sudo nano /etc/[odoo17].conf
```

Update the Conf File you have copied in /etc

```
[options]
   ; This is the password that allows database operations:
   admin_passwd = admin
   db_host = False
   db_port = False
   db_user = [odoo17]
   db_password = False
   addons_path = /opt/[odoo17]/addons
   logfile = /var/log/[odoo17]/[odoo17].log
```

Grant System user [odoo17] access to the conf file

```
sudo chown [odoo17]: /etc/[odoo17].conf
sudo chmod 640 /etc/[odoo17].conf
```



## STEP 10 ~ Create an [odoo17] Log Directory and Set Permissions

```
sudo mkdir /var/log/[odoo17]
sudo chown [odoo17]:root /var/log/[odoo17]
```



## STEP 11 ~ Service file and Start Odoo 17



We have to create a service to run Odoo 17. Let’s create a service file ‘[odoo17].service’ in /etc/systemd/system.

```
sudo nano /etc/systemd/system/[odoo17].service
```

Add the following aspects to the newly created service file.

```
[Unit]
   Description=Odoo17
   Documentation=http://www.odoo.com
   [Service]
   # Ubuntu/Debian convention:
   Type=simple
   User=[odoo17]
   ExecStart=/opt/[odoo17]/odoo-bin -c /etc/[odoo17].conf
   [Install]
   WantedBy=default.target
```

Set the root user's permissions for this service file

```
sudo chmod 755 /etc/systemd/system/[odoo17].service
sudo chown root: /etc/systemd/system/[odoo17].service
```

Start Odoo17

```
sudo systemctl start [odoo17].service
```

Visit Your Site

```
http://<your_domain_or_IP_address>:8069
```





# Install Odoo 16 on Ubuntu 22.04 (Jammy)

## Step 1 – Installing Required Packages

First, update your server and then upgrade it. If it asks for a password, give it:

```
sudo apt update && sudo apt upgrade
```

The command will upgrade available updates for the installed packages. Then install all the required packages for the Odoo setup on the Ubuntu system. This will install essential packages for build, Python, and Node.js on your system.

```
sudo apt install git wget nodejs npm python3 build-essential libzip-dev python3-dev libxslt1-dev python3-pip libldap2-dev python3-wheel libsasl2-dev python3-venv python3-setuptools node-less libjpeg-dev xfonts-75dpi xfonts-base libpq-dev libffi-dev fontconfig 
```

Also, install the below node module to enable RTL support.

```
sudo npm install -g rtlcss 
```

## Step 2 – Installing wkhtmltopdf

Now, you also need to install `wkhtmltox` Debian package, which provided useful `wkhtmltoimage` and `wkhtmltopdf` binary commands.

Download the Debian package from Github:

```
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb 
```

Then install it on your system.

```
sudo dpkg -i wkhtmltox_0.12.6.1-2.jammy_amd64.deb 
```

## Step 3 – Create a New System Account

Running the Odoo service as a separate user is a good practice. Now for the creation of a user for Odoo who can access the Odoo and can make changes to it.

```
sudo adduser --system --group --home=/opt/odoo --shell=/bin/bash odoo 
```

This will create a new account to use for Odoo service.

## Step 4 – Installing PostgreSQL

As we know that PostgreSQL is required as the database server for Odoo. So we will install it:

```
sudo apt install postgresql -y
```

Now for the creation of an Odoo user in PostgreSQL:

```
sudo su - postgres -c "createuser -s odoo" 
```

This will add a new role `odoo` in PostgreSQL server.

## Step 5 – Installing Odoo 16 on Ubuntu

We can download the Odoo from the Github repository. So clone it on your system. Make sure to clone the correct branch you need to install on your system. As we are installing Odoo 16, so use the branch name “16.0”.

```
cd /opt/odoo 
git clone https://github.com/odoo/odoo.git --depth 1 --branch 16.0 --single-branch odoo-server 
```

Change the file ownership to the odoo user.

```
sudo chown -R odoo:odoo /opt/odoo/odoo-server 
```

It’s a good practice to create a Python virtual environment for isolating applications. Create a virtual environment with the following commands:

```
cd /opt/odoo/odoo-server 
python3 -m venv venv  
source venv/bin/activate  
```

Once the virtual environment is activated, you will see the system prompt as “(venv) $”. Now install the Python dependencies for the Odoo under the virtual environment.

```
pip3 install wheel 
pip3 install -r requirements.txt
```

After finishing the installation, deactivate the virtual environment with the following command.

```
deactivate
```

Now we will create the directory of log and also change its permissions settings

```
sudo mkdir /var/log/odoo 
sudo chown odoo:odoo /var/log/odoo 
sudo chmod 777 /var/log/odoo 
```

## Step 6 – Create Odoo Configuration File

Next, create a configuration for the Odoo server. This is useful for customizing the Odoo application. Edit the configuration file `/etc/odoo-server.conf` in your favorite text editor:

```
sudo nano /etc/odoo-server.conf 
```

Add the below content to file:

```
[options]
admin_passwd = pass$123
db_user = odoo
addons_path = /opt/odoo/odoo-server/addons
logfile = /var/log/odoo/odoo-server.log
log_level  = debug
```



Make sure to change the **admin_passwd** value with a strong password. Save your file and close it.

Next, change the ownership to oddo user for the configuration file. Also, change file permissions

```
sudo chown odoo:odoo /etc/odoo-server.conf 
```

## Step 7 – Create Odoo Systemd Unit File

Create a Systemd unit file for the Oddo service management. It will help you manage Odoo’s service easily. Also allowed us to start Odoo on system boot. Create a new file **odoo.service** and edit in a text editor:

```
sudo nano /etc/systemd/system/odoo.service 
```

Add the following content.

```
[Unit]
Description=Odoo 16.0 Service
Requires=postgresql.service
After=network.target postgresql.service
 
[Service]
Type=simple
SyslogIdentifier=odoo
PermissionsStartOnly=true
User=odoo
Group=odoo
ExecStart=/opt/odoo/odoo-server/venv/bin/python3 /opt/odoo/odoo-server/odoo-bin -c /etc/odoo-server.conf
StandardOutput=journal+console
 
[Install]
WantedBy=multi-user.target
```



Save the file and close it.

Now, reload the systemd daemon to load the newly created file.

```
sudo systemctl daemon-reload
```

Start the Odoo service, Also enable it to auto-start on system boot:

```
sudo systemctl enable --now odoo.service 
```

Verify the service status:

```
sudo systemctl status odoo.service 
```



# Install Odoo 13 on Ubuntu 20.04

https://gist.github.com/parthivgls/70569370528876524abb4f6e7a0cf53f



# Install Odoo 13 on Ubuntu 18.04


## Installing Prerequisites

Login to your Ubuntu as a [sudo user](https://linuxize.com/post/how-to-create-a-sudo-user-on-ubuntu/) and update the Apt cache:

```
sudo apt update
```

Install [Git](https://linuxize.com/post/how-to-install-git-on-ubuntu-18-04/) , [Pip](https://linuxize.com/post/how-to-install-pip-on-ubuntu-18.04/) , [Node.js](https://linuxize.com/post/how-to-install-node-js-on-ubuntu-18.04/) , and the tools required to build Odoo dependencies:

```
sudo apt install git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less
```

## Creating a System User 

```
sudo useradd -m -d /opt/odoo13 -U -r -s /bin/bash odoo13
```

## Installing and Configuring PostgreSQL

```
sudo apt install postgresql
```

Once the installation is completed, create a PostgreSQL user with the same name as the previously created system user, in our case that is `odoo13`:

```
sudo su - postgres -c "createuser -s odoo13"
```

## Installing Wkhtmltopdf

Download the package using the following [wget](https://linuxize.com/post/wget-command-examples/) command:

```
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
```

Once the download is complete, install the package by typing:

```
sudo apt install ./wkhtmltox_0.12.5-1.bionic_amd64.deb
```

## Installing and Configuring Odoo 13

As mentioned before, we’ll install Odoo from the source inside an isolated [Python virtual environment](https://linuxize.com/post/how-to-create-python-virtual-environments-on-ubuntu-18-04/) .

First, [change to user](https://linuxize.com/post/su-command-in-linux/) “odoo13”:

```
sudo su - odoo13
```

Clone the Odoo 13 source code from GitHub:

```
git clone https://www.github.com/odoo/odoo --depth 1 --branch 13.0 /opt/odoo13/odoo
```

Activate the environment with the following command:

```
source odoo-venv/bin/activate
```

Install all required Python modules with pip3:

```
(venv) $ pip3 install wheel
(venv) $ pip3 install -r odoo/requirements.txt
```

Once done, deactivate the environment by typing:

```
(venv) $ deactivate
```

We’ll [create a new directory](https://linuxize.com/post/how-to-create-directories-in-linux-with-the-mkdir-command/) that will hold the 3rd party addons.

```
mkdir /opt/odoo13/odoo-custom-addons
```

Later, we’ll add this directory to the `addons_path` parameter. This parameter defines a list of directories where Odoo searches for modules.

Switch back to your sudo user:

```
exit
```

Create a configuration file with the following content:

```
sudo nano /etc/odoo13.conf
```

```
[options]
; This is the password that allows database operations:
admin_passwd = my_admin_passwd
db_host = False
db_port = False
db_user = odoo13
db_password = False
addons_path = /opt/odoo13/odoo/addons,/opt/odoo13/odoo-custom-addons
```

## Creating a Systemd Unit File 

Open your [text editor](https://linuxize.com/post/how-to-use-nano-text-editor/) and create a service unit file called `odoo13.service` with the following content:

```
sudo nano /etc/systemd/system/odoo13.service
```

```
[Unit]
Description=Odoo13
Requires=postgresql.service
After=network.target postgresql.service

[Service]
Type=simple
SyslogIdentifier=odoo13
PermissionsStartOnly=true
User=odoo13
Group=odoo13
ExecStart=/opt/odoo13/odoo-venv/bin/python3 /opt/odoo13/odoo/odoo-bin -c /etc/odoo13.conf
StandardOutput=journal+console

[Install]
WantedBy=multi-user.target
```

```
sudo systemctl daemon-reload
```

Start the Odoo service and enabled it to start on boot by running:

```
sudo systemctl enable --now odoo13
```

Verify the service status:

```
sudo systemctl status odoo13
```

The output should look something like below, indicating that the Odoo service is active and running.

```
● odoo13.service
   Loaded: loaded (/etc/systemd/system/odoo13.service; enabled; vendor preset: enabled)
   Active: active (running) since Sat 2019-10-19 20:06:23 UTC; 3s ago
 Main PID: 1860 (python3)
    Tasks: 4 (limit: 2362)
   CGroup: /system.slice/odoo13.service
           └─1860 /opt/odoo13/odoo-venv/bin/python3 /opt/odoo13/odoo/odoo-bin -c /etc/odoo13.conf
```

To see the messages logged by the Odoo service, use the command below:

```
sudo journalctl -u odoo13
```

## Testing the Installation

Open your browser and type: `http://<your_domain_or_IP_address>:8069`



## Run odoo

```
python3 odoo-bin --addons-path=addons -d odoo
```



## Prepare

Odoo needs a [PostgreSQL](http://www.postgresql.org/) server to run properly. The default configuration for the Odoo ‘deb’ package is to use the PostgreSQL server on the same host as your Odoo instance. Execute the following command in order to install the PostgreSQL server:

```
$ sudo apt install postgresql -y
```

## Warning

`wkhtmltopdf` is not installed through **pip** and must be installed manually in version [0.12.5](https://github.com/wkhtmltopdf/wkhtmltopdf/releases/tag/0.12.5) for it to support headers and footers. See our [wiki](https://github.com/odoo/odoo/wiki/Wkhtmltopdf) for more details on the various versions.

## Repository

Odoo S.A. provides a repository that can be used with Debian and Ubuntu distributions. It can be used to install *Odoo Community Edition* by executing the following commands **as root**:

```
# wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
# echo "deb http://nightly.odoo.com/14.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list
# apt-get update && apt-get install odoo
```



## Setting up Apache as a Reverse Proxy



To install Apache on your server, run the following command:

```
apt install apache2
```

After the installation is complete, you should enable Apache to start automatically upon system boot. You can do that with the following command:

```
systemctl enable apache2
```

To verify that Apache is running, open your web browser and enter your server IP address, (e.g. http://111.222.333.444). If Apache is successfully installed you should see a message saying “It works!”.

Next, we will need to enable some additional proxy modules for Apache. You can do this with the following commands:

```
a2enmod proxy
a2enmod proxy_http
```

Once this is done, open a new configuration file for your domain with the following command:

```
<IfModule mod_ssl.c>
<VirtualHost *:443>
  ServerName erp.beesuite.ph
  ServerAlias erp.beesuite.ph
  SSLProxyEngine on
  SSLEngine on


  SSLCertificateFile /etc/letsencrypt/live/erp.beesuite.ph/fullchain.pem
  SSLCertificateKeyFile /etc/letsencrypt/live/erp.beesuite.ph/privkey.pem
  Include /etc/letsencrypt/options-ssl-apache.conf

  # RequestHeader set "X-Forwarded-Proto" "https"

   SetEnv proxy-nokeepalive 1
        ProxyPass / http://127.0.0.1:8069/
        ProxyPassReverse / http://127.0.0.1:8069/
   ProxyErrorOverride off
   #TransferLog /var/log/apache2/transfer.your.domain.log
   #Fix IE problem (httpapache proxy dav error 408/409)
   SetEnv proxy-nokeepalive 1
</VirtualHost>
</IfModule>
```

Remember to replace ‘yourdomain.com‘ with your actual domain name.

Enable “yourdomain.conf” configuration in Apache using:

```
a2ensite yourdomain.com
```

#### Restart the Apache Web Server

Save the file, close it and restart Apache for the changes to take effect:

```
service apache2 restart
```



## Configure Odoo on Reverse Proxy with SSL Certificate

### Install Software Packages

```
sudo apt install nginx certbot python3-certbot-nginx
```



### Enable Proxy Mode on Odoo Server

In fact, please make sure that you have entered the correct path of the config file for your particular case. Otherwise, if you are following our **Odoo ERP** series then it should be exactly as stated below.

```
sudo nano /etc/odoo-server.conf
```


Now, ensure that you uncomment `proxy_mode = True` from the options available, or just input that line anywhere if it's not present. If you want to go next level with security measures. In addition, you can bind **Odoo Server** with local connections only and let the **Revere Proxy** handle the rest.

```
proxy_mode = True
xmlrpc_interface = 127.0.0.1
netrpc_interface = 127.0.0.1
```



## Enable Reverse Proxy with SSL on Nginx

Hey, lets make it clear that we're going to teach you here how to set the perfect **Reverse Proxy** with **SSL** connection for **Odoo Server**.



### Prepare Nginx for SSL

```
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
sudo mkdir -p /var/lib/letsencrypt/.well-known
sudo chgrp www-data /var/lib/letsencrypt
sudo chmod g+s /var/lib/letsencrypt
```



### Create SSL Snippets

We will start with **Let's Encrypt** configuration snippets.

```
sudo nano /etc/nginx/snippets/letsencrypt.conf
```


Given the above, please insert the following inside the config file created:

```
location ^~ /.well-known/acme-challenge/ {
  allow all;
  root /var/lib/letsencrypt/;
  default_type "text/plain";
  try_files $uri =404;
}
```


After that, we have the SSL session and stapling configuration snippets.

```
sudo nano /etc/nginx/snippets/ssl.conf
```


As a result, please insert the following inside the config file created:

```
ssl_dhparam /etc/ssl/certs/dhparam.pem;

ssl_session_timeout 1d;
ssl_session_cache shared:SSL:10m;
ssl_session_tickets off;

ssl_protocols TLSv1.2 TLSv1.3;
ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384;
ssl_prefer_server_ciphers on;

ssl_stapling on;
ssl_stapling_verify on;
resolver 8.8.8.8 8.8.4.4 valid=300s;
resolver_timeout 30s;

add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
add_header X-Frame-Options SAMEORIGIN;
add_header X-Content-Type-Options nosniff;
```


That sums it up as a whole for those snippets.



### Configure Odoo Website on Nginx

Okay, please make sure right from now to change all occurrences of `example.com` with your own domain.

```
sudo nano /etc/nginx/sites-available/example.com
```


Given the above, please insert the following inside the config file created:

```
server {
    listen 80;

    server_name example.com;

    root /var/www/html;
    index index.nginx-debian.html;

    include snippets/letsencrypt.conf;

    location / {
        try_files $uri $uri/ =404;
    }
}
```


Well, now lets create another server block for production purposes, that's because the first one will only be used to generate the **SSL Certificate** and thus removed.

```
sudo nano /etc/nginx/sites-available/example.com.production
```


As a result, please insert the following inside the config file created:

```
# Odoo Servers
upstream odoo {
 server 127.0.0.1:8069;
}

upstream longpolling {
 server 127.0.0.1:8072;
}

# HTTP -> HTTPS
server {
    listen 80;
    server_name www.example.com example.com;

    include snippets/letsencrypt.conf;
    return 301 https://example.com$request_uri;
}

# WWW -> NON WWW
server {
    listen 443 ssl http2;
    server_name www.example.com;

    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/example.com/chain.pem;
    include snippets/ssl.conf;
    include snippets/letsencrypt.conf;

    return 301 https://example.com$request_uri;
}

server {
    listen 443 ssl http2;
    server_name example.com;

    proxy_read_timeout 720s;
    proxy_connect_timeout 720s;
    proxy_send_timeout 720s;

    # Proxy headers
    proxy_set_header X-Forwarded-Host $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Real-IP $remote_addr;

    # SSL parameters
    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/example.com/chain.pem;
    include snippets/ssl.conf;
    include snippets/letsencrypt.conf;

    # log files
    access_log /var/log/nginx/odoo.access.log;
    error_log /var/log/nginx/odoo.error.log;

    # Handle longpoll requests
    location /longpolling {
        proxy_pass http://longpolling;
    }

    # Handle direct requests
    location / {
       proxy_redirect off;
       proxy_pass http://odoo;
    }

    # Cache static files
    location ~* /web/static/ {
        proxy_cache_valid 200 90m;
        proxy_buffering on;
        expires 864000;
        proxy_pass http://odoo;
    }

    # Gzip
    gzip_types text/css text/less text/plain text/xml application/xml application/json application/javascript;
    gzip on;
}
```


Last, you need to enable the web server block we have just created.

```
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
sudo service nginx reload
```


That's it for this part. Go next!



## Generate SSL Certificate from Let's Encrypt

**Let’s Encrypt** is a free, automated, and open certificate authority (CA), run for the public’s benefit. What should we care about? It will enable the SSL connection on Nginx for us once we run a few commands.



### Create SSL Certificate

```
sudo certbot certonly --agree-tos --email yourname@gmail.com --webroot -w /var/lib/letsencrypt/ -d example.com -d www.example.com
```



### Enable Odoo Website for Production

```
sudo rm -rf /etc/nginx/sites-available/example.com
sudo mv /etc/nginx/sites-available/example.com.production /etc/nginx/sites-available/example.com
sudo service nginx reload
sudo service odoo restart
```



### Automate Certificate Renewal

```
sudo nano /etc/letsencrypt/renewal/example.com.conf
```


Given the above, please insert the following line right below `[renewalparams]` inside the config file:

```
renew_hook = systemctl reload nginx
```

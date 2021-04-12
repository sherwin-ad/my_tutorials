# Installing ERPNext in Ubuntu 20.04

# 1. Get a Server

Let’s start with Renting a VPS from AWS / DigitalOcean, Linode or from someone else. Or simply virtualhost your computer and install a ubuntu.

This tutorial is aimed to install ERPNext and point a public domain to it. Please point your domain A record to installation server in order to achieve that.

# 2. Update and upgrade your system

```
sudo apt update -y && sudo apt upgrade -y
```

# 3. Configure Firewall

Erpnext requires 22,25,143,80,443,3306,8000 ports. We need to allow these ports in firewall.

```
sudo ufw allow 22,25,143,80,443,3306,8000/tcp 
sudo ufw enable
```

# 4. Update Locales

Character encoding and keyboard mapping will affect ERPNext installation and deployments. It’s better to fine tune it.

To Configure:

```
sudo localectl set-keymap us && sudo localectl set-locale LANG=en_US.utf8
```

We also need to modify /**etc/environment** file. To do that

```
sudo nano /etc/environment
```

And paste the the following content to it:

```
LC_ALL=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
LANG=en_US.UTF-8
```

Save the changes (Ctrl + O).

Reboot your system

```
sudo reboot
```

# 5. Install MariaDB and configure it.

```
sudo apt install mariadb-server
sudo apt install python3-mysqldb libmysqlclient-dev
sudo systemctl enable mariadb
sudo mysql_secure_installation
```

Then Open **/etc/mysql/mariadb.conf.d/mariadb.cnf** and paste the following ERPNext default configuration template into it.

```
[mysqld]# GENERAL #
user = mysql
default-storage-engine = InnoDB
socket = /var/lib/mysql/mysql.sock
pid-file = /var/lib/mysql/mysql.pid# MyISAM #
key-buffer-size = 32M
myisam-recover = FORCE,BACKUP# SAFETY #
max-allowed-packet = 256M
max-connect-errors = 1000000
innodb = FORCE# DATA STORAGE #
datadir = /var/lib/mysql/# BINARY LOGGING #
log-bin = /var/lib/mysql/mysql-bin
expire-logs-days = 14
sync-binlog = 1# REPLICATION #
server-id = 1# CACHES AND LIMITS #
tmp-table-size = 32M
max-heap-table-size = 32M
query-cache-type = 0
query-cache-size = 0
max-connections = 500
thread-cache-size = 50
open-files-limit = 65535
table-definition-cache = 4096
table-open-cache = 10240# INNODB #
innodb-flush-method = O_DIRECT
innodb-log-files-in-group = 2
innodb-log-file-size = 512M
innodb-flush-log-at-trx-commit = 1
innodb-file-per-table = 1
innodb-buffer-pool-size = 5462M
innodb-file-format = barracuda
innodb-large-prefix = 1
collation-server = utf8mb4_unicode_ci
character-set-server = utf8mb4
character-set-client-handshake = FALSE
max_allowed_packet = 256M# LOGGING #
log-error = /var/lib/mysql/mysql-error.log
log-queries-not-using-indexes = 0
slow-query-log = 1
slow-query-log-file = /var/lib/mysql/mysql-slow.log# CONNECTIONS #pid-file = /var/run/mysqld/mysqld.pid
socket = /var/run/mysqld/mysqld.sock
bind-address = 0.0.0.0[mysql]
default-character-set = utf8mb4[mysqldump]
max_allowed_packet=256M
```

Then, Restart mariadb

```
sudo systemctl restart mariadb
```

# 6. Install dependencies

```
sudo DEBIAN_FRONTEND=noninteractive apt install -y curl build-essential python3-testresources python3-setuptools python3-dev libffi-dev python3-pip libcurl4 dnsmasq fontconfig git htop libcrypto++-dev libfreetype6-dev liblcms2-dev libwebp-dev libxext6 libxrender1 libxslt1-dev libxslt1.1 libffi-dev ntpdate postfix python3-dev python-tk screen vim xfonts-75dpi xfonts-base zlib1g-dev apt-transport-https libsasl2-dev libldap2-dev libcups2-dev pv libjpeg8-dev libtiff5-dev tcl8.6-dev tk8.6-dev libdate-manip-perl logwatch
```

Next, upgrade pip tools

```
sudo -H python3 -m pip install --upgrade setuptools cryptography psutil
```

Install Nodejs and yarn

```
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
sudo apt install nodejs -y
sudo npm install -g yarn
```

ERPNext requires wkhtmltopdf version 0.12.5 to generate pdfs. We can install it with:

```
cd /tmpwget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.debsudo dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.debsudo cp /usr/local/bin/wkhtmlto* /usr/bin/sudo chmod a+x /usr/bin/wk*#test
wkhtmltopdf -V
```

Install Redis

```
sudo apt install redis-server
sudo systemctl enable redis-server
sudo service redis-server start
```

# 7. Create User and login in

```
sudo adduser bench
sudo usermod -aG sudo bench
su - bench
```

All commands from now on should be run as new user.

# 8. Install Frappe Bench

Clone frappe-bench repo first:

```
git clone https://github.com/frappe/bench /home/bench/.bench --depth 1 --branch master
```

Install Bench

```
sudo pip3 install -e /home/bench/.bench
```

Extend Ubuntu’s file watch limit,

```
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```

Initialise Frappe

```
bench init /home/bench/frappe-bench --frappe-path https://github.com/frappe/frappe --frappe-branch version-12 --python python3
```

Don’t mind the errors and warnings you get.

# 9. Installing ERPNext 12

```
cd ~/frappe-bench
```

Install some libraries

```
./env/bin/pip install numpy==1.18.5 && ./env/bin/pip install pandas==0.24.2
```

Please wait for some minutes to complete installing Numpy and Pandas. It may take upto 20 minutes.

```
bench get-app erpnext https://github.com/frappe/erpnext --branch version-12
```

Create new site

```
bench new-site foo.bar
```

Replace **foo.bar** with you domain name. You’ll be then prompted to type your MySQL root password and Site Administrator Password.

Install ERPNext into newly created site.

```
bench --site foo.bar install-app erpnext
```

Replace **foo.bar** with your site domain

Start bench

```
bench start
```

Wait for few moments to Rebuild all frontend elements

Woohoo!. We’ve successfully installed ERPNext.

# 10. Configure ERPNext

Now we can configure our installation. You can access your installed ERPNext from localhost:8000 or remote_ip_address:8000

You’ll get a configuration prompt in browser. Complete it.

# 11. Set Up for Production

Although your ERPNext 12 application is ready, the system as a whole is not yet prepared for production. We need Nginx and Supervisor to host it.

Go to working directory

```
cd ~/frappe-bench
```

Turn on Multi-tenancy if you want by:

```
bench config dns_multitenant on
```

And, setup production by:

```
sudo bench setup production
```

You can now stop all processes by:

```
sudo supervisorctl stop all
```

And start process by:

```
sudo supervisorctl start all
```

That’all.

Please comment If you’ve encountered any problem during installation. I’ll try to reply as soon as possible.
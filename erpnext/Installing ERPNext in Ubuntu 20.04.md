# Installing ERPNext in Ubuntu 20.04

## Prerequisites

- [One Ubuntu 20.04 server](https://www.digitalocean.com/products/linux-distribution/ubuntu/) with at least 4 GB of RAM and a non-root `sudo` user. You can set up your server and user by following [our Ubuntu 20.04 initial server setup guide](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04).

**Note:** When choosing your server’s specifications, keep in mind that ERP systems are resource-intensive.  This guide calls for one server with 4 GB of RAM, which is sufficient  for basic use cases, but specific hardware requirements may vary  depending on the number of users as well as your business size.

- A fully registered domain name with an A record pointed to your server. [If you are using a DigitalOcean Droplet then you can follow this guide to properly set up your DNS](https://www.digitalocean.com/community/tutorials/how-to-point-to-digitalocean-nameservers-from-common-domain-registrars). This tutorial will use `your_domain` throughout.

## Step 1 — Configuring the Firewall

Although configuring a firewall for development is optional, for production it is a mandatory security practice.

You will need to open the following ports on your ERPNext server:

- `80/tcp` and `443/tcp` for HTTP and HTTPS respectively
- `3306/tcp` for MariaDB connection (recommended only if you need remote access to database)
- `143/tcp` and `25/tcp` for IMAP and STMP respectively
- `22/tcp` for SSH (if you have not already enabled `OpenSSH` in your UFW settings)
- `8000/tcp` for testing your platform before deploying to production

To open multiple ports at once you can use the following command:

```bash
sudo ufw allow 22,25,143,80,443,3306,8000/tcp
```

 

Alternatively, you can allow connections from specific IP addresses on specific ports using this command:

```bash
sudo ufw allow from server_IP to any port port_number
```

 

After opening all necessary ports enable the firewall:

```bash
sudo ufw enable
```

 

Now confirm the status of your firewall:

```bash
sudo ufw status
```

 

UFW will output a list of your enabled rules. Make sure ERPNext’s necessary ports are open:

```
OutputStatus: active

To                         Action      From
--                         ------      ----
22,25,80,143,443,3306,8000/tcp  ALLOW       Anywhere
22,25,80,143,443,3306,8000/tcp (v6) ALLOW       Anywhere (v6)
```

For more information regarding UFW’s configuration, [consult our guide on how to set up a firewall with UFW on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-18-04).

Setting up a proper firewall is the first of two preliminary steps.  Now you will configure keyboard mapping and character encoding on your  server.

## Step 2 — Configuring Locales

It’s highly recommended that you configure keyboard mapping for the  console as well as the language and the character encoding on your host. This is necessary to avoid possible issues during the ERPNext 12  installation process. Take note that this configuration has nothing to  do with the UI language on your actual ERPNext platform, but with the  system locale configuration.

First, update your server:

```bash
sudo apt update
```

 

Now configure keymap, language, and character encoding:

```bash
sudo localectl set-keymap us && sudo localectl set-locale LANG=en_US.utf8
```

 

The `localectl` utility is used by Ubuntu 20.04 and other  Linux distributions to control and change system-wide locale and  keyboard layout settings before the user logs in, which is exactly what  ERPNext 12 requires.

You will also need to add the following lines to your `/etc/environment` file. Use `nano` or your preferred text editor to open the file:

```bash
sudo nano /etc/environment
```

 

Now add the following content:

/etc/environment

```ini
LC_ALL=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
LANG=en_US.UTF-8
```

 

Save and close the file.

Reboot your server to apply all changes:

```bash
sudo reboot
```

 

Give your server a few minutes to reboot and then use `ssh` to reenter your instance. You are now ready to install your database.

## Step 3 — Installing MariaDB

Now you will add MariaDB to your server stack. ERPNext 12 requires  MariaDB 10.2+ for proper operation. Because Ubuntu 20.04 includes  MariaDB 10.3 in its official repositories you can install this version  using the `apt` command:

```bash
sudo apt install mariadb-server
```

 

Alternatively, if prefer a newer MariaDB version, you can follow [Step 3 of our guide on how to install an ERPNext Stack on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-an-erpnext-stack-on-ubuntu-18-04#step-3-—-installing-mariadb-104). This will guide you through MariaDB’s online repository wizard, which will help you install the newest version—MariaDB 10.5.

After installing `mariadb-server`, install the following packages:

```bash
sudo apt install python3-mysqldb libmysqlclient-dev
```

 

ERPNext 12 is a Python application and thus it requires the `python3-mysqldb` library for database management. `libmysqlclient-dev` is required to access certain MariaDB developer features.

Next, add an extra layer of security to the MariaDB server by running the `mysql_secure_installation` script:

```bash
sudo mysql_secure_installation
```

 

The `mysql_secure_installation` script will prompt you with several questions:

- The first prompt will ask you about the **root** password, but since there is no password configured yet, press `ENTER`.
- Next, when asked about changing the MariaDB **root** password, answer `N`. Using the default password along with Unix authentication is the recommended setup for Ubuntu-based systems because the **root** account is closely related to automated system maintenance tasks.
- The remaining questions have to do with removing the anonymous database user, restricting the **root** account to log in remotely on localhost, removing the test database, and reloading privilege tables. It is safe to answer `Y` to all those questions.

After completing the `mysql_secure_installation` script, MariaDB will start running using its default configuration. The standard ERPNext installation uses MariaDB’s **root** user for all database operations. While that approach may be convenient on single server setups, it is not considered a good security practice. Therefore, in the next section you will learn how to avoid this issue  by creating a new user with special privileges.

### Creating a MariaDB Super Admin User

ERPNext expects to use MariaDB’s **root** user for  managing database connections, but this is not always ideal. To overcome this limitation and let a non-root user manage MariaDB you will now  manually create a database named after the user. Then you will be able  to assign special privileges to the new user to drive ERPNext database  operations.

Open up the MariaDB prompt:

```bash
sudo mysql
```

 

Now create a new database named after the user you want to assign for MariaDB connections. This tutorial will use `sammy` but you can choose a different name:

```bash
CREATE DATABASE sammy;
```

 

Confirm that the database was created using this SQL statement:

```bash
SHOW DATABASES;
```

 

You will see an output similar to this:

```
Output+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sammy              |
+--------------------+
```

Now create the MariaDB user `sammy` with privileges similar to **root** and then give the user a strong password of your choice. Keep the password in a secure place; you will need it later:

```bash
GRANT ALL PRIVILEGES ON *.* TO 'sammy'@'%' IDENTIFIED BY 'mariadb_password' WITH GRANT OPTION;
```

 

Now confirm both the user creation and the new user’s privileges:

```bash
SELECT host, user, Super_priv FROM mysql.user;
```

 

You will see an output like this:

```
Output+-----------+-------+------------+
| Host      | User  | Super_priv |
+-----------+-------+------------+
| localhost | root  | Y          |
| localhost | mysql | Y          |
| %         | sammy| Y         |
+-----------+-------+------------+
3 rows in set (0.001 sec)
```

Now flush privileges to apply all changes:

```bash
FLUSH PRIVILEGES;
```

 

Once you finish, exit the session:

```bash
exit
```

 

Now that you have created a database user you only need to fine-tune  MariaDB to ensure proper ERPNext 12 operation. Fortunately, the ERPNext  team provides an excellent configuration template that you will use as a starting point for your implementation. In the next section, you will  learn how to properly configure the MariaDB database using that  template.

## Step 4 — Configuring MariaDB for ERPNext

With MariaDB installed and secured it’s time to fine-tune it for ERPNext connections.

First, stop `mariadb.service`:

```bash
sudo systemctl stop mariadb
```

 

Now use `nano` or your favorite text editor to create a MariaDB configuration file called `mariadb.cnf`:

```bash
sudo nano /etc/mysql/mariadb.conf.d/mariadb.cnf
```

 

Now add ERPNext’s official configuration template:

/etc/mysql/mariadb.conf.d/mariadb.cnf

```ini
[mysqld]

# GENERAL #
user                           = mysql
default-storage-engine         = InnoDB
socket                         = /var/lib/mysql/mysql.sock
pid-file                       = /var/lib/mysql/mysql.pid

# MyISAM #
key-buffer-size                = 32M
myisam-recover                 = FORCE,BACKUP

# SAFETY #
max-allowed-packet             = 256M
max-connect-errors             = 1000000
innodb                         = FORCE

# DATA STORAGE #
datadir                        = /var/lib/mysql/

# BINARY LOGGING #
log-bin                        = /var/lib/mysql/mysql-bin
expire-logs-days               = 14
sync-binlog                    = 1

# REPLICATION #
server-id                      = 1

# CACHES AND LIMITS #
tmp-table-size                 = 32M
max-heap-table-size            = 32M
query-cache-type               = 0
query-cache-size               = 0
max-connections                = 500
thread-cache-size              = 50
open-files-limit               = 65535
table-definition-cache         = 4096
table-open-cache               = 10240

# INNODB #
innodb-flush-method            = O_DIRECT
innodb-log-files-in-group      = 2
innodb-log-file-size           = 512M
innodb-flush-log-at-trx-commit = 1
innodb-file-per-table          = 1
innodb-buffer-pool-size        = 5462M
innodb-file-format             = barracuda
innodb-large-prefix            = 1
collation-server               = utf8mb4_unicode_ci
character-set-server           = utf8mb4
character-set-client-handshake = FALSE
max_allowed_packet             = 256M

# LOGGING #
log-error                      = /var/lib/mysql/mysql-error.log
log-queries-not-using-indexes  = 0
slow-query-log                 = 1
slow-query-log-file            = /var/lib/mysql/mysql-slow.log

# CONNECTIONS #

pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
bind-address    = 0.0.0.0

[mysql]
default-character-set = utf8mb4

[mysqldump]
max_allowed_packet=256M
```

 

Save and close the file. For more detailed information about these configurations, [review this template file on ERPNext’s Github repo](https://github.com/frappe/erpnext/wiki/MySQL-configuration-file). This is a useful starting point for exploring these options.

The configuration file, `/etc/mysql/mariadb.conf.d/mariadb.cnf`, complements and also overrides a few values included in the default MariaDB configuration located at `/etc/mysql/my.cnf`. This file gives you a curated template that greatly enhances database  performance for ERPNext. Keep in mind, however, that while this template is a great starting point nothing prevents you from improving MariaDB’s performance even further by adjusting these parameters to fit your  needs.

### Testing the MariaDB Connection

Since ERPNext relies on the database connection for almost all of its internal operations, it is a good idea to test the connection before  continuing.

Start `mariadb.service`:

```bash
sudo systemctl start mariadb
```

 

To test the connection you can use the following command. Remember to replace `sammy` and `mariadb_password` with your credentials:

```bash
mysql --user sammy --password mariadb_password --host=localhost --protocol=tcp --port=3306 test
```

 

You will see an output showing MariaDB’s basic help content and several parameters. This means your connection was successful:

```
Outputmysql  Ver 15.1 Distrib 10.4.13-MariaDB, for debian-linux-gnu (x86_64) using readline 5.2
Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Usage: mysql [OPTIONS] [database]

Default options are read from the following files in the given order:
/etc/my.cnf /etc/mysql/my.cnf ~/.my.cnf

...

  --ssl-verify-server-cert
                      Verify server's "Common Name" in its cert against
                      hostname used when connecting. This option is disabled by
                      default.
  -t, --table         Output in table format.
  --tee=name          Append everything into outfile. See interactive help (\h)
                      also. Does not work in batch mode. Disable with
                      --disable-tee. This option is disabled by default.
  -u, --user=name     User for login if not current user.
  -U, --safe-updates  Only allow UPDATE and DELETE that uses keys.
  -U, --i-am-a-dummy  Synonym for option --safe-updates, -U.
  -v, --verbose       Write more. (-v -v -v gives the table output format).

...

max-join-size                     1000000
secure-auth                       FALSE
show-warnings                     FALSE
plugin-dir                        (No default value)
default-auth                      (No default value)
binary-mode                       FALSE
connect-expired-password          FALSE
```

If you need to make any adjustments to MariaDB’s settings or fix any  errors, remember to reload the service using the following command:

```bash
sudo systemctl restart mariadb
```

 

Once you are done, enable MariaDB:

```bash
sudo systemctl enable mariadb
```

 

Now that you have tested the database connection, you can continue with the installation of your ERPNext application.

## Step 5 — Setting Up ERPNext 12

Now that your database backend is ready you can continue setting up  your ERPNext web application. In this section, you will learn how to  install and configure all components required by ERPNext 12 and then  install the application itself.

Start by preparing the server with all the system packages required  by ERPNext 12. Install system-wide dependencies using the following  command:

```bash
sudo DEBIAN_FRONTEND=noninteractive apt install -y curl build-essential python3-testresources python3-setuptools python3-dev libffi-dev python3-pip libcurl4 dnsmasq fontconfig git htop libcrypto++-dev libfreetype6-dev liblcms2-dev libwebp-dev libxext6 libxrender1 libxslt1-dev libxslt1.1 libffi-dev ntpdate postfix python3-dev python-tk screen vim xfonts-75dpi xfonts-base zlib1g-dev apt-transport-https libsasl2-dev libldap2-dev libcups2-dev pv libjpeg8-dev libtiff5-dev tcl8.6-dev tk8.6-dev libdate-manip-perl logwatch
```

 

The `DEBIAN_FRONTEND=noninteractive` variable has been  passed to the installation command in order to avoid Postfix prompts.  For detailed information regarding Postfix configuration please read our guide on [How To Install and Configure Postfix on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-on-ubuntu-20-04)

Next, update `pip3`, which is Python’s standard package manager, and then install the latest versions of three additional Python modules:

```bash
 sudo -H python3 -m pip install --upgrade setuptools cryptography psutil
```

 

[`setuptools` facilitates the installation and upgrading of Python packages](https://pypi.org/project/setuptools/), [`cryptography` adds encryption capabilities to your stack](https://pypi.org/project/cryptography/), and [`psutil` aids with system monitoring](https://pypi.org/project/psutil/). Now that you have installed all necessary global dependencies, you will now install all the services and libraries required by ERPNext 12.

### Setting Up Node.js and Yarn

ERPNext 12 can work with version 8+ of the Node.js server  environment. In fact, at the time of this writing, the official ERPNext `easy_install` script uses Node 8. But from a security perspective, it’s advisable to  install a newer version because Node 8 reached its End Of Life (EOL) in  2020 and thus will not receive any more security patches. At the time of this writing, Ubuntu 20.04 contains version 10.19 of Node.js. Although  this version is still maintained, for similar reasons (EOL in less than a year) it’s highly advisable to avoid using it. For this guide, Node.js  version 12 LTS will be installed along with the corresponding `npm` and `yarn` package managers. Please note that the Frappe framework uses `yarn` to install dependencies. If you decide to use an alternative  installation method then make sure that you end up with version 1.12+ of `yarn` running in your system.

Add the NodeSource repository to your system:

```bash
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
```

 

Now you can inspect the contents of the downloaded script:

```bash
sudo nano nodesurce_setup.sh
```

 

Once you are satisfied with the script’s contents you can run the script:

```bash
sudo bash nodesource_setup.sh
```

 

This script will automatically update the `apt` list. Now you can install `nodejs` on your server:

```bash
sudo apt install nodejs
```

 

Next, install `yarn` globally using the `npm` package manager:

```bash
sudo npm install -g yarn
```

 

Now that you have installed Node you can continue to configure `wkhtmltopdf` for your platform.

ERPNext uses the `wkhtmltopdf` open source tool to convert HTML content into PDF using the Qt WebKit rendering engine. This  feature is mostly used for printing invoices, quotations, and other  reports. In the case of ERPNext 12, a specific version of `wkhtmltopdf` is required, `0.12.5` with patched Qt.

To install `wkhtmltopdf`, start by switching to a suitable directory to download the package, in this case `/tmp`:

```bash
cd /tmp
```

 

Download the appropriate `wkhtmltopdf` version and package for Ubuntu 20.04 from the project’s page:

```bash
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
```

 

Now install the package using the `dpkg` tool:

```bash
sudo dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.deb
```

 

Next, copy all relevant executables to your `/usr/bin/` directory:

```bash
sudo cp /usr/local/bin/wkhtmlto* /usr/bin/
```

 

Once the files are in place, change their permissions to make them executable:

```bash
sudo chmod a+x /usr/bin/wk*
```

 

Now that `wkhtmltopdf` is properly installed we will add Redis to our database stack.

### Installing Redis

ERPNext 12 uses Redis to enhance MariaDB’s performance. Specifically, [Redis assists with caching](https://discuss.erpnext.com/t/why-erpnext-need-redis/6194).

First, install Redis from the official Ubuntu 20.04 repository:

```bash
sudo apt install redis-server
```

 

Then enable Redis on startup:

```bash
sudo systemctl enable redis-server
```

 

Now that you have added Redis to your stack let’s take a moment to  summarize what you have accomplished so far. Up to this point, you have  installed all the major components required by ERPNext 12, which  include:

- A MariaDB database backend
- The Node.js JavaScript server environment
- The Yarn package manager
- A Redis database cache
- The `wkhtmltopdf` PDF documents generator

Whether you are installing the ERP system for development or for  production, you are now ready for the next step, which is installing the Frappe full-stack framework and the actual ERPNext 12 web application.

## Step 6 — Installing Frappe Bench CLI

Now that you have installed all of ERPNext’s stack requirements you can unleash the flexibility of Frappe’s `bench` command-line utility. The `bench` CLI was designed with the purpose of assisting users in the process of  installing, setting up, and managing applications like ERPNext that are  based on the Frappe Framework. In the coming sections, you will install  the `bench` CLI and then use it to complete the process of setting up ERPNext 12.

Make sure that the Frappe user (in this case `sammy`) has the proper rights on its `home` directory:

```bash
sudo chown sammy -R /home/sammy
```

 

Now clone the `frappe/bench` repository to your home directory. Remember to replace `sammy` with your system username:

```bash
git clone https://github.com/frappe/bench /home/sammy/.bench --depth 1 --branch master
```

 

Install the `bench` CLI:

```bash
sudo pip3 install -e /home/sammy/.bench
```

 

This guide is assuming that you are installing ERPNext 12 for testing/production scenarios and thus that you are using the `master` branch. But if your intention is to develop applications or custom ERPNext modules, then the `develop` branch might be a better option. In either case, you are now prepared  to install the Frappe Framework. This will be your final step before  installing ERPNext itself.

### Setting Up Frappe Framework Environment

In this section, you will create a [Frappe environment](https://frappe.io/docs/user/en/architecture) using the `bench` CLI.

During Frappe’s installation you may exceed Ubuntu’s file watch  limit, which by default is set to 8192. To avoid this issue set a higher limit using the following command:

```bash
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```

 

The `tee` command will append the contents of your `echo` command to the called file while also printing the output to your console.

Next, initialize Frappe Framework 12. Replace Sammy with your system username:

```bash
bench init /home/sammy/frappe-bench --frappe-path https://github.com/frappe/frappe --frappe-branch version-12 --python python3
```

 

During execution you may see one error about your path, along with  several warnings. Let the process continue until the end. Once it’s  finished, you will see an output similar to the following one,  indicating that your environment was successfully created:

```
Output...
Done in 82.23s.
INFO:bench.utils:setting up backups
no crontab for sammy
SUCCESS: Bench /home/sammy/frappe-bench initialized
```

**Note:** The `bench init` process could halt if a `spawn ENOMEM` error is encountered. This error is caused when your system runs out of memory. You must fix the issue before continuing, either by installing  more physical memory or allocating SWAP space.

Let’s take a closer look at the command used to create the environment:

- `/home/sammy/frappe-bench` is the path where the Frappe Framework, the websites, and associated applications will be installed. A new directory, called `frappe-bench` in this example, will be created to accommodate all necessary files.
- `--frappe-path` points to Frappe repository, which in this case is the official Github repository.
- `--frappe-branch` is the Frappe version to be installed. Because you want to install ERPNext 12, the chosen version is Frappe 12.
- `--python` is the Python version that will be used. ERPNext 12 requires Python 3.6+. Prior versions, however, still use Python 2.7.

For more information regarding `bench` CLI commands please refer to the [Bench Commands Cheatsheet](https://frappe.io/docs/user/en/bench/resources/bench-commands-cheatsheet.html).

The flexibility offered by the Frappe framework goes way beyond using isolated environments. You can also create different websites and  install applications into them.

## Step 7 — Installing the ERPNext 12 Web Application

In this section, you will set up a Frappe-based site and then install the ERPNext 12 application on it.

Change to the directory where Frappe was initialized.

```bash
cd /home/sammy/frappe-bench
```

 

Before continuing, you will need to install specific versions of Python libraries `numpy` and `pandas` into the Frappe virtual environment. Install these packages using the following command:

```bash
./env/bin/pip install numpy==1.18.5 && ./env/bin/pip install pandas==0.24.2
```

 

At this point the installation might halt for about 10 to 20 minutes while displaying this message:

```
Output...
Building wheel for pandas (setup.py) ... -
```

This has to do with a [bug](https://github.com/pandas-dev/pandas/issues/34753) related to `pandas` and Ubuntu 20.04, which, at the time of writing, is still rather new.  Nevertheless the packages will build, and once they complete you will  see an output like this:

```
Output...
Successfully built pandas
Installing collected packages: pandas
Successfully installed pandas-0.24.2
```

Now, you can continue with the installation. Download ERPNext 12 from its repository using the `bench` CLI:

```bash
bench get-app erpnext https://github.com/frappe/erpnext --branch version-12
```

 

Next, create the new site, replacing `your_domain` with the domain that you have associated with this server’s IP:

```bash
bench new-site your_domain --admin-password 'erpnext_admin_password' --mariadb-root-username sammy --mariadb-root-password 'mariadb_password'
```

 

Let’s take a moment to review the options used in the command above:

- `bench new-site` creates a new site based on the Frappe Framework.
- `your_domain` is the name for the new site. Make sure that your domain’s DNS has an A record pointing at your server’s IP.
- `erpnext_admin_password` is the desired password for ERPNext’s **Administrator** user. Keep this password in a safe place—you will need it shortly.
- `mariadb_password` is the password that you created at the beginning of the guide for the MariaDB user `sammy`.

Following this, install the ERPNext application onto the site:

```bash
bench --site your_domain install-app erpnext
```

 

Once the installation completes, you will have a working ERPNext 12 application. Now let’s test it using a `bench` command:

```bash
bench start
```

 

The above will initiate a real-time monitoring console showing you  various messages regarding the webserver and other services. Open a web  browser and navigate to `localhost:8000` (for local installations) or `your_domain:8000` (if you are using a remote server). You will see the ERPNext login  screen (we will proceed with login and setup in a later step, once we  have made our site production-ready).

After visiting your test deployment, return to your terminal and press `CTRL+C`. This will stop ERPNext and exit the monitoring console.

If your main goal is creating modules or modifying ERPNext 12, then  you could stop at this point. No more components are needed for  development purposes. However, if what you need is a production-ready  system that does not require a manual initialization, then you will need to install and configure a few additional components. This is your next step.

## Step 8 — Setting Up ERPNext 12 For Production

Although your ERPNext 12 application is ready, the system as a whole  is not yet prepared for production. To ensure ERPNext’s reliability and  security you will need to enable a few additional services:

- **Fail2ban** provides an extra layer of protection against brute force attempts from malicious users and bots.
- **Nginx** functions mainly as a web proxy, redirecting all traffic from port `8000` to port `80` (HTTP) or port `443` (HTTPS)
- **Supervisor** ensures that ERPNext’s key processes are constantly up and running, restarting them as necessary.

Up to this point, you have installed and configured ERPNext 12  manually, which has allowed you to customize the process to match any  particular use case. Nevertheless, for the rest of the production setup, you can leverage the convenience of the `bench` CLI and let it automate the installation and configuration of these remaining services.

Ensure you are in the Frappe working directory:

```bash
cd /home/sammy/frappe-bench
```

 

Now use the following command to finish setting up ERPNext 12 for production:

```bash
sudo bench setup production sammy --yes
```

 

The above will install and configure Nginx, Supervisor, and Fail2Ban and set `sammy` as the production environment owner.

The configuration files created by the `bench` command are:

- Two Nginx configuration files located at `/etc/nginx/nginx.conf` and `/etc/nginx/conf.d/frappe-bench.conf`
- One Fail2Ban proxy jail located at `/etc/fail2ban/jail.d/nginx-proxy.conf` and one filter located at `/etc/fail2ban/filter.d/nginx-proxy.conf`

These default configurations will suffice for this tutorial, but you  should feel free to explore and adjust these files to match your  requirements. You can stop all services by running:

```bash
sudo supervisorctl stop all
```

 

And then, once you are ready, you can restart your services:

```bash
sudo supervisorctl start all
```

 

Now you are ready to test your installation.

### Testing Your ERPNext 12 Installation

First of all, verify that key production services are running. Use the following `systemctl` command and then pipe it to `grep`:

```bash
systemctl list-unit-files | grep 'fail2ban\|nginx\|supervisor'
```

 

You will see an output like this:

```
Outputfail2ban.service                       enabled
nginx.service                          enabled
supervisor.service                     enabled
```

After confirming that everything is working as expected, you can test ERPNext 12 live on your server. Open your favorite browser and navigate your_domain, or whereever you are hosting your ERPNext 12 application.

After a few seconds, you should see the ERPNext 12 login screen. Use **Administrator** for the username (email) and the `erpnext_admin_password` you created previously for the password.

![ERPNext Login Screen](https://assets.digitalocean.com/articles/67031/erpnext_1.png)
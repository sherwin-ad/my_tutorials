# Install ERPNext v14 on Ubuntu 22.04

## **PRE-REQUISITES:**

- Operating System: Linux Ubuntu 22.04 LTS
- Minimum Recommended Hardware: 2 CPU | 2 GB RAM | 10 GB Disk
- Root shell access to the server (via SSH)

## ![:one:](https://discuss.frappe.io/images/emoji/twitter/one.png?v=12) **SERVER SETUP**

------

**1.1 Login to the server as root user**

**1.2 Setup correct date and timezone** (important step as it impacts ERPNext usage)

Check the server’s current timezone

```bash
date
```

Set correct timezone as per your region

```cpp
timedatectl set-timezone "Asia/Kolkata"
```

**1.3 Update & upgrade server packages**

```sql
sudo apt-get update -y
sudo apt-get upgrade -y
```

**1.4 Create a new user**
We create this user as a security measure to prevent root user access.
This user will be assigned admin permissions and will be used as the main Frappe Bench user

```css
sudo adduser [frappe-user]
usermod -aG sudo [frappe-user]
su [frappe-user] 
cd /home/[frappe-user]/
```

Note: Replace [frappe-user] with your username. Eg. sudo adduser myname

## ![:two:](https://discuss.frappe.io/images/emoji/twitter/two.png?v=12) **INSTALL REQUIRED PACKAGES**

------

Frappe Bench and ERPNext requires many packages to run smoothly. In this step we will install all the required packages for the system to work correctly.

Note: During the installation of these packages the server might prompt you to confirm if you want to continue installing the package [Y/n]. Just hit “y” on your keyboard to continue.

**2.1 Install GIT**

```csharp
sudo apt-get install git
```

Check if GIT is correctly installed by running `git --version`

**2.2 Install Python**

```csharp
sudo apt-get install python3-dev python3.10-dev python3-setuptools python3-pip python3-distutils
```

**2.3 Install Python Virtual Environment**

```csharp
sudo apt-get install python3.10-venv
```

Check if Python is correctly installed by running `python3 -V`

**2.4 Install Software Properties Common** (for repository management)

```csharp
sudo apt-get install software-properties-common
```

**2.5 Install MariaDB** (MySQL server)

```undefined
sudo apt install mariadb-server mariadb-client
```

Check if MariaDB is correctly installed by running `mariadb --version`

**2.6 Install Redis Server**

```csharp
sudo apt-get install redis-server
```

**2.7 Install other necessary packages** (for fonts, PDFs, etc)

```csharp
sudo apt-get install xvfb libfontconfig wkhtmltopdf
sudo apt-get install libmysqlclient-dev
```

## ![:three:](https://discuss.frappe.io/images/emoji/twitter/three.png?v=12) **CONFIGURE MYSQL SERVER**

------

**3.1 Setup the server**

```undefined
sudo mysql_secure_installation
```

During the setup process, the server will prompt you with a few questions as given below. Follow the instructions to continue the setup;

- Enter current password for root: (Enter your SSH root user password)
- Switch to unix_socket authentication [Y/n]: Y
- Change the root password? [Y/n]: Y
  It will ask you to set new MySQL root password at this step. This can be different from the SSH root user password.
- Remove anonymous users? [Y/n] Y
- Disallow root login remotely? [Y/n]: N
  This is set as N because we might want to access the database from a remote server for using business analytics software like Metabase / PowerBI / Tableau, etc.
- Remove test database and access to it? [Y/n]: Y
- Reload privilege tables now? [Y/n]: Y

**3.2 Edit the MySQL default config file**

```bash
sudo vim /etc/mysql/my.cnf
```

Add the below code block at the bottom of the file;

```ini
[mysqld]
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci

[mysql]
default-character-set = utf8mb4
```

If you don’t know how to use VIM:

- Once the file is open, hit “i” key to start editing the file.
- After you’re done editing the file hit “Esc + :wq” to save the file

**3.3 Restart the MySQL server (for the config to take effect)**

```undefined
sudo service mysql restart
```

## ![:four:](https://discuss.frappe.io/images/emoji/twitter/four.png?v=12) **Instal CURL, Node, NPM and Yarn**

------

**4.1 Install CURL**

```undefined
sudo apt install curl
```

**4.2 Install Node**

```bash
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

source ~/.profile

nvm install 16.15.0
```

**4.3 Install NPM**

```csharp
sudo apt-get install npm
```

**4.4 Install Yarn**

```undefined
sudo npm install -g yarn
```

Check if Node is correctly installed by running `node --version`

## ![:five:](https://discuss.frappe.io/images/emoji/twitter/five.png?v=12) **INSTALL FRAPPE BENCH**

------

**5.1 Install Frappe Bench**

```undefined
sudo pip3 install frappe-bench
```

Check if Frappe Bench is correctly installed by running `bench --version`

**5.2 Initialize Frappe Bench**

```csharp
bench init --frappe-branch version-14 frappe-bench
```

**5.3 Go to Frappe Bench directory**
This will be the main directory from where we will be running all the commands.
The full path of this directory will be: /home/[frappe-user]/frappe-bench/

```bash
cd frappe-bench/
```

**5.4 Change user directory permissions**
This will allow execution permission to the home directory of the frappe user we created in step 1.4

```bash
chmod -R o+rx /home/[frappe-user]/
```

**5.5 Create a New Site**
We will use this as the default site where ERPNext and other apps will be installed.

```cpp
bench new-site site1.local
```

## ![:six:](https://discuss.frappe.io/images/emoji/twitter/six.png?v=12) **Install ERPNext and other Apps**

------

Finally, we’re at the last stage of the installation process!

**6.1 Download the necessary apps to our server**
Download the payments apps . This app is required during ERPNext installation

```csharp
bench get-app payments
```

Download the main ERPNext app

```sql
bench get-app --branch version-14 erpnext
```

Download the HR & Payroll app (optional)

```csharp
bench get-app hrms
```

Download the ecommerce integrations apps (optional)

```css
bench get-app ecommerce_integrations --branch main
```

Check if all the apps are correctly downloaded by running `bench version --format table`

**6.2 Install all the Apps**

Install the main ERPNext app

```css
bench --site site1.local install-app erpnext
```

Install the HR & Payroll app (optional)

```css
bench --site site1.local install-app hrms
```

Install the ecommerce integrations apps (optional)

```css
bench --site site1.local install-app ecommerce_integrations
```

## ![:seven:](https://discuss.frappe.io/images/emoji/twitter/seven.png?v=12) **SETUP PRODUCTION SERVER**

------

**7.1 Enable scheduler service**

```css
bench --site site1.local enable-scheduler
```

**7.2 Disable maintenance mode**

```cpp
bench --site site1.local set-maintenance-mode off
```

**7.3 Setup production config**

```css
sudo bench setup production [frappe-user]
```

**7.4 Setup NGINX web server**

```undefined
bench setup nginx
```

**7.5 Final server setup**

```css
sudo supervisorctl restart all
sudo bench setup production [frappe-user]
```

When prompted to save new/existing config files, hit “Y”

## ![:tada:](https://discuss.frappe.io/images/emoji/twitter/tada.png?v=12) **Ready to Go!**

You can now go to your server **[IP-address]:80** and you will have a fresh new installation of ERPNext ready to be configured!

If you are facing any issues with the ports, make sure to enable all the necessary ports on your firewall using the below commands;

```bash
sudo ufw allow 22,25,143,80,443,3306,3022,8000/tcp
sudo ufw enable
```



### For SSL configuration, you can run the following commands;

Before you begin, add an A record on your domain DNS and point it to the ERPN server IP address.

```bash
cd /home/[frappe-user]/frappe-bench/

bench config dns_multitenant on

bench setup add-domain [subdomain.yourdomain.com] --site [site-name]

bench setup nginx 
sudo service nginx reload

sudo snap install core
sudo snap refresh core
sudo snap install --classic certbot

sudo ln -s /snap/bin/certbot /usr/bin/certbot

sudo certbot --nginx
```
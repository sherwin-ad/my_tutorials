[TOC]

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






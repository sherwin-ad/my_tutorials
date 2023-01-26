# OPEN HRMS

## Install PostgreSQL

```
sudo apt-get update && sudo apt-get upgrade
```

Import the PostgreSQL signing key.

```
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O- | sudo apt-key add -
```

Add the PostgreSQL repository to`/etc/apt/sources.list.d/postgresql.list file.`

```
echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql.list
```

update the repository index.

```
sudo apt update
```

Install the PostgreSQL 10

```
sudo apt install -y postgresql-10
```

Enable PostgreSQL on Startup

```
sudo systemctl enable postgresql
```

`sudo su postgres`------> to get into the postgres here you can type following to create a new user openhrms and assign role

```
createuser --createdb --username postgres --no-createrole --no-superuser --pwprompt openhrms
```

when prompted for a password type openhrms to see the postgres interpreter type 'psql' type --------> ALTER USER openhrms WITH SUPERUSER; to change it to super user the \du ----> for the list of users (openhrms can be seen) to exit use '\q' then 'exit' again to exit from the postgres

##  Open HRMS Setup

Configure your Open HRMS web application to work with the PostgreSQL database backend.

Create the Open HRMS User

In order to separate OpenHRMS from other services, create a new Open HRMS system user to run its processes:

```
sudo adduser --system --home=/opt/openhrms --group openhrms
```



Configure Logs

The examples in this guide use a separate file for logging Open HRMS activity:

```
sudo mkdir /var/log/openhrms 
```

Install Open HRMS

Use Git to clone the Odoo files onto your server:

```
sudo git clone https://www.github.com/odoo/odoo --depth 1 --branch 13.0 --single-branch /opt/openhrms
sudo git clone https://github.com/CybroOdoo/OpenHRMS.git --depth 1 --branch 13.0 --single-branch /opt/openhrms/openhrms     
```



Install Odoo 13 specific Python dependencies:

```

```
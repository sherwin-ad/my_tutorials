

[TOC]

# 1. Install the dependencies

```bash
sudo add-apt-repository ppa:ubuntugis/ppa
sudo apt update -y
```



```
# Install packages from GeoNode core
sudo apt install -y --allow-downgrades build-essential \
    python3-gdal=3.3.2+dfsg-2~focal2 gdal-bin=3.3.2+dfsg-2~focal2 libgdal-dev=3.3.2+dfsg-2~focal2 \
    python3.8-dev python3.8-venv virtualenvwrapper \
    libxml2 libxml2-dev gettext libmemcached-dev zlib1g-dev \
    libxslt1-dev libjpeg-dev libpng-dev libpq-dev \
    software-properties-common build-essential \
    git unzip gcc zlib1g-dev libgeos-dev libproj-dev \
    sqlite3 spatialite-bin libsqlite3-mod-spatialite libsqlite3-dev

# Install Openjdk
sudo apt install openjdk-8-jdk-headless default-jdk-headless -y
sudo update-java-alternatives --jre-headless --jre --set java-1.8.0-openjdk-amd64

# If the update-alternatives command does not work, try below command and select the number coinciding with openjdk-8-jdk
sudo update-alternatives --config java

# Verify GDAL version
gdalinfo --version
  $> GDAL 3.3.2, released 2021/09/01

# Verify Python version
python3.8 --version
  $> Python 3.8.10

which python3.8
  $> /usr/bin/python3.8

# Verify Java version
java -version
  $> openjdk version "1.8.0_315"

# Install VIM
sudo apt install -y vim

# Cleanup the packages
sudo apt update -y; sudo apt autoremove --purge
```

# 2. GeoNode Installation

First of all we need to prepare a new Python Virtual Environment

```
which python3.8  # copy the path of python executable

# Create the GeoNode Virtual Environment (first time only)
export WORKON_HOME=~/.virtualenvs
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
mkvirtualenv --python=/usr/bin/python3.8 geonode  # Use the python path from above

# Alterantively you can also create the virtual env like below
mkdir -p ~/.virtualenvs
python3.8 -m venv ~/.virtualenvs/geonode
source ~/.virtualenvs/geonode/bin/activate
```

The next time you need to access the Virtual Environment just run

```
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
workon geonode

# Deactivate virtual environment
deactivate

# Alterantively you can also create the virtual env like below
source ~/.virtualenvs/geonode/bin/activate
```

In order to save permanently the virtualenvwrapper environment

```
vim ~/.bashrc

# Write to the bottom of the file the following lines
export WORKON_HOME=~/.virtualenvs
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
```



```
# Let's create the GeoNode core base folder and clone it
sudo mkdir -p /opt/geonode/; sudo usermod -a -G www-data $USER; sudo chown -Rf $USER:www-data /opt/geonode/; sudo chmod -Rf 775 /opt/geonode/

# Clone the GeoNode source code on /opt/geonode
cd /opt; git clone https://github.com/GeoNode/geonode.git -b 4.x geonode
```



```
# Install the Python packages
cd /opt/geonode
pip install -r requirements.txt --upgrade
pip install -e . --upgrade
pip install pygdal=="`gdal-config --version`.*"
```

# 3. Postgis database Setup

Install and Configure the PostgreSQL Database System

```
```

**Databases and Permissions**

First, create the geonode user. GeoNode is going to use this user to access the database

```
sudo service postgresql start
sudo -u postgres createuser -P geonode

# Use the password: geonode
```

Create database `geonode` and `geonode_data` with owner `geonode`

```
sudo -u postgres createdb -O geonode geonode
sudo -u postgres createdb -O geonode geonode_data
```

Next let’s create PostGIS extensions

```
sudo -u postgres psql -d geonode -c 'CREATE EXTENSION postgis;'
sudo -u postgres psql -d geonode -c 'GRANT ALL ON geometry_columns TO PUBLIC;'
sudo -u postgres psql -d geonode -c 'GRANT ALL ON spatial_ref_sys TO PUBLIC;'
sudo -u postgres psql -d geonode -c 'GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO geonode;'
sudo -u postgres psql -d geonode -c 'GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO geonode;'

sudo -u postgres psql -d geonode_data -c 'CREATE EXTENSION postgis;'
sudo -u postgres psql -d geonode_data -c 'GRANT ALL ON geometry_columns TO PUBLIC;'
sudo -u postgres psql -d geonode_data -c 'GRANT ALL ON spatial_ref_sys TO PUBLIC;'
sudo -u postgres psql -d geonode_data -c 'GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO geonode;'
sudo -u postgres psql -d geonode_data -c 'GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO geonode;'
```

Final step is to change user access policies for local connections in the file `pg_hba.conf`

```
sudo vim /etc/postgresql/13/main/pg_hba.conf
```

Scroll down to the bottom of the document. We want to make local connection `trusted` for the default user.

Make sure your configuration looks like the one below.

```
...
# DO NOT DISABLE!
# If you change this first entry you will need to make sure that the
# database superuser can access the database using some other method.
# Noninteractive access to all databases is required during automatic
# maintenance (custom daily cronjobs, replication, and similar tasks).
#
# Database administrative login by Unix domain socket
local   all             postgres                                trust

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     md5
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     peer
host    replication     all             127.0.0.1/32            md5
host    replication     all             ::1/128                 md5

```

Restart PostgreSQL to make the change effective.

```
sudo service postgresql restart
```

PostgreSQL is now ready. To test the configuration, try to connect to the `geonode` database as `geonode` role.

```
psql -U postgres geonode
# This should not ask for any password

psql -U geonode geonode
# This should ask for the password geonode

# Repeat the test with geonode_data DB
psql -U postgres geonode_data
psql -U geonode geonode_data
```

# 4. Install GeoServer

First, it is not recommended to run Apache Tomcat as user root, so we will create a new system user which will run the Apache Tomcat server

```
sudo useradd -m -U -d /opt/tomcat -s /bin/bash tomcat
sudo usermod -a -G www-data tomcat
```

Now, go to the official Apache Tomcat [website](https://tomcat.apache.org/) and download the most recent version of the software to your server. But don’t use Tomcat10 because there are still some errors between Geoserver and Tomcat.

```
VERSION=9.0.64; wget https://www-eu.apache.org/dist/tomcat/tomcat-9/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz

```

Once the download is complete, extract the tar file to the /opt/tomcat directory:

```
sudo mkdir /opt/tomcat
sudo tar -xf apache-tomcat-${VERSION}.tar.gz -C /opt/tomcat/; rm apache-tomcat-${VERSION}.tar.gz
```

Apache Tomcat is updated regulary. So, to have more control over versions and updates, we’ll create a symbolic link as below:

```
sudo ln -s /opt/tomcat/apache-tomcat-${VERSION} /opt/tomcat/latest
```

Now, let’s change the ownership of all Apache Tomcat files as below:

```
sudo chown -R tomcat:www-data /opt/tomcat/
```

Make the shell scripts inside the bin directory executable:

```
sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
```

Create the a systemd file with the following content:

```
# Check the correct JAVA_HOME location
JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
echo $JAVA_HOME
  $> /usr/lib/jvm/java-8-openjdk-amd64/jre/

# Let's create a symbolic link to the JRE
sudo ln -s /usr/lib/jvm/java-8-openjdk-amd64/jre/ /usr/lib/jvm/jre

# Let's create the tomcat service
sudo vim /etc/systemd/system/tomcat9.service
```

```
[Unit]
Description=Tomcat 9 servlet container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/jre"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom -Djava.awt.headless=true"

Environment="CATALINA_BASE=/opt/tomcat/latest"
Environment="CATALINA_HOME=/opt/tomcat/latest"
Environment="CATALINA_PID=/opt/tomcat/latest/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/latest/bin/startup.sh
ExecStop=/opt/tomcat/latest/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
```

Now you can start the Apache Tomcat 9 server and enable it to start on boot time using the following command:

```
sudo systemctl daemon-reload
sudo systemctl start tomcat9.service
sudo systemctl status tomcat9.service
sudo systemctl enable tomcat9.service
```

For verification, type the following ss command, which will show you the 8080 open port number, the default open port reserved for Apache Tomcat Server.

```
ss -ltn
```

## Install GeoServer on Tomcat9

Let’s externalize the `GEOSERVER_DATA_DIR` and `logs`

```
# Create the target folders
sudo mkdir -p /opt/data
sudo chown -Rf $USER:www-data /opt/data
sudo chmod -Rf 775 /opt/data
sudo mkdir -p /opt/data/logs
sudo chown -Rf $USER:www-data /opt/data/logs
sudo chmod -Rf 775 /opt/data/logs

# Download and extract the default GEOSERVER_DATA_DIR
sudo wget --no-check-certificate "https://artifacts.geonode.org/geoserver/2.19.x/geonode-geoserver-ext-web-app-data.zip" -O data-2.19.x.zip
sudo unzip data-2.19.x.zip -d /opt/data/

sudo mv /opt/data/data/ /opt/data/geoserver_data
sudo chown -Rf tomcat:www-data /opt/data/geoserver_data
sudo chmod -Rf 775 /opt/data/geoserver_data

sudo mkdir -p /opt/data/geoserver_logs
sudo chown -Rf tomcat:www-data /opt/data/geoserver_logs
sudo chmod -Rf 775 /opt/data/geoserver_logs

sudo mkdir -p /opt/data/gwc_cache_dir
sudo chown -Rf tomcat:www-data /opt/data/gwc_cache_dir
sudo chmod -Rf 775 /opt/data/gwc_cache_dir

# Download and install GeoServer
sudo wget --no-check-certificate "https://artifacts.geonode.org/geoserver/2.19.x/geoserver.war" -O geoserver-2.19.x.war
sudo mv geoserver-2.19.x.war /opt/tomcat/latest/webapps/geoserver.war
```

Let’s now configure the `JAVA_OPTS`, i.e. the parameters to run the Servlet Container, like heap memory, garbage collector and so on.

**Note**

After the execution of the above statements, you should be able to see the new options written at the bottom of the file `/opt/tomcat/latest/bin/setenv.sh`.

```
...
# If you run Tomcat on port numbers that are all higher than 1023, then you
# do not need authbind.  It is used for binding Tomcat to lower port numbers.
# (yes/no, default: no)
#AUTHBIND=no
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/
GEOSERVER_DATA_DIR="/opt/data/geoserver_data"
GEOSERVER_LOG_LOCATION="/opt/data/geoserver_logs/geoserver.log"
GEOWEBCACHE_CACHE_DIR="/opt/data/gwc_cache_dir"
GEOFENCE_DIR="$GEOSERVER_DATA_DIR/geofence"
TIMEZONE="UTC"
JAVA_OPTS="-server -Djava.awt.headless=true -Dorg.geotools.shapefile.datetime=false -XX:+UseParallelGC -XX:ParallelGCThreads=4 -Dfile.encoding=UTF8 -Duser.timezone=$TIMEZONE -Xms512m -Xmx4096m -Djavax.servlet.request.encoding=UTF-8 -Djavax.servlet.response.encoding=UTF-8 -DGEOSERVER_CSRF_DISABLED=true -DPRINT_BASE_URL=http://localhost:8080/geoserver/pdf -DGEOSERVER_DATA_DIR=$GEOSERVER_DATA_DIR -Dgeofence.dir=$GEOFENCE_DIR -DGEOSERVER_LOG_LOCATION=$GEOSERVER_LOG_LOCATION -DGEOWEBCACHE_CACHE_DIR=$GEOWEBCACHE_CACHE_DIR"
```

Those options could be updated or changed manually at any time, accordingly to your needs.

**Warning**

The default options we are going to add to the Servlet Container, assume you can reserve at least `4GB` of `RAM` to `GeoServer` (see the option `-Xmx4096m`). You must be sure your machine has enough memory to run both `GeoServer` and `GeoNode`, which in this case means at least `4GB` for `GeoServer` plus at least `2GB` for `GeoNode`. A total of at least `6GB` of `RAM` available on your machine. If you don’t have enough `RAM` available, you can lower down the values `-Xms512m -Xmx4096m`. Consider that with less `RAM` available, the performances of your services will be highly impacted.

In order to make the changes effective, you’ll need to restart the Servlet Container.

```
# Restart the server
sudo systemctl restart tomcat9.service

# Follow the startup logs
sudo tail -F -n 300 /opt/data/geoserver_logs/geoserver.log

```

Your `GeoServer` should be up and running at

```
http://localhost:8080/geoserver/
```

# 5. Web Server

Until now we have seen how to start `GeoNode` in `DEBUG` mode from the command line, through the `paver` utilities. This is of course not the best way to start it. Moreover you will need a dedicated `HTTPD` server running on port `80` if you would like to expose your server to the world.

In this section we will see:

1. How to configure `NGINX` HTTPD Server to host `GeoNode` and `GeoServer`. In the initial setup we will still run the services on `http://localhost`
2. Update the `settings` in order to link `GeoNode` and `GeoServer` to the `PostgreSQL` Database.
3. Update the `settings` in order to update `GeoNode` and `GeoServer` services running on a **public IP** or **hostname**.
4. Install and enable `HTTPS` secured connection through the `Let's Encrypt` provider.

#### Install and configure NGINX

```
# Install the services
sudo apt install -y nginx uwsgi uwsgi-plugin-python3
```

#### Serving {“geonode”, “geoserver”} via NGINX

```
# Create the GeoNode UWSGI config
sudo vim /etc/uwsgi/apps-available/geonode.ini
```


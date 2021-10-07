[TOC]



# Install Mattermost 

```
# sudo apt update

# sudo apt upgrade
```



## Installing PostgreSQL Database Server

Install and set up the database for use by the Mattermost server. You can install either PostgreSQL or MySQL.

Assume that the IP address of this server is 10.10.10.1.

**To install PostgreSQL on Ubuntu Server 20.04:**

1. Log in to the server that will host the database and issue the following command:

> ```
> sudo apt install postgresql postgresql-contrib
> ```
>
> Note: 
>
> You can now start the database server using:
>
>  pg_ctlcluster 12 main start
>
> When the installation is complete, the PostgreSQL server is running, and a Linux user account called *postgres* has been created.

2. Access PostgreSQL with one of the following options:

> - `sudo --login --user postgres` then `psql`
> - `sudo -u postgres psql`

3. Create the Mattermost database.

> ```
> postgres=# CREATE DATABASE mattermost;
> ```
>
> Delete Database
>
> ```
> DROP DATABASE <database_name>;
> ```

4. Create the Mattermost user *mmuser*.

> ```
> postgres=# CREATE USER mmuser WITH PASSWORD 'mmuser-password';
> ```

5. Grant the user access to the Mattermost database.

> ```
> postgres=# GRANT ALL PRIVILEGES ON DATABASE mattermost to mmuser;
> ```

6. Exit the PostgreSQL interactive terminal.

> ```
> postgres=# \q
> ```

7. Log out of the *postgres* account.

> ```
> exit
> ```

8. Modify the file `pg_hba.conf` to allow the Mattermost server to communicate with the database.

> **If the Mattermost server and the database are on the same machine:**
>
> > 1. Open `/etc/postgresql/{version}/main/pg_hba.conf` as *root* in a text editor.
> > 2. Find the following lines:
> >
> > > ```
> > > local  all       all            peer
> > > host  all       all     ::1/128    ident
> > > ```
> >
> > 1. Change `peer` and `ident` to `trust`:
> >
> > > ```
> > > local  all       all            trust
> > > host  all       all     ::1/128    trust
> > > ```
>
> **If the Mattermost server and the database are on different machines:**
>
> > 1. Open `/etc/postgresql/{version}/main/pg_hba.conf` in a text editor as *root* user.
> > 2. Add the following line to the end of the file, where `{mattermost-server-IP}` is the IP address of the Mattermost server.
> >
> > > ```
> > > host all all {mattermost-server-IP}/32 md5
> > > ```

9. Reload PostgreSQL:

> ```
> sudo systemctl reload postgresql
> ```

10. Verify that you can connect with the user *mmuser*.

> - If the Mattermost server and the database are on the same machine, use the following command:
>
>   ```
>   psql --dbname=mattermost --username=mmuser --password
>   ```
>
>   If the Mattermost server is on a different machine, log into that machine and use the following command:
>
>   ```
>   psql --host={postgres-server-IP} --dbname=mattermost --username=mmuser --password
>   ```
>
>   



## To install Mattermost Server on Ubuntu

1. Log in to the server that will host Mattermost Server and open a terminal window.

2. Download the latest version of the Mattermost Server. In the following command, replace X.X.X with the version that you want to download:

   ```
   wget https://releases.mattermost.com/X.X.X/mattermost-X.X.X-linux-amd64.tar.gz
   ```

3. Extract the Mattermost Server files.

   ```
   tar -xvzf mattermost*.gz
   ```

4. Move the extracted file to the /opt directory.

   ```
   sudo mv mattermost /opt
   ```

   

5. Create the storage directory for files.
   
   ```
   sudo mkdir /opt/mattermost/data
   ```

6. Set up a system user and group called `mattermost` that will run this service, and set the ownership and permissions.

> a. Create the Mattermost user and group:
>
> > ```
> > sudo useradd --system --user-group mattermost
> > ```
>
> b. Set the user and group *mattermost* as the owner of the Mattermost files:
>
> > ```
> > sudo chown -R mattermost:mattermost /opt/mattermost
> > ```
>
> c. Give write permissions to the *mattermost* group:
>
> > ```
> > sudo chmod -R g+w /opt/mattermost
> > ```

7. Set up the database driver in the file `/opt/mattermost/config/config.json`. Open the file in a text editor and make the following changes:

> - If you are using PostgreSQL:
>
> > 1. Set `"DriverName"` to `"postgres"`
> > 2. Set `"DataSource"` to the following value, replacing `<mmuser-password>` and `<host-name-or-IP>` with the appropriate values:
> >
> > > `"postgres://mmuser:<mmuser-password>@<host-name-or-IP>:5432/mattermost?sslmode=disable&connect_timeout=10"`.



# Install Mattermost in Docker



## Clone mattermost docker-compose repository

```bash
git clone https://github.com/mattermost/mattermost-docker.git
cd mattermost-docker
```

## Make changes to use team edition rather than enterprise edition

The first part of the app server in the `docker-compose.yml` file should look the following. The comment explains what was done.

```docker-compose.yml
  app:
    build: #app
      # change `build:app` to `build:` and uncomment following lines for team edition or change UID/GID
      context: app
      args:
        - edition=team
        - PUID=1000
        - PGID=1000
```

## Build the custom image

```
docker-compose build
```

This can take a few minutes based on the resources on your host and your internet connection.

## Setup the volumes and assign them the correct permissions

```
mkdir -pv ./volumes/app/mattermost/{data,logs,config,plugins,client-plugins}
sudo chown -R 1000:1000 ./volumes/app/mattermost/
```

Note that you have to setup the `uid` and `gid` setup to match the ones you specifiy in your `docker-compose.yml` file that was used for the build step.

## Run docker-compose

```
docker-compose up -d
```



## Starting/Stopping Docker

### Start

If you are running docker with non root user, make sure the UID and GID in app/Dockerfile are the same as your current UID/GID

```
mkdir -p ./volumes/app/mattermost/{data,logs,config,plugins}
chown -R 2000:2000 ./volumes/app/mattermost/
docker-compose start
```

### Stop

```
docker-compose stop
```

## Removing Docker

### Remove the containers

```
docker-compose stop && docker-compose rm
```

### Remove the data and settings of your Mattermost instance

```
sudo rm -rf volumes
```

## Update Mattermost to latest version

First, shutdown your containers to back up your data.

```
docker-compose down
```

Back up your mounted volumes to save your data. If you use the default `docker-compose.yml` file proposed on this repository, your data is on `./volumes/` folder.

```
sudo tar -cpzvf mattermost_backup.tar.gz -C ./volumes/ . 
```



Then run the following commands.

```
git pull
docker-compose build
docker-compose up -d
```



# Backup Postgres database
```
! docker container
# docker exec -t mattermost-docker_db_1 pg_dump -U mmuser mattermost > mmdb_backup_06012021.sql

# docker exec -t your-db-container pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql

# pg_dump dbname > dumpfile
```



# Restore Postgres database

1. Stop Mattermost application

```
sytemctl stop mattermost
```

2. Import backup sql

```
! docker container
cat your_dump.sql | docker exec -i your-db-container psql -U postgres


# sudo -u postgres psql mattermost < mmdb_backup_06012021.sql
```



# Backup and Restore Postgres database in Docker

## Backup

My backup process is based in this [codimd issue 98](https://github.com/codimd/container/issues/98#issuecomment-629633931), since it also use postgres. (I am familiar with this process, that is why I copied it).

In the old container do the following.

1. Stop the container:

```
docker-compose stop
```

2. Remove the container:

```
docker-compose rm
```

3. Backup the database

```
docker-compose exec db pg_dump DATABASE -U USER  > backup.sql
```

`DATABASE` and `USER` it has to be the one of your Mattermost instance.

4. Backup files. From the old container we need to backup its `volumes/app` and `volumes/web` directories. You can remove everything, except this directories and `backup.sql`.

## Restore

In the new container do the following.

1. Custom your container, using your prefer text editor, like Vim:

```
vim docker-compose.yml
```

2. Generate needed directories:

```
mkdir -p ./volumes/app/mattermost/{data,logs,config,plugins}
```

3. Build your container:

```
docker-compose build
```

4. Start *only* your database:

```
docker-compose up -d db
```

If you start everything, the restoration process is not gonna work!

5. Restore database:

```
cat PATH/backup.sql | docker exec -i $(docker-compose ps -q db) psql -U USER DATABASE
```

`PATH` is your path to your `backup.sql`. `DATABASE` and `USER` it has to be the one of your Mattermost instance.

6. Restore files:

```
cp -r PATH/volumes/app volumes/ && cp -r PATH/volumes/web volumes/
```

`PATH` is your path to `app` and `web` directories.

7. Ensure you have the correct permissions:

```
chown -R 2000:2000 ./volumes/app/mattermost/
```

If you don't have the correct permissions, file storage is not gonna work!

8. Start everything:

```
docker-compose up -d
```



## Using TLS on NGINX (as a proxy)





## Download and Install Standup Raven plugins 

https://github.com/standup-raven/standup-raven/releases/tag/v3.2.3


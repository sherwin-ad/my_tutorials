[TOC]



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
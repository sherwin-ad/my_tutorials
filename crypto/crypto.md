# Monero



```
ssh -i sherwinowen-key sherwinowen3210@65.109.109.203
```



```
sudo -u monero -Hs /bin/bash
```



**Create user with no login** 

````
sudo useradd -s /usr/sbin/nologin -m ryo
````

## **To List all Installed Packages**

### apt

```
apt -qq list build-essential
build-essential/jammy,jammy,now 12.9ubuntu3 amd64 [installed]
```

```
apt list build-essential --installed
Listing... Done
build-essential/jammy,jammy,now 12.9ubuntu3 amd64 [installed]
```



### dpkg

To check whether a package is installed or not:

```
dpkg -l {package_name}
dpkg -l vlc
```

To check if the package is installed or not (for example, `vlc`). If installed, launch the package:

```
dpkg -l | grep vlc
```

Show the location where the package is installed. The `-S` (capital S) stands for "search"

```
sudo dpkg -S {package_name}
sudo dpkg -S skype
```

To use Grep to search:

```
dpkg -l | grep {keywords}
dpkg -l | grep pdf
```







/etc/systemd/system/monero.service

```
[Unit]
Description=monero service
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=10
User=monero
ExecStart=/home/monero/monero-bin/monerod

[Install]
WantedBy=multi-user.target
```



To list all services that are currently loaded and running on your system:

```
systemctl -t service --state=active
```

If you want to list services that start when your system boots then you can use:

```
systemctl list-unit-files --state=enabled
```



# **Create user ryo with nologin** 

````
sudo useradd -s /usr/sbin/nologin -m ryo
````

## 

# Configure Quotas for a User ryo

1. To edit quota for the sudo user `<example_user>` that you added when securing your Linode compute instance, enter the following:

   ```
   sudo setquota -u ryo 35G 35G 0 0 /
   ```

2. Check the new quota for the user:

   ```
   sudo quota -vs ryo
   ```

   The output is similar to:

   ```
   Disk quotas for user ryo (uid 1005): 
        Filesystem   space   quota   limit   grace   files   quota   limit   grace
          /dev/md2    160M  35840M  35840M            5122       0       0        
   ```

   



# Install ryo-currency

- https://github.com/ryo-currency/ryo-currency

```
git clone --single-branch --branch dev --recursive https://github.com/ryo-currency/ryo-currency
```

ryo.service

```
[Unit]
Description=ryo service
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=10
User=ryo
Group=ryo
ExecStart=/home/ryo/ryo-currency/build/release/bin/ryod --non-interactive

[Install]
WantedBy=multi-user.target

```





# cryptonote-nodejs-pool

https://github.com/mosu-forge/cryptonote-nodejs-pool.git

- cryptoforknote-util , cryptonight-hashing - those are C++ extensions to node
- redis
- volume of data in redis that we will want to back up

- Ah, we will get confused, from now on "node" is the javascript engine, and "full node" is the application that keeps track of the blockchain for us
- Overall goal will be to dockerize the whole system and configure it for cloud backups.



## Task:

1. Your first sub-goal I think should be to get node and redis images and redis data volume up and running in docker-compose 



1. Install nodejs

   ```
   $ sudo apt install nodejs
   
   $ node -v
   v12.22.9
   ```

2. Install Redis

   ```
   sudo add-apt-repository ppa:chris-lea/redis-server
   sudo apt-get update
   sudo apt-get install redis-server
   ```

   Check if the service is up and running:

   ```
   sudo systemctl status redis-server.service
   ```

   To connect to the Redis server and check if the connection is ok use the command below:

   ```
   redis-cli
   ```

   You will notice that the cli will be different as described below:

   ```
   root@host:~# redis-cli
   127.0.0.1:6379> ping 
   PONG
   ```

   Dont forget to tune redis-server:

   ```
   echo never > /sys/kernel/mm/transparent_hugepage/enabled
   echo 1024 > /proc/sys/net/core/somaxconn
   ```

   Add this lines to your /etc/rc.local and make it executable

   ```
   chmod +x /etc/rc.local
   ```

3. **Do not run the pool as root** : create a new user without ssh access to avoid security issues :

   ```
   sudo adduser --disabled-password --disabled-login your-user
   ```

   To login with this user :

   ```
   sudo su - your-user
   ```



#### 1) Downloading & Installing

Clone the repository and run `npm update` for all the dependencies to be installed:

```
git clone https://github.com/dvandal/cryptonote-nodejs-pool.git pool

cd pool

npm update
```



Dockerfile using ubuntu-18.04

```
FROM ubuntu:18.04

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Update system
RUN apt update -y
RUN apt upgrade -y

# Install build requirements
RUN apt install -y git redis python2.7 build-essential libssl-dev libboost-all-dev libsodium-dev curl


# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 11.0.0

# Install nvm
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
#CMD source /root/.bashrc

# Install NodeJs
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Set npm to use python 2.7
RUN npm config set python /usr/bin/python2.7

ADD . /pool/
WORKDIR /pool/

RUN npm update

RUN mkdir -p /config

EXPOSE 8117
EXPOSE 3333
EXPOSE 5555
EXPOSE 7777

VOLUME ["/config"]

RUN cp ./config_examples/aeon.json /config/config.json

CMD node init.js -config=/config/config.json
```



Dockerfile using node 

````
FROM node:8-slim

RUN echo "deb http://archive.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs-legacy build-essential git libssl-dev libboost-all-dev libsodium-dev \
  && rm -rf /var/lib/apt/lists/*
#  chmod +x /wait-for-it.sh

ADD . /pool/
WORKDIR /pool/

RUN npm update

RUN mkdir -p /config

EXPOSE 8117
EXPOSE 3333
EXPOSE 5555
EXPOSE 7777

VOLUME ["/config"]

RUN cp ./config_examples/aeon.json /config/config.json

CMD node init.js -config=/config/config.json
````


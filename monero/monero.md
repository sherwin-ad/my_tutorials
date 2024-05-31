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
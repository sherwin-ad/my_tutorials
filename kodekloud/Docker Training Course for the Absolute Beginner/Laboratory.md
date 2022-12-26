[TOC]



# DOCKER COMMANDS, LABS: BASIC DOCKER COMMANDS

1. What is the version of Docker Server Engine running on the Host?

   ```
   $ docker version  
   Client: Docker Engine - Community
    Version:           19.03.15
    API version:       1.40
    Go version:        go1.13.15
    Git commit:        99e3ed8919
    Built:             Sat Jan 30 03:17:11 2021
    OS/Arch:           linux/amd64
    Experimental:      false
   
   Server: Docker Engine - Community
    Engine:
     Version:          19.03.15
     API version:      1.40 (minimum version 1.12)
     Go version:       go1.13.15
     Git commit:       99e3ed8919
     Built:            Sat Jan 30 03:15:40 2021
     OS/Arch:          linux/amd64
     Experimental:     false
    containerd:
     Version:          1.4.3
     GitCommit:        269548fa27e0089a8b8278fc4fc781d7f65a939b
    runc:
     Version:          1.0.0-rc92
     GitCommit:        ff819c7e9184c13b7c2607fe6c30ae19403a7aff
    docker-init:
     Version:          0.18.0
     GitCommit:        fec3683
   ```

2. How many containers are running on this host?

   ```
   $ docker ps
   ```

3. How many `images` are available on this host?

   ```
   $ docker images
   
   $ docker images -q | wc -l
   9
   ```

4. Run a container using the `redis` image

   ```
   $ docker run -d redis
   ```

5. Stop the container you just created

   ```
   $ docker stop <container id>
   ```

6. How many containers are `RUNNING` on this host now?

   ```
   $ docker ps
   
   $ docker ps -q | wc -l
   4
   ```

7. How many containers are `PRESENT` on the host now?

   Including both `Running` and `Not Running` ones

   ```
   $ docker ps -aq | wc -l
   6
   ```

8. What is the image used to run the `nginx-1` container?

   ```
   $ docker ps
   CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
   0ca12f1e603f        alpine              "sleep 1000"             3 minutes ago       Up 2 minutes                            stoic_wing
   4b1d45b90a69        nginx:alpine        "/docker-entrypoint.…"   3 minutes ago       Up 3 minutes        80/tcp              nginx-2
   8c0123ca2e84        nginx:alpine        "/docker-entrypoint.…"   3 minutes ago       Up 3 minutes        80/tcp              nginx-1
   c094e6c9030b        ubuntu              "sleep 1000"             3 minutes ago       Up 3 minutes                            awesome_northcut
   ```

9. What is the name of the container created using the `ubuntu` image?

   ```
   $ docker ps
   CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
   0ca12f1e603f        alpine              "sleep 1000"             3 minutes ago       Up 2 minutes                            stoic_wing
   4b1d45b90a69        nginx:alpine        "/docker-entrypoint.…"   3 minutes ago       Up 3 minutes        80/tcp              nginx-2
   8c0123ca2e84        nginx:alpine        "/docker-entrypoint.…"   3 minutes ago       Up 3 minutes        80/tcp              nginx-1
   c094e6c9030b        ubuntu              "sleep 1000"             3 minutes ago       Up 3 minutes                            awesome_northcut
   ```

10. What is the `ID` of the container that uses the `alpine` image and is `not running`?

    ```
    $ docker ps -a
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                     PORTS               NAMES
    07bcbf313f7f        alpine              "/bin/sh"                6 minutes ago       Exited (0) 6 minutes ago                       kind_moser
    0ca12f1e603f        alpine              "sleep 1000"             6 minutes ago       Up 6 minutes                                   stoic_wing
    4b1d45b90a69        nginx:alpine        "/docker-entrypoint.…"   6 minutes ago       Up 6 minutes               80/tcp              nginx-2
    8c0123ca2e84        nginx:alpine        "/docker-entrypoint.…"   6 minutes ago       Up 6 minutes               80/tcp              nginx-1
    c094e6c9030b        ubuntu              "sleep 1000"             6 minutes ago       Up 6 minutes                                   awesome_northcut
    b760b83fd8a2        redis               "docker-entrypoint.s…"   8 minutes ago       Exited (0) 8 minutes ago                       fervent_darwin
    ```

11. What is the state of the stopped `alpine` container?

    ```
    docker ps -a
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                     PORTS               NAMES
    07bcbf313f7f        alpine              "/bin/sh"                6 minutes ago       Exited (0) 6 minutes ago                
    ```

12. Delete all containers from the Docker Host.

    Both `Running` and `Not Running` ones. Remember you may have to stop containers before deleting them.

    ```
    $ docker stop $(docker ps -aq)
    
    $ docker rm $(docker ps -aq)
    ```

13. Delete the `ubuntu` Image.

    ```
    $ docker rmi ubuntu
    ```

14. You are required to pull a docker image which will be used to run a container later. Pull the image `nginx:1.14-alpine`

    Only pull the image, do not create a container.

    ```
    $ docker pull nginx:1.14-alpine
    ```

15. Run a container with the `nginx:1.14-alpine` image and name it `webapp`

    ```
    $ docker run -d --name webapp nginx:1.14-alpine
    ```

16. **Cleanup:** Delete all images on the host

    Remove containers as necessary

    ```
    $ docker stop webapp
    
    $ docker rmi -f $(docker images -aq)
    ```

    

   

# DOCKER RUN, LABS: DOCKER RUN COMMANDS

1. Let us first inspect the environment. How many containers are running on this host?

   ```
   $ docker ps
   ```

2. What is the image used by the container?

   ```
   $ docker ps
   CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                           NAMES
   76e3480fffe5        nginx:alpine        "/docker-entrypoint.…"   38 seconds ago      Up 36 seconds       0.0.0.0:3456->3456/tcp, 0.0.0.0:38080->80/tcp   tender_clarke
   ```

3. How many `ports` are published on this container?

   ```
   $ docker ps
   CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                           NAMES
   76e3480fffe5        nginx:alpine        "/docker-entrypoint.…"   38 seconds ago      Up 36 seconds       0.0.0.0:3456->3456/tcp, 0.0.0.0:38080->80/tcp   tender_clarke
   ```

4. Which of the below ports are the exposed on the `CONTAINER`?

   ```
   $ docker ps
   CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                           NAMES
   76e3480fffe5        nginx:alpine        "/docker-entrypoint.…"   38 seconds ago      Up 36 seconds       0.0.0.0:3456->3456/tcp, 0.0.0.0:38080->80/tcp   tender_clarke
   ```

5. Which of the below ports are published on `Host`?

   ```
   $ docker ps
   CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                           NAMES
   76e3480fffe5        nginx:alpine        "/docker-entrypoint.…"   38 seconds ago      Up 36 seconds       0.0.0.0:3456->3456/tcp, 0.0.0.0:38080->80/tcp   tender_clarke
   ```

6. Run an instance of `kodekloud/simple-webapp` with a tag `blue` and map port `8080` on the container to `38282` on the host.

   ```
   $ docker run -p 38282:8080 kodekloud/simple-webapp:blue
   ```



# DOCKER IMAGES, LABS: DOCKER IMAGES

1. How many `images` are available on this host?

   ```
   $ docker images -q | wc -l
   ```

2. What is the size of the `ubuntu` image?

   ```
   $ docker images
   REPOSITORY                      TAG                 IMAGE ID            CREATED             SIZE
   redis                           latest              ccee4cdf984f        20 months ago       105MB
   ubuntu                          latest              7e0aa2d69a15        20 months ago       72.7MB
   ```

3. We just pulled a new image. What is the tag on the newly pulled `NGINX` image?

   ```
   $ docker images
   ```

4. We just downloaded the code of an application. What is the base image used in the Dockerfile?

   Inspect the Dockerfile in the `webapp-color` directory.

   cat Dockerfile

   ```
   FROM python:3.6
   
   RUN pip install flask
   
   COPY . /opt/
   
   EXPOSE 8080
   
   WORKDIR /opt
   
   ENTRYPOINT ["python", "app.py"]
   ```

5. To what location within the container is the application code copied to during a Docker build?

   Inspect the Dockerfile in the `webapp-color` directory.

   cat Dockerfile

   ```
   FROM python:3.6
   
   RUN pip install flask
   
   COPY . /opt/
   
   EXPOSE 8080
   
   WORKDIR /opt
   
   ENTRYPOINT ["python", "app.py"]
   ```

6. When a container is created using the image built with this Dockerfile, what is the command used to `RUN` the application inside it.

   Inspect the Dockerfile in the `webapp-color` directory.

   cat Dockerfile

   ```
   FROM python:3.6
   
   RUN pip install flask
   
   COPY . /opt/
   
   EXPOSE 8080
   
   WORKDIR /opt
   
   ENTRYPOINT ["python", "app.py"]
   ```

7. What `port` is the web application run within the container?

   Inspect the Dockerfile in the `webapp-color` directory.

   cat Dockerfile

   ```
   FROM python:3.6
   
   RUN pip install flask
   
   COPY . /opt/
   
   EXPOSE 8080
   
   WORKDIR /opt
   
   ENTRYPOINT ["python", "app.py"]
   ```

8. Build a docker image using the Dockerfile and name it `webapp-color`. No tag to be specified.

   ```
   $ docker build -t webapp-color .
   ```

9. Run an instance of the image `webapp-color` and publish port `8080` on the container to `8282` on the host.

   ```
   $ docker run -p 8282:8080 webapp-color
   ```

10. Access the application by clicking on the tab named `HOST:8282` above your terminal.

    After you are done, you may stop the running container by hitting `CTRL + C` if you wish to.

11. What is the base Operating System used by the `python:3.6` image?

    If required, run an instance of the image to figure it out.

    ```
    $ docker run python:3.6 cat /etc/*release*
    PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
    NAME="Debian GNU/Linux"
    VERSION_ID="11"
    VERSION="11 (bullseye)"
    VERSION_CODENAME=bullseye
    ID=debian
    HOME_URL="https://www.debian.org/"
    SUPPORT_URL="https://www.debian.org/support"
    BUG_REPORT_URL="https://bugs.debian.org/"
    ```

12. What is the approximate size of the `webapp-color` image?

    ```
    $ docker images
    REPOSITORY                      TAG                 IMAGE ID            CREATED             SIZE
    webapp-color                    latest              1bada3b8b81d        5 minutes ago       913MB
    ```

13. That's really BIG for a Docker Image. Docker images are supposed to be small and light weight. Let us try to trim it down.

14. Build a new smaller docker image by modifying the same Dockerfile and name it `webapp-color` and tag it `lite`.

    Hint: Find a smaller base image for `python:3.6`. Make sure the final image is less than `150MB`.

    Modify Dockerfile

    ```
    FROM python:3.6-alpine
    
    RUN pip install flask
    
    COPY . /opt/
    
    EXPOSE 8080
    
    WORKDIR /opt
    
    ENTRYPOINT ["python", "app.py"]
    ```

    ```
    $ docker build -t webapp-color:lite .
    
    $ docker images
    REPOSITORY                      TAG                 IMAGE ID            CREATED             SIZE
    webapp-color                    lite                3189c7896b3b        12 seconds ago      51.8MB
    ```

15. Run an instance of the new image `webapp-color:lite` and publish port `8080` on the container to `8383` on the host.

    ```
    $ docker run -p 8383:8080 -d webapp-color:lite
    ```

    

# DOCKER IMAGES, LABS – ENVIRONMENT VARIABLES

1. Inspect the environment variables set on the running container and identify the value set to the `APP_COLOR` variable.

   ```
   $ docker inspect agitated_payne | grep -A 10 Env
               "Env": [
                   "APP_COLOR=pink",
                   "PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                   "LANG=C.UTF-8",
                   "GPG_KEY=0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D",
                   "PYTHON_VERSION=3.6.6",
                   "PYTHON_PIP_VERSION=18.1"
               ],
               "Cmd": null,
               "Image": "kodekloud/simple-webapp",
               "Volumes": null,
   ```

2. Run a container named `blue-app` using image `kodekloud/simple-webapp` and set the environment variable `APP_COLOR` to `blue`. Make the application available on port `38282` on the host. The application listens on port `8080`.

   ```
   $ docker run --name blue-app -d -p 38282:8080 -e APP_COLOR=blue kodekloud/simple-webapp
   ```

3. View the application by clicking the link `HOST:38282` above your terminal and ensure it has the right color.

4. Deploy a `mysql` database using the `mysql` image and name it `mysql-db`.

   Set the database password to use `db_pass123`. Lookup the mysql image on Docker Hub and identify the correct environment variable to use for setting the root password.

   ```
   $ docker run --name mysql-db -d -e MYSQL_ROOT_PASSWORD=db_pass123 mysql
   ```

   To know the env field from within a `mysql-db` container, run

   ```
   $ docker exec -it mysql-db env
   PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   HOSTNAME=d5529bbc8817
   TERM=xterm
   MYSQL_ROOT_PASSWORD=db_pass123
   GOSU_VERSION=1.12
   MYSQL_MAJOR=8.0
   MYSQL_VERSION=8.0.24-1debian10
   HOME=/root
   ```



# DOCKER IMAGES, LABS – COMMAND & ENTRYPOINT

1. `Dockerfiles` for a few commonly used Docker Images are given in the `/root` (current) directory. Inspect them and try to answer the following questions.

2. What is the `ENTRYPOINT` configured on the `mysql` image?

   - docker-entrypoint.sh
   - /usr/local/bin
   - mysqld
   - NO ENTRYPOINT CONFIGURED

   Dockerfile-mysql 

   ```
   FROM debian:stretch-slim
   
   # add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
   RUN groupadd -r mysql && useradd -r -g mysql mysql
   
   RUN apt-get update && apt-get install -y --no-install-recommends gnupg dirmngr && rm -rf /var/lib/apt/lists/*
   
   # add gosu for easy step-down from root
   ENV GOSU_VERSION 1.7
   RUN set -x \
           && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
           && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
           && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
           && export GNUPGHOME="$(mktemp -d)" \
           && gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
           && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
           && gpgconf --kill all \
           && rm -rf "$GNUPGHOME" /usr/local/bin/gosu.asc \
           && chmod +x /usr/local/bin/gosu \
           && gosu nobody true \
           && apt-get purge -y --auto-remove ca-certificates wget
   
   RUN mkdir /docker-entrypoint-initdb.d
   
   RUN apt-get update && apt-get install -y --no-install-recommends \
   # for MYSQL_RANDOM_ROOT_PASSWORD
                   pwgen \
   # for mysql_ssl_rsa_setup
                   openssl \
   # FATAL ERROR: please install the following Perl modules before executing /usr/local/mysql/scripts/mysql_install_db:
   # File::Basename
   # File::Copy
   # Sys::Hostname
   # Data::Dumper
                   perl \
           && rm -rf /var/lib/apt/lists/*
   
   RUN set -ex; \
   # gpg: key 5072E1F5: public key "MySQL Release Engineering <mysql-build@oss.oracle.com>" imported
           key='A4A9406876FCBD3C456770C88C718D3B5072E1F5'; \
           export GNUPGHOME="$(mktemp -d)"; \
           gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
           gpg --batch --export "$key" > /etc/apt/trusted.gpg.d/mysql.gpg; \
           gpgconf --kill all; \
           rm -rf "$GNUPGHOME"; \
           apt-key list > /dev/null
   
   ENV MYSQL_MAJOR 8.0
   ENV MYSQL_VERSION 8.0.17-1debian9
   
   RUN echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list
   
   # the "/var/lib/mysql" stuff here is because the mysql-server postinst doesn't have an explicit way to disable the mysql_install_db codepath besides having a database already "configured" (ie, stuff in /var/lib/mysql/mysql)
   # also, we set debconf keys to make APT a little quieter
   RUN { \
                   echo mysql-community-server mysql-community-server/data-dir select ''; \
                   echo mysql-community-server mysql-community-server/root-pass password ''; \
                   echo mysql-community-server mysql-community-server/re-root-pass password ''; \
                   echo mysql-community-server mysql-community-server/remove-test-db select false; \
           } | debconf-set-selections \
           && apt-get update && apt-get install -y mysql-community-client="${MYSQL_VERSION}" mysql-community-server-core="${MYSQL_VERSION}" && rm -rf /var/lib/apt/lists/* \
           && rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld \
           && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
   # ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
           && chmod 777 /var/run/mysqld
   
   VOLUME /var/lib/mysql
   # Config files
   COPY config/ /etc/mysql/
   COPY docker-entrypoint.sh /usr/local/bin/
   RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
   ENTRYPOINT ["docker-entrypoint.sh"]
   
   EXPOSE 3306 33060
   CMD ["mysqld"]
   ```

3. What is the `CMD` configured on the `wordpress` image?

   - docker-entrypoint.sh
   - apache2-foreground
   - wordpress

   Dockerfile-wordpress 

   ```
   FROM php:7.1-apache
   
   # install the PHP extensions we need (https://make.wordpress.org/hosting/handbook/handbook/server-environment/#php-extensions)
   RUN set -ex; \
           \
           savedAptMark="$(apt-mark showmanual)"; \
           \
           apt-get update; \
           apt-get install -y --no-install-recommends \
                   libjpeg-dev \
                   libmagickwand-dev \
                   libpng-dev \
           ; \
           \
           docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
           docker-php-ext-install -j "$(nproc)" \
                   bcmath \
                   exif \
                   gd \
                   mysqli \
                   opcache \
                   zip \
           ; \
           pecl install imagick-3.4.4; \
           docker-php-ext-enable imagick; \
           \
   # reset apt-mark's "manual" list so that "purge --auto-remove" will remove all build dependencies
           apt-mark auto '.*' > /dev/null; \
           apt-mark manual $savedAptMark; \
           ldd "$(php -r 'echo ini_get("extension_dir");')"/*.so \
                   | awk '/=>/ { print $3 }' \
                   | sort -u \
                   | xargs -r dpkg-query -S \
                   | cut -d: -f1 \
                   | sort -u \
                   | xargs -rt apt-mark manual; \
           \
           apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
           rm -rf /var/lib/apt/lists/*
   
   # set recommended PHP.ini settings
   # see https://secure.php.net/manual/en/opcache.installation.php
   RUN { \
                   echo 'opcache.memory_consumption=128'; \
                   echo 'opcache.interned_strings_buffer=8'; \
                   echo 'opcache.max_accelerated_files=4000'; \
                   echo 'opcache.revalidate_freq=2'; \
                   echo 'opcache.fast_shutdown=1'; \
           } > /usr/local/etc/php/conf.d/opcache-recommended.ini
   # https://wordpress.org/support/article/editing-wp-config-php/#configure-error-logging
   RUN { \
   # https://www.php.net/manual/en/errorfunc.constants.php
   # https://github.com/docker-library/wordpress/issues/420#issuecomment-517839670
                   echo 'error_reporting = E_ERROR | E_WARNING | E_PARSE | E_CORE_ERROR | E_CORE_WARNING | E_COMPILE_ERROR | E_COMPILE_WARNING | E_RECOVERABLE_ERROR'; \
                   echo 'display_errors = Off'; \
                   echo 'display_startup_errors = Off'; \
                   echo 'log_errors = On'; \
                   echo 'error_log = /dev/stderr'; \
                   echo 'log_errors_max_len = 1024'; \
                   echo 'ignore_repeated_errors = On'; \
                   echo 'ignore_repeated_source = Off'; \
                   echo 'html_errors = Off'; \
           } > /usr/local/etc/php/conf.d/error-logging.ini
   
   RUN a2enmod rewrite expires
   
   VOLUME /var/www/html
   
   ENV WORDPRESS_VERSION 5.2.2
   ENV WORDPRESS_SHA1 3605bcbe9ea48d714efa59b0eb2d251657e7d5b0
   
   RUN set -ex; \
           curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz"; \
           echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c -; \
   # upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
           tar -xzf wordpress.tar.gz -C /usr/src/; \
           rm wordpress.tar.gz; \
           chown -R www-data:www-data /usr/src/wordpress
   
   COPY docker-entrypoint.sh /usr/local/bin/
   
   ENTRYPOINT ["docker-entrypoint.sh"]
   CMD ["apache2-foreground"]
   ```

4. What is the final command run at startup when the `wordpress` image is run. Consider both `ENTRYPOINT` and `CMD` instructions

   - docker-entrypoint.sh
   - wordpress
   - apache2-foreground
   - **docker-entrypoint.sh apache2-foreground**
   - docker-entrypoint.sh wordpress

5. What is the command run at startup when the `ubuntu` image is run?

   - entrypoint bash
   - bash
   - **ubuntu**
   - /root bash
   - bash ubuntu

   Dockerfile-ubuntu 

   ```
   #
   # Ubuntu Dockerfile
   #
   # https://github.com/dockerfile/ubuntu
   #
   
   # Pull base image.
   FROM ubuntu:14.04
   
   # Install.
   RUN \
     sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
     apt-get update && \
     apt-get -y upgrade && \
     apt-get install -y build-essential && \
     apt-get install -y software-properties-common && \
     apt-get install -y byobu curl git htop man unzip vim wget && \
     rm -rf /var/lib/apt/lists/*
   
   # Add files.
   ADD root/.bashrc /root/.bashrc
   ADD root/.gitconfig /root/.gitconfig
   ADD root/.scripts /root/.scripts
   
   # Set environment variables.
   ENV HOME /root
   
   # Define working directory.
   WORKDIR /root
   
   # Define default command.
   CMD ["bash"]
   ```

6. Run an instance of the `ubuntu` image to run the `sleep 1000` command at startup.

   Run it in detached mode.

   ```
   $ docker run -d ubuntu sleep 1000  
   ```



# Docker Compose Lab

1. First create a redis database container called `redis`, image `redis:alpine`.

   ```
   $ docker run --name redis -d redis:alpine
   
   $ docker ps
   CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS              PORTS               NAMES
   505f5740256d        redis:alpine        "docker-entrypoint.s…"   About a minute ago   Up About a minute   6379/tcp            redis
   ```

   

2. Next, create a simple container called `clickcounter` with the image `kodekloud/click-counter`, link it to the `redis` container that we created in the previous task and then expose it on the host port `8085`

   The `clickcounter` app run on port `5000`.
   if you are unsure, check the hints section for the exact commands.

   ```
   $ docker run -d --name=clickcounter --link redis:redis -p 8085:5000 kodekloud/click-counter
   ```

3. Let's clean up the actions carried out in previous steps. Delete the `redis` and the `clickcounter` containers.

   ```
   $ docker stop redis
   
   $ docker rm redis
   
   $ docker stop clickcounter
   
   $ docker rm clickcounter
   ```

4. Create a `docker-compose.yml` file under the directory `/root/clickcounter`. Once done, run `docker-compose up`.

   The compose file should have the exact specification as follows -

   1. `redis` service specification - Image name should be `redis:alpine`.

   2. `clickcounter` service specification - Image name should be `kodekloud/click-counter`, app is run on port `5000` and expose it on the host port `8085` in the compose file.
   
      docker-compose.yml
   
      ```
      version: '3.0'
      services:
        redis:
          image: redis:alpine
        
        clickcounter:
          image: kodekloud/click-counter
          ports:
          - 8085:5000
      ```
   
      ```
      $ docker-compose up -d
      Creating network "clickcounter_default" with the default driver
      Creating clickcounter_clickcounter_1 ... done
      Creating clickcounter_redis_1        ... done
      ```
   
   

# DOCKER ENGINE, STORAGE, LABS: DOCKER STORAGE

   

   1. What location are the files related to the docker containers and images stored?
      - /etc/docker
      - /opt/docker
      - **/var/lib/docker**
      - /tmp/docker
   
   2. What directory under `/var/lib/docker` are the files related to the container `alpine-3` image stored?
   
      - **7061a708e817af57ba4e8965726cec90a137bc878f9dd25b7598003d5a21334e**
      - 643b9cf496c099293d77cf530ed627c815321d2c22def65ef21cc29071d80a4a
      - null
      - 6fa415a7d24c669c661597853b5ef4f375c86761a2c5d12bfa2550a3a48ed95e
     
      ```
      $ docker ps -a
      CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                     PORTS               NAMES
      7061a708e817        alpine              "/bin/sh"           2 minutes ago       Exited (0) 2 minutes ago                       alpine-3
      d95974753e44        alpine              "/bin/sh"           2 minutes ago       Exited (0) 2 minutes ago                       alpine-2
      cc336b6b1075        alpine              "/bin/sh"           2 minutes ago       Exited (0) 2 minutes ago                       alpine-1
      ```
   
   3. Run a `mysql` container named `mysql-db` using the `mysql` image. Set database password to `db_pass123`
   
      Note: Remember to run it in the detached mode.
   
      ```
      docker run -d --name mysql-db -e MYSQL_ROOT_PASSWORD=db_pass123 mysql
      ```
   
   4. We have just written some data into the database. To view the information we wrote, run the get-data.sh script available in the `/root` directory. How many customers data have been written to the database?
   
      Command: `sh get-data.sh`
   
      - **30**
      - 10
      - 40
      - 20
     
      
   get-data.sh 
      
      ```
      docker exec mysql-db mysql -pdb_pass123 -e 'use foo; select * from myTable'
   ```
      
      ```
      $ sh get-data.sh 
      mysql: [Warning] Using a password on the command line interface can be insecure.
      id      Name    Phone   Email
      1       Kareem  130-5655        Duis.volutpat.nunc@quamCurabitur.org
      2       Ruby    1-584-149-0770  Nulla.tempor@vitaeorciPhasellus.org
      3       Rowan   199-8663        consectetuer.adipiscing.elit@Sedmalesuada.co.uk
      4       Alisa   220-6017        elementum.sem.vitae@enimMauris.edu
      5       Ella    731-0337        fermentum@nec.net
      6       Tiger   658-4480        quis.diam@odiovelest.net
      7       Felix   1-274-848-3378  Mauris.vel@arcu.com
      8       Karina  1-390-796-3451  sagittis.semper@odioapurus.co.uk
      9       Davis   605-8539        venenatis.vel@risusDonecnibh.com
      10      Mohammad        1-590-174-1489  ornare.sagittis.felis@natoque.ca
      11      Zane    362-1770        Aenean.euismod@condimentum.co.uk
      12      Piper   1-231-386-6903  nunc.sed.pede@nascetur.ca
      13      Marshall        1-383-729-4990  Cras.interdum.Nunc@neceuismod.ca
      14      Zena    241-6641        Fusce.mollis.Duis@lobortis.org
      15      Abdul   1-748-387-9935  eget.lacus.Mauris@Crasvehicula.com
      16      Chase   1-401-241-9169  ante.dictum.mi@nascetur.org
      17      Zahir   921-0663        non@nonummyutmolestie.edu
      18      Brenda  1-691-909-5827  Quisque.ac@magnaCras.co.uk
      19      Laura   1-562-983-9565  Quisque.ornare.tortor@sollicitudinadipiscing.ca
      20      Madison 1-348-737-0587  Quisque.varius@Intinciduntcongue.org
      21      Tanek   991-6278        dignissim.magna@Pellentesqueutipsum.net
      22      Dakota  893-0792        Nullam.enim.Sed@nulla.net
      23      Boris   1-297-302-5792  non.sollicitudin@eleifendegestasSed.co.uk
      24      Celeste 723-6729        mauris.rhoncus@eunulla.edu
      25      Connor  1-203-901-7531  et@loremipsumsodales.edu
      26      Perry   1-756-607-9187  eros.turpis@tristiquepharetra.co.uk
      27      Hayfa   1-609-407-3019  non.lobortis.quis@malesuadafringilla.net
      28      Todd    343-0454        id.erat@arcu.org
      29      Fuller  881-7273        non.feugiat.nec@adipiscingelit.net
      30      Rama    1-927-605-0610  nonummy.ultricies.ornare@malesuada.co.uk
   ```
   
   5. The database crashed. Are you able to view the data now?
   
      Use the same command to try and view data. Try to find the container.
   
      - **NO**
      - YES
     
      ```
      $ sh get-data.sh 
      Error: No such container: mysql-db
      ```
   
   6. Damn! We didn't plan that well at all. Let's try again!!
   
      Ok
   
   7. Run a mysql container again, but this time map a volume to the container so that the data stored by the container is stored at `/opt/data` on the host.
   
      Use the same name : `mysql-db` and same password: `db_pass123` as before. Mysql stores data at `/var/lib/mysql` inside the container.
   
      ```
      docker run -v /opt/data:/var/lib/mysql -d --name mysql-db -e MYSQL_ROOT_PASSWORD=db_pass123 mysql
      ```
   
   8. We have now re-written data again. Run the `get-data.sh` script to ensure data is present.
   
      Command: `sh get-data.sh`
   
      
   
   9. Disaster strikes.. again! And the database crashed again. But this time we have the data stored at `/opt/data` directory. Re-deploy a new mysql instance using the same options as before.
   
      Just run the same command as before. Here it is for your convenience: `docker run -v /opt/data:/var/lib/mysql -d --name mysql-db -e MYSQL_ROOT_PASSWORD=db_pass123 mysql`
   
   10. Fetch data and make sure it is present.
   
       command: `sh get-data.sh`

   

   # DOCKER NETWORKING, LABS: DOCKER NETWORKING

   1. Explore the current setup and identify the number of networks that exist on this system.

      - 2
      - 1
      - **3**
      - 4
        
      ```
      $ docker network ls
      NETWORK ID          NAME                DRIVER              SCOPE
      33156f32e63c        bridge              bridge              local
      5de628a52135        host                host                local
      e32507f046e4        none                null                local
      ```

      

   2. What is the ID associated with the bridge network?

      - **33156f32e63cc1f5dc0e704da580177ebf08a108b5a4536f0c83339f88d28653**
      - fb9c1a74a36514f6f2d767eee7be024a0ffd40b6cf208886de42ee8003f5a6a6
      - d6d852f6099426dadfdad90852f13b9a8695e93d20f028de939baf2c047faf85
        
      ```
      $ docker network ls
      NETWORK ID          NAME                DRIVER              SCOPE
      33156f32e63c        bridge              bridge              local
      5de628a52135        host                host                local
      e32507f046e4        none                null                local
      ```

   3. We just ran a container named `alpine-1`. Identify the network it is attached to.

      - none
      - **host**
      - bridge
        
      ```
      $ docker inspect alpine-1 | grep -A 10 Networks
                  "Networks": {
                      "host": {
                          "IPAMConfig": null,
                          "Links": null,
                          "Aliases": null,
                          "NetworkID": "5de628a521355060cff1ddf0528bd34bc17bb837083cc7193f42507e26fe524a",
                          "EndpointID": "aaab1c4d15db0e78f24e46ef898af9af2aab2de38b933c7e0bac3dd4feef1864",
                          "Gateway": "",
                          "IPAddress": "",
                          "IPPrefixLen": 0,
                          "IPv6Gateway": "",
      ```

      

   4. What is the subnet configured on `bridge` network?

      - 182.18.0.1/16
      - **172.12.0.0/24**
      - 192.168.0.1/24
        
      ```
      $ docker network inspect bridge
      [
          {
              "Name": "bridge",
              "Id": "33156f32e63cc1f5dc0e704da580177ebf08a108b5a4536f0c83339f88d28653",
              "Created": "2022-12-26T13:07:09.189282129Z",
              "Scope": "local",
              "Driver": "bridge",
              "EnableIPv6": false,
              "IPAM": {
                  "Driver": "default",
                  "Options": null,
                  "Config": [
                      {
                          "Subnet": "172.12.0.0/24",
                          "Gateway": "172.12.0.1"
                      }
                  ]
              },
              "Internal": false,
              "Attachable": false,
              "Ingress": false,
              "ConfigFrom": {
                  "Network": ""
              },
              "ConfigOnly": false,
              "Containers": {},
              "Options": {
                  "com.docker.network.bridge.default_bridge": "true",
                  "com.docker.network.bridge.enable_icc": "true",
                  "com.docker.network.bridge.enable_ip_masquerade": "true",
                  "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
                  "com.docker.network.bridge.name": "docker0",
                  "com.docker.network.driver.mtu": "1500"
              },
              "Labels": {}
          }
      ]
      ```

   5. Run a container named `alpine-2` using the `alpine` image and attach it to the `none` network.

      Check

      - Name: alpine-2 attached to none network
        
      ```
      docker run -d --name alpine-2 --network=none alpine
      ```

   6. Create a new network named `wp-mysql-network` using the `bridge` driver. Allocate subnet `182.18.0.1/24`. Configure `Gateway 182.18.0.1`

      Check

      - Name: wp-mysql-network
      - Driver: bridge
      - subnet: 182.18.0.1/24
      - Gateway: 182.18.0.1

      ```
      $ docker network create --driver bridge --subnet 182.18.0.1/24 --gateway 182.18.0.1 wp-mysql-network
      ```

      Inspect the created network by

      ```
      $ docker network inspect wp-mysql-network
      [
          {
              "Name": "wp-mysql-network",
              "Id": "2a616d2349e2b8ce0a68f31e82f8d733874ba2b1663265f3d5355000a95de3f3",
              "Created": "2022-12-26T13:40:55.750232349Z",
              "Scope": "local",
              "Driver": "bridge",
              "EnableIPv6": false,
              "IPAM": {
                  "Driver": "default",
                  "Options": {},
                  "Config": [
                      {
                          "Subnet": "182.18.0.1/24",
                          "Gateway": "182.18.0.1"
                      }
                  ]
              },
              "Internal": false,
              "Attachable": false,
              "Ingress": false,
              "ConfigFrom": {
                  "Network": ""
              },
              "ConfigOnly": false,
              "Containers": {},
              "Options": {},
              "Labels": {}
          }
      ]
      ```

   7. Deploy a `mysql` database using the `mysql:5.6` image and name it `mysql-db`. Attach it to the newly created network `wp-mysql-network`

      Set the database password to use `db_pass123`. The environment variable to set is `MYSQL_ROOT_PASSWORD`.

      Check

      - Name: mysql-db
      - Image: mysql:5.6
      - Env: MYSQL_ROOT_PASSWORD=db_pass123
      - Network: wp-mysql-network

      ```
      $ docker run -d -e MYSQL_ROOT_PASSWORD=db_pass123 --name mysql-db --network wp-mysql-network mysql:5.6
      ```

   8. Deploy a web application named `webapp` using the `kodekloud/simple-webapp-mysql` image. Expose the port to 38080 on the host.

      The application makes use of two environment variable:
      1: `DB_Host` with the value `mysql-db`.
      2: `DB_Password` with the value `db_pass123`.
      Make sure to attach it to the newly created network called `wp-mysql-network`.

      Also make sure to link the `MySQL` and the `webapp` container.

      Check

      - Name: webapp
      - Image: kodekloud/simple-webapp-mysql
      - Env: DB_Host=mysql-db
      - Network: wp-mysql-network

      ```
      $ docker run -d --name webapp -e DB_Host=mysql-db -e DB_Host=mysql-db -e DB_Password=db_pass123 --network=wp-mysql-network -p 38080:8080 --link mysql-db:mysql-db kodekloud/simple-webapp-mysql
      ```

   9. If you are successfull, you should be able to view the application by clicking on the `HOST:38080` at the top of your terminal. You should see a green success message.

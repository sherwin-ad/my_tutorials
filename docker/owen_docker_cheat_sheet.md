

[TOC]



# Docker

## Docker Meaning

* Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and deploy it as one package.
* Docker is a set of platform as a service (PaaS) products that uses OS-level virtualization to deliver software in packages called containers.
* Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels.
* All containers are run by a single operating system kernel and therefore use fewer resources than virtual machines

## Docker Advantages

* Resource Efficiency: Process level isolation and usage of the container host’s kernel is more efficient when compared to virtualizing an entire hardware server.

* Portability: All the dependencies for an application are bundled in the container. This means they can be easily moved between development, test, and production environments.

* Continuous Deployment and Testing: The ability to have consistent environments and flexibility with patching has made Docker a great choice for teams that want to move from waterfall to the modern DevOps approach to software delivery.

## Docker Architecture
![Docker Architecture](architecture.svg)

### The Docker client

* The Docker client (docker) is the primary way that many Docker users interact with Docker. When you use commands such as docker run, the client sends these commands to dockerd, which carries them out. The docker command uses the Docker API. The Docker client can communicate with more than one daemon.

### Docker registries

* A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use, and Docker is configured to look for images on Docker Hub by default. You can even run your own private registry. If you use Docker Datacenter (DDC), it includes Docker Trusted Registry (DTR).

### Docker objects

* When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects. This section is a brief overview of some of those objects.

### Images

* An image is a read-only template with instructions for creating a Docker container. Often, an image is based on another image, with some additional customization. For example, you may build an image which is based on the ubuntu image, but installs the Apache web server and your application, as well as the configuration details needed to make your application run.

* You might create your own images or you might only use those created by others and published in a registry. To build your own image, you create a Dockerfile with a simple syntax for defining the steps needed to create the image and run it. Each instruction in a Dockerfile creates a layer in the image. When you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.

### Containers

* A container is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new image based on its current state.

* By default, a container is relatively well isolated from other containers and its host machine. You can control how isolated a container’s network, storage, or other underlying subsystems are from other containers or from the host machine.

* A container is defined by its image as well as any configuration options you provide to it when you create or start it. When a container is removed, any changes to its state that are not stored in persistent storage disappear.

## Manage Images

### Registry & Repository
```
$ docker login  # to login to a registry.
$ docker logout # to logout from a registry.
$ docker search # searches registry for image.
$ docker pull   # pulls an image from registry to local machine.
$ docker push   # pushes an image to the registry from local machine.
```

### Creating image using Dockerfile

average.js
```
var sum = 0;
var count = 0;
process.argv.forEach(function (val, index, array) {
  if(index > 1) {
    sum += parseInt(val);
    count ++;
  }
});
console.log(sum / count);
```

Dockerfile
```
FROM alpine
MAINTAINER sherwinowen <sherwin_ad@yahoo.com>
RUN apk update && apk add nodejs
RUN mkdir average
ADD average.js average/
WORKDIR average
ENTRYPOINT ["node","average.js"]
```

Create the image
```
docker build -t sherwinowen/average .
```

### Lifecycle
```
$ docker images
  REPOSITORY   TAG        ID
  ubuntu       12.10      b750fe78269d
  me/myapp     latest     7b2431a8d968

$ docker images # show all images
$ docker build  # creates image from Dockerfile.


$ docker commit # creates image from a container, pausing it temporarily if it is running.
# sample 
docker commit -m "installed node and wrote average application" 818d3af2e54d
sha256:d234bf1e2c83b825c8fca3415d87212398a098f3bd03b8077a5d5bd2be7805b3


$ docker rmi    # removes an image.

$ docker load   # loads an image from a tar archive as STDIN, including images and tags (as of 0.7).
# sample
$ docker load < my_image.tar.gz

$ docker save   # saves an image to a tar archive stream to STDOUT with all parent layers, tags & versions (as of 0.7).
# sample
docker save my_image:my_tag | gzip > my_image.tar.gz

$ docker import # import container.
# sample
cat my_container.tar.gz | docker import - my_image:my_tag

$ docker export # export container.
# sample
docker export my_container | gzip > my_container.tar.gz

# Difference between loading a saved image and importing an exported container as an image
Loading an image using the load command creates a new image including its history.
Importing a container as an image using the import command creates a new image excluding the history which results in a smaller image size compared to loading an image.
```

### Info
```
$ docker history # shows history of image.

Example:
$ docker history ubuntu
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
2ca708c1c9cc        6 months ago        /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  

$ docker tag     # tags an image to a name (local or registry).
```

## Manage Containers

### Run an interactive container
```
$ docker run -it ubuntu bash
root@94b64d3ca5b4:/#

# Note:
[ctrl]+[p][q] # to quit and can attched to the container again
```

### Start container with volumes

```
$ docker run -d --name devtest --mount source=myvol,target=/usr/share/nginx/html
nginx:latest
```

### Backup  and Restore image

```
$ docker save -o nginx-custom.tar nginx-custom

$ docker load -i nginx-custom.tar 
bebd85308c10: Loading layer [==================================================>]  6.144kB/6.144kB
Loaded image: nginx-custom:latest
sherwinowen@owenbox:~$ docker images
REPOSITORY                    TAG                 IMAGE ID       CREATED         SIZE
nginx-custom                  latest              c6f13c48b373   9 minutes ago   133MB

```

### Remove all unused volumes
```sh
$ docker volume prune
```





### 

```
```





### Lifecycle

```
$ docker create [options] IMAGE
  -a, --attach               # attach stdout/err
  -i, --interactive          # attach stdin (interactive)
  -t, --tty                  # pseudo-tty
      --name NAME            # name your image
  -p, --publish 5000:5000    # port map
      --expose 5432          # expose a port to linked containers
  -P, --publish-all          # publish all ports
      --link container:alias # linking
  -v, --volume `pwd`:/app    # mount (absolute paths needed)
  -e, --env NAME=hello       # env vars

$ docker run    # creates and starts a container in one operation.

# Run container in background
$ docker run -d -it --name shen ubuntu

# To reattach to a detached container
$ docker attach [name of container]
or
$ docker attach [container id]
root@94b64d3ca5b4:/#

# Note:
[ctrl]+[p][q] # to quit and can attched to the container again

$ docker create # creates a container but does not start it.
$ docker rename # allows the container to be renamed.
$ docker rm     # deletes a container.
$ docker update # updates a container's resource limits.
```

### Run a command in a running container
```
$ docker exec [options] CONTAINER COMMAND
  -d, --detach        # run in background
  -i, --interactive   # stdin
  -t, --tty           # interactive

Example :
$ docker exec app_web_1 tail logs/development.log
$ docker exec -t -i app_web_1 rails c
```

### Starting/Stoping container
```
$ docker start [options] CONTAINERDockerfile
  -a, --attach        # attach stdout/err
  -i, --interactive   # attach stdin

$ docker start    # starts a container so it is running.
$ docker stop     # stops a running container.
$ docker restart  # stops and starts a container.
$ docker pause    # pauses a running container, "freezing" it in place.
$ docker unpause  # will unpause a running container.
$ docker wait     # blocks until running container stops.
$ docker kill $ID # sends a SIGKILL to a running container.
$ docker attach   # will connect to a running container.

docker stop $(docker ps -aq) # stop all containers
docker rm $(docker ps -aq)   # remove all containers
````
### Info
```
$ docker ps      # shows running containers.
$ docker logs    # gets logs from container. (You can use a custom log driver, but logs is only available for json-file and journald in 1.10).
$ docker inspect # looks at all the info on a container (including IP address).
$ docker events  # gets events from container.
$ docker port    # shows public facing port of container.
$ docker top     # shows running processes in container.
$ docker stats   # shows containers' resource usage statistics.
$ docker diff    # shows changed files in the container's FS.
```

## Networks

### Lifecycle

```
# Create network
docker network create

# sample
docker network create --driver bridge ubuntu-net

# Delete network
docker network rm

#Create container using the network created
docker run -dit --name ubuntu3 --network ubuntu-net ubuntu

# Check the IPAddress of the container
docker inspect --format='{{.NetworkSettings.IPAddress}}' redis

or

docker network inspect mynetwork | grep -i -A5 a99ede298ebb

```

### Info
```
docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
10172ea36bb8        bridge              bridge              local
4dcae6326591        host                host                local
c51c33d3f3a0        none                null                local

# To see what containers are connected to it.
$ docker network inspect bridge
[
    {
        "Name": "bridge",
        "Id": "10172ea36bb8079e1aa0eceec55852210f181b99787ea7c1ae0ec5886b992f8e",
        "Created": "2020-03-22T06:20:14.561502607+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
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
        "Containers": {
            "460b624130ac027fdb3d1e0f7d95fb1711f975930cf7cda9cf33400e017f2a74": {
                "Name": "ubuntu2",
                "EndpointID": "85b620a54470e98640b27c7815e19a377d5c75245196a4dc658cc44954546638",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            },
            "828b9b933827dc8c3b7d1a02bd36a39a686c307c25fe66ff17006209ccee1f04": {
                "Name": "ubuntu1",
                "EndpointID": "05e45dc259e6dfc6ee6a096aa8132b706815dc80f8a121001e1138d0b868a851",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            }
        },
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

### Connection
```
# Connect a container to a network
$ docker network connect [network name] [container name]

# Disconnect a container to a network
$ docker network disconnect [network name] [container name]
```

## Volumes

### Lifecycle

```
# Create volume
$ docker volume create [volume name]

#Remove volume
$ docker volume rm [volume name]
```

### Info
```
# List volumes
$ docker volume ls

# Inspect volumes
$ docker volume inspect

# Mounting volumes(deprecated - use LABEL instead) Set the Author field of the generated images.

# Mounting the volume created
$ docker run -d --name webApp2 --mount source=owen_volume,destination=/usr/share/nginx/html -p 80:80 nginx
```

## Dockerfilel

### Creating our own images

### Creating a Dockerfile

```
$ mkdir images
$ cd images
$ vi Dockerfile
```

#### .dockerignore

```
# File prevents our local modules and other unwanted files from being copied onto the Docker image

Example .dockerignore file:

# comment
*/temp*
*/*/temp*
temp?
```

### Instructions

#### FROM
```
- Sets the Base Image for subsequent instructions.

Usage:
FROM <image>
FROM <image>:<tag>
FROM <image>@<digest>

Example:
# Download base image ubuntu 16.04
FROM ubuntu:16.04
```

#### MAINTAINER
```
- (deprecated - use LABEL instead) Set the Author field of the generated images.

Usage:
MAINTAINER <name>

or

Example:
LABEL maintainer="SvenDowideit@home.org.au"
```

#### RUN

```
- execute any commands in a new layer on top of the current image and commit the results.

Usage:
RUN <command> (shell form, the command is run in a shell, which by default is /bin/sh -c on Linux or cmd /S /C on Windows)
RUN ["<executable>", "<param1>", "<param2>"] (exec form)

Example:
RUN apt update
RUN mkdir -p /run/php && \
    chown -R www-data:www-data /var/www/html && \
    chown -R www-data:www-data /run/php
```

#### CMD

```
- provide defaults for an executing container.

Usage:
CMD ["<executable>","<param1>","<param2>"] (exec form, this is the preferred form)
CMD ["<param1>","<param2>"] (as default parameters to ENTRYPOINT)
CMD <command> <param1> <param2> (shell form)

Example:
# Default port to execute the entrypoint (MongoDB)
CMD ["--port 27017"]
```

#### EXPOSE

```
- informs Docker that the container listens on the specified network ports at runtime. NOTE: does not actually make ports accessible.

Usage:
EXPOSE <port> [<port> ...]

Example:
# Expose the default port
EXPOSE 27017
EXPOSE 80 443
```

#### ENV

```
- sets environment variable.

Usage:
ENV <key> <value>
ENV <key>=<value> [<key>=<value> ...]

Example:
#Define the ENV variable
ENV nginx_vhost /etc/nginx/sites-available/default
ENV php_conf /etc/php/7.0/fpm/php.ini
ENV nginx_conf /etc/nginx/nginx.conf
ENV supervisor_conf /etc/supervisor/supervisord.conf
```

#### ADD

```
- copies new files, directories or remote file to container.
- Invalidates caches. Avoid ADD and use COPY instead.


Usage:
ADD [--chown=<user>:<group>] <src>... <dest>
ADD [--chown=<user>:<group>] ["<src>",... "<dest>"] (this form is required for paths containing whitespace)

Example:
ADD hom* /mydir/        # adds all files starting with "hom"
ADD hom?.txt /mydir/    # ? is replaced with any single character, e.g., "home.txt"
ADD --chown=55:mygroup files* /somedir/
```

#### COPY

```
- copies new files or directories to container.
- By default this copies as root regardless of the USER/WORKDIR settings.

Note:
Use --chown=<user>:<group> to give ownership to another user/group. (Same for ADD.)

Usage:
COPY [--chown=<user>:<group>] <src>... <dest>
COPY [--chown=<user>:<group>] ["<src>",... "<dest>"] (this form is required for paths containing whitespace)

Example:
COPY hom* /mydir/        # adds all files starting with "hom"
COPY --chown=55:mygroup files* /somedir/
```

#### ENTRYPOINT

```
- configures a container that will run as an executable.

Usage:
ENTRYPOINT ["executable", "param1", "param2"] (exec form, preferred)
ENTRYPOINT command param1 param2 (shell form)

Example:
# Set default container command
ENTRYPOINT usr/bin/mongodb
```

#### VOLUME

```
- creates a mount point for externally mounted volumes or other containers.

Usage:
VOLUME ["<path>", ...]
VOLUME <path> [<path> ...]

Example:
# Volume configuration
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]
```

#### USER

```
- sets the user name for following RUN / CMD / ENTRYPOINT commands.

Usage:
USER <user>[:<group>] or
USER <UID>[:<GID>]

Example:
USER sherwinowen:sudo
```

#### WORKDIR

```
- sets the working directory.

Usage:
WORKDIR /path/to/workdir

Example:
# Create app directory
RUN mkdir /app
WORKDIR /app
```

#### ARG

```
- defines a build-time variable.

Usage:
ARG <name>[=<default value>]

Information:
* Defines a variable that users can pass at build-time to the builder with the docker build command using the --build-arg <varname>=<value> flag.
* Multiple variables may be defined by specifying ARG multiple times.
* It is not recommended to use build-time variables for passing secrets like github keys, user credentials, etc. Build-time variable values are visible to any user of the image with the docker history command.
* Environment variables defined using the ENV instruction always override an ARG instruction of the same name.
* Docker has a set of predefined ARG variables that you can use without a corresponding ARG instruction in the Dockerfile.
    * HTTP_PROXY and http_proxy
    * HTTPS_PROXY and https_proxy
    * FTP_PROXY and ftp_proxy
    * NO_PROXY and no_proxy
```

#### ONBUILD

```
- adds a trigger instruction when the image is used a the base for another build.

Usage:
ONBUILD <Dockerfile INSTRUCTION>

Information:
* Adds to the image a trigger instruction to be executed at a later time, when the image is used as the base for another build. The trigger will be executed in the context of the downstream build, as if it had been inserted immediately after the FROM instruction in the downstream Dockerfile.
* Any build instruction can be registered as a trigger.
* Triggers are inherited by the "child" build only. In other words, they are not inherited by "grand-children" builds.
* The ONBUILD instruction may not trigger FROM, MAINTAINER, or ONBUILD instructions.

```

#### STOPSIGNAL
```
- sets the system call signal that will be sent to the container to exit.

Usage:
STOPSIGNAL <signal>

* The STOPSIGNAL instruction sets the system call signal that will be sent to the container to exit. This signal can be a valid unsigned number that matches a position in the kernel’s syscall table, for instance 9, or a signal name in the format SIGNAME, for instance SIGKILL.

```

#### LABEL
```
- apply key/value metadata to your images, containers, or daemons.

Usage:
LABEL <key>=<value> [<key>=<value> ...]

Information:
* The LABEL instruction adds metadata to an image.
* To include spaces within a LABEL value, use quotes and backslashes as you would in command-line parsing.
* Labels are additive including LABELs in FROM images.
* If Docker encounters a label/key that already exists, the new value overrides any previous labels with identical keys.
* To view an image’s labels, use the docker inspect command. They will be under the "Labels" JSON attribute.
```

#### SHELL
```
- override default shell is used by docker to run commands.

Usage:
SHELL ["<executable>", "<param1>", "<param2>"]

Information:
* Allows the default shell used for the shell form of commands to be overridden.
* Each SHELL instruction overrides all previous SHELL instructions, and affects all subsequent instructions.
* Allows an alternate shell be used such as zsh, csh, tcsh, powershell, and others.


```

#### HEALTHCHECK

```
- tells docker how to test a container to check that it is still working.
Usage:
HEALTHCHECK [<options>] CMD <command> (check container health by running a command inside the container)

HEALTHCHECK NONE (disable any healthcheck inherited from the base image)

Information:
* Tells Docker how to test a container to check that it is still working
* Whenever a health check passes, it becomes healthy. After a certain number of consecutive failures, it becomes unhealthy.
* The <options> that can appear are...
        --interval=<duration> (default: 30s)
        --timeout=<duration> (default: 30s)
        --retries=<number> (default: 3)
* The health check will first run interval seconds after the container is started, and then again interval seconds after each previous check completes. If a single run of the check takes longer than timeout seconds then the check is considered to have failed. It takes retries consecutive failures of the health check for the container to be considered unhealthy.
* There can only be one HEALTHCHECK instruction in a Dockerfile. If you list more than one then only the last HEALTHCHECK will take effect.
* <command> can be either a shell command or an exec JSON array.
    The command's exit status indicates the health status of the container.
        * 0: success - the container is healthy and ready for use
        * 1: unhealthy - the container is not working correctly
        * 2: reserved - do not use this exit code
* The first 4096 bytes of stdout and stderr from the <command> are stored and can be queried with docker inspect.
* When the health status of a container changes, a health_status event is generated with the new status.

```

### Create a mysql container

1. create two sql scripts create-table.sql & insert-data.sql

   create-table.sql

   ```sql
   CREATE TABLE employees (
       EID INT,
       LastName VARCHAR(255),
       FirstName VARCHAR(255),
       Department VARCHAR(255),
       Email VARCHAR(255)
   );
   ```

   nsert-data.sql

   ```sql
   INSERT INTO employees (EID, Lastname, Firstname, Department, Email)
   VALUES ('001', 'Adriano', 'Sherwin', 'IT', 'sherwin.adriano@gmail.com');
   ```

2. Create Dockerfile

   ```sh
   FROM mysql
   ENV MYSQL_DATABASE learn-docker
   COPY ./sql-scripts/ /docker-entrypoint-initdb.d/ 
   ```

3. Create docker image from the docker file

   ```sh
   docker build . -t my-mysql
   ```

4. Start a container from the image

   ```sh
   $ docker run -d -p 3306:3306 --name my-mysql -e MYSQL_ROOT_PASSWORD=supersecret my-mysql
   ```

5. Verify our customer mysql

   ```sh
   $ docker exec -it my-mysql bash
   ```

### Push image to docker hub

1. Create docker image from the docker file

   ```sh
   $ docker build . -t sherwinowen/my-mysql:v1
   ```

2. Login to the docker hub via command line

   ```sh
   $ docker login
   ```

3. Push the image in the Docker Hub

   ```sh
   $ docker push sherwinowen/my-mysql:v1
   The push refers to repository [docker.io/sherwinowen/my-mysql]
   a21d30f0896c: Pushed 
   da89a9a78c2d: Mounted from library/mysql 
   471fa3dcb220: Mounted from library/mysql 
   75dbcfc48320: Mounted from library/mysql 
   373557f47aa4: Mounted from library/mysql 
   a22d260e6692: Mounted from library/mysql 
   f8389e4e632e: Mounted from library/mysql 
   b58f3b77172b: Mounted from library/mysql 
   17e5430d2956: Mounted from library/mysql 
   e050d4242497: Mounted from library/mysql 
   8b73ecde66c0: Mounted from library/mysql 
   90e0289c2b06: Mounted from library/mysql 
   e81bff2725db: Mounted from library/mysql 
   v1: digest: sha256:7fbdc8ffbef4fee6a422cfd93dbaeac6a17074aa4687ecd3ee3187f45ce1f388 size: 3035
   ```

   

### Running a Dockerfile

```
$ docker build -t my_ubuntu .
```

## Docker Compose

### Install Docker Compose

1. Run this command to download the current stable release of Docker Compose:
```
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
2. Apply executable permissions to the binary:
```
$ sudo chmod +x /usr/local/bin/docker-compose
```
3. Create a symbolic link to /usr/bin
```
$ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```
4. Test the installation.
```
$ docker-compose --version
docker-compose version 1.25.4, build 1110ad01
```

### Section (docker-compose.yml)

#### VERSION

```
version: “2”
Basically this defines the compatibility of various services & docker versions.
Its mainly divided into three versions ‘1’, ‘2.X’ & ‘3.X’.
```
#### Building – from Dockerfile or image

#### SERVICES

```
# Service name

web:
  # build from Dockerfile
  build: .
  # build from custom Dockerfile
  build:
    context: ./dir
    dockerfile: Dockerfile.dev

  # build from image
  image: centos:latest
  image: ubuntu:14.04
  image: tutum/influxdb
  image: example-registry:4000/postgresql
```

#### Environment variables
```
# environment vars
environment:
  DB_HOST: http://localhost:263

environment:
  - RACK_ENV=development

# environment vars from file
env_file: .env
env_file: [.env, .development.env]
```

#### Ports binding
```
  ports:
      - "3000"
      - "8000:80"  # HOST:CONTAINER

  # expose ports to linked services (not to host)
  expose: ["3000"]
```

#### Command and Entrypoint
```
# command to execute
command: bundle exec thin -p 3000
command: [bundle, exec, thin, -p, 3000]

# override the entrypoint
entrypoint: /app/start.sh
entrypoint: [php, -d, vendor/bin/phpunit]
```

#### Volume – Storage mapping

```
# environment vars
environment:
  DB_HOST: http://localhost:263

environment:
  - RACK_ENV=development

# environment vars from file
env_file: .env
env_file: [.env, .development.env]
```

#### Dependencies – dependent services
```
# makes the `db` service available as the hostname `database`
# (implies depends_on)
links:
  - db:database
  - redis
# make sure `db` is alive before starting
depends_on:
  - db
```

#### Labels

```
services:
  web:
    labels:
      com.app.description: "My web app"
```

#### DNS Servers
```
services:
  web:
    dns: 8.8.8.8
    dns:
      - 8.8.8.8
      - 8.8.4.4
```

#### Devices
```
services:
  web:
    devices:
    - "/dev/ttyUSB0:/dev/ttyUSB0"
```

#### External links
```
services:
  web:
    external_links:
      - redis_1
      - project_db_1:mysql
```

#### Hosts
```
services:
  web:
    extra_hosts:
      - "somehost:192.168.1.100"
```

#### docker-compose.yml example explanation

```
In this example to learn docker compose, we will accomplish the following things:

# Use docker-compose version 2 to create docker-compose.yaml file.
# Add one more service named “db” under the same docker-compose file.
# Use an image named MySQL with version 5.7
# Use volume wordpress_data and map it to /var/lib/mysql
# Enable always restart parameter. * Add environment variables named “MYSQL_ROOT_PASSWORD”, “MYSQL_DATABASE”, “MYSQL_USER” and “MYSQL_PASSWORD” along with corresponding values for all.
# Create a service/container named “WordPress” using wordpress:latest image.
# Add dependency of db service in WordPress service.
# Map port of WordPress container port 80 to host system port 8000.
# Add a parameter to restart container in case service went down.
# Within the WordPress environment variable, add wordpress_db_host value along with the port.
# Also, add one more variable named wordpress_db_password.
# Add a volume named wordpress_data
```
#### docker-compose.yml example

```
version: “2”
services:
    db:
        image: mysql:5.7
        volumes:
            – wordpress_data:/var/lib/mysql
        restart: always
        environment:
            MYSQL_ROOT_PASSWORD: test@979
            MYSQL_DATABASE: wordpress_db
            MYSQL_USER: testuser
            MYSQL_PASSWORD: test@123
    wordpress:
        depends_on:
            – db
        image: wordpress:latest
        ports:
            – 8000:80
        restart: always
        environment:
            wordpress_db_host: db:3306
            wordpress_db_password: test@123
volumes:
    wordpress_data: {}
```

### Some important Docker compose commands

```
# Running docker-compose file
$ docker-compose -f docker-compose.yml up

# To check the running containers, run
$ docker-compose ps

# To stop the running docker containers,
$ docker-compose stop

# To remove them from localhost
$ docker-compose rm
```

## How to Create a Docker Image From a Container

1. Create a Base Container

   ```
   docker run -d --name myweb -p 80:80 nginx
   ```

2. Modify the Running Container

   index.html

   ```
   <! DOCTYPE html>
   <html>
       <head>
   	    <title>Example</title>
       </head>
       <body>
   	    <p>Hello World!</p>
       </body>	    
   </html>
   
   ```

   ```
   docker cp index.html myweb:/usr/share/nginx/html/index.html
   ```

3. Create an Image From a Container

   ```
   $ docker commit myweb
   $ docker images
   REPOSITORY                    TAG                 IMAGE ID       CREATED         SIZE
   <none>                        <none>              94bd8c1c38f3   1 second ago    133MB
   ```

4. Tag the Image

   ```
   $ docker tag 94bd8c1c38f3 myweb-custom
   $ docker images
   REPOSITORY                    TAG                 IMAGE ID       CREATED         SIZE
   myweb-custom                 latest              94bd8c1c38f3   2 minutes ago   133MB
   
   ```

   

## Docker image scanning

**Install anchore-engine**

https://github.com/anchore/anchore-engine

1. To quickly bring up an installation of Anchore Engine on a system with docker

   ```shell
   $ mkdir anchore
   
   $ cd anchore
   
   $ curl https://engine.anchore.io/docs/quickstart/docker-compose.yaml > docker-compose.yaml
   
   $ docker-compose up -d
   
   ```

2. Installing Anchore CLI on Debian and Ubuntu

   To install Python pip. For to the Anchore home directory and run

   ```
   apt-get update
   apt-get install python-pip
   pip install anchorecli
   Note make sure ~/.local/bin is part of your PATH or just export it directly: export PATH="$HOME/.local/bin/:$PATH"
   ```

   Install the **AnchoreCLI** using python-pip

   ```
   pip install anchorecli
   ```

   This command will download and install the files for the AnchoreCLI. After installation, we now need to source our .profile file to using the command

   ```
   source ~/.profile
   ```

   To verify if the installation is successful and version of the `Anchorecli`, use the command

   ```sh
   anchore-cli --version
   ```

   To check anchore-CLI system status, use the command

   ```sh
   anchore-cli --url http://localhost:8228/v1 --u admin --p foobar system status
   Service simplequeue (anchore-quickstart, http://queue:8228): up
   Service analyzer (anchore-quickstart, http://analyzer:8228): up
   Service policy_engine (anchore-quickstart, http://policy-engine:8228): up
   Service catalog (anchore-quickstart, http://catalog:8228): up
   Service apiext (anchore-quickstart, http://api:8228): up
   
   Engine DB Version: 0.0.15
   Engine Code Version: 1.0.0
   ```

3. Define Anchore Engine parameters

   ```sh
   $ ANCHORE_CLI_URL=http://localhost:8228/v1
   $ ANCHORE_CLI_USER=admin
   $ ANCHORE_CLI_PASS=foobar
   ```

   The above sets the parameters only for the current shell. To set the current shell and other processes that start from it, we use the export command

   ```sh
   $ export ANCHORE_CLI_URL
   
   $ export ANCHORE_CLI_USER
   
   $ export ANCHORE_CLI_PASS
   ```

4. Command line examples

   Add an image to the Anchore Engine

   ```
   anchore-cli image add docker.io/library/debian:latest
   ```

   Wait for an image to transition to `analyzed`

   ```
   anchore-cli image wait docker.io/library/debian:latest
   ```

   List images analyzed by the Anchore Engine

   ```
   anchore-cli image list
   ```

   Get summary information for a specified image

   ```
   anchore-cli image get docker.io/library/debian:latest
   ```

   Perform a vulnerability scan on an image

   ```
   anchore-cli image vuln docker.io/library/debian:latest os
   ```

   Perform a policy evaluation on an image

   ```
   anchore-cli evaluate check docker.io/library/debian:latest --detail
   ```

   List operating system packages present in an image

   ```
   anchore-cli image content docker.io/library/debian:latest os
   ```

   Subscribe to receive webhook notifications when new CVEs are added to an update

   ```
   anchore-cli subscription activate vuln_update docker.io/library/debian:latest
   ```

## Docker Container Linking

Container linking allows multiple containers to link with each other. It’s the better option than exposing ports

1. Donwload Jenkins image

   ```sh
   $ docker pull jenkins/jenkins
   Using default tag: latest
   latest: Pulling from jenkins/jenkins
   bb7d5a84853b: Pull complete 
   02850768abbf: Pull complete 
   58af81139dd7: Pull complete 
   bc03f8ec113a: Pull complete 
   83dfcca17b11: Pull complete 
   b0ddf932cd44: Pull complete 
   5aeb70fbb53c: Pull complete 
   d2db9f6674bc: Pull complete 
   121eb53a0f8e: Pull complete 
   f9cb844c40b8: Pull complete 
   0210a1b74738: Pull complete 
   ec63285050c8: Pull complete 
   573294a5eca2: Pull complete 
   553604f1c054: Pull complete 
   71f550d81e2e: Pull complete 
   a00a3937ff25: Pull complete 
   6bcf1e5eaa65: Pull complete 
   Digest: sha256:d7a4e14434f949afce4b87af91ea18691e995b54b1c29a1639cd14f0e1b43213
   Status: Downloaded newer image for jenkins/jenkins:latest
   docker.io/jenkins/jenkins:latest
   ```

2. Run Jenkine container

   ```sh
   $ docker run -d --name myjenkins jenkins/jenkins
   abeff0d789b1b9aac101c92f10ed45b7ed709c90216f5575f32bef96e8eedb4d
   
   $ docker ps 
   CONTAINER ID   IMAGE                    COMMAND                  CREATED         STATUS         PORTS                                                                                  NAMES
   abeff0d789b1   jenkins/jenkins          "/sbin/tini -- /usr/…"   3 minutes ago   Up 3 minutes   8080/tcp, 50000/tcp                                                                    myjenkins
   1b31abe4762b   portainer/portainer-ce   "/portainer"             10 months ago   Up 2 days      0.0.0.0:8000->8000/tcp, :::8000->8000/tcp, 0.0.0.0:9000->9000/tcp, :::9000->9000/tcp   portainer
   
   
   
   ```

3. Create and link to an ubutu container and Run printenv, notice new variables for linking with source container

   ```sh
   $ docker run -it --link myjenkins:alias-src --name myubuntu ubuntu:latest /bin/bash
   root@7fad5a90a68f:/# printenv 
   HOSTNAME=7fad5a90a68f
   ALIAS_SRC_ENV_JAVA_HOME=/opt/java/openjdk
   ALIAS_SRC_ENV_JENKINS_UC=https://updates.jenkins.io
   ALIAS_SRC_PORT_50000_TCP=tcp://172.17.0.3:50000
   PWD=/
   ALIAS_SRC_PORT_8080_TCP_PORT=8080
   ALIAS_SRC_ENV_COPY_REFERENCE_FILE_LOG=/var/jenkins_home/copy_reference_file.log
   HOME=/root
   LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
   ALIAS_SRC_ENV_JENKINS_VERSION=2.317
   ALIAS_SRC_ENV_JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental
   ALIAS_SRC_ENV_LANG=C.UTF-8
   TERM=xterm
   ALIAS_SRC_ENV_JENKINS_HOME=/var/jenkins_home
   SHLVL=1
   ALIAS_SRC_PORT_8080_TCP_PROTO=tcp
   ALIAS_SRC_PORT_50000_TCP_PORT=50000
   ALIAS_SRC_NAME=/myubuntu/alias-src
   ALIAS_SRC_PORT_8080_TCP=tcp://172.17.0.3:8080
   ALIAS_SRC_PORT_50000_TCP_PROTO=tcp
   ALIAS_SRC_PORT=tcp://172.17.0.3:8080
   ALIAS_SRC_ENV_JENKINS_INCREMENTALS_REPO_MIRROR=https://repo.jenkins-ci.org/incrementals
   PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   ALIAS_SRC_PORT_8080_TCP_ADDR=172.17.0.3
   ALIAS_SRC_ENV_JENKINS_SLAVE_AGENT_PORT=50000
   ALIAS_SRC_ENV_REF=/usr/share/jenkins/ref
   ALIAS_SRC_PORT_50000_TCP_ADDR=172.17.0.3
   _=/usr/bin/printenv
   
   ```

   


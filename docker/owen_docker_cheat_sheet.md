# Docker

## Table of Contents
* [Docker Meaning](#docker-meaning)
* [Docker Advantages](#docker-advantages)
* [Docker Architecture](#docker-architecture)
* [Manage Images](#manage-images)
* [Manage Containers](#manage-containers)
* [Networks](#networks)
* [Volumes](#volumes)
* [Dokerfile](#dockerfile)
* [Docker Compose](docker-compose)

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
$ docker run -t -i ubuntu /bin/bash
root@94b64d3ca5b4:/#

# Note:
[ctrl]+[p][q] # to quit and can attched to the container again
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
$ docker network connect [network name] [contaiuner name]

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

## Dockerfile

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
AINTAINER <name>

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

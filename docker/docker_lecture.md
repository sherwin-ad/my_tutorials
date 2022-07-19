[TOC]

# Docker Lecture

## run

- start a container

```
docker run kodekloud/simple-webapp
```

- run the container in the background

```
docker run -d kodekloud/simple-webapp
```

- start a Bash shell in a Docker container

```
docker run -it centos bash
[root@86792eecaccd /]# cat /etc/*release*
CentOS Linux release 8.4.2105
Derived from Red Hat Enterprise Linux 8.4
NAME="CentOS Linux"
VERSION="8"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="8"
PLATFORM_ID="platform:el8"
PRETTY_NAME="CentOS Linux 8"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:8"
HOME_URL="https://centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"
CENTOS_MANTISBT_PROJECT="CentOS-8"
CENTOS_MANTISBT_PROJECT_VERSION="8"
CentOS Linux release 8.4.2105
CentOS Linux release 8.4.2105
cpe:/o:centos:centos:8
[root@86792eecaccd /]# ls
bin  etc   lib	  lost+found  mnt  proc  run   srv  tmp  var
dev  home  lib64  media       opt  root  sbin  sys  usr
```

- run command in the container

```
docker run -it centos ls
bin  etc   lib	  lost+found  mnt  proc  run   srv  tmp  var
dev  home  lib64  media       opt  root  sbin  sys  usr

docker run -it centos cat /etc/*release*
cat: /etc/lsb-release: No such file or directory
NAME="CentOS Linux"
VERSION="8"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="8"
PLATFORM_ID="platform:el8"
PRETTY_NAME="CentOS Linux 8"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:8"
HOME_URL="https://centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"
CENTOS_MANTISBT_PROJECT="CentOS-8"
CENTOS_MANTISBT_PROJECT_VERSION="8"
cat: /etc/upstream-release: No such file or directory

```

### tag

```
# Run latest version of centos
docker run centos:latest

# Run version 7 of centos
docker run centos:7

# Pull latest version of centos
docker pull centos:latest

# Run version 7 of centos
docker pull centos:7
```



### port

```
docker run -p 8001:5000 kodekloud/webapp
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
172.17.0.1 - - [19/Jul/2022 02:16:48] "GET / HTTP/1.1" 200 -
172.17.0.1 - - [19/Jul/2022 02:16:48] "GET /favicon.ico HTTP/1.1" 404 -

docker run -p 8002:5000 kodekloud/webapp
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
192.168.101.123 - - [19/Jul/2022 02:22:18] "GET / HTTP/1.1" 200 -
192.168.101.123 - - [19/Jul/2022 02:22:18] "GET /favicon.ico HTTP/1.1" 404 -
```



 ## attach

```
docker ps
CONTAINER ID   IMAGE                          COMMAND           CREATED         STATUS        PORTS                                                                                            NAMES
14a9f9c30318   kodekloud/simple-webapp        "python app.py"   2 seconds ago   Up 1 second   8080/tcp                                                                                         trusting_galileo

docker attach 14a9f9c30318
172.17.0.1 - - [19/Jul/2022 00:37:14] "GET / HTTP/1.1" 200 -
172.17.0.1 - - [19/Jul/2022 00:37:15] "GET / HTTP/1.1" 200 -
172.17.0.1 - - [19/Jul/2022 00:37:18] "GET / HTTP/1.1" 200 -
```



## ps

- list containers

```
docker ps
CONTAINER ID   IMAGE                          COMMAND        CREATED       STATUS        PORTS                                                                                            NAMES
ce58945a2343   portainer/portainer-ce:2.9.3   "/portainer"   4 weeks ago   Up 17 hours   0.0.0.0:8000->8000/tcp, :::8000->8000/tcp, 0.0.0.0:9443->9443/tcp, :::9443->9443/tcp, 9000/tcp   portainer

```

- Show all containers

```
docker ps -a
CONTAINER ID   IMAGE                              COMMAND                  CREATED          STATUS                      PORTS                                                                                            NAMES
acecb984d1bb   nginx                              "/docker-entrypoint.…"   3 minutes ago    Exited (0) 2 minutes ago                                                                                                     elated_rubin
f928d8ebd583   docker/whalesay                    "cowsay Hello-World!"    10 minutes ago   Exited (0) 10 minutes ago                                                                                                    pedantic_satoshi
ce58945a2343   portainer/portainer-ce:2.9.3       "/portainer"             4 weeks ago      Up 17 hours                 0.0.0.0:8000->8000/tcp, :::8000->8000/tcp, 0.0.0.0:9443->9443/tcp, :::9443->9443/tcp, 9000/tcp   portainer

```

## stop

- stop a container

```
docker stop elated_rubin
```

## rm

- remove a container

```
docker rm elated_rubin
```

- remove all containers

```
dcoker rm $(docker ps -aq)
```



## images

- list images

```
docker images
REPOSITORY                                      TAG       IMAGE ID       CREATED        SIZE
nginx                                           latest    41b0e86104ba   6 days ago     142MB
parrotsec/security                              latest    248b22cee236   3 weeks ago    5.46GB
portainer/portainer-ce                          2.9.3     ad0ecf974589   8 months ago   252MB
docker/whalesay                                 latest    6b362a9f73eb   7 years ago    247MB
```

## rmi

- remove images

```
docker rmi nginx
```

- remove all images

```
docker rmi $(docker images -aq)
```



## pull

- download an image

```
docker pull nginx
```

## exec

- Run a command in a running container

```
docker ps
CONTAINER ID   IMAGE                          COMMAND        CREATED         STATUS         PORTS                                                                                            NAMES
3fa0ceab3657   ubuntu                         "sleep 1000"   3 minutes ago   Up 3 minutes                                                                                                    boring_engelbart


docker exec 3fa0ceab3657 cat /etc/*release*
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04 LTS"
PRETTY_NAME="Ubuntu 22.04 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy

```

## tag

- version

```
# Run latest version of centos
docker run centos:latest

# Run version 7 of centos
docker run centos:7

# Pull latest version of centos
docker pull centos:latest

# Run version 7 of centos
docker pull centos:7
```


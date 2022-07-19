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

### volume

```
docker run --name my-mysql -v /Users/sherwinowen/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=mypassword -d mysql
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

## inspect

- Return low-level information on Docker objects

```
$ docker ps
CONTAINER ID   IMAGE              COMMAND                  CREATED              STATUS              PORTS                    NAMES
4db5d3603aad   mysql              "docker-entrypoint.s…"   About a minute ago   Up About a minute   3306/tcp, 33060/tcp      my-mysql

docker inspect my-mysql
[
    {
        "Id": "4db5d3603aade7c89afb6b26497b3f68f55b1dc78241c47cb347c36843bb3773",
        "Created": "2022-07-19T04:51:16.167955469Z",
        "Path": "docker-entrypoint.sh",
        "Args": [
            "mysqld"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 3851,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2022-07-19T04:51:16.629367678Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:02662e079c08f45f90a837cf583cfb18bc58a400342d4fefde11199f3d1f4102",
        "ResolvConfPath": "/var/lib/docker/containers/4db5d3603aade7c89afb6b26497b3f68f55b1dc78241c47cb347c36843bb3773/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/4db5d3603aade7c89afb6b26497b3f68f55b1dc78241c47cb347c36843bb3773/hostname",
        "HostsPath": "/var/lib/docker/containers/4db5d3603aade7c89afb6b26497b3f68f55b1dc78241c47cb347c36843bb3773/hosts",
        "LogPath": "/var/lib/docker/containers/4db5d3603aade7c89afb6b26497b3f68f55b1dc78241c47cb347c36843bb3773/4db5d3603aade7c89afb6b26497b3f68f55b1dc78241c47cb347c36843bb3773-json.log",
        "Name": "/my-mysql",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": [
                "/Users/sherwinowen/datadir:/var/lib/mysql"
            ],
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "default",
            "PortBindings": {},
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "private",
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "ConsoleSize": [
                0,
                0
            ],
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": null,
            "BlkioDeviceWriteBps": null,
            "BlkioDeviceReadIOps": null,
            "BlkioDeviceWriteIOps": null,
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "KernelMemory": 0,
            "KernelMemoryTCP": 0,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": null,
            "PidsLimit": null,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/1fae8247a72e4dc877ea2818eaedc1fa4666e2ee9d8512c8a9487ece54e4f180-init/diff:/var/lib/docker/overlay2/cddf4b91ed81eb9b927a2f39fb682a14b93a431ad461ecc25f4792b7310c548c/diff:/var/lib/docker/overlay2/184618309c0c0422446a512ee1384fcb37c2f19af869d124b3e18247e5c32360/diff:/var/lib/docker/overlay2/b1932f1074bda8352796f27acca98378587de42d78b9f6932cfc1fee641b7649/diff:/var/lib/docker/overlay2/48b41a12b55451787910e9dbf379a2940476cbe5144131a215fba42cef6bfadd/diff:/var/lib/docker/overlay2/9ee138426766fabdd61a8a09080948fd93620b683f5663016ace0be210c4ca63/diff:/var/lib/docker/overlay2/9c4780c44a0d937c0c1d5328e54c2e84914a6863f1274eed68a58f65cae11ff2/diff:/var/lib/docker/overlay2/7a2ad3437e7aca568ac67a6f6aa2e3e90425777f69c9440da526cd4d453558e7/diff:/var/lib/docker/overlay2/a146327f0ca17cd4a9aa5d7ff0568abeae41d2383403676e61a56f7aedfbab44/diff:/var/lib/docker/overlay2/905eeb4f86ca7775653be42ade35d3636425fc192c0e14b46dfb65af6bae134c/diff:/var/lib/docker/overlay2/9b0a170e3d5f01dad763d75f11f77fc2a3ae51ae5a2de6c1fa809b0cf1c7efc6/diff:/var/lib/docker/overlay2/324447f06fa7e865eb7d548a7a2364cd2bf7e5124b3ece53588a365cbf7da83c/diff",
                "MergedDir": "/var/lib/docker/overlay2/1fae8247a72e4dc877ea2818eaedc1fa4666e2ee9d8512c8a9487ece54e4f180/merged",
                "UpperDir": "/var/lib/docker/overlay2/1fae8247a72e4dc877ea2818eaedc1fa4666e2ee9d8512c8a9487ece54e4f180/diff",
                "WorkDir": "/var/lib/docker/overlay2/1fae8247a72e4dc877ea2818eaedc1fa4666e2ee9d8512c8a9487ece54e4f180/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [
            {
                "Type": "bind",
                "Source": "/Users/sherwinowen/datadir",
                "Destination": "/var/lib/mysql",
                "Mode": "",
                "RW": true,
                "Propagation": "rprivate"
            }
        ],
        "Config": {
            "Hostname": "4db5d3603aad",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "3306/tcp": {},
                "33060/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "MYSQL_ROOT_PASSWORD=mypassword",
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "GOSU_VERSION=1.14",
                "MYSQL_MAJOR=8.0",
                "MYSQL_VERSION=8.0.29-1.el8",
                "MYSQL_SHELL_VERSION=8.0.29-1.el8"
            ],
            "Cmd": [
                "mysqld"
            ],
            "Image": "mysql",
            "Volumes": {
                "/var/lib/mysql": {}
            },
            "WorkingDir": "",
            "Entrypoint": [
                "docker-entrypoint.sh"
            ],
            "OnBuild": null,
            "Labels": {}
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "fb2fcdf59072ecf4b816b440a90d41239b2dd48fe759e69b1d7798c9196d1dab",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {
                "3306/tcp": null,
                "33060/tcp": null
            },
            "SandboxKey": "/var/run/docker/netns/fb2fcdf59072",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "e161955d845e3b48db75f77b6774bf8af347591e15db8f568182223b2e1ad506",
            "Gateway": "172.17.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.17.0.4",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:11:00:04",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "61e8b6559784be1265455907450cbff5a9f660c5e3d5acf8a0b6581d3ec5ff78",
                    "EndpointID": "e161955d845e3b48db75f77b6774bf8af347591e15db8f568182223b2e1ad506",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.4",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:11:00:04",
                    "DriverOpts": null
                }
            }
        }
    }
]
```

## logs

- Fetch the logs of a container

```
docker logs my-mysql
2022-07-19 04:51:16+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.29-1.el8 started.
2022-07-19 04:51:16+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
2022-07-19 04:51:16+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.29-1.el8 started.
2022-07-19 04:51:16+00:00 [Note] [Entrypoint]: Initializing database files
2022-07-19T04:51:16.850031Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.0.29) initializing of server in progress as process 43
2022-07-19T04:51:16.860436Z 0 [Warning] [MY-010159] [Server] Setting lower_case_table_names=2 because file system for /var/lib/mysql/ is case insensitive
2022-07-19T04:51:16.876556Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2022-07-19T04:51:21.115210Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2022-07-19T04:51:23.196110Z 6 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
2022-07-19 04:51:27+00:00 [Note] [Entrypoint]: Database files initialized
2022-07-19 04:51:27+00:00 [Note] [Entrypoint]: Starting temporary server
2022-07-19T04:51:28.236640Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.29) starting as process 92
2022-07-19T04:51:28.243364Z 0 [Warning] [MY-010159] [Server] Setting lower_case_table_names=2 because file system for /var/lib/mysql/ is case insensitive
2022-07-19T04:51:28.262059Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2022-07-19T04:51:29.327911Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2022-07-19T04:51:29.684359Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
2022-07-19T04:51:29.684394Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
2022-07-19T04:51:29.688397Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
2022-07-19T04:51:29.734636Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.29'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server - GPL.
2022-07-19T04:51:29.734990Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: /var/run/mysqld/mysqlx.sock
2022-07-19 04:51:29+00:00 [Note] [Entrypoint]: Temporary server started.
'/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.

2022-07-19 04:51:32+00:00 [Note] [Entrypoint]: Stopping temporary server
2022-07-19T04:51:32.405203Z 10 [System] [MY-013172] [Server] Received SHUTDOWN from user root. Shutting down mysqld (Version: 8.0.29).
2022-07-19T04:51:33.720131Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.0.29)  MySQL Community Server - GPL.
2022-07-19 04:51:34+00:00 [Note] [Entrypoint]: Temporary server stopped

2022-07-19 04:51:34+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.

2022-07-19T04:51:34.645730Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.29) starting as process 1
2022-07-19T04:51:34.652281Z 0 [Warning] [MY-010159] [Server] Setting lower_case_table_names=2 because file system for /var/lib/mysql/ is case insensitive
2022-07-19T04:51:34.669835Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2022-07-19T04:51:35.423027Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2022-07-19T04:51:35.836219Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
2022-07-19T04:51:35.836304Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
2022-07-19T04:51:35.842433Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
2022-07-19T04:51:35.895031Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
2022-07-19T04:51:35.895042Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.29'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
```

## Create docker image

### How to create own image

1. OS - Ubuntu
2. Update apt repo
3. Install dependencies using apt
4. Install Python dependencies using pip
5. Copy source code to /opt folder
6. Run the web server using “flask” command

**Dockerfile**

```
FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y python python3-pip
RUN pip install flask

COPY app.py /opt/app.py

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0
```

**app.py**

```
import os
from flask import Flask
app = Flask(__name__)

@app.route("/")
def main():
    return "Welcome!"

@app.route('/how are you')
def hello():
    return 'I am good, how about you?'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
```

## build

```
docker build . -t my-custom-app:latest
```

## push

```
$ docker build . -t sherwinowen/my-custom-app:latest

$ docker images
REPOSITORY                                      TAG       IMAGE ID       CREATED         SIZE
my-custom-app                                   latest    036ac37b63ec   6 minutes ago   459MB

$ docker push sherwinowen/my-custom-app:latest
```

## Docker compose

```
$ git clone https://github.com/dockersamples/example-voting-app.git

$ cd example-voting-app

$ cd vote

# Build voting-app image
example-voting-app/vote$ docker build . -t voting-app

$ docker run -d --name=redis redis

$ docker run -p 5000:80 --link redis:redis voting-app
[2022-07-19 13:17:20 +0000] [1] [INFO] Starting gunicorn 20.1.0
[2022-07-19 13:17:20 +0000] [1] [INFO] Listening at: http://0.0.0.0:80 (1)
[2022-07-19 13:17:20 +0000] [1] [INFO] Using worker: sync
[2022-07-19 13:17:20 +0000] [6] [INFO] Booting worker with pid: 6
[2022-07-19 13:17:20 +0000] [7] [INFO] Booting worker with pid: 7
[2022-07-19 13:17:20 +0000] [8] [INFO] Booting worker with pid: 8
[2022-07-19 13:17:20 +0000] [9] [INFO] Booting worker with pid: 9
[2022-07-19 13:17:32,151] INFO in app: Received vote for a
[2022-07-19 13:17:32 +0000] [7] [INFO] Received vote for a
192.168.101.123 - - [19/Jul/2022:13:17:32 +0000] "POST / HTTP/1.1" 200 1688 "http://192.168.101.123:5000/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36"
192.168.101.123 - - [19/Jul/2022:13:17:32 +0000] "GET /static/stylesheets/style.css HTTP/1.1" 304 0 "http://192.168.101.123:5000/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36"
[2022-07-19 13:17:33,693] INFO in app: Received vote for b
[2022-07-19 13:17:33 +0000] [6] [INFO] Received vote for b
192.168.101.123 - - [19/Jul/2022:13:17:33 +0000] "POST / HTTP/1.1" 200 1688 "http://192.168.101.123:5000/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36"
192.168.101.123 - - [19/Jul/2022:13:17:33 +0000] "GET /static/stylesheets/style.css HTTP/1.1" 304 0 "http://192.168.101.123:5000/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36"
[2022-07-19 13:17:34,673] INFO in app: Received vote for a
[2022-07-19 13:17:34 +0000] [6] [INFO] Received vote for a
192.168.101.123 - - [19/Jul/2022:13:17:34 +0000] "POST / HTTP/1.1" 200 1688 "http://192.168.101.123:5000/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36"
192.168.101.123 - - [19/Jul/2022:13:17:34 +0000] "GET /static/stylesheets/style.css HTTP/1.1" 304 0 "http://192.168.101.123:5000/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36"


$ docker run --name=db -d -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres postgres:9.4
0f016a317f9dba3b49eeb5def32a7ecf79a7113fd171a23ebcbc6e27aa825395


# Build worker-app image
~/my_lab/example-voting-app/worker$ docker build . -t worker-app

$ docker run --link redis:redis --link db:db worker-app
Connected to db
Connecting to redis
Found redis at 172.17.0.3
Processing vote for 'a' by '87c285087f989c4'
Processing vote for 'b' by '87c285087f989c4'
Processing vote for 'a' by '87c285087f989c4'
Processing vote for 'a' by '87c285087f989c4'
Processing vote for 'b' by '87c285087f989c4'
Processing vote for 'a' by '87c285087f989c4'

# Build result-app image
~/my_lab/example-voting-app/result$ docker build . -t result-app

$ docker run -p 5001:80 --link db:db result-app
Tue, 19 Jul 2022 13:38:06 GMT body-parser deprecated bodyParser: use individual json/urlencoded middlewares at server.js:73:9
Tue, 19 Jul 2022 13:38:06 GMT body-parser deprecated undefined extended: provide extended option at ../node_modules/body-parser/index.js:105:29
App running on port 80
Connected to db
```

docker-compose.yml

```
version: '3'

services:
  redis:
    image: redis

  db:
    image: postgres:9.4
    environment:
      POSTGRES_USER: "postgres"
      POSTGRES_PASSWORD: "postgres"

  vote:
    image: voting-app
    ports: 
      - 5000:80
    links:
      - redis   

  worker:
    image: worker-app
    links:
      - db
      - redis

  result:
    image: result-app
    ports:
      - 5001:80
    links:
      - db  
```

```
$ docker-compose up
Creating network "my-voting-app_default" with the default driver
Recreating my-voting-app_db_1    ... done
Recreating my-voting-app_redis_1 ... done
Recreating my-voting-app_result_1 ... done
Recreating my-voting-app_vote_1   ... done
Recreating my-voting-app_worker_1 ... done

```


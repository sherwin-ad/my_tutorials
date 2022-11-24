[TOC]



# Docker Run

# phpmyadmin

## Usage with linked server

First you need to run a MySQL or MariaDB server in Docker, and the phpMyAdmin image needs to be linked to the running database container:

```sh
docker run --name phpmyadmin -d --link mysql_db_server:db -p 8080:80 phpmyadmin
```

## Usage with external server

You can specify a MySQL host in the `PMA_HOST` environment variable. You can also use `PMA_PORT` to specify the port of the server in case it's not the default one:

```sh
docker run --name phpmyadmin -d -e PMA_HOST=dbhost -p 8080:80 phpmyadmin
```

## Usage with arbitrary server

You can use arbitrary servers by adding the environment variable `PMA_ARBITRARY=1` to the startup command:

```sh
docker run --name phpmyadmin -d -e PMA_ARBITRARY=1 -p 8080:80 phpmyadmin
```

## Usage with docker-compose and arbitrary server

This will run phpMyAdmin with the arbitrary server option - allowing you to specify any MySQL/MariaDB server on the login page.

... via [`docker stack deploy`](https://docs.docker.com/engine/reference/commandline/stack_deploy/) or [`docker-compose`](https://github.com/docker/compose)

Example `stack.yml` for `phpmyadmin`:

```yaml
version: '3.1'

services:
  db:
    image: mariadb:10.6
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: notSecureChangeMe

  phpmyadmin:
    image: phpmyadmin
    restart: always
    ports:
      - 8080:80
    environment:
      - PMA_ARBITRARY=1
```



# mysql

## Start a `mysql` server instance

Starting a MySQL instance is simple:

```console
$ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
```

... where `some-mysql` is the name you want to assign to your container, `my-secret-pw` is the password to be set for the MySQL root user and `tag` is the tag specifying the MySQL version you want. See the list above for relevant tags.

## Connect to MySQL from the MySQL command line client

The following command starts another `mysql` container instance and runs the `mysql` command line client against your original `mysql` container, allowing you to execute SQL statements against your database instance:

```console
$ docker run -it --network some-network --rm mysql mysql -hsome-mysql -uexample-user -p
```

... where `some-mysql` is the name of your original `mysql` container (connected to the `some-network` Docker network).

This image can also be used as a client for non-Docker or remote instances:

```console
$ docker run -it --rm mysql mysql -hsome.mysql.host -usome-mysql-user -p
```

## Creating database dumps

Most of the normal tools will work, although their usage might be a little convoluted in some cases to ensure they have access to the `mysqld` server. A simple way to ensure this is to use `docker exec` and run the tool from the same container, similar to the following:

```console
$ docker exec some-mysql sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql
```

## Restoring data from dump files

For restoring data. You can use `docker exec` command with `-i` flag, similar to the following:

```console
$ docker exec -i some-mysql sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < /some/path/on/your/host
```


# Allow Remote Access to MariaDB

###### **Verify MariaDB Server**

Before starting, make sure the MariaDB server is running by using the following command:

```
$ ps -ef | grep -i mysql
```

You should get the following output:

```
mysql        595       1  0 04:17 ?        00:00:00 /usr/sbin/mysqld
root        1350    1337  0 04:22 pts/0    00:00:00 grep --color=auto -i mysql
```

By default, the MariaDB server is listening on localhost only for security reasons. You can check it with the following command:

```
$ netstat -ant | grep 3306
```

In the following output, you should see that the MariaDB server is listening on localhost (127.0.0.1):

```
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN
```

**Configure MariaDB**

By default, MariaDB allows connection only from localhost, all connections from a remote server are denied by default.

The first thing you need to do is to configure the MariaDB server to listen to all IP addresses on the system.

You can do it by editing the MariaDB default configuration file **/etc/mysql/my.cnf**. You can open this file using your favorite text editor:

```
$ nano /etc/mysql/my.cnf
```

Change the value of the bind-address from **127.0.0.1** to **0.0.0.0** so that MariaDB server accepts connections on all host IPv4 interfaces.

```
bind-address = 0.0.0.0
```

Save and close the file when you are finished. Then, restart the MariaDB service to apply the changes:

```
$ sudo systemctl restart mariadb
```

You can now verify the MariaDB listening status with the following command:

```
$ netstat -ant | grep 3306
```

If everything is fine, you should get the following output:

```
tcp        0      0 0.0.0.0:3306            0.0.0.0:*               LISTEN
```



**Grant Access to a User from a Remote System**

In this section, we will create a new database named wpdb and a user named wpuser, and grant access to the remote system to connect to the database wpdb as user wpuser.

First, log in to the MariaDB shell with the following command:

```
$ mysql -u admin -p
```

Provide your admin (root) password as shown in the Webdock backend and when you get the prompt create a database and user with the following command:

```
MariaDB [(none)]> CREATE DATABASE wpdb;
MariaDB [(none)]> CREATE USER  'wpuser'@'localhost' IDENTIFIED BY 'password';
```

Next, you will need to grant permissions to the remote system with IP address 208.117.84.50 to connect to the database named wpdb as user wpuser. You can do it with the following command:

```
MariaDB [(none)]> GRANT ALL ON wpdb.* to 'wpuser'@'208.117.84.50' IDENTIFIED BY 'password' WITH GRANT OPTION;
```

Next, flush the privileges and exit from the MariaDB shell with the following command:

```
MariaDB [(none)]> FLUSH PRIVILEGES;
MariaDB [(none)]> EXIT;
```

**A brief explanation of each parameter is shown below:**

- **wpdb:** It is the name of the MariaDB database that the user wants to connect to.

- **wpuser:** It is the name of the MariaDB database user.

- **208.117.84.50:** It is the IP address of the remote system from which the user wants to connect.

- **password:** It is the password of the database user.

If you want to grant remote access on all databases for wpuser, run the following command:

```
MariaDB [(none)]> GRANT ALL ON *.* to 'wpuser'@'208.117.84.50' IDENTIFIED BY 'password' WITH GRANT OPTION;
```

If you want to grant access to all remote IP addresses on wpdb as wpuser, use % instead of IP address (208.117.84.50) as shown below:

```
MariaDB [(none)]> GRANT ALL ON wpdb.* to 'wpuser'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
```

If you want to grant access to all IP addresses in the subnet 208.117.84.0/24 on wpdb as user wpuser, run the following command:

```
MariaDB [(none)]> GRANT ALL ON wpdb.* to 'wpuser'@'208.117.84.%' IDENTIFIED BY 'password' WITH GRANT OPTION;
```
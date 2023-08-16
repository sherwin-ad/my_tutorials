# Install PostgreSQL 12 on Oracle Linux 8

1. Update system packages

   ```
   sudo dnf update
   ```

2. Add PostgreSQL repository

   ```
   sudo dnf install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
   ```

3. Install PostgreSQL on Oracle 12 on Oracle Linux 8

   We need to disable any other existing PostgreSQL if there is then install PostgreSQL 12. Run the below commands:

   ```
   sudo dnf module disable postgresql
   
   sudo dnf --repo pgdg12 install postgresql12-server postgresql12
   ```

4. Initialize and start Database Service

   We first need to initialize database before starting. Use the following command:

   ```
   $ sudo /usr/pgsql-12/bin/postgresql-12-setup initdb
   Initializing database --- OK
   ```

   Now we can start and enable database service.

   ```
   sudo systemctl enable --now postgresql-12
   ```

   Confirm status if postgresql is running using the below command.

   ```
   sudo systemctl status postgresql-12
   ```

   

   The output should be as below if running:

   

   ![img](images/ngcb7.webp)

   If running Firewall service and remote clients should connect to your database server, allow PostgreSQL service.

   ```
   sudo firewall-cmd --permanent --add-service=postgresql
   sudo firewall-cmd --reload
   ```

5. Set PostgreSQL admin user

   To set PostgreSQL admin user, run:

   ```
   $ sudo su – postgres
   $ psql -c "alter user postgres with password 'MyStrongPassword'"
   ALTER ROLE
   ```



# Configure a High Availability System in PostgreSQL

## Check if postgresql is running

**Server1**

```
[sherwinowen@postgresql ~]$ ps -ef | grep postgres
postgres  118290       1  0 Aug15 ?        00:00:00 /usr/pgsql-12/bin/postmaster -D /var/lib/pgsql/12/data/
postgres  118291  118290  0 Aug15 ?        00:00:00 postgres: logger   
postgres  118293  118290  0 Aug15 ?        00:00:00 postgres: checkpointer   
postgres  118294  118290  0 Aug15 ?        00:00:00 postgres: background writer   
postgres  118295  118290  0 Aug15 ?        00:00:00 postgres: walwriter   
postgres  118296  118290  0 Aug15 ?        00:00:00 postgres: autovacuum launcher   
postgres  118297  118290  0 Aug15 ?        00:00:00 postgres: stats collector   
postgres  118298  118290  0 Aug15 ?        00:00:00 postgres: logical replication launcher   
sherwin+  119342    6394  0 00:52 pts/0    00:00:00 grep --color=auto postgres
```

**Server2**

```
[sherwinowen@postgresql1 ~]$ ps -ef | grep postgres
postgres    1640       1  0 00:43 ?        00:00:00 /usr/pgsql-12/bin/postmaster -D /var/lib/pgsql/12/data/
postgres    1777    1640  0 00:43 ?        00:00:00 postgres: logger   
postgres    2136    1640  0 00:43 ?        00:00:00 postgres: checkpointer   
postgres    2137    1640  0 00:43 ?        00:00:00 postgres: background writer   
postgres    2138    1640  0 00:43 ?        00:00:00 postgres: walwriter   
postgres    2139    1640  0 00:43 ?        00:00:00 postgres: autovacuum launcher   
postgres    2140    1640  0 00:43 ?        00:00:00 postgres: stats collector   
postgres    2141    1640  0 00:43 ?        00:00:00 postgres: logical replication launcher   
sherwin+    6742    6477  0 00:51 pts/0    00:00:00 grep --color=auto postgres
```

## Locating `hba.conf`

```
postgres=# SHOW hba_file;
              hba_file              
------------------------------------
 /var/lib/pgsql/12/data/pg_hba.conf
(1 row)

```

## List Databases

**Server1**

```
[postgres@postgresql ~]$ psql -l
                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
-----------+----------+----------+-------------+-------------+-----------------------
 demo      | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
(4 rows)

```

**Server2**

```
[postgres@postgresql1 ~]$ psql -l
                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
-----------+----------+----------+-------------+-------------+-----------------------
 postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
(3 rows)
```

## List Tables in database "demo"

**Server1**

```
[postgres@postgresql ~]$ psql -d demo
psql (12.16)
Type "help" for help.

demo=# \dt+
                                  List of relations
  Schema  |      Name       | Type  |  Owner   |  Size   |        Description        
----------+-----------------+-------+----------+---------+---------------------------
 bookings | aircrafts_data  | table | postgres | 16 kB   | Aircrafts (internal data)
 bookings | airports_data   | table | postgres | 56 kB   | Airports (internal data)
 bookings | boarding_passes | table | postgres | 33 MB   | Boarding passes
 bookings | bookings        | table | postgres | 13 MB   | Bookings
 bookings | flights         | table | postgres | 3160 kB | Flights
 bookings | seats           | table | postgres | 88 kB   | Seats
 bookings | ticket_flights  | table | postgres | 68 MB   | Flight segment
 bookings | tickets         | table | postgres | 48 MB   | Tickets
(8 rows)
```



## 1. Create replication user

**Server1**

```
[postgres@postgresql ~]$ psql
psql (12.16)
Type "help" for help.

postgres=# create user replicator with replication password 'password';
CREATE ROLE
```

## 2. Parameters need to setup

**Check the value  of parameter**

wal_level (replica or logical)

hot_standby (on)

- It allows read-only connection

```
[postgres@postgresql ~]$ psql -c "show wal_level;"
 wal_level 
-----------
 replica
(1 row)

[postgres@postgresql ~]$ psql -c "show max_wal_senders;"
 max_wal_senders 
-----------------
 10
(1 row)

[postgres@postgresql ~]$ psql -c "show hot_standby;"
 hot_standby 
-------------
 on
(1 row)
```



## 3. Activate continues archiving

**Create directory where the wal files will go**

```
[postgres@postgresql ~]$ pwd
/var/lib/pgsql
[postgres@postgresql ~]$ mkdir archivelog
[postgres@postgresql ~]$ ls -l 
total 101432
drwx------. 4 postgres postgres        51 Aug 15 23:52 12
drwxr-xr-x. 2 postgres postgres         6 Aug 16 03:09 archivelog
-rwxr-xr-x. 1 root     root     103865532 Aug 16 01:08 demo-small-en-20170815.sql
```

**Show config file location**

```
[postgres@postgresql ~]$ psql -c "show config_file;"
              config_file               
----------------------------------------
 /var/lib/pgsql/12/data/postgresql.conf
(1 row)
```

**Edit  /var/lib/pgsql/12/data/postgresql.conf**

Edit this part

```
# - Archiving -

archive_mode = on               # enables archiving; off, on, or always
                                # (change requires restart)
archive_command = 'test ! -f /var/lib/pgsql/archivelog/%f && cp %p /var/lib/pgsql/archivelog/%f'                # command to use to archive a logfile segment
                                # placeholders: %p = path of file to archive
                                #               %f = file name only
                                # e.g. 'test ! -f /mnt/server/archivedir/%f && cp %p /mnt/server/archivedir/%f'
```

**Edit  /var/lib/pgsql/12/data/pg-hba.conf**

Edit this part

```
# replication privilege.
local   replication     all                                     peer
host    replication     replicator      10.2.0.0/24             md5
host    replication     all             ::1/128                 ident
```

Restart postgres

```
[sherwinowen@postgresql ~]$ sudo systemctl restart postgresql-12.service 
```

## 4. Create basebackup

**Server2**

Stop postgresql service

```
[sherwinowen@postgresql1 ~]$ sudo systemctl stop postgresql-12.service
```

**Server1**

1. Edited `pg_hba.conf` file to include

    ```
   host all all 0.0.0.0/0 md5
   ```

2. Edited 'postgresql.conf' and changed the listen parameter to

   ```
   listen_addresses='*'
   ```


Create basebackup

```
[postgres@postgresql ~]$ pg_basebackup -h 10.2.0.12 -U replicator -p 5432 -D basebackup -Fp -Xs -P -R
Password: 
311607/311607 kB (100%), 1/1 tablespace
```


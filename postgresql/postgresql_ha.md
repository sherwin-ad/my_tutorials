## Install PostgreSQL 12 on Oracle Linux 8

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

## 1. Streaming Replication Asynchronous

### Check if postgresql is running

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

### Locating `hba.conf`

```
postgres=# SHOW hba_file;
              hba_file              
------------------------------------
 /var/lib/pgsql/12/data/pg_hba.conf
(1 row)

```

### List Databases

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

### List Tables in database "demo"

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



### 1. Create replication user

**Server1**

```
[postgres@postgresql ~]$ psql
psql (12.16)
Type "help" for help.

postgres=# create user replicator with replication password 'password';
CREATE ROLE
```

### 2. Parameters need to setup

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



### 3. Activate continues archiving

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

### 4. Create basebackup

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

[postgres@postgresql ~]$ ls -lh basebackup/
total 60K
-rw-------. 1 postgres postgres  226 Aug 16 04:05 backup_label
drwx------. 6 postgres postgres   54 Aug 16 04:05 base
-rw-------. 1 postgres postgres   30 Aug 16 04:05 current_logfiles
drwx------. 2 postgres postgres 4.0K Aug 16 04:05 global
drwx------. 2 postgres postgres   58 Aug 16 04:05 log
drwx------. 2 postgres postgres    6 Aug 16 04:05 pg_commit_ts
drwx------. 2 postgres postgres    6 Aug 16 04:05 pg_dynshmem
-rw-------. 1 postgres postgres 4.4K Aug 16 04:05 pg_hba.conf
-rw-------. 1 postgres postgres 1.6K Aug 16 04:05 pg_ident.conf
drwx------. 4 postgres postgres   68 Aug 16 04:05 pg_logical
drwx------. 4 postgres postgres   36 Aug 16 04:05 pg_multixact
drwx------. 2 postgres postgres    6 Aug 16 04:05 pg_notify
drwx------. 2 postgres postgres    6 Aug 16 04:05 pg_replslot
drwx------. 2 postgres postgres    6 Aug 16 04:05 pg_serial
drwx------. 2 postgres postgres    6 Aug 16 04:05 pg_snapshots
drwx------. 2 postgres postgres    6 Aug 16 04:05 pg_stat
drwx------. 2 postgres postgres    6 Aug 16 04:05 pg_stat_tmp
drwx------. 2 postgres postgres    6 Aug 16 04:05 pg_subtrans
drwx------. 2 postgres postgres    6 Aug 16 04:05 pg_tblspc
drwx------. 2 postgres postgres    6 Aug 16 04:05 pg_twophase
-rw-------. 1 postgres postgres    3 Aug 16 04:05 PG_VERSION
drwx------. 3 postgres postgres   60 Aug 16 04:05 pg_wal
drwx------. 2 postgres postgres   18 Aug 16 04:05 pg_xact
-rw-------. 1 postgres postgres  272 Aug 16 04:05 postgresql.auto.conf
-rw-------. 1 postgres postgres  27K Aug 16 04:05 postgresql.conf
-rw-------. 1 postgres postgres    0 Aug 16 04:05 standby.signal
```

Create directory archivelog in Server2

```
[sherwinowen@postgresql1 ~]$ sudo su - postgres
Last login: Wed Aug 16 00:55:09 UTC 2023 on pts/0
[postgres@postgresql1 ~]$ mkdir archivelog
```

### 5. Copy basebackup to  /var/lib/pgsql/12/data/ of Server2

```
[postgres@postgresql ~]$ rsync -av basebackup/ postgres@10.2.0.13:/var/lib/pgsql/12/data/
```

**Server2** 

Start postgresql service

```
sudo systemctl start postgresql-12.service
```

**List database**

```
[postgres@postgresql1 ~]$ psql -l
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



### 6. Check Streaming Replication Asynchronous both servers

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

**Server2**

```
[postgres@postgresql1 ~]$ psql -d demo
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

**Create table in Server2**

- Check Server2 if it allows us to write

```
demo=# create table test (int serial);
ERROR:  cannot execute CREATE TABLE in a read-only transaction
```

**Create table in Server1**

```
demo=# create table test (int serial);
CREATE TABLE

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
 bookings | test            | table | postgres | 0 bytes |
 bookings | ticket_flights  | table | postgres | 68 MB   | Flight segment
 bookings | tickets         | table | postgres | 48 MB   | Tickets
(9 rows)
```

**List tables in Server2**

- Check if replicated in Server2

```
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
 bookings | test            | table | postgres | 0 bytes |
 bookings | ticket_flights  | table | postgres | 68 MB   | Flight segment
 bookings | tickets         | table | postgres | 48 MB   | Tickets
(9 rows)
```



**Insert 1000 records in test table in Server1**

```
demo=# insert into test (select generate_series(1,1000));
INSERT 0 1000
```

**Check Server2 if records replicated**

```
demo=# select count(*) from test;
 count
-------
  1000
(1 row)
```



## 2. Download, install and configure repmgr for Failover

**Install repmgr**

```
[root@postgresql sherwinowen]# yum install repmgr12
Last metadata expiration check: 1:25:48 ago on Wed 16 Aug 2023 05:46:53 AM UTC.
Dependencies resolved.
=========================================================================================
 Package             Architecture     Version                     Repository        Size
=========================================================================================
Installing:
 repmgr_12           x86_64           5.4.1-1PGDG.rhel8           pgdg12           288 k

Transaction Summary
=========================================================================================
Install  1 Package

Total download size: 288 k
Installed size: 1.0 M
Is this ok [y/N]: y
Downloading Packages:
repmgr_12-5.4.1-1PGDG.rhel8.x86_64.rpm                   187 kB/s | 288 kB     00:01
-----------------------------------------------------------------------------------------
Total                                                    187 kB/s | 288 kB     00:01
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                 1/1
  Running scriptlet: repmgr_12-5.4.1-1PGDG.rhel8.x86_64                              1/1
  Installing       : repmgr_12-5.4.1-1PGDG.rhel8.x86_64                              1/1
  Running scriptlet: repmgr_12-5.4.1-1PGDG.rhel8.x86_64                              1/1
  Verifying        : repmgr_12-5.4.1-1PGDG.rhel8.x86_64                              1/1

Installed:
  repmgr_12-5.4.1-1PGDG.rhel8.x86_64
```

**Create user "repmgr" and database "repmgr"**

```
[postgres@postgresql ~]$ createuser -s repmgr
[postgres@postgresql ~]$ createdb repmgr -O repmgr
```

**Modify postgresql.conf**

```
vim /var/lib/pgsql/12/data/postgresql.conf
```

Change this line

```
#shared_preload_libraries = ''     # (change requires restart)
```

To this line

```
shared_preload_libraries = 'repmgr'     # (change requires restart)
```

**Modify pg_hba.conf**

```
vim /var/lib/pgsql/12/data/pg_hba.conf
```

Change this lines

```
# "local" is for Unix domain socket connections only
local   all             all                                     peer
# IPv4 local connections:
host    all             all             all                     md5
# IPv6 local connections:
host    all             all             ::1/128                 ident
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     peer
host    replication     replicator      10.2.0.0/24             md5
host    replication     all             ::1/128                 ident
```

To this lines

```
# "local" is for Unix domain socket connections only
local   repmgr          repmgr                                  trust
local   all             all                                     peer
# IPv4 local connections:
host    repmgr          repmgr          10.2.0.0/24             trust
host    all             all             all                     md5
# IPv6 local connections:
host    all             all             ::1/128                 ident
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     repmgr                                  trust
local   replication     all                                     peer
host    replication     repmgr          10.2.0.0/24             trust
host    replication     replicator      10.2.0.0/24             md5
host    replication     all             ::1/128                 ident
```

**Restart postgresql service**

```
[sherwinowen@postgresql ~]$ sudo systemctl restart postgresql-12.service
```

Connect from Server2 to Server1

```
[postgres@postgresql1 ~]$ psql -h 10.2.0.12 -d repmgr -U repmgr
psql (12.16)
Type "help" for help.

repmgr=# \dt
Did not find any relations.
```


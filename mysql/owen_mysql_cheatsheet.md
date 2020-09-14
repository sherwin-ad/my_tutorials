
# MySql Cheat Sheet

## Table of Contents
* [Create Open Delete Database](#Create-Open-Delete-Database)
* [Backup Database to SQL File](#Backup-Database-to-SQL-File)
* [Restore from backup SQL File](#Restore-from-backup-SQL-File)
* [Repair Tables After Unclean Shutdown](#Repair-Tables-After-Unclean-Shutdown)
* [Browsing](#Browsing)
* [Select Records](#Select-Records)
* [Select/Join](#Select/Join)
* [Conditions](#Conditions)
* [Insert Records](#Insert-Records)
* [Delete Records](#Delete-Records)
* [Update Records](#Update-Records)
* [Create Delete Modify Table](#Create-Delete-Modify-Table)
* [Change field order](#Change-field-order)
* [Keys](#Keys)
* [Users and Privileges](#Users-and-Privileges)
* [Main Data Types](#Main-Data-Types)
* [Reset Root Password](#Reset-Root-Password)



## Create MySQL Users Accounts

To create a new MySQL user account, run the following command:


```
mysql> CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'user_password';
```

To grant access from another host, change the hostname part with the remote machine IP. For example, to grant access from a machine with IP `10.8.0.5` you would run:

```
CREATE USER 'newuser'@'10.8.0.5' IDENTIFIED BY 'user_password';
```

To create a user that can connect from any host, use the `'%'` wildcard as a host part:

```
CREATE USER 'newuser'@'%' IDENTIFIED BY 'user_password';
```

To delete user  use the `DROP USER` statement:

```
DROP USER 'user'@'localhost'
```



## Grant Privileges to a MySQL User Account 

The most commonly used privileges are:

- `ALL PRIVILEGES` – Grants all privileges to a user account.
- `CREATE` – The user account is allowed to [create databases](https://linuxize.com/post/how-to-create-a-mysql-database/) and tables.
- `DROP` - The user account is allowed to [drop databases](https://linuxize.com/post/how-to-delete-a-mysql-database/) and tables.
- `DELETE` - The user account is allowed to delete rows from a specific table.
- `INSERT` - The user account is allowed to insert rows into a specific table.
- `SELECT` – The user account is allowed to read a database.
- `UPDATE` - The user account is allowed to update table rows.

To grant specific privileges to a user account, use the following syntax:

```
GRANT permission1, permission2 ON database_name.table_name TO 'database_user'@'localhost';
```

Here are some examples:

- Grand all privileges to a user account over a specific database:

  ```
  GRANT ALL PRIVILEGES ON database_name.* TO 'database_user'@'localhost';
  ```
  
- WITH GRANT OPTION

  ```
  GRANT ALL PRIVILEGES ON database_name.* TO 'database_user'@'localhost' WITH GRANT OPTION;
  ```

- Grand all privileges to a user account on all databases:

  ```
  GRANT ALL PRIVILEGES ON *.* TO 'database_user'@'localhost';
  ```


- Grand all privileges to a user account over a specific table from a database:

```
  GRANT ALL PRIVILEGES ON database_name.table_name TO 'database_user'@'localhost';
```

- Grant multiple privileges to a user account over a specific database:

 ```
  GRANT SELECT, INSERT, DELETE ON database_name.* TO database_user@'localhost';
 ```



To find the privilege(s) granted to a specific MySQL user account, use the `SHOW GRANTS` statement:

  ```
SHOW GRANTS FOR 'database_user'@'localhost';
  ```

To revoke all privileges from a user account over a specific database, run the following command:

  ```
REVOKE ALL PRIVILEGES ON database_name.* FROM 'database_user'@'localhost';
  ```



## Create Open Delete Database

```
CREATE DATABASE dbNameYouWant
CREATE DATABASE dbNameYouWant CHARACTER SET utf8
USE dbNameYouWant
DROP DATABASE dbNameYouWant
ALTER DATABASE dbNameYouWant CHARACTER SET utf8
```

## Backup Database to SQL File
```
# Database backup
mysqldump -u Username -p dbNameYouWant > databasename_backup.sql

# All Database backup
mysqldump -u root -p --all-databases > alldb_backup.sql
```

## Restore from backup SQL File
```
mysql - u Username -p dbNameYouWant < databasename_backup.sql
```

## Repair Tables After Unclean Shutdown
```
mysqlcheck --all-databases
mysqlcheck --all-databases --fast
```

## Browsing
```
SHOW DATABASES
SHOW TABLES
SHOW FIELDS FROM table / DESCRIBE table
SHOW CREATE TABLE table
SHOW PROCESSLIST
KILL process_number
```

## Select Records
```
SELECT * FROM table
SELECT * FROM table1, table2, ...
SELECT field1, field2, ... FROM table1, table2, ...
SELECT ... FROM ... WHERE condition
SELECT ... FROM ... WHERE condition GROUPBY field
SELECT ... FROM ... WHERE condition GROUPBY field HAVING condition2
SELECT ... FROM ... WHERE condition ORDER BY field1, field2
SELECT ... FROM ... WHERE condition ORDER BY field1, field2 DESC
SELECT ... FROM ... WHERE condition LIMIT 10
SELECT DISTINCT field1 FROM ...
SELECT DISTINCT field1, field2 FROM ...
```

## Select/Join
```
SELECT ... FROM t1 JOIN t2 ON t1.id1 = t2.id2 WHERE condition
SELECT ... FROM t1 LEFT JOIN t2 ON t1.id1 = t2.id2 WHERE condition
SELECT ... FROM t1 JOIN (t2 JOIN t3 ON ...) ON ...
```

## Conditions
```
field1 = value1
field1 <> value1
field1 LIKE 'value _ %'
field1 IS NULL
field1 IS NOT NULL
field1 IS IN (value1, value2)
field1 IS NOT IN (value1, value2)
condition1 AND condition2
condition1 OR condition2
```

## Insert Records
```
INSERT INTO table1 (field1, field2, ...) VALUES (value1, value2, ...)
```

## Delete Records
```
DELETE FROM table1 / TRUNCATE table1
DELETE FROM table1 WHERE condition
DELETE FROM table1, table2 FROM table1, table2 WHERE table1.id1 =
  table2.id2 AND condition
```

## Update Records
```
UPDATE table1 SET field1=new_value1 WHERE condition
UPDATE table1, table2 SET field1=new_value1, field2=new_value2, ... WHERE
  table1.id1 = table2.id2 AND condition
```

## Create Delete Modify Table
```
# Create 
CREATE TABLE table (field1 type1, field2 type2, ...)
CREATE TABLE table (field1 type1, field2 type2, ..., INDEX (field))
CREATE TABLE table (field1 type1, field2 type2, ..., PRIMARY KEY (field1))
CREATE TABLE table (field1 type1, field2 type2, ..., PRIMARY KEY (field1,
field2))


CREATE TABLE table1 (fk_field1 type1, field2 type2, ...,
  FOREIGN KEY (fk_field1) REFERENCES table2 (t2_fieldA))
    [ON UPDATE|ON DELETE] [CASCADE|SET NULL]

CREATE TABLE table1 (fk_field1 type1, fk_field2 type2, ...,
 FOREIGN KEY (fk_field1, fk_field2) REFERENCES table2 (t2_fieldA, t2_fieldB))
CREATE TABLE table IF NOT EXISTS (...)
CREATE TEMPORARY TABLE table (...)
```

```
# Delete
DROP TABLE table
DROP TABLE IF EXISTS table
DROP TABLE table1, table2, ...
```

```
# Modify
ALTER TABLE table MODIFY field1 type1
ALTER TABLE table MODIFY field1 type1 NOT NULL ...
ALTER TABLE table CHANGE old_name_field1 new_name_field1 type1
ALTER TABLE table CHANGE old_name_field1 new_name_field1 type1 NOT NULL ...
ALTER TABLE table ALTER field1 SET DEFAULT ...
ALTER TABLE table ALTER field1 DROP DEFAULT
ALTER TABLE table ADD new_name_field1 type1
ALTER TABLE table ADD new_name_field1 type1 FIRST
ALTER TABLE table ADD new_name_field1 type1 AFTER another_field
ALTER TABLE table DROP field1
ALTER TABLE table ADD INDEX (field);
```

## Change field order
```
ALTER TABLE table MODIFY field1 type1 FIRST
ALTER TABLE table MODIFY field1 type1 AFTER another_field
ALTER TABLE table CHANGE old_name_field1 new_name_field1 type1 FIRST
ALTER TABLE table CHANGE old_name_field1 new_name_field1 type1 AFTER
  another_field
```

## Keys
```
CREATE TABLE table (..., PRIMARY KEY (field1, field2))
CREATE TABLE table (..., FOREIGN KEY (field1, field2) REFERENCES table2
(t2_field1, t2_field2))
```

## Users and Privileges
```
GRANT ALL PRIVILEGES ON base.* TO 'user'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, DELETE ON base.* TO 'user'@'localhost' IDENTIFIED BY 'password';
REVOKE ALL PRIVILEGES ON base.* FROM 'user'@'host'; -- one permission only
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user'@'host'; -- all permissions
```

```
SET PASSWORD = PASSWORD('new_pass')
SET PASSWORD FOR 'user'@'host' = PASSWORD('new_pass')
SET PASSWORD = OLD_PASSWORD('new_pass')
```

```
DROP USER 'user'@'host'

# Host ‘%’ indicates any host.
```

## Main Data Types
```
TINYINT (1o: -217+128)
SMALLINT (2o: +-65 000)
MEDIUMINT (3o: +-16 000 000)
INT (4o: +- 2 000 000 000)
BIGINT (8o: +-9.10^18)

Precise interval: -(2^(8*N-1)) -> (2^8*N)-1
⚠ INT(2) = “2 digits displayed” – NOT “number with 2 digits max”

FLOAT(M,D)
DOUBLE(M,D)
FLOAT(D=0->53)

⚠ 8,3 -> 12345,678 – NOT 12345678,123!

TIME (HH:MM)
YEAR (AAAA)
DATE (AAAA-MM-JJ)
DATETIME (AAAA-MM-JJ HH:MM; années 1000->9999)
TIMESTAMP (like DATETIME, but 1970->2038, compatible with Unix)
```

```
VARCHAR (single-line; explicit size)
TEXT (multi-lines; max size=65535)
BLOB (binary; max size=65535)
```

```
Variants for TEXT&BLOB: TINY (max=255), MEDIUM (max=~16000), and LONG (max=4Go). Ex: VARCHAR(32), TINYTEXT, LONGBLOB, MEDIUMTEXT
```

```
ENUM ('value1', 'value2', ...) -- (default NULL, or '' if NOT NULL)
```

## Reset Root Password
```
$ /etc/init.d/mysql stop

$ mysqld_safe --skip-grant-tables


# on another terminal
$ mysql  
mysql> UPDATE mysql.user SET password=PASSWORD('new_pass') WHERE user='root';

# Switch back to the mysqld_safe terminal and kill the process using Control + \

$ /etc/init.d/mysql start

# Your commands may vary depending on your OS.
```



```

```

```

```
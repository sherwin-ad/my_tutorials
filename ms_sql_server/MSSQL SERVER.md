# MSSQL SERVER

## Connect to SQL Server

```
# sqlcmd -S localhost -U sa 
Password: 
1> 

```



## Check the current database

```
1> select DB_NAME()
2> go
                                                                                                                                
--------------------------------------------------------------------------------------------------------------------------------
master                           
```



##  List the databases

```
1> select name from sys.databases
2> go
name                                                                                                                            
--------------------------------------------------------------------------------------------------------------------------------
master                                                                                                                          
tempdb                                                                                                                          
model                                                                                                                           
msdb                                             
```

## Check the SQL Server edition

```
1> SELECT SERVERPROPERTY('EDITION')
2> GO
```



## Create database

```
1> :SETVAR DATABASENAME "sales"
1> create database $(DATABASENAME);
2> go
```



## Delete database

```
1> :SETVAR DATABASENAME "sales"
1> drop database $(DATABASENAME);
2> go
```



## To detect the authentication, you can use the following sentences:

```
SELECT SERVERPROPERTY('IsIntegratedSecurityOnly')
GO
```

- If the result is 0, it means that both authentications are enabled. If it is 1, only Windows Authentication is enabled.

## Create user and grant privilege

Created a new login user, "Herong", and granted full permission to "Herong" to use database, AdventureWorks2014:

```
herong> sqlcmd -S localhost -U sa -P HerongY@ng

1> -- Set AdventureWorks as the current database
2> USE AdventureWorks2014;
3> GO
Changed database context to 'AdventureWorks2014'.

1> -- Create a new server login name: Herong
2> CREATE LOGIN Herong WITH PASSWORD = 'T0pSecret';
3> GO

1> -- Create a new database user linked to the login name
2> CREATE USER Herong FOR LOGIN Herong;
3> GO

1> -- Grant database ALTER permision to the user
2> GRANT ALTER To Herong;
3> GO

1> -- Grant database CONTROL permision to the user
2> GRANT CONTROL To Herong;
3> GO
```

Here is what I did to test this new login name and user: Herong

```
herong> sqlcmd -S localhost -U Herong -P TopSecret

1> -- Set AdventureWorks as the current database
2> USE AdventureWorksLT;
3> GO
Changed database context to 'AdventureWorksLT'.

1> -- Create a new table
2> CREATE TABLE Test (ID INT);
3> GO

1> -- Drop the table
2> DROP TABLE Test;
3> GO
```



## List all the variables set

```
1> :ListVar
SQLCMDCOLSEP = " "
SQLCMDCOLWIDTH = "0"
SQLCMDDBNAME = ""
SQLCMDEDITOR = "edit.com"
SQLCMDERRORLEVEL = "0"
SQLCMDHEADERS = "0"
SQLCMDINI = ""
SQLCMDLOGINTIMEOUT = "8"
SQLCMDMAXFIXEDTYPEWIDTH = "0"
SQLCMDMAXVARTYPEWIDTH = "256"
SQLCMDPACKETSIZE = "4096"
SQLCMDSERVER = "localhost"
SQLCMDSTATTIMEOUT = "0"
SQLCMDUSER = "sa"
SQLCMDWORKSTATION = "bundypro-server"
DATABASENAME = "sales"
```

## Run a script using sqlcmd and show the results in another file

We will first create a script file named columns.sql with the following sentences:

```
select * from adventureworks2014.information_schema.columns
```

In the cmd, run the following command to invoke sqlcmd:

```
sqlcmd -S DESKTOP-5K4TURF\SQLEXPRESS -E -i c:\sql\columns.sql -o c:\sql\exit.txt
```

-i is used to specify the input. You specify the script file with the queries.
-o is used to show the results of the input in a file.



# Create a SQL Server Authentication login

Created a new login user, "Herong", and granted full permission to "Herong" to use database, AdventureWorks2014:

```
herong> sqlcmd -S localhost -U sa -P HerongY@ng

1> -- Set AdventureWorks as the current database
2> USE AdventureWorks2014;
3> GO
Changed database context to 'AdventureWorks2014'.

1> -- Create a new server login name: Herong
2> CREATE LOGIN Herong WITH PASSWORD = 'T0pSecret';
3> GO

1> -- Create a new database user linked to the login name
2> CREATE USER Herong FOR LOGIN Herong;
3> GO

1> -- Grant database ALTER permision to the user
2> GRANT ALTER To Herong;
3> GO

1> -- Grant database CONTROL permision to the user
2> GRANT CONTROL To Herong;
3> GO
```

Here is what I did to test this new login name and user: Herong

```
herong> sqlcmd -S localhost -U Herong -P TopSecret

1> -- Set AdventureWorks as the current database
2> USE AdventureWorksLT;
3> GO
Changed database context to 'AdventureWorksLT'.

1> -- Create a new table
2> CREATE TABLE Test (ID INT);
3> GO

1> -- Drop the table
2> DROP TABLE Test;
3> GO
```







## Backup

We will first create a script to back up the database named backup.sql:

```
# sqlcmd -S localhost -U bpro -Q "BACKUP DATABASE lamaodb TO DISK = N'/var/opt/mssql/data/lamaodb_06132023.bak' WITH NOFORMAT, NOINIT, NAME = 'lamaodb-full', SKIP, NOREWIND, NOUNLOAD, STATS = 10"
Password: 
10 percent processed.
20 percent processed.
30 percent processed.
40 percent processed.
50 percent processed.
60 percent processed.
70 percent processed.
80 percent processed.
90 percent processed.
100 percent processed.
Processed 5744 pages for database 'lamaodb', file 'lamaodb' on file 1.
Processed 2 pages for database 'lamaodb', file 'lamaodb_log' on file 1.
BACKUP DATABASE successfully processed 5746 pages in 1.559 seconds (28.791 MB/sec).
```

In the cmd run the following command:

````
sqlcmd -S DESKTOP-5K4TURF\SQLEXPRESS -E -i c:\sql\backup.sql -o
c:\sql\output.txt
````





The output will be similar to this one:

## Restore

```
sqlcmd -S localhost -U SA -Q "RESTORE DATABASE lamadb FROM DISK = N'/var/opt/mssql/data/lamaodb_06132023.bak' WITH FILE = 1, NOUNLOAD, REPLACE, NORECOVERY, STATS = 5"
```


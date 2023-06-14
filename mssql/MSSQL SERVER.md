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


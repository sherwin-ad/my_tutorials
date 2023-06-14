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



## Backup



## Restore


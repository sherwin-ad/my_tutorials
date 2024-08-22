# SQLCMD

## backup database to Local Disk

```
sqlcmd -S [server_name] -Q "BACKUP DATABASE [database_name] TO DISK='C:\Backup\backup_file.bak' WITH INIT"
```



- -S [server_name] 

  – The name of the SQL Server instance to connect to.

- -Q

  – Specifies a query to be executed.

- "BACKUP DATABASE [database_name] TO DISK='C:\Backup\backup_file.bak' WITH INIT"

  – The backup command to be executed.

## restore a database from Local Disk

```
sqlcmd -S [server_name] -Q "RESTORE DATABASE [database_name] FROM DISK='C:\Backup\backup_file.bak' WITH RECOVERY
```

- -S [server_name]

   – The name of the SQL Server instance to connect to.

- -Q

   – Specifies a query to be executed.

- **RESTORE** **DATABASE** [database_name] **FROM** **DISK**='C:\Backup\backup_file.bak' **WITH** **RECOVERY**

  – The restore command to be executed.



## running sql script

```
 sqlcmd -S M61SV029\MO0EIQ -U isouser -P 'IsoUser@123' -i .\script1.sql -o .\outpout
```


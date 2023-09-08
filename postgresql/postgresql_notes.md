# Postgresql 

## Allow remote connections to PostgreSQL

**1. Modify the PostgreSQL configuration file**

Open the PostgreSQL configuration file “postgresql.conf” using your preferred text editor. The file is typically located in the /etc/postgresql/12/main directory. To open the file from the Linux Terminal, execute: `sudo nano /etc/postgresql/12/main/postgresql.conf` 

Then, find the line `#listen_addresses = 'localhost'` and uncomment it (remove the # character at the beginning of the line).

Next, change the value of “listen_addresses” to “*”. This allows PostgreSQL to listen on all available IP addresses. Alternatively, you can specify a specific IP address or a range of IP addresses that are allowed to connect to the server.

**2. Modify the pg_hba.conf file**

Open the “pg_hba.conf” file using your preferred text editor. The file is typically located in the /etc/postgresql/12/main directory. To open the file from the Linux Terminal, execute: `sudo nano /etc/postgresql/12/main/pg_hba.con`

Take the following section:

```
# IPv4 local connections: host  all       all       127.0.0.1/32      md5 
```

And modify it this way: 

```
# IPv4 local connections:host  all       all       0.0.0.0/0      md5 
```

**3. Allow port 5432 through the firewall**

To enable traffic on port 5432 through the firewall, execute the following command: `sudo ufw allow 5432/tcp` 

**4. Restart PostgreSQL**

Run the following command to restart PostgreSQL: `sudo service postgresql restart`

## PSQL

Magic words:

```
psql -U postgres
```

Some interesting flags (to see all, use `-h` or `--help` depending on your psql version):

- `-E`: will describe the underlaying queries of the `\` commands (cool for learning!)
- `-l`: psql will list all databases and then exit (useful if the user you connect with doesn't has a default database, like at AWS RDS)

Most `\d` commands support additional param of `__schema__.name__` and accept wildcards like `*.*`

- `\?`: Show help (list of available commands with an explanation)
- `\q`: Quit/Exit
- `\c __database__`: Connect to a database
- `\d __table__`: Show table definition (columns, etc.) including triggers
- `\d+ __table__`: More detailed table definition including description and physical disk size
- `\l`: List databases
- `\dy`: List events
- `\df`: List functions
- `\di`: List indexes
- `\dn`: List schemas
- `\dt *.*`: List tables from all schemas (if `*.*` is omitted will only show SEARCH_PATH ones)
- `\dT+`: List all data types
- `\dv`: List views
- `\dx`: List all extensions installed
- `\df+ __function__` : Show function SQL code.
- `\x`: Pretty-format query results instead of the not-so-useful ASCII tables
- `\copy (SELECT * FROM __table_name__) TO 'file_path_and_name.csv' WITH CSV`: Export a table as CSV
- `\des+`: List all foreign servers
- `\dE[S+]`: List all foreign tables
- `\! __bash_command__`: execute `__bash_command__` (e.g. `\! ls`)

User Related:

- `\du`: List users
- `\du __username__`: List a username if present.
- `create role __test1__`: Create a role with an existing username.
- `create role __test2__ noinherit login password __passsword__;`: Create a role with username and password.
- `set role __test__;`: Change role for current session to `__test__`.
- `grant __test2__ to __test1__;`: Allow `__test1__` to set its role as `__test2__`.
- `\deu+`: List all user mapping on server


## PostgreSQL CREATE ROLE

## PostgreSQL CREATE ROLE statement

To create a new role, you use the `CREATE ROLE` statement as follows:

```
CREATE ROLE role_name;
```

When you create a role, it is valid in all databases in the database server (or cluster).

The following statement uses the `CREATE ROLE` statement to create a new role called `bob`:

```
CREATE ROLE bob;
```

To get all roles in the current PostgreSQL database server, you can query them from the `pg_roles` system catalog as follows:

```
SELECT rolname FROM pg_roles;
```

Output:

```
          rolname
---------------------------
 pg_monitor
 pg_read_all_settings
 pg_read_all_stats
 pg_stat_scan_tables
 pg_read_server_files
 pg_write_server_files
 pg_execute_server_program
 pg_signal_backend
 postgres
 bob
```

Noice that the roles that start with with `pg_` are system roles.

If you use the `psql` tool, you can use the `\du` command to list all existing roles in the current PostgreSQL database server.

```
\du
```

Output:

```
                                  List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 bob       | Cannot login                                               | {}
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}Code language: Shell Session (shell)
```

As you can see clearly from the output, the role `bob` cannot login.

To allow the role bob to log in to the PostgreSQL database server, you need to add the `LOGIN` attribute to it.

### Role attributes

The attributes of a role define privileges for that role including login, superuser, database creation, role creation, password, etc:

```
CREATE ROLE name WITH option;
```

In this syntax, the `WITH` keyword is optional. And the `option` can be one or more attributes including `SUPER`, `CREATEDB`, `CREATEROLE`, etc.

### 1) Create login roles

For example, the following statement creates a role called `alice` that has the login privilege and an initial password:

```
CREATE ROLE alice 
LOGIN 
PASSWORD 'securePass1';
```

Note that you place the password in single quotes (`'`).

Now, you can use the role `alice` to log in to the PostgreSQL database server using the `psql` client tool:

```
psql -U alice -W postgres
```

It will prompt you for a password. You need to enter the password that you entered in the `CREATE ROLE` statement.

### 2) Create superuser roles

The following statement creates a role called `john` that has the superuser attribute.

```
CREATE ROLE john 
SUPERUSER 
LOGIN 
PASSWORD 'securePass1';
```

The superuser can override all access restrictions within the database therefore you should create this role only when needed.

Notice that you must be a superuser in order to create another superuser role.

### 3) Create roles that can create databases

If you want to create roles that have the database creation privilege, you use the `CREATEDB` attribute:

```
CREATE ROLE dba 
CREATEDB 
LOGIN 
PASSWORD 'Abcd1234';
```

### 4) Create roles with validity period

To set a date and time after which the role’s password is no longer valid, you use the valid until attribute:

```
VALID UNTIL 'timestamp'
```

For example, the following statement creates a `dev_api` role with password valid until the end of 2029:

```
CREATE ROLE dev_api WITH
LOGIN
PASSWORD 'securePass1'
VALID UNTIL '2030-01-01';
```

After one second tick in 2030, the password of dev_api is no longer valid.

### 5) Create roles with connection limit

To specify the number of concurrent connections a role can make, you use the `CONNECTION LIMIT` attribute:

```
CONNECTION LIMIT connection_count
```

The following creates a new role called api that can make 1000 concurent connections:

```
CREATE ROLE api
LOGIN
PASSWORD 'securePass1'
CONNECTION LIMIT 1000;
```

The following `psql` command shows all the roles that we have created so far:

```
\du
                                   List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 alice     |                                                            | {}
 api       | 1000 connections                                           | {}
 bob       | Cannot login                                               | {}
 dba       | Create DB                                                  | {}
 john      | Superuser                                                  | {}
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS 
```



## PostgreSQL GRANT

## Introduction to PostgreSQL GRANT statement

After [creating a role](https://www.postgresqltutorial.com/postgresql-roles/) with the `LOGIN` attribute, the role can log in to the PostgreSQL database server. However, it cannot do anything to the database objects like tables, [views](https://www.postgresqltutorial.com/postgresql-views/), [functions](https://www.postgresqltutorial.com/postgresql-create-function/), etc.

For example, the user role cannot [select data from a table](https://www.postgresqltutorial.com/postgresql-select/) or execute a specific function.

To allow the user role to interact with database objects, you need to grant privileges on the database objects to the user role by using the `GRANT` statement.

The following shows the simple form of the `GRANT` statement that grants one or more privileges on a table to a role:

```
GRANT privilege_list | ALL 
ON  table_name
TO  role_name;Code language: PostgreSQL SQL dialect and PL/pgSQL (pgsql)
```

In this syntax:

- First, specify the `privilege_list` that can be `SELECT`, `INSERT`, `UPDATE`, `DELETE`, `TRUNCATE`, etc. You use the `ALL` option to grant all privileges on a table to the role.
- Second, specify the name of the table after the `ON` keyword.
- Third, specify the name of the role to which you want to grant privileges.

## PostgreSQL GRANT statement examples

First, use the `postgres` user to connect to the PostgreSQL database server using any client tool of your choice.

Second, [create a new user role](https://www.postgresqltutorial.com/postgresql-roles/) called `joe` that can login to the PostgreSQL database server:

```
create role joe 
login 
password 'Abcd1234';
```

Third, [create a new table](https://www.postgresqltutorial.com/postgresql-create-table/) called `candidates`:

```
create table candidates (
    candidate_id int generated always as identity,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    email varchar(255) not null unique,
    phone varchar(25) not null,
    primary key(candidate_id)
);

```

Fourth, use the role `joe` to log in to the PostgreSQL database server in a separate session.

Fifth, attempt to select data from the `candidates` table from the `joe`‘s session:

```
SELECT * FROM candidates;   
```

PostgreSQL issued an error:

```
ERROR:  permission denied for table candidates
```

To grant the `SELECT` privilege on the `candidates` table to the role `joe`, you execute the following `GRANT` statement in the `postgres`‘ session:

```
GRANT SELECT 
ON candidates 
TO joe;
```

Sixth, execute the `SELECT` statement from the `joe`‘s session:

```
SELECT * FROM candidates;   
```

PostgreSQL returns an empty result set instead of an error.

Seventh, execute the following `INSERT`statement:

```
INSERT INTO candidates(first_name, last_name, email, phone)
VALUES('Joe','Com','joe.com@example.com','408-111-2222');
```

PostgreSQL issued the following error because `joe` does not have the `INSERT` privilege on the `candidates` table:

```
ERROR:  permission denied for table candidates
```

Eighth, grant `INSERT`, `UPDATE`, and `DELETE` privileges on the `candidates` table to the role `joe`:

```
GRANT INSERT, UPDATE, DELETE
ON candidates 
TO joe;
```

Ninth, execute the `INSERT` statement again from the `joe`‘s session:

```
INSERT INTO candidates(first_name, last_name, email, phone)
VALUES('Joe','Com','joe.com@example.com','408-111-2222');
```

Now, `joe` can insert data into the `candidates` table. In addition, it can update or delete data from the table.

## More PostgreSQL GRANT examples

Let’s takes some more examples of using the `GRANT` statement.

### Grant all privileges on a table to a role

The following statement grants all privileges on the `candidates` table to the role `joe`:

```
GRANT ALL
ON candidates
TO joe;
```

### Grant all privileges on all tables in a schema to a role

The following statement grants all privileges on all tables in the `public` schema of the `dvdrental` sample database to the role `joe`:

```
GRANT ALL
ON ALL TABLES
IN SCHEMA "public"
TO joe;
```

### Grant SELECT on all tables

Sometimes, you want to create a readonly role that can only select data from all tables in a specified schema.

In order to do that, you can grant `SELECT` privilege on all tables in the `public` schema like this:

```
GRANT SELECT
ON ALL TABLES
IN SCHEMA "public"
TO reader;
```


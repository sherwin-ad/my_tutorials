# Wordpress

## Migrate to another URL

````
MariaDB [wpress_db]> select option_name, option_value from wp_options where option_name="siteurl";
+-------------+------------------------+
| option_name | option_value           |
+-------------+------------------------+
| siteurl     | https://35.201.144.168 |
+-------------+------------------------+
1 row in set (0.000 sec)

MariaDB [wpress_db]> update wp_options set option_value="https://34.80.90.53" where option_name="siteurl";
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [wpress_db]> select option_name, option_value from wp_options where option_name="siteurl";
+-------------+---------------------+
| option_name | option_value        |
+-------------+---------------------+
| siteurl     | https://34.80.90.53 |
+-------------+---------------------+
1 row in set (0.000 sec)

MariaDB [wpress_db]> select option_name, option_value from wp_options where option_name="home";
+-------------+------------------------+
| option_name | option_value           |
+-------------+------------------------+
| home        | https://35.201.144.168 |
+-------------+------------------------+
1 row in set (0.001 sec)

MariaDB [wpress_db]> update wp_options set option_value="https://34.80.90.53" where option_name="home";
Query OK, 1 row affected (0.004 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [wpress_db]> select option_name, option_value from wp_options where option_name="home";
+-------------+---------------------+
| option_name | option_value        |
+-------------+---------------------+
| home        | https://34.80.90.53 |
+-------------+---------------------+
1 row in set (0.001 sec)

MariaDB [wpress_db]> flush privileges;
Query OK, 0 rows affected (0.017 sec)

````


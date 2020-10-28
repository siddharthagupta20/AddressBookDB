# Address Book DB Commands

## UC1

```show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sakila             |
| sql_hr             |
| sql_inventory      |
| sql_invoicing      |
| sql_store          |
| store              |
| sys                |
| world              |
+--------------------+
12 rows in set (0.05 sec)

mysql> create database address_book;
Query OK, 1 row affected (0.16 sec)

mysql> use address_book;
Database changed
mysql> select database();
```
## UC2

 ```create table ad_book(
    -> first_name varchar(50) not null,
    -> last_name varchar(50) not null,
    -> address varchar(50) not null,
    -> city varchar(50) not null,
    -> state varchar(50) not null,
    -> zip bigint not null,
    -> phone_number varchar(50) not null,
    -> email varchar(50) not null);
Query OK, 0 rows affected (2.10 sec)

mysql> desc ad_book;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| first_name   | varchar(50) | NO   |     | NULL    |       |
| last_name    | varchar(50) | NO   |     | NULL    |       |
| address      | varchar(50) | NO   |     | NULL    |       |
| city         | varchar(50) | NO   |     | NULL    |       |
| state        | varchar(50) | NO   |     | NULL    |       |
| zip          | bigint      | NO   |     | NULL    |       |
| phone_number | varchar(50) | NO   |     | NULL    |       |
| email        | varchar(50) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
8 rows in set (0.13 sec)
+--------------+
| database()   |
+--------------+
| address_book |
+--------------+
1 row in set (0.00 sec)
```



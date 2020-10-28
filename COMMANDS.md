# Address Book DB Commands

##UC1

show databases;
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
+--------------+
| database()   |
+--------------+
| address_book |
+--------------+
1 row in set (0.00 sec)




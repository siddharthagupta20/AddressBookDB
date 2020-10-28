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
## UC3

```
 insert into ad_book (first_name,last_name, address, city, state, zip, phone_number, email)
    -> values ("Ben","Shapiro","1 ben street","ny","ny state",111111, "11 1111111111", "bens@gmail.com"),
    -> ("Donald", "Trump", "2 don street", "washington", "us of a", 222222, "22 2222222222", "dont-67@gmail.com"),
    -> ("Yoshihide", "Suga", "skytree", "tokyo", "japan", 333333, "33 3333333333","yoshibaba@gmail.com"),
    -> ("Scott","Morrison", "Questacon", "Canberra", "Australia", 444444, "44 4444444444", "scotty@gmail.com")
    -> ;
Query OK, 4 rows affected (0.17 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from ad_book;
+------------+-----------+--------------+------------+-----------+--------+---------------+---------------------+
| first_name | last_name | address      | city       | state     | zip    | phone_number  | email               |
+------------+-----------+--------------+------------+-----------+--------+---------------+---------------------+
| Ben        | Shapiro   | 1 ben street | ny         | ny state  | 111111 | 11 1111111111 | bens@gmail.com      |
| Donald     | Trump     | 2 don street | washington | us of a   | 222222 | 22 2222222222 | dont-67@gmail.com   |
| Yoshihide  | Suga      | skytree      | tokyo      | japan     | 333333 | 33 3333333333 | yoshibaba@gmail.com |
| Scott      | Morrison  | Questacon    | Canberra   | Australia | 444444 | 44 4444444444 | scotty@gmail.com    |
+------------+-----------+--------------+------------+-----------+--------+---------------+---------------------+
4 rows in set (0.00 sec)
```

## UC4
```
update ad_book set first_name='Benjamin' where first_name like 'Ben';
Query OK, 1 row affected (0.17 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from ad_book;
+------------+-----------+--------------+------------+-----------+--------+---------------+---------------------+
| first_name | last_name | address      | city       | state     | zip    | phone_number  | email               |
+------------+-----------+--------------+------------+-----------+--------+---------------+---------------------+
| Benjamin   | Shapiro   | 1 ben street | ny         | ny state  | 111111 | 11 1111111111 | bens@gmail.com      |
| Donald     | Trump     | 2 don street | washington | us of a   | 222222 | 22 2222222222 | dont-67@gmail.com   |
| Yoshihide  | Suga      | skytree      | tokyo      | japan     | 333333 | 33 3333333333 | yoshibaba@gmail.com |
| Scott      | Morrison  | Questacon    | Canberra   | Australia | 444444 | 44 4444444444 | scotty@gmail.com    |
+------------+-----------+--------------+------------+-----------+--------+---------------+---------------------+
4 rows in set (0.06 sec)
```

## UC5
```
delete from ad_book
    -> where first_name='benjamin';
Query OK, 1 row affected (0.12 sec)

mysql> select * from ad_book;
+------------+-----------+--------------+------------+-----------+--------+---------------+---------------------+
| first_name | last_name | address      | city       | state     | zip    | phone_number  | email               |
+------------+-----------+--------------+------------+-----------+--------+---------------+---------------------+
| Donald     | Trump     | 2 don street | washington | us of a   | 222222 | 22 2222222222 | dont-67@gmail.com   |
| Yoshihide  | Suga      | skytree      | tokyo      | japan     | 333333 | 33 3333333333 | yoshibaba@gmail.com |
| Scott      | Morrison  | Questacon    | Canberra   | Australia | 444444 | 44 4444444444 | scotty@gmail.com    |
+------------+-----------+--------------+------------+-----------+--------+---------------+---------------------+
3 rows in set (0.04 sec)
```
## UC6
```
select * from ad_book where city like 'C%';
+------------+-----------+-----------+----------+-----------+--------+---------------+------------------+
| first_name | last_name | address   | city     | state     | zip    | phone_number  | email            |
+------------+-----------+-----------+----------+-----------+--------+---------------+------------------+
| Scott      | Morrison  | Questacon | Canberra | Australia | 444444 | 44 4444444444 | scotty@gmail.com |
+------------+-----------+-----------+----------+-----------+--------+---------------+------------------+
1 row in set (0.00 sec)

mysql> select * from ad_book where state regexp '^j'
    -> ;
+------------+-----------+---------+-------+-------+--------+---------------+---------------------+
| first_name | last_name | address | city  | state | zip    | phone_number  | email               |
+------------+-----------+---------+-------+-------+--------+---------------+---------------------+
| Yoshihide  | Suga      | skytree | tokyo | japan | 333333 | 33 3333333333 | yoshibaba@gmail.com |
+------------+-----------+---------+-------+-------+--------+---------------+---------------------+
1 row in set (0.00 sec)
```
## UC7
```
select count(first_name) as No_Of_Persons, city
    -> from ad_book
    -> group by city;
+---------------+------------+
| No_Of_Persons | city       |
+---------------+------------+
|             1 | washington |
|             1 | tokyo      |
|             1 | Canberra   |
+---------------+------------+
3 rows in set (0.00 sec)

mysql> select count(first_name) as No_Of_Persons, state
    -> from ad_book
    -> group by state;
+---------------+-----------+
| No_Of_Persons | state     |
+---------------+-----------+
|             1 | us of a   |
|             1 | japan     |
|             1 | Australia |
+---------------+-----------+
3 rows in set (0.00 sec)
```
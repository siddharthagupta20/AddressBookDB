# Address Book DB Commands

## UC1

```
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
```
## UC2

 ```
 create table ad_book(
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

## UC8
```
 select * from ad_book
    -> where city like 'w%'
    -> order by first_name;
+------------+-----------+--------------+------------+---------+--------+---------------+-------------------+
| first_name | last_name | address      | city       | state   | zip    | phone_number  | email             |
+------------+-----------+--------------+------------+---------+--------+---------------+-------------------+
| Donald     | Trump     | 2 don street | washington | us of a | 222222 | 22 2222222222 | dont-67@gmail.com |
+------------+-----------+--------------+------------+---------+--------+---------------+-------------------+
1 row in set (0.00 sec)
```

## UC9
```
update ad_book
    -> set name='AB1'
    -> where 2=2;
Query OK, 3 rows affected (0.14 sec)
Rows matched: 3  Changed: 3  Warnings: 0

 mysql>update ad_book
    -> set type='family'
    -> where first_name like 'y%';
Query OK, 1 row affected (0.13 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update ad_book
    -> set type='friend'
    -> where first_name like 'd%';
Query OK, 1 row affected (0.18 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update ad_book
    -> set type='professional'
    -> where first_name like 'scott';
Query OK, 1 row affected (0.13 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from ad_book;
+------------+-----------+--------------+------------+-----------+--------+---------------+---------------------+------+--------------+
| first_name | last_name | address      | city       | state     | zip    | phone_number  | email               | name | type         |
+------------+-----------+--------------+------------+-----------+--------+---------------+---------------------+------+--------------+
| Donald     | Trump     | 2 don street | washington | us of a   | 222222 | 22 2222222222 | dont-67@gmail.com   | AB1  | friend       |
| Yoshihide  | Suga      | skytree      | tokyo      | japan     | 333333 | 33 3333333333 | yoshibaba@gmail.com | AB1  | family       |
| Scott      | Morrison  | Questacon    | Canberra   | Australia | 444444 | 44 4444444444 | scotty@gmail.com    | AB1  | professional |
+------------+-----------+--------------+------------+-----------+--------+---------------+---------------------+------+--------------+
3 rows in set (0.00 sec)
```

## UC10
```
select count(*) as No_of_Contacts, type
    -> from ad_book
    -> group by type;
+----------------+--------------+
| No_of_Contacts | type         |
+----------------+--------------+
|              1 | friend       |
|              1 | family       |
|              1 | professional |
+----------------+--------------+
3 rows in set (0.00 sec)
```

## UC11
```
insert into ad_book values('Ashraf','Ghani','gardens of babur','Kabul','Afghanistan',555555,'55 55555555','ashraf@gmail.com','AB1','professional'),
    -> ('Vladimir','Putin','KGB HQ','Moscow','Russia',666666,'66 6666666666','legend@gmail.com','AB1','friend');
Query OK, 2 rows affected (0.20 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from ad_book;
+------------+-----------+------------------+------------+-------------+--------+---------------+---------------------+------+--------------+
| first_name | last_name | address          | city       | state       | zip    | phone_number  | email               | name | type         |
+------------+-----------+------------------+------------+-------------+--------+---------------+---------------------+------+--------------+
| Donald     | Trump     | 2 don street     | washington | us of a     | 222222 | 22 2222222222 | dont-67@gmail.com   | AB1  | friend       |
| Yoshihide  | Suga      | skytree          | tokyo      | japan       | 333333 | 33 3333333333 | yoshibaba@gmail.com | AB1  | family       |
| Scott      | Morrison  | Questacon        | Canberra   | Australia   | 444444 | 44 4444444444 | scotty@gmail.com    | AB1  | professional |
| Ashraf     | Ghani     | gardens of babur | Kabul      | Afghanistan | 555555 | 55 55555555   | ashraf@gmail.com    | AB1  | professional |
| Vladimir   | Putin     | KGB HQ           | Moscow     | Russia      | 666666 | 66 6666666666 | legend@gmail.com    | AB1  | friend       |
+------------+-----------+------------------+------------+-------------+--------+---------------+---------------------+------+--------------+
5 rows in set (0.06 sec)
```

## UC12 
```
added ER Diagram
```

## UC13
```
USE address_book;
-- CREATING TABLES
create table address_books(
ab_id int unsigned not null unique auto_increment,
ab_name varchar(50) not null,
primary key(ab_id)
);
create table contact_type(
type_id int unsigned primary key not null unique auto_increment,
type_name varchar(50) not null
);
create table person_contact(
person_id int unsigned not null unique auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(50) not null,
ab_id int unsigned not null,
type_id int unsigned not null,
primary key (person_id),
foreign key (ab_id) references address_books(ab_id),
foreign key(type_id) references contact_type(type_id)
);
create table address(
person_id int unsigned not null,
address varchar(50) not null,
city varchar(50) not null,
state varchar(50) not null,
zip bigint not null,
foreign key (person_id) references person_contact(person_id)
);
create table phone_numbers(
person_id int unsigned not null,
ph_no varchar(50) not null unique,
foreign key (person_id) references person_contact(person_id)
);
-- ------------------------------------
-- INSERTING VALUES
insert into address_books (ab_name)
values
	("AB1"),
	("AB2");
insert into contact_type (type_name)
values
	('Family'),
    ('Friend'),
    ('Professional');
insert into person_contact (first_name, last_name, email, ab_id, type_id)
values
	('Donald','Trump','dont-67@gmail.com',1,2),
    ('Yoshihide',	'Suga',	'yoshibaba@gmail.com',	1,1),
    ('Ashraf', 'Ghani','ashraf@gmail.com',1,3),
    ('Scott','Morrison','scotty@gmail.com',1,3),
    ('Vladimir','Putin','legend@gmail.com',1,2)
    ;
insert into address (person_id, address, city, state,zip)
values
	(1,'2 don street','washington',	'us of a',	222222),
    (2,'skytree',	'tokyo',	'japan'	,333333),
    (3,'gardens of babur',	'Kabul',	'Afghanistan'	,555555),
    (4,'Questacon',	'Canberra',	'Australia',	444444),
    (5,'KGB HQ',	'Moscow',	'Russia',	666666);
 insert into phone_numbers (person_id, ph_no)
 values
	(1,'11 1111111111'),
    (2,'22 2222222222'),
    (3,'33 3333333333'),
    (4, '44 4444444444'),
    (5, '55 5555555555');
insert into phone_numbers 
values
(5,'50 5050505050');

-- -------------------------
-- EXECUTING STATEMENTS
select first_name, ph_no, email, tYpe_name as contact_type
from person_contact pc
join phone_numbers pn
	on pc.person_id=pn.person_id
join contact_type ct
	on pc.type_id=ct.type_id
order by first_name;
```
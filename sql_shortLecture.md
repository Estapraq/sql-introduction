Follow me on [Medium](https://medium.com/@estapraqkahlilalani) @estapraqkahlilalani, and on [Twitter](https://twitter.com/EstapraqAlani), and visit [my personal site](http://www.estapraq.com/).


# LEARN BASIC SQL IN A FEW HOURS

This course is for introducing and teaching basic sql in few hours! I hope you fully enjoy to the end as much as I have!

## Table of contents:
* [Introduction](#Introduction)
* [CRUD](#CRUD)


<a name="Introduction">Introduction</a>
----

** What is database? **

A database is an organized collection of data that can easily be accessed, managed,
and updated. A user can be in interact with a database through a database
management system, such as: MySQL, Microsoft SQL Server, Orcale.

** What is SQL? **

SQL (pronounced "ess-que-el") stands for Structured Query Language. SQL is used to communicate with a database. According to ANSI (American National Standards Institute), it is the standard language for relational database management systems.

SQL is as easy as Excel, but it is more flexible in working with multiple databases, and data integrity. SQL can be ran from the shell, or from a GUI on the computer, such as sequel pro.

<a name="crud">CRUD</a>
----

**CRUD** provides various functions that allow database management. These
various functions classified into main functional groups:
+ **C**reation : create tables, and define and insert data.
+ **R**ead : read all or specific data from tables   
+ **U**pdate : updata and modify data.
+ **D**elete : delete columns and delete tables

+ ** CREATE A TABLE **

In sql, it is important that each element has its own unique id which what we call
'primary key' or 'PK'. So we should not forget to include the 'PK'
in the argument when we create a table.

create table table_name (parameter_1 type,......., parameter_n type)

```sql
create table employee(id integer primary key, name text, age integer);
```
**output**

> id  name  age

If you try to create a table without an argument such as:

```sql
create table emplyee()
```

you will get an error that says:

```
in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1.
```

If you like to save some time and have the primary key auto-incremented, you
would do:

```sql
create table payroll (id integer primary key auto_increment, name text, hours integer, project text);
```

> Output:

>  id   name hours   project  


We are going to create two more tables that we are going to use in this toturial.

```sql
create table food_fav(id integer primary key auto_increment, name text, meal text);
```

```sql
create table contact_info(id integer primary key auto_increment, name text, phone_number text, service text);
```

+ ** INSERT DATA **

insert into table_name values(value_1,....value_2);

```sql
insert into employee values(1, "Sam", 27);
insert into employee values(2, "Ali", 23);
insert into employee values(3, "Rami", 20);
insert into employee values(4, "Robert", 60);
insert into employee values(5, "Darren", 30);
insert into employee values(6, "Hassan", 45);
```

But if you use the previous query to insert values in the auto-increamented
primary key table, you would get an error. For example:

```sql
> insert into payroll values ( "Sam", 7.5, "proj1");
```

Therfore, to insert values in the auto-increamented primary key, would be:

insert into table_name (parameter_1,..., parameter_2) values (value_1,...value_2);

```sql
insert into payroll (name, hours, project) values("Sam", 7, "proj1");
insert into payroll (name, hours, project) values("Ali", 1, "proj2");
insert into payroll (name, hours, project) values("Rami", 10, "proj1");
insert into payroll (name, hours, project) values("Robert", 4, "proj3");
insert into payroll (name, hours, project) values("Darren", 3, "proj2");
insert into payroll (name, hours, project) values("Hassan", 6, "proj3");
insert into payroll (name, hours, project) values("Emliy", 5, "proj1");
insert into payroll (name, hours, project) values("Sam", 8, "proj2");
insert into payroll (name, hours, project) values("Emliy", 5, "proj3");
insert into payroll (name, hours, project) values("Emliy", 5, "proj2");
insert into payroll (name, hours, project) values("Nancy", 5.5, "proj2");    
```

Since the type of the parameter 'hours' in payroll table is integer, the 5.5 in
the last query

insert into payroll (name, hours, project) values("Nancy", 5.5, "proj2");

will rounded up to 6. If you would like the value to be exactly 5.5, you should
change the type of the parameter 'hours' to float.


```sql   
insert into food_fav(name, meal) values("Sam", "Byriani");
insert into food_fav (name, meal) values("Ali","chard and chicken");
insert into food_fav (name, meal) values("Rami", "taboli");
insert into food_fav (name, meal) values("Robert", "falafel");
insert into food_fav (name, meal) values("Darren", "cayro");
insert into food_fav (name, meal) values("Hassan","kabab");
insert into food_fav (name, meal) values("Emliy", "humus");
insert into food_fav (name, meal) values("Nancy","salad");
```

```sql    
insert into contact_info (name, phone_number, service) values("Sam", 4058893820, "t-mobil");
insert into contact_info (name,  phone_number, service) values("Ali", 4059893820, "at&t");
insert into contact_info (name,  phone_number, service) values("Rami", 4059093820, "t-mobil");
insert into contact_info (name,  phone_number, service) values("Robert", 4050093820, "t-mobil");
insert into contact_info (name,  phone_number, service) values("Darren", 4058893834, "spring");
insert into contact_info (name,  phone_number, service) values("Hassan", 4058553820, "cricket");
insert into contact_info (name,  phone_number, service) values("Emliy", 4058899820, "cricket");
insert into contact_info (name,  phone_number, service) values("Nancy", 4058669820, "at&t");
```

+ ** READ FROM A TABLE **

Later in this tutorial, you might ask the question: What is query?

Query is the most common operation in sql! It is the sql statement that makes use of
the keyword 'select'. This keyword returns data from tables without making any change
on the stored data. For more information see [https://en.wikipedia.org/wiki/SQL].

To return all the inserted values from a table, you follow the keyword 'select'
an asterisk "*"

select * from table_name;

```sql
select * from employee;
```

**output**

> 1 Sam  27
>
> 2	 Ali  23
>
> 3 Rami  20
>
> 4 Robert  60
>
> 5 Darren  30
>
> 6 Hassan 45

```sql
select * from food_fav;
```

**output**
1	Sam	Byriani
>
2	Ali	chard and chicken
>
3	Rami	taboli
>
4	Robert	falafel
>
5	Darren	cayro
>
6	Hassan	kabab
>
7	Emliy	humus
>
8	Nancy	salad


The following query is to return a column/columns from a table:

select column_1,...,column_n from table_name;

```sql
select name from employee;
```

**output**

> Sam
>
> Ali
>
> Rami
>
> Robert
>
> Darren
>
> Hassan

If you would like to return specific values of your table, you would use
** WHERE CLAUSE ** in the query, as:

```sql
select* from employee where age > 40;
```

**output**

> 4 Robert 60
>
> 6 Hassan 45


+ ** UPDATE A TABLE **

We can update all contents of a column of a table by using the following query:

update table_name set column_name= update-info;

```sql
update contact_info set service="tmobile";
select* from contact_info;
```
**output**

>1	Sam	4058893820	tmobile
>
>2	Ali	4059893820	tmobile
>
>3	Rami	4059093820	tmobile
>
>4	Robert	4050093820	tmobile
>
>5	Darren	4058893834	tmobile
>
>6	Hassan	4058553820	tmobile
>
>7	Emliy	4058899820	tmobile
>
>8	Nancy	4058669820	tmobile

The following query is to change a specific slot of a column in a table:

update table_name set column_name= update-info where condition;

In the below query, we are changing Darren's favoriate meal from humus to Kuba
in the food_fav table.  

```sql
update food_fav set meal="Kuba" where name="Darren";
select* from food_fav;
```
>Update:
>
1	Sam	Byriani
>
2	Ali	chard and chicken
>
3	Rami	taboli
>
4	Robert	falafel
>
5	Darren	Kuba
>
6	Hassan	kabab
>
7	Emliy	humus
>
8	Nancy	salad

+ ** DELET TABLE **

The query to delete a column from a table, after it is created, has to have
to have the where clause. The query is:

delete from table_name where any_condition;

```sql
delete from contact_info where id=1;
delete from contact_info where name='Ali';
select* from contact_info;
```

>Output:
>
3	Rami	4059093820	tmobile
>
4	Robert	4050093820	tmobile
>
5	Darren	4058893834	tmobile
>
6	Hassan	4058553820	tmobile
>
7	Emliy	4058899820	tmobile
>
8	Nancy	4058669820	tmobile


The query to delete the entire table is:

drop table table_name;

You have to be sure before you run the query, because once you run it
the information in the table will be gone forever.

```sql
create table food (id integer primary key auto_increment, name text, meal text);
drop table food;
```

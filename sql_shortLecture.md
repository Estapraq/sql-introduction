Follow me on [Medium](https://medium.com/@estapraqkahlilalani) @estapraqkahlilalani, and on [Twitter](https://twitter.com/EstapraqAlani), and visit [my personal site](http://www.estapraq.com/).


# LEARN BASIC SQL IN A FEW HOURS

This course is for introducing and teaching basic sql in few hours! I hope you fully enjoy to the end it as much as I have!

**Table of contents:**

* [CRUD](#crud)


## What is database?

A database is a collection of information that is organized so that it can easily be accessed, managed, and updated. In one view, databases can be classified according to types of content: bibliographic, full-text, numeric, and images. These data can come in different format excel, csv, txt files.  

## What is SQL?

SQL (pronounced "ess-que-el") stands for Structured Query Language. SQL is used to communicate with a database. According to ANSI (American National Standards Institute), it is the standard language for relational database management systems.

SQL is as easy as Excel, but it is more flexible in working with multiple databases, and data integrity. SQL can be ran from the shell, or from a GUI on the computer. I personally use sequel pro.

#<a name="crud">CRUD</a>
----

## CREATE A TABLE

If you try to create a table with an empty parenthesis such as:

```sql
create table emplyee()
```

You will get an error that says:

```
in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1.
```

To correctly create a table you should have an argument in the parenthesis and should look like:

```sql
create table employee(id integer primary key, name text, age integer);
```

**output** 

> id  name  age


## INSERT ELEMENTS

To insert elements into a table:

```sql
insert into employee values(1, "Sam", 27);
insert into employee values(2, "Ali", 23);
insert into employee values(3, "Rami", 20);
insert into employee values(4, "Robert", 60);
insert into employee values(5, "Darren", 30);
insert into employee values(6, "Hassan", 45);
```

## SELECT: READ FROM A TABLE

To return all the inserted values:


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


To return the column 'name' from the table employee:

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

## ORDER BY

To return a sorted table by the chosen column. It is ascending order by default:

```sql
select * from employee order by age;
```

**output** 

> 3 Rami 20
> 
> 2 Ali 23
> 
> 1 Sam 27
> 
> 5 Darren 30
> 
> 6 Hassan 45
> 
> 4 Robert 60


To return a sorted table by the chosen column in decreasing order:

```sql
select * from employee order by age desc;
```

**output**

> 4 Robert 60
> 
> 6 Hassan 45
> 
> 5 Darren 30
> 
> 1 Sam 27
> 
> 2 Ali 23
> 
> 3 Rami 20


## WHERE CLAUSE

Where is an operator to split the table:

```sql
select * from employee where age > 40;
```

**output**

> 4 Robert 60
> 
> 6 Hassan 45

Where is sorting the table by a specific column.

Note that, you get an error if you switch the order of the operators i.e 'where' has to come before 'order by'.

```sql
select * from employee where age > 40 order by age;
```

**output**


> 6 Hassan 45
> 
> 4 Robert 60

## Auto-increment

Create a table "payroll" with Id key that auto-increment i.e I don't need to worry about entering 'id' every time.

```sql
create table payroll (id integer primary key auto_increment, name text, hours integer, project text);
```

> Output:

>  id   name hours   project  

* Insert values into table payroll

the output of this code will give an error

```sql
> insert into payroll values ( "Sam", 7.5, "proj1");
```

The right code should be.

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
```

Insert 5.5 will be rounded up to 6 because the type of hours is integer. If I want exactly 5.5, 'hours' should be type float

```sql
insert into payroll (name, hours, project) values("Nancy", 5.5, "proj2");
```

>Output:
>
1	Sam	7	proj1
>
2	Ali	1	proj2
>
3	Rami	10	proj1
>
4	Robert	4	proj3
>
5	Darren	3	proj2
>
6	Hassan	6	proj3
>
7	Emliy	5	proj1
>
8	Sam	8	proj2
>
9	Emliy	5	proj3
>
10	Emliy	5	proj2
>
11	Nancy	6	proj2


# AGGREGATE FUNCTIONS

They are Sum, Max, Min, or Average function. It returns a number.

It returns the sum of all hours for the table,

```sql
select sum(hours) from payroll;
```

>Output:

> sum(hours)

> 60

It returns the max age in the column 'age'.

> select max(age) from employee;

>Output:

> max(age)

> 60

The output is the column 'name', and sum(hours) which is the total of hours for each name.

```sql
select name,sum(hours) from payroll group by name;
```

>Output:
>
Darren	3
>
Emliy	15
>
Hassan	6
>
Nancy	6
>
Rami	10
>
Robert	4
>
Sam	15

# As operator

To change the name of a column, for example change the name of the column sum(hours) to total_hrs.

Note: if you do total-hrs, sql will fail. We need to use '_' instead of '-' in names.

```sql
select name,sum(hours) as total_hrs from payroll group by name;
```

>Output:
>
name total_hrs
>
Darren	3
>
Emliy	15
>
Hassan	6
>
Nancy	6
>
Rami	10
>
Robert	4
>
Sam	15

Here, filter by 'where hours>5' happens through each individual log of column hours.

```sql
select name,sum(hours) as total_hrs from payroll where hours>5 group by name;
```

>Output:

> Hassan 6

> Nancy	6

> Rami	10

> Sam	15

* Having operator

The following query gives an error

```sql
select name, sum(hours) as total_hrs from payroll
where total_hrs >5 group by name;
```

>Output:

> Unknown column 'total_hrs' in 'where clause

So to filter by new column total_hrs, we have to use 'having' operator. It returns a number.

```sql
select sum(hours) as total_hrs from payroll having total_hrs >5 ;
```

>Output:

> 60

Notation: 'group by' operator has to come after 'having' operator.

The following returns a table because of 'group by' operator,

```sql
select name, sum(hours) as total_hrs from payroll group by name having total_hrs >5;
```

>Output:
>
Emliy	15
>
Hassan	6
>
Nancy	6
>
Rami	10
>
Sam	15

* GROUP BY

To get the sum of hours for each employee, we have to aggregate and group by name. The returns will be a column 'sum(hours)' of the total hours for each employee

```sql
select sum(hours) from payroll group by name;
```

>Output:
>
3
>
15
>
6
>
6
>
10
>
4
>
15

To get a table that has employees names and the total hors

```sql
select name,sum(hours) from payroll group by name;
```

>Output:
>
Darren	3
>
Emliy	15
>
Hassan	6
>
Nancy	6
>
Rami	10
>
Robert	4
>
Sam	15

NOTE: if you include 'project' into the syntax, it will gives an error because it is not unique for each employee.
For example

```sql
select name, project, sum(hours) from payroll group by name;
```

But instead you can get a table that has project names and the total hors for each project,

```sql
select project,sum(hours) from payroll group by project;
```

>Output:
>
proj1	22
>
proj2	23
>
proj3	15


Notation: How that would work behind the seen? sql will do
group by by project first, sum the hours for each project
group, then select from the project column and start
matching the groups and return the sum.


* AND/OR OPERATOR

They are used usually with 'where' clause. The return is a table.

```sql
select * from payroll where hours>6 and project="proj1";
```

>Output:
>
1	Sam	7	proj1
>
3	Rami	10	proj1

```sql
select * from payroll where hours>6 or project="proj1";
```

>Output:
>
1	Sam	7	proj1
>
3	Rami	10	proj1
>
7	Emliy	5	proj1
>
8	Sam	8	proj2


Note: keep in your mind that 'and' has precedence over 'or', we can always change the order by adding parenthesis'()'

Here project="proj1" and name="Emliy cames first, then the result combines with or hours>6

```sql
select * from payroll where hours>6 or project="proj1" and name="Emliy";
```

>Output:
>
1	Sam	7	proj1
>
3	Rami	10	proj1
>
7	Emliy	5	proj1
>
8	Sam	8	proj2

Here (hours>6 or project="proj1") cames first, then the result combines with and name="Emliy"

```sql
select * from payroll where (hours>6 or project="proj1") and name="Emliy";
```

>Output:
>
7	Emliy	5	proj1


You can use as many 'or/ and' as you like,

```sql
select * from payroll where project='proj2' or project="proj1";
```

>Output:
>
1	Sam	7	proj1
>
2	Ali	1	proj2
>
3	Rami	10	proj1
>
5	Darren	3	proj2
>
7	Emliy	5	proj1
>
8	Sam	8	proj2
>
10	Emliy	5	proj2
>
11	Nancy	6	proj2

```sql
select * from payroll where name='Sam' or name="Emliy" or name="Darren" or name="Ali";
```

>Output:
>
1	Sam	7	proj1
>
2	Ali	1	proj2
>
5	Darren	3	proj2
>
7	Emliy	5	proj1
>
8	Sam	8	proj2
>
9	Emliy	5	proj3
>
10	Emliy	5	proj2


* IN/ NOT IN OPERATOR

Instead of using so many of the operator 'or', we can use the operator 'in',

```sql
select * from payroll where name in ('Sam', "Emliy", "Darren","Ali");
```

>Output:
>
1	Sam	7	proj1
>
2	Ali	1	proj2
>
3	Rami	10	proj1
>
4	Robert	4	proj3
>
5	Darren	3	proj2
>
6	Hassan	6	proj3
>
8	Sam	8	proj2


We can also use the inverse operator 'not in',

```sql
select * from payroll where name not in ('Sam', "Emliy", "Darren", "Ali");
```

>Output:
>
3	Rami	10	proj1
>
4	Robert	4	proj3
>
6	Hassan	6	proj3
>
11	Nancy	6	proj2

* INSIDE/OUTISE QUERY

We can relate the two tables in the query, but if the name column is updated in one of the tables we won't have the right result,

```sql
select * from payroll where name in ('Sam', "Ali", "Rami", "Robert", "Darren", "Hassan");
```
>Output:
>
1	Sam	7	proj1
>
2	Ali	1	proj2
>
3	Rami	10	proj1
>
4	Robert	4	proj3
>
5	Darren	3	proj2
>
6	Hassan	6	proj3
>
8	Sam	8	proj2

To keep the result up to updated, we can combine two queries in one i.e outer query(inside query)

```sql
select * from payroll where name in (select name from employee);
```
>Output:
>
1	Sam	7	proj1
>
2	Ali	1	proj2
>
3	Rami	10	proj1
>
4	Robert	4	proj3
>
5	Darren	3	proj2
>
6	Hassan	6	proj3
>
8	Sam	8	proj2

We can always use 'where' clause and 'and/or/in/ not in' operator as well in the inside/ outside query.

```sql
select * from payroll where name in (select name from employee where name in ('Sam', "Emliy", "Darren", "Ali") and age>23);
```
>Output:
>
1	Sam	7	proj1
>
5	Darren	3	proj2
>
8	Sam	8	proj2

* MATCHING OPERATOR

The matching operators '=' and 'like': '=' does exact match, where 'like' does unexact match.

Notation: We don't have in sql '==' or '!='

```sql
select * from payroll where name in (select name from employee where project='proj1');
```
>Output:
>
1	Sam	7	proj1
>
3	Rami	10	proj1


```sql
select * from payroll where name in (select name from employee where project like "%proj%");
```
>Output:
>
1	Sam	7	proj1
>
8	Sam	8	proj2
>
2	Ali	1	proj2
>
3	Rami	10	proj1
>
4	Robert	4	proj3
>
5	Darren	3	proj2
>
6	Hassan	6	proj3

```sql
select * from payroll where name in (select name from employee where project like "%2%");
```
>Output:
>
8	Sam	8	proj2
>
2	Ali	1	proj2
>
5	Darren	3	proj2

* COUNT FUNCTION

To count the times that something happened. For example: I want to count how many times employees worked on each project and return the project that has been visited more than three times.

```sql
select project from payroll group by project having count(*)>3 ;
```
>Output:
>
proj2

```sql
select project, count(*) from payroll group by project having count(*)>3;
```
>Output:
>
proj2	5

```sql
select project, count(*) from payroll group by project;
```
>Output:
>
proj1	3
>
proj2	5
>
proj3	3

```sql
select project, count(*) from payroll group by project having count(*)>=5;
```

>Output:
>
proj2	5


* CASE OPERATOR

We can add a column to our output table using case operator'*/

```sql
select name, count(*),
case
when count(*)>=5 then "deserve raise"
when count(*)>=2 then "need to work more"
else "must be fired"
end
from payroll group by name;
```
>Output:
>
Ali	1	must be fired
>
Darren	1	must be fired
>
Emliy	3	need to work more
>
Hassan	1	must be fired
>
Nancy	1	must be fired
>
Rami	1	must be fired
>
Robert	1	must be fired
>
Sam	2	need to work more


To change the name of the column, we do

```sql
select project, count(*),
case
when count(*)>=5 then "Done"
when count(*)=3 then "keep going"
else "boring project"
end as "describtion"
from payroll group by project;
```
>Output:
>
proj1	3	keep going
>
proj2	5	Done
>
proj3	3	keep going

'group by' has to be at the end and we can use 'and/or' operator as well. If we use 5=<sum(hours)<10, we get an error.

```sql
select name, sum(hours),
case
when sum(hours)>=10 then "raise"
when sum(hours)<10 and sum(hours)>=5  then "work more"
els "fired"
end as "report"
from payroll group by name;
```

>Output:
>
Ali	1	fired
>
Darren	3	fired
>
Emliy	15	raise
>
Hassan	6	work more
>
Nancy	6	work more
>
Rami	10	raise
>
Robert	4	fired
>
Sam	15	raise


* JOINING TABLES

create a table "employee" with Id key that auto-increment.

```sql
create table contact_info(id integer primary key auto_increment, name text, phone_number text, service text);
insert into contact_info (name, phone_number, service) values("Sam", 4058893820, "t-mobil");
insert into contact_info (name,  phone_number, service) values("Ali", 4059893820, "at&t");
insert into contact_info (name,  phone_number, service) values("Rami", 4059093820, "t-mobil");
insert into contact_info (name,  phone_number, service) values("Robert", 4050093820, "t-mobil");
insert into contact_info (name,  phone_number, service) values("Darren", 4058893834, "spring");
insert into contact_info (name,  phone_number, service) values("Hassan", 4058553820, "cricket");
insert into contact_info (name,  phone_number, service) values("Emliy", 4058899820, "cricket");
insert into contact_info (name,  phone_number, service) values("Nancy", 4058669820, "at&t");
```
>Output:
>
1	Sam	4058893820	t-mobil
>
2	Ali	4059893820	at&t
>
3	Rami	4059093820	t-mobil
>
4	Robert	4050093820	t-mobil
>
5	Darren	4058893834	spring
>
6	Hassan	4058553820	cricket
>
7	Emliy	4058899820	cricket
>
8	Nancy	4058669820	at&t




```sql
create table food_fav(id integer primary key auto_increment, name text, meal text);
insert into food_fav(name, meal) values("Sam", "Byriani");
insert into food_fav (name, meal) values("Ali","chard and chicken");
insert into food_fav (name, meal) values("Rami", "taboli");
insert into food_fav (name, meal) values("Robert", "falafel");
insert into food_fav (name, meal) values("Darren", "cayro");
insert into food_fav (name, meal) values("Hassan","kabab");
insert into food_fav (name, meal) values("Emliy", "humus");
insert into food_fav (name, meal) values("Nancy","salad");
```
>Output:
>
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

* CROSS JOIN

It is easy, but it is not the best approach! In the result eight rows will be generated for each row in food_fav table.

```sql
select* from food_fav, contact_info;
```
>Output:
>
1	Sam	Byriani	1	Sam	4058893820	t-mobil
>
2	Ali	chard and chicken	1	Sam	4058893820	t-mobil
>
3	Rami	taboli	1	Sam	4058893820	t-mobil
>
4	Robert	falafel	1	Sam	4058893820	t-mobil
>
5	Darren	cayro	1	Sam	4058893820	t-mobil
>
6	Hassan	kabab	1	Sam	4058893820	t-mobil
>
7	Emliy	humus	1	Sam	4058893820	t-mobil
>
8	Nancy	salad	1	Sam	4058893820	t-mobil
>
1	Sam	Byriani	2	Ali	4059893820	at&t
>
2	Ali	chard and chicken	2	Ali	4059893820	at&t
>
3	Rami	taboli	2	Ali	4059893820	at&t
>
4	Robert	falafel	2	Ali	4059893820	at&t
>
5	Darren	cayro	2	Ali	4059893820	at&t
>
6	Hassan	kabab	2	Ali	4059893820	at&t
>
7	Emliy	humus	2	Ali	4059893820	at&t
>
8	Nancy	salad	2	Ali	4059893820	at&t
>
1	Sam	Byriani	3	Rami	4059093820	t-mobil
>
2	Ali	chard and chicken	3	Rami	4059093820	t-mobil
>
3	Rami	taboli	3	Rami	4059093820	t-mobil
>
4	Robert	falafel	3	Rami	4059093820	t-mobil
>
5	Darren	cayro	3	Rami	4059093820	t-mobil
>
6	Hassan	kabab	3	Rami	4059093820	t-mobil
>
7	Emliy	humus	3	Rami	4059093820	t-mobil
>
8	Nancy	salad	3	Rami	4059093820	t-mobil
>
1	Sam	Byriani	4	Robert	4050093820	t-mobil
>
2	Ali	chard and chicken	4	Robert	4050093820	t-mobil
>
3	Rami	taboli	4	Robert	4050093820	t-mobil
>
4	Robert	falafel	4	Robert	4050093820	t-mobil
>
5	Darren	cayro	4	Robert	4050093820	t-mobil
>
6	Hassan	kabab	4	Robert	4050093820	t-mobil
>
7	Emliy	humus	4	Robert	4050093820	t-mobil
>
8	Nancy	salad	4	Robert	4050093820	t-mobil
>
1	Sam	Byriani	5	Darren	4058893834	spring
>
2	Ali	chard and chicken	5	Darren	4058893834	spring
>
3	Rami	taboli	5	Darren	4058893834	spring
>
4	Robert	falafel	5	Darren	4058893834	spring
>
5
>	Darren	cayro	5	Darren	4058893834	spring
6
>	Hassan	kabab	5	Darren	4058893834	spring
7
>	Emliy	humus	5	Darren	4058893834	spring
8
>	Nancy	salad	5	Darren	4058893834	spring
1
>	Sam	Byriani	6	Hassan	4058553820	cricket
2
>	Ali	chard and chicken	6	Hassan	4058553820	cricket
3
>	Rami	taboli	6	Hassan	4058553820	cricket
4
>	Robert	falafel	6	Hassan	4058553820	cricket
5
>	Darren	cayro	6	Hassan	4058553820	cricket
6
>	Hassan	kabab	6	Hassan	4058553820	cricket
7
>	Emliy	humus	6	Hassan	4058553820	cricket
8	Nancy	salad	6	Hassan	4058553820	cricket
>
1	Sam	Byriani	7	Emliy	4058899820	cricket
>
2	Ali	chard and chicken	7	Emliy	4058899820	cricket
>
3	Rami	taboli	7	Emliy	4058899820	cricket
>
4	Robert	falafel	7	Emliy	4058899820	cricket
>
5	Darren	cayro	7	Emliy	4058899820	cricket
>
6	Hassan	kabab	7	Emliy	4058899820	cricket
>
7	Emliy	humus	7	Emliy	4058899820	cricket
>
8	Nancy	salad	7	Emliy	4058899820	cricket
>
1	Sam	Byriani	8	Nancy	4058669820	at&t
>
2	Ali	chard and chicken	8	Nancy	4058669820	at&t
>
3	Rami	taboli	8	Nancy	4058669820	at&t
>
4	Robert	falafel	8	Nancy	4058669820	at&t
>
5	Darren	cayro	8	Nancy	4058669820	at&t
>
6	Hassan	kabab	8	Nancy	4058669820	at&t
>
7	Emliy	humus	8	Nancy	4058669820	at&t
>
8	Nancy	salad	8	Nancy	4058669820	at&t

* INNER JOIN

The result is only the matching record in both tables. We have two types of
inner join explicit and implicit. For both of them we need a sharing key, and
explicit inner join is the best join.

** Implicit Inner Join:

```sql
select* from food_fav, contact_info where food_fav.id=contact_info.id;
```

>Output:
>
1	Sam	Byriani	1	Sam	4058893820	t-mobil
>
2	Ali	chard and chicken	2	Ali	4059893820	at&t
>
3	Rami	taboli	3	Rami	4059093820	t-mobil
>
4	Robert	falafel	4	Robert	4050093820	t-mobil
>
5	Darren	cayro	5	Darren	4058893834	spring
>
6	Hassan	kabab	6	Hassan	4058553820	cricket
>
7	Emliy	humus	7	Emliy	4058899820	cricket
>
8	Nancy	salad	8	Nancy	4058669820	at&t

** Explicit Inner Join:

```sql
select* from food_fav
join contact_info
on food_fav.id=contact_info.id;
```
>Output:
>
1	Sam	Byriani	1	Sam	4058893820	t-mobil
>
2	Ali	chard and chicken	2	Ali	4059893820	at&t
>
3	Rami	taboli	3	Rami	4059093820	t-mobil
>
4	Robert	falafel	4	Robert	4050093820	t-mobil
>
5	Darren	cayro	5	Darren	4058893834	spring
>
6	Hassan	kabab	6	Hassan	4058553820	cricket
>
7	Emliy	humus	7	Emliy	4058899820	cricket
>
8	Nancy	salad	8	Nancy	4058669820	at&t

```sql
select* from food_fav
join contact_info
on food_fav.name=contact_info.name;
```

>Output:
>
1	Sam	Byriani	1	Sam	4058893820	t-mobil
>
2	Ali	chard and chicken	2	Ali	4059893820	at&t
>
3	Rami	taboli	3	Rami	4059093820	t-mobil
>
4	Robert	falafel	4	Robert	4050093820	t-mobil
>
5	Darren	cayro	5	Darren	4058893834	spring
>
6	Hassan	kabab	6	Hassan	4058553820	cricket
>
7	Emliy	humus	7	Emliy	4058899820	cricket
>
8	Nancy	salad	8	Nancy	4058669820	at&t


We can also arrange the columns in the output table.

```sql
select meal, phone_number
from food_fav
join contact_info
on food_fav.id=contact_info.id;
```
>Output:
>
Byriani	4058893820
>
chard and chicken	4059893820
>
taboli	4059093820
>
falafel	4050093820
>
cayro	4058893834
>
kabab	4058553820
>
humus	4058899820
>
salad	4058669820


Since two tables have 'name' as a column, so we have to prefix name as we add it, otherwise we get an error.

```sql
select contact_info.name, meal, phone_number
from food_fav
join contact_info
on food_fav.id=contact_info.id;
```

>Output:
>
Sam	Byriani	4058893820
>
Ali	chard and chicken	4059893820
>
Rami	taboli	4059093820
>
Robert	falafel	4050093820
>
Darren	cayro	4058893834
>
Hassan	kabab	4058553820
>
Emliy	humus	4058899820
>
Nancy	salad	4058669820


We can also use 'where' clause in the join and 'and/or/in/not in' operators,

```sql
select food_fav.name, meal, phone_number
from food_fav
join contact_info
on food_fav.id=contact_info.id
where meal in ("Byriani", "salad", "humus") or contact_info.name in ("Nancy", "Ali", "Darren");
```

>Output:
>
Sam	Byriani	4058893820
>
Ali	chard and chicken	4059893820
>
Darren	cayro	4058893834
>
Emliy	humus	4058899820
>
Nancy	salad	4058669820

* OUTER JOIN

The result for this type of join is more than the matching record, and the result depends on the type of the outer join wether if it is left, right, or full.

** Left Outer Join

It gives all the matching data and all the not matching rows in the first table as well. The cells that are empty in the not matching record rows, will be filled with NULL.

```sql
select* from payroll
left outer join employee
on payroll.name=employee.name;
```
>Outout:
>
1	Sam	7	proj1	1	Sam	27
>
8	Sam	8	proj2	1	Sam	27
>
2	Ali	1	proj2	2	Ali	23
>
3	Rami	10	proj1	3	Rami	20
>
4	Robert	4	proj3	4	Robert	60
>
5	Darren	3	proj2	5	Darren	30
>
6	Hassan	6	proj3	6	Hassan	45
>
7	Emliy	5	proj1	NULL	NULL	NULL
>
9	Emliy	5	proj3	NULL	NULL	NULL
>
10	Emliy	5	proj2	NULL	NULL	NULL
>
11	Nancy	6	proj2	NULL	NULL	NULL


** Right Outer Join

It gives all the matching data and all the not matching rows in the second table as well. The cells that are empty in the not matching record rows, will be filled with NULL.

```sql
select* from payroll
left outer join employee
on payroll.name=employee.name;
```

>Output:
>
1	Sam	7	proj1	1	Sam	27
>
8	Sam	8	proj2	1	Sam	27
>
2	Ali	1	proj2	2	Ali	23
>
3	Rami	10	proj1	3	Rami	20
>
4	Robert	4	proj3	4	Robert	60
>
5	Darren	3	proj2	5	Darren	30
>
6	Hassan	6	proj3	6	Hassan	45
>
7	Emliy	5	proj1	NULL	NULL	NULL
>
9	Emliy	5	proj3	NULL	NULL	NULL
>
10	Emliy	5	proj2	NULL	NULL	NULL
>
11	Nancy	6	proj2	NULL	NULL	NULL

** Full Outer Join

It keeps all the matching and not matching rows in both tables. The cells that are not matching from both tables will be filled with NULL. It is not working if you don't have support.

```sql
select* from payroll
full outer join employee
on payroll.name=employee.name;
```

Before we move to the self join topic, we need to create a table "employee" with id key
that is auto-increment.

```sql
create table team_members(id integer primary key auto_increment, name text, phone_number text, partner text, partner_sex char);
insert into team_members (name, phone_number, partner, partner_sex) values("Sam", 4058893820, "Ali", 'M');
insert into team_members (name, phone_number, partner, partner_sex) values("Ali", 4059893820, "Hassan", 'M');
insert into team_members (name, phone_number, partner, partner_sex) values("Rami", 4059093820, "Hamsa", 'F');
insert into team_members (name, phone_number, partner, partner_sex) values("Robert", 4050093820, "Darren", 'M');
insert into team_members (name, phone_number, partner, partner_sex) values("Darren", 4058893834, "Nancy", 'F');
insert into team_members (name, phone_number, partner, partner_sex) values("Hassan", 4058553820, "Darren", 'M');
insert into team_members (name, phone_number, partner, partner_sex) values("Emliy", 4058899820, "Nancy", 'F');
insert into team_members (name, phone_number, partner, partner_sex) values("Nancy", 4058669820, "Hassan", 'M');
select*from team_members;
```
>Output:
>
1	Sam	4058893820	Ali	M
>
2	Ali	4059893820	Hassan	M
>
3	Rami	4059093820	Hamsa	F
>
4	Robert	4050093820	Darren	M
>
5	Darren	4058893834	Nancy	F
>
6	Hassan	4058553820	Darren	M
>
7	Emliy	4058899820	Nancy	F
>
8	Nancy	4058669820	Hassan	M


* SELF JOIN

It is to join a table to itself. You have to give a nick name to one of them to distinguish, and you have to prefix the called columns as well. For exaple, this query will give an error

```sql
select neme, partner, phone_number
from team_members
join team_members;*/
```

The right equery for self join is,

```sql
select team_members.name, team_members.partner, team_members.phone_number
from team_members
join team_members team;
```
>Output:
>
Sam	Ali	4058893820
>
Ali	Hassan	4059893820
>
Rami	Hamsa	4059093820
>
Robert	Darren	4050093820
>
Darren	Nancy	4058893834
>
Hassan	Darren	4058553820
>
Emliy	Nancy	4058899820
>
Nancy	Hassan	4058669820
>
Sam	Ali	4058893820
>
Ali	Hassan	4059893820
>
Rami	Hamsa	4059093820
>
Robert	Darren	4050093820
>
Darren	Nancy	4058893834
>
Hassan	Darren	4058553820
>
Emliy	Nancy	4058899820
>
Nancy	Hassan	4058669820
>
Sam	Ali	4058893820
>
Ali	Hassan	4059893820
>
Rami	Hamsa	4059093820
>
Robert	Darren	4050093820
>
Darren	Nancy	4058893834
>
Hassan	Darren	4058553820
>
Emliy	Nancy	4058899820
>
Nancy	Hassan	4058669820
>
Sam	Ali	4058893820
>
Ali	Hassan	4059893820
>
Rami	Hamsa	4059093820
>
Robert	Darren	4050093820
>
Darren	Nancy	4058893834
>
Hassan	Darren	4058553820
>
Emliy	Nancy	4058899820
>
Nancy	Hassan	4058669820
>
Sam	Ali	4058893820
>
Ali	Hassan	4059893820
>
Rami	Hamsa	4059093820
>
Robert	Darren	4050093820
>
Darren	Nancy	4058893834
>
Hassan	Darren	4058553820
>
Emliy	Nancy	4058899820
>
Nancy	Hassan	4058669820
>
Sam	Ali	4058893820
>
Ali	Hassan	4059893820
>
Rami	Hamsa	4059093820
>
Robert	Darren	4050093820
>
Darren	Nancy	4058893834
>
Hassan	Darren	4058553820
>
Emliy	Nancy	4058899820
>
Nancy	Hassan	4058669820
>
Sam	Ali	4058893820
>
Ali	Hassan	4059893820
>
Rami	Hamsa	4059093820
>
Robert	Darren	4050093820
>
Darren	Nancy	4058893834
>
Hassan	Darren	4058553820
>
Emliy	Nancy	4058899820
>
Nancy	Hassan	4058669820
>
Sam	Ali	4058893820
>
Ali	Hassan	4059893820
>
Rami	Hamsa	4059093820
>
Robert	Darren	4050093820
>
Darren	Nancy	4058893834
>
Hassan	Darren	4058553820
>
Emliy	Nancy	4058899820
>
Nancy	Hassan	4058669820

you can also do,

```sql
select team_members.name, team_members.partner, team_members.phone_number
from team_members
join team_members team
on team_members.name = team.partner;
```
>Output:
>
Ali	Hassan	4059893820
>
Hassan	Darren	4058553820
>
Darren	Nancy	4058893834
>
Nancy	Hassan	4058669820
>
Darren	Nancy	4058893834
>
Nancy	Hassan	4058669820
>
Hassan	Darren	4058553820


* UNION

When you don't have a support for the Full Outer Join, you can use 'Union' instead. It keeps all the matching and not matching rows from both tables, and the cells that are empty in the not matching record rows will be filled with NULL.

```sql
select* from payroll
left outer join employee
on payroll.name=employee.name
union
select* from payroll
right outer join employee
on payroll.name=employee.name;
```
>Output:
>
1	Sam	7	proj1	1	Sam	27
>
8	Sam	8	proj2	1	Sam	27
>
2	Ali	1	proj2	2	Ali	23
>
3	Rami	10	proj1	3	Rami	20
>
4	Robert	4	proj3	4	Robert	60
>
5	Darren	3	proj2	5	Darren	30
>
6	Hassan	6	proj3	6	Hassan	45
>
7	Emliy	5	proj1	NULL	NULL	NULL
>
9	Emliy	5	proj3	NULL	NULL	NULL
>
10	Emliy	5	proj2	NULL	NULL	NULL
>
11	Nancy	6	proj2	NULL	NULL	NULL

* UPDATE

** update....set:

It is to update the content of a table.

In this case it will change all the cells in column service to tmobile,

```sql
update contact_info set service="tmobile";
select* from contact_info;
```
>Update:
>
1	Sam	4058893820	tmobile
>
2	Ali	4059893820	tmobile
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

In this case it will change Darren's favoriate food from hummus to kuba,

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

* ALTER TABLE

** altre table....add:

Add a column after create the table.

```sql
alter table food_fav add spice_level text;
```

To set a default input to the new column,

```sql
alter table food_fav add spice_level text default NULL;
select* from food_fav;
```
>Output:
>
1	Sam	Byriani	NULL
>
2	Ali	chard and chicken	NULL
>
3	Rami	taboli	NULL
>
4	Robert	falafel	NULL
>
5	Darren	Kuba	NULL
>
6	Hassan	kabab	NULL
>
7	Emliy	humus	NULL
>
8	Nancy	salad	NULL

** altre table....modify: c

To change the type of the data after create the table.

I have created 'contact' table, and it has the type of the phone_number as integer, and I get an error when I enter phone numbers because it is long, so I am going to change the type of phone_number to text,

```sql
create table contact (id integer primary key auto_increment, name text, phone_number integer);
insert into contact (name, phone_number) values("Sam", 4058893820);
```
>Output:
> Out of range value for column 'phone_number' at row 1

```sql
alter table contact modify phone_number text;
insert into contact(name, phone_number) values("Sam", 4058893820);
select* from contact;
```
>Output:
> 1	 Sam	4058893820

** altre table....rename to:

To change the name of a table after create the table.

```sql
alter table contact rename to info;
```

** alter table....change:

To change the name of a column in a table after create the table.

```sql
alter table payroll change name employeeName text;
select* from payroll;
```

* DELET TABLE

** delete from....where:

To delete a column from a table after the table is created.

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


** drop table:

To delete the entire table. Be sure before you do that, because all the information in the table will be gone.

```sql
create table food (id integer primary key auto_increment, name text, meal text);
drop table food;
```

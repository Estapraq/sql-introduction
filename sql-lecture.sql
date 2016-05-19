/*Lean sql in a few hours*/
/*Follow me on meduim @estapraqkahlilalani*/
/*tweeter @EstapraqAlani */
/*###############################################################################################*/
/******************************************CREATE A TABLE *******************************************/

/*create table emplyee() You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1*/

/*create a table "employee"*/
create table employee(id integer primary key, name text, age integer);

/*###############################################################################################*/
/******************************************INSERT ELEMENTS********************************************/

/*insert values into emplyee */
insert into employee values(1, "Sam", 27);
insert into employee values(2, "Ali", 23);
insert into employee values(3, "Rami", 20);
insert into employee values(4, "Robert", 60);
insert into employee values(5, "Darren", 30);
insert into employee values(6, "Hassan", 45);

/*###############################################################################################*/
/*************************************SELECT : READ FROM A TABLE**************************************/
/*it returns all the inserted values */
select* from employee;

/*returns name column of the table employee*/
select name from employee;

/*###############################################################################################*/
/******************************************ORDER BY********************************************/
/*order by : returns a sorted table by the chosen column. It is acedind order by default*/
select* from employee order by age;

/*order by: returns a sorted table by the chosen column in decreasing order*/
select* from employee order by age desc;

/*###############################################################################################*/
/******************************************WHERE CLASE********************************************/

/*Where clause: It ios an operator to split the table*/
select* from employee where age> 40;


/*Where clause: It ios an operator to split the table. Order by: is to order the table by a specific column*/
/*you get an error if you switch the order of the operators i.e where has to come before order by*/
select* from employee where age> 40 order by age;


/*########################################################################################*/
/*create a table "employee" with Id key that autoincrement i.e I don't need to enter every time*/
create table payroll(id integer primary key auto_increment, name text, hours integer, project text);

/*insert values into emplyee */
/*insert into payroll values("Sam", 7.5, "proj1"); would give you an error in this case*/
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
/*insert 5.5 will be rounded to 6 because the typr of hours is integer. If I want 5.5, it should be float*/
insert into payroll (name, hours, project) values("Nancy", 5.5, "proj2");

/*Aggregate function-sum: it returns a number that is the sumation of all hours*/
select sum(hours) from payroll;


/*###############################################################################################*/
/*****************************************GROUP BY********************************************/

/*To get the sumation of hours for each employee, we have to aggregate and group by name.*/
/*The returns will be a culmn 'sum(hours)' of the total hours each emplyee worked*/
select sum(hours) from payroll group by name;

/*to get a table that has emolyees names and the total hors*/
select name,sum(hours) from payroll group by name;

/*NOTE: if you include 'project' into the syntax, it will gioves an error because it is not unique for each employee,*/
/* for example 'select name, project, sum(hours) from payroll group by name;'*/
/*but you can get a table that has project names and the total hors for each project*/
select project,sum(hours) from payroll group by project;

/*Notation: How that would work behind the seen? sql will do group by by project first, sum the hours for each project group, then select from the project column and start matching the groups and return the sum*/


/*###############################################################################################*/

/******************************************AND/OR OPERATOR******************************************/

/*'and' & 'or' operator: they are used usually with 'where' clause*/
/*the return is a table.*/
select * from payroll where hours>6 and project="proj1";

select * from payroll where hours>6 or project="proj1";

/*keep in your ming 'and' has precedence over 'or', we can always change the order by adding paranthesis'()'*/
/*project="proj1" and name="Emliy cames first, then the result combines with or hours>6 */
select * from payroll where hours>6 or project="proj1" and name="Emliy";

/*(hours>6 or project="proj1") cames first, then the result combines with and name="Emliy" */
select * from payroll where (hours>6 or project="proj1") and name="Emliy";

/*you can use as many as you like*/
select * from payroll where project='proj2' or project="proj1";
select * from payroll where name='Sam' or name="Emliy" or name="Darren" or name="Ali";

/*###############################################################################################*/
/****************************************IN/ NOT IN OPERATOR*************************************/
/*Instead of using so many of the operator 'or', we can use the operator 'in'*/
select * from payroll where name in ('Sam', "Emliy", "Darren","Ali");

/*We can use the inverse operator 'not in'*/
select * from payroll where name not in ('Sam', "Emliy", "Darren", "Ali");


/*###############################################################################################*/
/*****************************************INSIDE/OUTISE QUERY***********************************/

/*We can relate the two tables in the equry, but if the name column is updated*/
/*in emplyee table we won't have the right result*/
select name from employee;
select * from payroll where name in ('Sam', "Ali", "Rami", "Robert", "Darren", "Hassan");

/*so we can combine two equries in one to make sure the result right if the tables are updated*/
/*Notation: outer query(inside query)*/
select * from payroll where name in (select name from employee);

/*We can always use 'where' clause and 'and/or/in/ not in' operater as well in the inside/ outsoide query*/
select * from payroll where name in (select name from employee where name in ('Sam', "Emliy", "Darren", "Ali") and age>23);


/*################################################################################################*/
/******************************************MATCHING OPERATOR**************************************/

/*Notation: Pay attention, we don't have in sql '==' or '!='*/

/* the matching operaters '=' and 'like': '=' does exact match, where 'like' does unexact match*/
select * from payroll where name in (select name from employee where project='proj1');
select * from payroll where name in (select name from employee where project like "%proj%");
select * from payroll where name in (select name from employee where project like "%2%");


/*###############################################################################################*/
/******************************************AGGREGATE FUNCTIONS***********************************/

/*Aggregate functions: Sum, Max, Min, Aveag. It returns a number*/
select max(age) from employee;

/*the result is name culmn and sum(hours) column which is the total of hours for each name*/
select name,sum(hours) from payroll group by name;
/* 'as' operater :To change the name of a column, for xample change the name of the column sum(hours) to total_hrs */
/*if you do total-hrs, sql will fail. We need to use '_' instead of '-' in names */
select name,sum(hours) as total_hrs from payroll group by name;

/*In this case the filteration by 'where hours>5' happens through each indevidual log of hours*/
select name,sum(hours) as total_hrs from payroll where hours>5 group by name;

/* to do this select name,sum(hours) as total_hrs from payroll where total_hrs >5 group by name; will give an error*/
/*Unknown column 'total_hrs' in 'where clause'*/
/*to filter by new column total_hrs, we have to use 'having' operater*/
/*returns a number*/
select sum(hours) as total_hrs from payroll having total_hrs >5 ;

/*Notation: 'group by' operator has to come after 'having' operator*/
/*returns a table because of 'group by' operater*/
select name,sum(hours) as total_hrs from payroll group by name having total_hrs >5;


/*###################################################################################################*/
/******************************************COUNT FUNCTION********************************************/

/*'count' function: is to count the times that something happened. For example: I want to count how many times emplyees worked on each project and return the project that has been visited more than three times */
select project from payroll group by project having count(*)>3 ;

select project, count(*) from payroll group by project having count(*)>3;
select project, count(*) from payroll group by project;
select project, count(*) from payroll group by project having count(*)>=5;


/*###################################################################################################*/
/******************************************CASE OPERSTOR********************************************/


/*'case operater: we can add a culmn to our output table using case operater'*/
select name, count(*),
case
when count(*)>=5 then "deserve raise"
when count(*)>=2 then "need to work more"
else "must be fired"
end
from payroll group by name;

/*change the name of the column*/
select project, count(*),
case
when count(*)>=5 then "Done"
when count(*)=3 then "keep going"
else "boring project"
end as "describtion"
from payroll group by project;

/*'group by' has to by at the end and we can use 'and/or' operater as well. If we use 5=<sum(hours)<10, we getr an error*/
select name, sum(hours),
case
when sum(hours)>=10 then "raise"
when sum(hours)<10 and sum(hours)>=5  then "work more"
else "fired"
end as "report"
from payroll group by name;

/*####################################################################################*/

/*********************************JOINING TABLES**************************************/



/*create a table "employee" with Id key that autoincrement i.e I don't need to enter every time*/
create table contact_info(id integer primary key auto_increment, name text, phone_number text, service text);

/*insert values into emplyee */
/*insert into payroll values("Sam", 7.5, "proj1"); would give you an error in this case*/
insert into contact_info (name, phone_number, service) values("Sam", 4058893820, "t-mobil");
insert into contact_info (name,  phone_number, service) values("Ali", 4059893820, "at&t");
insert into contact_info (name,  phone_number, service) values("Rami", 4059093820, "t-mobil");
insert into contact_info (name,  phone_number, service) values("Robert", 4050093820, "t-mobil");
insert into contact_info (name,  phone_number, service) values("Darren", 4058893834, "spring");
insert into contact_info (name,  phone_number, service) values("Hassan", 4058553820, "cricket");
insert into contact_info (name,  phone_number, service) values("Emliy", 4058899820, "cricket");
insert into contact_info (name,  phone_number, service) values("Nancy", 4058669820, "at&t");

create table food_fav(id integer primary key auto_increment, name text, meal text);

/*insert values into emplyee */
/*insert into payroll values("Sam", 7.5, "proj1"); would give you an error in this case*/
insert into food_fav(name, meal) values("Sam", "Byriani");
insert into food_fav (name, meal) values("Ali","chard and chicken");
insert into food_fav (name, meal) values("Rami", "taboli");
insert into food_fav (name, meal) values("Robert", "falafel");
insert into food_fav (name, meal) values("Darren", "cayro");
insert into food_fav (name, meal) values("Hassan","kabab");
insert into food_fav (name, meal) values("Emliy", "humus");
insert into food_fav (name, meal) values("Nancy","salad");


/******************************************CROSS JOIN********************************************/
/*cross join: it is easy but not ideal! The result will be eight rows for each row in food_fav table */
select* from food_fav, contact_info;



/******************************************INNER JOIN********************************************/
/*Inner Join: The result is only matching record*/

/*Implict Inner Join: we need a key to match*/
select* from food_fav, contact_info where food_fav.id=contact_info.id;



/*Explicit Inner Join: It is the best join, and we need a key to match*/
select* from food_fav
join contact_info
on food_fav.id=contact_info.id;


select* from food_fav
join contact_info
on food_fav.name=contact_info.name;

/*we can also arrange the columns in the output table*/
select meal, phone_number from food_fav
join contact_info
on food_fav.id=contact_info.id;

/*Since two tables have 'name' as a culmn, so we have to prefix name as we add it, otherwise we get an error*/
/*we can also arrange the columns in the output table*/
select contact_info.name, meal, phone_number from food_fav
join contact_info
on food_fav.id=contact_info.id;

/* we can also use 'where' clause in the join and 'and/or/in/not in' operators*/
select food_fav.name, meal, phone_number from food_fav
join contact_info
on food_fav.id=contact_info.id
where meal in ("Byriani", "salad", "humus") or contact_info.name in ("Nancy", "Ali", "Darren");


/******************************************OUTER JOIN********************************************/

/*Outer Join: The result is more than the matching record, and the result depends of the type of the outer join*/

/*Left Outer Join: it gives all the matching data and all the not matching rows in the first table as well*/
/*the cell that are empty in the not matching record rows, will be filled with NULL*/
select* from payroll
left outer join employee
on payroll.name=employee.name;


/*Right Outer Join: it gives all the matching data and all the not matching rows in the second table as well*/
/*the cell that are empty in the not matching record rows, will be filled with NULL*/
select* from payroll
left outer join employee
on payroll.name=employee.name;

/*Full Outer Join: it keeps all the matching and not matching rows in both tables*/
/*the cell that are empty in the not matching record rows, will be filled with NULL*/
/*It is not working if you don't have support*/
select* from payroll
full outer join employee
on payroll.name=employee.name;



/******************************************SELF JOIN********************************************/


/*create a table "employee" with Id key that autoincrement i.e I don't need to enter every time*/
create table team_members(id integer primary key auto_increment, name text, phone_number text, partner text, partner_sex char);

/*insert values into emplyee */
/*insert into payroll values("Sam", 7.5, "proj1"); would give you an error in this case*/
insert into team_members (name, phone_number, partner, partner_sex) values("Sam", 4058893820, "Ali", 'M');
insert into team_members (name, phone_number, partner, partner_sex) values("Ali", 4059893820, "Hassan", 'M');
insert into team_members (name, phone_number, partner, partner_sex) values("Rami", 4059093820, "Hamsa", 'F');
insert into team_members (name, phone_number, partner, partner_sex) values("Robert", 4050093820, "Darren", 'M');
insert into team_members (name, phone_number, partner, partner_sex) values("Darren", 4058893834, "Nancy", 'F');
insert into team_members (name, phone_number, partner, partner_sex) values("Hassan", 4058553820, "Darren", 'M');
insert into team_members (name, phone_number, partner, partner_sex) values("Emliy", 4058899820, "Nancy", 'F');
insert into team_members (name, phone_number, partner, partner_sex) values("Nancy", 4058669820, "Hassan", 'M');

select*from team_members;

/*Self Join: it is to join a table to itself. You have to give a nick name to one of thm to distinguish, and ypu have to prefix the called columens as well*/
/*This query will give an error
select neme, partner, phone_number
from team_members
join team_members;*/


select team_members.name, team_members.partner, team_members.phone_number
from team_members
join team_members team;

/*you can also do */
select team_members.name, team_members.partner, team_members.phone_number
from team_members
join team_members team
on team_members.name = team.partner;
/*#####################################################################################*/
/******************************************UNION***********************************/

/*Union: whe you don't have a support for the Full Outer Join, you can use 'Union' instead!*/
/*It keeps all the matching and not matching rows in both tables*/
/*the cell that are empty in the not matching record rows, will be filled with NULL*/
/*It is not working if you don't have support*/
select* from payroll
left outer join employee
on payroll.name=employee.name
union
select* from payroll
right outer join employee
on payroll.name=employee.name;


/*#####################################################################################*/
/****************************************UPDATE****************************************/

/*update....set: is to update the content pf the table*/
/*in this case it will change all the cells in column service to tmobile*/
update contact_info set service="tmobile";
select* from contact_info;

/*in this case it will change Darren's favoriate food from hummus to kuba*/
update food_fav set meal="Kuba" where name="Darren";
select* from food_fav;

/*#####################################################################################*/
/**********************************ALTER TABLE*****************************************/

/*altre table....add: Add a culumn after create the table*/
alter table food_fav add spice_level text;

/*to set a default input to the new column*/
alter table food_fav add spice_level text default NULL;
select* from food_fav;

/*altre table....modify: change the type of the data after create the table*/
/*I have created contact table, and it has the type of the phone_number as integer, and i get an error,
I am going to change the type to text*/
alter table contact modify phone_number text;
insert into contact(name, phone_number, service) values("Sam", 4058893820, "t-mobil");
select* from contact;

/*altre table....rename to: change the name of a table after create the table*/
alter table contact rename to info;

/*alter table....change: change the name of a column in a table after create the table*/
alter table payroll change name employeeName text;
select* from payroll;
/*######################################################################################*/
/**********************************DELET TABLE*****************************************/

/*delete from....where: Deleted a culumn from a table after the table created*/
delete from contact_info where id=1;
delete from contact_info where name='Ali';
select* from contact_info;


/*drop table: delete the entire table. Be sure before you do that, because all the information in the table will be deleted*/
drop table food;

/*######################################################################################*/
/**********************************THANK YOU :) *****************************************/

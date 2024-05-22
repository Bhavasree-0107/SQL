create schema employee;
use employee;
create table employees_table(
emp_no      int            ,
birth_date  date           ,
first_name  varchar(14)    ,
last_name   varchar(16)    ,
gender      enum('m','f')  ,
hire_date   date           ,
primary key (emp_no)
);

select * from employees_table;

create table salaries_table (
emp_no      int           not null,
salary      int           not null,
from_date   date          not null,
to_date     date          not null,
unique key (emp_no),
foreign key (emp_no) references employees_table (emp_no),
primary key (emp_no,from_date)
);

select * from salaries_table;

create table departments(
dept_no		char(4)      not null,
dept_name   varchar(40)  not null,
primary key (dept_no),
unique key  (dept_name),check(dept_no>0)
);

select * from departments;

insert into employees_table values (0001,'24-05-16','Talin','K P','m','24-05-14');
insert into salaries_table values (1,25000,'24-05-16','24-06-16');
insert into departments values (1,'database management');

insert into employees_table values (2,'24-05-16','Bhava','Sree','f','24-05-14');
insert into salaries_table values (2,55000,'24-05-16','24-06-16');
insert into departments values (2,'database management');


select * from employees_table;
select * from salaries_table;
select * from departments;

select count(*) from employees_table;
select count(*) from employees_table where gender = 'm';

select sum(salary) from salaries_table;

select avg(salary) from salaries_table;

select * from employees_table where first_name like 'T%' ;

-- inner join 
select * from employees_table inner join salaries_table on employees_table.emp_no = salaries_table.emp_no;
select em.first_name,sa.salary from employees_table as em inner join salaries_table as sa on em.emp_no = sa.emp_no;

-- left join
select * from employees_table left join salaries_table on employees_table.emp_no = salaries_table.emp_no;
select em.first_name,sa.salary from employees_table as em left join salaries_table as sa on em.emp_no = sa.emp_no;

-- right join
select * from employees_table right join salaries_table on employees_table.emp_no = salaries_table.emp_no;
select em.first_name,sa.salary from employees_table as em right join salaries_table as sa on em.emp_no = sa.emp_no;

-- cross join
select * from employees_table cross join salaries_table on employees_table.emp_no = salaries_table.emp_no;
select em.first_name,sa.salary from employees_table as em cross join salaries_table as sa on em.emp_no = sa.emp_no;



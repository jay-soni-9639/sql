create table user( id int auto_increment primary key,name varchar(100) not null,email varchar(100) unique not null,date_of_birts date,created_at timestamp default current_timestamp);
select*from user; 
rename table user to customer;
rename table customer to programer;
rename table programer to user;
alter table user add column is_active boolean default true;
alter table user drop column is_active;
alter table user modify email varchar(100) first;
alter table user modify column name varchar(150);
alter table user modify column email varchar(100) after id;
alter table user modify column email varchar(100) after name;
select*from user;
insert into user values(1,"jay soni","jaysoni24122006@gmail.com",'2006-12-24',default);
alter table user add column gender enum('male','female','other');
alter table user modify column gender enum('male','female','other') after date_of_birts;
insert user(gender)  values('male') ;
use startsqll;
insert into user values(3,"bhavesh","bhavesh24122006@gmail.com",'2006-12-12','male',default);
insert into user values(4,"krina","krina24122006@gmail.com",'2007-04-21','female',default);
insert into user values(5,"mehul","mehul24122006@gmail.com",'2006-12-11','male',default);
select*from user;
select name from user where id=3;
select*from user where date_of_birts<'2006-12-24';
select*from user where date_of_birts between '2006-12-11' and '2006-12-24';
alter table user add column salary numeric(10);
alter table user modify column salary numeric(10) after gender;
update user set salary=10000 where id=1;
update user set name='dhruva',email='dhruva@gmail.com' where id=2;
update user set date_of_birts='2011-04-22' where id=2;
update user set salary =200000 where id=2;
update user set salary =300000 where id=3;
update user set salary =400000 where id=4;
update user set salary =500000 where id=5;
update user set gender='male' where id=1;
select *from user where salary between 10000 and 400000;
select*from user;
select*from user where gender in('male','female');
select*from user where gender='male' and salary>200000;
select*from user where name='jay soni' or salary>200000 order by date_of_birts desc;
select*from user where name='jay soni' or salary>200000 order by date_of_birts asc limit 3;
select*from user where salary>100000 order by created_at desc; 
select*from user;
update user set salary=100000 where id=1;
-- update user set salary = salary+1000 where salary < 300000;
delete from user where id=1;
rollback;
commit;
delete from user where id=2;
rollback;
select*from user;
drop table user;
create table user( id int auto_increment primary key,name varchar(100) not null,email varchar(100) unique not null,date_of_birts date,created_at timestamp default current_timestamp);
insert into user values(1,"jay soni","jaysoni24122006@gmail.com",'2006-12-24',default);
alter table user add column gender enum('male','female','other');
alter table user modify column gender enum('male','female','other') after date_of_birts;
insert into user values(3,"bhavesh","bhavesh24122006@gmail.com",'2006-12-12','male',default);
insert into user values(4,"krina","krina24122006@gmail.com",'2007-04-21','female',default);
insert into user values(5,"mehul","mehul24122006@gmail.com",'2006-12-11','male',default);
update user set gender='male' where id=1;
alter table user add column salary numeric(10);
alter table user modify column salary numeric(10) after gender;
update user set salary=100000 where id=1;
update user set salary=200000 where id=2;
update user set salary=300000 where id=3;
update user set salary=400000 where id=4;
update user set salary=500000 where id=5;

-- this is constraints
alter table user add constraint  unique(date_of_birts);
alter table user modify column name varchar(100) null;

alter table user add constraint check_dob check (date_of_birts>'2001-12-24');
insert into user values(6,"mehul","mehu24122006@gmail.com",'2000-12-11','male',600000,default); -- uper jovo check valu atale add nai thai 

-- and now function
select count(*)from user;
select count(*) from user where gender='male';

select min(salary) as min_salary ,max(salary) as max_salary from user;

select sum(salary) as sum_salary from user;
select avg(salary) as avg_salary from user group by gender; 
select id,name,length(name) as name_len from user;
select name,lower(name) as lower_name ,upper(name) as upoper_name from user;

select name ,concat(lower(name), '9639') as concat_name,now() as time  from user;
select name ,month(date_of_birts) as month from user; -- and ass day and year you can addd 
select name ,datediff(curdate(),date_of_birts) as day from user;
select name,round(salary) as round_salary from user;

select name,if(gender='male' ,'yes' ,'no') as gender_if from user;

select*from user;

update user set name="pratik"  where id=6;
update user set email="pratik@1234gmail.com"where id=6;

set  autocommit=0; -- 0 means auto commit of thai jai ne 1 rakho to on reeeee
commit;
create table address(id int auto_increment primary key, 
user_id int,street varchar(250),city varchar(200),pincode varchar(10),constraint fk_user foreign key(user_id) references user(id) on delete cascade);

delete from user where id=6;
rollback;
select*from address;
select*from user;
select user.name,address.city from user inner join address on user.id = address.user_id ;
select user.name,address.city from user left join address on user.id = address.user_id ;
select user.name,address.city from user right join address on user.id = address.user_id ;

create table admin(id int  primary key,name varchar(100),email varchar(100),gender enum('male','female','other'),date_of_birth date,salary int);
alter table user modify column id int auto_increment ;
insert into admin(id,name,email,gender,date_of_birth,salary) values(1,'jay','jaysoni24122006@gmail.com','male','2006-12-24',50000);
insert into admin(id,name,email,gender,date_of_birth,salary) values(2,'krina','krina24122006@gmail.com','female','2007-04-21',60000);
insert into admin(id,name,email,gender,date_of_birth,salary) values(3,'bhavesh','bhavesh24122006@gmail.com','male','2007-12-15',40000);
select*from admin;
alter table admin modify date_of_birth date after email;
select*from user;
select*from admin;


-- union and union all 
select name from user
union 
select name from admin;

select name from user union all select name from admin;

select name, email,'user' as role from user
 union 
 select name,email, 'admin' as role from admin;
 
create view rich_user as select *from user where salary>100000;--  jo varaghadiye query na lakhvi hoi to aano use kervo view no 
select*from rich_user;


update user set salary=20000 where id=6;

show indexes from user;
drop index idx_gender on user; -- index ni jarur fast select insert update operation mate usee karai 

create index idx_gender on user(gender);

-- now subquery
select avg(salary)from user;
select *from user where salary>(select avg(salary) from user);

-- now group by
select gender ,avg(salary) as 'avg salary 'from user group by gender; 

-- and having
select gender ,avg(salary) as 'avg salary' from user group by gender
 having avg(salary)>75000;

-- rollup 
select gender,avg(salary) from user group by gender with rollup having avg(salary)>75000; -- ano mean avg nu bhi avg atale rollup

-- wildcard operator
select*from user where name like 'j%';
select*from user where name like '_a%';

-- offset lakhta 
select*from user;
select*from user limit 2 offset 3; -- offsset atale atali raw pachi ni raw limit vise print thai 

-- distinct keyword 
select distinct gender from user;

-- truncate table user m karia to badhi raw khali thai jai

 

 










































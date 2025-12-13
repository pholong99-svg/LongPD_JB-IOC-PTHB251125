create schema Students;
create table student(
    id serial primary key ,
    name varchar(50),
    age int,
    major varchar(50),
    gpa DECIMAL(3,2)
);
insert into student(name, age, major, gpa) values
       ('An',20,'CNTT',3.5),
       ('Bình',21,'Toán',3.2),
       ('Cường',22,'CNTT',3.8),
       ('Dương',20,'Vật lý',3.0),
       ('Em',21,'CNTT',2.9);
insert into student(name, age, major, gpa) values
       ('Hùng', '23','Hoá học','3.4');
UPDATE student set gpa = 3.6 where name = 'Bình';
DELETE from student where gpa = 3.0;
select name, major from student order by gpa desc ;
select distinct name from student where major='CNTT';
select name, gpa from student where gpa between 3.0 and 3.6;
select name from student where name like 'C%';
select id, name,age,major,gpa from student order by id limit 3;
select id,name,age,major,gpa from student order by id limit 3 offset 1;
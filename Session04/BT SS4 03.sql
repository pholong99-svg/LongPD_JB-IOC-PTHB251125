create schema students;
create table students(
    id serial primary key ,
    full_name varchar(50),
    gender varchar(50),
    birth_year int,
    major varchar(50),
    gpa decimal(10,1)
);
insert into  students(full_name, gender, birth_year, major, gpa)VALUES
      ('Nguyễn Văn A','Nam','2002','CNTT',3.6),
      ('Trần Thị Bích Ngọc','Nữ','2001','Kinh tế',3.2),
      ('Lê Quốc Cường','Nam','2003','CNTT',2.7),
      ('Phạm Minh Anh','Nữ','2000','Luật',3.9),
      ('Nguyễn Văn A','Nam','2002','CNTT',3.6),
      ('Lưu Đức Tài','2004','2004','Cơ khí',null),
      ('Võ Thị Thu Hằng','Nữ','2001','CNTT',3.0);

insert into  students(full_name, gender, birth_year, major, gpa)VALUES
    ('Phan Hoàng Nam','Nam','2003','CNTT',3.8);
update students set gpa = 3.4 where full_name = 'Lê Quốc Cường';
delete from students where gpa is null ;
select full_name,gender,birth_year,major,gpa from students
where gpa >= 3.0 and major='CNTT' limit 3;
select distinct major from students;
select full_name,gender,birth_year,major,gpa from students
where major='CNTT' order by gpa desc , full_name asc;
select full_name,gender,birth_year,major,gpa from students
where full_name ilike 'Nguyễn%';
select full_name,gender,birth_year,major,gpa from students
where birth_year between 2001 and 2004;
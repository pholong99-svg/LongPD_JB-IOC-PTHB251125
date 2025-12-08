create schema university;
set search_path to university;
create table Students
(
    student_id serial primary key,
    first_name varchar(15) not null,
    last_name  varchar(15) not null,
    birth_date date        not null,
    email      varchar(50) not null unique
);

create table Courses
(
    course_id   serial primary key,
    courses_name varchar(100) not null,
    credits      varchar(50)
);

create table Enrrollments
(
    enrollment_id BIGSERIAL PRIMARY KEY,
    student_id    BIGINT NOT NULL REFERENCES Students (student_id),
    course_id     BIGINT NOT NULL REFERENCES Courses (course_id),
    enroll_date   DATE
);

SELECT datname FROM pg_database;

SELECT schema_name FROM information_schema.schemata;

-- xem cấu trúc bảng Student
SELECT
    column_name,data_type,is_nullable,column_default
FROM information_schema.columns
WHERE table_schema = 'university'
  AND table_name = 'students'
ORDER BY ordinal_position;
-- Xem cấu trúc bảng Courses
SELECT
    column_name,data_type,is_nullable,column_default
FROM information_schema.columns
WHERE table_schema = 'university'
  AND table_name = 'courses'
ORDER BY ordinal_position;
--Xem cấu trúc bảng Enrollments
SELECT
    column_name,data_type,is_nullable,column_default
FROM information_schema.columns
WHERE table_schema = 'university'
  AND table_name = 'enrollments'
ORDER BY ordinal_position;
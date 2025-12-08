
create schema library;

create table Books(
    book_id serial primary key ,
    title varchar(100) not null unique ,
    author varchar(50) not null,
    published_year int,
    price NUMERIC(10,2)
    );

SELECT datname FROM pg_database;

SELECT  schema_name FROM information_schema.schemata;

SELECT
    column_name,data_type,is_nullable,column_default
FROM information_schema.columns
WHERE table_schema = 'library'
  AND table_name = 'Books'
ORDER BY ordinal_position;

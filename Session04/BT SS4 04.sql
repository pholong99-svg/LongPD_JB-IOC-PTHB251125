create schema QLSP;
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INT NOT NULL,        -- giá (VND)
    stock INT NULL,            -- có thể NULL
    manufacturer VARCHAR(50) NOT NULL
);

INSERT INTO products (id, name, category, price, stock, manufacturer) VALUES
          (1, 'Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
          (2, 'Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
          (3, 'Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
          (4, 'Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
          (5, 'iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
          (6, 'Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
          (7, 'Tai nghe AirPods 3', 'Phụ kiện', 4500000, NULL, 'Apple');

INSERT INTO products (id, name, category, price, stock, manufacturer) VALUES
    (8, 'Chuột không dây Logitech M170', 'Phụ kiện', 300000, 20, 'Logitech');

update products SET price = price*1.1 where manufacturer = 'Apple';

delete from products where stock=0;

select name, category, price, stock, manufacturer from products
where price between 1000000 AND 30000000;

select name, category, price, stock, manufacturer from products
where stock is null;

select distinct manufacturer from products;

select name, category, price, stock, manufacturer from products
order by price desc , name asc;

select name, category, price, stock, manufacturer from products
where name ilike '%laptop%';
select name,category,price,stock,manufacturer from products
order by id desc limit 2 ;
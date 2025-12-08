CREATE DATABASE SalesDB;
CREATE SCHEMA Sales;

CREATE TABLE Customers(
    customer_id SERIAL PRIMARY KEY,
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    email       VARCHAR(100) NOT NULL UNIQUE,
    phone       VARCHAR(20)
);

CREATE TABLE Products(
    product_id     SERIAL PRIMARY KEY,
    product_name   VARCHAR(100)   NOT NULL,
    price          NUMERIC(10, 2) NOT NULL,
    stock_quantity INT            NOT NULL
);

CREATE TABLE Orders(
    order_id    SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers (customer_id),
    order_date  DATE NOT NULL
);

CREATE TABLE OrderItems(
    order_item_id SERIAL PRIMARY KEY,
    order_id      INT REFERENCES Orders (order_id),
    product_id    INT REFERENCES Products (product_id),
    quantity      INT NOT NULL CHECK (quantity >= 1)
);
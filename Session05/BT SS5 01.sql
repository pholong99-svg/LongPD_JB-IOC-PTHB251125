create schema ss501;

CREATE TABLE products (
                          product_id INT PRIMARY KEY,
                          product_name VARCHAR(100) NOT NULL,
                          category VARCHAR(50) NOT NULL
);
CREATE TABLE orders (
                        order_id INT PRIMARY KEY,
                        product_id INT NOT NULL,
                        quantity INT NOT NULL,
                        total_price INT NOT NULL,
                        FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO products (product_id, product_name, category) VALUES
                                              (1, 'Laptop Dell', 'Electronics'),
                                              (2, 'IPhone 15', 'Electronics'),
                                              (3, 'Bàn học gỗ', 'Furniture'),
                                              (4, 'Ghế xoay', 'Furniture');

INSERT INTO orders (order_id, product_id, quantity, total_price) VALUES
                                              (101, 1, 2, 2200),
                                              (102, 2, 3, 3300),
                                              (103, 3, 5, 2500),
                                              (104, 4, 4, 1600),
                                              (105, 1, 1, 1100);
-- tổng doanh thu và số lượng hàng bán được
select p.category, sum(o.total_price) as total_sales,sum(o.quantity) as total_quantity
from  orders o join products p on p.product_id = o.product_id group by p.category;
--Chỉ hiển thị những nhóm có tổng doanh thu lớn hơn 2000
select p.category, sum(o.total_price) as total_sales,sum(o.quantity) as total_quantity
from  orders o join products p on p.product_id = o.product_id group by p.category having sum(o.total_price)>2000;
--Sắp xếp kết quả theo tổng doanh thu giảm dần
select p.category, sum(o.total_price) as total_sales,sum(o.quantity) as total_quantity
from  orders o join products p on p.product_id = o.product_id group by p.category order by sum(o.total_price) desc ;
--Chỉ hiển thị những nhóm có tổng doanh thu lớn hơn 2000 không theo danh mục nhóm
select p.product_name, sum(o.total_price) as total_sales,sum(o.quantity) as total_quantity
from  orders o join products p on p.product_id = o.product_id group by o.product_id,p.product_name having sum(o.total_price)>2000;
--Sắp xếp kết quả theo tổng doanh thu giảm dần theo product name
select p.product_name, sum(o.total_price) as total_sales,sum(o.quantity) as total_quantity
from  orders o join products p on p.product_id = o.product_id group by o.product_id,p.product_name order by sum(o.total_price) desc ;
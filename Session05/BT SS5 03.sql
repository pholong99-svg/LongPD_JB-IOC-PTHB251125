create schema ss503;

CREATE TABLE customers (
                customer_id INT PRIMARY KEY,
                customer_name VARCHAR(100) NOT NULL,
                city VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
                order_id INT PRIMARY KEY,
                customer_id INT NOT NULL,
                order_date DATE NOT NULL,
                total_price INT NOT NULL,
                FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
                item_id INT PRIMARY KEY,
                order_id INT NOT NULL,
                product_id INT NOT NULL,
                quantity INT NOT NULL,
                price INT NOT NULL,
                FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
INSERT INTO customers (customer_id, customer_name, city) VALUES
                                                             (1, 'Nguyễn Văn A', 'Hà Nội'),
                                                             (2, 'Trần Thị B', 'Đà Nẵng'),
                                                             (3, 'Lê Văn C', 'Hồ Chí Minh'),
                                                             (4, 'Phạm Thị D', 'Hà Nội');

INSERT INTO orders (order_id, customer_id, order_date, total_price) VALUES
                                                                        (101, 1, '2024-12-20', 3000),
                                                                        (102, 2, '2025-01-05', 1500),
                                                                        (103, 1, '2025-02-10', 2500),
                                                                        (104, 3, '2025-02-15', 4000),
                                                                        (105, 4, '2025-03-01', 800);
INSERT INTO order_items (item_id, order_id, product_id, quantity, price) VALUES
                                                                             (1, 101, 1, 2, 1500),
                                                                             (2, 102, 2, 1, 1500),
                                                                             (3, 103, 3, 5, 500),
                                                                             (4, 104, 2, 4, 1000);

select c.customer_name, sum(o.total_price) as total_revenue, sum(o.order_id) as order_count
from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id,c.customer_name having sum(o.total_price)>2000;
--
seLect  sum(total_price) as total_rev
from customers c left join orders o on c.customer_id = o.customer_id group by c.customer_id;
select avg(total_rev) from (seLect  sum(total_price) as total_rev
                            from customers c left join orders o on c.customer_id = o.customer_id group by c.customer_id);


select
    c.customer_name,
    SUM(o.total_price) AS total_revenue
from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id,customer_name
having sum(total_price) > (select avg(total_rev)
                           from (seLect  sum(total_price) as total_rev
                                 from customers c left join orders o on c.customer_id = o.customer_id group by c.customer_id)) ;


select c.city , sum(total_price) as total
from customers c join orders o on c.customer_id = o.customer_id group by city having sum(total_price)
=(select sum(total_price) as total_rev
from customers c join orders o on c.customer_id = o.customer_id group by c.city order by sum(o.total_price) desc limit 1);

select c.customer_name,c.city , sum(oi.quantity) as total_quantity,
sum(o.total_price) as total_price from customers c left join orders o on c.customer_id = o.customer_id
left join order_items oi on o.order_id = oi.order_id group by c.customer_id, c.customer_name;

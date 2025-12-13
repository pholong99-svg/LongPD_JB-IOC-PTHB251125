create schema ss502;
--
select p.product_name, sum(o.total_price) as total_revenue from orders o join products p on o.product_id = p.product_id
group by p.product_id, p.product_name
having sum(o.total_price)=(select max(total_rev) from (select sum(o2.total_price) as total_rev from orders o2 group by o2.product_id) as t);

--
select p.category, sum(o.total_price) as total_sales,sum(o.quantity) as total_quantity
from  orders o join products p on p.product_id = o.product_id group by p.category order by sum(o.total_price) desc ;

--
select p.category from orders o join products p on o.product_id = p.product_id
group by p.category,o.product_id
having sum(o.quantity)=(select max(total_qty) from (select sum(o2.quantity) as total_qty from orders o2 group by o2.product_id) as t)
intersect
select p.category
from  orders o join products p on p.product_id = o.product_id group by p.category having sum(o.total_price)>3000;
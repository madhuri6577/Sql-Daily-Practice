-- 🟢 Level 1 — Basic Subqueries
-- Q1
-- Find all order items whose price is greater than the average price of all order items.
-- Display:
-- order_id
-- product_id
-- price
select order_id , product_id , price from order_items
where price > 
(
select round(avg(price),1) as avg_price from order_items
) ;


-- Q2
-- Find all products whose product_weight_g is greater than the average product weight.
-- Display:
-- product_id
-- product_category_name
-- product_weight_g
select product_id , product_weight_g , produtc_category_name from products
where product_weight_g >
(
select round(avg(product_weight_g),1) from products
);

-- Q3
-- Find all orders whose payment_value is greater than the average payment value.
-- Display:
-- order_id
-- payment_value
-- Use order_payments.
select order_id , payment_value from order_payments
where payment_value >
(
select round(avg(payment_value),1) from order_payments
);

-- Q4
-- Find all customers who are from the same state as the customer with customer_id = 'some_customer_id'.
-- Use a subquery to find the state of that customer.
-- Replace 'some_customer_id' with an actual customer_id from your database.
select customer_id , customer_state , customer_city from customers
where customer_state = 
(
select customer_state from customers
where customer_id = '06b8999e2fba1a1fbc88172c00ba8bc7'
);

-- Q5
-- Find products whose product_weight_g is greater than the weight of the heaviest product in the bed_bath_table category.
-- Display:
-- product_id
-- product_category_name
-- product_weight_g
select product_id , product_category_name , product_weight_g from products
where product_weight_g > 
(
select max(product_weight_g) from products 
where product_category_name = 'bed_bath_table'
);

-- 🟡 Level 2 — Subquery + Aggregation
-- Q6
-- Find sellers whose total sales are greater than the average seller total sales.
-- Use:
-- order_items
-- Calculate seller sales using:
-- SUM(price)
-- Display:
-- seller_id
-- total_sales
select seller_id , sum(price) as total_sales from order_items
group by seller_id
having sum(price) >
(
select avg(total_sales)
from(
select seller_id , sum(price) as total_sales from order_items
group by seller_id 
) as seller_sales
);

-- Q7
-- Find customers whose total spending is greater than the average customer spending.
-- Use:
-- customers → orders → order_items
-- Display:
-- customer_id
-- total_spending
select c.customer_id , sum(oi.price) as total_spendings
from customers c
join orders o
on c.customer_id = o.customer_id
join order_items oi
on o.order_id = oi.order_id
group by c.customer_id 
having sum(oi.price) >
(
select avg(customer_spendings) 
from (
select o2.customer_id , sum(oi2.price) as customer_spendings
from orders o2
join order_items oi2
on o2.order_id = oi2.order_id
group by o2.customer_id
) as customer_totals
)
order by total_spendings desc;

-- Q8
-- Find product categories whose total sales are greater than the average category sales.
-- Use:
-- products → order_items
-- Display:
-- product_category_name
-- total_sales
select p.product_category_name , sum(oi.price) as total_sales
from products p
join order_items oi
on p.product_id = oi.product_id
group by p.product_category_name
having sum(oi.price) > 
(
select avg(category_sales)
from
(
select p2.product_category_name, SUM(oi2.price) AS category_sales
from products p2
join order_items oi2
on p2.product_id = oi2.product_id
group by p2.product_category_name
) AS category_totals
)
ORDER BY total_sales DESC;
-- Q9
-- Find customer states whose number of orders is greater than the average number of orders per state.
-- Use:
-- customers → orders
-- Display:
-- customer_state
-- order_count
select c.customer_state , count(o.order_id) as order_count
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_state 
having count(o.order_id) > 
(
select avg(state_order_count)
from (
select c2.customer_state , count(o2.order_id) as state_order_count
from customers c2
join orders o2
on c2.customer_id = o2.customer_id
group by c2.customer_state 
) as state_count
)
order by order_count desc;

-- Q10
-- Find sellers whose number of order items is greater than the average number of order items per seller.
-- Display:
-- seller_id
-- items_sold
-- Remember: there is no quantity column. Use COUNT(*).
select s.seller_id , count(*) as items_sold
from sellers s
join order_items oi
on s.seller_id = oi.seller_id
group by s.seller_id
having count(*) > 
(
select avg(seller_order_items) 
from (
select s2.seller_id , count(*) as seller_order_items
from sellers s2
join order_items oi2
on s2.seller_id = oi2.seller_id
group by s2.seller_id

) as seller_counts
);

-- 🟠 Level 3 — IN / NOT IN
-- Q11
-- Find all products that have appeared in order_items.
-- Use a subquery with IN.
-- Display:
-- product_id
-- product_category_name
select product_id , product_category_name  from products
where product_id in 
(
select product_id from order_items
);

-- Q12
-- Find all products that have never appeared in order_items.
-- Use NOT IN.
-- Display:
-- product_id
-- product_category_name
select product_id , product_category_name  from products
where product_id not in 
(
select product_id from order_items
);


-- Q13
-- Find all customers who have placed at least one order.
-- Use IN.
-- Display:
-- customer_id
-- customer_city
-- customer_state
select customer_id , customer_city, customer_state from customers
where customer_id in 
(
select customer_id from orders
);

-- Q14
-- Find all sellers who have sold at least one item.
-- Use IN.
-- Display:
-- seller_id
-- seller_city
-- seller_state
select seller_id , seller_city , seller_state from sellers
where seller_id in
(
select seller_id from order_items
);

-- 🔥 Level 4 — EXISTS
-- Q15
-- Find all customers who have at least one order.
-- Use:
-- EXISTS
-- Display:
-- customer_id
-- customer_city
-- customer_state
select c.customer_id , c.customer_state , c.customer_city 
from customers c
where exists (
select 1 from orders o
where c.customer_id = o.customer_id
);

-- Q16
-- Find all customers who do not have any orders.
-- Use:
-- NOT EXISTS
-- Display:
-- customer_id
-- customer_city
-- customer_state
select c.customer_id , c.customer_state , c.customer_city 
from customers c
where not exists (
select 1 from orders o
where c.customer_id = o.customer_id
);


-- Q17
-- Find all sellers who have at least one order item with a price greater than 500.
-- Use EXISTS.
-- Display:
-- seller_id
-- seller_city
-- seller_state
select s.seller_id , s.seller_city , s.seller_state
from sellers s
where exists (
select 1 
from order_items oi
where s.seller_id = oi.seller_id 
and 
price > 500
);

-- 🔥🔥 Level 5 — Advanced Subqueries
-- Q18
-- Find the most expensive order item(s).
-- Display:
-- order_id
-- product_id
-- price
-- Use a subquery with MAX(price).

select order_id , product_id , price from order_items
where price = (
select max(price) from order_items 
);

-- Q19
-- Find all products whose weight is greater than the average weight of products in their own category.
-- This is a correlated subquery.
-- Display:
-- product_id
-- product_category_name
-- product_weight_g
-- ⭐ This is an important interview-level question.
select p.product_id , p.product_category_name , p.product_weight_g 
from products p
where p.product_weight_g > (
select avg(p2.product_weight_g) 
from products p2
where p.product_category_name = p2.product_category_name
);

-- Q20 🔥 Challenge
-- Find customers whose total spending is greater than the average total spending of all customers.
-- Use:
-- customers → orders → order_items
-- Display:
-- customer_id
-- total_spending
-- Sort from highest to lowest.
select c.customer_id , sum(oi.price) as total_spendings
from customers c
join orders o
on c.customer_id = o.customer_id
join order_items oi
on o.order_id = oi.order_id
group by c.customer_id 
having sum(oi.price) >
(
select avg(customer_spendings) 
from (
select o2.customer_id , sum(oi2.price) as customer_spendings
from orders o2
join order_items oi2
on o2.order_id = oi2.order_id
group by o2.customer_id
) as customer_totals
)
order by total_spendings desc;

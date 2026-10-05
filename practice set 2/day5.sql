-- Part 1: Basic Subqueries
-- Q1. Products above average price
-- Find all products whose price is greater than the average price of all products.
select * from products
where price > 
(
select round(avg(price),1) as average_price from products
);

-- Q2. Customers older than average
-- Display customers whose age is greater than the average age of all customers.
select * from customers
where age > 
(
select avg(age) from customers
);

-- Q3. Most expensive product
-- Display the product name and price of the product or products with the highest price.
-- Use a subquery, not ORDER BY ... LIMIT 1.
select product_name , price from products
where price = 
(
select max(price) from products
);

-- Q4. Orders for Electronics
-- Display all orders containing products from the Electronics category.
-- Use a subquery to identify the relevant product IDs.
select * from orders 
where product_id in
(
select product_id from products
where category = 'Electronics'
);

-- Part 2: IN, NOT IN, and EXISTS
-- Q5. Customers who placed orders
-- Find customers who have placed at least one order. Use IN with a subquery.
select * from customers
where customer_id in
(
select customer_id from orders
);

-- Q6. Customers without orders
-- Find customers who have never placed an order. Use NOT IN with a subquery.
select * from customers
where customer_id not in
(
select customer_id from orders
);


-- Q7. Products never ordered
-- Display products whose IDs do not appear in the orders table. Use NOT IN with a subquery.
select * from products
where product_id not in 
(
select product_id from orders
);

-- Q8. Customers with delivered orders
-- Find customers who have at least one order with status Delivered. Use EXISTS.
select * from customers c
where  exists 
(
select 1 from orders o
where o.customer_id = c.customer_id
and status = 'Delivered'
);

-- Part 3: Advanced Subqueries
-- Q9. Products priced above their category average
-- Display product_name, category, and price for products whose price is greater than the average price of products in the same category.
-- Hint: Use a correlated subquery.
select p.product_name , p.category , p.price from products p
where p.price > 
(
select round(avg(p2.price),1) from products p2
where p2.category = p.category
);

-- Q10. Customers with above-average spending
-- Display each customer's name and total spending, including only customers whose total spending is greater than the average spending per customer among customers who have placed orders.
-- Calculate each customer's spending as SUM(quantity * price).
-- Hint: You can use a subquery with aggregation and joins.
select c.customer_name,sum(o.quantity*p.price) as total_spending
from customers c
join orders o on c.customer_id=o.customer_id
join products p on o.product_id=p.product_id
group by c.customer_id,c.customer_name
having sum(o.quantity*p.price)>(
select avg(customer_total)
from(
select o2.customer_id,sum(o2.quantity*p2.price) as customer_total
from orders o2
join products p2 on o2.product_id=p2.product_id
group by o2.customer_id
) as customer_spending
);
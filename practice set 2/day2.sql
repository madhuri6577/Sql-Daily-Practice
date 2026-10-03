-- Q1 — COUNT
-- Find the total number of customers.
select count(*) from customers;

-- Q2 — COUNT
-- Find the total number of products.
select count(*) from products;

-- Q3 — COUNT
-- Find the total number of orders.
select count(*) from orders;

-- Q4 — COUNT DISTINCT
-- Find the number of unique cities in the customers table.
select count(distinct(city)) from customers;

-- Q5 — MAX
-- Find the highest product price.
select max(price) as highest_price from products;

-- Q6 — MIN
-- Find the lowest product price.
select min(price) as lowest_price from products;

-- Q7 — AVG
-- Find the average age of customers.
select avg(age) as average_age from customers;

-- Q8 — SUM
-- Find the total quantity of products ordered.
select sum(quantity) as total_quantity from orders;

-- Q9 — Alias
-- Find the average product price and display the result with the column name:
-- average_price
select round(avg(price),1) as average_price from products;


-- Q10 — Calculation
-- Display:
-- order_id
-- product_id
-- quantity
-- quantity * 2 as double_quantity
select order_id , product_id , quantity , quantity*2 as double_quantity from orders;

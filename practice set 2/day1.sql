-- 🟢 Day 1 — 10 SQL Questions
-- Q1 — SELECT
-- Display all columns from the customers table.
select * from customers;

-- Q2 — Specific columns
-- Display only:
-- customer_name
-- city
-- age
-- from customers.
select customer_name , city , age from customers;

-- Q3 — WHERE
-- Find all customers who live in Pune.
select * from customers 
where city = 'Pune';

-- Q4 — Comparison
-- Find customers whose age is greater than 28.
select * from customers 
where age > 28;

-- Q5 — AND
-- Find customers who:
-- live in Maharashtra
-- and are older than 25
select * from customers
where state = 'Maharashtra' and age > 25;

-- Q6 — OR
-- Find customers who live in either:
-- Pune
-- or Mumbai
select * from customers
where city = 'Pune' or city = 'Mumbai';

-- Q7 — DISTINCT
-- Display all unique cities from the customers table.
select distinct(city) from customers;

-- Q8 — ORDER BY
-- Display all customers sorted by age from youngest to oldest.
select * from customers
order by age ;

-- Q9 — DESC
-- Display all products sorted by price from highest to lowest.
select * from products
order by price desc;

-- Q10 — LIMIT
-- Display the 5 most expensive products.
select * from products
order by price desc
limit 5;

-- Q11 — IN
-- Find all customers who live in Pune, Mumbai, or Delhi.
select * from customers
where city in ('Pune','Mumbai','Delhi');

-- Q12 — NOT IN
-- Find all customers who do not live in Pune, Mumbai, or Delhi.
select * from customers
where city NOT in ('Pune','Mumbai','Delhi');


-- Q13 — BETWEEN
-- Find customers whose age is between 25 and 30, including 25 and 30.
select * from customers
where age  between 25 and 30;

-- Q14 — NOT BETWEEN
-- Find customers whose age is not between 25 and 30.
select * from customers
where age  not between 25 and 30;


-- Q15 — LIKE
-- Find customers whose name starts with A.
select * from customers
where customer_name like 'A%';

-- Q16 — LIKE
-- Find customers whose name ends with a.
select * from customers
where customer_name like '%a';


-- Q17 — LIKE
-- Find customers whose name contains ha anywhere in the name.
select * from customers
where customer_name like '%ha%';

-- Q18 — Multiple conditions
-- Find products where:
-- category is Electronics
-- and price is greater than 2000
select * from products 
where category = 'Electronics' and price > 2000;

-- Q19 — Multiple conditions + sorting
-- Find products whose price is less than 5000 and display them from highest price to lowest price.
select * from products
where price < 5000
order by price desc;

-- Q20 — IN + ORDER BY
-- Find orders whose status is either Delivered or Shipped, and display them with the latest order first.
select * from orders
where status in ('Delivered','Shipped') 
order by order_date desc;
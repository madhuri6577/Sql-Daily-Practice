-- SQL Practice Questions (1–20)
-- Topic 1: select and from
-- 1. Display all columns from the customers table.
select * from customers;

-- 2. Display only the customer name, city, and state of all customers.
select customer_name , city, state from customers;

-- 3. Display the product name, category, and price from the products table.
select product_name , category , price from products;

-- Topic 2: distinct
-- 4. Display all unique cities from the customers table.
select distinct city from customers;

-- 5. Display all unique product categories from the products table.
select distinct category from products;

-- 6. Display all unique order statuses from the orders table.
select distinct status from orders;

-- Topic 3: where
-- 7. Display all customers who belong to Pune.
select * from customers
where city = 'Pune';

-- 8. Display all products whose price is greater than ₹1,000.
select * from products
where price > 1000;

-- Topic 4: Comparison Operators
-- 9. Display customers whose age is greater than 30.
select * from customers
where age > 30;

-- 10. Display products whose price is less than or equal to ₹999.
select * from products
where price <= 999;

-- 11. Display all orders placed before 1 January 2025.
select * from orders
where order_date < '2025-01-01';

-- Topic 5: Logical Operators (and, or, not)
-- 12. Display customers who belong to Pune and are younger than 30.
select * from customers
where city = 'Pune' and age < 30;

-- 13. Display products that belong to the Electronics category or have a price greater than ₹2,000.
select * from products 
where category = 'Electronics' or price > 2000;

-- 14. Display orders that are not cancelled.
select * from orders
where status != 'cancelled';

-- 15. Display customers who belong to Mumbai and are older than 25, or who belong to Pune.
select * from customers 
where (city = 'Mumbai' and age > 25) or city = 'Pune';

-- Topic 6: in, between, like, ilike, is null, is not null
-- 16. Display customers who belong to Pune, Mumbai, or Delhi using in.
select * from customers
where city in ('Pune','Mumbai','Delhi');

-- 17. Display products whose prices are between ₹500 and ₹1,500.
select * from products
where price between 500 and 1500;

-- 18. Display customers whose names start with the letter A using like.
select * from customers
where customer_name like 'A%';

-- 19. Display customers whose names contain sh using ilike.
select * from customers
where customer_name ilike '%sh%';

-- 20. From raw_orders, display rows where customer_id is missing. Then display rows where status is not missing.
select * from raw_orders
where customer_id is null;

select * from raw_orders
where status is not null;

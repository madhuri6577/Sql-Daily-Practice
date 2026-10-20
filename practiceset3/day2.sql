-- 1. Display all rows from raw_orders where order_date_text is missing.
select * from raw_orders
where order_date_text is null;

-- 2. Display all rows from raw_orders where customer_id is not missing.
select * from raw_orders
where customer_id is not null;

-- 3. Display all rows from raw_orders where status is missing.
select * from raw_orders
where status is null;

-- 4. Display all rows from raw_orders where notes is not missing.
select * from raw_orders
where notes is not null;

-- 5. Display all customers whose age is missing.
select * from customers
where age is null;

-- 6. Display all customers sorted by customer_name in ascending order.
select * from customers
order by customer_name ;

-- 7. Display all products sorted by price from highest to lowest.
select * from products
order by price desc;

-- 8. Display all employees sorted by salary in ascending order.
select * from employees
order by salary ;

-- 9. Display all orders sorted by order_date from newest to oldest.
select * from orders
order by order_date desc;

-- 10.Display all customers sorted first by city in ascending order and then by age in descending order.
select * from customers
order by city ,age desc;

-- 11. Display the first 5 customers.
select * from customers
limit 5;

-- 12. Display the 5 most expensive products.
select * from products
order by price desc
limit 5;

-- 13. Display the 3 employees with the highest salaries.
select * from employees
order by salary desc
limit 3;

-- 14. Display 5 products after skipping the first 5 products, sorted by price in ascending order.
select * from products
order by price
limit 5  offset 5;

-- 15. Display the 3 most recent orders after skipping the 2 most recent orders.
select * from orders
order by order_date desc
limit 3 offset 2;

-- 16. Display customer_name as name and city as customer_city.
select customer_name as name , city as customer_city
from customers;

-- 17. Display product_name as product and price as product_price.
select product_name as product , price as product_price 
from products;

-- 18. Display employee_name as name and salary as monthly_salary.
select employee_name as name , salary as monthly_salary
from employees;

-- 19. Display order_id as order_number and order_date as date_of_order.
select order_id as order_number , order_date as date_of_order
from orders;

-- 20. Display quantity as units_sold and unit_price as price_per_unit from order_items.
select quantity as units_sold , unit_price as price_per_unit
from order_items;
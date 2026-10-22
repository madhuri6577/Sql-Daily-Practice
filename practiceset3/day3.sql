-- 1. Count the total number of customers in the customers table.
select count(*) from customers;

-- 2. Calculate the total stock across all products.
select sum(stock) from products;

-- 3. Find the average price of all products.
select avg(price) from products;

-- 4. Find the minimum and maximum salary in the employees table.
select min(salary) , max(salary) from employees;

-- 5. Calculate the total revenue from order_items using quantity * unit_price.
select sum(quantity*unit_price) from order_items;

-- 6. Count the number of customers in each city.
select count(*) ,city from customers
group by city;

-- 7. Calculate the average price for each product category.
select avg(price) , category from products
group by category;

-- 8. Find the total salary paid in each department.
select sum(salary) , department from employees
group by department;

-- 9. Count the number of orders for each status.
select count(order_id) , status from orders
group by status;

-- 10. Calculate the total quantity sold for each product using order_items.
select sum(quantity) , product_id from order_items
group by product_id;

-- 11. Display cities that have more than 3 customers.
select count(*) , city from customers
group by city
having count(*)>3;

-- 12. Display product categories whose average price is greater than ₹1,000.
select avg(price),category from products
group by category
having avg(price)  > 1000;

-- 13. Display departments whose average employee salary is greater than ₹50,000.
select avg(salary) , department from employees
group by department
having avg(salary) > 50000;

-- 14. Display order statuses that have more than 5 orders.
select count(order_id) , status from orders
group by status
having count(order_id) > 5;

-- 15. Count customers for each combination of city and segment.
select count(customer_name) , city , segment from customers
group by city ,segment;

-- 16. Calculate the number of orders for each combination of status and sales_channel.
select count(*) , status , sales_channel from orders
group by  status , sales_channel;

-- 17. Calculate the total quantity sold for each combination of product_id and order_id.
select sum(quantity) , product_id ,order_id from order_items
group by   product_id ,order_id;

-- 18. Find the average salary for each combination of department and city.
select avg(salary) , department , city from employees
group by department,city;

-- 19. Count customers for each combination of state and city.
select count(*) , state , city from customers
group by state,city;

-- 20. Calculate the average product price for each combination of category and active.
select avg(price) , category ,active from products
group by category ,active;

-- Part 1: GROUP BY — Questions 1–7
-- Q1. Count customers by city
-- Display each city and the total number of customers living in it.
select count(customer_name) as total_customers , city from customers
group by city;

-- Q2. Count customers by state
-- Display each state and its total number of customers.
select count(customer_name) as total_customers , state from customers
group by state;

-- Q3. Average age by city
-- Find the average customer age for each city.
select avg(age) as average_age , city from customers
group by city;

-- Q4. Products by category
-- Display each product category and the number of products in that category.
select count(*) as total_products , category from products
group by category

-- Q5. Average product price by category
-- Find the average price of products in each category.
select avg(price) as average_price , category from products
group by category;

-- Q6. Total quantity by product
-- Display each product_id and the total quantity ordered for that product.
select sum(quantity) as total_quantity , product_id from orders
group by product_id;

-- Q7. Orders by status
-- Display each order status and the total number of orders with that status.
select count(order_id) as total_orders , status from orders
group by status;

-- Part 2: GROUP BY + HAVING — Questions 8–13
-- Q8. Cities with multiple customers
-- Display cities having more than one customer.
select count(customer_name) as total_customers , city from customers
group by city
having count(customer_name) > 1;

-- Q9. Categories with multiple products
-- Display product categories containing more than two products.
select count(*) as total_products , category from products
group by category
having count(*) > 2;

-- Q10. Products with high total quantity
-- Find product IDs whose total ordered quantity is greater than 2.
select sum(quantity) as total_quantity , product_id from orders
group by product_id
having sum(quantity) > 2;

-- Q11. States with at least three customers
-- Display states having 3 or more customers.
select count(customer_name) as total_customers , state from customers
group by state
having count(customer_name) >= 3;

-- Q12. Order statuses with multiple orders
-- Display statuses that have more than three orders.
select count(order_id) as total_orders , status from orders
group by status
having count(order_id) > 3;

-- Q13. Categories with a high average price
-- Display product categories whose average product price is greater than ₹5,000.
select avg(price) as average_price , category from products
group by category
having avg(price) > 5000;

-- Part 3: CASE WHEN — Questions 14–17
-- Q14. Categorize product prices
-- Display product_name, price, and a new column named price_category:
-- Price greater than ₹10,000 → Expensive
-- Price between ₹1,000 and ₹10,000 inclusive → Moderate
-- Otherwise → Cheap
select product_name , price , 
case 
    when price > 10000 then 'expensive'
	when price <= 10000 and price >= 1000 then 'moderate'
	else 'cheap'
	end as price_category
from products;

-- Q15. Categorize customer ages
-- Display customer_name, age, and an age_category column:
-- Age below 25 → Young
-- Age from 25 to 30 inclusive → Adult
-- Age above 30 → Senior
select customer_name , age , 
case
    when age > 30 then 'senior'
	when age <= 30 and age > 25 then 'adult'
	else 'young'
	end as age_category
from customers;

-- Q16. Categorize order quantities
-- Display order_id, quantity, and a quantity_category column:
-- Quantity = 1 → Single
-- Quantity from 2 to 5 inclusive → Multiple
-- Quantity above 5 → Bulk
select order_id , quantity,
case
    when quantity > 5 then 'bulk'
	when quantity <=5 and quantity >= 2 then 'multiple'
	else 'single'
	end as quantity_category
from orders;

-- Q17. Label order statuses
-- Display order_id, status, and a new column named order_type:
-- Delivered → Completed
-- Cancelled → Cancelled
-- All other statuses → In Progress
select order_id , status ,
case
    when status = 'Delivered' then 'completed'
	when status ='Cancelled' then 'cancelled'
	else 'in progress'
	end as order_type
from orders;

-- Part 4: NULL Handling — Questions 18–20
-- Our current database may not contain any NULL values in these columns. 
-- That's okay; these questions will help you learn the syntax.

-- Q18. Find missing customer cities
-- Find all customers whose city is NULL.
select * from customers
where city is null;

-- Q19. Find products with missing prices
-- Find all products whose price is NULL.
select * from products 
where price is null;

-- Q20. Count missing customer states
-- Count the number of customers whose state is NULL.
select count(*) from customers
where state is null;
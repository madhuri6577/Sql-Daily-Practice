-- olist dataset is used from now onwards
-- SELECT / LIMIT
-- Q1. Display all columns from the customers table.
select * from customers;

-- Q2. Display only customer_id, customer_city, and customer_state from customers.
select customer_id, customer_city, customer_state from customers;

-- Q3. Display the first 10 records from the products table.
select * from products
limit 10;

-- Q4. Display order_id, customer_id, and order_status from the orders table.
select order_id, customer_id,order_status from orders;

-- DISTINCT
-- Q5. Find all unique customer states from the customers table.
select distinct customer_state from customers;

-- Q6. Find all unique order statuses from the orders table.
select distinct order_status from orders;

-- Q7. Find all unique payment types from the order_payments table.
select distinct payment_type from order_payments;

-- WHERE
-- Q8. Find all customers who belong to the state SP.
select * from customers
where customer_state = 'SP';

-- Q9. Find all orders whose status is delivered.
select order_id , order_status from orders
where order_status = 'delivered';

-- Q10. Find all products where product_weight_g is greater than 5,000 grams.
select product_category_name , product_weight_g from products
where  product_weight_g > 5000;

-- Comparison / Logical Operators
-- Q11. Find all order items where the price is greater than 500.
select * from order_items 
where price > 500;

-- Q12. Find all order items where the price is between 100 and 500.
select order_item_id , price from order_items
where price between 100 and 500;

-- Q13. Find all orders where the status is either delivered or shipped.
select * from orders 
where order_status in ('delivered' , 'shipped');

-- Q14. Find all products where product_photos_qty is greater than 5 AND product_weight_g is less than 2,000 grams.
select product_category_name , product_photos_qty,product_weight_g from products
where  product_photos_qty > 5 AND product_weight_g < 2000 ;

-- ORDER BY
-- Q15. Display the 10 most expensive order items based on price.
select order_item_id , price from order_items 
order by price desc
limit 10;

-- Q16. Display the 10 cheapest products by product weight.
select product_category_name , product_weight_g from products
order by product_weight_g 
limit 10;

-- Aggregate Functions
-- Q17. Find the total number of customers.
select count( customer_id) from customers;

-- Q18. Find the total number of orders.
select count( order_id) from orders;

-- Q19. Find the average product price.
select round(avg(price),2) from order_items;

-- Q20. Find the maximum, minimum, and average order-item price from order_items.
select round(avg(price),2) , max(price) , min(price) from order_items;


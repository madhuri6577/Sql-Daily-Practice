-- GROUP BY
-- Q1. Find the number of customers in each state. Display customer_state and customer_count.
select customer_state , count(customer_id) from customers
group by customer_state;

-- Q2. Find the number of orders for each order status.
select order_status , count(order_id) from orders
group by order_status;

-- Q3. Find the number of products in each product category. Ignore NULL category names.
select product_category_name , count(product_id) from products
group by product_category_name
where product_category_name is not null;

-- Q4. Find the total sales for each product using:
-- Display product_id and total_sales.
select product_id , round(sum(price),1) as total_sales from order_items
group by product_id
order by total_sales desc;

-- Q5. Find the total freight value for each seller.
-- GROUP BY + ORDER BY
select sum(freight_value) , seller_id from order_items
group by seller_id
order by sum(freight_value) desc;

-- Q6. Find the top 10 customers by total spending.
-- Use:
-- Display customer_id and total_spending.
select sum(oi.price) , o.customer_id
from order_items oi
join orders o
on oi.order_id = o.order_id
group by o.customer_id
order by sum(oi.price) desc
limit 10;

-- Q7. Find the top 10 products by number of order items sold
-- Display:
-- product_id
select product_id , count(*) as items_sold from order_items 
group by product_id 
order by items_sold desc
limit 10;

-- Q8. Find the average order value for each payment type using payment_value.
-- Sort from highest average to lowest.
select payment_type , round(avg(payment_value),2) as avg_order_value from order_payments
group by payment_type
order by avg_order_value desc;

-- Q9. Find customers who have placed more than 5 orders.
-- Display:
-- customer_id
-- order_count
select customer_id , count(order_id) as order_count from orders
group by customer_id 
having count(order_id) >5 ;

-- Q10. Find products that have been sold in more than 100 order items.
-- Display:
-- product_id
-- number_of_items
select product_id , count(order_item_id) as number_of_items from order_items
group by product_id
having count(order_item_id) > 100;

-- Q11. Find sellers whose total sales exceed 50,000.
-- Display:
-- seller_id
-- total_sales
select sum(price) as total_sales , seller_id  from order_items
group by seller_id 
having sum(price)>50000;

-- Q12. Find states having more than 5,000 customers.
-- Display:
-- customer_state
-- customer_count
select count(customer_id) , customer_state from customers
group by customer_state
having count(customer_id) > 5000;

-- CASE WHEN ⭐
-- Q13. Categorize order items based on price:
-- < 100 → Low
-- 100–500 → Medium
-- > 500 → High
-- Display order_item_id, price, and price_category.
select order_item_id , price ,
case
   when price > 500 then 'HIGH'
   when price <=500 AND price >= 100 then 'Medium'
   else 'LOW'
   end as price_category
 from order_items;

-- Q14. Categorize orders based on their status:
-- delivered → Completed
-- canceled → Cancelled
-- shipped → In Transit
-- Everything else → Other
-- Display order_id, order_status, and the new category.
select order_id , order_status ,
case
   when order_status = 'delivered' then 'completed'
   when order_status = 'canceled' then 'cancelled'
   when order_status = 'shipped' then 'In Transit'
   else 'other'
   end as new_category
 from orders;

-- Q15. Categorize products based on weight:
-- < 1000g → Light
-- 1000–5000g → Medium
-- > 5000g → Heavy
-- Display the product and its weight category.
select product_category_name , 
case
    when product_weight_g > 5000 then 'Heavy'
    when product_weight_g <= 5000 and  product_weight_g >= 1000 then 'Medium'
	else 'light'
	end as weight_category
from products;

-- More Advanced — Combining Concepts 🔥
-- Q16. Find the average price and total items sold for each product.
-- Display:
-- product_id
-- average_price
-- total_item
-- Sort by total_items descending.
select product_id , round(avg(price),2) as average_product, count(*) as total_items 
from order_items
group by product_id 
order by total_items desc;

-- Q17. Find the 5 product categories with the highest average product weight.
-- Ignore NULL category names.
select product_category_name , round(avg(product_weight_g)) as avg_weight
from products
where product_category_name is not null
group by product_category_name 
order by round(avg(product_weight_g)) desc
limit 5;

-- Q18. Find payment types where:
-- total payment value is greater than 100,000
-- AND number of payments is greater than 1,000
-- Display:
-- payment_type
-- total_payment
-- payment_count
select payment_type , sum(payment_value) , count(*)
from order_payments
group by payment_type
having sum(payment_value) > 100000 and count(*) > 1000;

-- Q19. Find the monthly total sales using order_items.shipping_limit_date.
-- Display:
-- month
-- total_sales
-- Sort chronologically.
select date_trunc('month',shipping_limit_date) as month , round(sum(price)) as total_sales
from order_items 
group by  date_trunc('month',shipping_limit_date) 
order by month;

-- Q20. 🔥 Challenge
-- For each order_status, calculate:
-- total number of orders
-- percentage of all orders represented by that status
-- Display:
-- order_status
-- order_count
-- percentage_of_orders
-- Round the percentage to 2 decimal places.
select order_status , count(*) as order_count,
round(count(*)*100.0/(select count(*) from orders),2) as percentage_of_orders
from orders
group by order_status
order by percentage_of_orders desc;

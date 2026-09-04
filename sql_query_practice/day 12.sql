-- Level 1 — Understand LEFT JOIN
-- Q1. Display all customers along with their order_id.
-- Use LEFT JOIN so that customers with no orders are also included.
select c.customer_id , o.order_id
from customers c
left join orders o
on c.customer_id = o.customer_id;

-- Q2. Display:
-- customer_id
-- customer_city
-- order_id
-- order_status
-- Show all customers, including those who have never placed an order.
select c.customer_id , c.customer_city , o.order_id , o.order_status
from customers c
left join orders o
on c.customer_id = o.customer_id;

-- Q3. Display all products along with their order-item records.
-- Show:
-- product_id
-- product_category_name
-- order_id
-- price
-- Use LEFT JOIN.
select p.product_id , p.product_category_name , oi.order_id , oi.price
from products p
left join order_items oi
on p.product_id = oi.product_id;

-- Q4. Display all sellers along with their order items.
-- Show:
-- seller_id
-- seller_city
-- order_id
-- price
-- Include sellers who have no matching order-item records.
select s.seller_id , s.seller_city , oi.order_id , oi.price
from sellers s
left join order_items oi
on s.seller_id = oi.seller_id;

-- Q5. Display all customers and the number of orders associated with each customer.
-- Include customers with 0 orders.
select c.customer_id , count(o.order_id) 
from customers c
left join orders o
on c.customer_id = o.customer_id 
group by c.customer_id;

-- Level 2 — LEFT JOIN + GROUP BY
-- Q6. Find the number of customers in each customer_state, including all states present in the customers table.
select customer_state , count(*) as customer_count from customers
group by customer_state;

-- Q7. Find the number of orders for each customer_state.
-- Use LEFT JOIN and include states even if they have no matching orders.
select count(o.order_id) , c.customer_state
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.customer_state;

-- Q8. Display every seller and their total number of order-item records.
-- Include sellers with 0 items.
select count(oi.order_item_id) , s.seller_id
from sellers s
left join order_items oi
on s.seller_id = oi.seller_id
group by s.seller_id;

-- Q9. Display every product and its total number of order-item records.
-- Include products that were never sold.
select p.product_id , count(oi.order_item_id)
from products p
left join order_items oi
on p.product_id = oi.product_id
group by p.product_id;

-- Q10. Find the average price for each product.
-- Include products with no order-item records.
select round(avg(oi.price),1) , p.product_id
from products p
left join order_items oi
on p.product_id = oi.product_id
group by p.product_id;

-- Level 3 — INNER JOIN vs LEFT JOIN
-- Q11. Find all products that have never appeared in order_items.
-- 💡 Hint: LEFT JOIN + WHERE ... IS NULL
select p.product_id, p.product_category_name
from  products p
left join  order_items oi
on p.product_id = oi.product_id
where oi.product_id IS NULL;

-- Q12. Find all sellers who have never sold an item.
-- Return:
-- seller_id
-- seller_city
-- seller_state
select s.seller_id , s.seller_city , s.seller_state , oi.order_id
from sellers s
left join order_items oi
on s.seller_id = oi.seller_id
where oi.order_id is null;

-- Q13. Find all customers who have never placed an order.
-- Return:
-- customer_id
-- customer_city
-- customer_state
select c.customer_id , c.customer_city , c.customer_state , o.order_id
from customers c
left join orders o
on c.customer_id = o.customer_id
where o.order_id is null;

-- Q14. Find all products that have been sold, using INNER JOIN.
-- Return:
-- product_id
-- product_category_name
select distinct p.product_id , p.product_category_name
from products p
inner join order_items oi
on p.product_id = oi.product_id;

-- Q15. Compare the number of products:
-- Total products
-- Products that have been sold
-- Products that have never been sold
SELECT
    COUNT(*) AS total_products,
    COUNT(oi.product_id) AS products_that_were_sold,
    COUNT(*) - COUNT(oi.product_id) AS products_never_sold
FROM products p
LEFT JOIN (
    SELECT DISTINCT product_id
    FROM order_items
) oi
    ON p.product_id = oi.product_id;

-- Level 4 — Business Questions 🔥
-- Q16. Find the top 10 customer cities by number of customers.
-- Use customers only.
-- Then modify your query to show the number of orders from each city using LEFT JOIN.
select count(customer_id) , customer_city from customers 
group by customer_city
order by count(customer_id) desc
limit 10;
--second part
select c.customer_city, count(o.order_id) AS order_count
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.customer_city
order by order_count DESC
limit 10;
-- Q17. Find the top 10 sellers by total sales.
-- Use:
-- sellers
-- order_items
-- Calculate sales using SUM(price).
select sum(price) , seller_id
from order_items
group by seller_id
order by sum(price) desc
limit 10;

-- Q18. Find all product categories and their total sales.
-- Use:
-- products
-- order_items
-- Include categories where no sales exist.
-- 💡 You will need to think carefully about which table should be on the left side.
select sum(oi.price) , p.product_category_name
from products p
left join order_items oi
on p.product_id = oi.product_id
group by p.product_category_name;

-- Level 5 — Interview-Level 🔥🔥
-- Q19. Find the percentage of customers who have never placed an order.
-- Expected output:
-- metric
-- value
-- total_customers
-- ...
-- customers_without_orders
-- ...
-- percentage_without_orders
-- ...
select count(*) AS total_customers, count(*) filter
(
        WHERE o.order_id IS NULL
    ) 
	AS customers_without_orders,
    ROUND(
        COUNT(*) FILTER (WHERE o.order_id IS NULL) * 100.0
        / COUNT(*),
        2
    ) AS percentage_without_orders
FROM customers c
LEFT JOIN (
    SELECT DISTINCT customer_id
    FROM orders
) o
    ON c.customer_id = o.customer_id;

-- Q20. 🔥 Challenge
-- Find the top 10 product categories by total sales, but this time:
-- Include all product categories, even those with no sales.
-- Calculate total sales using SUM(price).
-- Replace NULL sales with 0.
-- Sort from highest sales to lowest.
-- Tables allowed: product_category_translation → products → order_items
SELECT
    pct.product_category_name_english AS product_category,
    COALESCE(SUM(oi.price), 0) AS total_sales
FROM product_category_translation pct
LEFT JOIN products p
    ON pct.product_category_name = p.product_category_name
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY pct.product_category_name_english
ORDER BY total_sales DESC
LIMIT 10;
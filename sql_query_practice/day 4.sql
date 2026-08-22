-- Easy (1–10)
-- Q1. Display all products costing more than ₹2000. Use: WHERE
select product_name ,price from products
where price > 2000;

-- Q2. Display customers whose name starts with 'A'. Use: LIKE
select customer_name from customers
where customer_name like 'A%';

-- Q3. Display products whose price is between ₹1000 and ₹3000. Use: BETWEEN
select product_name , price from products
where price between '1000' and '3000';

-- Q4. Display orders placed after '2024-04-01'. Use: Date Filtering
select order_id , order_date from orders
where order_date > '2024-04-01';

-- Q5. Count total products. Use: COUNT()
select count(product_id ) from products;

-- Q6. Find average product price. Use: AVG()
select avg(price) from products;

-- Q7. Display the highest-priced product. Use: MAX()
select max(price) from products;

-- Q8. Display customers who belong to Pune. Use: WHERE
select customer_name , city from customers
where city = 'Pune';

-- Q9. Display total quantity sold for each order. Use: SUM(), GROUP BY
select sum(quantity) ,order_id  from order_details
group by order_id;

-- Q10. Display products in descending order of price. Use: ORDER BY
select product_name , price from products
order by price desc;

Intermediate (11–20)
-- Q11. Display category name with number of products. Use: JOIN, COUNT()
select count(p.product_id) , c.category_name 
from products p
join categories c
on p.category_id = c.category_id
group by c.category_name;

-- Q12. Display customer name with city and number of orders. Use: LEFT JOIN, COUNT()
select c.customer_name,c.city,count(o.order_id)
from customers c
left join orders o
on c.customer_id = o.customer_id 
group by c.customer_name , c.city;

-- Q13. Display product name and total revenue generated. Use: JOIN, SUM(quantity × price)
select p.product_name , sum(o.quantity * p.price) 
from products p
join order_details o
on p.product_id = o.product_id
group by p.product_name;

-- Q14. Display categories having more than two products. Use: GROUP BY, HAVING
select c.category_name , count(p.product_id)
from categories c
join products p
on c.category_id = p.category_id
group by c.category_name
having count(p.product_id) > 2;

-- Q15. Display customers who never placed an order. Use: LEFT JOIN, IS NULL
select c.customer_name , o.order_id
from customers c
left join orders o
on c.customer_id = o.customer_id
where o.order_id is null;

-- Q16. Display total spending for each customer. Use: JOIN, SUM()
select c.customer_name,sum(o.quantity*p.price) as total_spending
from order_details o
join products p
on o.product_id = p.product_id 
join orders od
on o.order_id = od.order_id 
join customers c
on c.customer_id = od.customer_id 
group by c.customer_name;

-- Q17. Display top 3 best-selling products. Use: GROUP BY, SUM(), ORDER BY
SELECT
    p.product_name,
    SUM(od.quantity) AS total_quantity
FROM products p
JOIN order_details od
ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 3;

-- Q18. Display average product price in each category. Use: AVG(), GROUP BY
select category_id  , round(avg(price),2) as best_selling 
from products
group by category_id;

-- Q19. Display the total number of orders in each month. Use: GROUP BY, Date Functions
select extract(month from order_date) ,count(order_id) from orders
group by extract(month from order_date);
-- this is for month name
SELECT TO_CHAR(order_date, 'Month') AS month,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY TO_CHAR(order_date, 'Month');

-- Q20. Display customer names who purchased products worth more than ₹5000. Use: JOIN, GROUP BY, HAVING
select c.customer_name,sum(o.quantity*p.price) as total_spending
from order_details o
join products p
on o.product_id = p.product_id 
join orders od
on o.order_id = od.order_id 
join customers c
on c.customer_id = od.customer_id 
group by c.customer_name
having sum(o.quantity*p.price) > 5000;

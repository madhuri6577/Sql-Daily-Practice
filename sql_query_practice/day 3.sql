-- Q1 Display the total amount of each order. Use: SUM(), GROUP BY
SELECT od.order_id,
       SUM(od.quantity * p.price) AS total_amount
FROM order_details od
JOIN products p
ON od.product_id = p.product_id
GROUP BY od.order_id;

-- Q2 Display customers who placed more than one order. Use: GROUP BY, HAVING
select count(order_id) , customer_id from orders
group by customer_id
having count(order_id) > 1;

-- Q3 Find the average quantity ordered for each product. Use: AVG()
select round(avg(quantity),2) , product_id from order_details
group by product_id;

-- Q4 Display the most expensive product in each category. Use: MAX(), GROUP BY
select max(price) as expensive from products
group by category_id;


-- Q5 Display orders placed in March 2024. Use: Date filtering
select order_id ,order_date from orders
where order_date between '2024-03-01' and '2024-03-31';

-- Q6 Display customer name and total number of orders. Use: LEFT JOIN, COUNT()
select c.customer_name , count(o.order_id) 
from customers as c
left join orders as o
on c.customer_id = o.customer_id
group by c.customer_name;

-- Q7 Find the category with the highest number of products. Use: COUNT(), ORDER BY
select count(p.product_id) as highest , c.category_id , c.category_name
from products as p
join categories as c
on p.category_id = c.category_id
group by c.category_id , c.category_name
order by highest desc
limit 1;

-- Q8 Display products that have never been ordered. Use: LEFT JOIN, IS NULL
select p.product_name , p.product_id , o.order_id 
from products as p
left join order_details as o
on p.product_id = o.product_id 
where p.product_id is null;


-- Q9 Display the total revenue for each product. Use: SUM(quantity * price)
select sum(o.quantity*p.price),p.product_name
from order_details as o
join products as p
on o.product_id = p.product_id
group by p.product_name;

-- Q10 Display the top 5 customers based on total spending. Use: JOIN, SUM(), GROUP BY, ORDER BY
SELECT
    c.customer_id,
    c.customer_name,
    SUM(od.quantity * p.price) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_details od
    ON o.order_id = od.order_id
JOIN products p
    ON od.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY
    total_spending DESC
LIMIT 5;
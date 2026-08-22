-- Part A — 10 Subquery Questions

-- Q1
-- Find all products whose price is greater than the average price of all products.
select * from products
where price >
(
select avg(price) from products
);

-- Q2
-- Find the customers who have placed at least one order using a subquery.
select * from customers
where customer_id in
(
select customer_id from orders 
);

-- Q3
-- Find the products that have never been ordered using a subquery.
select product_name from products
where product_id not in 
(
select product_id from order_details
where product_is not null
);

-- Q4
-- Find the customer(s) who placed an order on the latest order date.
select * from customers
where customer_id in
(
select customer_id from orders
where order_date = 
(
select max(order_date) from orders
)
);

-- Q5
-- Find all products whose price is equal to the maximum product price.
select * from products
where price =
(
select max(price) from products
);


-- Q6
-- Find customers whose customer_id appears in the orders table and who have placed an order.
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);

-- Q7
-- Find products whose price is greater than the average price of products in their category.
-- Hint: This is a correlated-subquery question.
select * from products p
where p.price > 
(
select avg(p2.price) from products p2
where p2.category_id = p.category_id
);

-- Q8
-- Find the customer(s) who have placed the most orders using a subquery.
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) = (
        SELECT MAX(order_count)
        FROM (
            SELECT customer_id, COUNT(*) AS order_count
            FROM orders
            GROUP BY customer_id
        ) x
    )
);

-- Q9
-- Find all orders placed by customers who live in Pune using a subquery.
select * from orders 
where customer_id in
(
select customer_id from customers
where city ='Pune'
);

-- Q10
-- Find the product(s) that have the highest total quantity sold.
select distinct p.product_name , sum(od.quantity)
from products p
join order_details od
on p.product_id = od.product_id
group by p.product_name;

-- Q11 — WHERE
-- Find all customers who live in Pune.
select * from customers
where city='Pune';

-- Q12 — ORDER BY
-- Display all products from highest price to lowest price.
select * from products
order by price desc;

-- Q13 — GROUP BY
-- Find the number of customers in each city.
select count(customer_name) , city from customers
group by city;

-- Q14 — HAVING
-- Find cities having more than 2 customers.
select count(customer_name) , city from customers
group by city
having count(customer_name) > 2;

-- Q15 — JOIN
-- Display each order along with the customer's name.
select distinct c.customer_name , o.order_id
from customers c
join orders o
on c.customer_id = o.customer_id;

-- Q16 — Multiple JOINs
-- Display:
-- customer_name, order_id, product_name, quantity
-- using the required tables.
select c.customer_name , o.order_id,p.product_name , od.quantity
from customers c
join orders o
on c.customer_id = o.customer_id
join order_details od
on o.order_id = od.order_id
join products p
on od.product_id = p.product_id;

-- Q17 — Aggregate Functions
-- Find the total quantity sold for each product.
select sum(od.quantity) , p.product_name 
from order_details od
join products p
on od.product_id = p.product_id
group by p.product_name;

-- Q18 — CASE WHEN
-- Create a column called price_category:
-- Price > 1000 → Expensive
-- Price between 500 and 1000 → Medium
-- Price < 500 → Cheap
select product_name ,
case 
   when price>1000 then 'Expensive'
   when price<=1000 and price > 500 then 'Medium'
   else 'cheap'
   end as price_category
 from products;

-- Q19 — GROUP BY + HAVING
-- Find product categories whose average product price is greater than 500.
select product_name , avg(price) from products
group by product_name
having avg(price) > 500;

-- Q20 — JOIN + GROUP BY
-- Find the total sales amount for each customer.
select sum(od.quantity*p.price) , c.customer_name
from customers c
join orders o
on c.customer_id = o.customer_id
join order_details od
on o.order_id = od.order_id
join products p
on od.product_id = p.product_id
group by c.customer_name;
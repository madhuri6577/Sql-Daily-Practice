-- SQL Practice Set (20 Questions)
-- Easy (1–5)
-- Q1. Display all customers from Pune, sorted by customer name.
select * from customers 
where city = 'Pune'
order by customer_name;

-- Q2. Display all products whose price is between ₹2000 and ₹10000.
select * from products
where price between '2000' and '10000';

-- Q3. Display unique cities from the customers table.
select distinct city from customers;

-- Q4. Display all products whose name starts with 'S'.
select * from products
where product_name like 's%';

-- Q5. Display the 5 most expensive products.
select * from products 
order by price desc
limit 5;

-- Intermediate (6–10)
-- Q6. Display each product with a new column:
-- Price ≥ 5000 → 'Expensive'
-- Otherwise → 'Affordable'
-- (CASE WHEN)
select product_name , price ,
case
   when price >= 5000 then 'Expensive'
   else 'Affortable'
   end as Product_type
from products;

-- Q7. Display each customer with:
-- Pune → 'Local Customer'
-- Otherwise → 'Outside Pune'
-- (CASE WHEN)
select customer_name , city,
case
    when city = 'Pune' then 'Local Customer'
	else 'Outside Pune'
	end as customer_type
from customers;
	
-- Q8. Display category name along with the number of products in each category.
-- (JOIN + GROUP BY)
select c.category_name , count(p.product_id) 
from categories c
join products p
on p.category_id = c.category_id
group by c.category_name;

-- Q9. Display customers who have placed more than 2 orders.
-- (JOIN + GROUP BY + HAVING)
select c.customer_name , count(order_id)
from customers c
join orders o
on c.customer_id = o.customer_id 
group by c.customer_name
having count(order_id) > 2;

-- Q10. Display the total amount for each order. (Hint: Quantity × Price)
-- (JOIN + GROUP BY)
select sum(od.quantity*p.price) , od.order_id
from order_details od
join products p
on od.product_id = p.product_id
group by od.order_id;

-- Advanced (11–15)
-- Q11. Find products whose price is greater than the average product price.
-- (Subquery)
select * from products
where price > 
(
select avg(price) from products
)
;
-- Q12. Find customers who have never placed an order.
-- (Subquery + NOT IN)
select * from customers
where customer_id not in
(
select customer_id from orders
);

-- Q13. Find the most expensive product.
-- (Subquery + MAX)
select * from products
where price = 
(
select max(price) from products
);

-- Q14. Find the customer(s) who placed the latest order.
-- (Subquery + MAX)
select * from customers
where customer_id in
(
select customer_id from orders 
where order_date = 
(
select max(order_date) from orders
)
);

-- Q15. Display each product with:
-- Above Average
-- Below Average
-- based on the average product price.
-- (CASE WHEN + Subquery)
select product_name , price,
case
   when price > (select avg(price) from products) 
        then 'Above Average'
	else 'Below Average'
	end as product_category
from products;

-- Placement Level (16–20)
-- Q16. Find products that have never been ordered.
-- (Subquery)
select product_name , product_id from products
where product_id not in
(
select product_id from order_details
);

-- Q17. Display category names whose average product price is greater than ₹5000.
-- (JOIN + GROUP BY + HAVING)
select c.category_name , avg(p.price)
from categories c
join products p
on c.category_id = p.category_id
group by c.category_name
having avg(p.price)>5000;

-- Q18. Find customers who purchased at least one product priced above ₹10000.
-- (JOIN + Subquery)
select distinct c.customer_name , p.price
from customers c
join orders o
on c.customer_id = o.customer_id 
join order_details od
on o.order_id = od.order_id
join products p
on od.product_id = p.product_id
where price in
(
select price
from products
where price > 10000
);

-- Q19. Display each customer along with:
-- Customer Name
-- Total Orders
-- Total Quantity Purchased
-- (JOIN + GROUP BY)
select c.customer_name , count(distinct o.order_id) , sum(od.quantity)
from customers c
join orders o
on c.customer_id = o.customer_id
join order_details od
on o.order_id = od.order_id
group by c.customer_name;

-- Q20. Display each product with a column:
-- 'High Demand' if total quantity sold is 5 or more
-- 'Low Demand' otherwise.
-- (JOIN + GROUP BY + CASE WHEN)
select p.product_name , sum(od.quantity) , 
case 
   when sum(od.quantity) >=5 then 'High Demand'
   else 'Low Demand'
   end as product_demand
from products p
left join order_details od 
on p.product_id = od.product_id
group by p.product_name;




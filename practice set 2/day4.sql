-- Part 1: INNER JOIN — Q1–Q7
-- Q1. Customer orders
-- Display the customer_name, order_id, and status for every order with its corresponding customer.
select c.customer_name , o.order_id , o.status
from customers c
join orders o
on c.customer_id = o.customer_id;

-- Q2. Product orders
-- Display the order_id, product_name, and quantity for every order.
select o.order_id , p.product_name , o.quantity
from orders o
join products p
on o.product_id = p.product_id;

-- Q3. Customer and product details
-- Display customer_name, product_name, quantity, and status for every order.
select c.customer_name , p.product_name , o.quantity , o.status
from customers c
join orders o
on c.customer_id = o.customer_id
join products p
on o.product_id = p.product_id;

-- Q4. Orders from Pune
-- Display the customer_name, city, and order_id for customers from Pune who have placed orders.
select c.customer_name , c.city , o.order_id
from customers c
join orders o
on c.customer_id = o.customer_id
where c.city = 'Pune';

-- Q5. Delivered orders
-- Display customer_name, product_name, and status for orders whose status is Delivered.
select c.customer_name , p.product_name ,  o.status 
from customers c
join orders o
on c.customer_id = o.customer_id
join products p
on o.product_id = p.product_id
where o.status = 'Delivered';

-- Q6. Expensive products ordered
-- Display order_id, product_name, and price for orders containing products priced above ₹5,000.
select o.order_id , p.product_name , p.price
from orders o
join products p
on o.product_id = p.product_id 
where price > 5000;

-- Q7. Order amount
-- Display order_id, product_name, quantity, price, and a calculated column total_amount (quantity × price) for each order.
select o.order_id , p.product_name ,p.price ,o.quantity, o.quantity*p.price as total_amount
from orders o
join products p
on o.product_id = p.product_id ;

-- Part 2: LEFT JOIN — Q8–Q12
-- Q8. All customers and their orders
-- Display every customer and their order_id, including customers who have not placed any orders.
select c.customer_name , o.order_id 
from customers c
left join orders o
on c.customer_id = o.customer_id;

-- Q9. Customers without orders
-- Find customers who have never placed an order.
select c.customer_name , o.order_id 
from customers c
left join orders o
on c.customer_id = o.customer_id
where o.order_id is null;

-- Q10. All products and their orders
-- Display every product and its order_id, including products that have never been ordered.
select p.product_name , o.order_id 
from products p
left join orders o
on p.product_id = o.product_id;

-- Q11. Products never ordered
-- Find products that have never been ordered.
select p.product_name , o.order_id 
from products p
left join orders o
on p.product_id = o.product_id
where o.order_id is null;

-- Q12. Customer order count
-- Display each customer's customer_name and the number of orders they have placed. Include customers with zero orders.
select c.customer_name , c.customer_id,count(o.order_id) as number_of_orders
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.customer_name,c.customer_id;

-- Part 3: JOIN + Filtering and Sorting — Q13–Q16
-- Q13. Mumbai customers' orders
-- Display customer_name, product_name, and order_date for orders placed by customers from Mumbai.
select c.customer_name , p.product_name , o.order_date
from customers c
join orders o
on c.customer_id = o.customer_id
join products p
on o.product_id = p.product_id
where c.city = 'Mumbai';

-- Q14. Recent delivered orders
-- Display order_id, customer_name, and order_date for delivered orders, sorted from newest to oldest.
select o.order_id , c.customer_name , o.order_date
from customers c
join orders o
on c.customer_id = o.customer_id
where o.status = 'Delivered'
order by o.order_date desc;

-- Q15. Furniture orders
-- Display customer_name, product_name, category, and quantity for orders containing products in the Furniture category.
select c.customer_name , p.product_name , p.category , o.quantity
from customers c
join orders o
on c.customer_id = o.customer_id
join products p
on o.product_id = p.product_id
where p.category = 'Furniture';

-- Q16. High-value order items
-- Display order_id, customer_name, product_name, and total_amount for order items whose calculated amount (quantity × price) exceeds ₹10,000.
select o.order_id , c.customer_name , p.product_name , o.quantity*p.price as total_amount
from customers c
join orders o
on c.customer_id = o.customer_id
join products p
on o.product_id = p.product_id
where  o.quantity*p.price > 10000;

-- Part 4: Multiple Joins and Aggregation — Q17–Q20
-- Q17. Total spending by customer
-- Display each customer's name and their total order value, calculated as SUM(quantity * price). Include only customers who have placed orders.
select c.customer_name , sum(o.quantity*p.price) as total_value
from customers c
inner join orders o
on c.customer_id = o.customer_id
join products p
on o.product_id = p.product_id
group by c.customer_name;

-- Q18. Number of orders by city
-- Display each city and the total number of orders placed by customers from that city.
select count(o.order_id) as number_of_orders , c.city
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.city;

-- Q19. Total quantity by product category
-- Display each product category and the total quantity ordered for products in that category.
select sum(o.quantity) as total_quantity , p.category
from products p
join orders o
on p.product_id = o.product_id
group by p.category;

-- Q20. Customers with spending above ₹10,000
-- Display customer names and their total order value, including only customers whose total order value exceeds ₹10,000.
select c.customer_name , sum(o.quantity*p.price) as total_value
from customers c
join orders o
on c.customer_id = o.customer_id
join products p
on o.product_id = p.product_id
group by c.customer_name
having sum(o.quantity*p.price) >10000;
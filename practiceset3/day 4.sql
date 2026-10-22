-- 1. Display customer names along with their order IDs using customers and orders.
select c.customer_name , o.order_id
from customers c
join orders o
on c.customer_id = o.customer_id;

-- 2. Display customer names and their order dates.
select c.customer_name , o.order_date
from customers c
join orders o
on c.customer_id = o.customer_id;

-- 3. Display customer names and order statuses.
select c.customer_name , o.status
from customers c
join orders o
on c.customer_id = o.customer_id;

-- 4. Display product names along with their order IDs using products and order_items.
select p.product_name , oi.order_id
from products p
join order_items oi
on p.product_id = oi.product_id;

-- 5. Display product names, quantities, and unit prices from order_items.
select p.product_name , oi.quantity , oi.unit_price
from products p
join order_items oi
on p.product_id = oi.product_id;

-- 6. Display order IDs along with their product names.
select oi.order_id , p.product_name
from order_items oi
join products p
on oi.product_id = p.product_id;

-- 7. Display order IDs and customer names for all matching orders.
select o.order_id , c.customer_name
from orders o
join customers c
on o.customer_id = c.customer_id;

-- 8. Display employee names and their departments.
select employee_name , department from employees;

-- 9. Display product names and their categories.
select product_name ,category from products;

-- 10. Display customer names and their cities along with their order IDs.
select c.customer_name, c.city , o.order_id 
from orders o
join customers c
on o.customer_id = c.customer_id;

-- 11. Display customer names and their order dates for orders with status 'delivered'.
select c.customer_name , o.order_date , o.status
from orders o
join customers c
on o.customer_id = c.customer_id
where o.status = 'delivered';

-- 12. Display product names and quantities for products with quantity greater than 2 in order_items.
select p.product_name , oi.quantity 
from products p
join order_items oi
on p.product_id = oi.product_id 
where oi.quantity > 2;

-- 13. Display customer names and order IDs for customers who have matching orders using inner join.
select c.customer_name , o.order_id 
from orders o
inner join customers c
on o.customer_id = c.customer_id;

-- 14. Display all customers and their order IDs, including customers who have no orders, using left join.
select c.customer_name , o.order_id 
from customers c
left join orders o
on c.customer_id = o.customer_id;

-- 15. Display all orders and customer names, including orders without a matching customer, using left join with orders as the left table.
select c.customer_name , o.order_id 
from orders o
left join customers c
on o.customer_id = c.customer_id ;

-- 16. Display all products and their matching order item quantities, including products that have never been ordered.
select p.product_name , oi.quantity
from products p
left join order_items oi
on p.product_id = oi.product_id;

-- 17. Display all employees and their manager IDs using a self join to show employee names and manager names.
select e.employee_name , e2.manager_id 
from employees e
left join employees e2
on e.employee_id = e2.employee_id;

-- 18. Display order IDs and product names for items whose unit price is greater than 500 . 
select oi.order_id , p.product_name , oi.unit_price
from products p
join order_items oi
on p.product_id = oi.product_id
where oi.unit_price > 500 ;

-- 19. Display customer names and order IDs for orders placed after 1 January 2025.
select c.customer_name , o.order_id  , o.order_date
from customers c
join orders o
on c.customer_id = o.customer_id
where o.order_date > '2025-01-01';

-- 20. Display product names, order IDs, and quantities by joining products, order_items, and orders.
select p.product_name , o.order_id , oi.quantity
from products p
join order_items oi
on p.product_id = oi.product_id
join orders o
on oi.order_id = o.order_id;

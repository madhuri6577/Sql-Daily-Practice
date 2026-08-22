-- Q1 Display customers from Mumbai. Use: WHERE
select customer_name from customers
where city = 'Mumbai';

-- Q2 Display products whose price is between ₹1000 and ₹5000. Use: BETWEEN
select product_name , price from products
where price between 1000 and 5000;

-- Q3 Display customers from Pune and Mumbai. Use: IN
select customer_name , city  from customers
where city in ('Pune','Mumbai');

-- Q4 Display products whose name starts with 'M'. Use: LIKE
select product_name from products
where product_name like 'M%';

-- Q5 Display customers who joined after 2024-02-01. Use: WHERE
select customer_name , join_date from customers
where join_date > '2024-02-01';

-- Q6 Find the minimum product price. Use: MIN()
select min(price) from products;

-- Q7 Find the total quantity sold for each product. Use: GROUP BY, SUM()
select sum(quantity),product_id from order_details
group by product_id;

-- Q8 Display categories having more than one product. Use: GROUP BY, HAVING
select category_id , count(*) from products
group by category_id
having count(*)>1;

-- Q9 Display product name and category name. Use: INNER JOIN
select p.product_name , c.category_name 
from products p
inner join categories c
on p.category_id =  c.category_id;

-- Q10 Display every product, even if it has never been ordered. Use: LEFT JOIN
select p.product_name , p.product_id ,o.order_id 
from products p
left join order_details o
on p.product_id = o.product_id;

-- ===========================
-- CREATE TABLES
-- ===========================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    join_date DATE
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(30)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ===========================
-- INSERT DATA
-- ===========================

INSERT INTO customers VALUES
(1,'Amit','Pune','2024-01-10'),
(2,'Priya','Mumbai','2024-02-15'),
(3,'Rahul','Nagpur','2024-03-12'),
(4,'Sneha','Pune','2024-01-25'),
(5,'Karan','Delhi','2024-04-08'),
(6,'Neha','Mumbai','2024-05-02'),
(7,'Rohit','Nashik','2024-02-20'),
(8,'Pooja','Pune','2024-03-18');

INSERT INTO categories VALUES
(1,'Electronics'),
(2,'Fashion'),
(3,'Books'),
(4,'Home');

INSERT INTO products VALUES
(101,'Laptop',1,65000),
(102,'Mobile',1,25000),
(103,'Headphones',1,3000),
(104,'T-Shirt',2,900),
(105,'Jeans',2,1800),
(106,'Novel',3,600),
(107,'Mixer',4,3500),
(108,'Chair',4,4500);

INSERT INTO orders VALUES
(1001,1,'2024-05-01'),
(1002,2,'2024-05-02'),
(1003,3,'2024-05-03'),
(1004,1,'2024-05-05'),
(1005,5,'2024-05-07'),
(1006,4,'2024-05-08'),
(1007,6,'2024-05-10'),
(1008,8,'2024-05-12');

INSERT INTO order_details VALUES
(1,1001,101,1),
(2,1001,103,2),
(3,1002,104,3),
(4,1002,105,1),
(5,1003,102,1),
(6,1004,106,5),
(7,1005,107,2),
(8,1006,108,1),
(9,1007,101,1),
(10,1008,104,2);

select * from categories;
select * from customers;
select * from order_details;

-- 1 display all customers
select * from customers;

--2 display customers who live in pune
select * from customers
where city = 'Pune';
 --3 display products in ascending order of price 
 select * from products
 order by price;

 --4 display the top 3 most expensive products 
 select * from products
 order by price desc
 limit 3;

 --5 find the total number of customers 
 select count(*) from customers;

 --6 find the avg product price
 select avg(price) from products;

 --7 find the highest price product
  select price , product_name
  from products
  order by price desc
  limit 1;

  --8 display each category with the number of products in it 
  select count(product_name) , category_id from products
  group by category_id;

  --9 display all orders along with customer name 
  select o.order_id , c.customer_id , c.customer_name
  from orders as o
  join customers as c
  on o.customer_id = c.customer_id;
  --10 display customers who have placed nay order
 select c.customer_id , c.customer_name
 from customers  c
 left join orders  o
 on c.customer_id = o.customer_id
 where o.order_id is null;

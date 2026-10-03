CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    age INT
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, customer_name, city, state, age) VALUES
(1, 'Rahul', 'Pune', 'Maharashtra', 24),
(2, 'Priya', 'Mumbai', 'Maharashtra', 28),
(3, 'Amit', 'Delhi', 'Delhi', 31),
(4, 'Sneha', 'Pune', 'Maharashtra', 26),
(5, 'Rohan', 'Bangalore', 'Karnataka', 35),
(6, 'Neha', 'Hyderabad', 'Telangana', 29),
(7, 'Karan', 'Mumbai', 'Maharashtra', 22),
(8, 'Anjali', 'Delhi', 'Delhi', 27),
(9, 'Vivek', 'Chennai', 'Tamil Nadu', 33),
(10, 'Pooja', 'Pune', 'Maharashtra', 30);

INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mouse', 'Electronics', 800),
(103, 'Keyboard', 'Electronics', 1500),
(104, 'Headphones', 'Electronics', 2500),
(105, 'Office Chair', 'Furniture', 7500),
(106, 'Table', 'Furniture', 12000),
(107, 'Notebook', 'Stationery', 120),
(108, 'Pen', 'Stationery', 50),
(109, 'Backpack', 'Accessories', 1800),
(110, 'Monitor', 'Electronics', 15000);


INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date, status) VALUES
(1001, 1, 101, 1, '2026-09-01', 'Delivered'),
(1002, 2, 102, 2, '2026-09-02', 'Delivered'),
(1003, 3, 105, 1, '2026-09-03', 'Cancelled'),
(1004, 4, 104, 1, '2026-09-04', 'Delivered'),
(1005, 5, 106, 1, '2026-09-05', 'Shipped'),
(1006, 6, 103, 2, '2026-09-06', 'Delivered'),
(1007, 7, 109, 1, '2026-09-07', 'Pending'),
(1008, 8, 110, 1, '2026-09-08', 'Delivered'),
(1009, 9, 107, 5, '2026-09-09', 'Delivered'),
(1010, 10, 108, 10, '2026-09-10', 'Shipped'),
(1011, 1, 102, 1, '2026-09-11', 'Delivered'),
(1012, 4, 105, 2, '2026-09-12', 'Pending'),
(1013, 5, 104, 1, '2026-09-13', 'Delivered'),
(1014, 2, 110, 2, '2026-09-14', 'Shipped'),
(1015, 7, 107, 3, '2026-09-15', 'Cancelled');

select * from customers;
select * from products;
select * from orders;

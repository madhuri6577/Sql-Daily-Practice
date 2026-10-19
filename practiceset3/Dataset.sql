-- E-commerce SQL Practice Dataset for Data Analyst Interviews
-- PostgreSQL / pgAdmin
-- Run this entire file in pgAdmin Query Tool.
-- Safe to rerun: drops and recreates the practice tables.

drop table if exists raw_orders;
drop table if exists website_visits;
drop table if exists campaign_events;
drop table if exists payments;
drop table if exists order_items;
drop table if exists orders;
drop table if exists products;
drop table if exists employees;
drop table if exists customers;

create table customers (
    customer_id int primary key,
    customer_name varchar(80),
    email varchar(120),
    city varchar(50),
    state varchar(50),
    signup_date date,
    segment varchar(20),
    age int
);

insert into customers values
(1,'Aarav Sharma','aarav@example.com','Pune','Maharashtra','2024-01-05','Regular',24),
(2,'Diya Patil','diya@example.com','Mumbai','Maharashtra','2024-01-18','Premium',29),
(3,'Rohan Mehta','rohan@example.com','Pune','Maharashtra','2024-02-03','Regular',32),
(4,'Ananya Joshi','ananya@example.com','Nashik','Maharashtra','2024-02-20','Premium',27),
(5,'Vivaan Shah','vivaan@example.com','Ahmedabad','Gujarat','2024-03-11','Regular',35),
(6,'Isha Kulkarni','isha@example.com','Pune','Maharashtra','2024-03-22','Regular',22),
(7,'Kabir Verma','kabir@example.com','Delhi','Delhi','2024-04-01','Premium',41),
(8,'Sara Khan','sara@example.com','Hyderabad','Telangana','2024-04-19','Regular',31),
(9,'Arjun Rao','arjun@example.com','Bengaluru','Karnataka','2024-05-06','Premium',28),
(10,'Meera Desai','meera@example.com','Mumbai','Maharashtra','2024-05-23','Regular',26),
(11,'Ishaan Gupta','ishaan@example.com','Delhi','Delhi','2024-06-02','Regular',38),
(12,'Aditi Nair','aditi@example.com','Kochi','Kerala','2024-06-15','Premium',30),
(13,'Reyansh Singh','reyansh@example.com','Jaipur','Rajasthan','2024-07-04','Regular',25),
(14,'Myra Iyer','myra@example.com','Chennai','Tamil Nadu','2024-07-17','Premium',34),
(15,'Advait Pawar','advait@example.com','Pune','Maharashtra','2024-08-09','Regular',23),
(16,'Kiara Kapoor','kiara@example.com','Chandigarh','Chandigarh','2024-09-12','Regular',29),
(17,'Atharv More','atharv@example.com','Nagpur','Maharashtra','2024-10-02','Premium',37),
(18,'Saanvi Reddy','saanvi@example.com','Hyderabad','Telangana','2024-11-10','Regular',26),
(19,'Krish Malhotra','krish@example.com','Delhi','Delhi','2025-01-09','Premium',33),
(20,'Pari Jadhav','pari@example.com','Pune','Maharashtra','2025-02-14','Regular',21),
(21,'Dev Sinha','dev@example.com','Kolkata','West Bengal','2025-03-02','Regular',40),
(22,'Tara Bansal','tara@example.com','Mumbai','Maharashtra','2025-04-12','Premium',27),
(23,'Neil Fernandes','neil@example.com','Goa','Goa','2025-05-08','Regular',36),
(24,'Zoya Ali','zoya@example.com','Lucknow','Uttar Pradesh','2025-06-21','Regular',24),
(25,'Omkar Shinde','omkar@example.com','Pune','Maharashtra','2025-07-05','Premium',31),
(26,'Riya Sen','riya@example.com','Kolkata','West Bengal','2025-08-18','Regular',28),
(27,'Yash Thakur','yash@example.com','Indore','Madhya Pradesh','2025-09-09','Regular',34),
(28,'Nisha Pillai','nisha@example.com','Kochi','Kerala','2025-10-11','Premium',30),
(29,'Manav Jain','manav@example.com','Jaipur','Rajasthan','2025-11-03','Regular',27),
(30,'Pihu Ghosh','pihu@example.com','Pune','Maharashtra','2025-12-01','Regular',22),
(31,'Rudra Bose','rudra@example.com','Surat','Gujarat','2025-12-10','Regular',26),
(32,'Tia George','tia@example.com','Thane','Maharashtra','2025-12-15','Premium',33),
(33,'Ayaan Das','ayaan@example.com','Bhopal','Madhya Pradesh','2025-12-20','Regular',29);

create table products (
    product_id int primary key,
    product_name varchar(100),
    category varchar(50),
    price numeric(10,2),
    stock int,
    active boolean
);

insert into products values
(101,'Wireless Mouse','Electronics',799,120,true),
(102,'Mechanical Keyboard','Electronics',2499,45,true),
(103,'USB-C Hub','Electronics',1599,60,true),
(104,'Laptop Stand','Accessories',999,80,true),
(105,'Water Bottle','Lifestyle',399,200,true),
(106,'Backpack','Lifestyle',1499,70,true),
(107,'Running Shoes','Fashion',2999,35,true),
(108,'Cotton T-Shirt','Fashion',599,150,true),
(109,'Notebook Set','Stationery',249,300,true),
(110,'Desk Lamp','Home',1199,55,true),
(111,'Webcam','Electronics',1899,40,true),
(112,'Headphones','Electronics',1999,65,true),
(113,'Yoga Mat','Fitness',899,90,true),
(114,'Coffee Mug','Home',299,180,true),
(115,'Travel Adapter','Accessories',699,100,true),
(116,'Unused Product','Stationery',499,25,true);

create table employees (
    employee_id int primary key,
    employee_name varchar(80),
    department varchar(50),
    manager_id int,
    salary numeric(10,2),
    hire_date date,
    city varchar(50)
);

insert into employees values
(1,'Neha Kulkarni','Sales',null,95000,'2020-02-10','Pune'),
(2,'Rahul Deshmukh','Sales',1,102000,'2021-06-14','Pune'),
(3,'Priya Shah','Sales',1,71000,'2019-11-04','Mumbai'),
(4,'Aman Verma','Analytics',null,110000,'2018-03-19','Bengaluru'),
(5,'Sneha Rao','Analytics',4,82000,'2022-01-12','Bengaluru'),
(6,'Kunal Joshi','Analytics',4,76000,'2023-07-03','Pune'),
(7,'Pooja Nair','Marketing',null,90000,'2020-09-21','Mumbai'),
(8,'Vikram Singh','Marketing',7,58000,'2024-02-05','Delhi'),
(9,'Ritu Mehta','Support',null,68000,'2021-12-01','Pune'),
(10,'Sahil Khan','Support',9,52000,'2024-05-20','Hyderabad'),
(11,'Ira Patil','Finance',null,88000,'2019-04-16','Pune'),
(12,'Aditya Rao','Finance',11,60000,'2022-08-08','Mumbai');

create table orders (
    order_id int primary key,
    customer_id int references customers(customer_id),
    order_date date,
    status varchar(20),
    sales_channel varchar(20),
    discount_pct numeric(5,2)
);

insert into orders values
(1001,1,'2024-01-12','delivered','website',0),
(1002,2,'2024-01-25','delivered','app',10),
(1003,3,'2024-02-10','delivered','website',5),
(1004,1,'2024-02-18','delivered','app',0),
(1005,4,'2024-03-02','cancelled','website',0),
(1006,5,'2024-03-16','delivered','marketplace',15),
(1007,6,'2024-03-28','returned','app',5),
(1008,2,'2024-04-05','delivered','website',10),
(1009,7,'2024-04-22','delivered','app',0),
(1010,8,'2024-05-11','delivered','website',5),
(1011,9,'2024-05-29','delivered','marketplace',10),
(1012,10,'2024-06-09','delivered','app',0),
(1013,3,'2024-06-25','delivered','website',5),
(1014,11,'2024-07-08','cancelled','marketplace',0),
(1015,12,'2024-07-22','delivered','app',10),
(1016,13,'2024-08-13','delivered','website',0),
(1017,14,'2024-09-01','delivered','app',5),
(1018,15,'2024-09-19','delivered','website',10),
(1019,7,'2024-10-05','delivered','marketplace',0),
(1020,16,'2024-10-27','delivered','app',5),
(1021,17,'2024-11-15','delivered','website',10),
(1022,18,'2024-12-03','delivered','app',0),
(1023,1,'2024-12-18','delivered','website',5),
(1024,19,'2025-01-14','delivered','app',10),
(1025,20,'2025-02-19','delivered','website',0),
(1026,2,'2025-03-07','delivered','app',5),
(1027,21,'2025-03-23','returned','website',0),
(1028,22,'2025-04-15','delivered','marketplace',15),
(1029,9,'2025-05-02','delivered','app',10),
(1030,23,'2025-05-18','delivered','website',5),
(1031,24,'2025-06-25','cancelled','app',0),
(1032,25,'2025-07-12','delivered','website',10),
(1033,3,'2025-08-09','delivered','marketplace',5),
(1034,26,'2025-08-28','delivered','app',0),
(1035,27,'2025-09-17','delivered','website',10),
(1036,28,'2025-10-06','delivered','app',5),
(1037,29,'2025-11-11','delivered','website',0),
(1038,30,'2025-12-08','delivered','marketplace',10),
(1039,7,'2025-12-20','delivered','app',5),
(1040,2,'2025-12-27','delivered','website',0);

create table order_items (
    order_item_id int primary key,
    order_id int references orders(order_id),
    product_id int references products(product_id),
    quantity int,
    unit_price numeric(10,2)
);

insert into order_items values
(1,1001,101,2,799),(2,1001,109,3,249),
(3,1002,102,1,2499),(4,1002,105,2,399),
(5,1003,104,1,999),(6,1003,108,2,599),
(7,1004,112,1,1999),(8,1004,114,2,299),
(9,1005,107,1,2999),(10,1006,106,1,1499),
(11,1006,105,3,399),(12,1007,113,1,899),
(13,1008,111,1,1899),(14,1008,109,4,249),
(15,1009,107,1,2999),(16,1009,115,2,699),
(17,1010,103,1,1599),(18,1010,105,2,399),
(19,1011,112,2,1999),(20,1011,108,1,599),
(21,1012,110,1,1199),(22,1012,114,3,299),
(23,1013,101,1,799),(24,1013,102,1,2499),
(25,1014,106,1,1499),(26,1015,113,2,899),
(27,1015,109,2,249),(28,1016,108,3,599),
(29,1016,105,1,399),(30,1017,107,1,2999),
(31,1017,104,1,999),(32,1018,102,1,2499),
(33,1018,115,2,699),(34,1019,111,2,1899),
(35,1019,105,1,399),(36,1020,106,1,1499),
(37,1020,114,2,299),(38,1021,112,1,1999),
(39,1021,103,1,1599),(40,1022,113,1,899),
(41,1022,108,2,599),(42,1023,101,1,799),
(43,1023,109,5,249),(44,1024,102,1,2499),
(45,1024,110,1,1199),(46,1025,104,2,999),
(47,1025,105,2,399),(48,1026,111,1,1899),
(49,1026,112,1,1999),(50,1027,106,1,1499),
(51,1028,107,2,2999),(52,1028,108,2,599),
(53,1029,103,1,1599),(54,1029,115,2,699),
(55,1030,110,1,1199),(56,1030,114,2,299),
(57,1031,113,1,899),(58,1032,102,1,2499),
(59,1032,101,2,799),(60,1033,112,2,1999),
(61,1033,105,2,399),(62,1034,108,2,599),
(63,1034,109,3,249),(64,1035,107,1,2999),
(65,1035,104,1,999),(66,1036,106,1,1499),
(67,1036,115,1,699),(68,1037,103,1,1599),
(69,1037,110,1,1199),(70,1038,105,4,399),
(71,1038,114,2,299),(72,1039,111,1,1899),
(73,1039,102,1,2499),(74,1040,112,1,1999),
(75,1040,101,1,799);

create table payments (
    payment_id int primary key,
    order_id int references orders(order_id),
    payment_date date,
    payment_method varchar(20),
    amount numeric(10,2),
    payment_status varchar(20)
);

insert into payments
select
    row_number() over (order by o.order_id),
    o.order_id,
    o.order_date + 1,
    case when o.order_id % 4 = 0 then 'UPI'
         when o.order_id % 4 = 1 then 'Card'
         when o.order_id % 4 = 2 then 'NetBanking'
         else 'Wallet' end,
    round(coalesce(t.total,0) * (1 - o.discount_pct/100.0), 2),
    case when o.status = 'cancelled' then 'failed'
         when o.status = 'returned' then 'refunded'
         else 'paid' end
from orders o
left join (
    select order_id, sum(quantity * unit_price) as total
    from order_items group by order_id
) t on o.order_id = t.order_id;

-- Intentionally imperfect raw data for data-cleaning and duplicate exercises.
create table raw_orders (
    raw_row_id int primary key,
    order_id int,
    customer_id int,
    order_date_text varchar(30),
    status varchar(30),
    notes varchar(100)
);

insert into raw_orders values
(1,1001,1,'2024-01-12','delivered','valid row'),
(2,1002,2,'2024-01-25','delivered','valid row'),
(3,1003,3,'2024-02-10','delivered','valid row'),
(4,1003,3,'2024-02-10','delivered','duplicate order row'),
(5,1004,1,'2024-02-18',' DELIVERED ','extra spaces and inconsistent case'),
(6,1005,4,'2024-03-02','cancelled','valid row'),
(7,1006,5,'not-a-date','delivered','invalid date text'),
(8,1007,6,null,'returned','missing date'),
(9,1008,null,'2024-04-05','delivered','missing customer'),
(10,1009,7,'2024-04-22',null,'missing status'),
(11,1010,8,'2024-05-11','delivered','valid row'),
(12,1011,9,'2024-05-29','Delivered','inconsistent case'),
(13,1012,10,'2024-06-09','delivered','valid row'),
(14,1013,3,'2024-06-25','delivered','valid row'),
(15,1014,11,'2024-07-08','cancelled','valid row');

create table website_visits (
    visit_id int primary key,
    customer_id int references customers(customer_id),
    visit_date date,
    source varchar(30),
    converted boolean
);

insert into website_visits values
(1,1,'2024-01-10','organic',true),
(2,2,'2024-01-20','paid_search',true),
(3,3,'2024-02-08','organic',true),
(4,4,'2024-02-25','social',false),
(5,5,'2024-03-14','paid_search',true),
(6,6,'2024-03-25','social',true),
(7,7,'2024-04-20','organic',true),
(8,8,'2024-05-08','email',true),
(9,9,'2024-05-25','paid_search',true),
(10,10,'2024-06-06','social',true),
(11,11,'2024-07-05','email',false),
(12,12,'2024-07-19','organic',true),
(13,13,'2024-08-10','paid_search',true),
(14,14,'2024-08-29','social',true),
(15,15,'2024-09-15','organic',true),
(16,16,'2024-10-24','email',false),
(17,17,'2024-11-12','paid_search',true),
(18,18,'2024-11-30','social',true),
(19,19,'2025-01-12','organic',true),
(20,20,'2025-02-17','email',true),
(21,21,'2025-03-20','paid_search',false),
(22,22,'2025-04-13','social',true),
(23,23,'2025-05-16','organic',true),
(24,24,'2025-06-23','email',false),
(25,25,'2025-07-10','paid_search',true),
(26,26,'2025-08-25','social',true),
(27,27,'2025-09-14','organic',true),
(28,28,'2025-10-04','email',true),
(29,29,'2025-11-08','paid_search',true),
(30,30,'2025-12-05','social',true),
(31,1,'2025-01-05','email',true),
(32,2,'2025-03-01','organic',true),
(33,3,'2025-08-01','paid_search',true),
(34,7,'2025-12-18','email',true),
(35,9,'2025-05-01','organic',true),
(36,4,'2025-02-28','social',false);

create table campaign_events (
    event_id int primary key,
    campaign_name varchar(50),
    event_date date,
    impressions int,
    clicks int,
    conversions int,
    spend numeric(10,2)
);

insert into campaign_events values
(1,'Spring Sale','2024-03-01',12000,720,90,18000),
(2,'Summer Sale','2024-06-01',15000,900,105,22500),
(3,'Festive Sale','2024-10-01',22000,1540,220,36000),
(4,'Winter Sale','2024-12-01',18000,990,130,27000),
(5,'New Year','2025-01-01',25000,1750,260,40000),
(6,'Valentine Offer','2025-02-01',14000,840,95,21000),
(7,'Summer Sale','2025-05-01',20000,1300,190,32000),
(8,'Monsoon Offer','2025-07-01',16000,880,120,24000),
(9,'Festive Sale','2025-10-01',30000,2100,310,45000),
(10,'Winter Sale','2025-12-01',28000,1680,240,42000);

-- Consecutive-date practice table, designed to return results for streak questions.
create table daily_activity (
    activity_id int primary key,
    activity_date date,
    activity_type varchar(30),
    activity_count int
);

insert into daily_activity values
(1,'2025-01-01','login',4),
(2,'2025-01-02','login',7),
(3,'2025-01-03','purchase',2),
(4,'2025-01-04','login',5),
(5,'2025-01-05','purchase',3),
(6,'2025-01-08','login',6),
(7,'2025-01-09','login',8),
(8,'2025-01-10','purchase',4),
(9,'2025-02-01','login',3),
(10,'2025-02-02','login',5);

-- Quick checks: each SELECT should return rows.
select 'customers' as table_name, count(*) as row_count from customers
union all select 'products', count(*) from products
union all select 'employees', count(*) from employees
union all select 'orders', count(*) from orders
union all select 'order_items', count(*) from order_items
union all select 'payments', count(*) from payments
union all select 'raw_orders', count(*) from raw_orders
union all select 'website_visits', count(*) from website_visits
union all select 'campaign_events', count(*) from campaign_events
union all select 'daily_activity', count(*) from daily_activity;

select * from customers;

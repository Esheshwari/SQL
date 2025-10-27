Create database restaurant;
use restaurant;
create table customers(
customer_id int primary key,
customer_name varchar(100),
customer_address varchar(150),
customer_contact INT);
create table order1(
order_id INT Primary key,
order_name varchar(100),
billing_price decimal(10,2),
customer_id INT,
Foreign key (customer_id) references customers(customer_id));
create table menu(
Items_id int primary key,
items_name varchar(100),
items_availablity int,
items_price decimal (10,2),
items_sold int);
create table Employees(
employee_id int primary key,
employee_name varchar(100),
joining_date date);
INSERT INTO customers VALUES
(1, 'vikas', 'Bengaluru', 778900000),
(2, 'ananya', 'mumbai', 890000000),
(3, 'advait', 'chennai', 678900000),
(4, 'harsha', 'ranchi', 678900000),
(5, 'swayam', 'patna', 567000000);

INSERT INTO order1 VALUES
(10, 'Burrito', 999.70, 1),
(11, 'sandwich', 70.67, 2),
(12, 'Briyani', 86.97, 3),
(13, 'paratha', 90.77, 4),
(14, 'Noodles', 100.00, 5);

INSERT INTO menu VALUES 
(101, 'sandwich', 5, 70.67, 5),
(102, 'Burrito', 10, 999.70, 6),
(103, 'Briyani', 15, 86.97, 7),
(104, 'Paratha', 20, 90.77, 8),
(105, 'Noodles', 10, 100.00, 9);

INSERT INTO employees VALUES
(202, 'aarav', '2025-09-18'),
(203, 'aakarsh', '2025-08-17'),
(204, 'aanand', '2025-07-16'),
(205, 'aashish', '2025-01-11'),
(206, 'abhinand', '2025-02-12');

-- Order details with customer names using INNER JOIN
SELECT 
    o.order_id,
    o.order_name,
    o.billing_price,
    c.customer_name
FROM 
    order1 o
INNER JOIN 
    customers c ON o.customer_id = c.customer_id;

-- All menu items and their corresponding order using LEFT OUTER JOIN
SELECT 
    m.items_id,
    m.items_name,
    m.items_price,
    o.order_id,
    o.order_name
FROM 
    menu m
LEFT JOIN 
    order1 o ON m.items_name = o.order_name;
    
-- Total quantity of items sold per item name using GROUP By
SELECT 
    items_name,
    SUM(items_sold) AS total_quantity_sold
FROM 
    menu
GROUP BY 
    items_name;
 
 -- highest total amount from all the orders
 SELECT 
    MAX(billing_price) AS highest_order_amount
FROM 
    order1;
    
-- Average item price from the menu
SELECT 
    AVG(items_price) AS average_item_price
FROM 
    menu;



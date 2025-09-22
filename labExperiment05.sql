-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.
create database lab05;
use lab05;

-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Write your code below this line along with the output 
-- root@localhost	Esha	9.4.0	2025-09-22 11:31:46
-- table 01: Customers
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50)

-- insert 5 records
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Aarav', 'Bangalore'),
(2, 'Meera', 'Delhi'),
(3, 'Rohan', 'Bangalore'),
(4, 'Sneha', 'Mumbai'),
(5, 'Kiran', 'Chennai');


-- TABLE:02 Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
(101, 1, 'Laptop', '2025-09-01'),
(102, 2, 'Tablet', '2025-09-05'),
(103, 1, 'Mouse', '2025-09-10'),
(104, 3, 'Keyboard', '2025-09-15'),
(105, 2, 'Monitor', '2025-09-20');


-- TASK FOR STUDENTS 

 
-- Write and Execute Queries

-- 1. Inner Join – 
--    Find all orders placed by customers from the city "Bangalore."
SELECT c.customer_name, o.product_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.city = 'Bangalore';


--    List all customers with the products they ordered
SELECT c.customer_name, o.product_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;
-- output
-- Aarav	Laptop
-- Aarav	Mouse
-- Rohan	Keyboard


--    Show customer names and their order dates.
SELECT c.customer_name, o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;
-- output
-- Aarav	2025-09-01
-- Aarav	2025-09-10
-- Meera	2025-09-05
-- Meera	2025-09-20
-- Rohan	2025-09-15
--    Display order IDs with the corresponding customer names.
SELECT o.order_id, c.customer_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;
-- output
-- 101	Aarav
-- 103	Aarav
-- 102	Meera
-- 105	Meera
-- 104	Rohan
-- Number of orders per customer
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
-- output
-- Aarav	2
-- Meera	2
-- Rohan	1
-- City names with products ordered
SELECT c.city, o.product_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;
-- output
-- Bangalore	Laptop
-- Bangalore	Mouse
-- Delhi	Tablet
-- Delhi	Monitor
-- Bangalore	Keyboard
--  2  Left Outer Join – 
-- All customers and their orders
SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
-- output
-- Aarav	Laptop
-- Aarav	Mouse
-- Meera	Tablet
-- Meera	Monitor
-- Rohan	Keyboard
-- Sneha	
-- Kiran	
-- Customer IDs, names, and order IDs
SELECT c.customer_id, c.customer_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
-- output
-- 1	Aarav	101
-- 1	Aarav	103
-- 2	Meera	102
-- 2	Meera	105
-- 3	Rohan	104
-- 4	Sneha	
-- 5	Kiran	
-- Total orders per customer (including zero)
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
-- output
-- Aarav	2
-- Meera	2
-- Rohan	1
-- Sneha	0
-- Kiran	0
-- Customers with no orders
SELECT c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
-- output
-- Sneha
-- Kiran
-- Customer names with order dates
SELECT c.customer_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
-- output
-- Aarav	2025-09-01
-- Aarav	2025-09-10
-- Meera	2025-09-05
-- Meera	2025-09-20
-- Rohan	2025-09-15
-- Sneha	
-- Kiran	
-- Write your code below this line along with the output 

 
-- 3: Right Outer Join – 
-- All orders and their customers
SELECT o.order_id, c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
-- output
-- 101	Aarav
-- 103	Aarav
-- 102	Meera
-- 105	Meera
-- 104	Rohan
-- 	Sneha
-- 	Kiran
-- Product names with customers
SELECT o.product_name, c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
-- output
-- Laptop	Aarav
-- Mouse	Aarav
-- Tablet	Meera
-- Monitor	Meera
-- Keyboard	Rohan
-- 	Sneha
-- 	Kiran
-- Order IDs with customer cities
SELECT o.order_id, c.city
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
-- output
-- 101	Bangalore
-- 103	Bangalore
-- 102	Delhi
-- 105	Delhi
-- 104	Bangalore
-- 	Mumbai
-- 	Chennai
-- Number of orders per customer (include those without orders)
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name;
-- output
-- Aarav	2
-- Meera	2
-- Rohan	1
-- Sneha	0
-- Kiran	0
-- Customers without matching orders
SELECT c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;
-- output
-- Sneha
-- Kiran

-- 4: Full Outer Join – 
-- Find all customers and their orders, including those customers with no orders and orders without a customer.
        SELECT c.customer_id, c.customer_name, c.city, o.order_id, o.product_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, c.customer_name, c.city, o.order_id, o.product_name, o.order_date
FROM Orders o
LEFT JOIN Customers c ON c.customer_id = o.customer_id;
-- output
-- Sneha
-- Kiran
	-- List all customers and products, whether they placed an order or not.
SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_name, o.product_name
FROM Orders o
LEFT JOIN Customers c ON c.customer_id = o.customer_id;
-- output
-- Aarav	Mouse
-- Aarav	Laptop
-- Meera	Monitor
-- Meera	Tablet
-- Rohan	Keyboard
-- Sneha	
-- Kiran	
	-- Show customer IDs with order IDs (include unmatched ones).
   SELECT c.customer_id, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, o.order_id
FROM Orders o
LEFT JOIN Customers c ON c.customer_id = o.customer_id;
-- output
-- Aarav	Mouse
-- Aarav	Laptop
-- Meera	Monitor
-- Meera	Tablet
-- Rohan	Keyboard
-- Sneha	
-- Kiran	
	-- Display customer names with order dates.
    SELECT c.customer_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_name, o.order_date
FROM Orders o
LEFT JOIN Customers c ON c.customer_id = o.customer_id;
-- output 1	101
-- 1	103
-- 2	102
-- 2	105
-- 3	104
-- 4	
-- 5	
-- Find all unmatched records (customers without orders and orders without customers).
-- Customers without orders
SELECT c.customer_id, c.customer_name, 'No Order' AS status
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL

UNION

-- Orders without customers
SELECT o.customer_id, 'Unknown Customer' AS customer_name, 'No Match' AS status
FROM Orders o
LEFT JOIN Customers c ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;
-- output
-- 4	Sneha	No Order
-- 5	Kiran	No Order
        -- Show customer cities with products.
        SELECT c.city, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id

UNION

SELECT c.city, o.product_name
FROM Orders o
LEFT JOIN Customers c ON c.customer_id = o.customer_id;
-- output
-- 4	Sneha	No Order
-- 5	Kiran	No Order
   
-- 5: Natural Join – 
-- All orders placed by customers
SELECT * FROM Customers NATURAL JOIN Orders;
-- output
-- 1	Aarav	Bangalore	101	Laptop	2025-09-01
-- 2	Meera	Delhi	102	Tablet	2025-09-05
-- 1	Aarav	Bangalore	103	Mouse	2025-09-10
-- 3	Rohan	Bangalore	104	Keyboard	2025-09-15
-- 2	Meera	Delhi	105	Monitor	2025-09-20
-- Customers with products they ordered
SELECT customer_name, product_name
FROM Customers NATURAL JOIN Orders;
-- output
-- Aarav	Laptop
-- Meera	Tablet
-- Aarav	Mouse
-- Rohan	Keyboard
-- Meera	Monitor
-- Customer names with order dates
SELECT customer_name, order_date
FROM Customers NATURAL JOIN Orders;
-- output
-- Aarav	2025-09-01
-- Meera	2025-09-05
-- Aarav	2025-09-10
-- Rohan	2025-09-15
-- Meera	2025-09-20
-- Customer cities and products ordered
SELECT city, product_name
FROM Customers NATURAL JOIN Orders;
-- output
-- Bangalore	Laptop
-- Delhi	Tablet
-- Bangalore	Mouse
-- Bangalore	Keyboard
-- Delhi	Monitor
-- for descending order of product name
Select * from orders;
select order_id, order_date, product_name from orders order by product_name desc;
-- output
-- 102	2025-09-05	Tablet
-- 103	2025-09-10	Mouse
-- 105	2025-09-20	Monitor
-- 101	2025-09-01	Laptop
-- 104	2025-09-15	Keyboard

-- for ascending order of product
Select * from orders;
select order_id, order_date, product_name from orders order by product_name asc;
-- output
-- 101	1	Laptop	2025-09-01
-- 102	2	Tablet	2025-09-05
-- 103	1	Mouse	2025-09-10
-- 104	3	Keyboard	2025-09-15
-- 105	2	Monitor	2025-09-20
			
  -- END OF THE EXPERIMENT

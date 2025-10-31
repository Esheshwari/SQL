CREATE DATABASE store_db;
USE store_db;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  item_id INT PRIMARY KEY,
  order_id INT,
  product VARCHAR(100),
  qty INT,
  price DECIMAL(8,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers (name) VALUES ('Vikram'),('Neha'),('Isha');
INSERT INTO orders (customer_id,order_date,total_amount) VALUES
 (1,'2025-10-01',120.00),
 (2,'2025-10-02',250.00),
 (1,'2025-10-05',90.00);
INSERT INTO order_items (order_id,product,qty,price) VALUES
 (1,'Mouse',1,20.00),
 (1,'Book',2,50.00),
 (2,'Keyboard',1,250.00);

-- 1. Display customer names and their order dates using INNER JOIN.
SELECT c.name, o.order_date, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- 2. Display all customers including those who haven’t placed any orders using LEFT OUTER JOIN.
SELECT c.name, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 3. Show the total sales per customer using GROUP BY.
SELECT c.name, SUM(o.total_amount) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 4. Find the maximum order amount placed.
SELECT MAX(total_amount) AS max_order FROM orders;

-- 5. Display the average total amount of all orders.
SELECT AVG(total_amount) AS avg_order FROM orders;

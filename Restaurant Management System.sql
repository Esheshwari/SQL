CREATE DATABASE restaurant_db;
USE restaurant_db;

CREATE TABLE menu (
  item_id INT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(7,2)
);

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  item_id INT,
  qty INT,
  total_amount DECIMAL(10,2),
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (item_id) REFERENCES menu(item_id)
);

INSERT INTO menu (name,price) VALUES ('Paneer Butter Masala',250),('Naan',40),('Gulab Jamun',60);
INSERT INTO customers (name) VALUES ('Ramesh'),('Sakshi');
INSERT INTO orders (customer_id,item_id,qty,total_amount,order_date) VALUES
 (1,1,1,250,'2025-10-10'),
 (1,2,2,80,'2025-10-10'),
 (2,3,3,180,'2025-10-11');

-- 1. Display order details along with customer names using INNER JOIN.
SELECT o.order_id, c.name AS customer, m.name AS item, o.qty, o.total_amount, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN menu m ON o.item_id = m.item_id;

-- 2. Display all menu items and their corresponding orders using LEFT OUTER JOIN.
SELECT m.name AS menu_item, o.order_id, o.qty, c.name AS customer
FROM menu m
LEFT JOIN orders o ON m.item_id = o.item_id
LEFT JOIN customers c ON o.customer_id = c.customer_id;

-- 3. Display the total quantity of items sold per item name using GROUP BY.
SELECT m.name, SUM(o.qty) AS total_qty_sold
FROM menu m
LEFT JOIN orders o ON m.item_id = o.item_id
GROUP BY m.item_id;

-- 4. Find the highest total amount from all orders.
SELECT MAX(total_amount) AS max_order FROM orders;

-- 5. Display the average item price from the menu.
SELECT AVG(price) AS avg_price FROM menu;

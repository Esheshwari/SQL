CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10,2),
  stock INT
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_lines (
  line_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  qty INT,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (name) VALUES ('User1'),('User2');
INSERT INTO products (name,price,stock) VALUES ('ProdA',100,50),('ProdB',200,30);
INSERT INTO orders (customer_id,order_date,total_amount) VALUES (1,'2025-10-01',300);
INSERT INTO order_lines (order_id,product_id,qty,price) VALUES (1,1,2,200);

-- Joins to show order details
SELECT o.order_id, c.name AS customer, ol.product_id, p.name AS product, ol.qty, ol.price
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
JOIN order_lines ol ON o.order_id=ol.order_id
JOIN products p ON ol.product_id=p.product_id;

-- Aggregate total sales per product
SELECT p.name, SUM(ol.qty*ol.price) AS total_sales
FROM products p
JOIN order_lines ol ON p.product_id = ol.product_id
GROUP BY p.product_id;

-- Procedure to add new order and update stock (simplified)
DROP PROCEDURE add_order;
DELIMITER $$
CREATE PROCEDURE add_order(IN p_cust INT, IN p_date DATE, IN p_prod INT, IN p_qty INT)
BEGIN
  DECLARE new_order INT;
  DECLARE price DECIMAL(10,2);
  SELECT price INTO price FROM products WHERE product_id=p_prod;
  INSERT INTO orders (customer_id,order_date,total_amount) VALUES (p_cust,p_date, price*p_qty);
  SET new_order = LAST_INSERT_ID();
  INSERT INTO order_lines (order_id,product_id,qty,price) VALUES (new_order,p_prod,p_qty,price);
  UPDATE products SET stock = stock - p_qty WHERE product_id = p_prod;
END$$
DELIMITER ;

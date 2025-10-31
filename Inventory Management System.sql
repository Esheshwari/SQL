CREATE DATABASE inventory_db;
USE inventory_db;

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  product_id INT,
  supplier_id INT,
  qty INT,
  order_date DATE,
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

INSERT INTO products (name) VALUES ('Bolt'),('Nut');
INSERT INTO suppliers (name) VALUES ('Sup1'),('Sup2');
INSERT INTO orders (product_id,supplier_id,qty,order_date) VALUES (1,1,100,'2025-09-01'),(2,2,200,'2025-09-05');

-- Join supplier and order tables
SELECT o.order_id, p.name AS product, s.name AS supplier, o.qty
FROM orders o
JOIN products p ON o.product_id = p.product_id
JOIN suppliers s ON o.supplier_id = s.supplier_id;

-- Calculate total quantity ordered per product
SELECT p.name, SUM(o.qty) AS total_ordered
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id;

-- Procedure to insert/update supply orders
DROP PROCEDURE add_supply_order;
DELIMITER $$
CREATE PROCEDURE add_supply_order(IN p_product INT, IN p_supplier INT, IN p_qty INT, IN p_date DATE)
BEGIN
  INSERT INTO orders (product_id,supplier_id,qty,order_date) VALUES (p_product,p_supplier,p_qty,p_date);
END$$
DELIMITER ;

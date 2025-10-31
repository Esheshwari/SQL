CREATE DATABASE mall_db;
USE mall_db;

CREATE TABLE shops (
  shop_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  name VARCHAR(100),
  shop_id INT,
  FOREIGN KEY (shop_id) REFERENCES shops(shop_id)
);

CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  shop_id INT,
  amount DECIMAL(10,2),
  sale_date DATE,
  FOREIGN KEY (shop_id) REFERENCES shops(shop_id)
);

INSERT INTO shops (name) VALUES ('ShopA'),('ShopB');
INSERT INTO employees (name,shop_id) VALUES ('E1',1),('E2',2);
INSERT INTO sales (shop_id,amount,sale_date) VALUES (1,5000,'2025-10-01'),(2,7000,'2025-10-02');

-- Total sales per shop
SELECT s.name, SUM(sa.amount) AS total_sales
FROM shops s
LEFT JOIN sales sa ON s.shop_id = sa.shop_id
GROUP BY s.shop_id;

-- Join employee and shop details
SELECT e.name AS employee, s.name AS shop FROM employees e JOIN shops s ON e.shop_id = s.shop_id;

-- Procedure to add/update sale
DROP PROCEDURE add_sale_mall;
DELIMITER $$
CREATE PROCEDURE add_sale_mall(IN p_shop INT, IN p_amount DECIMAL(10,2), IN p_date DATE)
BEGIN
  INSERT INTO sales (shop_id,amount,sale_date) VALUES (p_shop,p_amount,p_date);
END$$
DELIMITER ;

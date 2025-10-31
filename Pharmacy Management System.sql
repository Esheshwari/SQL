CREATE DATABASE pharmacy_db;
USE pharmacy_db;

CREATE TABLE medicines (
  med_id INT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(8,2),
  stock INT
);

CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  med_id INT,
  qty INT,
  sale_date DATE,
  FOREIGN KEY (med_id) REFERENCES medicines(med_id)
);

INSERT INTO medicines (name,price,stock) VALUES ('Paracetamol',10,100),('Cough Syrup',50,50);
INSERT INTO suppliers (name) VALUES ('SupA'),('SupB');
INSERT INTO sales (med_id,qty,sale_date) VALUES (1,5,'2025-10-10'),(2,2,'2025-10-11');

-- Calculate total sales per medicine (value)
SELECT m.name, SUM(s.qty * m.price) AS total_sales_value, SUM(s.qty) AS total_qty_sold
FROM medicines m
LEFT JOIN sales s ON m.med_id = s.med_id
GROUP BY m.med_id;

-- Procedure to insert new sale and update stock
DROP PROCEDURE add_sale;
DELIMITER $$
CREATE PROCEDURE add_sale(IN p_med INT, IN p_qty INT, IN p_date DATE)
BEGIN
  INSERT INTO sales (med_id,qty,sale_date) VALUES (p_med,p_qty,p_date);
  UPDATE medicines SET stock = stock - p_qty WHERE med_id = p_med;
END$$
DELIMITER ;

CREATE DATABASE logistics_db;
USE logistics_db;

CREATE TABLE packages (
  package_id INT PRIMARY KEY,
  description VARCHAR(255)
);

CREATE TABLE couriers (
  courier_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE deliveries (
  delivery_id INT PRIMARY KEY,
  package_id INT,
  courier_id INT,
  delivery_date DATE,
  FOREIGN KEY (package_id) REFERENCES packages(package_id),
  FOREIGN KEY (courier_id) REFERENCES couriers(courier_id)
);

INSERT INTO packages (description) VALUES ('Electronics'),('Clothes');
INSERT INTO couriers (name) VALUES ('CourierA'),('CourierB');
INSERT INTO deliveries (package_id,courier_id,delivery_date) VALUES (1,1,'2025-10-02'),(2,2,'2025-10-03');

-- Joins to show courier-package data
SELECT d.delivery_id, p.description, c.name AS courier, d.delivery_date
FROM deliveries d
JOIN packages p ON d.package_id = p.package_id
JOIN couriers c ON d.courier_id = c.courier_id;

-- Calculate total deliveries per courier
SELECT c.name, COUNT(d.delivery_id) AS total_deliveries
FROM couriers c
LEFT JOIN deliveries d ON c.courier_id = d.courier_id
GROUP BY c.courier_id;

-- Procedure to insert/update delivery records
DROP PROCEDURE IF EXISTS add_delivery;
DELIMITER $$
CREATE PROCEDURE add_delivery(IN p_package INT, IN p_courier INT, IN p_date DATE)
BEGIN
  INSERT INTO deliveries (package_id,courier_id,delivery_date) VALUES (p_package,p_courier,p_date);
END$$
DELIMITER ;

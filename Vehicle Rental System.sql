CREATE DATABASE rental_db;
USE rental_db;

CREATE TABLE vehicles (
  vehicle_id INT PRIMARY KEY,
  model VARCHAR(100),
  rent_per_day DECIMAL(8,2)
);

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE rentals (
  rental_id INT PRIMARY KEY,
  vehicle_id INT,
  customer_id INT,
  rent_start DATE,
  rent_end DATE,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO vehicles (model,rent_per_day) VALUES ('Swift',1000),('Innova',2500);
INSERT INTO customers (name) VALUES ('Kunal'),('Neeta');
INSERT INTO rentals (vehicle_id,customer_id,rent_start,rent_end,total_amount) VALUES
 (1,1,'2025-10-01','2025-10-03',3000),
 (2,2,'2025-10-05','2025-10-07',7500);

-- 1. Display customer names and vehicle models using INNER JOIN.
SELECT c.name, v.model, r.total_amount
FROM rentals r
JOIN customers c ON r.customer_id = c.customer_id
JOIN vehicles v ON r.vehicle_id = v.vehicle_id;

-- 2. Display all customers and rentals using LEFT OUTER JOIN.
SELECT c.name, r.rental_id, v.model
FROM customers c
LEFT JOIN rentals r ON c.customer_id = r.customer_id
LEFT JOIN vehicles v ON r.vehicle_id = v.vehicle_id;

-- 3. Display the total number of rentals per vehicle using GROUP BY.
SELECT v.model, COUNT(r.rental_id) AS rentals_count
FROM vehicles v
LEFT JOIN rentals r ON v.vehicle_id = r.vehicle_id
GROUP BY v.vehicle_id;

-- 4. Find the total rent amount collected.
SELECT SUM(total_amount) AS total_collected FROM rentals;

-- 5. Find the average rent per vehicle.
SELECT AVG(total_amount) AS avg_rent FROM rentals;

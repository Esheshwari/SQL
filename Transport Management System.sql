CREATE DATABASE transport_db;
USE transport_db;

CREATE TABLE drivers (
  driver_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE vehicles (
  vehicle_id INT PRIMARY KEY,
  reg_no VARCHAR(50)
);

CREATE TABLE trips (
  trip_id INT PRIMARY KEY,
  driver_id INT,
  vehicle_id INT,
  distance_km DECIMAL(8,2),
  trip_date DATE,
  FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

INSERT INTO drivers (name) VALUES ('D1'),('D2');
INSERT INTO vehicles (reg_no) VALUES ('KA01AB1234'),('KA02BC5678');
INSERT INTO trips (driver_id,vehicle_id,distance_km,trip_date) VALUES (1,1,120.5,'2025-10-01'),(2,2,80.0,'2025-10-02');

-- Total distance per driver
SELECT d.name, SUM(t.distance_km) AS total_distance
FROM drivers d
LEFT JOIN trips t ON d.driver_id = t.driver_id
GROUP BY d.driver_id;

-- Procedure for inserting/updating trip records
DROP PROCEDURE add_trip;
DELIMITER $$
CREATE PROCEDURE add_trip(IN p_driver INT, IN p_vehicle INT, IN p_dist DECIMAL(8,2), IN p_date DATE)
BEGIN
  INSERT INTO trips (driver_id,vehicle_id,distance_km,trip_date) VALUES (p_driver,p_vehicle,p_dist,p_date);
END$$
DELIMITER ;

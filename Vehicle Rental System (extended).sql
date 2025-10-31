-- use rental_db
USE rental_db;

-- Join display rental information
SELECT r.rental_id, c.name AS customer, v.model, r.rent_start, r.rent_end, r.total_amount
FROM rentals r
JOIN customers c ON r.customer_id = c.customer_id
JOIN vehicles v ON r.vehicle_id = v.vehicle_id;

-- Aggregate total rent per customer
SELECT c.name, SUM(r.total_amount) AS total_rent
FROM customers c
LEFT JOIN rentals r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- Procedure for new rental and update return date
DROP PROCEDURE new_rental;
DELIMITER $$
CREATE PROCEDURE new_rental(IN p_vehicle INT, IN p_customer INT, IN p_start DATE, IN p_end DATE, IN p_amount DECIMAL(10,2))
BEGIN
  INSERT INTO rentals (vehicle_id,customer_id,rent_start,rent_end,total_amount) VALUES (p_vehicle,p_customer,p_start,p_end,p_amount);
END$$
DELIMITER ;

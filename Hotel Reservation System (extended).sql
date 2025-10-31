-- use hotel_db
USE hotel_db;

-- Insert 5 sample records each (rooms, guests, bookings)
INSERT INTO rooms (room_type,price) VALUES ('Single',2000),('Family',7000);
INSERT INTO guests (name) VALUES ('Alex'),('Maya'),('Dev');
INSERT INTO bookings (room_id,guest_id,check_in,check_out,amount) VALUES
 (3,3,'2025-10-12','2025-10-13',2000),(4,1,'2025-10-14','2025-10-17',21000);

-- Calculate total bookings per room
SELECT r.room_type, COUNT(b.booking_id) AS total_bookings
FROM rooms r
LEFT JOIN bookings b ON r.room_id = b.room_id
GROUP BY r.room_id;

-- Procedure to insert/update reservation
DROP PROCEDURE add_reservation;
DELIMITER $$
CREATE PROCEDURE add_reservation(IN p_room INT, IN p_guest INT, IN p_checkin DATE, IN p_checkout DATE, IN p_amount DECIMAL(10,2))
BEGIN
  INSERT INTO bookings (room_id,guest_id,check_in,check_out,amount) VALUES (p_room,p_guest,p_checkin,p_checkout,p_amount);
END$$
DELIMITER ;

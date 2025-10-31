CREATE DATABASE hotel_db;
USE hotel_db;

CREATE TABLE rooms (
  room_id INT PRIMARY KEY,
  room_type VARCHAR(50),
  price DECIMAL(8,2)
);

CREATE TABLE guests (
  guest_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE bookings (
  booking_id INT PRIMARY KEY,
  room_id INT,
  guest_id INT,
  check_in DATE,
  check_out DATE,
  amount DECIMAL(10,2),
  FOREIGN KEY (room_id) REFERENCES rooms(room_id),
  FOREIGN KEY (guest_id) REFERENCES guests(guest_id)
);

INSERT INTO rooms (room_type,price) VALUES ('Deluxe',5000),('Standard',3000),('Suite',8000);
INSERT INTO guests (name) VALUES ('Sonia'),('Ravi');
INSERT INTO bookings (room_id,guest_id,check_in,check_out,amount) VALUES
 (1,1,'2025-10-10','2025-10-12',10000),
 (2,2,'2025-10-11','2025-10-13',6000);

-- 1. Display guest names and room types using INNER JOIN.
SELECT g.name AS guest, r.room_type, b.check_in, b.check_out
FROM bookings b
JOIN guests g ON b.guest_id = g.guest_id
JOIN rooms r ON b.room_id = r.room_id;

-- 2. Display all rooms and their bookings using LEFT OUTER JOIN.
SELECT r.room_type, b.booking_id, g.name AS guest
FROM rooms r
LEFT JOIN bookings b ON r.room_id = b.room_id
LEFT JOIN guests g ON b.guest_id = g.guest_id;

-- 3. Display the number of bookings per room type using GROUP BY.
SELECT r.room_type, COUNT(b.booking_id) AS bookings_count
FROM rooms r
LEFT JOIN bookings b ON r.room_id = b.room_id
GROUP BY r.room_type;

-- 4. Find the maximum room price.
SELECT MAX(price) AS max_price FROM rooms;

-- 5. Find the total revenue from all bookings.
SELECT SUM(amount) AS total_revenue FROM bookings;

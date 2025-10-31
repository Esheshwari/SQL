CREATE DATABASE airline_db;
USE airline_db;

CREATE TABLE flights (
  flight_id INT PRIMARY KEY,
  flight_no VARCHAR(20),
  date DATE
);

CREATE TABLE passengers (
  passenger_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE bookings (
  booking_id INT PRIMARY KEY,
  flight_id INT,
  passenger_id INT,
  seat_no VARCHAR(10),
  FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
  FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
);

INSERT INTO flights (flight_no,date) VALUES ('AI101','2025-11-01'),('SG202','2025-11-02');
INSERT INTO passengers (name) VALUES ('A','B');
INSERT INTO bookings (flight_id,passenger_id,seat_no) VALUES (1,1,'12A'),(1,2,'12B');

-- Display passenger-flight info
SELECT p.name, f.flight_no, f.date, b.seat_no
FROM bookings b
JOIN passengers p ON b.passenger_id = p.passenger_id
JOIN flights f ON b.flight_id = f.flight_id;

-- Total passengers per flight
SELECT f.flight_no, COUNT(b.booking_id) AS passengers
FROM flights f
LEFT JOIN bookings b ON f.flight_id = b.flight_id
GROUP BY f.flight_id;

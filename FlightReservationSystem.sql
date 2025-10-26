CREATE DATABASE FlightDB;
USE FlightDB;

CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(30)
);

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    flight_name VARCHAR(50),
    source VARCHAR(30),
    destination VARCHAR(30)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    seat_no VARCHAR(10),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

INSERT INTO Passengers VALUES
(1,'Amit','Delhi'),(2,'Sneha','Mumbai');
INSERT INTO Flights VALUES
(101,'AI101','Delhi','Bangalore'),(102,'AI102','Mumbai','Kolkata');
INSERT INTO Bookings VALUES
(1,1,101,'2025-01-20','A12'),
(2,2,102,'2025-01-22','B10');

-- Total passengers per flight
SELECT f.flight_name, COUNT(b.passenger_id) AS Total_Passengers
FROM Flights f
JOIN Bookings b ON f.flight_id=b.flight_id
GROUP BY f.flight_name;

-- Procedure: Update booking
DELIMITER //
CREATE PROCEDURE UpdateSeat(IN bid INT, IN new_seat VARCHAR(10))
BEGIN
    UPDATE Bookings SET seat_no = new_seat WHERE booking_id = bid;
END //
DELIMITER ;

CALL UpdateSeat(1,'A15');

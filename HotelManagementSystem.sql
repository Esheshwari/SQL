CREATE DATABASE HotelDB;
USE HotelDB;

CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    guest_name VARCHAR(50),
    city VARCHAR(30)
);

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(30),
    rate DECIMAL(10,2)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

INSERT INTO Guests VALUES (1,'Rahul','Pune'),(2,'Neha','Delhi');
INSERT INTO Rooms VALUES (101,'Deluxe',4000),(102,'Suite',6000);
INSERT INTO Bookings VALUES (1,1,101,'2025-02-01','2025-02-05'),(2,2,102,'2025-02-10','2025-02-12');

-- Total revenue per room type
SELECT r.room_type, COUNT(b.booking_id)*(r.rate) AS Total_Revenue
FROM Rooms r
JOIN Bookings b ON r.room_id=b.room_id
GROUP BY r.room_type;

-- Procedure: Insert booking
DELIMITER //
CREATE PROCEDURE InsertBooking(IN bid INT, IN gid INT, IN rid INT, IN cin DATE, IN cout DATE)
BEGIN
    INSERT INTO Bookings VALUES(bid,gid,rid,cin,cout);
END //
DELIMITER ;

CALL InsertBooking(3,1,102,'2025-03-01','2025-03-03');

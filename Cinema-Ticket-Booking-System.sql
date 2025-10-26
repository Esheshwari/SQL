CREATE DATABASE CinemaDB;
USE CinemaDB;

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(50),
    genre VARCHAR(30)
);

CREATE TABLE Shows (
    show_id INT PRIMARY KEY,
    movie_id INT,
    show_time TIME,
    show_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    show_id INT,
    customer_name VARCHAR(50),
    tickets INT,
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

INSERT INTO Movies VALUES
(1,'Inception','Sci-Fi'),
(2,'Pathaan','Action');

INSERT INTO Shows VALUES
(101,1,'18:00:00','2025-02-10'),
(102,2,'20:00:00','2025-02-12');

INSERT INTO Bookings VALUES
(1,101,'Ravi',2),
(2,102,'Neha',4);

-- Count tickets per movie
SELECT m.movie_name, SUM(b.tickets) AS Total_Tickets
FROM Movies m
JOIN Shows s ON m.movie_id=s.movie_id
JOIN Bookings b ON s.show_id=b.show_id
GROUP BY m.movie_name;

-- Procedure: Update ticket count
DELIMITER //
CREATE PROCEDURE UpdateTickets(IN bid INT, IN new_count INT)
BEGIN
    UPDATE Bookings SET tickets = new_count WHERE booking_id = bid;
END //
DELIMITER ;

CALL UpdateTickets(1,3);

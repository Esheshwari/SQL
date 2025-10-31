CREATE DATABASE cinema_db;
USE cinema_db;

CREATE TABLE movies (
  movie_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(150)
);

CREATE TABLE shows (
  show_id INT PRIMARY KEY,
  movie_id INT,
  show_time DATETIME,
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

CREATE TABLE bookings (
  booking_id INT PRIMARY KEY,
  show_id INT,
  seats INT,
  booking_date DATE,
  FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

INSERT INTO movies (title) VALUES ('Movie A'),('Movie B');
INSERT INTO shows (movie_id,show_time) VALUES (1,'2025-11-01 18:00:00'),(2,'2025-11-01 20:00:00');
INSERT INTO bookings (show_id,seats,booking_date) VALUES (1,3,'2025-10-20'),(1,2,'2025-10-21');

-- Total tickets sold per movie
SELECT m.title, SUM(b.seats) AS tickets_sold
FROM movies m
LEFT JOIN shows s ON m.movie_id = s.movie_id
LEFT JOIN bookings b ON s.show_id = b.show_id
GROUP BY m.movie_id;

-- Use date functions for show schedules (shows in next 7 days)
SELECT * FROM shows WHERE show_time BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY);

-- Procedure to insert/update booking
DROP PROCEDURE add_booking;
DELIMITER $$
CREATE PROCEDURE add_booking(IN p_show INT, IN p_seats INT, IN p_date DATE)
BEGIN
  INSERT INTO bookings (show_id,seats,booking_date) VALUES (p_show,p_seats,p_date);
END$$
DELIMITER ;

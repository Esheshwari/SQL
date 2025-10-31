CREATE DATABASE event_db;
USE event_db;

CREATE TABLE events (
  event_id INT PRIMARY KEY,
  title VARCHAR(150),
  event_date DATE
);

CREATE TABLE participants (
  participant_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE registrations (
  reg_id INT PRIMARY KEY,
  event_id INT,
  participant_id INT,
  reg_date DATE,
  FOREIGN KEY (event_id) REFERENCES events(event_id),
  FOREIGN KEY (participant_id) REFERENCES participants(participant_id)
);

INSERT INTO events (title,event_date) VALUES ('Hackathon','2025-12-01'),('Seminar','2025-11-15');
INSERT INTO participants (name) VALUES ('P1'),('P2');
INSERT INTO registrations (event_id,participant_id,reg_date) VALUES (1,1,'2025-10-01'),(1,2,'2025-10-02');

-- Participants per event
SELECT e.title, COUNT(r.reg_id) AS participants
FROM events e
LEFT JOIN registrations r ON e.event_id = r.event_id
GROUP BY e.event_id;

-- Upcoming events using date functions
SELECT * FROM events WHERE event_date >= CURDATE();

-- Procedure for registration
DROP PROCEDURE IF EXISTS add_registration;
DELIMITER $$
CREATE PROCEDURE add_registration(IN p_event INT, IN p_participant INT, IN p_date DATE)
BEGIN
  INSERT INTO registrations (event_id,participant_id,reg_date) VALUES (p_event,p_participant,p_date);
END$$
DELIMITER ;

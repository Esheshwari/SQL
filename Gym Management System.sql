CREATE DATABASE gym_db;
USE gym_db;

CREATE TABLE members (
  member_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE trainers (
  trainer_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE sessions (
  session_id INT PRIMARY KEY,
  member_id INT,
  trainer_id INT,
  session_date DATE,
  FOREIGN KEY (member_id) REFERENCES members(member_id),
  FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id)
);

INSERT INTO members (name) VALUES ('M1'),('M2');
INSERT INTO trainers (name) VALUES ('T1'),('T2');
INSERT INTO sessions (member_id,trainer_id,session_date) VALUES (1,1,'2025-10-05'),(2,2,'2025-10-06');

-- List trainer-member details
SELECT tr.name AS trainer, m.name AS member, s.session_date
FROM sessions s
JOIN trainers tr ON s.trainer_id = tr.trainer_id
JOIN members m ON s.member_id = m.member_id;

-- Aggregate session counts
SELECT trainer_id, COUNT(*) AS sessions_count FROM sessions GROUP BY trainer_id;

-- Procedure to insert/update session
DROP PROCEDURE add_session;
DELIMITER $$
CREATE PROCEDURE add_session(IN p_member INT, IN p_trainer INT, IN p_date DATE)
BEGIN
  INSERT INTO sessions (member_id,trainer_id,session_date) VALUES (p_member,p_trainer,p_date);
END$$
DELIMITER ;

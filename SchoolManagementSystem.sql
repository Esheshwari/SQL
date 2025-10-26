CREATE DATABASE SchoolDB;
USE SchoolDB;

CREATE TABLE Classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(20)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(30),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Classes VALUES (1,'10A'),(2,'10B');
INSERT INTO Students VALUES
(1,'Rohit',1),(2,'Sneha',2),(3,'Aditi',1);
INSERT INTO Marks VALUES
(1,1,'Math',85),(2,2,'Math',90),(3,3,'Science',80);

-- Class-wise average marks
SELECT c.class_name, AVG(m.marks) AS Avg_Marks
FROM Classes c
JOIN Students s ON c.class_id=s.class_id
JOIN Marks m ON s.student_id=m.student_id
GROUP BY c.class_name;

-- Procedure: Insert student
DELIMITER //
CREATE PROCEDURE InsertStudent(IN sid INT, IN sname VARCHAR(50), IN cid INT)
BEGIN
    INSERT INTO Students VALUES(sid,sname,cid);
END //
DELIMITER ;

CALL InsertStudent(4,'Kiran',2);

-- Procedure: Update marks
DELIMITER //
CREATE PROCEDURE UpdateMarks(IN mid INT, IN new_marks INT)
BEGIN
    UPDATE Marks SET marks = new_marks WHERE mark_id = mid;
END //
DELIMITER ;

CALL UpdateMarks(1,88);

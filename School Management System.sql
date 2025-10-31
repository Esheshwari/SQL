CREATE DATABASE school_db;
USE school_db;

CREATE TABLE classes (
  class_id INT PRIMARY KEY,
  class_name VARCHAR(50)
);

CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(100),
  class_id INT,
  FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

CREATE TABLE marks (
  mark_id INT PRIMARY KEY,
  student_id INT,
  subject VARCHAR(100),
  marks INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO classes (class_name) VALUES ('10A'),('10B');
INSERT INTO students (name,class_id) VALUES ('Pooja',1),('Aman',1),('Zara',2);
INSERT INTO marks (student_id,subject,marks) VALUES
 (1,'Math',92),(1,'Eng',85),(2,'Math',88),(3,'Eng',78);

-- Class-wise average marks
SELECT c.class_name, AVG(m.marks) AS avg_marks
FROM classes c
LEFT JOIN students s ON c.class_id = s.class_id
LEFT JOIN marks m ON s.student_id = m.student_id
GROUP BY c.class_id;

-- Top-performing students (highest total marks)
SELECT s.name, SUM(m.marks) AS total_marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_id
ORDER BY total_marks DESC
LIMIT 5;

-- Procedure to insert/update marks
DROP PROCEDURE upsert_mark;
DELIMITER $$
CREATE PROCEDURE upsert_mark(IN p_student INT, IN p_subject VARCHAR(100), IN p_marks INT)
BEGIN
  IF EXISTS (SELECT 1 FROM marks WHERE student_id=p_student AND subject=p_subject) THEN
    UPDATE marks SET marks = p_marks WHERE student_id=p_student AND subject=p_subject;
  ELSE
    INSERT INTO marks (student_id,subject,marks) VALUES (p_student,p_subject,p_marks);
  END IF;
END$$
DELIMITER ;

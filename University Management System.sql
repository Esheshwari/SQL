CREATE DATABASE uni_db;
USE uni_db;

CREATE TABLE instructors (
  instructor_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  title VARCHAR(100),
  instructor_id INT,
  FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

CREATE TABLE enrollments (
  enroll_id INT PRIMARY KEY,
  student_name VARCHAR(100),
  course_id INT,
  grade DECIMAL(4,2),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO instructors (name) VALUES ('Prof A'),('Prof B');
INSERT INTO courses (title,instructor_id) VALUES ('ML',1),('OS',2);
INSERT INTO enrollments (student_name,course_id,grade) VALUES ('Stu1',1,8.5),('Stu2',1,9.0),('Stu3',2,7.0);

-- Total students per course
SELECT c.title, COUNT(e.enroll_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id;

-- List courses by instructor
SELECT i.name AS instructor, c.title
FROM instructors i
JOIN courses c ON i.instructor_id = c.instructor_id;

-- Procedure to insert/update enrollment
DROP PROCEDURE upsert_enrollment;
DELIMITER $$
CREATE PROCEDURE upsert_enrollment(IN p_student VARCHAR(100), IN p_course INT, IN p_grade DECIMAL(4,2))
BEGIN
  IF EXISTS (SELECT 1 FROM enrollments WHERE student_name=p_student AND course_id=p_course) THEN
    UPDATE enrollments SET grade=p_grade WHERE student_name=p_student AND course_id=p_course;
  ELSE
    INSERT INTO enrollments (student_name,course_id,grade) VALUES (p_student,p_course,p_grade);
  END IF;
END$$
DELIMITER ;

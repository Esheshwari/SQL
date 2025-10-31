CREATE DATABASE course_db;
USE course_db;

CREATE TABLE instructors (
  instructor_id INT PRIMARY KEY,
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
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO instructors (name) VALUES ('Inst1');
INSERT INTO courses (title,instructor_id) VALUES ('DataSci',1);
INSERT INTO enrollments (student_name,course_id) VALUES ('StuA',1),('StuB',1);

-- Total students per course
SELECT c.title, COUNT(e.enroll_id) AS students_count
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id;

-- List courses by instructor
SELECT i.name AS instructor, c.title
FROM instructors i
JOIN courses c ON i.instructor_id = c.instructor_id;

-- Procedure for adding/updating enrollments (similar pattern)

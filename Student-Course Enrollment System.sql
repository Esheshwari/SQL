CREATE DATABASE enroll_db;
USE enroll_db;

CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  title VARCHAR(100),
  fee DECIMAL(8,2)
);

CREATE TABLE enrollments (
  enroll_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  enroll_date DATE,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (name) VALUES ('Rita'),('Sam'),('Maya');
INSERT INTO courses (title,fee) VALUES ('DBMS',5000),('AI',8000),('Web',4500);
INSERT INTO enrollments (student_id,course_id,enroll_date) VALUES
 (1,1,'2025-08-10'),
 (2,1,'2025-08-12'),
 (3,2,'2025-08-15');

-- 1. Display student names and the courses they are enrolled in using INNER JOIN.
SELECT s.name AS student, c.title AS course
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

-- 2. Display all courses and enrolled students using LEFT OUTER JOIN.
SELECT c.title AS course, s.name AS student
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
LEFT JOIN students s ON e.student_id = s.student_id;

-- 3. Find the number of students enrolled per course using GROUP BY.
SELECT c.title, COUNT(e.student_id) AS num_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id;

-- 4. Find the average course fee across all courses.
SELECT AVG(fee) AS avg_fee FROM courses;

-- 5. Display the total number of students enrolled.
SELECT COUNT(DISTINCT student_id) AS total_students FROM enrollments;

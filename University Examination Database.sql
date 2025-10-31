CREATE DATABASE exam_db;
USE exam_db;

CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(100),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE marks (
  mark_id INT PRIMARY KEY,
  student_id INT,
  subject VARCHAR(100),
  marks INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO departments (name) VALUES ('CSE'),('ECE');
INSERT INTO students (name,dept_id) VALUES ('Tara',1),('Rohit',1),('Sima',2);
INSERT INTO marks (student_id,subject,marks) VALUES
 (1,'Math',85),(1,'DB',90),(2,'Math',78),(3,'ECE101',88);

-- 1. Display student names and their department names using INNER JOIN.
SELECT s.name AS student, d.name AS department
FROM students s
JOIN departments d ON s.dept_id = d.dept_id;

-- 2. Display all departments and students, even if a department has no students using LEFT OUTER JOIN.
SELECT d.name AS department, s.name AS student
FROM departments d
LEFT JOIN students s ON d.dept_id = s.dept_id;

-- 3. Display the average marks per subject using GROUP BY.
SELECT subject, AVG(marks) AS avg_marks
FROM marks
GROUP BY subject;

-- 4. Find the highest marks scored in any subject.
SELECT MAX(marks) AS highest_marks FROM marks;

-- 5. Find the total marks scored by all students.
SELECT SUM(marks) AS total_marks FROM marks;

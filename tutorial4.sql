-- SQL LAB ACTIVITY QUESTIONS — Employee Management System
-- Scenario:
-- TechNova Pvt Ltd. maintains employee and department records. Perform the following SQL
-- operations to manage and analyze the data.

-- 1. CREATE TABLES
-- Q1. Create two tables named Department and Employee with the following details:
-- Department:
--  dept_id (Primary Key)
--  dept_name
--  location
-- Employee:
--  emp_id (Primary Key)
--  emp_name
--  age
--  salary
--  designation
--  address
--  doj (date of joining)
--  dept_id (Foreign Key referencing Department table)

create database tutorial;
use tutorial;
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    age INT,
    salary DECIMAL(10,2),
    designation VARCHAR(50),
    address VARCHAR(100),
    doj DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
-- 2. INSERT DATA
-- Q2. Insert at least 5 employee records and 4 department records into the respective tables
-- with realistic values.
INSERT INTO Department VALUES
(101, 'HR', 'Mumbai'),
(102, 'Development', 'Bengaluru'),
(103, 'Sales', 'Delhi'),
(104, 'Marketing', 'Hyderabad');

INSERT INTO Employee VALUES
(1, 'Ananya Rao', 29, 55000, 'HR Executive', 'Mumbai', '2020-06-15', 101),
(2, 'Ravi Kumar', 32, 75000, 'Developer', 'Bengaluru', '2019-03-10', 102),
(3, 'Meera Shah', 27, 48000, 'Sales Associate', 'Delhi', '2021-08-01', 103),
(4, 'Karan Mehta', 35, 82000, 'Developer', 'Bengaluru', '2018-11-20', 102),
(5, 'Priya Nair', 30, 60000, 'Marketing Manager', 'Hyderabad', '2022-01-05', 104);
-- 3. UPDATE QUERY
-- Q3. The company has announced a ₹5000 salary increment for all employees working as
-- ‘Developer’.
-- Write an SQL query to update the salary accordingly.
update employee
set salary = salary+5000
where designation = 'Developer';
-- 4. SELECT with AGGREGATE FUNCTIONS
-- Q4. Display the total number of employees, average salary, highest salary, and lowest
-- salary for each department.
SELECT d.dept_name,
       COUNT(e.emp_id) AS total_employees,
       AVG(e.salary) AS avg_salary,
       MAX(e.salary) AS highest_salary,
       MIN(e.salary) AS lowest_salary
FROM Department d
JOIN Employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;
-- 5. SELECT with STRING FUNCTIONS
-- Q5. Display each employee’s name and designation in uppercase and also show a new
-- column combining their name and job title in a single sentence like:
-- “Ananya Rao works as HR Executive”.
SELECT UPPER(emp_name) AS name_uppercase,
       UPPER(designation) AS designation_uppercase,
       CONCAT(emp_name, ' works as ', designation) AS profile_summary
FROM Employee;
-- 6. SELECT with DATE FUNCTIONS
-- Q6. Write a query to display each employee’s joining year and the number of years they
-- have worked in the company till date.
SELECT emp_name,
       YEAR(doj) AS joining_year,
       TIMESTAMPDIFF(YEAR, doj, CURDATE()) AS years_worked
FROM Employee;
-- 7. SELECT using OPERATORS
-- Q7. List the names and salaries of employees whose salary is between ₹40,000 and
-- ₹80,000, excluding those who belong to the Sales department.
SELECT emp_name, salary
FROM Employee
WHERE salary BETWEEN 40000 AND 80000
  AND dept_id <> (
      SELECT dept_id FROM Department WHERE dept_name = 'Sales'
  );
-- 8. INNER JOIN QUERY
-- Q8. Write a query to display each employee’s name, designation, department name, and
-- location using an INNER JOIN between Employee and Department tables.
SELECT e.emp_name, e.designation, d.dept_name, d.location
FROM Employee e
INNER JOIN Department d ON e.dept_id = d.dept_id;
-- 9. LEFT OUTER JOIN QUERY
-- Q9. Display all employees and their department names using a LEFT OUTER JOIN.
-- (Include employees even if they are not assigned to any department.)
SELECT e.emp_name, d.dept_name
FROM Employee e
LEFT JOIN Department d ON e.dept_id = d.dept_id;
-- 10. RIGHT OUTER JOIN QUERY
-- Q10. Display all departments and the employees working in them using a RIGHT OUTER
-- JOIN.
-- (Include departments even if they currently have no employees.)
SELECT d.dept_name, e.emp_name
FROM Employee e
RIGHT JOIN Department d ON e.dept_id = d.dept_id;
-- 11. STORED PROCEDURE – INSERT
-- Q11. Create a stored procedure named InsertEmployee that accepts employee details as
-- parameters and inserts a new record into the Employee table.
-- Execute the procedure to insert a new employee record.
DELIMITER //
CREATE PROCEDURE InsertEmployee (
    IN eid INT, IN ename VARCHAR(100), IN eage INT, IN esalary DECIMAL(10,2),
    IN edesig VARCHAR(50), IN eaddr VARCHAR(100), IN edoj DATE, IN edept INT
)
BEGIN
    INSERT INTO Employee VALUES (eid, ename, eage, esalary, edesig, eaddr, edoj, edept);
END //
DELIMITER ;

-- Execute:
CALL InsertEmployee(6, 'Sahil Verma', 28, 62000, 'Developer', 'Bengaluru', '2023-04-12', 102);
-- 12. STORED PROCEDURE – UPDATE
-- Q12. Create a stored procedure named UpdateSalary that updates an employee’s salary
-- based on their emp_id.
-- Call the procedure to update a specific employee’s salary.
DELIMITER //
CREATE PROCEDURE UpdateSalary (
    IN eid INT, IN new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employee SET salary = new_salary WHERE emp_id = eid;
END //
DELIMITER ;

-- Execute:
CALL UpdateSalary(2, 80000);
-- 13. STORED PROCEDURE – DELETE
-- Q13. Create a stored procedure named DeleteEmployee that deletes an employee record
-- from the Employee table based on the given emp_id.
-- Call the procedure to remove an employee record.
DELIMITER //
CREATE PROCEDURE DeleteEmployee (
    IN eid INT
)
BEGIN
    DELETE FROM Employee WHERE emp_id = eid;
END //
DELIMITER ;

-- Execute:
CALL DeleteEmployee(5);
-- 14. COMPREHENSIVE QUERY
-- Q14. Display a report showing:
--  Employee Name
--  Department Name
--  Years Worked
--  Salary after increment
-- for all employees who have worked more than 2 years in the company.
SELECT e.emp_name,
       d.dept_name,
       TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) AS years_worked,
       CASE
           WHEN e.designation = 'Developer' THEN e.salary + 5000
           ELSE e.salary
       END AS salary_after_increment
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
WHERE TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) > 2;
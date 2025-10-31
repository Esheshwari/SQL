CREATE DATABASE payroll_db;
USE payroll_db;

CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(100)
);

CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  name VARCHAR(100),
  dept_id INT,
  salary DECIMAL(10,2),
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE salaries (
  sal_id INT PRIMARY KEY,
  emp_id INT,
  amount DECIMAL(10,2),
  pay_date DATE,
  FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO departments (dept_name) VALUES ('HR'),('Engineering'),('Sales');
INSERT INTO employees (name,dept_id,salary) VALUES
 ('Alice',2,90000),
 ('Bob',3,60000),
 ('Carol',2,95000);
INSERT INTO salaries (emp_id,amount,pay_date) VALUES
 (1,90000,'2025-09-30'),
 (2,60000,'2025-09-30'),
 (3,95000,'2025-09-30');

-- 1. Display employee names along with their department names using INNER JOIN.
SELECT e.name AS employee, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- 2. List all departments and employees, even if some departments have no employees using RIGHT OUTER JOIN.
-- MySQL does not support RIGHT JOIN with the same clarity—use LEFT JOIN from employees to departments reversed:
SELECT d.dept_name, e.name AS employee
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id;

-- 3. Display the average salary per department using GROUP BY.
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_id;

-- 4. Find the maximum salary among all employees.
SELECT MAX(salary) AS max_salary FROM employees;

-- 5. Calculate the total salary expenditure of the company.
SELECT SUM(salary) AS total_payroll FROM employees;

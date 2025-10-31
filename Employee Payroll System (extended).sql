-- Use payroll_db
USE payroll_db;

-- Procedure to insert/update employee salary
DROP PROCEDURE upsert_salary;
DELIMITER $$
CREATE PROCEDURE upsert_salary(IN p_emp INT, IN p_salary DECIMAL(10,2))
BEGIN
  UPDATE employees SET salary = p_salary WHERE emp_id = p_emp;
END$$
DELIMITER ;

-- Show employee-department relationships (already shown earlier)
SELECT e.name, d.dept_name, e.salary FROM employees e JOIN departments d ON e.dept_id=d.dept_id;

-- Aggregate total and average salaries
SELECT SUM(salary) AS total_salaries, AVG(salary) AS avg_salary FROM employees;

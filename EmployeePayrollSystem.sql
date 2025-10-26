CREATE DATABASE PayrollDB;
USE PayrollDB;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Departments VALUES
(1,'HR'),(2,'IT'),(3,'Finance');

INSERT INTO Employees VALUES
(101,'Rohit',2,60000),(102,'Ananya',1,50000),(103,'Vikas',3,55000);

-- Sum and avg salary per department
SELECT d.dept_name, SUM(e.salary) AS Total_Salary, AVG(e.salary) AS Avg_Salary
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- Procedure
DELIMITER //
CREATE PROCEDURE InsertEmployee(IN eid INT, IN ename VARCHAR(50), IN did INT, IN sal DECIMAL(10,2))
BEGIN
    INSERT INTO Employees VALUES(eid,ename,did,sal);
END //
DELIMITER ;

CALL InsertEmployee(104,'Priya',2,62000);

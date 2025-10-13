-- Lab Experiment 08: Implementation of Procedure ( insert, update and delete)
-- STUDENT NAME: Esheshwari Kumari
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : 11:24:00	SELECT USER(),         @@hostname AS Host_Name,         VERSION() AS MySQL_Version,         NOW() AS Current_Date_Time LIMIT 0, 50000	1 row(s) returned	0.015 sec / 0.000 sec


-- Scenario: Employee Management System
-- CREATE AND LOAD THE database DBLab008
Create database DBLab008;
use DBLab008;
-- Write your SQL query below Codespace:

-- Task 1: Create the Employee Table
-- Create a table to store information about Employee.
-- Include the following columns:
 --   empid INT PRIMARY KEY,
   -- empname VARCHAR(50),
   -- age INT,
   -- salary DECIMAL(10,2),
   -- designation VARCHAR(30),
   -- address VARCHAR(100),
   -- date_of_join DATE
   create table employee(
   empid INT PRIMARY KEY,
   empname VARCHAR(50),
   age INT,
   salary DECIMAL(10,2),
   designation VARCHAR(30),
   address VARCHAR(100),
   date_of_join DATE);

-- DESCRIBE THE SCHEMA -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

-- insert 10 records to the table 
-- Write your SQL query below Codespace:
insert into employee values
(101, 'Aarav Mehta', 28, 55000.00, 'Software Engineer', 'Bangalore, Karnataka', '2022-06-15'),
(102, 'Neha Sharma', 32, 62000.50, 'Data Analyst', 'Mumbai, Maharashtra', '2021-03-10'),
(103, 'Rohan Verma', 26, 48000.75, 'Web Developer', 'Delhi, India', '2023-01-20'),
(104, 'Isha Kapoor', 30, 70000.00, 'Project Manager', 'Hyderabad, Telangana', '2020-11-05'),
(105, 'Kunal Joshi', 35, 80000.00, 'Tech Lead', 'Pune, Maharashtra', '2019-08-25'),
(106, 'Sneha Reddy', 29, 53000.25, 'UI/UX Designer', 'Chennai, Tamil Nadu', '2022-04-18'),
(107, 'Aditya Rao', 31, 60000.00, 'QA Engineer', 'Kochi, Kerala', '2021-12-01'),
(108, 'Priya Nair', 27, 49000.00, 'Business Analyst', 'Ahmedabad, Gujarat', '2023-07-10'),
(109, 'Vikram Singh', 33, 75000.00, 'DevOps Engineer', 'Jaipur, Rajasthan', '2020-09-30'),
(110, 'Tanvi Desai', 25, 47000.00, 'Intern', 'Goa, India', '2024-02-05');

-- COPYPASTE OF THE OUTPUT in CSV Format and terminate with ;
select *from employee;
-- '101', 'Aarav Mehta', '28', '55000.00', 'Software Engineer', 'Bangalore, Karnataka', '2022-06-15'
-- '102', 'Neha Sharma', '32', '62000.50', 'Data Analyst', 'Mumbai, Maharashtra', '2021-03-10'
-- '103', 'Rohan Verma', '26', '48000.75', 'Web Developer', 'Delhi, India', '2023-01-20'
-- '104', 'Isha Kapoor', '30', '70000.00', 'Project Manager', 'Hyderabad, Telangana', '2020-11-05'
-- '105', 'Kunal Joshi', '35', '80000.00', 'Tech Lead', 'Pune, Maharashtra', '2019-08-25'
-- '106', 'Sneha Reddy', '29', '53000.25', 'UI/UX Designer', 'Chennai, Tamil Nadu', '2022-04-18'
-- '107', 'Aditya Rao', '31', '60000.00', 'QA Engineer', 'Kochi, Kerala', '2021-12-01'
-- '108', 'Priya Nair', '27', '49000.00', 'Business Analyst', 'Ahmedabad, Gujarat', '2023-07-10'
-- '109', 'Vikram Singh', '33', '75000.00', 'DevOps Engineer', 'Jaipur, Rajasthan', '2020-09-30'
-- '110', 'Tanvi Desai', '25', '47000.00', 'Intern', 'Goa, India', '2024-02-05'

-- perform the following procedures on the employee database and copy paste the output in the space provided
-- A. Insert Procedure

-- 1. Write a stored procedure named InsertEmployee to insert a new employee record into the Employee table with all fields as input parameters.
DELIMITER $$

CREATE PROCEDURE InsertEmployeeSimple (
    IN p_empid INT,
    IN p_empname VARCHAR(50),
    IN p_age INT,
    IN p_salary DECIMAL(10,2),
    IN p_designation VARCHAR(30),
    IN p_address VARCHAR(100),
    IN p_date_of_join DATE
)
BEGIN
    INSERT INTO employee VALUES (
        p_empid, p_empname, p_age, p_salary, p_designation, p_address, p_date_of_join
    );
END $$

DELIMITER ;
-- 2. Modify the insert procedure to ensure the employee’s age must be between 18 and 60.
      -- If not, display a message: "Invalid age, employee not added."
DELIMITER $$

CREATE PROCEDURE InsertEmployeeSimple2 (
    IN p_empid INT,
    IN p_empname VARCHAR(50),
    IN p_age INT,
    IN p_salary DECIMAL(10,2),
    IN p_designation VARCHAR(30),
    IN p_address VARCHAR(100),
    IN p_date_of_join DATE
)
BEGIN
if p_age between 18 and 60 then
    INSERT INTO employee VALUES (
        p_empid, p_empname, p_age, p_salary, p_designation, p_address, p_date_of_join
    );
    else 
    select "Invalid age, employee not added." as message;
    end if;
END $$

DELIMITER ;
-- 3. Create a procedure that inserts a new employee record.
          -- If the salary is not provided, assign a default salary of 20000.
DELIMITER $$

CREATE PROCEDURE InsertEmployeeSimpleSalary (
    IN p_empid INT,
    IN p_empname VARCHAR(50),
    IN p_age INT,
    IN p_salary DECIMAL(10,2),
    IN p_designation VARCHAR(30),
    IN p_address VARCHAR(100),
    IN p_date_of_join DATE
)
BEGIN
    DECLARE final_salary DECIMAL(10,2);
    SET final_salary = IFNULL(p_salary, 20000.00);
    INSERT INTO employee VALUES (
        p_empid, p_empname, p_age, p_salary, p_designation, p_address, p_date_of_join
    );
END $$

DELIMITER ;
-- 4. Write a procedure that inserts three new employee records in a single procedure using multiple INSERT statements.
DELIMITER $$

CREATE PROCEDURE InsertThreeEmployees()
BEGIN
    INSERT INTO employee VALUES (201, 'Raj Malhotra', 34, 65000.00, 'Manager', 'Delhi', '2022-01-01');
    INSERT INTO employee VALUES (202, 'Simran Kaur', 28, 48000.00, 'Analyst', 'Chandigarh', '2023-03-15');
    INSERT INTO employee VALUES (203, 'Aman Gupta', 25, 42000.00, 'Intern', 'Lucknow', '2024-07-20');
END $$

DELIMITER ;
-- B.  Update Procedure

-- Update Salary:
-- Write a stored procedure named UpdateSalary to update an employee’s salary based on their empid.
DELIMITER $$

CREATE PROCEDURE UpdateSalary (
    IN p_empid INT,
    IN p_new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE employee
    SET salary = p_new_salary
    WHERE empid = p_empid;
END $$

DELIMITER ;
-- Increment Salary by Percentage:
-- Create a procedure to increase the salary by 10% for all employees whose designation = 'Manager'.
DELIMITER $$

CREATE PROCEDURE IncrementManagerSalary ()
BEGIN
    UPDATE employee
    SET salary = salary * 1.10
    WHERE designation = 'Manager';
END $$

DELIMITER ;
-- Update Designation:
-- Write a procedure to update the designation of an employee by empid.
-- Example: Promote an employee from 'Clerk' to 'Senior Clerk'.
DELIMITER $$

CREATE PROCEDURE UpdateDesignation (
    IN p_empid INT,
    IN p_new_designation VARCHAR(30)
)
BEGIN
    UPDATE employee
    SET designation = p_new_designation
    WHERE empid = p_empid;
END $$

DELIMITER ;
-- Update Address:
-- Write a procedure to update the address of an employee when empid is given as input.
DELIMITER $$

CREATE PROCEDURE UpdateAddress (
    IN p_empid INT,
    IN p_new_address VARCHAR(100)
)
BEGIN
    UPDATE employee
    SET address = p_new_address
    WHERE empid = p_empid;
END $$

DELIMITER ;
-- Conditional Update (Age Check):
-- Create a procedure that updates salary only if the employee’s age > 40; otherwise, print "Not eligible for salary update."
DELIMITER $$

CREATE PROCEDURE ConditionalSalaryUpdate (
    IN p_empid INT,
    IN p_new_salary DECIMAL(10,2)
)
BEGIN
    DECLARE emp_age INT;

    SELECT age INTO emp_age
    FROM employee
    WHERE empid = p_empid;

    IF emp_age > 40 THEN
        UPDATE employee
        SET salary = p_new_salary
        WHERE empid = p_empid;
    ELSE
        SELECT 'Not eligible for salary update.' AS Message;
    END IF;
END $$

DELIMITER ;
-- C. Delete Procedure

-- Delete by empid:
-- Write a stored procedure named DeleteEmployee to delete an employee record using their empid.
DELIMITER $$

CREATE PROCEDURE DeleteEmployee (
    IN p_empid INT
)
BEGIN
    DELETE FROM employee
    WHERE empid = p_empid;
END $$

DELIMITER ;
-- Delete by Designation:
-- Create a procedure that deletes all employees belonging to a specific designation (e.g., 'Intern').
DELIMITER $$

CREATE PROCEDURE DeleteByDesignation (
    IN p_designation VARCHAR(30)
)
BEGIN
    DELETE FROM employee
    WHERE designation = p_designation;
END $$

DELIMITER ;
-- Delete Based on Salary Range:
-- Write a procedure to delete employees whose salary is less than ₹15000.
DELIMITER $$

CREATE PROCEDURE DeleteLowSalaryEmployees ()
BEGIN
    DELETE FROM employee
    WHERE salary < 15000;
END $$

DELIMITER ;
-- Delete by Joining Year:
-- Write a procedure to delete employees who joined before the year 2015.
DELIMITER $$

CREATE PROCEDURE DeleteOldJoiners ()
BEGIN
    DELETE FROM employee
    WHERE YEAR(date_of_join) < 2015;
END $$

DELIMITER ;
-- End of Lab Experiment 
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01

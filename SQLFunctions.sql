-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Esheshwari Kumari 
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- root@localhost	Esha	9.4.0	2025-09-08 11:30:13

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 
create database Office;
use Office;
create table Employee(
Employee_ID INT Primary Key,
F_Name varchar(50),
L_Name varchar(50),
Salary INT,
BirthDate date,
HireDate date);

-- 2. Insert 10 records to employee;
Insert into Employee values
(101, 'Aarav', 'Sharma', 55000, '1995-03-15', '2020-06-01'),
(102, 'Isha', 'Verma', 62000, '1992-07-22', '2019-04-15'),
(103, 'Rohan', 'Mehta', 58000, '1990-11-05', '2018-01-10'),
(104, 'Sneha', 'Patel', 60000, '1993-09-30', '2021-03-20'),
(105, 'Kunal', 'Reddy', 53000, '1996-12-12', '2022-08-05'),
(106, 'Neha', 'Singh', 57000, '1994-05-18', '2020-11-25'),
(107, 'Aditya', 'Joshi', 61000, '1991-02-28', '2017-07-12'),
(108, 'Priya', 'Kapoor', 59000, '1997-06-10', '2023-01-30'),
(109, 'Vikram', 'Nair', 64000, '1989-10-03', '2016-09-18'),
(110, 'Tanvi', 'Desai', 56000, '1998-04-25', '2022-05-14');



-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
create table orders(
OrderID INT,
OrderDate date,
totalAmount INT,
Employee_ID INT,
Foreign key (Employee_ID) References Employee(Employee_ID));
-- 4. Insert 10 records to Orders


insert into orders values(1,'2025-08-09',3400,101),
(2, '2025-09-02', 1800, 102),
(3, '2025-09-03', 3200, 103),
(4, '2025-09-04', 1500, 104),
(5, '2025-09-05', 2700, 105),
(6, '2025-09-06', 2100, 106),
(7, '2025-09-07', 3000, 107),
(8, '2025-09-08', 1900, 108),
(9, '2025-09-08', 3500, 109),
(10, '2025-09-08', 4000, 110);


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.

SELECT * FROM orders;

-- Output: 

-- 1	2025-08-09	3400	101
-- 2	2025-09-02	1800	102
-- 3	2025-09-03	3200	103
-- 4	2025-09-04	1500	104
-- 5	2025-09-05	2700	105
-- 6	2025-09-06	2100	106
-- 7	2025-09-07	3000	107
-- 8	2025-09-08	1900	108
-- 9	2025-09-08	3500	109
-- 10	2025-09-08	4000	110

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
select round(Salary) as ROUNDSALARY from Employee;

-- Output: 
-- 55000
-- 62000
-- 58000
-- 60000
-- 53000
-- 57000
-- 61000
-- 59000
-- 64000
-- 56000
/* b. Absolute Values: Show absolute values of salaries */
select ABS(Salary) as ABSOLUTESALARY from Employee;
-- Output: 
-- 55000
-- 62000
-- 58000
-- 60000
-- 53000
-- 57000
-- 61000
-- 59000
-- 64000
-- 56000
/* c. Ceiling Values: Get ceiling values of order amounts */
Select ceil(Salary) as CIELINGSALARY from Employee;
-- Output: 
-- 55000
-- 62000
-- 58000
-- 60000
-- 53000
-- 57000
-- 61000
-- 59000
-- 64000
-- 56000
-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
Select count(*) AS TOTALEMPLOYEES from Employee;

-- Output: 
-- '10'
Select count(*) AS TOTALEMPLOYEES from Employee where salary>60000;

-- Output: 
-- '3'

/* b. Sum of Salaries: Calculate total salary expense */
select sum(Salary) from Employee;
-- Output: 
-- 585000
/* c. Average Order Amount: Find average order value */
select Avg(totalAmount) from orders;
-- Output: 
-- 2742.8571
/* d. Max/Min Salary: Find highest and lowest salaries */
select min(Salary), max(Salary) from Employee;
-- Output: 
-- 53000	64000
-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
select f_name,l_name, upper(f_name), lower(l_name) from employee;
-- Output: 
-- Aarav	Sharma	AARAV	sharma
-- Isha	Verma	ISHA	verma
-- Rohan	Mehta	ROHAN	mehta
-- Sneha	Patel	SNEHA	patel
-- Kunal	Reddy	KUNAL	reddy
-- Neha	Singh	NEHA	singh
-- Aditya	Joshi	ADITYA	joshi
-- Priya	Kapoor	PRIYA	kapoor
-- Vikram	Nair	VIKRAM	nair
-- Tanvi	Desai	TANVI	desai
/* b. Concatenate Names: Create full names */
select concat(f_name, l_name) from Employee;
-- Output: 
-- AaravSharma
-- IshaVerma
-- RohanMehta
-- SnehaPatel
-- KunalReddy
-- NehaSingh
-- AdityaJoshi
-- PriyaKapoor
-- VikramNair
-- TanviDesai
/* c. Extract Substring: Get first 3 characters of first names */
select substr(f_name, 1,3) from Employee;
-- Output: 
Aar
Ish
Roh
Sne
Kun
Neh
Adi
Pri
Vik
Tan
-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert date to string: Convert text to DATE type */
select cast(OrderDate as char) as ConvertedDate from Orders;
-- Output: 
-- 2025-08-09
-- 2025-08-09
-- 2025-09-02
-- 2025-09-03
-- 2025-09-04
-- 2025-09-05
-- 2025-09-06
-- 2025-09-07
-- 2025-09-08
-- 2025-09-08
-- 2025-09-08
-- 2025-08-09
-- 2025-09-02
-- 2025-09-03
-- 2025-09-04
-- 2025-09-05
-- 2025-09-06
-- 2025-09-07
-- 2025-09-08
-- 2025-09-08
-- 2025-09-08
-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
Select Now();
-- Output: 
-- 2025-09-08 12:48:29
/* b. Extract Year: Get year from order dates */
select year(OrderDate) as Order_Year from Orders;
-- Output: 
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
-- 2025
/* c. Add Months: Add 3 months to order dates */
select date_add(OrderDate, Interval 3 Month) as FinalDate from Orders;
-- Output: 
-- 2025-11-09
-- 2025-11-09
-- 2025-12-02
-- 2025-12-03
-- 2025-12-04
-- 2025-12-05
-- 2025-12-06
-- 2025-12-07
-- 2025-12-08
-- 2025-12-08
-- 2025-12-08
-- 2025-11-09
-- 2025-12-02
-- 2025-12-03
-- 2025-12-04
-- 2025-12-05
-- 2025-12-06
-- 2025-12-07
-- 2025-12-08
-- 2025-12-08
-- 2025-12-08
/* d. Days Since Order: Calculate days between order date and now */
select OrderID, datediff(OrderDate, Now()) as DaysSinceOrder from Orders;
-- Output: 
-- 1	-30
-- 1	-30
-- 2	-6
-- 3	-5
-- 4	-4
-- 5	-3
-- 6	-2
-- 7	-1
-- 8	0
-- 9	0
-- 10	0
-- 1	-30
-- 2	-6
-- 3	-5
-- 4	-4
-- 5	-3
-- 6	-2
-- 7	-1
-- 8	0
-- 9	0
-- 10	0
-- To make the output positive
select OrderID, datediff(Now(), OrderDate) as DaysSinceOrder from Orders;
-- output
-- 1	30
-- 1	30
-- 2	6
-- 3	5
-- 4	4
-- 5	3
-- 6	2
-- 7	1
-- 8	0
-- 9	0
-- 10	0
-- 1	30
-- 2	6
-- 3	5
-- 4	4
-- 5	3
-- 6	2
-- 7	1
-- 8	0
-- 9	0
-- 10	0
-- END of the Task -- 

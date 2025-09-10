-- Activity:
-- 1. School Database (Example Tables) 
-- (StudentID, FirstName, LastName, DOB, Class, Marks, City)
-- (TeacherID, FirstName, LastName, Subject, HireDate, Salary)
-- (CourseID, CourseName, Credits)
-- (EnrollID, StudentID, CourseID, Grade)
-- 2. Declare the keys as per requirement
-- 3.   Perform the below SQL functions on the Student database. 
--       13. List students who were born in January. 
--       14. Find the difference in days between today and a teacher’s HireDate. 
--       15. Find the total number of students in the school. 
--       16. Calculate the average salary of teachers.
--       17. Find the highest and lowest marks in the Student table.
create database School;
use School;
-- Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Class VARCHAR(10),
    Marks INT,
    City VARCHAR(50)
);

-- Teacher Table
CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Subject VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

-- Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);

-- Enroll Table
CREATE TABLE Enroll (
    EnrollID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(5),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
-- Students
INSERT INTO Student VALUES
(1, 'Aarav', 'Sharma', '2008-01-15', '8A', 88, 'Delhi'),
(2, 'Isha', 'Verma', '2007-03-22', '9B', 92, 'Mumbai'),
(3, 'Kabir', 'Singh', '2008-01-05', '8A', 76, 'Bangalore'),
(4, 'Meera', 'Rao', '2006-07-30', '10C', 85, 'Chennai'),
(5, 'Rohan', 'Patel', '2007-11-11', '9A', 90, 'Ahmedabad');

-- Teachers
INSERT INTO Teacher VALUES
(101, 'Neha', 'Kapoor', 'Maths', '2015-06-01', 55000),
(102, 'Raj', 'Mehta', 'Science', '2016-08-15', 60000),
(103, 'Anita', 'Desai', 'English', '2014-01-10', 58000),
(104, 'Vikram', 'Joshi', 'History', '2017-03-20', 53000),
(105, 'Sonal', 'Bhatia', 'Computer', '2018-11-05', 62000);

-- Courses
INSERT INTO Course VALUES
(201, 'Maths Basics', 3),
(202, 'Science Fundamentals', 4),
(203, 'English Grammar', 2),
(204, 'World History', 3),
(205, 'Computer Programming', 5);

-- Enrollments
INSERT INTO Enroll VALUES
(301, 1, 201, 'A'),
(302, 2, 202, 'A+'),
(303, 3, 203, 'B'),
(304, 4, 204, 'A'),
(305, 5, 205, 'A+');

-- 1.Display the of all students.
select *from Student;
-- output
-- 1	Aarav	Sharma	2008-01-15	8A	88	Delhi
-- 2	Isha	Verma	2007-03-22	9B	92	Mumbai
-- 3	Kabir	Singh	2008-01-05	8A	76	Bangalore
-- 4	Meera	Rao	2006-07-30	10C	85	Chennai
-- 5	Rohan	Patel	2007-11-11	9A	90	Ahmedabad
						
--       2. Show the  last 3 characters of course names.
Select CourseName, Right(CourseName, 3) From Course;
-- output
-- Maths Basics	ics
-- Science Fundamentals	als
-- English Grammar	mar
-- World History	ory
-- Computer Programming	ing
--       3. Concatenate FirstName and LastName of teachers as fullname
select concat(FirstName, LastName) from Teacher;
-- output
-- NehaKapoor
-- RajMehta
-- AnitaDesai
-- VikramJoshi
-- SonalBhatia
--       4. Find the length of each student’s name.
Select length(concat(FirstName, LastName)) from Student;
-- output
-- 11
-- 9
-- 10
-- 8
-- 10
--       5.Replace the word "Maths" with "Mathematics" in the Course table. (use REPLACE function)
Select replace (CourseName, 'Maths Basics', 'Mathematics') from Course;
-- Mathematics
-- Science Fundamentals
-- English Grammar
-- World History
-- Computer Programming
--       6.Find the absolute difference between maximum and minimum marks.
select abs(max(Marks) - min(Marks)) from Student;
-- output
-- 16
--       7. Round off teachers’ salaries to the nearest thousand.
Select Round(Salary, -3) from Teacher;
-- output
-- 55000
-- 60000
-- 58000
-- 53000
-- 62000
--       8.Show the square root of each course credit.
Select sqrt(credits) from Course;
-- output
-- 1.7320508075688772
-- 2
-- 1.4142135623730951
-- 1.7320508075688772
-- 2.23606797749979
--       9. Display students’ marks along with ceiling and floor values. 
Select ceil(marks), floor(marks) from Student;
-- output
-- 88	88
-- 92	92
-- 76	76
-- 85	85
-- 90	90
--          10. Find the modulus of total marks divided by 5.
Select Sum(marks)% 5 from Student;
-- output: 1
--       11. Display the current date and time.
Select Now();
-- output: 2025-09-10 12:07:05
--       12.Show the year and month of hire for all teachers. 
Select YEAR(HireDate), Month(HireDate) from Teacher;
-- output
-- 2015	6
-- 2016	8
-- 2014	1
-- 2017	3
-- 2018	11
--       13. List students who were born in January. 
Select * from Student Where Month (DOB)=1;
-- output
-- 1	Aarav	Sharma	2008-01-15	8A	88	Delhi
-- 3	Kabir	Singh	2008-01-05	8A	76	Bangalore
--       14. Find the difference in days between today and a teacher’s HireDate. 
Select Datediff(Current_Date, HireDate) from Teacher;
-- output
-- 3754
-- 3313
-- 4261
-- 3096
-- 2501
--       15. Find the total number of students in the school. 
Select Count(*) from Student;
-- output: 5
--       16. Calculate the average salary of teachers.
select avg(Salary) from Teacher;
-- output: 57600.000000
--       17. Find the highest and lowest marks in the Student table.
select max(marks), min(marks) from Student;
-- output: 92	76

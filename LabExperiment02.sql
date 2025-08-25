-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios:

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- 'root@localhost', 'Esha', '9.4.0', '2025-08-25 11:33:06';


-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:
create database College_Studen_Management_System;
use College_Studen_Management_System;

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:
create table Departments(
Department_ID INT PRIMARY KEY,
Department_name varchar(50),
HOD varchar(100),
Email varchar(100) UNIQUE,
Phone_Number INT,
Location varchar(100));

create table Course(
Course_ID INT PRIMARY KEY,
Course_Name varchar(100),
Credits INT,
Department_ID INT,
Duration INT,
fee INT,
FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID));

create table Students(
Student_ID INT PRIMARY KEY,
First_Name varchar(100),
last_Name varchar(100),
Email varchar(100) UNIQUE,
DOB date,
Course_ID INT,
FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID));

create table Faculty(
Faculty_ID INT PRIMARY KEY,
Department_ID INT,
Faculty_name varchar(50),
Qualifications varchar(100),
Email varchar(100) UNIQUE,
Phone_Number INT,
FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID));	

create table Enrollments(
Enrollment_ID INT PRIMARY KEY,
Student_ID INT,
Course_ID INT,
Semester INT,
Year INT,
Grade INT,
FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID));

drop table Course;
drop table Enrollments;

-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
--  describe the structure of each table and copy paste the Output 
desc Departments;
-- 'Department_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Department_name', 'varchar(50)', 'YES', '', NULL, ''
-- 'HOD', 'varchar(100)', 'YES', '', NULL, ''
-- 'Email', 'varchar(100)', 'YES', 'UNI', NULL, ''
-- 'Phone_Number', 'int', 'YES', '', NULL, ''
-- 'Location', 'varchar(100)', 'YES', '', NULL, ''

desc Course;
-- 'Course_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Course_Name', 'varchar(100)', 'YES', '', NULL, ''
-- 'Credits', 'int', 'YES', '', NULL, ''
-- 'Department_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Duration', 'int', 'YES', '', NULL, ''
-- 'fee', 'int', 'YES', '', NULL, ''

desc StudentS;
-- 'Student_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'First_Name', 'varchar(100)', 'YES', '', NULL, ''
-- 'last_Name', 'varchar(100)', 'YES', '', NULL, ''
-- 'Email', 'varchar(100)', 'YES', 'UNI', NULL, ''
-- 'DOB', 'date', 'YES', '', NULL, ''
-- 'Course_ID', 'int', 'YES', 'MUL', NULL, ''

desc Faculty;
-- 'Faculty_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Department_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Faculty_name', 'varchar(50)', 'YES', '', NULL, ''
-- 'Qualifications', 'varchar(100)', 'YES', '', NULL, ''
-- 'Email', 'varchar(100)', 'YES', 'UNI', NULL, ''
-- 'Phone_Number', 'int', 'YES', '', NULL, ''

desc Enrollments;
-- 'Enrollment_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Student_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Course_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Semester', 'int', 'YES', '', NULL, ''
-- 'Year', 'int', 'YES', '', NULL, ''
-- 'Grade', 'int', 'YES', '', NULL, ''



-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
Alter table Departments Add (DEAN varchar(50), Number_of_student INT);
Alter table Students Add (Gender varchar(50), Parent_Contact INT);
Alter table Faculty Add (Gender varchar(50), Cabin_Number INT);
Alter table Course Add (Course_Code varchar(50), UNITS INT);
Alter table Enrollments Add (Seat_number INT, Date_of_Joining date);
-- 02: Modify the existing column from each table
Alter table Departments Modify Email varchar(200);
Alter table Students Modify Email varchar(200);
Alter table Faculty Modify Gender varchar(100);
Alter table Course Modify Course_Code varchar(100);
Alter table Enrollments Modify Grade varchar(2);
-- 03 change the datatypes
ALTER TABLE Departments MODIFY Phone_Number VARCHAR(15); 
ALTER TABLE Course MODIFY Fee DECIMAL(10,2); 
ALTER TABLE Students MODIFY Parent_Contact VARCHAR(15); 
ALTER TABLE Faculty MODIFY Phone_Number VARCHAR(15); 
ALTER TABLE Enrollments MODIFY Grade VARCHAR(2); 
-- 04: Rename a column
ALTER TABLE Departments Rename column HOD to Head_of_Department; 
ALTER TABLE Course Rename column Credits to Course_credit; 
ALTER TABLE Students Rename column DOB to Date_of_birth; 
ALTER TABLE Faculty Rename column Qualifications to Qualification; 
ALTER TABLE Enrollments Rename column Semester to Semester_number; 
-- 05: Drop a column
ALTER TABLE Departments DROP COLUMN Number_of_student;
ALTER TABLE Course DROP COLUMN UNITS;
ALTER TABLE Students DROP COLUMN Parent_Contact;
ALTER TABLE Faculty DROP COLUMN Cabin_Number;
ALTER TABLE Enrollments DROP COLUMN Seat_number;
-- 06: Rename the table
RENAME TABLE Departments TO Dept;
RENAME TABLE Course TO Courses;
RENAME TABLE Students TO Student_Info;
RENAME TABLE Faculty TO Faculty_Info;
RENAME TABLE Enrollments TO Enrollment_Details;
-- 07: describe the structure of the new table
desc Dept;
-- 'Department_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Department_name', 'varchar(50)', 'YES', '', NULL, ''
-- 'Head_of_Department', 'varchar(100)', 'YES', '', NULL, ''
-- 'Email', 'varchar(200)', 'YES', 'UNI', NULL, ''
-- 'Phone_Number', 'varchar(15)', 'YES', '', NULL, ''
-- 'Location', 'varchar(100)', 'YES', '', NULL, ''
-- 'DEAN', 'varchar(50)', 'YES', '', NULL, ''

desc Courses;
-- 'Course_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Course_Name', 'varchar(100)', 'YES', '', NULL, ''
-- 'Course_credit', 'int', 'YES', '', NULL, ''
-- 'Department_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Duration', 'int', 'YES', '', NULL, ''
-- 'Fee', 'decimal(10,2)', 'YES', '', NULL, ''
-- 'Course_Code', 'varchar(100)', 'YES', '', NULL, ''

desc Student_Info;
-- 'Student_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'First_Name', 'varchar(100)', 'YES', '', NULL, ''
-- 'last_Name', 'varchar(100)', 'YES', '', NULL, ''
-- 'Email', 'varchar(200)', 'YES', 'UNI', NULL, ''
-- 'Date_of_birth', 'date', 'YES', '', NULL, ''
-- 'Course_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Gender', 'varchar(50)', 'YES', '', NULL, ''

desc Faculty_Info;
-- 'Faculty_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Department_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Faculty_name', 'varchar(50)', 'YES', '', NULL, ''
-- 'Qualification', 'varchar(100)', 'YES', '', NULL, ''
-- 'Email', 'varchar(100)', 'YES', 'UNI', NULL, ''
-- 'Phone_Number', 'varchar(15)', 'YES', '', NULL, ''
-- 'Gender', 'varchar(100)', 'YES', '', NULL, ''

desc Enrollment_Details;
-- 'Enrollment_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Student_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Course_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Semester_number', 'int', 'YES', '', NULL, ''
-- 'Year', 'int', 'YES', '', NULL, ''
-- 'Grade', 'varchar(2)', 'YES', '', NULL, ''
-- 'Date_of_Joining', 'date', 'YES', '', NULL, ''


/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
ALTER TABLE Student_Info ADD COLUMN Address VARCHAR(100);
--2 Add a column Gender (CHAR(1)) to the Students table.
ALTER TABLE Student_Info ADD COLUMN Gender VARCHAR(100);
--3 Add a column JoiningDate (DATE) to the Faculty table.
ALTER TABLE Faculty_Info ADD COLUMN JoiningDate DATE;
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
ALTER TABLE Courses MODIFY COLUMN CourseName VARCHAR(100);
--5 Modify the column Location in the Departments table to VARCHAR(80).
ALTER TABLE Dept MODIFY COLUMN Location VARCHAR(80);
--6 Rename the column Qualification in the Faculty table to Degree.
ALTER TABLE Faculty_Info RENAME COLUMN Qualification TO Degree;
--7 Rename the table Faculty to Teachers.
RENAME TABLE Faculty_Info TO Teachers;
--8 Drop the column PhoneNumber from the Departments table.
ALTER TABLE Dept DROP COLUMN PhoneNumber;
--9 Drop the column Email from the Students table.
ALTER TABLE Student_Info DROP COLUMN Email;
--10 Drop the column Duration from the Courses table.
ALTER TABLE Courses DROP COLUMN Duration;
*/

SHOW TABLES; -- Before dropping the table
desc Dept;
-- 'Department_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Department_name', 'varchar(50)', 'YES', '', NULL, ''
-- 'Head_of_Department', 'varchar(100)', 'YES', '', NULL, ''
-- 'Email', 'varchar(200)', 'YES', 'UNI', NULL, ''
-- 'Phone_Number', 'varchar(15)', 'YES', '', NULL, ''
-- 'Location', 'varchar(100)', 'YES', '', NULL, ''
-- 'DEAN', 'varchar(50)', 'YES', '', NULL, ''

desc Courses;
-- 'Course_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Course_Name', 'varchar(100)', 'YES', '', NULL, ''
-- 'Course_credit', 'int', 'YES', '', NULL, ''
-- 'Department_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Duration', 'int', 'YES', '', NULL, ''
-- 'Fee', 'decimal(10,2)', 'YES', '', NULL, ''
-- 'Course_Code', 'varchar(100)', 'YES', '', NULL, ''

desc Student_Info;
-- 'Student_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'First_Name', 'varchar(100)', 'YES', '', NULL, ''
-- 'last_Name', 'varchar(100)', 'YES', '', NULL, ''
-- 'Email', 'varchar(200)', 'YES', 'UNI', NULL, ''
-- 'Date_of_birth', 'date', 'YES', '', NULL, ''
-- 'Course_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Gender', 'varchar(50)', 'YES', '', NULL, ''

desc Faculty_Info;
-- 'Faculty_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Department_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Faculty_name', 'varchar(50)', 'YES', '', NULL, ''
-- 'Qualification', 'varchar(100)', 'YES', '', NULL, ''
-- 'Email', 'varchar(100)', 'YES', 'UNI', NULL, ''
-- 'Phone_Number', 'varchar(15)', 'YES', '', NULL, ''
-- 'Gender', 'varchar(100)', 'YES', '', NULL, ''

desc Enrollment_Details;
-- 'Enrollment_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Student_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Course_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Semester_number', 'int', 'YES', '', NULL, ''
-- 'Year', 'int', 'YES', '', NULL, ''
-- 'Grade', 'varchar(2)', 'YES', '', NULL, ''
-- 'Date_of_Joining', 'date', 'YES', '', NULL, ''


-- Drop the 'Courses' and 'Enrollments' tables from the database.

-- Write your SQL query below Codespace:
drop table Courses; -- Can't be dropped as referenced by a foreign key constraints.
drop table  Enrollment_Details;

SHOW TABLES; -- After dropping the table Enrollement and Course
desc Dept;
-- 'Department_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Department_name', 'varchar(50)', 'YES', '', NULL, ''
-- 'Head_of_Department', 'varchar(100)', 'YES', '', NULL, ''
-- 'Email', 'varchar(200)', 'YES', 'UNI', NULL, ''
-- 'Phone_Number', 'varchar(15)', 'YES', '', NULL, ''
-- 'Location', 'varchar(100)', 'YES', '', NULL, ''
-- 'DEAN', 'varchar(50)', 'YES', '', NULL, ''

desc Student_Info;
-- 'Student_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'First_Name', 'varchar(100)', 'YES', '', NULL, ''
-- 'last_Name', 'varchar(100)', 'YES', '', NULL, ''
-- 'Email', 'varchar(200)', 'YES', 'UNI', NULL, ''
-- 'Date_of_birth', 'date', 'YES', '', NULL, ''
-- 'Course_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Gender', 'varchar(50)', 'YES', '', NULL, ''

desc Faculty_Info;
-- 'Faculty_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Department_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Faculty_name', 'varchar(50)', 'YES', '', NULL, ''
-- 'Qualification', 'varchar(100)', 'YES', '', NULL, ''
-- 'Email', 'varchar(100)', 'YES', 'UNI', NULL, ''
-- 'Phone_Number', 'varchar(15)', 'YES', '', NULL, ''
-- 'Gender', 'varchar(100)', 'YES', '', NULL, ''

desc Courses;
-- 'Course_ID', 'int', 'NO', 'PRI', NULL, ''
-- 'Course_Name', 'varchar(100)', 'YES', '', NULL, ''
-- 'Course_credit', 'int', 'YES', '', NULL, ''
-- 'Department_ID', 'int', 'YES', 'MUL', NULL, ''
-- 'Duration', 'int', 'YES', '', NULL, ''
-- 'Fee', 'decimal(10,2)', 'YES', '', NULL, ''
-- 'Course_Code', 'varchar(100)', 'YES', '', NULL, ''

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01

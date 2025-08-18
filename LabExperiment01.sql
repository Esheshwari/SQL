-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: Esheshwari Kumari;
-- USN: RUA24BCA0025;
-- SECTION: A;

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- 'root@localhost', 'Esha', '9.4.0', '2025-08-18 11:32:42'


-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:

create database Lab001;
use Lab001;


-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:

create table Students
( student_ID varchar(10) Primary key,
firstname varchar(15),
lastname varchar(15),
Email varchar(20) UNIQUE,
DateofBirth date);

DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
-- 'student_ID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'firstname', 'varchar(15)', 'YES', '', NULL, ''
-- 'lastname', 'varchar(15)', 'YES', '', NULL, ''
-- 'Email', 'varchar(20)', 'YES', 'UNI', NULL, ''
-- 'DateofBirth', 'date', 'YES', '', NULL, ''



-- Alter the table and 2 new columns
Alter table STUDENTS Add (gender varchar(10), Address varchar(20));
-- Modify a column data type
ALTER table Students MODIFY Address varchar(50);

-- Rename a column
Alter table Students Rename column firstname to First_name;
-- Drop a column
Alter table Students drop gender;
-- Rename the table
Rename table Students to StudentRecords;
Desc StudentRecords;




-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
create table courses(
course_ID varchar(20) Primary Key,
Course_name varchar(20),
Credits INT);

DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- 'course_ID', 'varchar(20)', 'NO', 'PRI', NULL,
-- 'Course_name', 'varchar(20)', 'YES', '', NULL,
-- 'Credits', 'int', 'YES', '', NULL,


-- OUTPUT :

-- Alter the table and 2 new columns
Alter table courses add (Course_Department varchar(100), Students_Num varchar(100));
-- Modify a column data type
Alter table courses Modify Course_name varchar(50);
-- Rename a column
alter table courses Rename column Course_ID to courseID;
-- Drop a column
Alter table courses Drop Students_Num;
-- Rename the table
Rename table courses to Courses1;
Desc Courses1;


-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
create table Enrollments(
EnrollmentID varchar(50) Primary Key,
StudentID varchar(50),
CourseID varchar(50),
EnrollmentDate date,
Foreign key (StudentID) References StudentRecords(Student_ID),
Foreign Key  (CourseID) References Courses1 (CourseID)
);

DESC ENROLLMENTS; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :
-- 'EnrollmentID', 'varchar(50)', 'NO', 'PRI', NULL, ''
-- 'StudentID', 'varchar(50)', 'YES', 'MUL', NULL, ''
-- 'CourseID', 'varchar(50)', 'YES', 'MUL', NULL, ''
-- 'EnrollmentDate', 'date', 'YES', '', NULL, ''

-- Alter the table and 2 new columns
alter table Enrollments Add (Student_gender varchar(20), Student_age INT);
-- Modify a column data type
alter table Enrollments Modify Student_gender varchar(50);
-- Rename a column
alter table Enrollments Rename column CourseID to course_ID;
-- Drop a column
alter table Enrollments drop EnrollmentDate;
-- Rename the table
Rename table Enrollments to Enrollment_table;
-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.
-- Write your SQL query below Codespace:
alter table StudentRecords add (PhoneNumber INT);


DESC StudentRecords; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]
-- 'student_ID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'First_name', 'varchar(15)', 'YES', '', NULL, ''
-- 'lastname', 'varchar(15)', 'YES', '', NULL, ''
-- 'Email', 'varchar(20)', 'YES', 'UNI', NULL, ''
-- 'DateofBirth', 'date', 'YES', '', NULL, ''
-- 'Address', 'varchar(50)', 'YES', '', NULL, ''
-- 'PhoneNumber', 'int', 'YES', '', NULL, ''


-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:
Alter table courses1 Modify Credits decimal(4,2);

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table courses1; -- can't be dropped as the reference is used in foreign key
drop table Enrollment_table;

SHOW TABLES; -- After dropping the table Enrollement and Course

-- End of Lab Experiment 01

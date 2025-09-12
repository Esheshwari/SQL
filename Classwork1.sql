-- Student Database
create database School1;
use School1;
CREATE TABLE student (
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    dob DATE,
    address VARCHAR(100),
    usn VARCHAR(20),
    result VARCHAR(10)
);

INSERT INTO student (firstname, lastname, dob, address, usn, result)
VALUES 
('Meera', 'Sharma', '2003-11-10', '789 Lake View, Delhi', 'USN003', 'Pass');

-- Concat
SELECT CONCAT(firstname, ' ', lastname) AS full_name FROM student;
-- output Meera Sharma

-- Length of fullname
SELECT LENGTH(CONCAT(firstname, ' ', lastname)) AS full_name_length FROM student;
-- 12 : output
-- Convert the name of students to uppercase
SELECT UPPER(firstname) AS firstname_upper FROM student;
-- Output- MEERA

-- From the address coloumn replace any char from with any other char like mangalore with bangalore
SELECT REPLACE(address, 'Mangalore', 'Bangalore') AS updated_address FROM student;
-- output - 789 Lake View, Delhi

-- Extract Substring of student name rma from sharma
SELECT SUBSTRING(lastname, 4, 3) AS extracted_substring
FROM student
WHERE usn = 'USN003';
-- output: rma

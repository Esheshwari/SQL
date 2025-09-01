-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Esheshwari Kumari
-- SECTION: 'A'
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- root@localhost	Esha	9.4.0	2025-09-01 11:28:07


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 

Create database Tables;
use Tables;
create table Books(
Book_Id INT Primary Key,
Name Varchar(100),
Genre Varchar(100),
Author varchar(100),
Published_Year INT);
create table Members(
Member_Id INT Primary Key,
Name Varchar(100),
Gender varchar(100),
phone_num INT,
email varchar(100) Unique);






-- Paste the Output below for the given command ( DESC TableName;) 

Desc Books;
-- Book_Id	int	NO	PRI	
-- Name	varchar(100)	YES		
-- Genre	varchar(100)	YES		
-- Author	varchar(100)	YES		
-- Published_Year	int	YES		
Desc Members;
-- Member_Id	int	NO	PRI	
-- Name	varchar(100)	YES		
-- Gender	varchar(100)	YES		
-- phone_num	int	YES		
-- email	varchar(100)	YES	UNI	
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
INSERT INTO Books VALUES (1, '1984_The Black Swan', 'Dystopian Fiction', 'George Orwell', 1949);
INSERT INTO Books VALUES (2, 'To Kill a Mockingbird', 'Classic Fiction', 'Harper Lee', 1960);
INSERT INTO Books VALUES (3, 'Sapiens: A Brief History of Humankind', 'Non-Fiction', 'Yuval Noah Harari', 2011);
INSERT INTO Books VALUES (4, 'The Alchemist', 'Philosophical Fiction', 'Paulo Coelho', 1988);
INSERT INTO Books VALUES (5, 'The Lean Startup', 'Business Strategy', 'Eric Ries', 2011);


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM Books;
-- 1984_The Black Swan	Dystopian Fiction	George Orwell	1949
-- To Kill a Mockingbird	Classic Fiction	Harper Lee	1960
-- Sapiens: A Brief History of Humankind	Non-Fiction	Yuval Noah Harari	2011
-- The Alchemist	Philosophical Fiction	Paulo Coelho	1988
-- The Lean Startup	Business Strategy	Eric Ries	2011

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
INSERT INTO Members (Member_Id, Name, Gender, phone_num, email)
VALUES
  (101, 'David Lee', 'Male', 987654321, 'david.lee@example.com'),
  (102, 'Emma Wilson', 'Female', 912345678, 'emma.wilson@example.com'),
  (103, 'Aarav Mehta', 'Male', 998877665, 'aarav.mehta@example.com'),
  (104, 'Priya Sharma', 'Female', 909090909, 'priya.sharma@example.com'),
  (105, 'Liam Carter', 'Male', 934567812, 'liam.carter@example.com');

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM Members;
-- 101	David Lee	Male	987654321	david.lee@example.com
-- 102	Emma Wilson	Female	912345678	emma.wilson@example.com
-- 103	Aarav Mehta	Male	998877665	aarav.mehta@example.com
-- 104	Priya Sharma	Female	909090909	priya.sharma@example.com
-- 105	Liam Carter	Male	934567812	liam.carter@example.com
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
ALTER TABLE Books ADD COLUMN (Units_Received INT);
UPDATE Books
SET Units_Received = Units_Received + 2
WHERE Name = '1984_The Black Swan';

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM Books;
-- 1	1984_The Black Swan	Dystopian Fiction	George Orwell	1949	
-- 2	To Kill a Mockingbird	Classic Fiction	Harper Lee	1960	
-- 3	Sapiens: A Brief History of Humankind	Non-Fiction	Yuval Noah Harari	2011	
-- 4	The Alchemist	Philosophical Fiction	Paulo Coelho	1988	
-- 5	The Lean Startup	Business Strategy	Eric Ries	2011	
					
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
ALTER TABLE Members ADD COLUMN Membership_Type VARCHAR(50);
UPDATE Members
SET Membership_Type = 'Gold'
WHERE Name = 'Emma Wilson';

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
 SELECT * FROM Members;

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
DELETE FROM Members
WHERE Name = 'David Lee';

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

 SELECT * FROM Members;
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

CREATE TABLE Borrowing (
    Borrow_Id INT PRIMARY KEY AUTO_INCREMENT,
    Member_Id INT,
    Book_Id INT,
    Borrow_Date DATE,
    FOREIGN KEY (Member_Id) REFERENCES Members(Member_Id),
    FOREIGN KEY (Book_Id) REFERENCES Books(Book_Id)
);
INSERT INTO Books (Book_Id, Name, Genre, Author, Published_Year)
VALUES (102, 'The Catcher in the Rye', 'Classic Fiction', 'J.D. Salinger', 1951);

INSERT INTO Borrowing (Member_Id, Book_Id, Borrow_Date)
VALUES (102, 102, '2024-06-01');
-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM Borrowing;
-- 1	102	102	2024-06-01
-- -- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
SELECT M.Name AS Borrower_Name
FROM Borrowing B
JOIN Members M ON B.Member_Id = M.Member_Id
WHERE B.Book_Id = 102;

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM Borrowing;
-- 1	102	102	2024-06-01
-- Null Null Null Null
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task -- 

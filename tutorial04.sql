create database online_book_store;
use online_book_store;
create table books(
BookID int Primary key,
title varchar(100),
author varchar(100),
price int,
published_date date);
insert into books values (
101, 'The Alchemist', 'Paulo Coelho', 350, 2010-06-15),
(102, 'Atomic Habits', 'James Clear', 450, 2018-10-16),
(103, 'Clean Code', 'Robert Martin', 550, 2008-08-01),
(104, 'Think Like a Monk', 'Jay Shetty', 400, 2020-09-08),
(105, 'Python Crash Course', 'Eric Matthes', 500, 2019-05-10);

CREATE TABLE Customers (
    CustID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    JoinDate DATE
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Price DECIMAL(6,2),
    PublishDate DATE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustID INT,
    BookID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustID) REFERENCES Customers(CustID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Customers
INSERT INTO Customers VALUES
(201, 'Arjun Rao', 'arjun@gmail.com', '2021-02-10'),
(202, 'Priya Nair', 'priya@yahoo.com', '2022-07-25'),
(203, 'John Smith', 'john@gmail.com', '2020-01-14'),
(204, 'Maria Lopez', 'maria@outlook.com', '2019-11-30');

-- Books
INSERT INTO Books VALUES
(101, 'Book of Dreams', 'Anita Desai', 499.00, '2018-06-15'),
(102, 'Bookworm Chronicles', 'Ravi Subramanian', 599.00, '2020-09-10'),
(103, 'Textual Analysis', 'John Green', 399.00, '2017-03-22'),
(104, 'The Art of Books', 'Maria Popova', 699.00, '2019-12-01'),
(105, 'Chaos & Order', 'Alan Watts', 549.00, '2021-01-05');

-- Orders
INSERT INTO Orders VALUES
(301, 201, 102, '2022-03-05', 2),
(302, 202, 101, '2021-09-12', 1),
(303, 203, 105, '2022-05-20', 3),
(304, 204, 104, '2020-12-25', 1),
(305, 201, 103, '2021-11-18', 1);

-- 1. Customer Names in Upper Case
SELECT UPPER(Name) FROM Customers;

-- 2. Customer Names in Lower Case
SELECT LOWER(Name) FROM Customers;

-- 3. First 3 Letters of Book Titles
SELECT LEFT(Title, 3) FROM Books;

-- 4.Email Domain
SELECT SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email)) AS Domain FROM Customers;


### 5. Length of Book Titles
SELECT Title, LEN(Title) AS TitleLength FROM Books;


### 6. Replace "Book" with "Text"
SELECT REPLACE(Title, 'Book', 'Text') AS ModifiedTitle FROM Books;


### 7. Concatenate Author and Title
SELECT CONCAT(Author, ' - ', Title) AS FullDescription FROM Books;


### 8. Titles with Author Name Containing 'a'

SELECT Title FROM Books WHERE Author LIKE '%a%';


### 9. Year of Publication

SELECT Title, YEAR(PublishDate) AS PublishYear FROM Books;


### 10. Month Name of Join Date

SELECT Name, DATENAME(MONTH, JoinDate) AS JoinMonth FROM Customers;


### 11. Customers Joined in 2021

SELECT * FROM Customers WHERE YEAR(JoinDate) = 2021;


### 12. Day Name of Order Date

SELECT OrderID, DATENAME(WEEKDAY, OrderDate) AS OrderDay FROM Orders;


### 13. Age of Each Book

SELECT Title, DATEDIFF(YEAR, PublishDate, GETDATE()) AS BookAge FROM Books;


### 14. Days Since Customer Joined

SELECT Name, DATEDIFF(DAY, JoinDate, GETDATE()) AS DaysSinceJoined FROM Customers;


### 15. Orders in December

SELECT * FROM Orders WHERE MONTH(OrderDate) = 12;


### 16. Total Books in Store

SELECT COUNT(*) AS TotalBooks FROM Books;


### 17. Average Book Price

SELECT AVG(Price) AS AvgPrice FROM Books;


### 18. Max and Min Book Price

SELECT MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice FROM Books;


### 19. Customers Joined After 2020

SELECT COUNT(*) FROM Customers WHERE JoinDate > '2020-12-31';


### 20. Total Books Ordered

SELECT SUM(Quantity) AS TotalOrderedBooks FROM Orders;


### 21. Total Quantity per Customer

SELECT CustID, SUM(Quantity) AS TotalQuantity FROM Orders GROUP BY CustID;


### 22. Average Quantity per Book

SELECT BookID, AVG(Quantity) AS AvgQuantity FROM Orders GROUP BY BookID;


### 23. Book with Highest Total Quantity Ordered

SELECT TOP BookID, SUM(Quantity) AS Total FROM Orders GROUP BY BookID ORDER BY Total DESC;


### 24. Revenue per Book

SELECT b.BookID, b.Title, SUM(o.Quantity * b.Price) AS Revenue
FROM Orders o
JOIN Books b ON o.BookID = b.BookID
GROUP BY b.BookID, b.Title;


### 25. Orders Placed Each Year

SELECT YEAR(OrderDate) AS Year, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY YEAR(OrderDate);

CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(50),
    city VARCHAR(30),
    join_date DATE
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    available_copies INT
);

CREATE TABLE Issues (
    issue_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Members VALUES
(1,'Neha Patel','Pune','2023-05-10'),
(2,'Ravi Kumar','Delhi','2024-01-01');

INSERT INTO Books VALUES
(101,'Database Systems','Elmasri',3),
(102,'Python Programming','Wesley',2),
(103,'AI Foundations','Russell',5);

INSERT INTO Issues VALUES
(1,1,101,'2025-02-01','2025-02-15'),
(2,2,103,'2025-02-10','2025-02-20');

-- Total issued books per member
SELECT m.member_name, COUNT(i.book_id) AS Total_Books
FROM Members m
JOIN Issues i ON m.member_id = i.member_id
GROUP BY m.member_name;

-- Procedure: Update availability
DELIMITER //
CREATE PROCEDURE UpdateAvailability(IN bid INT, IN new_count INT)
BEGIN
    UPDATE Books SET available_copies = new_count WHERE book_id = bid;
END //
DELIMITER ;

CALL UpdateAvailability(102,1);

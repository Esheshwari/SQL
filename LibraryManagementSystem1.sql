CREATE DATABASE lib_db;
USE lib_db;

CREATE TABLE publishers (
  publisher_id INT  PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE books (
  book_id INT PRIMARY KEY,
  title VARCHAR(150),
  author VARCHAR(100),
  publisher_id INT,
  price DECIMAL(8,2),
  FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);

CREATE TABLE issues (
  issue_id INT PRIMARY KEY,
  book_id INT,
  member_id INT,
  issue_date DATE,
  return_date DATE,
  FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO publishers (name) VALUES ('Pearson'), ('OReilly'), ('McGraw-Hill');
INSERT INTO books (title,author,publisher_id,price) VALUES
 ('Intro to SQL','A. Smith',1,45.00),
 ('Python Cook','B. Lee',2,55.50),
 ('Algorithms','C. Khan',3,60.00);
INSERT INTO issues (book_id,member_id,issue_date,return_date) VALUES
 (1,101,'2025-10-01','2025-10-10'),
 (2,102,'2025-10-05',NULL),
 (1,103,'2025-10-07','2025-10-14');

-- 1. Display book title, author, and publisher name using INNER JOIN.
SELECT b.title, b.author, p.name AS publisher
FROM books b
JOIN publishers p ON b.publisher_id = p.publisher_id;

-- 2. List all publishers and their books, including those without books using LEFT OUTER JOIN.
SELECT p.name AS publisher, b.title
FROM publishers p
LEFT JOIN books b ON p.publisher_id = b.publisher_id;

-- 3. Display the total number of books issued per member using GROUP BY.
SELECT member_id, COUNT(*) AS books_issued
FROM issues
GROUP BY member_id;

-- 4. Find the average price of all books.
SELECT AVG(price) AS avg_price FROM books;

-- 5. Find the total number of books issued from the library.
SELECT COUNT(*) AS total_issued FROM issues;

CREATE DATABASE EcommerceDB;
USE EcommerceDB;

CREATE TABLE Customers (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(30),
    email VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    cust_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (cust_id) REFERENCES Customers(cust_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert data
INSERT INTO Customers VALUES
(1,'Amit Jain','Mumbai','amit@gmail.com'),
(2,'Priya Shah','Delhi','priya@gmail.com'),
(3,'Karan Mehta','Pune','karan@gmail.com');

INSERT INTO Products VALUES
(101,'Laptop',55000,10),
(102,'Headphones',2000,50),
(103,'Keyboard',1500,30);

INSERT INTO Orders VALUES
(1,1,101,'2025-02-10',1),
(2,2,102,'2025-02-12',2),
(3,3,103,'2025-02-15',3);

-- Total sales per product
SELECT p.product_name, SUM(o.quantity*p.price) AS Total_Sales
FROM Products p
JOIN Orders o ON p.product_id=o.product_id
GROUP BY p.product_name;

-- Most purchased product
SELECT p.product_name, SUM(o.quantity) AS Total_Quantity
FROM Products p
JOIN Orders o ON p.product_id=o.product_id
GROUP BY p.product_name
ORDER BY Total_Quantity DESC
LIMIT 1;

-- Customer and order details
SELECT c.cust_name, p.product_name, o.quantity
FROM Customers c
JOIN Orders o ON c.cust_id=o.cust_id
JOIN Products p ON o.product_id=p.product_id;

-- Procedure: Update stock
DELIMITER //
CREATE PROCEDURE UpdateStock(IN pid INT, IN new_stock INT)
BEGIN
    UPDATE Products SET stock = new_stock WHERE product_id = pid;
END //
DELIMITER ;

CALL UpdateStock(102,45);

CREATE DATABASE InventoryDB;
USE InventoryDB;

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    city VARCHAR(30)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE SupplyOrders (
    order_id INT PRIMARY KEY,
    supplier_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Suppliers VALUES
(1,'Om Traders','Mumbai'),(2,'Global Supply','Delhi');
INSERT INTO Products VALUES
(101,'Monitor',8000),(102,'Mouse',700);
INSERT INTO SupplyOrders VALUES
(1,1,101,'2025-01-10',20),(2,2,102,'2025-02-12',50);

-- Total quantity per supplier
SELECT s.supplier_name, SUM(o.quantity) AS Total_Quantity
FROM Suppliers s
JOIN SupplyOrders o ON s.supplier_id=o.supplier_id
GROUP BY s.supplier_name;

-- Procedure: Update order quantity
DELIMITER //
CREATE PROCEDURE UpdateOrderQuantity(IN oid INT, IN new_qty INT)
BEGIN
    UPDATE SupplyOrders SET quantity=new_qty WHERE order_id=oid;
END //
DELIMITER ;

CALL UpdateOrderQuantity(2,60);

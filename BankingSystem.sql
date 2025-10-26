CREATE DATABASE BankDB;
USE BankDB;

CREATE TABLE Customers (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(30)
);

CREATE TABLE Accounts (
    acc_id INT PRIMARY KEY,
    cust_id INT,
    acc_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (cust_id) REFERENCES Customers(cust_id)
);

CREATE TABLE Transactions (
    trans_id INT PRIMARY KEY,
    acc_id INT,
    trans_date DATE,
    amount DECIMAL(10,2),
    trans_type VARCHAR(10),
    FOREIGN KEY (acc_id) REFERENCES Accounts(acc_id)
);

INSERT INTO Customers VALUES
(1,'Riya','Delhi'),(2,'Aman','Mumbai');
INSERT INTO Accounts VALUES
(101,1,'Savings',50000),(102,2,'Current',30000);
INSERT INTO Transactions VALUES
(1,101,'2025-02-01',5000,'Deposit'),
(2,101,'2025-02-05',2000,'Withdraw'),
(3,102,'2025-02-10',10000,'Deposit');

-- Aggregate: Total balance per account
SELECT a.acc_id, SUM(t.amount) AS Total_Amount
FROM Accounts a
JOIN Transactions t ON a.acc_id=t.acc_id
GROUP BY a.acc_id;

-- Procedure: Insert transaction
DELIMITER //
CREATE PROCEDURE InsertTransaction(IN tid INT, IN aid INT, IN tdate DATE, IN amt DECIMAL(10,2), IN ttype VARCHAR(10))
BEGIN
    INSERT INTO Transactions VALUES(tid,aid,tdate,amt,ttype);
END //
DELIMITER ;

CALL InsertTransaction(4,102,'2025-02-20',1500,'Withdraw');

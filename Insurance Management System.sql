CREATE DATABASE insurance_db;
USE insurance_db;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE policies (
  policy_id INT PRIMARY KEY,
  policy_name VARCHAR(100),
  premium DECIMAL(10,2)
);

CREATE TABLE claims (
  claim_id INT PRIMARY KEY,
  customer_id INT,
  policy_id INT,
  claim_date DATE,
  amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
);

INSERT INTO customers (name) VALUES ('C1'),('C2');
INSERT INTO policies (policy_name,premium) VALUES ('Health',5000),('Vehicle',4000);
INSERT INTO claims (customer_id,policy_id,claim_date,amount) VALUES (1,1,'2025-09-20',20000);

-- Total claims per policy
SELECT p.policy_name, COUNT(c.claim_id) AS total_claims, SUM(c.amount) AS total_amount
FROM policies p
LEFT JOIN claims c ON p.policy_id = c.policy_id
GROUP BY p.policy_id;

-- Use date functions for claim dates (claims in last year)
SELECT * FROM claims WHERE claim_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- Procedure to insert/update claim records
DROP PROCEDURE IF EXISTS add_claim;
DELIMITER $$
CREATE PROCEDURE add_claim(IN p_cust INT, IN p_policy INT, IN p_date DATE, IN p_amount DECIMAL(10,2))
BEGIN
  INSERT INTO claims (customer_id,policy_id,claim_date,amount) VALUES (p_cust,p_policy,p_date,p_amount);
END$$
DELIMITER ;

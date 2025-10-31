CREATE DATABASE realestate_db;
USE realestate_db;

CREATE TABLE properties (
  property_id INT PRIMARY KEY,
  address VARCHAR(255),
  price DECIMAL(12,2)
);

CREATE TABLE agents (
  agent_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  property_id INT,
  agent_id INT,
  sale_date DATE,
  sale_price DECIMAL(12,2),
  FOREIGN KEY (property_id) REFERENCES properties(property_id),
  FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

INSERT INTO properties (address,price) VALUES ('123 A St',5000000),('45 B Rd',3000000);
INSERT INTO agents (name) VALUES ('Agent1'),('Agent2');
INSERT INTO sales (property_id,agent_id,sale_date,sale_price) VALUES (1,1,'2025-10-01',5100000);

-- Display property-agent relationships
SELECT p.address, a.name AS agent, s.sale_price
FROM properties p
LEFT JOIN sales s ON p.property_id = s.property_id
LEFT JOIN agents a ON s.agent_id = a.agent_id;

-- Aggregate total sales per agent
SELECT a.name, SUM(s.sale_price) AS total_sales
FROM agents a
LEFT JOIN sales s ON a.agent_id = s.agent_id
GROUP BY a.agent_id;

-- Procedure to insert/update sale
DROP PROCEDURE add_sale;
DELIMITER $$
CREATE PROCEDURE add_sale(IN p_prop INT, IN p_agent INT, IN p_date DATE, IN p_price DECIMAL(12,2))
BEGIN
  INSERT INTO sales (property_id,agent_id,sale_date,sale_price) VALUES (p_prop,p_agent,p_date,p_price);
END$$
DELIMITER ;

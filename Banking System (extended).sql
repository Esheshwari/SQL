-- use bank_db
USE bank_db;

-- Date-based query for recent transactions (last 7 days)
SELECT * FROM transactions WHERE tx_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);

-- Calculate total deposits per account
SELECT account_id, SUM(amount) AS total_deposits
FROM transactions
WHERE type='DEPOSIT'
GROUP BY account_id;

-- Procedure to insert a transaction and update account balance
DROP PROCEDURE add_transaction;
DELIMITER $$
CREATE PROCEDURE add_transaction(IN p_acc INT, IN p_amt DECIMAL(12,2), IN p_type ENUM('DEPOSIT','WITHDRAW'), IN p_date DATE)
BEGIN
  INSERT INTO transactions (account_id,tx_date,amount,type) VALUES (p_acc,p_date,p_amt,p_type);
  IF p_type='DEPOSIT' THEN
    UPDATE accounts SET balance = balance + p_amt WHERE account_id = p_acc;
  ELSE
    UPDATE accounts SET balance = balance - p_amt WHERE account_id = p_acc;
  END IF;
END$$
DELIMITER ;

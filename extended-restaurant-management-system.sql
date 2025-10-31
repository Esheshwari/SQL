-- use restaurant_db
USE restaurant_db;

-- Total revenue per day
SELECT order_date, SUM(total_amount) AS revenue
FROM orders
GROUP BY order_date;

-- Stored procedure for inserting/updating orders
DROP PROCEDURE IF EXISTS add_order_rest;
DELIMITER $$
CREATE PROCEDURE add_order_rest(IN p_cust INT, IN p_item INT, IN p_qty INT, IN p_date DATE)
BEGIN
  DECLARE amt DECIMAL(10,2);
  SELECT price INTO amt FROM menu WHERE item_id = p_item;
  INSERT INTO orders (customer_id,item_id,qty,total_amount,order_date) VALUES (p_cust,p_item,p_qty,amt*p_qty,p_date);
END$$
DELIMITER ;

-- Use lib_db
USE lib_db;

-- Create procedure to insert/update issue
DROP PROCEDURE insert_issue;
DELIMITER $$
CREATE PROCEDURE insert_issue(IN p_book INT, IN p_member INT, IN p_issue DATE, IN p_return DATE)
BEGIN
  INSERT INTO issues (book_id,member_id,issue_date,return_date) VALUES (p_book,p_member,p_issue,p_return);
END$$
DELIMITER ;

-- Overdue books using date functions (assuming return_date < CURDATE or returned NULL and issued long ago)
SELECT i.issue_id, b.title, i.member_id, i.issue_date, i.return_date
FROM issues i
JOIN books b ON i.book_id = b.book_id
WHERE (i.return_date IS NOT NULL AND i.return_date < CURDATE())
   OR (i.return_date IS NULL AND i.issue_date < DATE_SUB(CURDATE(), INTERVAL 14 DAY));

-- Number of books issued by each member
SELECT member_id, COUNT(*) AS issued_count FROM issues GROUP BY member_id;

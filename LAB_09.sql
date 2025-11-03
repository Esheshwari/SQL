-- Lab Experiment 08:
-- Creating,deleting and managing users
-- grant and revoke privileges to users
-- ----------------------------------------------------------------------------------
-- STUDENT NAME: Esheshwari Kumari
-- USN: 1RUA24BCA0025
-- SECTION: A
-- ----------------------------------------------------------------------------------
SELECT USER(),
       @@hostname AS Host_Name,
       VERSION() AS MySQL_Version,
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command and comment the output by /* Output */.
-- root@localhost	Esha	9.4.0	2025-11-03 11:56:51

-- ----------------------------------------------------------------------------------
-- Task 1 : Creating a user

-- creating 5 different users with 5 different passwords

CREATE USER 'user1'@'localhost' IDENTIFIED BY 'pass1';
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'pass2';
CREATE USER 'user3'@'localhost' IDENTIFIED BY 'pass3';
CREATE USER 'user4'@'localhost' IDENTIFIED BY 'pass4';
CREATE USER 'user5'@'localhost' IDENTIFIED BY 'pass5';


-- Task 2 : Alter / Changing the password

ALTER USER 'user1'@'localhost' IDENTIFIED BY 'newpass1';
ALTER USER 'user2'@'localhost' IDENTIFIED BY 'newpass2';

-- Task 3 : Privileges

GRANT SELECT ON *.* TO 'user1'@'localhost';
GRANT INSERT, UPDATE ON testdb.* TO 'user2'@'localhost';
GRANT ALL PRIVILEGES ON testdb.* TO 'user3'@'localhost';


-- Task 4 : Switch the user from root to another (NOT DONE)


-- Task 5 : Revoking all permissions (grant must exist for that user for revoke to work)

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user1'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user2'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user3'@'localhost';


-- Task 6 : Drop user

DROP USER 'user1'@'localhost';
DROP USER 'user2'@'localhost';
DROP USER 'user3'@'localhost';
DROP USER 'user4'@'localhost';
DROP USER 'user5'@'localhost';

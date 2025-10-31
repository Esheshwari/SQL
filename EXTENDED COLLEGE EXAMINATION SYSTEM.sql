-- use exam_db
USE exam_db;

-- Insert marks and compute total/average per subject
INSERT INTO marks (student_id,subject,marks) VALUES (2,'DB',82),(3,'Math',75);

SELECT subject, SUM(marks) AS total_marks, AVG(marks) AS avg_marks
FROM marks
GROUP BY subject;

-- Joins to list student results
SELECT s.name, m.subject, m.marks
FROM students s
JOIN marks m ON s.student_id = m.student_id;

-- Procedure to insert/update marks (example shown earlier in school_db)

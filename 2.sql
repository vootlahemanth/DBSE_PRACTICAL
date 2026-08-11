CREATE DATABASE StudentMarksPractice;

USE StudentMarksPractice;
CREATE TABLE student_marks (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    marks DECIMAL(5,2)
);
INSERT INTO student_marks (roll_no, name, subject, marks) VALUES
(1, 'Charan', 'Mathematics', 86.50),
(2, 'Rahul', 'Mathematics', 94.25),
(3, 'Sneha', 'Mathematics', 77.80),
(4, 'Varun', 'Mathematics', 89.40),
(5, 'Keerthi', 'Mathematics', 81.75),
(6, 'Aditya', 'Cloud Computing', 97.50),
(7, 'Pooja', 'DBMS', 93.25),
(8, 'Nikhil', 'English', 88.60),
(9, 'Divya', 'Cloud Computing', 99.10),
(10, 'Manoj', 'Azure', 83.35);
SELECT * FROM student_marks;
SELECT COUNT(*) AS total_students
FROM student_marks;
SELECT SUM(marks) AS total_marks
FROM student_marks;
SELECT AVG(marks) AS average_marks
FROM student_marks;
SELECT MAX(marks) AS highest_marks
FROM student_marks;
SELECT MIN(marks) AS lowest_marks
FROM student_marks;
SELECT *
FROM student_marks
WHERE marks > 85;
SELECT *
FROM student_marks
WHERE marks >= 90;
SELECT *
FROM student_marks
WHERE marks < 80;
SELECT *
FROM student_marks
WHERE marks BETWEEN 80 AND 90;
SELECT *
FROM student_marks
WHERE name LIKE 'P%';
SELECT *
FROM student_marks
WHERE name IN ('Hemanth', 'Rahul', 'Keerthi');
SELECT *
FROM student_marks
WHERE marks > 85
AND (subject = 'Mathematics' OR name LIKE 'P%');
UPDATE student_marks
SET marks = 90.00
WHERE roll_no = 3;
SELECT * 
FROM student_marks
WHERE roll_no = 3;
UPDATE student_marks 
SET subject = 'Remedial Math' 
WHERE marks < 80;
SELECT * FROM student_marks;
DELETE FROM student_marks
WHERE roll_no = 5;
DELETE FROM student_marks
WHERE marks < 75;
SELECT * 
FROM student_marks;
SELECT *
FROM student_marks
ORDER BY marks ASC;
SELECT *
FROM student_marks
ORDER BY marks DESC;
SELECT *
FROM student_marks
ORDER BY name ASC;
SELECT *
FROM student_marks
ORDER BY name DESC;
SELECT subject,
       SUM(marks) AS total_marks
FROM student_marks
GROUP BY subject;
SELECT subject,
       AVG(marks) AS avg_marks
FROM student_marks
GROUP BY subject;
SELECT subject,
       COUNT(*) AS num_students
FROM student_marks
GROUP BY subject;
SELECT subject, AVG(marks) AS avg_marks
FROM student_marks
GROUP BY subject
HAVING AVG(marks) > 90;
SELECT subject, COUNT(*) AS num_students
FROM student_marks
GROUP BY subject
HAVING COUNT(*) > 1;

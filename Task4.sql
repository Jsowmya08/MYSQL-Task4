USE elevatelabs;

-- creating a table
CREATE TABLE Marks (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    marks_obtained INT NOT NULL
);

-- inserting data in the table
INSERT INTO Marks (student_name, subject, marks_obtained) VALUES
('Aarav',  'Math',       85),
('Aarav',  'Science',    78),
('Aarav',  'English',    92),
('Diya',   'Math',       68),
('Diya',   'Science',    74),
('Diya',   'English',    80),
('Rohan',  'Math',       90),
('Rohan',  'Science',    88),
('Rohan',  'English',    75),
('Meera',  'Math',       55),
('Meera',  'Science',    60),
('Meera',  'English',    58);

SELECT
    COUNT(*) AS total_records,        -- total rows
    SUM(marks_obtained) AS total_marks, -- sum of all marks
    AVG(marks_obtained) AS average_marks, -- average of all marks
    MAX(marks_obtained) AS highest_mark,  -- highest mark
    MIN(marks_obtained) AS lowest_mark    -- lowest mark
FROM Marks;

SELECT
    student_name,
    SUM(marks_obtained) AS total_marks,
    AVG(marks_obtained) AS average_marks
FROM Marks
GROUP BY student_name;

SELECT
    subject,
    AVG(marks_obtained) AS average_marks
FROM Marks
GROUP BY subject;

SELECT
    student_name,
    AVG(marks_obtained) AS average_marks
FROM Marks
GROUP BY student_name
HAVING AVG(marks_obtained) > 75;

SELECT * FROM Marks

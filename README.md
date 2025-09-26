USE elevatelabs; // uses elevatelabs database

-- creating a table
CREATE TABLE Marks (
    student_id INT AUTO_INCREMENT PRIMARY KEY,  // student_id will be incremented automatically 
    student_name VARCHAR(100) NOT NULL, // student_name will not accept null values.
    subject VARCHAR(50) NOT NULL, // subject will not accept null values.
    marks_obtained INT NOT NULL   // marks_obtained will not accept null values.
);


-- inserting values
INSERT INTO Marks (student_name, subject, marks_obtained) VALUES  //It says: insert into the Marks table, supplying values for the listed columns (student_name, subject, marks_obtained).
('Aarav', 'Math', 85), //First row to insert: student_name='Aarav', subject='Math', marks_obtained=85. The trailing comma indicates more rows follow.
('Aarav', 'Science', 78),  //Second row: Aarav — Science — 78.  etc.....


SELECT   // Begins a SELECT statement. The following lines list the columns/expressions to return.
    COUNT(*) AS total_records,    //COUNT(*) counts rows even if some columns are NULL. // AS total_marks  gives the resultcolumn alias name as total_records 
    SUM(marks_obtained) AS total_marks,  //SUM(marks_obtained) computes the sum of marks_obtained over all rows. If any marks_obtained value were NULL it would be ignored by SUM.Alias total_marks.
    AVG(marks_obtained) AS average_marks, //AVG(...) computes the arithmetic mean of marks_obtained (sum / count of non-NULL values). Result can be fractional (decimal).Alias average_marks.
    MAX(marks_obtained) AS highest_mark,  //MAX(marks_obtained) AS highest_mark, -- highest mark MAX(...) returns the largest marks_obtained value (here 92).Alias highest_mark.
    MIN(marks_obtained) AS lowest_mark  // returns lowest value Alias lowest_mark
FROM Marks;   //Specifies the table these aggregates operate on. The semicolon ends the SELECT statement.


SELECT   
    student_name,  // selects student_name column
    SUM(marks_obtained) AS total_marks, //For each group (student), compute the sum of their marks. Alias total_marks.
    AVG(marks_obtained) AS average_marks  //For each group (student), compute their average marks. Alias average_marks.
FROM Marks  // data source
GROUP BY student_name;  //Groups rows by student_name. The aggregates (SUM, AVG) are computed per student. The statement returns one row per distinct student_name with total_marks and average_marks.

SELECT
    subject,  // selects subject column
    AVG(marks_obtained) AS average_marks  //Compute average marks per subject.
FROM Marks
GROUP BY subject; // Group rows by subject and compute the AVG for each subject (one row per subject).

SELECT
    student_name,  //Grouping column to return.
    AVG(marks_obtained) AS average_marks   //Compute average marks per student.
FROM Marks  //Data source.
GROUP BY student_name  //Group by student.
HAVING AVG(marks_obtained) > 75;  //HAVING filters groups after aggregation. This keeps only groups (students) whose average marks are greater than 75.


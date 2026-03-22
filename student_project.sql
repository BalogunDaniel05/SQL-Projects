
CREATE DATABASE student_result_system;


-- Tables
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credit_unit INT
);

CREATE TABLE Results (
    result_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    score INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Data
INSERT INTO Students VALUES
(1, 'Daniel', 'Olawale', 'Computer Science'),
(2, 'James', 'Smith', 'Software Engineering');

INSERT INTO Courses VALUES
(1, 'Database Systems', 3),
(2, 'Data Structures', 3);

INSERT INTO Results VALUES
(1, 1, 1, 85, 'A'),
(2, 1, 2, 78, 'B');

-- Queries
SELECT s.first_name, c.course_name, r.score
FROM Results r
JOIN Students s ON r.student_id = s.student_id
JOIN Courses c ON r.course_id = c.course_id;

SELECT AVG(score) FROM Results;

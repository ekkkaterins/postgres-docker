CREATE DATABASE IF NOT EXISTS academy;
\c academy;
CREATE TABLE IF NOT EXISTS Students (
    s_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    start_year INT
);
CREATE TABLE IF NOT EXISTS Courses (
    c_no SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    hours INT
);
CREATE TABLE IF NOT EXISTS Exams (
    id SERIAL PRIMARY KEY,
    s_id INT REFERENCES Students(s_id) ON DELETE CASCADE,
    c_no INT REFERENCES Courses(c_no) ON DELETE CASCADE,
    score INT NOT NULL
);

INSERT INTO Students (name, start_year) VALUES
    ('Kate', 2020),
    ('Jack', 2022);
INSERT INTO Courses (title, hours) VALUES
    ('Math', 160),
    ('English', 200);
INSERT INTO Exams (s_id, c_no, score) VALUES
    (1,1,99),
    (1,2,55),
    (2,1,67),
    (2,2,0);

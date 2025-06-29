DROP DATABASE IF EXISTS StudentCourseDB;
CREATE DATABASE StudentCourseDB;
USE StudentCourseDB;

-- 1. Create Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- 2. Create Instructors Table
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    hire_date DATE
);

-- 3. Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    dob DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- 4. Create Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT,
    instructor_id INT,
    department_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- 5. Create Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Electronics');

INSERT INTO Instructors (instructor_id, name, email, hire_date) VALUES
(101, 'Dr. Asha Mehta', 'asha@univ.edu', '2015-06-10'),
(102, 'Dr. Rahul Iyer', 'rahul@univ.edu', '2012-08-20'),
(103, 'Dr. Neha Reddy', 'neha@univ.edu', '2018-01-15'),
(104, 'Dr. Manoj Kulkarni', 'manoj@univ.edu', '2014-04-05'),
(105, 'Dr. Anjali Desai', 'anjali@univ.edu', '2016-03-25');

INSERT INTO Students (student_id, name, email, dob, department_id) VALUES
(201, 'Karan Sharma', 'karan@student.com', '2001-04-12', 1),
(202, 'Sneha Rao', 'sneha@student.com', '2002-07-25', 2),
(203, 'Amit Verma', 'amit@student.com', '2000-11-03', 1),
(204, 'Priya Nair', 'priya@student.com', '2001-02-28', 3),
(205, 'Ravi Deshmukh', 'ravi@student.com', '2002-06-10', 2),
(206, 'Neha Pillai', 'neha@student.com', '2001-08-17', 3),
(207, 'Ramesh Yadav', 'ramesh@student.com', '2000-12-02', 4),
(208, 'Divya Menon', 'divya@student.com', '2001-05-14', 1),
(209, 'Arjun Patil', 'arjun@student.com', '2002-01-23', 2),
(210, 'Meera Iyer', 'meera@student.com', '2001-09-08', 3),
(211, 'Ankit Gupta', 'ankit@student.com', '2002-11-19', 1),
(212, 'Lakshmi R', 'lakshmi@student.com', '2001-10-30', 2),
(213, 'Nikhil Singh', 'nikhil@student.com', '2000-08-12', 1),
(214, 'Swati Shah', 'swati@student.com', '2001-12-25', 4),
(215, 'Tarun Jadhav', 'tarun@student.com', '2002-03-15', 3),
(216, 'Vidya S', 'vidya@student.com', '2001-06-22', 1),
(217, 'Yash Mehta', 'yash@student.com', '2000-07-03', 2),
(218, 'Ayesha Khan', 'ayesha@student.com', '2001-05-05', 4),
(219, 'Deepak Raj', 'deepak@student.com', '2002-10-02', 3),
(220, 'Ritika Das', 'ritika@student.com', '2001-11-11', 2);


INSERT INTO Courses (course_id, course_name, credits, instructor_id, department_id) VALUES
(301, 'Data Structures', 4, 101, 1),
(302, 'Linear Algebra', 3, 102, 2),
(303, 'Quantum Mechanics', 4, 103, 3),
(304, 'Digital Circuits', 3, 104, 4),
(305, 'Operating Systems', 4, 101, 1),
(306, 'Probability & Stats', 3, 105, 2);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date, grade) VALUES
(401, 201, 301, '2024-01-15', 'A'),
(402, 201, 302, '2024-01-15', 'B'),
(403, 202, 302, '2024-01-16', 'A'),
(404, 203, 301, '2024-01-16', 'A'),
(405, 204, 303, '2024-01-17', 'B'),
(406, 205, 302, '2024-01-18', 'C'),
(407, 206, 303, '2024-01-18', 'A'),
(408, 207, 304, '2024-01-19', 'B'),
(409, 208, 301, '2024-01-19', 'A'),
(410, 209, 302, '2024-01-20', 'B'),
(411, 210, 303, '2024-01-20', 'C'),
(412, 211, 305, '2024-01-21', 'A'),
(413, 212, 306, '2024-01-21', 'B'),
(414, 213, 301, '2024-01-22', 'A'),
(415, 214, 304, '2024-01-22', 'B'),
(416, 215, 303, '2024-01-23', 'C'),
(417, 216, 305, '2024-01-23', 'A'),
(418, 217, 306, '2024-01-24', 'B'),
(419, 218, 304, '2024-01-24', 'C'),
(420, 219, 303, '2024-01-25', 'A'),
(421, 220, 306, '2024-01-25', 'B'),
(422, 202, 306, '2024-01-26', 'A'),
(423, 204, 301, '2024-01-26', 'B'),
(424, 211, 301, '2024-01-27', 'A'),
(425, 216, 301, '2024-01-27', 'A');

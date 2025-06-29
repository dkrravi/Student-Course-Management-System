use studentcoursedb;


-- Which students got an 'A' grade in any course?
SELECT s.student_id, s.name AS student_name, c.course_name, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.grade = 'A'
ORDER BY s.student_id;

-- How many students are there in each department?
SELECT d.department_name, COUNT(s.student_id) AS student_count
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
GROUP BY d.department_name
ORDER BY student_count DESC;


-- What is the average grade per course?

SELECT 
    c.course_name,
    ROUND(AVG(
        CASE e.grade
            WHEN 'A' THEN 4
            WHEN 'B' THEN 3
            WHEN 'C' THEN 2
            ELSE 0
        END
    ), 2) AS average_grade_points
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_name
ORDER BY average_grade_points DESC;


-- Which instructor teaches which courses?
SELECT i.instructor_id, i.name AS instructor_name, c.course_id, c.course_name
FROM Courses c
JOIN Instructors i ON c.instructor_id = i.instructor_id
ORDER BY i.instructor_id;

-- Which students are in the Computer Science department?
SELECT s.student_id, s.name AS student_name, s.email, d.department_name
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science'
ORDER BY s.student_id;


-- What are the most recently enrolled students?
SELECT s.student_id, s.name AS student_name, e.course_id, e.enrollment_date
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
ORDER BY e.enrollment_date DESC
LIMIT 5;

-- What are the names and emails of all instructors?
SELECT instructor_id, name AS instructor_name, email
FROM Instructors
ORDER BY instructor_id;

-- Which student has enrolled in the most number of courses?

SELECT 
    s.student_id, 
    s.name AS student_name, 
    COUNT(e.course_id) AS course_count
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
GROUP BY s.student_id, s.name
ORDER BY course_count DESC
LIMIT 1;

-- Which course has the highest number of enrollments?
SELECT 
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS enrollment_count
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_id, c.course_name
ORDER BY enrollment_count DESC
LIMIT 1;

-- What is the distribution of grades in each course?

SELECT 
    c.course_name,
    e.grade,
    COUNT(*) AS grade_count
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_name, e.grade
ORDER BY c.course_name, e.grade;


-- Which instructors were hired before 2015?

SELECT instructor_id, name AS instructor_name, email, hire_date
FROM Instructors
WHERE hire_date < '2015-01-01'
ORDER BY hire_date;


-- Which students were born after the year 2001?
SELECT student_id, name AS student_name, email, dob
FROM Students
WHERE dob > '2001-12-31'
ORDER BY dob;

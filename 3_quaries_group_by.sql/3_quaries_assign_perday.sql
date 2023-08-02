SELECT day, count(*) as total_assignments 
FROM assignments
GROUP BY day
ORDER BY day;

SELECT day, count(*) as total_assignments 
FROM assignments
GROUP BY day
HAVING count(*) >= 10
ORDER BY day;

SELECT cohorts.name as cohort_name, count(students) as student_count
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING count(students) >= 18
ORDER BY student_count;


SELECT cohorts.name as cohort_name, count(assignment_submissions) as student_count
FROM cohorts 
JOIN students ON students.cohort_id = cohorts.id
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
GROUP BY cohorts.name
ORDER BY student_count DESC;


SELECT students.name as student, AVG(duration) as average_assignment_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS  NULL
GROUP BY students.name
ORDER BY average_assignment_duration DESC;


SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;
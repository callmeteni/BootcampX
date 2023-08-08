SELECT name , count(assistance_requests) as total_assistances
FROM teachers
JOIN assistance_requests
ON assistance_requests.teacher_id = teachers.id
WHERE name  = 'Waylon Boehm'
GROUP BY name;


SELECT count(assistance_requests) as total_assistances, name
FROM students
JOIN assistance_requests
ON assistance_requests.student_id = students.id
WHERE name = 'Elliot Dickinson'
GROUP BY name;

SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (completed_at - started_at) as duration
FROM assistance_requests
JOIN students ON  students.id = student_id
JOIN teachers ON teachers.id = teacher_id
JOIN assignments ON assignments.id = assignment_id
ORDER BY duration ASC;


SELECT AVG(completed_at - started_at) as average_assistance_request_duration
FROM assistance_requests;

SELECT cohorts.name as name, AVG(completed_at - started_at) as average_assistance_time
FROM assistance_requests
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time;



SELECT cohorts.name, AVG(completed_at - started_at) as average_assistance_time
FROM assistance_requests 
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC; 
/* LIMIT 1 */



SELECT avg(started_at - created_at) as average_wait_time
FROM assistance_requests
/* LIMIT 1 */


SELECT cohorts.name, sum(completed_at - started_at) as total_duration
FROM assistance_requests 
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_duration DESC;

SELECT avg (total_duration) as average_total_duration
FROM (
  SELECT cohorts.name as cohort, sum(completed_at-started_at) as total_duration
  FROM assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts.name
  ORDER BY total_duration
) as total_durations;

SELECT assignments.id, name, day, chapter, count(assistance_requests) as total_requests
FROM assignments
JOIN assistance_requests ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;

SELECT day, count(*) as number_of_assignments, sum(duration) as duration
FROM assignments
GROUP BY day
ORDER BY day;

SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teacher;



SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;

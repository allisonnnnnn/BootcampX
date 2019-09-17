SELECT cohorts.name as name, AVG(completed_at -started_at) as  average_assistance_time
FROM students
  JOIN assistance_requests ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;
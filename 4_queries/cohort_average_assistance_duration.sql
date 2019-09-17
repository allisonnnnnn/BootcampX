

SELECT AVG(subtable.total_duration) as average_total_duration
FROM (
SELECT sum(completed_at - started_at) as total_duration
  FROM cohorts
    JOIN students ON cohorts.id = cohort_id
    JOIN assistance_requests ON students.id = student_id
  GROUP BY cohorts.name
) AS subtable

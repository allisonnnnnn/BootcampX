SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (assistance_requests.completed_at -assistance_requests.started_at ) as duration
FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students on students.id = student_id
  JOIN assignments ON assignments.id = assignment_id

ORDER BY duration;
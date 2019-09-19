const { Pool } = require("pg");

const pool = new Pool({
  user: "mengting",
  password: "123",
  host: "localhost",
  database: "bootcampx"
});

const text = `
SELECT teachers.name
as teacher, cohorts.name as cohort, count
(assistance_requests) as total_assistances
FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = $1
GROUP BY teacher,cohort
ORDER BY teacher;
`;
const cohortName = process.argv[2];
const values = [`${cohortName}`];

pool
  .query(text, values)
  .then(res => {
    res.rows.forEach(teacher => {
      console.log(`${teacher.cohort} : ${teacher.teacher}`);
    });
  })
  .catch(err => {
    console.error("query error", err.stack);
  });

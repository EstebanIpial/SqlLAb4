--- queries
---1)
SELECT dept, title
from Instructor ;

---2)
SELECT name,program
from student as stu
WHERE stu.student_id=7656;

---3)
SELECT name 
FROM enrolls
INNER JOIN student on student.student_id = enrolls.student_id and enrolls.course_id=837873;

---4)
create view better_students as select name
 from student 
  join enrolls on student.student_id = enrolls.student_id
  WHERE enrolls.year >= 1900 and enrolls.year <= 2018 and enrolls.grade > 4.5;


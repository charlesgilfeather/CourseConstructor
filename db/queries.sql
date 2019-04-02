-- 1. For each course, list all the prerequisites of that course.
select c.cno, p.prerequisite_cno
from course c
left join course_prerequisite p
on c.cno = p.cno
group by c.cno, p.prerequisite_cno
order by c.cno asc;

-- 2. For each department, list the total numbers of students, total number of credit hours taken by these students, and the average credit hour per student.
select d.dname, count(distinct t1.ssn) as stu_ct, sum(t2.credits) as tl_cr, sum(t2.credits) / count(distinct t1.ssn) as avg_cr
from department d,
      (select ssn, major_dept, minor_dept from student) t1,
      (select c.credits, t.student_ssn as ssn from transcript t, course c where t.cno = c.cno) t2
where (t1.major_dept = d.dno or t1.minor_dept = d.dno) and (t2.ssn = t1.ssn)
group by d.dname;

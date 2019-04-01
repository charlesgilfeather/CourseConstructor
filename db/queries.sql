-- 1. For each course, list all the prerequisites of that course.
select c.cno, p.prerequisite_cno
from course c
left join course_prerequisite p
on c.cno = p.cno
group by c.cno, p.prerequisite_cno
order by c.cno asc;

/*
    exercises 4 
    查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩(没成绩的显示为 null )
*/

-- version 1
-- left join/right join区别：left join以左边为基准，左右有的，但是右边没有的，右边join过来的会显示NULL
-- 所以这题里应该是left join，如果right join，不会出现NULL
select t1.SId, t1.Sname, t1.Sage, t2.courseCount, t2.totalScore
from Student t1
left join (
    select SId as id, count(SId) as courseCount, sum(score) as totalScore
    from SC
    group by SId
)t2
on t1.SId = t2.id;

-- version 2
-- 直接from两个表
select t1.SId, t1.Sage, count(t2.SId) as allCourse, sum(t2.score) as totalScore
from Student as t1, (
    select SId, count(Sid) as totalCourse, sum(score) as totalScore
    from SC t2
    group by SId
) t2
where t1.SId = t2.SId;
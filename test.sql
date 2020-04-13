select t1.SId, t1.Sage, count(t2.SId) as allCourse, sum(t2.score) as totalScore
from Student as t1, (
    select SId, count(Sid) as totalCourse, sum(score) as totalScore
    from SC t2
    group by SId
) t2
where t1.SId = t2.SId
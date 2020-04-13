-- solution 1. not correct. 这样选出来的是所有同时都选了3门课的同学
select s.SId, s.Sname
from Student s
inner join (select SId from SC where CId = 01) t1 on s.SId = t1.SId
inner join (select SId from SC where CId = 02) t2 on s.SId = t2.SId
inner join (select SId from SC where CId = 03) t3 on s.SId = t3.SId



-- 从SC选出01同学所有的课(共3门课) -> 得到每门客包含的同学(3张表) -> 合并这三张表(忽略掉重复的SId)
select *
from Student
where Student.SId in
    (
        select distinct SId
        from SC
        where CId in
        (
            select CId
            from SC
            where SId = 07
        )
    )
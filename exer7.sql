/*
    查询没有学全所有课程的同学的信息
    having/where
    having可以筛选成组后的各组数据，where在聚合前先筛选数据。
    也就是说where作用在group by和having之前；having在聚合后对组记录进行筛选。
*/

select *
from Student
where SId in(
    select SId
    from SC
    group by SId
    having count(CId) < (
        select count(CId)
        from Course
    )
)
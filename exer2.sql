-- 会显示两列SId，如何去掉重复的SId?
-- 最上面的select是从student以及 right join内去选择，因为这里直接写的*，所以会列出student以及right join里的所有列
-- 所以会有两列SId. 因此，在第一个select里制定要显示的列就好了
select * from Student right join (
    select SId, avg(score) as x
    from SC
    group by SId
    having avg(score)>60
)r
on Student.SId = r.SId;


--好像不推荐这种写法
select Student.SId, Student.Sname, ss
from Student, (
    select SId, avg(score) as ss
    from SC
    group by SId
    having avg(score)>60
) r
where Student.SId =  r.SId;
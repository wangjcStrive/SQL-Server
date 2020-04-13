/*
    查询学过「张三」老师授课的同学的信息
*/
select student.* from student,teacher,course,sc
where 
    student.sid = sc.sid 
    and sc.cid = course.cid
    and course.tid = teacher.tid 
    and Teacher.Tname = '张三';
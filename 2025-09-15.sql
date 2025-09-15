select * from student;
select * from score;
select * from hakjum;
select name stu_name, total score, h.grade from student s, score sc, hakjum h
        where s.studno=sc.studno and sc.total between min_point and max_point;
        
select name stu_name, total score, h.grade from student s, score sc, hakjum h
        where s.studno=sc.studno and 
        sc.total >= min_point and sc.total <= max_point;
select * from professor;
select s.name stu_name, p.name prof_name  from student s,professor p
            where s.profno=p.profno(+);
            
select s.name stu_name, p.name prof_name  from student s,professor p
            where s.profno(+)=p.profno;

select s.name stu_name, p.name prof_name  from student s,professor p
            where s.profno(+)=p.profno 
            union all
            select s.name stu_name, p.name prof_name  from student s,professor p
            where s.profno=p.profno(+);
        
select s.name stu_name, p.name prof_name  from student s,professor p
            where s.profno=p.profno(+);
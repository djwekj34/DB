select * from student;
select count(*), count(comm) from emp;
select * from emp;
select count(comm), sum(comm) from emp;
select count(comm), sum(comm), avg(comm) from emp;
select max(sal),min(sal) from emp;
select max(hiredate) "max", min(hiredate) from emp;
select deptno,round( avg(nvl(sal, 0)),2) "avg" from emp group by deptno;
select deptno,avg(nvl(sal,0)) "avg_sal" from emp group by deptno, job order by deptno;
select max(sal+nvl(comm,0)) "max" , min(sal+nvl(comm,0)) min ,
                                    round (avg(sal+nvl(comm,0)),1) avg from emp;
select * from student;
select substr(birthday,4,2) bir, count(*) from student 
    group by substr(birthday,4,2) order by bir;
select count(*)|| 'EA' "total", 
        count(decode(to_char(birthday,'mm'),'01',0)) || 'EA' "JAN",
        count(decode(to_char(birthday,'mm'),'02',0)) || 'EA' "FEB",
        count(decode(to_char(birthday,'mm'),'03',0)) || 'EA' "MAR",
        count(decode(to_char(birthday,'mm'),'04',0)) || 'EA' "APR",
        count(decode(to_char(birthday,'mm'),'05',0)) || 'EA' "MAY",
        count(decode(to_char(birthday,'mm'),'06',0)) || 'EA' "JUN",
        count(decode(to_char(birthday,'mm'),'07',0)) || 'EA' "JUL",
        count(decode(to_char(birthday,'mm'),'08',0)) || 'EA' "AUG",
        count(decode(to_char(birthday,'mm'),'09',0)) || 'EA' "SEP",
        count(decode(to_char(birthday,'mm'),'10',0)) || 'EA' "OCT",
        count(decode(to_char(birthday,'mm'),'11',0)) || 'EA' "NOV",
        count(decode(to_char(birthday,'mm'),'12',0)) || 'EA' "DEC"
        from student;

select count(*)|| 'EA' "total", count(decode(substr(birthday,4,2),'01',0)) || 'EA' "JAN"
        from student;
select count(*) "total", 
       count(decode(substr(tel,1,instr(tel,')')-1),'02',0)) "SEOUL",
       count(decode(substr(tel,1,instr(tel,')')-1),'031',0)) "GYEONGGI",
       count(decode(substr(tel,1,instr(tel,')')-1),'051',0)) "BUSAN",
       count(decode(substr(tel,1,instr(tel,')')-1),'052',0)) "ULSAN",
       count(decode(substr(tel,1,instr(tel,')')-1),'053',0)) "DAEGU",
       count(decode(substr(tel,1,instr(tel,')')-1),'055',0)) "GYEONGNAM"
       from student;

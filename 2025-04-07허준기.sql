--¹®Á¦1
select * from student;
select name ||' ''s ID :'||ID||',  weight is '|| weight ||'Kg' from student;
select * from emp;
select ename || '( ' || job || ' ) ,' ||ename ||' '' ' ||job||' '' ' from emp; 
select  ename ||' '' s   sal  is $' || sal  from emp;
select empno , ename from emp where empno = 7900;
select empno , ename, sal from emp where sal < 1000;
select ename , sal, deptno from emp where deptno = 10;
select ename , sal+100, deptno from emp where deptno = 10;
select ename , hiredate from emp where hiredate < = '81/12/25';
select empno, ename ,sal from emp where sal Between 2450 and 3000;
select empno, ename ,sal from emp where sal > = 2450 and sal<=3000;
select empno ,ename, deptno from emp where deptno in (10,20);
select empno ,ename, deptno from emp where ename in ('KING','FORD');
select empno , ename , sal from emp where sal LIKE '1%';
select empno , ename , sal from emp where ename LIKE 'A%';
select empno , ename , hiredate from emp where hiredate LIKE '%80%';
select empno , ename , hiredate from emp where ename LIKE '__AR%';
select ename , hiredate ,sal from emp where hiredate > '81-01-01' and sal >=3000;
select ename , hiredate ,sal from emp where hiredate > '82-01-01' or sal >=3000;
select studno,name ,deptno1,1 from student where deptno1 = 101 
Union all
select profno , name ,deptno, 2 from professor where deptno = 101;

select * from dept;
select * from emp;
select job, empno, ename, hiredate from emp;
select distinct job from emp;
select ename, sal, from emp where sal>=2850
select ename, deptno from emp where empno=7566;
select ename, sal from emp where sal not between 1500 and 2850;
select job, hiredate,ename from emp where hiredate between '1981/2/20' and '1981/5/1' order by hiredate;
select ename, deptno from emp where deptno in(10,30) order by ename;
select ename "employee", sal "Monthly Salary" from emp where deptno in(10,30) and sal>1500;
select ename, job from emp where mgr is null;
select ename, job, comm from emp where comm is not null order by sal desc;
select ename from emp where ename like '__A%';
select ename from emp where ename like '%L%L%' and deptno=30;
select ename, job, sal from emp where job in('Clerk', 'Analyst') and sal not in(1000,3000,5000);
select ename, deptno, sal, round((sal*1.15),0) "New Salary" from emp;
select ename, deptno, sal, round((sal*1.15),0) "New Salary", round((sal*1.15),0)-sal "Increase" from emp; 
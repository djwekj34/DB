--3�� �������Լ� ��������

--1) emp ���̺��� ����Ͽ� ��� �߿��� �޿�(sal)�� ���ʽ�(comm)�� ��ģ �ݾ��� ���� ���� ���� ���� ���� ���, ��ձݾ��� ���ϼ���.
--��, ���ʽ��� ���� ���� ���ʽ��� 0 ���� ����ϰ� ��� �ݾ��� ��� �Ҽ��� ù° �ڸ������� ������ �ϼ���.
SELECT 
    ROUND(MAX(sal + NVL(comm, 0)), 1) AS max_total,
    ROUND(MIN(sal + NVL(comm, 0)), 1) AS min_total,
    ROUND(AVG(sal + NVL(comm, 0)), 1) AS avg_total
FROM emp;


--2) student ���̺��� birthday Į���� �����ؼ� �Ʒ��� ���� ������ ���� �ڼ��� ����ϼ���.
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

--3) Student ���̺��� tel Į���� �����Ͽ� �Ʒ��� ���� ������ �ο����� ����ϼ���.
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
--4) ����emp���̺��Ʒ��ǵΰ��ǵ����͸��Է��Ͻ����۾��ϼ���.
--Emp���̺�������Ͽ��Ʒ���ȭ������̺μ��������޺��α޿��հ���������ϼ���
insert into emp(empno,deptno,ename,sal)values(1000,10,'Tiger',3000);
insert into emp(empno,deptno,ename,sal)values(2000,30,'cat',3000);
select deptno,sum(sal)from emp group by deptno,job order by deptno;
select deptno,sum(decode(job,'CLERK',sal,0)) "CLERK",
            sum(decode(job,'MANAGER',sal,0)) "MANAGER",
            sum(decode(job,'PRESIDENT',sal,0)) "PRESIDENT",
            sum(decode(job,'ANALYST',sal,0)) "ANALYST",
            sum(decode(job,'SALEMAN',sal,0)) "SALEMAN",
            sum(sal) "TOTAL"
            from emp group by deptno order by deptno;

--5) emp���̺�������Ͽ��������Ǳ޿�����ü�޿��Ǵ����޿��ݾ��̾Ʒ��� ������ ����ϼ���. 
-- ��, �޿��������������������ؼ�����ϼ���.
select*from emp;

select deptno,ename,sal,sum(sal) over(order by sal)total from emp;
select deptno,ename,sal,sum(sal) over()total from emp;
--6) fruit ���̺����Ʒ��Ͱ������·�����ϼ���.
select max(sum(decode(name,'apple',100))) APPLE,
    max(sum(decode(name,'grape',200))) "GRAPE",
    max(sum(decode(name,'orange',200))) "ORANGE"
    from fruit group by name;

--7) student ���̺���Tel �÷�������Ͽ��Ʒ��Ͱ����������ο�������ü��������ϴº���������ϼ���.
select count(*)||'EA('||count(*)/count(*)*100||"%)' TOTAL,
    count(decode(substr(tel,1,instr(tel,')'-1),'02',0))||'EA('||
    count(decode(substr(tel,1,instr(tel,
--7) student ���̺��� Tel Į���� ����Ͽ� �Ʒ��� ���� ������ �ο����� ��ü ��� �����ϴ� ������ ����ϼ���.
select count(*)||'EA('||count(*)*100||'%)' TOTAL,
    count(decode(substr(tel,1,instr(tel,')')-1),'02',0))||'EA('||
    count(decode(substr(tel,1,instr(tel,')')-1),'02',0))/count(*)*100||'%)' SEOUL,
    count(decode(substr(tel,1,instr(tel,')')-1),'031',0))||'EA('||
    count(decode(substr(tel,1,instr(tel,')')-1),'031',0))/count(*)*100||'%)'GYEONGGI,
    count(decode(substr(tel,1,instr(tel,')')-1),'051',0))||'EA('||
    count(decode(substr(tel,1,instr(tel,')')-1),'051',0))/count(*)*100||'%)' BUSAN,
    count(decode(substr(tel,1,instr(tel,')')-1),'052',0))||'EA('||
    count(decode(substr(tel,1,instr(tel,')')-1),'052',0))/count(*)*100||'%)' ULSAN,
    count(decode(substr(tel,1,instr(tel,')')-1),'053',0))||'EA('||
    count(decode(substr(tel,1,instr(tel,')')-1),'053',0))/count(*)*100||'%)' DEAGU,
    count(decode(substr(tel,1,instr(tel,')')-1),'055',0))||'EA('||
    count(decode(substr(tel,1,instr(tel,')')-1),'055',0))/count(*)*100||'%)' GYEONGNAM
    from student;
select deptno,ename,sal,sum(sal) over(partition by deptno order by sal)TOTAL
    from emp;

--8) emp ���̺��� ����Ͽ� �Ʒ��� ���� �μ����� �޿� �����հ谡 �������� ����ϼ���.( �� �μ� ��ȣ�� �������� ����ϼ���. )
select deptno,ename,sal,sum(sal) over() from emp group by deptno,ename,sal;
select deptno,ename,sal, sum(sal) over(),
    round(sal/sum(sal) over()*100,2)"TOTAL_SAL" from emp
    group by deptno,ename,sal order by 5 desc;

--9) emp ���̺��� ����Ͽ� �Ʒ��� ���� �� ����� �޿����� ��ü ���� �޿� �Ѿ׿��� ��%�� ������ �����ϴ��� ����ϼ���.
--��, �޿� ������ ���� ����� ���� ��µǵ��� �ϼ���.
select deptno,ename,sal, sum(sal) over(),
    round(ratio_to_reprot(sal) over()*100,2)"TOTAL_SAL" from emp
    order by 5 desc;

--10)emp ���̺��� ��ȸ�Ͽ� �Ʒ��� ���� �� �������� �޿��� �ش� �μ� �հ�ݾ׿��� ��%�� ������ �����ϴ����� ����ϼ���.
--��, �μ� ��ȣ�� �������� ������������ ����ϼ���.
select deptno,ename,sal,sum(sal) over(partition by deptno)"SUM_DEPT",
    round((sal/sum(sal) over(partition by deptno))*100,2)"%" from emp order by 1,2;
    
select deptno ename,sal,sum(sal) over(partition by deptno)"SUM DEPT",
    round(ratio_to_reprot(sal) over(partition by deptno)*100,2)"%" from emp
    order by 1,3 desc;
--11) loan ���̺��� ����Ͽ� 1000�� ������ ���� ������ ����ϵ� ��������, ���� �����ڵ�, ����Ǽ�, ���� �Ѿ�, ���� ����ݾ��� �Ʒ��� ���� ����ϼ���.
select l_date "��������",l_code ���������ڵ�,��_qty ����Ǽ�,l_total �����Ѿ�,
    sum(l_total)over(order by l_total)��������ݾ�
    from loan where l_store=1000;


--12) loan ���̺��� ����Ͽ� ��ü ������ ���� �����ڵ�, ���� ����, ��������, ����Ǽ�, ������� ���� �ڵ�� ���� �������� ���� �հ踦 ���ϼ���.
select l_code ���������ڵ�,l_store ��������,l_date ��������,l_qty ����Ǽ�,l_total �����,
    sum(l_total)over(partition by l_code,l_store order by l_date)��������ݾ�
    from loan;


--13) loan ���̺��� ��ȸ�Ͽ� 1000�� ������ ���� ������ ���� �ڵ庰�� ���ļ� ��������, ���� �����ڵ�, ����Ǽ�, ���� �Ѿ�, �ڵ庰 ���� ����ݾ��� �Ʒ��� ���� ����ϼ���.
select l_date ��������,l_code ���ⱸ���ڽ�, ��_qty ����Ǽ�, l_total �����Ѿ�,
    sum(l_total) over(partition by l_code order by l_total) �ڵ庰��������ݾ�
    from loan where l_store=1000;


--14) professor ���̺��� �� �������� �޿��� ���ϰ� �� ������ �޿����� ��ü ������ �޿� �հ迡�� �����ϴ� ������ ����ϼ���.
SELECT name,pay,ROUND(pay / (SELECT SUM(pay) FROM professor) * 100, 2) AS ratio
FROM professor
ORDER BY ratio DESC;
--15) professor ���̺��� ��ȸ�Ͽ� �а� ��ȣ, ������, �޿�, �а��� �޿� �հ踦 ���ϰ� �� ������ �޿��� �ش� �а��� �޿� �հ迡�� �����ϴ� ������ ����ϼ���.
SELECT deptno, name, pay,(SELECT SUM(p2.pay)
    FROM professor p2
    WHERE p2.deptno = p1.deptno) AS dept_pay_sum,ROUND(pay / (SELECT SUM(p2.pay)
    FROM professor p2
    WHERE p2.deptno = p1.deptno) * 100, 2) AS ratio
FROM professor p1;

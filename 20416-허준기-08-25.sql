--3�� �������Լ� ��������
--1) emp ���̺��� ����Ͽ� ��� �߿��� �޿�(sal)�� ���ʽ�(comm)�� ��ģ �ݾ��� ���� ���� ���� ���� ���� ���, ��ձݾ��� ���ϼ���.
--��, ���ʽ��� ���� ���� ���ʽ��� 0 ���� ����ϰ� ��� �ݾ��� ��� �Ҽ��� ù° �ڸ������� ������ �ϼ���.
select * from emp;

--2) student ���̺��� birthday Į���� �����ؼ� �Ʒ��� ���� ������ ���� �ڼ��� ����ϼ���.


--3) Student ���̺��� tel Į���� �����Ͽ� �Ʒ��� ���� ������ �ο����� ����ϼ���.
--��, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU, 055-GYEONGNAM���� ����ϼ���.


--4) ���� emp ���̺� �Ʒ��� �ΰ��� �����͸� �Է��Ͻ� �� �۾��ϼ���.
--Emp ���̺��� ����Ͽ� �Ʒ��� ȭ��� ���� �μ����� ���޺��� �޿� �հ� ����� ����ϼ���.


--5) emp ���̺��� ����Ͽ� �������� �޿��� ��ü �޿��� ���� �޿� �ݾ��� �Ʒ��� ������ ����ϼ���.
-- ��, �޿��� ������������ �����ؼ� ����ϼ���.


--6) fruit ���̺��� �Ʒ��� ���� ���·� ����ϼ���.



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



--15) professor ���̺��� ��ȸ�Ͽ� �а� ��ȣ, ������, �޿�, �а��� �޿� �հ踦 ���ϰ� �� ������ �޿��� �ش� �а��� �޿� �հ迡�� �����ϴ� ������ ����ϼ���.


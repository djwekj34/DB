--2025�� 4�� 14�� 1�� Select ��������
1. �μ����̺�(DEPT)�� ��� �����͸� ����϶�.
select * from dept;

2. EMP���̺��� �� ����� ����, �����ȣ, �̸�, �Ի����� ����϶�.
select ename, job, EMPNO, HIREDATE from emp;

3. EMP���̺��� ������ ����ϵ�, �� �׸�(ROW)�� �ߺ����� �ʰ� ����϶�.
select  DISTINCT job from emp;

4. EMP���̺��� �޿��� 2850 �̻��� ����� �̸� �� �޿��� ����϶�.
select ename from emp where sal >= 2850;

5. EMP���̺��� �����ȣ�� 7566�� ����� �̸� �� �μ���ȣ�� ����϶�.
select ename, EMPNO from emp where EMPNO = 7566;

6. EMP���̺��� �޿��� 1500�̻� 2850������ ������ ������ �ʴ� ��� ����� �̸� �� �޿��� ����϶�.
select ename, sal from emp where  sal < 1500 or sal > 2850;

7. EMP���̺��� 1981�� 2�� 20��~ 1981�� 5�� 1�Ͽ� �Ի��� ����� �̸�, ���� �� �Ի����� ����ϵ�, �Ի����� �������� �ؼ� ������������ �����϶�.


8. EMP���̺��� 10�� �� 30�� �μ��� ���ϴ� ��� ����� �̸��� �μ� ��ȣ�� ����ϵ�, �̸��� ���ĺ������� �����϶�.
select ename, deptno from emp where deptno = 10 or deptno = 30;

9. EMP���̺��� 10�� �� 30�� �μ��� ���ϴ� ��� ��� �� �޿��� 1500�� �Ѵ� ����� �̸� �� �޿��� ����϶�.(�� �÷����� ���� employee �� Monthly Salary�� �����Ͻÿ�)


10. EMP���̺��� �����ڰ� ���� ��� ����� �̸� �� ������ ����϶�.


11. EMP���̺��� Ŀ�̼��� �޴� ��� ����� �̸�, �޿� �� Ŀ�̼��� ����ϵ�, �޿��� �������� ������������ �����϶�.


12. EMP���̺��� �̸��� �� ��° ���ڰ� A�� ��� ����� �̸��� ����϶�.
select ename from emp where ename like '__A%';

13. EMP���̺��� �̸��� L�� �� �� ���� �μ� 30�� �����ִ� ����� �̸��� ����϶�.
select ename ,deptno from emp where ename like '%L%L%' and deptno=30;

14. EMP���̺��� ������ Clerk �Ǵ� Analyst�̸鼭 �޿��� 1000, 3000, 5000 �� �ƴ� ��� ����� �̸�, ���� �� �޿��� ����϶�.
select ename,job,sal from emp 
       where job in('CLERK','ANALYST')
       and sal not in(1000,3000,5000);
       
select ename,job,sal from emp 
       where (job='CLERK' or   job='ANALYST')
       and (sal <>1000 and sal!=3000 and sal!=5000);

15. EMP���̺��� �����ȣ, �̸�, �޿� �׸��� 15% �λ�� �޿��� ������ ǥ���ϵ� �÷����� New Salary�� �����Ͽ� ����϶�.
select empno, ename, sal, round(sal*1.15,0)  "New Salary" from emp;

16. ������ ������ �����Ϳ��� �޿� �λ��(�� �޿����� ���� �޿��� �� ��)�� �߰��ؼ� ����϶�. �÷����� Increase�� �϶�.
select empno, ename, sal, round(sal*1.15,0)  "New Salary",round(sal*0.15,0) Increase from emp;

17. EMP���̺��� ��� ����� �̸�(ù ���ڴ� �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) �� �̸� ���̸� ǥ���ϴ� ������ �ۼ��ϰ� �÷� ��Ī�� ���� ��NAME���� ��LENENAME������ �Ͻÿ�.
select Initcap(ename) NAME, length(ename) LENENAME from emp;

18. EMP���̺��� ����� �̸��� Ŀ�̼��� ����ϵ�, Ŀ�̼��� å������ ���� ����� Ŀ�̼��� ��no commission������ ����϶�.
select * from emp;
select ename, nvl(comm, 0) from emp;

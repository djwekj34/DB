--3장 복수행함수 연습문제

--1) emp 테이블을 사용하여 사원 중에서 급여(sal)와 보너스(comm)를 합친 금액이 가장 많은 경우와 가장 적은 경우, 평균금액을 구하세요.
--단, 보너스가 없을 경우는 보너스를 0 으로 계산하고 출력 금액은 모두 소수점 첫째 자리까지만 나오게 하세요.
SELECT 
    ROUND(MAX(sal + NVL(comm, 0)), 1) AS max_total,
    ROUND(MIN(sal + NVL(comm, 0)), 1) AS min_total,
    ROUND(AVG(sal + NVL(comm, 0)), 1) AS avg_total
FROM emp;


--2) student 테이블의 birthday 칼럼을 참조해서 아래와 같이 월별로 생일 자수를 출력하세요.
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

--3) Student 테이블의 tel 칼럼을 참고하여 아래와 같이 지역별 인원수를 출력하세요.
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
--4) 먼저emp테이블에아래의두건의데이터를입력하신후작업하세요.
--Emp테이블을사용하여아래의화면과같이부서별로직급별로급여합계결과를출력하세요
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

--5) emp테이블을사용하여직원들의급여와전체급여의누적급여금액이아래와 같도록 출력하세요. 
-- 단, 급여를오름차순으로정렬해서출력하세요.
select*from emp;

select deptno,ename,sal,sum(sal) over(order by sal)total from emp;
select deptno,ename,sal,sum(sal) over()total from emp;
--6) fruit 테이블을아래와같은형태로출력하세요.
select max(sum(decode(name,'apple',100))) APPLE,
    max(sum(decode(name,'grape',200))) "GRAPE",
    max(sum(decode(name,'orange',200))) "ORANGE"
    from fruit group by name;

--7) student 테이블의Tel 컬럼을사용하여아래와같이지역별인원수와전체대비차지하는비율을출력하세요.
select count(*)||'EA('||count(*)/count(*)*100||"%)' TOTAL,
    count(decode(substr(tel,1,instr(tel,')'-1),'02',0))||'EA('||
    count(decode(substr(tel,1,instr(tel,
--7) student 테이블의 Tel 칼럼을 사용하여 아래와 같이 지역별 인원수와 전체 대비 차지하는 비율을 출력하세요.
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

--8) emp 테이블을 사용하여 아래와 같이 부서별로 급여 누적합계가 나오도록 출력하세요.( 단 부서 번호로 오름차순 출력하세요. )
select deptno,ename,sal,sum(sal) over() from emp group by deptno,ename,sal;
select deptno,ename,sal, sum(sal) over(),
    round(sal/sum(sal) over()*100,2)"TOTAL_SAL" from emp
    group by deptno,ename,sal order by 5 desc;

--9) emp 테이블을 사용하여 아래와 같이 각 사원의 급여액이 전체 직원 급여 총액에서 몇%의 비율을 차지하는지 출력하세요.
--단, 급여 비중이 높은 사람이 먼저 출력되도록 하세요.
select deptno,ename,sal, sum(sal) over(),
    round(ratio_to_reprot(sal) over()*100,2)"TOTAL_SAL" from emp
    order by 5 desc;

--10)emp 테이블을 조회하여 아래와 같이 각 직원들의 급여가 해당 부서 합계금액에서 몇%의 비중을 차지하는지를 출력하세요.
--단, 부서 번호를 기준으로 오름차순으로 출력하세요.
select deptno,ename,sal,sum(sal) over(partition by deptno)"SUM_DEPT",
    round((sal/sum(sal) over(partition by deptno))*100,2)"%" from emp order by 1,2;
    
select deptno ename,sal,sum(sal) over(partition by deptno)"SUM DEPT",
    round(ratio_to_reprot(sal) over(partition by deptno)*100,2)"%" from emp
    order by 1,3 desc;
--11) loan 테이블을 사용하여 1000번 지점의 대출 내역을 출력하되 대출일자, 대출 종목코드, 대출건수, 대출 총액, 누적 대출금액을 아래와 같이 출력하세요.
select l_date "대출일자",l_code 대출종목코드,ㅣ_qty 대출건수,l_total 대출총액,
    sum(l_total)over(order by l_total)누적대출금액
    from loan where l_store=1000;


--12) loan 테이블을 사용하여 전체 지점의 대출 종목코드, 대출 지점, 대출일자, 대출건수, 대출액을 대출 코드와 대출 지점별로 누적 합계를 구하세요.
select l_code 대출종목코드,l_store 대출지점,l_date 대출일자,l_qty 대출건수,l_total 대출액,
    sum(l_total)over(partition by l_code,l_store order by l_date)누적대출금액
    from loan;


--13) loan 테이블을 조회하여 1000번 지점의 대출 내역을 대출 코드별로 합쳐서 대출일자, 대출 구분코드, 대출건수, 대출 총액, 코드별 누적 대출금액을 아래와 같이 출력하세요.
select l_date 대출일자,l_code 대출구분코스, ㅣ_qty 대출건수, l_total 대출총액,
    sum(l_total) over(partition by l_code order by l_total) 코드별누적대출금액
    from loan where l_store=1000;


--14) professor 테이블에서 각 교수들의 급여를 구하고 각 교수의 급여액이 전체 교수의 급여 합계에서 차지하는 비율을 출력하세요.
SELECT name,pay,ROUND(pay / (SELECT SUM(pay) FROM professor) * 100, 2) AS ratio
FROM professor
ORDER BY ratio DESC;
--15) professor 테이블을 조회하여 학과 번호, 교수명, 급여, 학과별 급여 합계를 구하고 각 교수의 급여가 해당 학과별 급여 합계에서 차지하는 비율을 출력하세요.
SELECT deptno, name, pay,(SELECT SUM(p2.pay)
    FROM professor p2
    WHERE p2.deptno = p1.deptno) AS dept_pay_sum,ROUND(pay / (SELECT SUM(p2.pay)
    FROM professor p2
    WHERE p2.deptno = p1.deptno) * 100, 2) AS ratio
FROM professor p1;

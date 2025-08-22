--3장 복수행함수 연습문제
--1) emp 테이블을사용하여사원중에서급여(sal)와보너스(comm)를합친금액이가장많은경우와가장적은경우, 평균금액을구하세요. 
--단, 보너스가없을경우는보너스를0 으로계산하고출력금액은모두소수점첫째자리까지만나오게하세요.
select * from emp;

--2) student테이블의birthday 컬럼을참조해서아래와같이월별로생일자수를출력하세요


--3) Student테이블의tel컬럼을참고하여아래와같이지역별인원수를출력하세요.
--단, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU, 055-GYEONGNAM으로 출력하세요.


--4) 먼저emp테이블에아래의두건의데이터를입력하신후작업하세요.
--Emp테이블을사용하여아래의화면과같이부서별로직급별로급여합계결과를출력하세요.
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
--8) emp테이블을사용하여아래와같이부서별로급여누적합계가나오도록 출력하세요.( 단부서번호로오름차순출력하세요. )


--9) emp테이블을사용하여아래와같이각사원의급여액이전체직원급여총액에서몇%의비율을차지하는지출력하세요. 
--단, 급여비중이높은사람이먼저출력되도록하세요.


--10) emp 테이블을조회하여아래와같이각직원들의급여가해당부서합계금액에서몇%의비중을차지하는지를출력하세요. 
--단, 부서번호를기준으로오름차순으로출력하세요.

--11) loan 테이블을사용하여1000번지점의대출내역을출력하되대출일자, 대출종목코드, 대출건수, 대출총액, 누적대출금액을아래와같이출력하세요.

--12)loan 테이블을사용하여전체지점의대출종목코드, 대출지점, 대출일자, 대출건수, 대출액을대출코드와 대출지점별로 누적 합계를 구하세요.

--13) loan 테이블을조회하여1000번지점의대출내역을대출코드별로합쳐서대출일자, 대출구분코드, 대출건수, 대출총액, 코드별누적대출금액을아래와같이출력하세요.

--14) professor 테이블에서각교수들의급여를구하고각교수의급여액이전체교수의급여합계에서차지하는비율을출력하세요.


--15) professor 테이블을조회하여학과번호, 교수명, 급여, 학과별급여합계를구하고각교수의급여가해당학과별급여합계에서차지하는비율을출력하세요.
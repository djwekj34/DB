--4장 JOIN 예제문제
--등가조인
--예 1) emp 테이블과 dept 테이블을 조회하여 아래와 같이 출력하세요.

--예 2) 학생 테이블 (student) 과 교수 테이블 (professor) 을 join 하여 학생의 이름과 지도교수번호, 지도교수 이름을 출력하세요.


--예 3) 학생 테이블(student)과 학과 테이블(department) , 교수 테이블(professor) 을 Join하여 학생의 이름과 학생의 학과이름, 학생의 지도교수 이름을 출력하세요.

--비등가조인
--예 1) Custormer 테이블과 gift 테이블을 Join하여 고객별로 마일리지 포인트를 조회한 후 해당 마일리지 점수로 받을 수 있는 상품을 조회하여 고객의 이름과 받을 수 있는 상품 명을 아래와 같이 출력하세요.


--예 2) Student 테이블과 score 테이블 , hakjum 테이블을 조회하여 학생들의 이름과 점수와 학점을 출력하세요.


--outer join
--예 1 ) Student 테이블과 Professor 테이블을 Join하여 학생이름과 지도교수 이름을 출력하세요.
--단 지도교수가 결정되지 않은 학생의 명단도 함께 출력하세요.


--예 2 ) Student 테이블과 Professor 테이블을 Join하여 학생이름과 지도교수 이름을 출력하세요.
--단 지도학생이 결정되지 않은 교수의 명단도 함께 출력하세요.

--예 3 ) Student 테이블과 Professor 테이블을 Join하여 학생이름과 지도교수 이름을 출력하세요.
--단 지도학생이 결정 안 된 교수 명단과 지도 교수가 결정 안된 학생 명단을 한꺼번에 출력하세요.

--4장 JOIN 연습문제
--1. 학생 테이블 (student) 과 학과 테이블 (department) 테이블을 사용하여 학생이름, 1 전공학과번호(deptno1) , 1전공 학과 이름을 출력하세요.
select*from student;
select*from department;
 select name stu_name,deptno1,dname dept_name from student s, department d where d.deptno=s.deptno1;
 
 
--2. emp2 테이블과 p_grade 테이블을 조회하여 현재 직급이 있는 사원의 이름과 직급, 현재 연봉, 해당 직급의 연봉의 하한금액과 상한 금액을 아래 결과 화면과 같이 출력하세요.
select*from emp2;
select*from p_grade;
select e.name,e.position, pay, s_pay low_pay,e_pay high_pay from emp2 e,p_grade p 
where e.position=p.position

--3. Emp2 테이블과 p_grade 테이블을 조회하여 사원들의 이름과 나이, 현재 직급 , 예상 직급 을 출력하세요. 
--예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다.  나이는 오늘(sysdate)을 기준으로 하되 trunc 로 소수점 이하는 절삭해서 계산하세요.
select*from emp2;
select*from p_grade;
select name,trunc(months_between(sysdate,e2.birthday)/12)as age, e2.position as curr_position,p.position
    from emp2 e2,p_grade p
    where trunc(months_between(sysdate,e2.birthday)/12)between s_age and e_age order by 2;


--4 . customer 테이블과 gift 테이블을 Join하여 고객이 자기 포인트보다 낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때,
--Notebook 을 선택할 수 있는 고객명과 포인트, 상품명을 출력하세요.
select*from customer;
select * from gift;
select c.gname cust_name , point,g.gname gift_name
from customer c , gift g
where g.gname='Notebook'and c.point>=g.g_end;

--5. professor 테이블에서 교수의 번호, 교수이름, 입사일, 자신보다 입사일 빠른 사람 인원수를 출력하세요. 단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.  



--6. emp 테이블에서 사원번호, 사원이름, 입사일, 자신보다  먼저 입사한 사람 인원수를 출력하세요. 단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.


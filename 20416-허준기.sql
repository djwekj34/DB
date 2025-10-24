create table new_table
(no number(3),name varchar2(10),birth DATE);
desc new_table;
select *from new_table;

create table tt02
(no number(3,1) default 0,name varchar2(10) default 'No Name',
hiredate date default sysdate);

INSERT INTO tt02(no) values(1);
select*from tt02;

CREATE TABLE 한글테이블
(컬럼1 number,컬럼2 varchar2(10),컬럼3 date);
select*from 한글테이블;

select*from dept2;

CREATE TABLE dept3
AS
select*from dept2;
select*from dept23;
CREATE TABLE dept4
AS
select dcode,dname from dept2;
select*from dept4;
create table dept5
as select*from dept2 where 1=2;
select*from dept2;
create table dept6
as
select dcode,dname from dept2 where dcode IN(1000,1001,1002);
select * from dept6;
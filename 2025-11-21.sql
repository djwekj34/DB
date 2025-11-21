CREATE TABLE t_readonly
(no number,
name VARCHAR2(10));

select * from t_readonly;

ALTER TABLE t_readonly read only;

insert into t_readonly values(2,'BBB');

ALTER TABLE t_readonly read write;

CREATE TABLE vt1(
col1 number,
col2 number,
col3 number generated always as(col1 + col2));
select * from vt1;
insert into vt1(col1, col2) values(1,2);

update vt1 set col1=5;
select * from vt1;

alter table vt1 add(
col4 GENERATED always as((col1*12)+col2));

select column_name,
    data_type,
    data_default
from user_tab_columns
where table_name = 'VT1' ORDER;

select column_name, date_type, data_default

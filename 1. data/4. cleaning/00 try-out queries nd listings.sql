
-- ------------------------------------------------------------------------------------------
-- WHAT IS HAPPENING WITH EINs

select count(distinct(ein)) from basic_data;
select count(distinct(NAME)) from basic_data;
select count(distinct(NAME)) from f900_pc;

select count(EIN) from f990_pc;
select distinct(ein) from f990_ez;
select distinct(ein) from f990_pf;

select *, count(*) as counter from basic_data group by NAME, ZIP having counter > 1;

select * from basic_data where NAME='LITTLE LEAGUE BASEBALL INC';


drop table s;
create table s(A int2, B char(10), C char(10));

LOAD DATA LOCAL INFILE 'C:\\users\\alfonso\\desktop\\muestra.csv'
INTO TABLE s
FIELDS TERMINATED BY ' '
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

SELECT * FROM db_npo_cleaning.s;


select s.*, c.counter, c.A, c.B, c.C
from s
inner join( select A, B, C, count(*) counter
	from s
    group by A) c
    on s.A = c.A
where c.counter >1;

select *, count(*) as counter from s group by a, b having counter > 1;


select * from basic_data
natural join f990_ez;



-- CHECK ORGS VS ZIP
select ZIP, count(EIN) as num from basic_data group by ZIP order by num desc;f990_pc




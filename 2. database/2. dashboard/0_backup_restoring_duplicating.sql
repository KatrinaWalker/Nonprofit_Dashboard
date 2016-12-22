-- DIFFERENT BACKUP PROCEDURES AND RESTORING OR DUPLICATING TABLES AND SCHEMAS

-- ------------------------------------------------------------------------------------------
-- BACKUP DUPLICATE SCHEMA ------------------------------------------------------------------
drop schema db_npo;
create schema db_npo;
use db_npo;
create table basic_data like db_npo_cleaning.basic_data;
insert into basic_data (select * from db_npo_cleaning.basic_data);

create table f990_pc like db_npo_cleaning.f990_pc;
insert into f990_pc (select * from db_npo_cleaning.f990_pc);

create table f990_ez like db_npo_cleaning.f990_ez;
insert into f990_ez (select * from db_npo_cleaning.f990_ez);



create table mv_revenue like db_npo_cleaning.mv_revenue;
insert into mv_revenue (select * from db_npo_cleaning.mv_revenue);

create table mv_expenses like db_npo_cleaning.mv_expenses;
insert into mv_expenses (select * from db_npo_cleaning.mv_expenses);

create table mv_lasso like db_npo_cleaning.mv_lasso;
insert into mv_lasso (select * from db_npo_cleaning.mv_lasso);


-- DUPLICATE/BACKUP only one TABLE --------------------------------------
drop table if exists mv_r_2;
create table mv_r_2 like mv_revenue;
insert into mv_r_2 (select * from mv_revenue);

drop table mv_revenue;
create table mv_revenue like mv_r_2;
insert into mv_revenue (select * from mv_r_2);


drop table if exists mv_e_2;
create table mv_e_2 like mv_expenses;
insert into mv_e_2 (select * from mv_expenses);

drop table mv_expenses;
create table mv_expenses like mv_e_2;
insert into mv_expenses (select * from mv_e_2);

-- RESET ------------------------------------------------------------------
drop table mv_revenue;
drop table mv_expenses;


drop table if exists basic_2;
create table basic_2 select * from basic_data;

drop table if exists pc_2;
create table pc_2 select * from f990_pc;

drop table if exists ez_2;
create table ez_2 select * from f990_ez;

drop table f990_pc;
drop table f990_ez;
drop table basic_data;

create table basic_data select * from basic_2;
create table f990_pc select * from pc_2;
create table f990_ez select * from ez_2;

drop table basic_2;
drop table pc_2;
drop table ez_2;


-- COMPARE TWO TABLES ------------------
select * from
(select EIN, total_expenses, grants, employees,
serv_fees, IT, ads, run_office,
finance, other_exp, exp_sum 
from mv_expenses
union all
select EIN, total_expenses, grants, employees,
serv_fees, IT, ads, run_office,
finance, other_exp, exp_sum
from mv_e_2) t
group by EIN having count(*) = 1;
-- if identical will return zero rows




-- -------- OTHER WAY
show create table f990_ez;

create table basic_data_backup (
  EIN varchar(9) default null,
  NAME varchar(70) default null,
  CITY varchar(22) default null,
  STATE varchar(2) default null,
  SEC_NAME varchar(100) default null,
  ADDRESS varchar(35) default null,
  ZIP varchar(10) default null,
  NteeCat12 varchar(10) default null,
  SUBSECCD varchar(10) default null,
  ORGCD varchar(6) default null,
  AFCD varchar(2) default null,
  CLASSCD varchar(4) default null,
  subcd varchar(2) default null,
  key idx_basic_ein (EIN),
  key idx_basic_ZIP (ZIP),
  key idx_basic_STATE (STATE)
) engine=innodb default charset=utf8;

insert into basic_data_backup
select * from basic_data;

-- RECOVERING BACKUP -------------------------------------------------------

drop table f990_ez;
create table f990_ez like db_npo_cleaning.f990_ez;
insert into f990_ez (select * from db_npo_cleaning.f990_ez);

-- ------------------------------------------------------------------------------------------
-- RESTORING /BACKUP SCHEMA

drop schema db_npo;
create schema db_npo;
use db_npo;

create table basic_data like db_npo_cleaning.basic_data;
insert into basic_data (select * from db_npo_cleaning.basic_data);

create table f990_pc like db_npo_cleaning.f990_pc;
insert into f990_pc (select * from db_npo_cleaning.f990_pc);

create table f990_ez like db_npo_cleaning.f990_ez;
insert into f990_ez (select * from db_npo_cleaning.f990_ez);









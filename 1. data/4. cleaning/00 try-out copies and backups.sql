
-- ------------------------------------------------------------------------------------------
-- DUPLICATE/BACKUP SCHEMA
drop schema db_npo_bu;
create schema db_npo_bu;
use db_npo_bu;
create table basic_data like db_npo_cleaning.basic_data;
insert into basic_data (select * from db_npo_cleaning.basic_data);

create table f990_pc like db_npo_cleaning.f990_pc;
insert into f990_pc (select * from db_npo_cleaning.f990_pc);

create table f990_ez like db_npo_cleaning.f990_ez;
insert into f990_ez (select * from db_npo_cleaning.f990_ez);

-- DUPLICATE/BACKUP only one TABLE --------------------------------------

create table f990_ez_2 like f990_ez;
insert into f990_ez_2 (select * from f990_ez);

-- -------- OTHER WAY
SHOW CREATE TABLE f990_ez;

CREATE TABLE `basic_data_backup` (
  `EIN` varchar(9) DEFAULT NULL,
  `NAME` varchar(70) DEFAULT NULL,
  `CITY` varchar(22) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT NULL,
  `SEC_NAME` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(35) DEFAULT NULL,
  `ZIP` varchar(10) DEFAULT NULL,
  `NteeCat12` varchar(10) DEFAULT NULL,
  `SUBSECCD` varchar(10) DEFAULT NULL,
  `ORGCD` varchar(6) DEFAULT NULL,
  `AFCD` varchar(2) DEFAULT NULL,
  `CLASSCD` varchar(4) DEFAULT NULL,
  `subcd` varchar(2) DEFAULT NULL,
  KEY `idx_basic_ein` (`EIN`),
  KEY `idx_basic_ZIP` (`ZIP`),
  KEY `idx_basic_STATE` (`STATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- INDEXES ----------------------------------------------

create index `idx_basic_ein` on basic_data (`EIN`);
create index `idx_basic_ZIP` on basic_data (`ZIP`);
create index `idx_basic_STATE` on basic_data (`STATE`);
create index `idx_f990_PC_ein` on f990_pc (`EIN`);
create index `idx_f990_EZ_ein` on f990_ez (`EIN`);
create index `idx_f990_PC_cat` on f990_pc (`NteeCat12`);
create index `idx_f990_EZ_cat` on f990_ez (`NteeCat12`);


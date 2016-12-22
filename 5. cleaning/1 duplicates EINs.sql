-- ------------------------------------------------------------------------------------------
-- REMOVE DUPLICATED EINs BY DUPLICATING SCHEMA

create schema db_npo;
use db_npo;
create table db_npo.basic_data like db_npo_cleaning.basic_data;
insert into db_npo.basic_data (select * from db_npo_cleaning.basic_data group by ein);

create table db_npo.f990_pc like db_npo_cleaning.f990_pc;
insert into db_npo.f990_pc (select * from db_npo_cleaning.f990_pc group by ein);

create table db_npo.f990_ez like db_npo_cleaning.f990_ez;
insert into db_npo.f990_ez (select * from db_npo_cleaning.f990_ez group by ein);

create index `idx_basic_ein` on basic_data (`EIN`);
create index `idx_basic_ZIP` on basic_data (`ZIP`);
create index `idx_basic_STATE` on basic_data (`STATE`);
create index `idx_f990_PC_ein` on f990_pc (`EIN`);
create index `idx_f990_EZ_ein` on f990_ez (`EIN`);

-- --------------------------------------------------
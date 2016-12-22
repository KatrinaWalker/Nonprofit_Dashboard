-- SINCE WE WILL BE RETREIVING QUERIES FROM THE DASHBOARD
-- WE SET INEXES, FILTER INDICATORS AND KEYS FOR ALL POSSIBLE SITUATIONS
-- NOTE THAT THE TABLES ARE NOT GOING TO BE UPDATED NEVER, SO WE CAN PUSH IT HARD

-- SET A BOOLEAN INDICATOR FOR EACH SUBTOTAL TO FILTER QUICKER -----------------------
alter table mv_revenue
add column idx_contributions boolean default 0,
add column idx_program_services boolean default 0,
add column idx_investment boolean default 0,
add column idx_fundraising boolean default 0,
add column idx_otherR boolean default 0;

update mv_revenue
set idx_contributions = 1 where contributions != 0;
update mv_revenue
set idx_program_services = 1 where program_services != 0;
update mv_revenue
set idx_investment = 1 where investment != 0;
update mv_revenue
set idx_fundraising = 1 where fundraising != 0;
update mv_revenue
set idx_otherR = 1 where other_rev != 0;


alter table mv_expenses
add column idx_grants boolean default 0,
add column idx_employees boolean default 0,
add column idx_external boolean default 0,
add column idx_IT boolean default 0,
add column idx_ads boolean default 0,
add column idx_office boolean default 0,
add column idx_financial boolean default 0,
add column idx_otherE boolean default 0;

update mv_expenses
set idx_grants = 1 where grants != 0;
update mv_expenses
set idx_employees = 1 where employees != 0;
update mv_expenses
set idx_external = 1 where serv_fees != 0;
update mv_expenses
set idx_IT = 1 where IT != 0;
update mv_expenses
set idx_ads = 1 where ads != 0;
update mv_expenses
set idx_office = 1 where run_office != 0;
update mv_expenses
set idx_financial = 1 where finance != 0;
update mv_expenses
set idx_otherE = 1 where other_exp != 0;


-- CREATE A COVERING BINARY BASE INDEX -------------------------
-- alter table basic_data drop column idx_Rcovering, drop column idx_Ecovering;

create index idx_basic_EIN on basic_data (EIN);
create index idx_mv_pc_EIN on f990_pc (EIN);
create index idx_mv_ez_EIN on f990_ez (EIN);
create index idx_mv_revenue_EIN on mv_revenue (EIN);
create index idx_mv_expenses_EIN on mv_expenses (EIN);

alter table basic_data
add column idx_Rcovering integer(2);

update mv_revenue t1, basic_data t2
set t2.idx_Rcovering = 
1 * idx_contributions +
2 * idx_program_services +
4 * idx_investment +
8 * idx_fundraising +
16 * idx_otherR
where t1.EIN = t2.EIN;


alter table basic_data
add column idx_Ecovering integer(3);

update mv_expenses t1, basic_data t2
set t2.idx_Ecovering = 
1 * idx_grants +
2 * idx_employees +
4 * idx_external +
8 * idx_IT +
16 * idx_ads +
32 * idx_office + 
64 * idx_financial +
128 * idx_otherE
where t1.EIN = t2.EIN;

-- THEN WE CAN DROP THE BOOLEANS
alter table mv_revenue
drop column idx_contributions,
drop column idx_program_services,
drop column idx_investment,
drop column idx_fundraising,
drop column idx_otherR;

alter table mv_expenses
drop column idx_grants,
drop column idx_employees,
drop column idx_external,
drop column idx_IT,
drop column idx_ads,
drop column idx_office,
drop column idx_financial,
drop column idx_otherE;


-- CREATE A SIZE INDEX ---------------------------------------
-- alter table basic_data drop column idx_Rsize, drop column idx_Esize;

alter table basic_data
add column idx_Rsize integer(3);

update basic_data t1, f990_pc t2
set t1.idx_Rsize = round(log10(t2.totrevenue) * 10, 0)
where t1.EIN = t2.EIN;
update basic_data t1, f990_ez t2
set t1.idx_Rsize = round(log10(t2.totrevnue) * 10, 0)
where t1.EIN = t2.EIN;


alter table basic_data
add column idx_Esize integer(3);

update basic_data t1, f990_pc t2
set t1.idx_Esize = round(log10(t2.totfuncexpns) * 10, 0)
where t1.EIN = t2.EIN;
update basic_data t1, f990_ez t2
set t1.idx_Esize = round(log10(t2.totexpns) * 10, 0)
where t1.EIN = t2.EIN;

-- employees index ---------------------------------------
alter table basic_data
add column idx_empl boolean default 0;

update basic_data t1, f990_pc t2
set idx_empl = 1
where t1.EIN = t2.EIN and noemplyeesw3cnt > 0;


-- PRIMARY KEYS ------------------------------------------
alter table basic_data
add primary key (EIN);

alter table f990_pc
add primary key (EIN);

alter table f990_ez
add primary key (EIN);

alter table mv_lasso
add primary key (EIN);


-- FOREIGN KEYS ------------------------------------------
alter table f990_pc
add foreign key (EIN)
references basic_data(EIN);

alter table f990_ez
add foreign key (EIN)
references basic_data(EIN);

alter table mv_revenue
add foreign key (EIN)
references basic_data(EIN);

alter table mv_expenses
add foreign key (EIN)
references basic_data(EIN);

alter table mv_lasso
add foreign key (EIN)
references basic_data(EIN);


-- indexing --------------------------------------------------

create index idx_basic_ZIP on basic_data (ZIP);
create index idx_basic_State on basic_data (STATE);
create index idx_basic_Sector on basic_data (NteeCat12);
create index idx_basic_RSize on basic_data (idx_Rsize);
create index idx_basic_ESize on basic_data (idx_Esize);

create index idx_basic_Rcover on basic_data (idx_Rcovering);
create index idx_basic_Ecover on basic_data (idx_Ecovering);

create index idx_basic_state_sector on basic_data (STATE, NteeCat12);
create index idx_basic_state_RSize on basic_data (STATE, idx_Rsize);
create index idx_basic_state_ESize on basic_data (STATE, idx_Esize);
create index idx_basic_sector_RSize on basic_data (NteeCat12, idx_Rsize);
create index idx_basic_sector_ESize on basic_data (NteeCat12, idx_Esize);

create index idx_basic_idx_Rcover_RSize on basic_data (idx_Rcovering, idx_Rsize);
create index idx_basic_idx_Rcover_sector on basic_data (idx_Rcovering, NteeCat12);

create index idx_basic_idx_Ecover_RSize on basic_data (idx_Ecovering, idx_Rsize);
create index idx_basic_idx_Ecover_sector on basic_data (idx_Ecovering, NteeCat12);

create index idx_basic_state_sector_RSize on basic_data (STATE, NteeCat12, idx_RSize);
create index idx_basic_state_sector_ESize on basic_data (STATE, NteeCat12, idx_ESize);

create index idx_basic_state_sector_Rcover on basic_data (STATE, NteeCat12, idx_Rcovering);
create index idx_basic_state_sector_Ecover on basic_data (STATE, NteeCat12, idx_Ecovering);

create index idx_basic_Rjack on basic_data (STATE, NteeCat12, idx_RSize, idx_Rcovering);
create index idx_basic_Ejack on basic_data (STATE, NteeCat12, idx_ESize, idx_Ecovering);

create index idx_R_size on mv_revenue(total_revenue);

create index idx_basic_empl on basic_data (idx_empl);





/*

-- SPEED TEST ----------------------------------------------
select * from mv_revenue where idx_covering = 13;
select * from mv_expenses where idx_covering = 0;

-- THAT'S REALLY FAST!!!! :) :)



-- TRYOUTS
-- A ONE-TO-ONE FILTERING IS SO SLOW :( :(



drop index idx_mv_revenue_contributions on mv_revenue;
create index idx_mv_revenue_contributions on mv_revenue (idx_investment);
create index idx_mv_revenue_contributions on mv_revenue (contributions);

select * from mv_revenue where contributions != 0;
select * from mv_revenue where idx_contributions = 1;


drop index idx_mv_revenue_program_services on mv_revenue;
create index idx_mv_revenue_program_services on mv_revenue (idx_program_services);
create index idx_mv_revenue_program_services on mv_revenue (program_services);

select * from mv_revenue where program_services != 0;
select * from mv_revenue where idx_program_services = 1;


drop index idx_mv_revenue_investment on mv_revenue;
create index idx_mv_revenue_investment on mv_revenue (idx_investment);
create index idx_mv_revenue_investment on mv_revenue (investment);

select * from mv_revenue where investment != 0;
select * from mv_revenue where idx_investment = 1;


drop index idx_mv_revenue_fundraising on mv_revenue;
create index idx_mv_revenue_fundraising on mv_revenue (idx_fundraising);
create index idx_mv_revenue_fundraising on mv_revenue (fundraising);

select * from mv_revenue where fundraising != 0;
select * from mv_revenue where idx_fundraising = 1;


drop index idx_mv_revenue_other on mv_revenue;
create index idx_mv_revenue_other on mv_revenue (idx_other);
create index idx_mv_revenue_other on mv_revenue (other);

select * from mv_revenue where other != 0;
select * from mv_revenue where idx_other = 1;

*/
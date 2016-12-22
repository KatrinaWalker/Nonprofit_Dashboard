-- AS IT WILL BE NECESSARY WHEN RETRIEVING QUERIES FRM THE DASHBOARD
-- SET FILTERS INDICATORS AND INDEXES WHERE NEEDED

-- SET A BOOLEAN INDICATOR FOR EACH SUBTOTAL TO FILTER QUICKER -----------------------

-- ON REVENUES
alter table mv_revenue
add column idx_contributions boolean default 0,
add column idx_program_services boolean default 0,
add column idx_investment boolean default 0,
add column idx_fundraising boolean default 0,
add column idx_other boolean default 0;

UPDATE mv_revenue
SET idx_contributions = 1 WHERE subtotal_contributions != 0;
UPDATE mv_revenue
SET idx_program_services = 1 WHERE subtotal_program_services != 0;
UPDATE mv_revenue
SET idx_investment = 1 WHERE subtotal_investment != 0;
UPDATE mv_revenue
SET idx_fundraising = 1 WHERE subtotal_fundraising != 0;
UPDATE mv_revenue
SET idx_other = 1 WHERE subtotal_other != 0;


-- ON EXPENSES 
alter table mv_expenses
add column idx_grants boolean default 0,
add column idx_employees boolean default 0,
add column idx_external boolean default 0,
add column idx_IT boolean default 0,
add column idx_ads boolean default 0,
add column idx_office boolean default 0,
add column idx_financial boolean default 0,
add column idx_other boolean default 0;

UPDATE mv_expenses
SET idx_grants = 1 WHERE subtotal_grants != 0;
UPDATE mv_expenses
SET idx_employees = 1 WHERE subtotal_employees != 0;
UPDATE mv_expenses
SET idx_external = 1 WHERE subtotal_serv_fees != 0;
UPDATE mv_expenses
SET idx_IT = 1 WHERE subtotal_IT != 0;
UPDATE mv_expenses
SET idx_ads = 1 WHERE subtotal_ads != 0;
UPDATE mv_expenses
SET idx_office = 1 WHERE subtotal_run_office != 0;
UPDATE mv_expenses
SET idx_financial = 1 WHERE subtotal_finance != 0;
UPDATE mv_expenses
SET idx_other = 1 WHERE subtotal_other != 0;


-- CREATE A COVERING BINARY BASE INDEX -------------------------

-- ON REVENUES
alter table mv_revenue
add column idx_covering integer(2) default 0;

update mv_revenue
set idx_covering = 
1 * idx_contributions +
2 * idx_program_services +
4 * idx_investment +
8 * idx_fundraising +
16 * idx_other;

create index idx_mv_revenue_covering on mv_revenue (idx_covering);


-- ON EXPENSES
alter table mv_expenses
add column idx_covering integer(3) default 0;

update mv_expenses
set idx_covering = 
1 * idx_grants +
2 * idx_employees +
4 * idx_external +
8 * idx_IT +
16 * idx_ads +
32 * idx_office + 
64 * idx_financial +
128 * idx_other;

create index idx_mv_expenses_covering on mv_expenses (idx_covering);

-- drop index idx_mv_expenses_covering on mv_expenses;

-- SPEED TEST ----------------------------------------------
select * from mv_revenue where idx_covering = 13;

select * from mv_expenses where idx_covering = 0;



-- THAT'S REALLY FAST!!!! :) :)

-- THEN WE CAN DROP THE BOOLEANS
alter table mv_revenue
drop column idx_contributions,
drop column idx_program_services,
drop column idx_investment,
drop column idx_fundraising,
drop column idx_other;

alter table mv_expenses
drop column idx_idx_grants,
drop column idx_employees,
drop column idx_external,
drop column idx_IT,
drop column idx_ads,
drop column idx_office,
drop column idx_financial,
drop column idx_other;


-- TRYOUTS WITH DIFFERENT INDEXES
-- ONE-TO-ONE FILTERING IS SO SLOW :( :(

drop index idx_mv_revenue_contributions on mv_revenue;
create index idx_mv_revenue_contributions on mv_revenue (idx_investment);
create index idx_mv_revenue_contributions on mv_revenue (subtotal_contributions);

select * from mv_revenue where subtotal_contributions != 0;
select * from mv_revenue where idx_contributions = 1;


drop index idx_mv_revenue_program_services on mv_revenue;
create index idx_mv_revenue_program_services on mv_revenue (idx_program_services);
create index idx_mv_revenue_program_services on mv_revenue (subtotal_program_services);

select * from mv_revenue where subtotal_program_services != 0;
select * from mv_revenue where idx_program_services = 1;


drop index idx_mv_revenue_investment on mv_revenue;
create index idx_mv_revenue_investment on mv_revenue (idx_investment);
create index idx_mv_revenue_investment on mv_revenue (subtotal_investment);

select * from mv_revenue where subtotal_investment != 0;
select * from mv_revenue where idx_investment = 1;


drop index idx_mv_revenue_fundraising on mv_revenue;
create index idx_mv_revenue_fundraising on mv_revenue (idx_fundraising);
create index idx_mv_revenue_fundraising on mv_revenue (subtotal_fundraising);

select * from mv_revenue where subtotal_fundraising != 0;
select * from mv_revenue where idx_fundraising = 1;


drop index idx_mv_revenue_other on mv_revenue;
create index idx_mv_revenue_other on mv_revenue (idx_other);
create index idx_mv_revenue_other on mv_revenue (subtotal_other);

select * from mv_revenue where subtotal_other != 0;
select * from mv_revenue where idx_other = 1;

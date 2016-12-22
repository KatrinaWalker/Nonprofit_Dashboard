-- PROCEDURES TO CHECK CONSISTENCY OF PREVIOUS MANIPULATIONS ON MATERIALIZED VIEWS


-- MATERIALIZED VIEW FOR REVENUE ------------------------------------

drop table if exists MV_revenue_amounts;
create table MV_revenue_amounts(
EIN varchar(9) default null,
total_revenue decimal(14,0) default 0,
total_gap decimal(14,1) default 0,
contributions decimal(14,0) default 0,
program_services decimal(14,0) default 0,
investment decimal(14,0) default 0,
fundraising decimal(14,0) default 0,
sales decimal(14,0) default 0,
other_rev decimal(14,0) default 0,
rev_sum decimal(14,0) default 0
);

-- INSERT AMOUNTS
insert into MV_revenue_amounts
select EIN, totrevenue, 0,
totcntrbgfts, 
totprgmrevnue, 
(invstmntinc + txexmptbndsproceeds + royaltsinc + netrntlinc + netgnls), 
(netincfndrsng + netincgaming),
netincsales,
(miscrevtota + miscrevtot11b + miscrevtot11c + miscrevtot11d + miscrevtot11e),
0
from f990_pc;

insert into MV_revenue_amounts
select EIN, totrevnue, 0,
(totcntrbs + duesassesmnts), 
prgmservrev, 
(othrinvstinc + gnsaleofastothr), 
netincfndrsng,
grsprft,
othrevnue,
0
from f990_ez;

-- CHECK CONSISTENCY

update MV_revenue_amounts
set rev_sum = contributions + program_services + 
investment + fundraising + sales + other;
update MV_revenue_amounts
set total_gap = round((total_revenue - rev_sum)/total_revenue * 100, 1);


-- ------------------------------------------------------------------
-- MATERIALIZED VIEW FOR EXPENSES ------------------------------------

drop table if exists MV_expenses_amounts;
create table MV_expenses_amounts(
EIN varchar(9) default null,
total_expenses decimal(14,0) default 0,
total_gap decimal(14,1) default 0,
grants decimal(14,0) default 0,
benefits decimal(14,0) default 0,
employees decimal(14,0) default 0,
serv_fees decimal(14,0) default 0,
IT decimal(14,0) default 0,
affiliate_pay decimal(14,0) default 0,
ads decimal(14,0) default 0,
run_office decimal(14,0) default 0,
finance decimal (14,0) default 0,
other_exp decimal(14,0) default 0,
exp_sum decimal(14,0) default 0
);

-- INSERT AMOUNTS
insert into MV_expenses_amounts
select EIN, totfuncexpns, 0,
(grntstogovt + grnsttoindiv + grntstofrgngovt), 
benifitsmembrs, 
(compnsatncurrofcr + compnsatnandothr + othrsalwages + pensionplancontrb + othremplyeebenef + payrolltx), 
(feesforsrvcmgmt + legalfees + accntingfees + feesforsrvclobby + profndraising + feesforsrvcinvstmgmt + feesforsrvcothr),
infotech, 
pymtoaffiliates, 
advrtpromo, 
(officexpns + royaltsexpns + occupancy + travel + travelofpublicoffcl + converconventmtng), 
(interestamt + deprcatndepletn + insurance), 
(othrexpnsa + othrexpnsb + othrexpnsc + othrexpnsd + othrexpnse + othrexpnsf),
0
from f990_pc;

-- WHAT HAPPENS WITH EZ???--------------------------------------------------------------------------------------------------------
/* insert into MV_expenses
select EIN, totexpns
from f990_ez
where totexpns > 0;
*/
-- CHECK CONSISTENCY
update MV_expenses_amounts
set exp_sum = grants + benefits + employees + 
serv_fees + IT + affiliate_pay + ads + 
run_office + finance + other;
update MV_expenses_amounts
set total_gap = round((total_expenses - exp_sum)/total_expenses * 100, 1);

-- INDEX EIN ----------------------------------
create index `idx_MVEA_ein` on mv_expenses_amounts (`EIN`);
create index `idx_MVRA_ein` on mv_revenue_amounts (`EIN`);


-- LIST OUTLAYERS ----------------------------
select x.EIN, x.total_gap as rev_gap, z.total_gap as exp_gap, x.total_revenue, z.total_expenses, round((x.total_revenue - z.total_expenses)/x.total_revenue * 100, 0) as net 
from db_npo_cleaning.mv_revenue_amounts x
left join (select * from db_npo_cleaning.mv_expenses_amounts) z
on z.EIN = x.EIN
where z.total_gap > -10 and z.total_gap < 10 and x.total_gap > -10 and x.total_gap < 10 and x.total_gap is not null and z.total_gap is not null and x.total_revenue > 5000;


-- CHECK SUMS

select rev_sum from mv_revenue;
select exp_sum from mv_expenses;

select rev_sum from mv_revenue R where R.rev_sum > 100;
select exp_sum from mv_expenses E where E.exp_sum > 100;


select * from mv_revenue;
select * from mv_expenses;


select count(EIN), idx_covering from mv_revenue group by idx_covering order by idx_covering asc;
select count(EIN), idx_covering from mv_expenses group by idx_covering order by idx_covering asc;

select count(EIN) from f990_ez where totrevnue >= 10000;
select count(EIN) from f990_pc where totfuncexpns>= 5000;
select count(EIN) from f990_pc where totrevenue >= 10000;
select count(EIN) from mv_expenses;
select count(EIN) from mv_revenue;

select * from mv_expenses;

-- set revenues and expenses <= 0 to 1

update f990_pc
set totrevenue = 1
where totrevenue < 1;

update f990_ez
set totrevnue = 1
where totrevnue < 1;

update f990_pc
set totfuncexpns = 1
where totfuncexpns < 1;

update f990_ez
set totexpns = 1
where totexpns < 1;

-- Nte12 to basic

alter table basic_data
add column NteeCat12 varchar(2);

update basic_data, f990_pc
set basic_data.NteeCat12 = f990_pc.NteeCat12
where basic_data.EIN = f990_pc.EIN;

update basic_data, f990_ez
set basic_data.NteeCat12 = f990_ez.NteeCat12
where basic_data.EIN = f990_ez.EIN;

select a.EIN, a.NteeCat12, b.NteeCat12, c.NteeCat12 from basic_data a
left join (select EIN, Nteecat12 from f990_pc) b
on a.EIN = b.EIN
left join (select EIN, NteeCat12 from f990_ez) c
on a.EIN = c.EIN;



-- employees vs revenue --------------------------------
select totrevenue, noemplyeesw3cnt from f990_pc;

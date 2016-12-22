-- PROCEDURES TO COME UP WITH MATERIALIZED VIEWS TO WORK WITH REGRESSIONS ----------------------
-- TRANSFORM REVENUE AND EXPENSES INTO PERCENTAGES


-- MATERIALIZED VIEW FOR REVENUE ------------------------------------

drop table if exists mv_revenue;
create table mv_revenue (
EIN varchar(9) primary key,
total_revenue decimal(14,0) default 0,
contributions decimal(7,3) default 0,
program_services decimal(7,3) default 0,
investment decimal(7,3) default 0,
fundraising decimal(7,3) default 0,
-- sales decimal(7,3) default 0,
other_rev decimal(7,3) default 0,
rev_sum decimal(4,1) default 0
);

-- INSERT AMOUNTS AS PERCENTS AVOIDING NEGATIVES AND SUBTOTALS BIGGER THAN TOTAL
insert into mv_revenue
select EIN, totrevenue, 
100 * totcntrbgfts/totrevenue, 
100 * totprgmrevnue/totrevenue, 
100 * (invstmntinc + txexmptbndsproceeds + royaltsinc + netrntlinc + netgnls)/totrevenue, 
100 * (netincfndrsng + netincgaming)/totrevenue,
-- 100 * netincsales/totrevenue,
100 * (netincsales + miscrevtota + miscrevtot11b + miscrevtot11c + miscrevtot11d + miscrevtot11e)/totrevenue,
0
from f990_pc 
where totrevenue >= 10000
and totcntrbgfts/totrevenue <= 5
-- and totcntrbgfts >= 0
and totprgmrevnue/totrevenue <= 5
-- and totprgmrevnue >= 0
and (invstmntinc + txexmptbndsproceeds + royaltsinc + netrntlinc + netgnls)/totrevenue <= 5
-- and invstmntinc + txexmptbndsproceeds + royaltsinc + netrntlinc + netgnls >= 0
and (netincfndrsng + netincgaming)/totrevenue <= 5
-- and netincfndrsng + netincgaming >= 0
-- and netincsales/totrevenue <= 1
-- and netincsales >= 0
and (netincsales + miscrevtota + miscrevtot11b + miscrevtot11c + miscrevtot11d + miscrevtot11e)/totrevenue <= 5
-- and netincsales + miscrevtota + miscrevtot11b + miscrevtot11c + miscrevtot11d + miscrevtot11e >= 0;
;

insert into mv_revenue
select EIN, totrevnue, 
100 * (totcntrbs + duesassesmnts)/totrevnue, 
100 * prgmservrev/totrevnue, 
100 * (othrinvstinc + gnsaleofastothr)/totrevnue, 
100 * netincfndrsng/totrevnue,
-- 100 * grsprft/totrevnue,
100 * (grsprft + othrevnue)/totrevnue,
0
from f990_ez
where totrevnue >= 10000
and (totcntrbs + duesassesmnts)/totrevnue <= 5
-- and totcntrbs + duesassesmnts >= 0
and prgmservrev/totrevnue <= 5
-- and prgmservrev >= 0
and (othrinvstinc + gnsaleofastothr)/totrevnue <= 5
-- and othrinvstinc + gnsaleofastothr >= 0
and netincfndrsng/totrevnue <= 5
-- and netincfndrsng >= 0
-- and grsprft/totrevnue <= 1
-- and grsprft >= 0
and (grsprft + othrevnue)/totrevnue <= 5
-- and grsprft + othrevnue >= 0;
;


-- SET A SUM FOR CHECKING LATER -------------------

update mv_revenue
set rev_sum = contributions + program_services + 
investment + fundraising 
-- + sales
+ other_rev;


delete from MV_revenue where rev_sum < 50;





-- ------------------------------------------------------------------
-- MATERIALIZED VIEW FOR EXPENSES ------------------------------------

drop table if exists mv_expenses;
create table mv_expenses(
EIN varchar(9) primary key,
total_expenses decimal(14,0) default 0,
grants decimal(7,3) default 0,
-- benefits decimal(7,3) default 0,
employees decimal(7,3) default 0,
serv_fees decimal(7,3) default 0,
IT decimal(7,3) default 0,
-- affiliate_pay decimal(7,3) default 0,
ads decimal(7,3) default 0,
run_office decimal(7,3) default 0,
finance decimal (4,1) default 0,
other_exp decimal(7,3) default 0,
exp_sum decimal(4,1) default 0
);

-- INSERT AMOUNTS AS PERCENTS AVOIDING NEGATIVES AND SUBTOTALS BIGGER THAN TOTAL
insert into mv_expenses
select EIN, totfuncexpns, 
100 * (pymtoaffiliates + grntstogovt + grnsttoindiv + grntstofrgngovt)/totfuncexpns, 
-- 100 * benifitsmembrs/totfuncexpns, 
100 * (benifitsmembrs + compnsatncurrofcr + compnsatnandothr + othrsalwages + pensionplancontrb + othremplyeebenef + payrolltx)/totfuncexpns, 
100 * (feesforsrvcmgmt + legalfees + accntingfees + feesforsrvclobby + profndraising + feesforsrvcinvstmgmt + feesforsrvcothr)/totfuncexpns,
100 * infotech/totfuncexpns, 
-- 100 * pymtoaffiliates/totfuncexpns, 
100 * advrtpromo/totfuncexpns, 
100 * (officexpns + royaltsexpns + occupancy + travel + travelofpublicoffcl + converconventmtng)/totfuncexpns, 
100 * (interestamt + deprcatndepletn + insurance)/totfuncexpns, 
100 * (othrexpnsa + othrexpnsb + othrexpnsc + othrexpnsd + othrexpnse + othrexpnsf)/totfuncexpns,
0
from f990_pc
where totfuncexpns >= 5000
and (pymtoaffiliates + grntstogovt + grnsttoindiv + grntstofrgngovt)/totfuncexpns <= 5
-- and pymtoaffiliates + grntstogovt + grnsttoindiv + grntstofrgngovt >= 0
-- and benifitsmembrs/totfuncexpns <= 1
-- and benifitsmembrs >= 0
and (benifitsmembrs + compnsatncurrofcr + compnsatnandothr + othrsalwages + pensionplancontrb + othremplyeebenef + payrolltx)/totfuncexpns <= 5
-- and benifitsmembrs + compnsatncurrofcr + compnsatnandothr + othrsalwages + pensionplancontrb + othremplyeebenef + payrolltx >= 0
and (feesforsrvcmgmt + legalfees + accntingfees + feesforsrvclobby + profndraising + feesforsrvcinvstmgmt + feesforsrvcothr)/totfuncexpns <= 5
-- and feesforsrvcmgmt + legalfees + accntingfees + feesforsrvclobby + profndraising + feesforsrvcinvstmgmt + feesforsrvcothr >= 0
and infotech/totfuncexpns <= 5
-- and infotech >= 0
-- and pymtoaffiliates/totfuncexpns <= 1
-- and pymtoaffiliates >= 0
and advrtpromo/totfuncexpns <= 5
-- and advrtpromo >= 0
and (officexpns + royaltsexpns + occupancy + travel + travelofpublicoffcl + converconventmtng)/totfuncexpns <= 5
-- and officexpns + royaltsexpns + occupancy + travel + travelofpublicoffcl + converconventmtng >= 0
and (interestamt + deprcatndepletn + insurance)/totfuncexpns <= 5
-- and interestamt + deprcatndepletn + insurance >= 0
and (othrexpnsa + othrexpnsb + othrexpnsc + othrexpnsd + othrexpnse + othrexpnsf)/totfuncexpns <= 5
-- and othrexpnsa + othrexpnsb + othrexpnsc + othrexpnsd + othrexpnse + othrexpnsf >= 0;
;


-- WHAT HAPPENS WITH EZ???--------------------------------------------------------------------------------------------------------
/* insert into MV_expenses
select EIN, totexpns
from f990_ez
where totexpns > 0;
*/


-- SET A SUM FOR CHECKING LATER -------------------
update mv_expenses
set exp_sum = grants + 
-- benefits + 
employees + 
serv_fees + IT + 
-- affiliate_pay + 
ads + 
run_office + finance + other_exp;


delete from mv_expenses where exp_sum < 50;



-- EQUALIZE TO SUM 100 ------------------------------

update mv_revenue
set contributions = 100 * contributions/rev_sum,
program_services = 100 * program_services/rev_sum,
investment = 100 * investment/rev_sum,
fundraising = 100 * fundraising/rev_sum,
other_rev = 100 * other_rev/rev_sum
where rev_sum != 100;

-- UPDATE rev_sum
update mv_revenue
set rev_sum = contributions + program_services + 
investment + fundraising 
-- + sales
+ other_rev;



update mv_expenses
set grants = 100 * grants/exp_sum,
employees = 100 * employees/exp_sum,
serv_fees = 100 * serv_fees/exp_sum,
IT = 100 * IT/exp_sum,
ads = 100 * ads/exp_sum,
run_office = 100 * run_office/exp_sum,
finance = 100 * finance/exp_sum,
other_exp = 100 * other_exp/exp_sum
where exp_sum != 100;


update mv_expenses
set exp_sum = grants + 
-- benefits + 
employees + 
serv_fees + IT + 
-- affiliate_pay + 
ads + 
run_office + finance + other_exp;


alter table mv_revenue
modify column contributions smallint,
modify column program_services smallint,
modify column investment smallint,
modify column fundraising smallint,
modify column other_rev smallint,
modify column rev_sum smallint;

alter table mv_expenses
modify column grants smallint,
modify column employees smallint,
modify column serv_fees smallint,
modify column IT smallint,
modify column ads smallint,
modify column run_office smallint,
modify column finance smallint,
modify column other_exp smallint,
modify column exp_sum smallint;



-- MATERIALIZED VIEW WITH ALL EXPENSES AND REVENUE IN AMMOUNTS NOT PERCENTAGERS --------------------------------

CREATE TABLE mv_lasso
select R.EIN, B.NteeCat12 as groups, B.ORGCD as org_form, 
concat(P.noemplyeesw3cnt, Z.noemplyeesw3cnt) as n_emply,
R.total_revenue as tot_rev, R. contributions*R.total_revenue/100 as contributions, 
R. program_services*R.total_revenue/100 as progr_serv, R. investment*R.total_revenue/100 as invest,
R.fundraising*R.total_revenue/100 as fundraise, R. other_rev*R.total_revenue/100 as other_rev,
E.total_expenses as tot_exp, E.grants*E.total_expenses/100 as grants, 
E.employees*E.total_expenses/100 as employ_exp, E.serv_fees*E.total_expenses/100 as serv_fees, 
E.IT*E.total_expenses/100 as IT, E.ads*E.total_expenses/100 as ads, 
E.run_office*E.total_expenses/100 as running_office, E.finance*E.total_expenses/100 as financial, 
E.other_exp*E.total_expenses/100 as other_exp,
concat(P.totassetsend, Z.totassetsend) as tot_assets,
concat(P.totliabend, Z.totliabend) as tot_liabilities
from mv_revenue R
left join (select EIN, total_expenses, grants, employees, serv_fees, IT, 
ads, run_office, finance, other_exp from mv_expenses) E
on E.EIN = R.EIN
left join (select EIN, noemplyeesw3cnt, totassetsend, totliabend from f990_pc) P
on P.EIN = R.EIN
left join (select EIN, 0 as noemplyeesw3cnt, totassetsend, totliabend from f990_ez) Z
on Z.EIN = R.EIN
left join (select EIN, NteeCat12, ORGCD from basic_data) B
on B.EIN = R.EIN;

-- round up results
alter table mv_lasso
modify column contributions decimal(14,0),
modify column progr_serv decimal(14,0),
modify column invest decimal(14,0),
modify column fundraise decimal(14,0),
modify column other_rev decimal(14,0),
modify column grants decimal(14,0),
modify column employ_exp decimal(14,0),
modify column serv_fees decimal(14,0),
modify column IT decimal(14,0),
modify column ads decimal(14,0),
modify column running_office decimal(14,0),
modify column financial decimal(14,0),
modify column other_exp decimal(14,0);
-- ---------------------------------------


-- TRYOUTS ---------------------------------

CREATE TABLE mv_lasso
select R.EIN, 
R.total_revenue as tot_rev, R. contributions*R.total_revenue/100 as contributions, 
R. program_services*R.total_revenue/100 as progr_serv, R. investment*R.total_revenue/100 as invest,
R.fundraising*R.total_revenue/100 as fundraise, R. other_rev*R.total_revenue/100 as other_rev,
E.total_expenses as tot_exp, E.grants*E.total_expenses/100 as grants, 
E.employees*E.total_expenses/100 as employ_exp, E.serv_fees*E.total_expenses/100 as serv_fees, 
E.IT*E.total_expenses/100 as IT, E.ads*E.total_expenses/100 as ads, 
E.run_office*E.total_expenses/100 as running_office, E.finance*E.total_expenses/100 as financial, 
E.other_exp*E.total_expenses/100 as other_exp
from mv_revenue R
left join (select EIN, total_expenses, grants, employees, serv_fees, IT, 
ads, run_office, finance, other_exp from mv_expenses) E
on E.EIN = R.EIN;

-- ---------------------------------------

create table temp1
select EIN, NteeCat12 as groups, ORGCD as org_form
from basic_data;

create table temp2
select EIN, noemplyeesw3cnt n_emply, totassetsend as tot_assets, totliabend as tot_liabilities
from f990_pc;

create table temp3
select EIN, 0 n_emply, totassetsend as tot_assets, totliabend as tot_liabilities
from f990_ez;

create index idx_1 on mv_lasso (EIN);
create index idx_2 on temp1 (EIN);
create index idx_22 on temp22 (EIN);
create index idx_merged on merged (EIN);


create table temp21
select * from mv_lasso L
left join (select EIN as temp, groups, org_form from temp1) T
on T.temp = L.EIN;

create table merged
select * from temp2
union
select * from temp3;

create table temp22
select * from temp21 L
left join (select EIN as temp, n_emply, tot_assets, tot_liabilities from merged) T
on T.temp = L.EIN;

alter table mv_lasso
drop column tot_exp;

alter table mv_lasso
add column tot_exp decimal(14,0);

update mv_lasso L, mv_expenses E
set tot_exp = total_expenses
where E.EIN = L.EIN;

create table lasso
select * from temp21 L
left join (select EIN as temp, tot_rev, contributions, progr_serv, invest, fundraise, other_rev, 
tot_exp, grants, employ_exp, serv_fees, IT, ads, running_office, financial, other_exp,
groups, org_form, n_emply, tot_assets, tot_liabilities from temp22) T
on T.temp = L.EIN;

create table mv_lasso
select * from temp22;

update mv_lasso
set grants = 0 where grants is null;
update mv_lasso
set employ_exp = 0 where employ_exp is null;
update mv_lasso
set serv_fees = 0 where serv_fees is null;
update mv_lasso
set IT = 0 where IT is null;
update mv_lasso
set ads = 0 where ads is null;
update mv_lasso
set running_office = 0 where running_office is null;
update mv_lasso
set financial = 0 where financial is null;
update mv_lasso
set other_exp = 0 where other_exp is null;

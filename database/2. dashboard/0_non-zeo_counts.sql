-- ACCOUNT OF NON-ZERO VALUES
-- TO ASSESS THE CONVINIENCE OF CONSIDERING DIFFERENT VARIABLES

-- REVENUE --------------------------------------------------------------------

select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue < 70000), 2) as Contributions
from mv_revenue where total_revenue < 70000 and subtotal_contributions > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 70000 and total_revenue < 200000), 2) 
from mv_revenue where total_revenue > 70000 and total_revenue < 200000 and subtotal_contributions > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 200000 and total_revenue < 1000000), 2) 
from mv_revenue where total_revenue > 200000 and total_revenue < 1000000 and subtotal_contributions > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 1000000), 2) 
from mv_revenue where total_revenue > 1000000 and subtotal_contributions > 0;


select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue < 70000), 2) as Program_srvcs
from mv_revenue where total_revenue < 70000 and subtotal_program_services > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 70000 and total_revenue < 200000), 2) 
from mv_revenue where total_revenue > 70000 and total_revenue < 200000 and subtotal_program_services > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 200000 and total_revenue < 1000000), 2) 
from mv_revenue where total_revenue > 200000 and total_revenue < 1000000 and subtotal_program_services > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 1000000), 2) 
from mv_revenue where total_revenue > 1000000 and subtotal_program_services > 0;


select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue < 70000), 2) as Investment
from mv_revenue where total_revenue < 70000 and subtotal_investment > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 70000 and total_revenue < 200000), 2) 
from mv_revenue where total_revenue > 70000 and total_revenue < 200000 and subtotal_investment > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 200000 and total_revenue < 1000000), 2) 
from mv_revenue where total_revenue > 200000 and total_revenue < 1000000 and subtotal_investment > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 1000000), 2) 
from mv_revenue where total_revenue > 1000000 and subtotal_investment > 0;


select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue < 70000), 2) as Fundraising
from mv_revenue where total_revenue < 70000 and subtotal_fundraising > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 70000 and total_revenue < 200000), 2) 
from mv_revenue where total_revenue > 70000 and total_revenue < 200000 and subtotal_fundraising > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 200000 and total_revenue < 1000000), 2) 
from mv_revenue where total_revenue > 200000 and total_revenue < 1000000 and subtotal_fundraising > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 1000000), 2) 
from mv_revenue where total_revenue > 1000000 and subtotal_fundraising > 0;


/*
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue < 70000), 2) as Sales
from mv_revenue where total_revenue < 70000 and subtotal_sales > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 70000 and total_revenue < 200000), 2) 
from mv_revenue where total_revenue > 70000 and total_revenue < 200000 and subtotal_sales > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 200000 and total_revenue < 1000000), 2) 
from mv_revenue where total_revenue > 200000 and total_revenue < 1000000 and subtotal_sales > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 1000000), 2) 
from mv_revenue where total_revenue > 1000000 and subtotal_sales > 0;
*/

select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue < 70000), 2) as Other
from mv_revenue where total_revenue < 70000 and subtotal_other > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 70000 and total_revenue < 200000), 2) 
from mv_revenue where total_revenue > 70000 and total_revenue < 200000 and subtotal_other > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 200000 and total_revenue < 1000000), 2) 
from mv_revenue where total_revenue > 200000 and total_revenue < 1000000 and subtotal_other > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_revenue where total_revenue > 1000000), 2) 
from mv_revenue where total_revenue > 1000000 and subtotal_other > 0;






-- EXPENSES -------------------------------------------------------------------------------

select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses < 70000), 2) as Grants
from mv_expenses where total_expenses < 70000 and subtotal_grants > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 70000 and total_expenses < 200000), 2) 
from mv_expenses where total_expenses > 70000 and total_expenses < 200000 and subtotal_grants > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 200000 and total_expenses < 1000000), 2) 
from mv_expenses where total_expenses > 200000 and total_expenses < 1000000 and subtotal_grants > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 1000000), 2) 
from mv_expenses where total_expenses > 1000000 and subtotal_grants > 0;


/*
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses < 70000), 2) as Benefits
from mv_expenses where total_expenses < 70000 and subtotal_benefits > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 70000 and total_expenses < 200000), 2) 
from mv_expenses where total_expenses > 70000 and total_expenses < 200000 and subtotal_benefits > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 200000 and total_expenses < 1000000), 2) 
from mv_expenses where total_expenses > 200000 and total_expenses < 1000000 and subtotal_benefits > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 1000000), 2) 
from mv_expenses where total_expenses > 1000000 and subtotal_benefits > 0;
*/

select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses < 70000), 2) as Employees
from mv_expenses where total_expenses < 70000 and subtotal_employees > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 70000 and total_expenses < 200000), 2) 
from mv_expenses where total_expenses > 70000 and total_expenses < 200000 and subtotal_employees > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 200000 and total_expenses < 1000000), 2) 
from mv_expenses where total_expenses > 200000 and total_expenses < 1000000 and subtotal_employees > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 1000000), 2) 
from mv_expenses where total_expenses > 1000000 and subtotal_employees > 0;


select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses < 70000), 2) as External_Services_Fees
from mv_expenses where total_expenses < 70000 and subtotal_serv_fees > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 70000 and total_expenses < 200000), 2) 
from mv_expenses where total_expenses > 70000 and total_expenses < 200000 and subtotal_serv_fees > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 200000 and total_expenses < 1000000), 2) 
from mv_expenses where total_expenses > 200000 and total_expenses < 1000000 and subtotal_serv_fees > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 1000000), 2) 
from mv_expenses where total_expenses > 1000000 and subtotal_serv_fees > 0;


select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses < 70000), 2) as IT
from mv_expenses where total_expenses < 70000 and subtotal_IT > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 70000 and total_expenses < 200000), 2) 
from mv_expenses where total_expenses > 70000 and total_expenses < 200000 and subtotal_IT > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 200000 and total_expenses < 1000000), 2) 
from mv_expenses where total_expenses > 200000 and total_expenses < 1000000 and subtotal_IT > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 1000000), 2) 
from mv_expenses where total_expenses > 1000000 and subtotal_IT > 0;


/*
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses < 70000), 2) as Affiliate_Payments
from mv_expenses where total_expenses < 70000 and subtotal_affiliate_pay > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 70000 and total_expenses < 200000), 2) 
from mv_expenses where total_expenses > 70000 and total_expenses < 200000 and subtotal_affiliate_pay > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 200000 and total_expenses < 1000000), 2) 
from mv_expenses where total_expenses > 200000 and total_expenses < 1000000 and subtotal_affiliate_pay > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 1000000), 2) 
from mv_expenses where total_expenses > 1000000 and subtotal_affiliate_pay > 0;
*/

select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses < 70000), 2) as Advertising
from mv_expenses where total_expenses < 70000 and subtotal_ads > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 70000 and total_expenses < 200000), 2) 
from mv_expenses where total_expenses > 70000 and total_expenses < 200000 and subtotal_ads > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 200000 and total_expenses < 1000000), 2) 
from mv_expenses where total_expenses > 200000 and total_expenses < 1000000 and subtotal_ads > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 1000000), 2) 
from mv_expenses where total_expenses > 1000000 and subtotal_ads > 0;


select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses < 70000), 2) as Running_Costs_Office
from mv_expenses where total_expenses < 70000 and subtotal_run_office > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 70000 and total_expenses < 200000), 2) 
from mv_expenses where total_expenses > 70000 and total_expenses < 200000 and subtotal_run_office > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 200000 and total_expenses < 1000000), 2) 
from mv_expenses where total_expenses > 200000 and total_expenses < 1000000 and subtotal_run_office > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 1000000), 2) 
from mv_expenses where total_expenses > 1000000 and  subtotal_run_office > 0;


select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses < 70000), 2) as Financial
from mv_expenses where total_expenses < 70000 and subtotal_finance > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 70000 and total_expenses < 200000), 2) 
from mv_expenses where total_expenses > 70000 and total_expenses < 200000 and subtotal_finance > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 200000 and total_expenses < 1000000), 2) 
from mv_expenses where total_expenses > 200000 and total_expenses < 1000000 and subtotal_finance > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 1000000), 2) 
from mv_expenses where total_expenses > 1000000 and subtotal_finance > 0;


select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses < 70000), 2) as Other
from mv_expenses where total_expenses < 70000 and subtotal_other > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 70000 and total_expenses < 200000), 2) 
from mv_expenses where total_expenses > 70000 and total_expenses < 200000 and subtotal_other > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 200000 and total_expenses < 1000000), 2) 
from mv_expenses where total_expenses > 200000 and total_expenses < 1000000 and subtotal_other > 0
union
select round(100*count(EIN)/(select count(EIN) from mv_expenses where total_expenses > 1000000), 2) 
from mv_expenses where total_expenses > 1000000 and subtotal_other > 0;


-- A FUNCTION FO CALL FROM THE DASHBOARD WITH SOME INPUTS
-- IT RETURNS A LIST OF ORGANISATIONS ACCORDING TO SOME INPUT FILTERS

DELIMITER $$
create procedure listing (
qsector varchar(2),
qstate varchar(2),
qsizemax decimal(14,0),
qsizemin decimal(14,0),
qemployees boolean
)
BEGIN
	select B.EIN AS `E.I.N`, NAME, ADDRESS, ZIP, CITY, STATE, NteeCat12 AS `GROUP`, R.total_revenue as REVENUE, P.noemplyeesw3cnt as EMPLOYEES
	from basic_data B
	left join (select EIN, total_revenue from mv_revenue) R
	on R.EIN = B.EIN
    left join (select EIN, noemplyeesw3cnt from f990_pc) P
    on P.EIN = B.EIN
    where NteeCat12 = qsector and STATE = qstate and idx_empl = qemployees and R.total_revenue <= qsizemax and R.total_revenue >= qsizemin
    order by REVENUE desc;
END $$ 
DELIMITER ;

--  NteeCat12 -------------------------------------------------------------------------
-- transferring NteeCat12 column from basic_data to the other tables
-- on f990_pc

alter table f990_pc add column NteeCat12 varchar(10);

UPDATE f990_pc t1
INNER JOIN (SELECT EIN, NteeCat12 from basic_data) t2 
ON t1.EIN = t2.EIN
SET t1.NteeCat12 = t2.NteeCat12;

-- on f990_ez

alter table f990_ez add column NteeCat12 varchar(10);

UPDATE f990_ez t1
INNER JOIN (SELECT EIN, NteeCat12 from basic_data) t2 
ON t1.EIN = t2.EIN
SET t1.NteeCat12 = t2.NteeCat12;


alter table basic_data drop column NteeCat12;
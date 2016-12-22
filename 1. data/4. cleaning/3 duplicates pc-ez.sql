-- duplicated EINs cross f990_pc and f990_ez

select t1.EIN, t1.NteeCat12 from f990_pc t1
inner join (select EIN, NteeCat12 from f990_ez) t2
on t1.EIN = t2.EIN
group by EIN;


select t1.EIN as nope, t2.* from f990_pc t1
right join (select * from f990_ez) t2
on t1.EIN = t2.EIN
where t1.EIN is null;

select t1.EIN, t2.EIN from f990_pc t1
left join (select EIN from f990_ez) t2
on t1.EIN = t2.EIN;

select EIN from f990_pc
natural join f990_ez;

select EIN from f990_pc 
union
select EIN from f990_ez;

select NAME from basic_data
natural join
(select EIN from f990_pc 
union
select EIN from f990_ez) aa;



-- remove duplicates from f990_ez-----------------------------

alter table f990_ez add column nope varchar(14);

UPDATE f990_ez t1
left join (select * from f990_pc) t2
on t1.EIN = t2.EIN
SET t1.nope = t2.EIN;

select * from f990_ez
where nope is not null;

DELETE FROM f990_ez WHERE nope is not null;

alter table f990_ez drop column nope;



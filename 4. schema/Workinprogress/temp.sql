SELECT * FROM db_npo.temp;
insert into cities select * from temp;

SELECT * FROM cities UNION SELECT * FROM temp;

select * from temp;

load data local 
infile 'C:\ALFONSO\WORK\GSE\14D003\use\pf\irsExtractFromNccs_2013_pf_PF_OK.csv'
into table OOKL;


LOAD DATA LOCAL INFILE 'C:\\ALFONSO\\WORK\\GSE\\14D003\\use\\form990_total.csv'
INTO TABLE form990
FIELDS TERMINATED BY ' ' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
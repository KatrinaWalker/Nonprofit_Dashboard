use usnpo;

LOAD DATA INFILE 'irsExtractFromNccs_2013_pf_PF_CA.csv' 
INTO TABLE 2012_pf_pf_CA 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\lf';

drop table 2012_pf_pf_ca;

show variables;

set global max_allowed_packet = 1073741824;

create table pf_PF like 2012_pf_pf_ca;
# BGSE DATA SCIENCE MASTER PROGRAM 2016-17
# COMPUTING PROJECT - 1st TERM
# DATA WRANGLERS - K.W. L.R. A.B.

-- schema creation

drop schema if exists db_npo_cleaning;
create schema db_npo_cleaning;
use db_npo_cleaning;


-- table for all common basic information

create table basic_data (
EIN varchar(9),
NAME varchar(70),
CITY varchar(22),
STATE varchar(2),
SEC_NAME varchar(100),
ADDRESS varchar(35),
ZIP varchar(10),
NteeCat12 varchar(10),
SUBSECCD varchar(10),
ORGCD varchar(6),
AFCD varchar(2),
CLASSCD varchar(4),
subcd varchar(2)
);


-- table for specific informmation from 990 forms

create table f990_PC (
EIN varchar(9),
f1096cnt decimal(14),
fw2gcnt decimal(14),
wthldngrulescd varchar(1),
noemplyeesw3cnt decimal(14),
filerqrdrtnscd varchar(1),
unrelbusinccd varchar(1),
filedf990tcd varchar(1),
frgnacctcd varchar(1),
prohibtdtxshltrcd varchar(1),
prtynotifyorgcd varchar(1),
filedf8886tcd varchar(1),
solicitcntrbcd varchar(1),
exprstmntcd varchar(1),
providegoodscd varchar(1),
notfydnrvalcd varchar(1),
filedf8282cd varchar(1),
f8282cnt decimal(14),
fndsrcvdcd varchar(1),
premiumspaidcd varchar(1),
filedf8899cd varchar(1),
filedf1098ccd varchar(1),
excbushldngscd varchar(1),
s4966distribcd varchar(1),
distribtodonorcd varchar(1),
initiationfees decimal(14),
grsrcptspublicuse decimal(14),
grsincmembers decimal(14),
grsincother decimal(14),
filedlieuf1041cd varchar(1),
txexmptint decimal(14),
qualhlthplncd varchar(1),
qualhlthreqmntn decimal(14),
qualhlthonhnd decimal(14),
rcvdpdtngcd varchar(1),
filedf720cd varchar(1),
totreprtabled decimal(14),
totcomprelatede decimal(14),
totestcompf decimal(14),
noindiv100kcnt decimal(14),
nocontractor100kcnt decimal(14),
totcntrbgfts decimal(14),
prgmservcode2acd decimal(14),
totrev2acola decimal(14),
prgmservcode2bcd decimal(14),
totrev2bcola decimal(14),
prgmservcode2ccd decimal(14),
totrev2ccola decimal(14),
prgmservcode2dcd decimal(14),
totrev2dcola decimal(14),
prgmservcode2ecd decimal(14),
totrev2ecola decimal(14),
totrev2fcola decimal(14),
totprgmrevnue decimal(14),
invstmntinc decimal(14),
txexmptbndsproceeds decimal(14),
royaltsinc decimal(14),
grsrntsreal decimal(14),
grsrntsprsnl decimal(14),
rntlexpnsreal decimal(14),
rntlexpnsprsnl decimal(14),
rntlincreal decimal(14),
rntlincprsnl decimal(14),
netrntlinc decimal(14),
grsalesecur decimal(14),
grsalesothr decimal(14),
cstbasisecur decimal(14),
cstbasisothr decimal(14),
gnlsecur decimal(14),
gnlsothr decimal(14),
netgnls decimal(14),
grsincfndrsng decimal(14),
lessdirfndrsng decimal(14),
netincfndrsng decimal(14),
grsincgaming decimal(14),
lessdirgaming decimal(14),
netincgaming decimal(14),
grsalesinvent decimal(14),
lesscstofgoods decimal(14),
netincsales decimal(14),
miscrev11acd decimal(14),
miscrevtota decimal(14),
miscrev11bcd decimal(14),
miscrevtot11b decimal(14),
miscrev11ccd decimal(14),
miscrevtot11c decimal(14),
miscrevtot11d decimal(14),
miscrevtot11e decimal(14),
totrevenue decimal(14),
grntstogovt decimal(14),
grnsttoindiv decimal(14),
grntstofrgngovt decimal(14),
benifitsmembrs decimal(14),
compnsatncurrofcr decimal(14),
compnsatnandothr decimal(14),
othrsalwages decimal(14),
pensionplancontrb decimal(14),
othremplyeebenef decimal(14),
payrolltx decimal(14),
feesforsrvcmgmt decimal(14),
legalfees decimal(14),
accntingfees decimal(14),
feesforsrvclobby decimal(14),
profndraising decimal(14),
feesforsrvcinvstmgmt decimal(14),
feesforsrvcothr decimal(14),
advrtpromo decimal(14),
officexpns decimal(14),
infotech decimal(14),
royaltsexpns decimal(14),
occupancy decimal(14),
travel decimal(14),
travelofpublicoffcl decimal(14),
converconventmtng decimal(14),
interestamt decimal(14),
pymtoaffiliates decimal(14),
deprcatndepletn decimal(14),
insurance decimal(14),
othrexpnsa decimal(14),
othrexpnsb decimal(14),
othrexpnsc decimal(14),
othrexpnsd decimal(14),
othrexpnse decimal(14),
othrexpnsf decimal(14),
totfuncexpns decimal(14),
nonintcashend decimal(14),
svngstempinvend decimal(14),
pldgegrntrcvblend decimal(14),
accntsrcvblend decimal(14),
currfrmrcvblend decimal(14),
rcvbldisqualend decimal(14),
notesloansrcvblend decimal(14),
invntriesalesend decimal(14),
prepaidexpnsend decimal(14),
lndbldgsequipend decimal(14),
invstmntsend decimal(14),
invstmntsothrend decimal(14),
invstmntsprgmend decimal(14),
intangibleassetsend decimal(14),
othrassetsend decimal(14),
totassetsend decimal(14),
accntspayableend decimal(14),
grntspayableend decimal(14),
deferedrevnuend decimal(14),
txexmptbndsend decimal(14),
escrwaccntliabend decimal(14),
paybletoffcrsend decimal(14),
secrdmrtgsend decimal(14),
unsecurednotesend decimal(14),
othrliabend decimal(14),
totliabend decimal(14),
unrstrctnetasstsend decimal(14),
temprstrctnetasstsend decimal(14),
permrstrctnetasstsend decimal(14),
capitalstktrstend decimal(14),
paidinsurplusend decimal(14),
retainedearnboy decimal(14),
retainedearnend decimal(14),
totnetassetboy decimal(14),
nonpfrea decimal(14),
totnooforgscnt decimal(14),
totsupport decimal(14),
gftgrntsrcvd170 decimal(14),
txrevnuelevied170 decimal(14),
srvcsval170 decimal(14),
pubsuppsubtot170 decimal(14),
exceeds2pct170 decimal(14),
pubsupplesspct170 decimal(14),
samepubsuppsubtot170 decimal(14),
grsinc170 decimal(14),
netincunreltd170 decimal(14),
othrinc170 decimal(14),
totsupp170 decimal(14),
grsrcptsrelated170 decimal(14),
totgftgrntrcvd509 decimal(14),
grsrcptsadmissn509 decimal(14),
grsrcptsactivities509 decimal(14),
txrevnuelevied509 decimal(14),
srvcsval509 decimal(14),
pubsuppsubtot509 decimal(14),
rcvdfrmdisqualsub509 decimal(14),
exceeds1pct509 decimal(14),
subtotpub509 decimal(14),
pubsupplesub509 decimal(14),
samepubsuppsubtot509 decimal(14),
grsinc509 decimal(14),
unreltxincls511tx509 decimal(14),
subtotsuppinc509 decimal(14),
netincunrelatd509 decimal(14),
othrinc509 decimal(14),
totsupp509 decimal(14)
);


-- table for specific informmation from EZ forms

create table f990_EZ (
EIN varchar(9),
FNDNCD varchar(10),
DEDUCTCD varchar(4),
EOSTATUS varchar(4),
tax_pd varchar(6),
FisYr varchar(4),
totcntrbs decimal(14),
prgmservrev decimal(14),
duesassesmnts decimal(14),
othrinvstinc decimal(14),
grsamtsalesastothr decimal(14),
basisalesexpnsothr decimal(14),
gnsaleofastothr decimal(14),
grsincgaming decimal(14),
grsrevnuefndrsng decimal(14),
direxpns decimal(14),
netincfndrsng decimal(14),
grsalesminusret decimal(14),
costgoodsold decimal(14),
grsprft decimal(14),
othrevnue decimal(14),
totrevnue decimal(14),
totexpns decimal(14),
totexcessyr decimal(14),
othrchgsnetassetfnd decimal(14),
networthend decimal(14),
totassetsend decimal(14),
totliabend decimal(14),
totnetassetsend decimal(14),
actvtynotprevrptcd varchar(2),
chngsinorgcd varchar(2),
unrelbusincd varchar(2),
filedf990tcd varchar(2),
contractioncd varchar(2),
politicalexpend decimal(14),
filedf1120polcd varchar(2),
loanstoofficerscd varchar(2),
loanstoofficers decimal(14),
initiationfee decimal(14),
grspublicrcpts decimal(14),
s4958excessbenefcd varchar(2),
prohibtdtxshltrcd varchar(2),
nonpfrea decimal(14),
totnooforgscnt decimal(14),
totsupport decimal(14),
gftgrntsrcvd170 decimal(14),
txrevnuelevied170 decimal(14),
srvcsval170 decimal(14),
pubsuppsubtot170 decimal(14),
exceeds2pct170 decimal(14),
pubsupplesspct170 decimal(14),
samepubsuppsubtot170 decimal(14),
grsinc170 decimal(14),
netincunreltd170 decimal(14),
othrinc170 decimal(14),
totsupp170 decimal(14),
grsrcptsrelated170 decimal(14),
totgftgrntrcvd509 decimal(14),
grsrcptsadmissn509 decimal(14),
grsrcptsactivities509 decimal(14),
txrevnuelevied509 decimal(14),
srvcsval509 decimal(14),
pubsuppsubtot509 decimal(14),
rcvdfrmdisqualsub509 decimal(14),
exceeds1pct509 decimal(14),
subtotpub509 decimal(14),
pubsupplesub509 decimal(14),
samepubsuppsubtot509 decimal(14),
grsinc509 decimal(14),
unreltxincls511tx509 decimal(14),
subtotsuppinc509 decimal(14),
netincunrelatd509 decimal(14),
othrinc509 decimal(14),
totsupp509 decimal(14)
);


-- table for specific informmation from PF forms

create table f990_PF (
EIN varchar(9),
FNDNCD varchar(10),
RULEDATE varchar(6),
ACCPER varchar(2),
DEDUCTCD varchar(4),
EOSTATUS varchar(4),
FRCD varchar(4),
tax_pd varchar(6),
FisYr varchar(4),
eostat varchar(2),
tax_yr varchar(4),
operatingcd varchar(4),
fairmrktvalamt decimal(14),
grscontrgifts decimal(14),
schedbind varchar(2),
intrstrvnue decimal(14),
dividndsamt decimal(14),
grsrents decimal(14),
grsslspramt decimal(14),
costsold decimal(14),
grsprofitbus decimal(14),
otherincamt decimal(14),
totrcptperbks decimal(14),
compofficers decimal(14),
pensplemplbenf decimal(14),
legalfeesamt decimal(14),
accountingfees decimal(14),
interestamt decimal(14),
depreciationamt decimal(14),
occupancyamt decimal(14),
travlconfmtngs decimal(14),
printingpubl decimal(14),
topradmnexpnsa decimal(14),
contrpdpbks decimal(14),
totexpnspbks decimal(14),
excessrcpts decimal(14),
totrcptnetinc decimal(14),
topradmnexpnsb decimal(14),
totexpnsnetinc decimal(14),
netinvstinc decimal(14),
trcptadjnetinc decimal(14),
totexpnsadjnet decimal(14),
adjnetinc decimal(14),
topradmnexpnsd decimal(14),
totexpnsexempt decimal(14),
othrcashamt decimal(14),
invstgovtoblig decimal(14),
invstcorpstk decimal(14),
invstcorpbnd decimal(14),
totinvstsec decimal(14),
mrtgloans decimal(14),
othrinvstend decimal(14),
othrassetseoy decimal(14),
totassetsend decimal(14),
mrtgnotespay decimal(14),
othrliabltseoy decimal(14),
totliabend decimal(14),
tfundnworth decimal(14),
fairmrktvaleoy decimal(14),
totexcapgnls decimal(14),
totexcapgn decimal(14),
totexcapls decimal(14),
invstexcisetx decimal(14),
sec4940notxcd varchar(2),
sec4940redtxcd varchar(2),
sect511tx decimal(14),
subtitleatx decimal(14),
totaxpyr decimal(14),
esttaxcr decimal(14),
txwithldsrc decimal(14),
txpaidf2758 decimal(14),
erronbkupwthld decimal(14),
estpnlty decimal(14),
taxdue decimal(14),
overpay decimal(14),
crelamt decimal(14),
infleg varchar(2),
actnotpr varchar(2),
chgnprvrptcd varchar(2),
filedf990tcd varchar(2),
contractncd varchar(2),
furnishcpycd varchar(2),
claimstatcd varchar(2),
cntrbtrstxyrcd varchar(2),
acqdrindrintcd varchar(2),
orgcmplypubcd varchar(2),
filedlf1041ind varchar(2),
propexchcd varchar(2),
brwlndmnycd varchar(2),
furngoodscd varchar(2),
paidcmpncd varchar(2),
transfercd varchar(2),
agremkpaycd varchar(2),
exceptactsind varchar(2),
prioractvcd varchar(2),
undistrinccd varchar(2),
applyprovind varchar(2),
dirindirintcd varchar(2),
excesshldcd varchar(2),
invstjexmptcd varchar(2),
prevjexmptcd varchar(2),
propgndacd varchar(2),
ipubelectcd varchar(2),
grntindivcd varchar(2),
nchrtygrntcd varchar(2),
nreligiouscd varchar(2),
excptransind varchar(2),
rfprsnlbnftind varchar(2),
pyprsnlbnftind varchar(2),
tfairmrktunuse decimal(14),
valncharitassets decimal(14),
cmpmininvstret decimal(14),
distribamt decimal(14),
undistribincyr decimal(14),
adjnetinccola decimal(14),
adjnetinccolb decimal(14),
adjnetinccolc decimal(14),
adjnetinccold decimal(14),
adjnetinctot decimal(14),
qlfydistriba decimal(14),
qlfydistribb decimal(14),
qlfydistribc decimal(14),
qlfydistribd decimal(14),
qlfydistribtot decimal(14),
valassetscola decimal(14),
valassetscolb decimal(14),
valassetscolc decimal(14),
valassetscold decimal(14),
valassetstot decimal(14),
qlfyasseta decimal(14),
qlfyassetb decimal(14),
qlfyassetc decimal(14),
qlfyassetd decimal(14),
qlfyassettot decimal(14),
endwmntscola decimal(14),
endwmntscolb decimal(14),
endwmntscolc decimal(14),
endwmntscold decimal(14),
endwmntstot decimal(14),
totsuprtcola decimal(14),
totsuprtcolb decimal(14),
totsuprtcolc decimal(14),
totsuprtcold decimal(14),
totsuprttot decimal(14),
pubsuprtcola decimal(14),
pubsuprtcolb decimal(14),
pubsuprtcolc decimal(14),
pubsuprtcold decimal(14),
pubsuprttot decimal(14),
grsinvstinca decimal(14),
grsinvstincb decimal(14),
grsinvstincc decimal(14),
grsinvstincd decimal(14),
grsinvstinctot decimal(14),
grntapprvfut decimal(14),
progsrvcacold decimal(14),
progsrvcacole decimal(14),
progsrvcbcold decimal(14),
progsrvcbcole decimal(14),
progsrvcccold decimal(14),
progsrvcccole decimal(14),
progsrvcdcold decimal(14),
progsrvcdcole decimal(14),
progsrvcecold decimal(14),
progsrvcecole decimal(14),
progsrvcfcold decimal(14),
progsrvcfcole decimal(14),
progsrvcgcold decimal(14),
progsrvcgcole decimal(14),
membershpduesd decimal(14),
membershpduese decimal(14),
intonsvngsd decimal(14),
intonsvngse decimal(14),
dvdndsintd decimal(14),
dvdndsinte decimal(14),
trnsfrcashcd varchar(2),
trnsothasstscd varchar(2),
salesasstscd varchar(2),
prchsasstscd varchar(2),
rentlsfacltscd varchar(2),
reimbrsmntscd varchar(2),
loansguarcd varchar(2),
perfservicescd varchar(2),
sharngasstscd varchar(2)
);




-- load all data!!!

LOAD DATA LOCAL INFILE 'C:\\ALFONSO\\WORK\\GSE\\14D003\\dump_files\\basic_data.csv'
INTO TABLE basic_data
FIELDS TERMINATED BY ' ' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:\\ALFONSO\\WORK\\GSE\\14D003\\dump_files\\990_PC.csv'
INTO TABLE f990_PC
FIELDS TERMINATED BY ' ' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:\\ALFONSO\\WORK\\GSE\\14D003\\dump_files\\990_EZ.csv'
INTO TABLE f990_EZ
FIELDS TERMINATED BY ' ' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:\\ALFONSO\\WORK\\GSE\\14D003\\dump_files\\990_PF.csv'
INTO TABLE f990_PF
FIELDS TERMINATED BY ' ' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


create index idx_basic_ein on basic_data (EIN);
create index idx_PC_ein on f990_pc (EIN);
create index idx_EZ_ein on f990_ez (EIN);
create index idx_PF_ein on f990_pf (EIN);

/* indexes and keys
-- create indexes

create index idx_track_ZIP_basic_data on basic_data(ZIP);
create index idx_track_EIN on form_990(EIN);
create index idx_track_EIN on form_pf(EIN);
create index idx_track_EIN on form_ez(EIN);


-- create primary keys

alter table form_990
add primary key (EIN);
alter table form_990
add primary key (EIN);
alter table form_990
add primary key (EIN);
alter table basic_data
add primary key (EIN);


-- create foreign keys

alter table basic_data add constraint
foreign key (EIN) references form_990(EIN) on delete no action on update no action;
alter table basic_data add constraint
foreign key (EIN) references form_pf(EIN) on delete no action on update no action;
alter table basic_data add constraint
foreign key (EIN) references form_ez(EIN) on delete no action on update no action;
*/
# BGSE DATA SCIENCE MASTER PROGRAM 2016-17
# COMPUTING PROJECT - 1st TERM
# DATA WRANGLERS - K.W. L.R. A.B.

-- schema creation

drop schema if exists db_npo;
create schema db_npo;
use db_npo;


-- table for all common basic information

create table basic_data (
EIN varchar(9),
NAME varchar(70),
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


-- table for specific informmation from PF forms

create table form_PF (
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
fairmrktvalamt int(2),
grscontrgifts int(2),
schedbind varchar(2),
intrstrvnue int(2),
dividndsamt int(2),
grsrents int(2),
grsslspramt int(2),
costsold int(2),
grsprofitbus int(2),
otherincamt int(2),
totrcptperbks int(2),
compofficers int(2),
pensplemplbenf int(2),
legalfeesamt int(2),
accountingfees int(2),
interestamt int(2),
depreciationamt int(2),
occupancyamt int(2),
travlconfmtngs int(2),
printingpubl int(2),
topradmnexpnsa int(2),
contrpdpbks int(2),
totexpnspbks int(2),
excessrcpts int(2),
totrcptnetinc int(2),
topradmnexpnsb int(2),
totexpnsnetinc int(2),
netinvstinc int(2),
trcptadjnetinc int(2),
totexpnsadjnet int(2),
adjnetinc int(2),
topradmnexpnsd int(2),
totexpnsexempt int(2),
othrcashamt int(2),
invstgovtoblig int(2),
invstcorpstk int(2),
invstcorpbnd int(2),
totinvstsec int(2),
mrtgloans int(2),
othrinvstend int(2),
othrassetseoy int(2),
totassetsend int(2),
mrtgnotespay int(2),
othrliabltseoy int(2),
totliabend int(2),
tfundnworth int(2),
fairmrktvaleoy int(2),
totexcapgnls int(2),
totexcapgn int(2),
totexcapls int(2),
invstexcisetx int(2),
sec4940notxcd varchar(2),
sec4940redtxcd varchar(2),
sect511tx int(2),
subtitleatx int(2),
totaxpyr int(2),
esttaxcr int(2),
txwithldsrc int(2),
txpaidf2758 int(2),
erronbkupwthld int(2),
estpnlty int(2),
taxdue int(2),
overpay int(2),
crelamt int(2),
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
tfairmrktunuse int(2),
valncharitassets int(2),
cmpmininvstret int(2),
distribamt int(2),
undistribincyr int(2),
adjnetinccola int(2),
adjnetinccolb int(2),
adjnetinccolc int(2),
adjnetinccold int(2),
adjnetinctot int(2),
qlfydistriba int(2),
qlfydistribb int(2),
qlfydistribc int(2),
qlfydistribd int(2),
qlfydistribtot int(2),
valassetscola int(2),
valassetscolb int(2),
valassetscolc int(2),
valassetscold int(2),
valassetstot int(2),
qlfyasseta int(2),
qlfyassetb int(2),
qlfyassetc int(2),
qlfyassetd int(2),
qlfyassettot int(2),
endwmntscola int(2),
endwmntscolb int(2),
endwmntscolc int(2),
endwmntscold int(2),
endwmntstot int(2),
totsuprtcola int(2),
totsuprtcolb int(2),
totsuprtcolc int(2),
totsuprtcold int(2),
totsuprttot int(2),
pubsuprtcola int(2),
pubsuprtcolb int(2),
pubsuprtcolc int(2),
pubsuprtcold int(2),
pubsuprttot int(2),
grsinvstinca int(2),
grsinvstincb int(2),
grsinvstincc int(2),
grsinvstincd int(2),
grsinvstinctot int(2),
grntapprvfut int(2),
progsrvcacold int(2),
progsrvcacole int(2),
progsrvcbcold int(2),
progsrvcbcole int(2),
progsrvcccold int(2),
progsrvcccole int(2),
progsrvcdcold int(2),
progsrvcdcole int(2),
progsrvcecold int(2),
progsrvcecole int(2),
progsrvcfcold int(2),
progsrvcfcole int(2),
progsrvcgcold int(2),
progsrvcgcole int(2),
membershpduesd int(2),
membershpduese int(2),
intonsvngsd int(2),
intonsvngse int(2),
dvdndsintd int(2),
dvdndsinte int(2),
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


-- table for specific informmation from EZ forms

create table form_EZ (
EIN varchar(9),
FNDNCD varchar(10),
DEDUCTCD varchar(4),
EOSTATUS varchar(4),
tax_pd varchar(6),
FisYr varchar(4),
totcntrbs int(2),
prgmservrev int(2),
duesassesmnts int(2),
othrinvstinc int(2),
grsamtsalesastothr int(2),
basisalesexpnsothr int(2),
gnsaleofastothr int(2),
grsincgaming int(2),
grsrevnuefndrsng int(2),
direxpns int(2),
netincfndrsng int(2),
grsalesminusret int(2),
costgoodsold int(2),
grsprft int(2),
othrevnue int(2),
totrevnue int(2),
totexpns int(2),
totexcessyr int(2),
othrchgsnetassetfnd int(2),
networthend int(2),
totassetsend int(2),
totliabend int(2),
totnetassetsend int(2),
actvtynotprevrptcd varchar(2),
chngsinorgcd varchar(2),
unrelbusincd varchar(2),
filedf990tcd varchar(2),
contractioncd varchar(2),
politicalexpend int(2),
filedf1120polcd varchar(2),
loanstoofficerscd varchar(2),
loanstoofficers int(2),
initiationfee int(2),
grspublicrcpts int(2),
s4958excessbenefcd varchar(2),
prohibtdtxshltrcd varchar(2),
nonpfrea int(2),
totnooforgscnt int(2),
totsupport int(2),
gftgrntsrcvd170 int(2),
txrevnuelevied170 int(2),
srvcsval170 int(2),
pubsuppsubtot170 int(2),
exceeds2pct170 int(2),
pubsupplesspct170 int(2),
samepubsuppsubtot170 int(2),
grsinc170 int(2),
netincunreltd170 int(2),
othrinc170 int(2),
totsupp170 int(2),
grsrcptsrelated170 int(2),
totgftgrntrcvd509 int(2),
grsrcptsadmissn509 int(2),
grsrcptsactivities509 int(2),
txrevnuelevied509 int(2),
srvcsval509 int(2),
pubsuppsubtot509 int(2),
rcvdfrmdisqualsub509 int(2),
exceeds1pct509 int(2),
subtotpub509 int(2),
pubsupplesub509 int(2),
samepubsuppsubtot509 int(2),
grsinc509 int(2),
unreltxincls511tx509 int(2),
subtotsuppinc509 int(2),
netincunrelatd509 int(2),
othrinc509 int(2),
totsupp509 int(2)
);


-- table for specific informmation from 990 forms

create table form_990 (
EIN varchar(9),
f1096cnt int(1),
fw2gcnt int(1),
wthldngrulescd varchar(1),
noemplyeesw3cnt int(1),
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
f8282cnt int(1),
fndsrcvdcd varchar(1),
premiumspaidcd varchar(1),
filedf8899cd varchar(1),
filedf1098ccd varchar(1),
excbushldngscd varchar(1),
s4966distribcd varchar(1),
distribtodonorcd varchar(1),
initiationfees int(1),
grsrcptspublicuse int(1),
grsincmembers int(1),
grsincother int(1),
filedlieuf1041cd varchar(1),
txexmptint int(1),
qualhlthplncd varchar(1),
qualhlthreqmntn int(1),
qualhlthonhnd int(1),
rcvdpdtngcd varchar(1),
filedf720cd varchar(1),
totreprtabled int(1),
totcomprelatede int(1),
totestcompf int(1),
noindiv100kcnt int(1),
nocontractor100kcnt int(1),
totcntrbgfts int(1),
prgmservcode2acd int(1),
totrev2acola int(1),
prgmservcode2bcd int(1),
totrev2bcola int(1),
prgmservcode2ccd int(1),
totrev2ccola int(1),
prgmservcode2dcd int(1),
totrev2dcola int(1),
prgmservcode2ecd int(1),
totrev2ecola int(1),
totrev2fcola int(1),
totprgmrevnue int(1),
invstmntinc int(1),
txexmptbndsproceeds int(1),
royaltsinc int(1),
grsrntsreal int(1),
grsrntsprsnl int(1),
rntlexpnsreal int(1),
rntlexpnsprsnl int(1),
rntlincreal int(1),
rntlincprsnl int(1),
netrntlinc int(1),
grsalesecur int(1),
grsalesothr int(1),
cstbasisecur int(1),
cstbasisothr int(1),
gnlsecur int(1),
gnlsothr int(1),
netgnls int(1),
grsincfndrsng int(1),
lessdirfndrsng int(1),
netincfndrsng int(1),
grsincgaming int(1),
lessdirgaming int(1),
netincgaming int(1),
grsalesinvent int(1),
lesscstofgoods int(1),
netincsales int(1),
miscrev11acd int(1),
miscrevtota int(1),
miscrev11bcd int(1),
miscrevtot11b int(1),
miscrev11ccd int(1),
miscrevtot11c int(1),
miscrevtot11d int(1),
miscrevtot11e int(1),
totrevenue int(1),
grntstogovt int(1),
grnsttoindiv int(1),
grntstofrgngovt int(1),
benifitsmembrs int(1),
compnsatncurrofcr int(1),
compnsatnandothr int(1),
othrsalwages int(1),
pensionplancontrb int(1),
othremplyeebenef int(1),
payrolltx int(1),
feesforsrvcmgmt int(1),
legalfees int(1),
accntingfees int(1),
feesforsrvclobby int(1),
profndraising int(1),
feesforsrvcinvstmgmt int(1),
feesforsrvcothr int(1),
advrtpromo int(1),
officexpns int(1),
infotech int(1),
royaltsexpns int(1),
occupancy int(1),
travel int(1),
travelofpublicoffcl int(1),
converconventmtng int(1),
interestamt int(1),
pymtoaffiliates int(1),
deprcatndepletn int(1),
insurance int(1),
othrexpnsa int(1),
othrexpnsb int(1),
othrexpnsc int(1),
othrexpnsd int(1),
othrexpnse int(1),
othrexpnsf int(1),
totfuncexpns int(1),
nonintcashend int(1),
svngstempinvend int(1),
pldgegrntrcvblend int(1),
accntsrcvblend int(1),
currfrmrcvblend int(1),
rcvbldisqualend int(1),
notesloansrcvblend int(1),
invntriesalesend int(1),
prepaidexpnsend int(1),
lndbldgsequipend int(1),
invstmntsend int(1),
invstmntsothrend int(1),
invstmntsprgmend int(1),
intangibleassetsend int(1),
othrassetsend int(1),
totassetsend int(1),
accntspayableend int(1),
grntspayableend int(1),
deferedrevnuend int(1),
txexmptbndsend int(1),
escrwaccntliabend int(1),
paybletoffcrsend int(1),
secrdmrtgsend int(1),
unsecurednotesend int(1),
othrliabend int(1),
totliabend int(1),
unrstrctnetasstsend int(1),
temprstrctnetasstsend int(1),
permrstrctnetasstsend int(1),
capitalstktrstend int(1),
paidinsurplusend int(1),
retainedearnboy int(1),
retainedearnend int(1),
totnetassetboy int(1),
nonpfrea int(14),
totnooforgscnt int(14),
totsupport int(14),
gftgrntsrcvd170 int(14),
txrevnuelevied170 int(14),
srvcsval170 int(14),
pubsuppsubtot170 int(14),
exceeds2pct170 int(14),
pubsupplesspct170 int(14),
samepubsuppsubtot170 int(14),
grsinc170 int(14),
netincunreltd170 int(14),
othrinc170 int(14),
totsupp170 int(14),
grsrcptsrelated170 int(14),
totgftgrntrcvd509 int(14),
grsrcptsadmissn509 int(14),
grsrcptsactivities509 int(14),
txrevnuelevied509 int(14),
srvcsval509 int(14),
pubsuppsubtot509 int(14),
rcvdfrmdisqualsub509 int(14),
exceeds1pct509 int(14),
subtotpub509 int(14),
pubsupplesub509 int(14),
samepubsuppsubtot509 int(14),
grsinc509 int(14),
unreltxincls511tx509 int(14),
subtotsuppinc509 int(14),
netincunrelatd509 int(14),
othrinc509 int(14),
totsupp509 int(14)
);


-- zip-city-state dimension table

create table zip_dict (
ZIP int(5),
CITY varchar(22),
STATE varchar(2)
);


-- load all data!!!

LOAD DATA LOCAL INFILE 'C:\\ALFONSO\\WORK\\GSE\\14D003\\basic_data.csv'
INTO TABLE basic_data
FIELDS TERMINATED BY ' ' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '~/NPO_USA/form_990.csv'
INTO TABLE form_990
FIELDS TERMINATED BY ' ' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '~/NPO_USA/form_PF.csv'
INTO TABLE form_pf
FIELDS TERMINATED BY ' ' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '~/NPO_USA/form_EZ.csv'
INTO TABLE form_ez
FIELDS TERMINATED BY ' ' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '~/NPO_USA/ZIP_dict.csv'
INTO TABLE zip_dict
FIELDS TERMINATED BY ' ' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- create indexes

create index idx_track_ZIP on zip_dict(ZIP);
create index idx_track_CITY on zip_dict(CITY);
create index idx_track_STATE on zip_dict(STATE);
create index idx_track_ZIP_basic_data on basic_data(ZIP);
create index idx_track_EIN on form_990(EIN);
create index idx_track_EIN on form_pf(EIN);
create index idx_track_EIN on form_ez(EIN);


-- create primary keys

alter table zip_dict
add primary key (ZIP);
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
foreign key (ZIP) references zip_dict(ZIP) on delete no action on update no action;
alter table basic_data add constraint
foreign key (EIN) references form_990(EIN) on delete no action on update no action;
alter table basic_data add constraint
foreign key (EIN) references form_pf(EIN) on delete no action on update no action;
alter table basic_data add constraint
foreign key (EIN) references form_ez(EIN) on delete no action on update no action;

# EOC
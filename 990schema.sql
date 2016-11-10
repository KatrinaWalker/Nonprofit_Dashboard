-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- NPO PROJECT
-- AB,KFW,LR
drop table if exists db_npo;

create database db_npo;

use db_npo;

create table main (

EIN,NAME,SEC_NAME,ADDRESS,CITY,STATE,ZIP,NteeCat12,SUBSECCD,ORGCD,AFCD,CLASSCD,subcd,f1096cnt,fw2gcnt,wthldngrulescd,noemplyeesw3cnt,filerqrdrtnscd,unrelbusinccd,filedf990tcd,frgnacctcd,prohibtdtxshltrcd,prtynotifyorgcd,      
                     filedf8886tcd,solicitcntrbcd,exprstmntcd,providegoodscd,notfydnrvalcd,filedf8282cd,         
                     f8282cnt,fndsrcvdcd,premiumspaidcd,filedf8899cd,filedf1098ccd,excbushldngscd,      
                     s4966distribcd,distribtodonorcd,initiationfees,grsrcptspublicuse,grsincmembers,grsincother,
                     filedlieuf1041cd,txexmptint,qualhlthplncd,qualhlthreqmntn,qualhlthonhnd,rcvdpdtngcd,       
                     filedf720cd,totreprtabled,totcomprelatede,totestcompf,noindiv100kcnt,nocontractor100kcnt,  
                     totcntrbgfts,prgmservcode2acd,totrev2acola,prgmservcode2bcd,totrev2bcola,prgmservcode2ccd,     
                     totrev2ccola,prgmservcode2dcd,totrev2dcola,prgmservcode2ecd,totrev2ecola,totrev2fcola,
                     totprgmrevnue,invstmntinc,txexmptbndsproceeds,royaltsinc,grsrntsreal,grsrntsprsnl,         
                     rntlexpnsreal,rntlexpnsprsnl,rntlincreal,rntlincprsnl,netrntlinc,grsalesecur,     
                     grsalesothr,cstbasisecur,cstbasisothr,gnlsecur,gnlsothr,netgnls,            
                     grsincfndrsng,lessdirfndrsng,netincfndrsng,grsincgaming,lessdirgaming,netincgaming,     
                     grsalesinvent,lesscstofgoods,netincsales,miscrev11acd,miscrevtota,miscrev11bcd,     
                     miscrevtot11b,miscrev11ccd,miscrevtot11c,miscrevtot11d,miscrevtot11e,totrevenue,         
                     grntstogovt,grnsttoindiv,grntstofrgngovt,benifitsmembrs,compnsatncurrofcr,compnsatnandothr,    
                     othrsalwages,pensionplancontrb,othremplyeebenef,payrolltx,feesforsrvcmgmt,legalfees,            
                     accntingfees,feesforsrvclobby,profndraising,feesforsrvcinvstmgmt,feesforsrvcothr,advrtpromo,           
                     officexpns,infotech,royaltsexpns,occupancy,travel,travelofpublicoffcl,
                     converconventmtng,interestamt,pymtoaffiliates,deprcatndepletn,insurance,othrexpnsa,      
                     othrexpnsb,othrexpnsc,othrexpnsd,othrexpnse,othrexpnsf,totfuncexpns,    
                     nonintcashend,svngstempinvend,pldgegrntrcvblend,accntsrcvblend,currfrmrcvblend,rcvbldisqualend,   
                     notesloansrcvblend,invntriesalesend,prepaidexpnsend,lndbldgsequipend,invstmntsend,invstmntsothrend,
                     invstmntsprgmend,intangibleassetsend,othrassetsend,totassetsend,accntspayableend,grntspayableend,   
                     deferedrevnuend,txexmptbndsend,escrwaccntliabend,paybletoffcrsend,secrdmrtgsend,unsecurednotesend,    
                     othrliabend,totliabend,unrstrctnetasstsend,temprstrctnetasstsend,permrstrctnetasstsend,capitalstktrstend,    
                     paidinsurplusend,retainedearnend,totnetassetend,totnetliabastend,nonpfrea,totnooforgscnt,     
                     totsupport,gftgrntsrcvd170,txrevnuelevied170,srvcsval170,pubsuppsubtot170,exceeds2pct170,      
                     pubsupplesspct170,samepubsuppsubtot170,grsinc170,netincunreltd170,othrinc170,totsupp170,         
                     grsrcptsrelated170,totgftgrntrcvd509,grsrcptsadmissn509,grsrcptsactivities509,txrevnuelevied509,srvcsval509,          
                     pubsuppsubtot509,rcvdfrmdisqualsub509,exceeds1pct509,subtotpub509,pubsupplesub509,samepubsuppsubtot509, 
                     grsinc509,unreltxincls511tx509,subtotsuppinc509,netincunrelatd509,othrinc509,totsupp509
);

create table cities (
ZIP varchar(10),
CITY varchar(22),
STATE varchar(2),
primary key (ZIP)
);

alter table main add constraint
foreign key (ZIP) references cities (ZIP) on delete no action on update no action;

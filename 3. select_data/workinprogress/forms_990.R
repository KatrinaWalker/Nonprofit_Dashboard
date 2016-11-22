# forms 990_PC, 990_PF contain all columns except for the CLASSIFICATION ONES!: ntmaj5,ntmaj10,ntmaj12,LEVEL1,MAJGRPB
library(dplyr)
setwd("~/Desktop/2013/990")
temp = list.files(pattern="*.csv")
for (i in 1:length(temp)) assign(temp[i], read.csv(temp[i]))
print(temp)
db_990 = NULL
for (i in 1:length(temp)) {
  print(temp[i])
  new990 <- select(read.csv(temp[i]),unique(EIN),NAME,SEC_NAME,ADDRESS,CITY,STATE,ZIP,NteeCat12,SUBSECCD,ORGCD,AFCD,CLASSCD,subcd,f1096cnt,fw2gcnt,wthldngrulescd,noemplyeesw3cnt,filerqrdrtnscd,unrelbusinccd,filedf990tcd,frgnacctcd,prohibtdtxshltrcd,prtynotifyorgcd,      
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
                     grsinc509,unreltxincls511tx509,subtotsuppinc509,netincunrelatd509,othrinc509,totsupp509)
  db_990 = rbind(f,new990)
}

NROW(db_990)
NCOL(db_990)
#> NROW(f)= 496905
#> NCOL(f)= 203
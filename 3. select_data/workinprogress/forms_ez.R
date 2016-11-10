# forms ez_PC
library(dplyr)
setwd("~/Desktop/2013/ez_PC")
temp = list.files(pattern="*.csv")
for (i in 1:length(temp)) assign(temp[i], read.csv(temp[i]))
print(temp)
db_ez = NULL
for (i in 1:length(temp)) {
  print(temp[i])
  newez <- select(read.csv(temp[i]),ein,NAME,CITY,STATE,ZIP,NteeCat12,SUBSECCD,FNDNCD,ORGCD,AFCD,CLASSCD,DEDUCTCD,EOSTATUS,tax_pd,FisYr,subcd,totcntrbs,prgmservrev,duesassesmnts,othrinvstinc,grsamtsalesastothr,basisalesexpnsothr,gnsaleofastothr,grsincgaming,         
                    grsrevnuefndrsng,direxpns,netincfndrsng,grsalesminusret,costgoodsold,grsprft,             
                    othrevnue,totrevnue,totexpns,totexcessyr,othrchgsnetassetfnd,networthend,totassetsend,totliabend,totnetassetsend,actvtynotprevrptcd,chngsinorgcd,unrelbusincd,        
                    filedf990tcd,contractioncd,politicalexpend,filedf1120polcd,loanstoofficerscd,loanstoofficers,initiationfee,grspublicrcpts,s4958excessbenefcd,prohibtdtxshltrcd,nonpfrea,totnooforgscnt,       
                    totsupport,gftgrntsrcvd170,txrevnuelevied170,srvcsval170,pubsuppsubtot170,exceeds2pct170,      
                    pubsupplesspct170,samepubsuppsubtot170,grsinc170,netincunreltd170,othrinc170,totsupp170,        
                    grsrcptsrelated170,totgftgrntrcvd509,grsrcptsadmissn509,grsrcptsactivities509,txrevnuelevied509,srvcsval509,        
                    pubsuppsubtot509,rcvdfrmdisqualsub509,exceeds1pct509,subtotpub509,pubsupplesub509,samepubsuppsubtot509,
                    grsinc509,unreltxincls511tx509,subtotsuppinc509,netincunrelatd509,othrinc509,totsupp509)       
  db_ez = rbind(db_ez,newez)
}

NROW(db_ez)
NCOL(db_ez)

#> NROW(f)= 156591
#> NCOL(f)= 84
# BGSE DATA SCIENCE MASTER PROGRAM 2016-17
# COMPUTING PROJECT - 1st TERM
# SORT DATA & KICK ASSES - K.W. L.R. A.B.

# SELECTION OF WORKING INPUT DATA

rm(list = ls())
library(dplyr)

work.path <- "C:/ALFONSO/WORK/GSE/14D003/dataset/ez/"
setwd(work.path)

file.list <- list.files(pattern="*.csv")

# process the whole batch of csv files to obtain df.total
df.total <- data.frame()
for (f in 1:length(file.list)) {
  
  # read one csv file
  df <- data.frame()
  df <- (read.csv(paste0(work.path, file.list[f])))
  
  # select columns
  df <- select(df, unique(EIN), FNDNCD, DEDUCTCD, EOSTATUS, tax_pd, FisYr, totcntrbs, prgmservrev, duesassesmnts, othrinvstinc, grsamtsalesastothr, basisalesexpnsothr, gnsaleofastothr, grsincgaming, grsrevnuefndrsng, direxpns, netincfndrsng, grsalesminusret, costgoodsold, grsprft, othrevnue, totrevnue, totexpns, totexcessyr, othrchgsnetassetfnd, networthend, totassetsend, totliabend, totnetassetsend, actvtynotprevrptcd, chngsinorgcd, unrelbusincd, filedf990tcd, contractioncd, politicalexpend, filedf1120polcd, loanstoofficerscd, loanstoofficers, initiationfee, grspublicrcpts, s4958excessbenefcd, prohibtdtxshltrcd, nonpfrea, totnooforgscnt, totsupport, gftgrntsrcvd170, txrevnuelevied170, srvcsval170, pubsuppsubtot170, exceeds2pct170, pubsupplesspct170, samepubsuppsubtot170, grsinc170, netincunreltd170, othrinc170, totsupp170, grsrcptsrelated170, totgftgrntrcvd509, grsrcptsadmissn509, grsrcptsactivities509, txrevnuelevied509, srvcsval509, pubsuppsubtot509, rcvdfrmdisqualsub509, exceeds1pct509, subtotpub509, pubsupplesub509, samepubsuppsubtot509, grsinc509, unreltxincls511tx509, subtotsuppinc509, netincunrelatd509, othrinc509, totsupp509)

  # add each file to the final result
  df.total <- rbind.data.frame(df.total, df)
}  

# write the result onto a csv file
write.table(df.total, file = "C:/ALFONSO/WORK/GSE/14D003/form_EZ_total.csv", row.names = F, col.names = T)

# EOC
# BGSE DATA SCIENCE MASTER PROGRAM 2016-17
# COMPUTING PROJECT - 1st TERM
# SORT DATA & KICK ASSES - K.W. L.R. A.B.

# SELECTION OF WORKING INPUT DATA

rm(list = ls())
library(dplyr)
library(RMySQL)
library(stringr)

# create a connection with the DB
db.npo <- dbConnect(MySQL(), user='alfonso', password = '1317', dbname = 'db_npo', host = '127.0.0.1')
on.exit(dbDisconnect(db.npo))

# work.path = "/Users/Laura/Desktop/2013"

work.path <- "C:/ALFONSO/WORK/GSE/14D003/dataset/990/"
setwd(work.path)

file.list <- list.files(pattern="*.csv")
short.names <- paste0('form_', str_sub(file.list, -13, -4))

# process the whole batch of csv files to obtain df.total
df.total <- data.frame()
for (f in 1:length(file.list)) {
  
  # read one csv file
  df <- data.frame()
  df <- (read.csv(paste0(work.path, file.list[f])))
  
  # select columns
  df <- select(df, unique(EIN), f1096cnt, fw2gcnt, wthldngrulescd, noemplyeesw3cnt, filerqrdrtnscd, unrelbusinccd, filedf990tcd, frgnacctcd, prohibtdtxshltrcd, prtynotifyorgcd, filedf8886tcd, solicitcntrbcd, exprstmntcd, providegoodscd, notfydnrvalcd, filedf8282cd, f8282cnt, fndsrcvdcd, premiumspaidcd, filedf8899cd, filedf1098ccd, excbushldngscd, s4966distribcd, distribtodonorcd, initiationfees, grsrcptspublicuse, grsincmembers, grsincother, filedlieuf1041cd, txexmptint, qualhlthplncd, qualhlthreqmntn, qualhlthonhnd, rcvdpdtngcd, filedf720cd, totreprtabled, totcomprelatede, totestcompf, noindiv100kcnt, nocontractor100kcnt, totcntrbgfts, prgmservcode2acd, totrev2acola, prgmservcode2bcd, totrev2bcola, prgmservcode2ccd, totrev2ccola, prgmservcode2dcd, totrev2dcola, prgmservcode2ecd, totrev2ecola, totrev2fcola, totprgmrevnue, invstmntinc, txexmptbndsproceeds, royaltsinc, grsrntsreal, grsrntsprsnl, rntlexpnsreal, rntlexpnsprsnl, rntlincreal, rntlincprsnl, netrntlinc, grsalesecur, grsalesothr, cstbasisecur, cstbasisothr, gnlsecur, gnlsothr, netgnls, grsincfndrsng, lessdirfndrsng, netincfndrsng, grsincgaming, lessdirgaming, netincgaming, grsalesinvent, lesscstofgoods, netincsales, miscrev11acd, miscrevtota, miscrev11bcd, miscrevtot11b, miscrev11ccd, miscrevtot11c, miscrevtot11d, miscrevtot11e, totrevenue, grntstogovt, grnsttoindiv, grntstofrgngovt, benifitsmembrs, compnsatncurrofcr, compnsatnandothr, othrsalwages, pensionplancontrb, othremplyeebenef, payrolltx, feesforsrvcmgmt, legalfees, accntingfees, feesforsrvclobby, profndraising, feesforsrvcinvstmgmt, feesforsrvcothr, advrtpromo, officexpns, infotech, royaltsexpns, occupancy, travel, travelofpublicoffcl, converconventmtng, interestamt, pymtoaffiliates, deprcatndepletn, insurance, othrexpnsa, othrexpnsb, othrexpnsc, othrexpnsd, othrexpnse, othrexpnsf, totfuncexpns, nonintcashend, svngstempinvend, pldgegrntrcvblend, accntsrcvblend, currfrmrcvblend, rcvbldisqualend, notesloansrcvblend, invntriesalesend, prepaidexpnsend, lndbldgsequipend, invstmntsend, invstmntsothrend, invstmntsprgmend, intangibleassetsend, othrassetsend, totassetsend, accntspayableend, grntspayableend, deferedrevnuend, txexmptbndsend, escrwaccntliabend, paybletoffcrsend, secrdmrtgsend, unsecurednotesend, othrliabend, totliabend, unrstrctnetasstsend, temprstrctnetasstsend, permrstrctnetasstsend, capitalstktrstend, paidinsurplusend, retainedearnend, totnetassetend, totnetliabastend, nonpfrea, totnooforgscnt, totsupport, gftgrntsrcvd170, txrevnuelevied170, srvcsval170, pubsuppsubtot170, exceeds2pct170, pubsupplesspct170, samepubsuppsubtot170, grsinc170, netincunreltd170, othrinc170, totsupp170, grsrcptsrelated170, totgftgrntrcvd509, grsrcptsadmissn509, grsrcptsactivities509, txrevnuelevied509, srvcsval509, pubsuppsubtot509, rcvdfrmdisqualsub509, exceeds1pct509, subtotpub509, pubsupplesub509, samepubsuppsubtot509, grsinc509, unreltxincls511tx509, subtotsuppinc509, netincunrelatd509, othrinc509, totsupp509)
  df["ZIP"] <- substr(df["ZIP"], 1, 5) # eliminate sub-zip codes

  # add each file to the final result
  df.total <- rbind.data.frame(df.total, df)
}  

# write the result onto a csv file
write.table(df.total, file = "C:/ALFONSO/WORK/GSE/14D003/form_990_total.csv", row.names = F, col.names = T)




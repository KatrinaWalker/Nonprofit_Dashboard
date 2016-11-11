# BGSE DATA SCIENCE MASTER PROGRAM 2016-17
# COMPUTING PROJECT - 1st TERM
# SORT DATA & KICK ASSES - K.W. L.R. A.B.

# SELECTION OF WORKING INPUT DATA

rm(list = ls())
library(dplyr)

work.path <- "C:/ALFONSO/WORK/GSE/14D003/"

########################
# 990 forms 

setwd(paste0(work.path, "dataset/990/"))
file.list <- list.files(pattern="*.csv")

# process the whole batch of csv files to obtain df.total
df.total <- data.frame()
for (f in 1:length(file.list)) {
  
  # read one csv file
  df <- data.frame()
  df <- (read.csv(file.list[f]))
  
  # select columns
  df <- select(df, EIN, f1096cnt, fw2gcnt, wthldngrulescd, noemplyeesw3cnt, filerqrdrtnscd, unrelbusinccd, filedf990tcd, frgnacctcd, prohibtdtxshltrcd, prtynotifyorgcd, filedf8886tcd, solicitcntrbcd, exprstmntcd, providegoodscd, notfydnrvalcd, filedf8282cd, f8282cnt, fndsrcvdcd, premiumspaidcd, filedf8899cd, filedf1098ccd, excbushldngscd, s4966distribcd, distribtodonorcd, initiationfees, grsrcptspublicuse, grsincmembers, grsincother, filedlieuf1041cd, txexmptint, qualhlthplncd, qualhlthreqmntn, qualhlthonhnd, rcvdpdtngcd, filedf720cd, totreprtabled, totcomprelatede, totestcompf, noindiv100kcnt, nocontractor100kcnt, totcntrbgfts, prgmservcode2acd, totrev2acola, prgmservcode2bcd, totrev2bcola, prgmservcode2ccd, totrev2ccola, prgmservcode2dcd, totrev2dcola, prgmservcode2ecd, totrev2ecola, totrev2fcola, totprgmrevnue, invstmntinc, txexmptbndsproceeds, royaltsinc, grsrntsreal, grsrntsprsnl, rntlexpnsreal, rntlexpnsprsnl, rntlincreal, rntlincprsnl, netrntlinc, grsalesecur, grsalesothr, cstbasisecur, cstbasisothr, gnlsecur, gnlsothr, netgnls, grsincfndrsng, lessdirfndrsng, netincfndrsng, grsincgaming, lessdirgaming, netincgaming, grsalesinvent, lesscstofgoods, netincsales, miscrev11acd, miscrevtota, miscrev11bcd, miscrevtot11b, miscrev11ccd, miscrevtot11c, miscrevtot11d, miscrevtot11e, totrevenue, grntstogovt, grnsttoindiv, grntstofrgngovt, benifitsmembrs, compnsatncurrofcr, compnsatnandothr, othrsalwages, pensionplancontrb, othremplyeebenef, payrolltx, feesforsrvcmgmt, legalfees, accntingfees, feesforsrvclobby, profndraising, feesforsrvcinvstmgmt, feesforsrvcothr, advrtpromo, officexpns, infotech, royaltsexpns, occupancy, travel, travelofpublicoffcl, converconventmtng, interestamt, pymtoaffiliates, deprcatndepletn, insurance, othrexpnsa, othrexpnsb, othrexpnsc, othrexpnsd, othrexpnse, othrexpnsf, totfuncexpns, nonintcashend, svngstempinvend, pldgegrntrcvblend, accntsrcvblend, currfrmrcvblend, rcvbldisqualend, notesloansrcvblend, invntriesalesend, prepaidexpnsend, lndbldgsequipend, invstmntsend, invstmntsothrend, invstmntsprgmend, intangibleassetsend, othrassetsend, totassetsend, accntspayableend, grntspayableend, deferedrevnuend, txexmptbndsend, escrwaccntliabend, paybletoffcrsend, secrdmrtgsend, unsecurednotesend, othrliabend, totliabend, unrstrctnetasstsend, temprstrctnetasstsend, permrstrctnetasstsend, capitalstktrstend, paidinsurplusend, retainedearnend, totnetassetend, totnetliabastend, nonpfrea, totnooforgscnt, totsupport, gftgrntsrcvd170, txrevnuelevied170, srvcsval170, pubsuppsubtot170, exceeds2pct170, pubsupplesspct170, samepubsuppsubtot170, grsinc170, netincunreltd170, othrinc170, totsupp170, grsrcptsrelated170, totgftgrntrcvd509, grsrcptsadmissn509, grsrcptsactivities509, txrevnuelevied509, srvcsval509, pubsuppsubtot509, rcvdfrmdisqualsub509, exceeds1pct509, subtotpub509, pubsupplesub509, samepubsuppsubtot509, grsinc509, unreltxincls511tx509, subtotsuppinc509, netincunrelatd509, othrinc509, totsupp509)

  # add each file to the final result
  df.total <- rbind.data.frame(df.total, df)
}  

# write the result onto a csv file
setwd(paste0(work.path, "dump_files/"))
write.table(df.total, file = "form_990.csv", row.names = F, col.names = T)


########################
# ez forms 

setwd(paste0(work.path, "dataset/ez/"))
file.list <- list.files(pattern="*.csv")

# process the whole batch of csv files to obtain df.total
df.total <- data.frame()
for (f in 1:length(file.list)) {
  
  # read one csv file
  df <- data.frame()
  df <- (read.csv(file.list[f]))
  
  # select columns
  df <- select(df, EIN, FNDNCD, DEDUCTCD, EOSTATUS, tax_pd, FisYr, totcntrbs, prgmservrev, duesassesmnts, othrinvstinc, grsamtsalesastothr, basisalesexpnsothr, gnsaleofastothr, grsincgaming, grsrevnuefndrsng, direxpns, netincfndrsng, grsalesminusret, costgoodsold, grsprft, othrevnue, totrevnue, totexpns, totexcessyr, othrchgsnetassetfnd, networthend, totassetsend, totliabend, totnetassetsend, actvtynotprevrptcd, chngsinorgcd, unrelbusincd, filedf990tcd, contractioncd, politicalexpend, filedf1120polcd, loanstoofficerscd, loanstoofficers, initiationfee, grspublicrcpts, s4958excessbenefcd, prohibtdtxshltrcd, nonpfrea, totnooforgscnt, totsupport, gftgrntsrcvd170, txrevnuelevied170, srvcsval170, pubsuppsubtot170, exceeds2pct170, pubsupplesspct170, samepubsuppsubtot170, grsinc170, netincunreltd170, othrinc170, totsupp170, grsrcptsrelated170, totgftgrntrcvd509, grsrcptsadmissn509, grsrcptsactivities509, txrevnuelevied509, srvcsval509, pubsuppsubtot509, rcvdfrmdisqualsub509, exceeds1pct509, subtotpub509, pubsupplesub509, samepubsuppsubtot509, grsinc509, unreltxincls511tx509, subtotsuppinc509, netincunrelatd509, othrinc509, totsupp509)
  
  # add each file to the final result
  df.total <- rbind.data.frame(df.total, df)
}  

# write the result onto a csv file
setwd(paste0(work.path, "dump_files/"))
write.table(df.total, file = "form_EZ.csv", row.names = F, col.names = T)


########################
# pf forms 

setwd(paste0(work.path, "dataset/pf/"))
file.list <- list.files(pattern="*.csv")

# process the whole batch of csv files to obtain df.total
df.total <- data.frame()
for (f in 1:length(file.list)) {
  
  # read one csv file
  df <- data.frame()
  df <- (read.csv(file.list[f]))
  
  # select columns
  df <- select(df, EIN, FNDNCD, RULEDATE, ACCPER, DEDUCTCD, EOSTATUS, FRCD, tax_pd, FisYr, eostat, tax_yr, operatingcd, fairmrktvalamt, grscontrgifts, schedbind, intrstrvnue, dividndsamt, grsrents, grsslspramt, costsold, grsprofitbus, otherincamt, totrcptperbks, compofficers, pensplemplbenf, legalfeesamt, accountingfees, interestamt, depreciationamt, occupancyamt, travlconfmtngs, printingpubl, topradmnexpnsa, contrpdpbks, totexpnspbks, excessrcpts, totrcptnetinc, topradmnexpnsb, totexpnsnetinc, netinvstinc, trcptadjnetinc, totexpnsadjnet, adjnetinc, topradmnexpnsd, totexpnsexempt, othrcashamt, invstgovtoblig, invstcorpstk, invstcorpbnd, totinvstsec, mrtgloans, othrinvstend, othrassetseoy, totassetsend, mrtgnotespay, othrliabltseoy, totliabend, tfundnworth, fairmrktvaleoy, totexcapgnls, totexcapgn, totexcapls, invstexcisetx, sec4940notxcd, sec4940redtxcd, sect511tx, subtitleatx, totaxpyr, esttaxcr, txwithldsrc, txpaidf2758, erronbkupwthld, estpnlty, taxdue, overpay, crelamt, infleg, actnotpr, chgnprvrptcd, filedf990tcd, contractncd, furnishcpycd, claimstatcd, cntrbtrstxyrcd, acqdrindrintcd, orgcmplypubcd, filedlf1041ind, propexchcd, brwlndmnycd, furngoodscd, paidcmpncd, transfercd, agremkpaycd, exceptactsind, prioractvcd, undistrinccd, applyprovind, dirindirintcd, excesshldcd, invstjexmptcd, prevjexmptcd, propgndacd, ipubelectcd, grntindivcd, nchrtygrntcd, nreligiouscd, excptransind, rfprsnlbnftind, pyprsnlbnftind, tfairmrktunuse, valncharitassets, cmpmininvstret, distribamt, undistribincyr, adjnetinccola, adjnetinccolb, adjnetinccolc, adjnetinccold, adjnetinctot, qlfydistriba, qlfydistribb, qlfydistribc, qlfydistribd, qlfydistribtot, valassetscola, valassetscolb, valassetscolc, valassetscold, valassetstot, qlfyasseta, qlfyassetb, qlfyassetc, qlfyassetd, qlfyassettot, endwmntscola, endwmntscolb, endwmntscolc, endwmntscold, endwmntstot, totsuprtcola, totsuprtcolb, totsuprtcolc, totsuprtcold, totsuprttot, pubsuprtcola, pubsuprtcolb, pubsuprtcolc, pubsuprtcold, pubsuprttot, grsinvstinca, grsinvstincb, grsinvstincc, grsinvstincd, grsinvstinctot, grntapprvfut, progsrvcacold, progsrvcacole, progsrvcbcold, progsrvcbcole, progsrvcccold, progsrvcccole, progsrvcdcold, progsrvcdcole, progsrvcecold, progsrvcecole, progsrvcfcold, progsrvcfcole, progsrvcgcold, progsrvcgcole, membershpduesd, membershpduese, intonsvngsd, intonsvngse, dvdndsintd, dvdndsinte, trnsfrcashcd, trnsothasstscd, salesasstscd, prchsasstscd, rentlsfacltscd, reimbrsmntscd, loansguarcd, perfservicescd, sharngasstscd)
  
  # add each file to the final result
  df.total <- rbind.data.frame(df.total, df)
}  

# write the result onto a csv file
setwd(paste0(work.path, "dump_files/"))
write.table(df.total, file = "form_PF.csv", row.names = F, col.names = T)


########################
# basic data table

df.total <- data.frame()

for (d in c("pf/", "990/", "ez/")) {
  setwd(paste0(work.path, "dataset/", d))
  file.list <- list.files(pattern="*.csv")
  
  # process the whole batch of csv files to obtain df.total
  
  for (f in 1:length(file.list)) {
    
      # read one csv file
      df <- data.frame()
      df <- (read.csv(file.list[f]))
      
      # select columns
      df <- select(df, EIN, NAME, CITY, STATE, SEC_NAME, ADDRESS, ZIP, NteeCat12, SUBSECCD, ORGCD, AFCD, CLASSCD, subcd)
      
      # add each file to the final result
      df.total <- rbind.data.frame(df.total, df)
  }
}

df.total["ZIP"] <- substr(df.total[1:nrow(df.total), "ZIP"], 1, 5)  # eliminate sub-zip codes

# buid zip-city-state dictionary and write onto a csv file
zip.dict <- select(df.total, ZIP, CITY, STATE)
zip.dict <- distinct(zip.dict)

setwd(paste0(work.path, "dump_files/"))
write.table(zip.dict, file = "zip_dict.csv", row.names = F, col.names = T)

# remove redundant info (city+state) from de basic data
df.total <- select(df.total, EIN, NAME, SEC_NAME, ADDRESS, ZIP, NteeCat12, SUBSECCD, ORGCD, AFCD, CLASSCD, subcd)

# write the result onto a csv file
setwd(paste0(work.path, "dump_files/"))
write.table(df.total, file = "basic_data.csv", row.names = F, col.names = T)

# EOC
# BGSE DATA SCIENCE MASTER PROGRAM 2016-17
# COMPUTING PROJECT - 1st TERM
# SORT DATA & KICK ASSES - K.W. L.R. A.B.

# SELECTION OF WORKING INPUT DATA

library(dplyr)

# work.path = "/Users/Laura/Desktop/2013"
work.path <- "C:/ALFONSO/WORK/GSE/14D003/use/"
setwd(work.path)
temp = list.files(pattern="*.csv")

file.list <- list.files(pattern="*.csv")




# careful this loads ALL data into memory -it takes minutes
for (i in 1:length(temp)) assign(temp[i], read.csv(temp[i]))

# filter out non 501-c3 organisations 
z <- rep(0,length(temp))
for (i in 1:length(temp)) z[i] <- c(temp[i], count(filter(read.csv(temp[i]), SUBSECCD == 3)))

# relation file - number of non 501-c3
zz <- data.frame(csv_file = character(0), no_c3= integer(0))
for (i in 1:length(temp)) zz <- rbind(csv_file = temp[1:211], no_c3 = count(filter(read.csv(temp[1:211]), SUBSECCD != 3)))

count <- 0
for (i in 1:length(temp)) {
  output <- c(z[i], temp[i])
  if (z[i] != 0)  {
    count <- count + 1
    print(t(output))
  }
}


for (f in 1:length(file.list)) { 

}

BASIC.cols <- c('EIN', 'NAME', 'ZIP', 'noemplyeesw3cnt', 'ORGCD')

CLASSIFICATION.cols <- c('ntmaj5', ' ntmaj10', 'ntmaj12', 'LEVEL1', 'MAJGRPB')

KEY_PERSONEL.cols <- c('totreprtabled', 'totcomprelatede', 'totestcompf', 'noindiv100kcnt', 'nocontractor100kcnt')

REVENUE.cols <- c('totcntrbgfts', 'prgmservcode2acd', 'totrev2acola', 'prgmservcode2bcd', 'totrev2bcola', 'prgmservcode2ccd', 'totrev2ccola', 'prgmservcode2dcd', 'totrev2dcola', 'prgmservcode2ecd', 'totrev2ecola', 'totrev2fcola', '
                  totprgmrevnue', 'invstmntinc', 'txexmptbndsproceeds', 'royaltsinc', 'grsrntsreal', 'grsrntsprsnl', 'rntlexpnsreal', 'rntlexpnsprsnl', 'rntlincreal', 'rntlincprsnl', 'netrntlinc', '
                  grsalesecur', 'grsalesothr', 'cstbasisecur', 'cstbasisothr', 'gnlsecur', 'gnlsothr', 'netgnls', 'grsincfndrsng', 'lessdirfndrsng', 'netincfndrsng', 'grsincgaming', '
                  lessdirgaming', 'netincgaming', 'grsalesinvent', 'lesscstofgoods', 'netincsales', 'miscrev11acd', 'miscrevtota', 'miscrev11bcd', 'miscrevtot11b', 'miscrev11ccd', '
                  miscrevtot11c', 'miscrevtot11dmiscrevtot11e', 'totrevenue')

EXPENSES.cols <- c('grntstogovt', 'grnsttoindiv', 'grntstofrgngovt', 'benifitsmembrs', 'compnsatncurrofcr', 'compnsatnandothr', '
                   othrsalwages', 'pensionplancontrb', 'othremplyeebenef', 'payrolltx', 'feesforsrvcmgmt', 'legalfees', 'accntingfees', 'feesforsrvclobby', 'profndraising', '
                   feesforsrvcinvstmgmt', 'feesforsrvcothr', 'advrtpromo', 'officexpns', 'infotech', 'royaltsexpns', 'occupancy', 'travel', 'travelofpublicoffcl', 'converconventmtng', '
                   interestamt', 'pymtoaffiliates', 'deprcatndepletn', 'insurance', 'othrexpnsa', 'othrexpnsb', 'othrexpnsc', 'othrexpnsd', 'othrexpnse', 'othrexpnsf', 'totfuncexpns')


BALANCE.cols <- c('nonintcashend', 'svngstempinvend', 'pldgegrntrcvblend', 'accntsrcvblend', 'currfrmrcvblend', 'rcvbldisqualend', 'notesloansrcvblend', '
                  invntriesalesend', 'prepaidexpnsend', 'lndbldgsequipend', 'invstmntsend', 'invstmntsothrend', 'invstmntsprgmend', 'intangibleassetsend', 'othrassetsend', 'totassetsend', '
                  accntspayableend', 'grntspayableend', 'deferedrevnuend', 'txexmptbndcd', 'txexmptbndsend', 'escrwaccntliabend', 'paybletoffcrsend', 'secrdmrtgsend', 'unsecurednotesend', '
                  othrliabend', 'totliabend', 'unrstrctnetasstsend', 'temprstrctnetasstsend', 'permrstrctnetasstsend', 'capitalstktrstend', 'paidinsurplusend', 'retainedearnend', '
                  totnetassetend', 'totnetliabastend')


  df <- (read.csv(paste0(work.path, file.list[f])))
    
  # BASIC <- select(df, as.numeric_version(BASIC.cols))
  # BASIC["ZIP"] <- substr(BASIC[1:nrow(BASIC), "ZIP"], 1, 5) # eliminate sub-zip codes
  # 
  # CLASSIFICATION <- select(df, as.name(CLASSIFICATION.cols))
  # KEY_PERSONEL <- select(df, as.name(KEY_PERSONEL.cols))
  # REVENUE <- select(df, as.name(REVENUE.cols))
  # EXPENSES <- select(df, as.name(EXPENSES.cols))
  # BALANCE <- select(df, as.name(BALANCE.cols))
  # 
  # 
  # BASIC <- select(df,EIN,NAME,CITY,STATE,ZIP,noemplyeesw3cnt,ORGCD)
  # 
  # CLASSIFICATION <- select(df, ntmaj5, ntmaj10,ntmaj12,LEVEL1,MAJGRPB)
  # 
  # KEY_PERSONEL <- select(df,totreprtabled,totcomprelatede,totestcompf,noindiv100kcnt,nocontractor100kcnt)
  
  BASIC <- select(df, 'EIN', 'NAME', 'ZIP', 'noemplyeesw3cnt', 'ORGCD')
  BASIC["ZIP"] <- substr(BASIC[1:nrow(BASIC), "ZIP"], 1, 5) # eliminate sub-zip codes
  
  
  REVENUE <- select(df, totcntrbgfts, prgmservcode2acd, totrev2acola, prgmservcode2bcd, totrev2bcola, prgmservcode2ccd, totrev2ccola, prgmservcode2dcd, totrev2dcola, prgmservcode2ecd, totrev2ecola, totrev2fcola, 
                    totprgmrevnue, invstmntinc, txexmptbndsproceeds, royaltsinc, grsrntsreal, grsrntsprsnl, rntlexpnsreal, rntlexpnsprsnl, rntlincreal, rntlincprsnl, netrntlinc, 
                    grsalesecur, grsalesothr, cstbasisecur, cstbasisothr, gnlsecur, gnlsothr, netgnls, grsincfndrsng, lessdirfndrsng, netincfndrsng, grsincgaming, 
                    lessdirgaming, netincgaming, grsalesinvent, lesscstofgoods, netincsales, miscrev11acd, miscrevtota, miscrev11bcd, miscrevtot11b, miscrev11ccd, 
                    miscrevtot11c, miscrevtot11dmiscrevtot11e, totrevenue)
  
  EXPENSES <- select(df, grntstogovt, grnsttoindiv, grntstofrgngovt, benifitsmembrs, compnsatncurrofcr, compnsatnandothr, 
                     othrsalwages, pensionplancontrb, othremplyeebenef, payrolltx, feesforsrvcmgmt, legalfees, accntingfees, feesforsrvclobby, profndraising, 
                     feesforsrvcinvstmgmt, feesforsrvcothr, advrtpromo, officexpns, infotech, royaltsexpns, occupancy, travel, travelofpublicoffcl, converconventmtng, 
                     interestamt, pymtoaffiliates, deprcatndepletn, insurance, othrexpnsa, othrexpnsb, othrexpnsc, othrexpnsd, othrexpnse, othrexpnsf, totfuncexpns)
  
  
  BALANCE <- select(df, nonintcashend, svngstempinvend, pldgegrntrcvblend, accntsrcvblend, currfrmrcvblend, rcvbldisqualend, notesloansrcvblend, 
                    invntriesalesend, prepaidexpnsend, lndbldgsequipend, invstmntsend, invstmntsothrend, invstmntsprgmend, intangibleassetsend, othrassetsend, totassetsend, 
                    accntspayableend, grntspayableend, deferedrevnuend, txexmptbndcd, txexmptbndsend, escrwaccntliabend, paybletoffcrsend, secrdmrtgsend, unsecurednotesend, 
                    othrliabend, totliabend, unrstrctnetasstsend, temprstrctnetasstsend, permrstrctnetasstsend, capitalstktrstend, paidinsurplusend, retainedearnend, 
                    totnetassetend, totnetliabastend)


colnames(irsExtractFromNccs_2013_990_PF_AK.csv)
ncol(irsExtractFromNccs_2013_990_OT_AK.csv)
print(count)
print(length(temp))
files_2013 <- length(temp)-count
print(files_2013)
print(temp)

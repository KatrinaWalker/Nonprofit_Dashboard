# BGSE DATA SCIENCE MASTER PROGRAM 2016-17
# COMPUTING PROJECT - 1st TERM
# SORT DATA & KICK ASSES - K.W. L.R. A.B.

# SELECTION OF WORKING INPUT DATA

library(dplyr)
library(RMySQL)
library(stringr)

# create a connection with the DB
db.npo <- dbConnect(MySQL(), user='alfonso', password = '1317', dbname = 'db_npo', host = '127.0.0.1')
on.exit(dbDisconnect(db.npo))

# work.path = "/Users/Laura/Desktop/2013"

work.path <- "C:/ALFONSO/WORK/GSE/14D003/use/990/"
setwd(work.path)

file.list <- list.files(pattern="*.csv")
short.names <- paste0('form_', str_sub(file.list, -13, -4))

# process the whole batch of csv files to obtain df.total

df.total <- data.frame()

for (f in 1:length(file.list)) {
  
  # read one csv file
  df <- (read.csv(paste0(work.path, file.list[f])))
  
  # select columns in bathces
  BASIC <- select(df, EIN, NAME, ZIP, noemplyeesw3cnt, ORGCD)
  BASIC["ZIP"] <- substr(BASIC[1:nrow(BASIC), "ZIP"], 1, 5) # eliminate sub-zip codes
  REVENUE <- select(df, totcntrbgfts, prgmservcode2acd, totrev2acola, prgmservcode2bcd, totrev2bcola, prgmservcode2ccd, totrev2ccola, prgmservcode2dcd, totrev2dcola, prgmservcode2ecd, totrev2ecola, totrev2fcola, totprgmrevnue, invstmntinc, txexmptbndsproceeds, royaltsinc, grsrntsreal, grsrntsprsnl, rntlexpnsreal, rntlexpnsprsnl, rntlincreal, rntlincprsnl, netrntlinc, grsalesecur, grsalesothr, cstbasisecur, cstbasisothr, gnlsecur, gnlsothr, netgnls, grsincfndrsng, lessdirfndrsng, netincfndrsng, grsincgaming, lessdirgaming, netincgaming, grsalesinvent, lesscstofgoods, netincsales, miscrev11acd, miscrevtota, miscrev11bcd, miscrevtot11b, miscrev11ccd, miscrevtot11c, miscrevtot11d, miscrevtot11e, totrevenue)
  EXPENSES <- select(df, grntstogovt, grnsttoindiv, grntstofrgngovt, benifitsmembrs, compnsatncurrofcr, compnsatnandothr, othrsalwages, pensionplancontrb, othremplyeebenef, payrolltx, feesforsrvcmgmt, legalfees, accntingfees, feesforsrvclobby, profndraising, feesforsrvcinvstmgmt, feesforsrvcothr, advrtpromo, officexpns, infotech, royaltsexpns, occupancy, travel, travelofpublicoffcl, converconventmtng, interestamt, pymtoaffiliates, deprcatndepletn, insurance, othrexpnsa, othrexpnsb, othrexpnsc, othrexpnsd, othrexpnse, othrexpnsf, totfuncexpns)
  BALANCE <- select(df, nonintcashend, svngstempinvend, pldgegrntrcvblend, accntsrcvblend, currfrmrcvblend, rcvbldisqualend, notesloansrcvblend, invntriesalesend, prepaidexpnsend, lndbldgsequipend, invstmntsend, invstmntsothrend, invstmntsprgmend, intangibleassetsend, othrassetsend, totassetsend, accntspayableend, grntspayableend, deferedrevnuend, txexmptbndcd, txexmptbndsend, escrwaccntliabend, paybletoffcrsend, secrdmrtgsend, unsecurednotesend, othrliabend, totliabend, unrstrctnetasstsend, temprstrctnetasstsend, permrstrctnetasstsend, capitalstktrstend, paidinsurplusend, retainedearnend, totnetassetend, totnetliabastend)

  # prepare a df combining all batches
  df.wide <- data.frame()
  df.wide <- cbind.data.frame(BASIC, REVENUE, EXPENSES, BALANCE)
  #### print(c(file.list[f], ncol(dfw)))
  
  # add each file to the final result
  df.total <- rbind.data.frame(df.total, df.wide)
}  

# write the result onto a csv file
setwd("C:/ALFONSO/WORK/GSE/14D003/use/")
write.table(df.total, file = "form990_total.csv", row.names = F, col.names = T)



  # create a temp table in the DB with the csv selected data
  dbSendQuery(db.npo, 'DROP TABLE IF EXISTS temp')
  dbWriteTable(db.npo, name = 'temp', value =  dfw)
  # remove the first column
  dbSendQuery(db.npo, 'ALTER TABLE temp DROP COLUMN row_names')
  # row-union on the main table
  dbSendQuery(db.npo, 'SELECT * FROM main UNION SELECT * FROM temp')
  # discard the temp table
  dbSendQuery(db.npo, 'DROP TABLE temp')

  
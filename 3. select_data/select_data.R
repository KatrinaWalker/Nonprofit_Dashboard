path = "/Users/Laura/Desktop/2013"
temp = list.files(pattern="*.csv")
length(temp)

z <- rep(0,length(temp))
for (i in 1:length(temp)) assign(temp[i], read.csv(temp[i]))
for (i in 1:length(temp)) z[i] <- count(filter(read.csv(temp[i]), SUBSECCD == 3)) 

count <- 0
for (i in 1:length(temp)) {
  output <- c(z[i], temp[i])
  if (z[i] != 0)  {
    count <- count + 1
    print(t(output))
  }
}

BASIC <- select(irsExtractFromNccs_2013_990_OT_AK.csv,EIN,NAME,CITY,STATE,ZIP,noemplyeesw3cnt,ORGCD)

CLASSIFICATION <- select(irsExtractFromNccs_2013_990_OT_AK.csv, ntmaj5, ntmaj10,ntmaj12,LEVEL1,MAJGRPB)

KEY_PERSONEL <- select(irsExtractFromNccs_2013_990_OT_AK.csv,totreprtabled,totcomprelatede,totestcompf,noindiv100kcnt,nocontractor100kcnt)

REVENUE <- select(irsExtractFromNccs_2013_990_OT_AK.csv,totcntrbgfts,prgmservcode2acd,totrev2acola,prgmservcode2bcd,totrev2bcola,prgmservcode2ccd,totrev2ccola,prgmservcode2dcd,totrev2dcola,prgmservcode2ecd,totrev2ecola,totrev2fcola,
                  totprgmrevnue,invstmntinc,txexmptbndsproceeds,royaltsinc,grsrntsreal,grsrntsprsnl,rntlexpnsreal,rntlexpnsprsnl,rntlincreal,rntlincprsnl,netrntlinc,
                  grsalesecur,grsalesothr,cstbasisecur,cstbasisothr,gnlsecur,gnlsothr,netgnls,grsincfndrsng,lessdirfndrsng,netincfndrsng,grsincgaming,
                  lessdirgaming,netincgaming,grsalesinvent,lesscstofgoods,netincsales,miscrev11acd,miscrevtota,miscrev11bcd,miscrevtot11b,miscrev11ccd,
                  miscrevtot11c,miscrevtot11dmiscrevtot11e,totrevenue)

EXPENSES <- select(irsExtractFromNccs_2013_990_OT_AK.csv,grntstogovt,grnsttoindiv,grntstofrgngovt,benifitsmembrs,compnsatncurrofcr,compnsatnandothr,
                   othrsalwages,pensionplancontrb,othremplyeebenef,payrolltx,feesforsrvcmgmt,legalfees,accntingfees,feesforsrvclobby,profndraising,
                   feesforsrvcinvstmgmt,feesforsrvcothr,advrtpromo,officexpns,infotech,royaltsexpns,occupancy,travel,travelofpublicoffcl,converconventmtng,
                   interestamt,pymtoaffiliates,deprcatndepletn,insurance,othrexpnsa,othrexpnsb,othrexpnsc,othrexpnsd,othrexpnse,othrexpnsf,totfuncexpns)


BALANCE <- select(irsExtractFromNccs_2013_990_OT_AK.csv,nonintcashend,svngstempinvend,pldgegrntrcvblend,accntsrcvblend,currfrmrcvblend,rcvbldisqualend,notesloansrcvblend,
                  invntriesalesend,prepaidexpnsend,lndbldgsequipend,invstmntsend,invstmntsothrend,invstmntsprgmend,intangibleassetsend,othrassetsend,totassetsend,
                  accntspayableend,grntspayableend,deferedrevnuend,txexmptbndcd,txexmptbndsend,escrwaccntliabend,paybletoffcrsend,secrdmrtgsend,unsecurednotesend,
                  othrliabend,totliabend,unrstrctnetasstsend,temprstrctnetasstsend,permrstrctnetasstsend,capitalstktrstend,paidinsurplusend,retainedearnend,
                  totnetassetend,totnetliabastend)


colnames(irsExtractFromNccs_2013_990_OT_AK.csv)
ncol(irsExtractFromNccs_2013_990_OT_AK.csv)
print(count)
print(length(temp))
files_2013 <- length(temp)-count
print(files_2013)
print(temp)

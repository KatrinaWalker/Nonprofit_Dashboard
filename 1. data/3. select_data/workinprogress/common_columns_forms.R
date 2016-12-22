setwd("~/Desktop/")
library(dplyr)
length(intersect(colnames(irsExtractFromNccs_2013_990_PC_CA.csv),colnames(irsExtractFromNccs_2013_ez_PC_CA.csv)))
length(intersect(colnames(irsExtractFromNccs_2013_990_PC_CA.csv),colnames(irsExtractFromNccs_2013_pf_PC_CA.csv)))
length(intersect(colnames(irsExtractFromNccs_2013_pf_PC_CA.csv),colnames(irsExtractFromNccs_2013_ez_PC_CA.csv)))

#59 common columns for 990 and ez forms
intersect(colnames(irsExtractFromNccs_2013_990_PC_CA.csv),colnames(irsExtractFromNccs_2013_ez_PC_CA.csv))
# [1] "NAME"                  "SEC_NAME"              "ADDRESS"               "CITY"                  "STATE"                
#[6] "ZIP"                   "NteeCat12"             "SUBSECCD"              "FNDNCD"                "RULEDATE"             
#[11] "ORGCD"                 "ACCPER"                "AFCD"                  "CLASSCD"               "DEDUCTCD"             
#[16] "EOSTATUS"              "FRCD"                  "GEN"                   "tax_pd"                "FisYr"                
#[21] "subcd"                 "filedf990tcd"          "prohibtdtxshltrcd"     "netincfndrsng"         "grsincgaming"         
#[26] "totassetsend"          "totliabend"            "nonpfrea"              "totnooforgscnt"        "totsupport"           
#[31] "gftgrntsrcvd170"       "txrevnuelevied170"     "srvcsval170"           "pubsuppsubtot170"      "exceeds2pct170"       
#[36] "pubsupplesspct170"     "samepubsuppsubtot170"  "grsinc170"             "netincunreltd170"      "othrinc170"           
#[41] "totsupp170"            "grsrcptsrelated170"    "totgftgrntrcvd509"     "grsrcptsadmissn509"    "grsrcptsactivities509"
#[46] "txrevnuelevied509"     "srvcsval509"           "pubsuppsubtot509"      "rcvdfrmdisqualsub509"  "exceeds1pct509"       
#[51] "subtotpub509"          "pubsupplesub509"       "samepubsuppsubtot509"  "grsinc509"             "unreltxincls511tx509" 
#[56] "subtotsuppinc509"      "netincunrelatd509"     "othrinc509"            "totsupp509"      


#25 common columns for 990 and pf forms
intersect(colnames(irsExtractFromNccs_2013_990_PC_CA.csv),colnames(irsExtractFromNccs_2013_pf_PC_CA.csv))
# [1] "EIN"          "NAME"         "SEC_NAME"     "ADDRESS"      "CITY"         "STATE"        "ZIP"          "NteeCat12"   
#[9] "SUBSECCD"     "FNDNCD"       "RULEDATE"     "ORGCD"        "ACCPER"       "AFCD"         "CLASSCD"      "DEDUCTCD"    
#[17] "EOSTATUS"     "FRCD"         "tax_pd"       "FisYr"        "subcd"        "filedf990tcd" "interestamt"  "totassetsend"
#[25] "totliabend"  

#23 common columns for ez and pf forms
intersect(colnames(irsExtractFromNccs_2013_pf_PC_CA.csv),colnames(irsExtractFromNccs_2013_ez_PC_CA.csv))
#[1] "NAME"         "SEC_NAME"     "ADDRESS"      "CITY"         "STATE"        "ZIP"          "NteeCat12"    "SUBSECCD"    
#[9] "FNDNCD"       "RULEDATE"     "ORGCD"        "ACCPER"       "AFCD"         "CLASSCD"      "DEDUCTCD"     "EOSTATUS"    
#[17] "FRCD"         "tax_pd"       "FisYr"        "subcd"        "totassetsend" "totliabend"   "filedf990tcd"


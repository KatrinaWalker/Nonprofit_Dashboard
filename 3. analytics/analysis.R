# ----------------------------------------------------------------------
# BGSE Data Science 2016/17
# 14D003-14D004 Computing Project 
# Group 2
# ----------------------------------------------------------------------
# Libraries
# ----------------------------------------------------------------------
library(glmnet)
library(dplyr)
library(RMySQL)

# ----------------------------------------------------------------------
# Connect to mySQL database

dbConn = dbConnect(MySQL(), 
                   host='ec2-52-210-252-110.eu-west-1.compute.amazonaws.com',
                   user="gseuser", password="gsepass", 
                   dbname='db_npo')

# support UTF-8 characters
invisible(dbGetQuery(dbConn, "set names utf8"))

ez <- dbGetQuery(dbConn, "SELECT * FROM  f990_ez")
pc <- dbGetQuery(dbConn, "SELECT * FROM f990_pc")
basic <- dbGetQuery(dbConn, "SELECT * FROM basic_data")
revenue <- dbGetQuery(dbConn, "SELECT * FROM mv_revenue")
expenses <- dbGetQuery(dbConn, "SELECT * FROM mv_expenses ")


colnames(ez)[22] <- "totrevenue"

# ----------------------------------------------------------------------
# Descriptive Analytics
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# 1. Basic Data

#total number NPO's
total_npo <- nrow(pc)+nrow(ez)
total_npo
rev_ez <- sum(as.numeric(ez$totrevenue))
rev_pc <- sum(as.numeric(pc$totrevenue))
total_revenue <- rev_ez+rev_pc
sum(as.numeric(revenue$total_revenue))

perc_rev_ez <- rev_ez*100/total_revenue
perc_rev_pc <- rev_pc*100/total_revenue

# total expenses
exp_ez <- sum(as.numeric(ez$totexpns))
exp_pc <- sum(as.numeric(pc$totfuncexpns))
total_expens <- exp_ez+exp_pc
perc_exp_ez <- exp_ez*100/total_expens
perc_exp_pc <- exp_pc*100/total_expens

# total assets
asset_ez <- sum(as.numeric(ez$totassetsend))
asset_pc <- sum(as.numeric(pc$totassetsend))
total_asset <- asset_ez+asset_pc
perc_asset_ez <- asset_ez*100/total_asset
perc_asset_pc <- asset_pc*100/total_asset


# ----------------------------------------------------------------------
# 2. Types of NPOs

types= table(basic$NteeCat12)
percen_types <- (types/sum(types))*100

# ----------------------------------------------------------------------
#3. Sources of Revenue & Expenses for small, medium and large revenue NPOs

###3.1 Revenue Sources
rev <- revenue
rev[,3:8] <- 0
rev[,-1:-2] <- (revenue$total_revenue*revenue[,-1:-2])/100

small.revenue <- subset(rev,rev$total_revenue  < 1e+06 &  rev$total_revenue>0)
medium.revenue <- subset(rev,rev$total_revenue>1e+06 & rev$total_revenue<1e+08 )
large.revenue <- subset(rev,rev$total_revenue > 1e+08 & rev$total_revenue < max(rev$total_revenue))

##small
tot_s_rev <- sum(small.revenue$total_revenue)
small_rev_distr <- sum(small.revenue$contributions)+sum(small.revenue$program_services)+sum(small.revenue$investment)+sum(small.revenue$fundraising)+sum(small.revenue$other_rev)

perc_s_contr <- 100*sum(small.revenue$contributions)/tot_s_rev 
perc_s_services <- 100*sum(small.revenue$program_services)/tot_s_rev 
perc_s_investment <- 100*sum(small.revenue$investment)/tot_s_rev 
perc_s_fundraising <- 100*sum(small.revenue$fundraising)/tot_s_rev 
perc_s_other <- 100*sum(small.revenue$other_rev)/tot_s_rev 

##medium
tot_m_rev <- sum(medium.revenue$total_revenue)
med_rev_distr <- sum(medium.revenue$contributions)+sum(medium.revenue$program_services)+sum(medium.revenue$investment)+sum(medium.revenue$fundraising)+sum(medium.revenue$other_rev)

perc_m_contr <- 100*sum(medium.revenue$contributions)/tot_m_rev 
perc_m_services <- 100*sum(medium.revenue$program_services)/tot_m_rev 
perc_m_investment <- 100*sum(medium.revenue$investment)/tot_m_rev 
perc_m_fundraising <- 100*sum(medium.revenue$fundraising)/tot_m_rev 
perc_m_other <- 100*sum(medium.revenue$other_rev)/tot_m_rev 

##large 
tot_l_rev <- sum(large.revenue$total_revenue)

perc_l_contr <- 100*sum(large.revenue$contributions)/tot_l_rev 
perc_l_services <- 100*sum(large.revenue$program_services)/tot_l_rev 
perc_l_investment <- 100*sum(large.revenue$investment)/tot_l_rev 
perc_l_fundraising <- 100*sum(large.revenue$fundraising)/tot_l_rev 
perc_l_other <- 100*sum(large.revenue$other_rev)/tot_l_rev 


###3.2 Expenses Sources
exp <- expenses
exp[,3:11] <- 0
exp[,-1:-2] <- (expenses$total_expenses*expenses[,-1:-2])/100
exp_rev <- merge( rev, exp,by="EIN")

small.revenue <- subset(exp_rev,exp_rev$total_revenue  < 1e+06 &  exp_rev$total_revenue>0)
medium.revenue <- subset(exp_rev,exp_rev$total_revenue>1e+06 & exp_rev$total_revenue<1e+08 )
large.revenue <- subset(exp_rev,exp_rev$total_revenue > 1e+08 & exp_rev$total_revenue < max(exp_rev$total_revenue))

##small
tot_s_exp <- sum(small.revenue$total_expenses)
perc_s_grants <- 100*sum(small.revenue$grants)/tot_s_exp
perc_s_employees <- 100*sum(small.revenue$employees)/tot_s_exp
perc_s_serv_fees <- 100*sum(small.revenue$serv_fees)/tot_s_exp 
perc_s_IT <- 100*sum(small.revenue$IT)/tot_s_exp 
perc_s_ads <- 100*sum(small.revenue$ads)/tot_s_exp 
perc_s_run_office <- 100*sum(small.revenue$run_office)/tot_s_exp
perc_s_finance <- 100*sum(small.revenue$finance)/tot_s_exp
perc_s_other_exp <- 100*sum(small.revenue$other_exp)/tot_s_exp

##medium
tot_m_exp <- sum(medium.revenue$total_expenses)
perc_m_grants <- 100*sum(medium.revenue$grants)/tot_m_exp
perc_m_employees <- 100*sum(medium.revenue$employees)/tot_m_exp
perc_m_serv_fees <- 100*sum(medium.revenue$serv_fees)/tot_m_exp 
perc_m_IT <- 100*sum(medium.revenue$IT)/tot_m_exp 
perc_m_ads <- 100*sum(medium.revenue$ads)/tot_m_exp 
perc_m_run_office <- 100*sum(medium.revenue$run_office)/tot_m_exp
perc_m_finance <- 100*sum(medium.revenue$finance)/tot_m_exp
perc_m_other_exp <- 100*sum(medium.revenue$other_exp)/tot_m_exp

##large 
tot_l_exp <- sum(large.revenue$total_expenses)
perc_l_grants <- 100*sum(large.revenue$grants)/tot_l_exp
perc_l_employees <- 100*sum(large.revenue$employees)/tot_l_exp
perc_l_serv_fees <- 100*sum(large.revenue$serv_fees)/tot_l_exp 
perc_l_IT <- 100*sum(large.revenue$IT)/tot_l_exp 
perc_l_ads <- 100*sum(large.revenue$ads)/tot_l_exp 
perc_l_run_office <- 100*sum(large.revenue$run_office)/tot_l_exp
perc_l_finance <- 100*sum(large.revenue$finance)/tot_l_exp
perc_l_other_exp <- 100*sum(large.revenue$other_exp)/tot_l_exp


# ----------------------------------------------------------------------
#4. Total revenue and expenses per each NPO type
list <- names(types)
ez_tab <- matrix(data=NA, length(list),2)
count <- 1
for (i in list) {
  ez_subset <- subset(ez, ez$NteeCat12==i)
  ez_tab[count,1] <- sum(as.numeric(ez_subset$totexpns))
  ez_tab[count,2] <- sum(as.numeric(ez_subset$totrevenue))
  count <- count +1
}
ez_tab
pc_tab <- matrix(data=NA, length(list),2)
count <- 1
for (i in list) {
  pc_subset <- subset(pc, pc$NteeCat12==i)
  pc_tab[count,1] <- sum(as.numeric(pc_subset$totfuncexpns))
  pc_tab[count,2] <- sum(as.numeric(pc_subset$totrevenue))
  count <- count +1
}
pc_tab
class(ez_tab) <- "numeric"
class(pc_tab) <- "numeric"

tot_tab <- matrix(data=NA, length(list),4)
tot_tab[,2:3] <- ez_tab+ pc_tab

count <- 1
class(tot_tab) <- "numeric"
tot_tab[,4] <- tot_tab[,3] - tot_tab[,2]
for (i in list) {
  tot_tab[count,1] <-i 
  count <- count+1
}
tot_tab
class(tot_tab) <- "numeric"
#% expenses
t_exp <- sum(tot_tab[,2])
t_rev <-sum(tot_tab[,3])
perc_table <- matrix(data=NA, length(list),4)
perc_table[,2] <- 100*tot_tab[,2]/t_exp
perc_table[,3] <- 100*tot_tab[,3]/t_rev
perc_table[,4] <- 100*tot_tab[,3]/t_rev - 100*tot_tab[,2]/t_exp
count <- 1
for (i in list) {
  perc_table[count,1] <-i
  count <- count+1
}
colnames(perc_table)[4] <- "difference rev-expenses in %"
perc_table

# ----------------------------------------------------------------------
#5. Geographic Spread

states_ez <- merge(ez, basic, by="EIN")
states_pc <- merge(pc, basic, by="EIN")
state <- unique(states_ez$STATE)
states_tab <- matrix(data=NA, length(state),3)
count <- 1
for (i in state) {
  ez_states_subset <- subset(states_ez, states_ez$STATE==i)
  pc_states_subset <- subset(states_pc, states_pc$STATE==i)
  states_tab[count,1] <- i
  states_tab[count,2] <- nrow(ez_states_subset)+nrow(pc_states_subset)
  count <- count +1
}
total <- sum(as.numeric(states_tab[,2]))
states_tab[,3] <- 100*as.numeric(states_tab[,2])/total
states_tab

# ----------------------------------------------------------------------
#6. Fundraising of NPOs (pc form)

pc_tab <- matrix(data=NA, length(list),5)
count <- 1
for (i in list) {
  pc_subset <- subset(pc, pc$NteeCat12==i)
  pc_tab[count,1] <- sum(as.numeric(pc_subset$lessdirfndrsng))
  pc_tab[count,2] <- sum(as.numeric(pc_subset$netincfndrsng))
  pc_tab[count,3] <- sum(as.numeric(pc_subset$lessdirfndrsng))/sum(as.numeric(pc_subset$netincfndrsng))
  pc_tab[count,4] <- sum(as.numeric(pc_subset$netincfndrsng)) + sum(as.numeric(pc_subset$lessdirfndrsng))
  pc_tab[count,5] <- i
  count <- count +1
}
pc_tab <- as.data.frame(pc_tab)
colnames(pc_tab)[1] <- "lessdirfndrsng"
colnames(pc_tab)[2] <- "netincfndrsng"
colnames(pc_tab)[3] <- "ratio"
colnames(pc_tab)[4] <- "sum"
colnames(pc_tab)[5] <- "type"
pc_tab

# ----------------------------------------------------------------------
#7. Salary proportionality in different types of NPOs

pc_s <- matrix(data=NA, length(list),2)
count <- 1
for (i in list) {
  pc_subset <- subset(pc, pc$NteeCat12==i)
  pc_s[count,1] <- sum((pc_subset$compnsatncurrofcr))/sum((pc_subset$totrevenue))
  pc_s[count,2] <- i
  count <- count +1
}
pc_s
pc_s <- as.data.frame(pc_s)
colnames(pc_s)[1] <- "salaryrevenue"
colnames(pc_s)[2] <- "type"
pc_s

# ----------------------------------------------------------------------
#8. Wages proportionality in different types of NPOs
pc_w <- matrix(data=NA, length(list),2)
count <- 1
for (i in list) {
  pc_subset <- subset(pc, pc$NteeCat12==i)
  pc_w[count,1] <- sum((pc_subset$othrsalwages))/sum((pc_subset$totrevenue))
  pc_w[count,2] <- i
  count <- count +1
}
pc_w <- as.data.frame(pc_w)
colnames(pc_w)[1] <- "wages"
colnames(pc_w)[2] <- "type"
pc_w
# ----------------------------------------------------------------------
# Lasso regression
# ----------------------------------------------------------------------
# We will run a Lasso regression to estimate amognst a set of 
# selected variables of interest to determine those that explain revenue
# for small, medium and large NPOs regarding total revenue.

# We expect NPOs of different size to opperate differently and that's why
# we will expect different variables that explain revenue for each group.
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# Variables of interest

variables= c("totrevenue","unrelbusinccd","solicitcntrbcd","exprstmntcd","providegoodscd", "s4966distribcd", "distribtodonorcd","initiationfees","grsincmembers","txexmptint","totreprtabled","totcomprelatede", 
           "totestcompf","noindiv100kcnt ","nocontractor100kcnt ","totcntrbgfts ",
           "invstmntinc","txexmptbndsproceeds","royaltsinc ","grsrntsreal ","grsincfndrsng", "lessdirfndrsng", 
           "netincfndrsng ", "grntstogovt ","grnsttoindiv","grntstofrgngovt", "benifitsmembrs", 
           "compnsatncurrofcr","othrsalwages" ,"pensionplancontrb ","othremplyeebenef","payrolltx", 
           "feesforsrvcmgmt ","legalfees ","accntingfees ","feesforsrvclobby ","profndraising ",
           "feesforsrvcinvstmgmt ","feesforsrvcothr ","advrtpromo ",
           "officexpns","infotech","royaltsexpns","occupancy","travel","travelofpublicoffcl" ,"converconventmtng ",
           "interestamt","pymtoaffiliates","othrexpnsa","othrexpnsb","othrexpnsc","othrexpnsd","othrexpnse","othrexpnsf","totfuncexpns","totassetsend","totliabend","pubsuppsubtot170","pubsupplesspct170",
           "samepubsuppsubtot170","grsinc170", "netincunreltd170","othrinc170","totsupp170","grsrcptsrelated170","totgftgrntrcvd509","grsrcptsadmissn509","grsrcptsactivities509",
           "txrevnuelevied509","srvcsval509", "pubsuppsubtot509","subtotpub509",
           "samepubsuppsubtot509","grsinc509","unreltxincls511tx509","subtotsuppinc509","netincunrelatd509" ,"othrinc509","totsupp509")

pc_l <- pc[, names(pc)%in%variables]

# ----------------------------------------------------------------------
# Small NPOs, revenue < 1e+06

small_pc <- subset(pc_l,pc_l$totrevenue  < 1e+06 &  pc_l$totrevenue >0)

#work with merged small npos in ez and pc forms
common_cols <- intersect(colnames(small_pc), colnames(ez))
small <- rbind(
  subset(small_pc, select = common_cols), 
  subset(ez, select = common_cols))

#lasso procedure
x_small<-model.matrix(totrevenue~.,data=small)
x_small=x_small[,-1]
small<-cv.glmnet(x=x_small,y=small$totrevenue,nfolds=10,alpha=1,intercept=FALSE)
a <- coef(small,s='lambda.min',exact=TRUE)
coef_small <- as.data.frame(c(a[10],a[12]))
#save coefficients into MySQL
dbWriteTable(dbConn, "small",coef_small , append = T)


# ----------------------------------------------------------------------
# Medium NPOs, 1e+06 < revenue < 1e+08

medium_pc <- subset(pc_l,pc_l$totrevenue>1e+06 & pc_l$totrevenue<1e+08 )

#lasso procedure
x_med<-model.matrix(totrevenue~.,data=medium_pc)
x_med=x_med[,-1]
medium<-cv.glmnet(x=x_med,y=medium_pc$totrevenue,nfolds=10,alpha=1,intercept=FALSE)
b <- coef(medium,s='lambda.min',exact=TRUE)
coef_med <- as.data.frame(b[39])
#save coefficients into MySQL
dbWriteTable(dbConn, "medium",coef_med, append = T)


# ----------------------------------------------------------------------
# Large NPOs,  revenue > 1e+08
large_pc <- subset(pc_l,pc_l$totrevenue > 1e+08 & pc_l$totrevenue < max(pc_l$totrevenue))

#lasso procedure
x_large<-model.matrix(totrevenue~.,data=large_pc)
x_large=x_large[,-1]
large<-cv.glmnet(x=x_large,y=large_pc$totrevenue,type.measure='mse',nfolds=10,alpha=1,intercept=FALSE)
c <- coef(large,s='lambda.min',exact=TRUE)
coef_large <- as.data.frame(c[39])
#save coefficients into MySQL
dbWriteTable(dbConn, "large",coef_large , append = T)


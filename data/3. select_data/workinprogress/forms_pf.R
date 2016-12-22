# forms ez_PC
library(dplyr)
setwd("~/Desktop/2013/pf")
temp = list.files(pattern="*.csv")
for (i in 1:length(temp)) assign(temp[i], read.csv(temp[i]))
print(temp)
db_pf = NULL
for (i in 1:length(temp)) {
  print(temp[i])
  newpf <- read.csv(temp[i])       
  db_pf = rbind(db_pf,newpf)
}

NROW(db_pf)
NCOL(db_pf)
#> NROW(f)= 124148
#> NCOL(f)= 196
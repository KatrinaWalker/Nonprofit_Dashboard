# BGSE DATA SCIENCE MASTER PROGRAM 2016-17
# COMPUTING PROJECT - 1st TERM
# SORT DATA & KICK ASSES - K.W. L.R. A.B.

# SELECTION OF WORKING INPUT DATA

rm(list = ls())
library(dplyr)

work.path <- "C:/ALFONSO/WORK/GSE/14D003/"


########################

setwd(paste0(work.path, "dataset/990/"))
file.list <- list.files(pattern="*.csv")

# process the whole batch of csv files to obtain df.total
df.total <- data.frame()
for (f in 1:length(file.list)) {
  
  # read one csv file
  df <- data.frame()
  df <- (read.csv(file.list[f]))
  
  # select columns
  df <- select(df, EIN, NteeCat12)
  
  # add each file to the final result
  df.total <- rbind.data.frame(df.total, df)
}  

# write the result onto a csv file
setwd(paste0(work.path, "dump_files/"))
write.table(df.total, file = "add.csv", row.names = F, col.names = T)


# EOC
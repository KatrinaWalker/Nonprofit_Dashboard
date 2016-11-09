# BGSE DATA SCIENCE MASTER PROGRAM 2016-17
# COMPUTING PROJECT - 1st TERM
# SORT DATA & KICK ASSES - K.W. L.R. A.B.

# ZIP CODE DICTIONARY BUILD

rm(list = ls())

library(dplyr)

work.path <- "C:/ALFONSO/WORK/GSE/14D003/use/"
setwd(work.path)

file.list <- list.files(pattern="*.csv")
zip.dict <- data.frame(ZIP_code= integer(0), City= character(0), State = character(0))

# fore each csv file: read Zip, City, State --> extract unique Zips -->
# --> clean the sub-code --> add to the dictionary
for (f in 1:length(file.list)) {
  df <- (read.csv(paste0(work.path, file.list[f])))
  z.c.s <- select(df, ZIP, CITY, STATE)
  z.c.s["ZIP"] <- substr(z.c.s[1:nrow(z.c.s), "ZIP"], 1, 5)
  zip.dict <- rbind(distinct(z.c.s), zip.dict)
}

# write the dictionary onto a csv file
write.table(zip.dict, file = "zip_dict.csv", row.names = F, col.names = T)

# EOC
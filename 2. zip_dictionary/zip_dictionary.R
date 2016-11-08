# BGSE DATA SCIENCE MASTER PROGRAM 2016-17
# COMPUTING PROJECT - 1st TERM
# SORT DATA & KICK ASSES - K.W. L.R. A.B.

# ZIP CODE DICTIONARY BUILD

rm(list = ls())

library(dplyr)

work.path <- "C:/ALFONSO/WORK/GSE/14D003/"
setwd(work.path)

file.list <- as.data.frame(read.csv(paste0(work.path, "filenames.csv"), header = FALSE, ";", stringsAsFactors = F))
zip.dict <- data.frame(ZIP_code= integer(0), City= character(0), State = character(0))

# fore each csv file: read Zip, City, State --> extract unique Zips -->
# --> clean the sub-code --> add to the dictionary
for (f in 1:nrow(file.list)) {
  df <- as.data.frame(read.csv(paste0(work.path, "use/", file.list[f, 1]), header = T, ",", stringsAsFactors = F))
  z.c.s <- select(df, ZIP, CITY, STATE)
  z.c.s["ZIP"] <- substr(z.c.s[1:nrow(z.c.s), "ZIP"], 1, 5)
  zip.dict <- rbind(dplyr::distinct(z.c.s), zip.dict)
}

# write the dictionary onto a csv file
write.table(zip.dict, file = "zip_dict.csv", row.names = F, col.names = T)

# EOC
# BGSE DATA SCIENCE MASTER PROGRAM 2016-17
# COMPUTING PROJECT - 1st TERM
# SORT DATA & KICK ASSES - K.W. L.R. A.B.

# ZIP CODE DICTIONARY BUILD

rm(list = ls())

library(dplyr)
library(RMySQL)

# create a connection with the DB
db.npo <- dbConnect(MySQL(), user='alfonso', password = '1317', dbname = 'db_npo', host = '127.0.0.1')
on.exit(dbDisconnect(db.npo))

work.path <- "C:/ALFONSO/WORK/GSE/14D003/use/"
setwd(work.path)

file.list <- list.files(pattern="*.csv")
zip.dict <- data.frame(ZIP_code= integer(0), City= character(0), State = character(0))

# for each csv file: read Zip, City, State --> clean the sub-code -->
# --> extract unique Zips --> add to the dictionary
for (f in 1:length(file.list)) {
  df <- (read.csv(paste0(work.path, file.list[f])))
  z.c.s <- select(df, ZIP, CITY, STATE)
  z.c.s["ZIP"] <- substr(z.c.s[1:nrow(z.c.s), "ZIP"], 1, 5)
  z.c.s <- distinct(z.c.s)
  zip.dict <- rbind(z.c.s, zip.dict)
}

# write the dictionary onto a csv file
write.table(zip.dict, file = "zip_dict.csv", row.names = F, col.names = T)

# write the data onto the DB

# create a temp table in the DB with the dictionary data
dbSendQuery(db.npo, 'DROP TABLE IF EXISTS temp')
dbWriteTable(db.npo, name = 'temp', value =  zip.dict)

# remove the first column
dbSendQuery(db.npo, 'ALTER TABLE temp DROP COLUMN row_names')
# row-union on the main table
dbSendQuery(db.npo, 'INSERT INTO cities SELECT * FROM temp')

dbSendQuery(db.npo, 'SELECT * FROM cities UNION SELECT * FROM temp')
# discard the temp table
dbSendQuery(db.npo, 'DROP TABLE temp')






# EOC
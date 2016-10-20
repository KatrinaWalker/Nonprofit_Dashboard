rm(list = ls())
setwd("C:/ALFONSO/WORK/GSE/14D003")

year <- c(2012, 2013, 2014)
subfix <- c("OT", "PC", "PF")
state_code <- read.csv("state codes.csv", header = FALSE, "", stringsAsFactors = F)
# y <- 1; s <- 1; c <- 1

url_path <- "http://nccsweb.urban.org/extracts/"

for (c in 1:51) {
  for (s in 1:3) {
    for (y in 1:3) {
      file_basis <- paste0("irsExtractFromNccs_", year[y], "_990_", subfix[s], "_", state_code[c, 1], ".csv")
      download_url <- paste0(url_path, file_basis)
      
      error <- try(download.file(download_url, paste0("C:/ALFONSO/WORK/GSE/14D003/csv/", file_basis), "wget"))
      if(error == 8L) next
    }
  }
}

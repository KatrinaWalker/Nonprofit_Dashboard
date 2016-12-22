# BGSE DATA SCIENCE MASTER PROGRAM 2016-17
# COMPUTING PROJECT - 1st TERM
# DATA WRANGLERS - K.W. L.R. A.B.

# RETRIEVE CSV FILES FROM NCSS WEBSITE

rm(list = ls())

library(RCurl)

state.codes <- "~/NPO_USA/info/state codes.csv" ## alter theese depending on the machine
saving.folder <- "~/NPO_USA/raw_data/" ## alter theese depending on the machine
url_path <- "http://nccsweb.urban.org/extracts/"

# prepare variables for filenames and paths
year <- c(2012, 2013, 2014)
prefix <- c(990, "ez", "pf")
subfix <- c("OT", "PC", "PF")
state_code <- read.csv(state.codes, header = FALSE, "", stringsAsFactors = F)

# downloading loop
for (c in 1:51) {
  for (y in 1:3) {
    for (p in 1:3) {
      for (s in 1:3) {
        file_basis <- paste0("irsExtractFromNccs_", year[y], "_", prefix[p], "_", subfix[s], "_", state_code[c, 1], ".csv")
        download_url <- paste0(url_path, file_basis)
        
        # only proceed if the local file doesn't exists already and if it exists in the url
        if(!file.exists(paste0(saving.folder, file_basis)))
          if(url.exists(download_url))
            
            # download with try to avoid breaks on errors
            res <- try(download.file(download_url, paste0(saving.folder, file_basis), "wget"))
      }
    }
  }
}

# EOC
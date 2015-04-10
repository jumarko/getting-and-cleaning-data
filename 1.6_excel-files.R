setwd("/Users/jumar/workspace/courses/GettingAndCleaningData/")

# Excel is still probably the most widely used format for sharing data
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"

# we need to use method = "curl" because of https protocol
download.file(fileUrl, destfile = "./data/cameras.xlsx", method = "curl")

dateDownloaded <- date()


## read excel data
# install xlsx library - check https://researchskills.epigeum.com/courses/researchskills/953/course_files/media/smr_nat_sci_ddw_clo_quiz_r.pdf
# WATCH OUT! problem with java SE 6 on Mac OS X
# https://support.rstudio.com/hc/communities/public/questions/203640576-library-RWeka-crashes-RStudio
# --> You need to install java se 6: https://support.apple.com/kb/DL1572?locale=en_US
install.packages('xlsx', repos='http://cran.r-project.org')
library(xlsx)

cameraData <- read.xlsx("./data//cameras.xlsx", sheetIndex = 1, header = TRUE)
head(cameraData)


# You can read specific rows and columns
colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx("./data/cameras.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)
cameraDataSubset

# Notes
# write.xlsx
# read.xlsx2 is much faster but less stable
# XLConnect page has more option

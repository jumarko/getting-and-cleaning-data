fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

# we need to use method = "curl" because of https protocol
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")

dateDownloaded <- date()

# we can then read the data

## read.table()
## not suitable for large data
cameraData <- read.table("./data/cameras.csv")
# we need to set separator
cameraData <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
head(cameraData)

## read.csv, sep = "," and header = TRUE is automatic
cameraData <- read.csv("./data//cameras.csv")
head(cameraData)
# parameters:
#   quote - any quoted values?
#   na.strings - set the characters that represents a missing value
#   nrows - how many rows to read?
#   skip  - number of lines to skip before starting to read
# Often times, the quotation marks ' or " are in data
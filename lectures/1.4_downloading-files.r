# Consider setting workding directory
# Check commands getwd() and setwd()

if (!file.exists("data")) {
    dir.create("data")
}

# Even if you could do this by hand, helps with reproducibility
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

# we need to use method = "curl" because of https protocol
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")

list.files("./data")

# Be sure to record when you downloaded
dateDownloaded <- date()
dateDownloaded


if (!file.exists("data")) {
    dir.create("data")
}

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

# we need to use method = "curl" because of https protocol
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")

list.files("./data")


# Example data set
# https://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g/rows.csv?accessType=DOWNLOAD
if (!file.exists("./data")) { 
    dir.create("./data")
}
fileUrl <- "https://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")

# Look at a bit of the data
head(restData, n=3)
tail(restData, n=3)

#summary - various statistics
summary(restData)

#more in depth information
str(restData)

# Quantiles of quantitative variables
quantile(restData$councilDistrict, na.rm=TRUE)
quantile(restData$councilDistrict, probs=c(0.5, ).75, 0.9)

# Make table
table(restData$zipCode, useNA="ifany")
# 2-D table
table(restData$councilDistrict, restData$zipCode)

# Check for missing values
# sum returns 0 if there are no missing values
sum(is.na(restData$councilDistrict))
# FALSE if there are no missing values
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

# Row and column sums
colSums(is.na(restData))
all(colSums(is.na(restData)) == 0)

# Values with specific characteristics
table(restData$zipCode %in% c("21212"))
# 21212 OR 21213
table(restData$zipCode %in% c("21212", "21213"))
restData[restData$zipCode %in% c("21212", "21213"), ]

# Cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
# cross tabs == identify where the relationships exist in this dataset
# E.g Frequency broken down by Gender and Admit
xt <- xtabas(Freq ~ Gener + Admit,data=DF)

# Flat tables
warpbreaks$replicate <- rep(1:9, len = 54)
# break "breaks" by all other variables (".")
xt = xtabs(breaks ~., data=warpbreaks)
xt
# now, make flat table to get more compact form
ftable(xt)

# Size of a data set
fakedata = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")
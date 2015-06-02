# Often the raw data won't have a value you are looking for
# - Missingness indicators
# - Cutting up quantitative variables
# - Applying transformations

# Example - baltimore restaurants
if (!file.exists("./data")) { 
    dir.create("./data")
}
fileUrl <- "https://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")

# Creating sequences
s1 <- seq(1,10,by=2); s1
s2 <- seq(1,10,length=3); s2
# creates sequence along vector - can be used as vector indices
x <- c(1,3,8,25,100); seq(along = x)

# Subsetting variables
restData$nearMe = restData$neigborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

# Creating binary variables - filtering invalid zip codes
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

# Creating categorical variables
restData$zipGroups = cut(restData$zipCode, breaks=quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups, restData$zipCode)

# Easier cutting
library(Hmisc)
# cut zip code into 4 different groups
restData$zipGroups = cut2(restData$zipCode, g=4)
table(restData$zipGroups)

# Creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

# Levels of factor variables
yesno <- sample(c("yes", "no"), size=10, replace = TRUE)
yesnofac = factor(yesno, levels=c("yes", "no"))
relevel(yesnofac, ref="yes")
# you can change factor back to numeric value

# Cutting produces factor variables
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g=4)
table(restData$zipGroups)
class(restData$zipGroups)

# Using the mutate function
library(Hmisc); library(plyr)
# create from original restData adding new variable "zipGroups"
restData2 = mutate(restData, zipGroups=cut2(zipCode, g=4))
table(restData$zipGroups)
as.numeric(yesnofac)

# Common transforms
x = -3.4789
n = 2
abs(x)
sqrt(x)
ceiling(x)
floor(x)
round(x, digits=n)
signif(x, digits=n)
cos(x)
sin(x)
log(x)
log2(x)
log10(x)
exp(x)

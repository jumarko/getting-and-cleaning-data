# Question 1
setwd("/Users/jumar/workspace/courses/getting-and-cleaning-data/quizzes/")

community_survey_data <- read.csv('getdata-data-ss06hid.csv')
head(community_survey_data, 1)

# property value is stored in column "VAL" - value 24 means $1000000+
nrow(community_survey_data)
nrow(subset(community_survey_data, VAL == 24))


# read data from excel file
library(xlsx)
dat <- read.xlsx('getdata-data-DATA.gov_NGAP.xlsx', sheetIndex = 1, header = TRUE)
sum(dat$Zip*dat$Ext,na.rm=T) 


# read data from xml
library(XML)
restaurants <- xmlTreeParse('getdata-data-restaurants.xml', useInternal = TRUE)
rootNode <- xmlRoot(restaurants)
xpathSApply(restaurants, '//zipcode[text() = "21231"]')


# american community data - Idaho state
library(data.table)
DT <- fread('getdata-data-ss06pid.csv')
# Find fastest way to compute average value of the variable pwgtp15 broken down by sex
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(mean(DT[DT$SEX==1,]$pwgtp15)); system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(rowMeans(DT)[DT$SEX==1]); system.time(rowMeans(DT)[DT$SEX==2])
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(tapply(DT$pwgtp15,DT$SEX,mean))

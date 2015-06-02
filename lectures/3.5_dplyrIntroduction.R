# dplyr - working with data frames (key data structures)
# doesn't provide any new functionality, but greatly simplifies R functionality
# Once you learn its grammer you can use other backends, such as data.table

# dplyr Verbs
# select: subset of columns
# filter: subset of rows
# arrange: reorder rows of data frame
# rename: rename variables
# mutate: add new variables / columns or transform existing ones
# summarise / summarize

# Properties of functions
# - the first argument is a data frame
# - you can refer columns with strings, don't have to use "$" notation
# - the result is a new data frame

# load
library(dplyr)

chicago <- readRDS("chicago.rds")
dim(chicago)
str(chicago)
names(chicago)
# select all columns between city and dptp column
head(select(chicago, city:dptp))
# select all columnx except specified columns
head(select(chicago, -(city:dptp)))

chic.f <- filter(chicago, pm25tmean2 > 30)
head(chic.f, 10)
chic.f <- filter(chicago, pm25tmean2 > 30 & tpmd > 80)
head(chic.f)

# arrange
chicago <- arrange(chicago, date)
head(chicago)
tail(chicago)
chicago <- arrange(chicago, desc(date))
head(chicago)
tail(chicago)

# rename - hard in plain R if you don't have this function
chicago <- rename(chicago, pm25 = pm25teman2, dewpoint = dptp)
head(chicago)

# mutate
chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
head(select(chicago, pm25, pm25detrend))
# categorizations
chicago <- mutate(chicago, tempcat = factor(1 * (tpmd > 80), labels = c("cold", "hot")))
summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
chicago <- mutate(chicago, year - as.POSIXlt(date)$year + 1900)
summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))

# "pipeline"
chicago %>%> mutate(month = as.POSIXlt(date)$mon + 1) %>%> group_by(month) %>%> summarize(pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
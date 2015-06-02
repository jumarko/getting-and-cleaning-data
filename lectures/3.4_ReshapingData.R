# The goal is tidy data!!!
# 1. Each araible forms a column
# 2. Each observations forms a row
# 3. Each table/file stores data about one kind of observations (e.g. people/hospitals)

# Tutorial
# http://www.r-bloggers.com/a-quick-primer-on-slit-apply-combine-problems

# Start with reshaping
library(reshape2)
head(mtcars)

# Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"),
                measure.vars="mpg", "hp")
head(carMelt, n=3)
tail(carMelt, n=3)

# Casting data frames
# We want to see cylinders broken down by variable
cylData <- dcast(carMelt, cyl ~ variable)
# e.g. for cyl=4 we have 11 measures of mpg and 11 measure of hp
cylData
# or use custom "summarization" function
cylData <- dcast(carMelt, cyl ~ variable, mean)

# Averaging values
head(InsectSprays)
# compute sum of counts for each different value of spray
tapply(InsectSprays$count, InsectSprays$spray, sum)
# Another way - split
spIns = split(InsetSprays$count, InsetSprays$spray)
spIns
# Another way - apply
sprCount = lapply(spIns, sum)
sprCount
# Another way - combine
unlist(sprCount)
sapply(spIns, sum)
# Another way - plyr package
ddply(InsectSprays,.(spray), summarize, sum=sum(count))

# Creating a new variable
# Compute sum for spray category
spraySums <- ddply(InsectSprays,.(spray), summarize, sum=ave(count, FUN=sum))
dim(spraySums)
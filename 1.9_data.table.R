## data.table: https://github.com/Rdatatable/data.table
# inherits from data.frame
# written in C => much faster (especially in subsetting, grouping variables, and updating variables)

## Resources
# http://stackoverflow.com/questions/13618488/what-you-can-do-with-data-frame-that-you-cant-in-data-table
# https://github.com/raphg/Biostat-578/blob/master/Advanced_data_manipulation.Rmd

install.packages("data.table")
library(data.table)

# create data frame
DF = data.frame(x=rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
head(DF, 3)

# similarly, we can create data table
DT = data.table(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
head(DT, 3)

# display all data tables loaded in memory
tables()

# subsetting rows
DT[2,]
DT[DT$y=="a",]
# subset with only one index
DT[c(2,3)]

# subsetting columns
DT[, c(2,3)]
# you can pass a function which shoul be evaluated
DT[, list(mean(x), sum(z))]
DT[, table(y)]

# add new columns
# e.g. add new column equal to the square of z
DT[, w:=z^2]

# multiple operations
DT[, m:= {tmp <- (x + z); log2(tmp + 5)}]

# plyr like operations
DT[, a := x > 0]
DT[, b := mean(x + w), by = a]

# Special variables
# .N An integer, length 1, containing the number
set.seed(123)
DT <- data.table(x = sample(letters[1:3], 1E5, TRUE))
# count the occurences of letters (group by x, i.e. letter)
DT[, .N, by = x]

# Keys - for fast sorting and filtering
DT <- data.table(x = rep(c("a", "b", "c"), each = 100), y = rnorm(300))
setkey(DT, x)
DT['a']
# you can use keys to faciliate Joins
DT1 <- data.table(x = c('a', 'a', 'b', 'dt1'), y = 1:4)
DT2 <- data.table(x = c('a', 'b', 'dt2'), z = 5:7)
setkey(DT1, x)
setkey(DT2, x)
merge(DT1, DT2)


# Fast reading
big_df <- data.frame(x=rnorm(1E6), y = rnorm(1E6))
file <- tempfile()
write.table(big_df, file = file, row.names = FALSE, col.names=TRUE, sep="\t", quote=FALSE)
# fast
system.time(fread(file))
# VS. slow
system.time(read.table(file, header=TRUE, sep="\t"))

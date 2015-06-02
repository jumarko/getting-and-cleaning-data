# Subsetting - quick review
set.seed(13435)
X <- data.frame("var1"=sample(1:5,"var2"=sample(6:10),"var3"=sample(11:15)))
X <- X[sample(1:5),]
X$var2[c(1,3)] = NA
X

# subset specific column
X[,1]
# using variable name
X[,"var1"]
# subset both rows and columns
X[1:2,"var2"]

# Logicals ands and ors
X[(X$var1) <= 3 & X$var3 > 11),]
X[(X$var1 <=3 | X$var3 > 15),]

# Dealing with missing values
# which returns the indices where variable is greater than 8, 
# doesn't return NAs
X[which(X$var2 > 8), ]

# Sorting
sort(X$var1)
sort(X$var1, decreasing=TRUE)
sort(X$var2, na.last=TRUE)

# Ordering the data frame
X[order(X$var1),]
X[order(X$var1,X$var3),]

# Ordering with plyr
library(plyr)
arrange(X,var1)
# decreasing order
arrange(X,desc(var1))

# Adding rows and columns
X$var4 <- rnorm(5)
Y <- cbind(X,rnorm(5))
Y <- rbind(x, rnorm(5))
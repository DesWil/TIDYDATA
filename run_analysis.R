
> feat <- data.table :: fread("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
>   activLevel <- data.table :: fread("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
>         ##Read training data
>    subTrain <- data.table :: fread("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
>    xTrain <- data.table :: fread("UCI HAR Dataset/train/X_train.txt", col.names = feat$functions)
|--------------------------------------------------|
|==================================================|
> 
> 
>    yTrain <- data.table :: fread("UCI HAR Dataset/train/y_train.txt", col.names = "code")
>         ##Read Test data
>    subTest <- data.table :: fread("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
>    xTest <- data.table :: fread("UCI HAR Dataset/test/X_test.txt", col.names = feat$functions)
>    yTest <- data.table :: fread("UCI HAR Dataset/test/y_test.txt", col.names = "code")
> xtotal <- rbind(xTrain, xTest)
> ytotal <- rbind(yTrain, yTest)
> subtotal <- rbind(subTrain, subTest)
> ## QUESTION 2 
> selectVar <- feat[grep("mean\\(\\)|std\\(\\)",feat[,2]),]
> xtotal<- xtotal[,selectVar[,1]]
> ## QUEASTION 3
> colnames(ytotal) <- "activity"
> ytotal$activLevel <- factor(ytotal$activity, labels = as.character(activLevel[,2]))
> activLevel <- ytotal[,-1]
> ## Question5 
> colnames(subtotal) <- "subject"
> total <- cbind(xtotal, activLevel, subtotal)
> totalMean <- total %>% group_by(activLevel, subject) %>% summarize_each(funs(mean))
Error in total %>% group_by(activLevel, subject) %>% summarize_each(funs(mean)) : 
  could not find function "%>%"
> library(magrittr)
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

Warning message:
package ‘dplyr’ was built under R version 4.0.5 
> totalMean <- total %>% group_by(activLevel, subject) %>% summarize_each(funs(mean))
Warning messages:
1: `summarise_each_()` was deprecated in dplyr 0.7.0.
Please use `across()` instead.
This warning is displayed once every 8 hours.
Call `lifecycle::last_warnings()` to see where this warning was generated. 
2: `funs()` was deprecated in dplyr 0.8.0.
Please use a list of either functions or lambdas: 

  # Simple named list: 
  list(mean = mean, median = median)

  # Auto named with `tibble::lst()`: 
  tibble::lst(mean, median)

  # Using lambdas
  list(~ mean(., trim = .2), ~ median(., na.rm = TRUE))
This warning is displayed once every 8 hours.
Call `lifecycle::last_warnings()` to see where this warning was generated. 
> write.table(totalMean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
> save.image("C:\\Users\\zandile\\Downloads\\run_analysis.R")
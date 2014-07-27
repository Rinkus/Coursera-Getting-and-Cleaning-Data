#Load the packages
library(plyr)
library(reshape2)
options(stringsAsFactors=FALSE)

#Getting the data (assumed the file downloaded to working directory)

#Data from: 
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url, destfile = "dataassignment.zip")
filelist <- unzip("dataassignment.zip")

#Reading the data
activitylabel <- read.table(filelist[1])
feature <- read.table(filelist[2])
subjecttest <- read.table(filelist[14])
xtest <- read.table(filelist[15])
ytest <- read.table(filelist[16])
subjecttrain <- read.table(filelist[26])
xtrain <- read.table(filelist[27])
ytrain <- read.table(filelist[28])

#test data cleaning and merge
names(activitylabel) <- c("activitycode", "activitydescription")
names(xtest) <- feature[,2]
names(subjecttest) <- "subjectid"
names(ytest) <- "activitycode"
testdatatidy <- cbind(subjecttest, ytest, xtest)
testdatatidy <- merge(activitylabel, testdatatidy, by.x="activitycode", 
                      by.y="activitycode", all=TRUE)

#train data cleaning and merge
names(xtrain) <- feature[,2]
names(subjecttrain) <- "subjectid"
names(ytrain) <- "activitycode"
traindatatidy <- cbind(subjecttrain, ytrain, xtrain)
traindatatidy <- merge(activitylabel, traindatatidy, by.x="activitycode", 
                      by.y="activitycode", all=TRUE)

#merge and cleaning test and train dataset
tidydata <- rbind(testdatatidy, traindatatidy)
names(tidydata) <- gsub("-", "", names(tidydata))
names(tidydata) <- gsub("\\()", "", names(tidydata))
tidydata$activitydescription <- gsub("_", "", 
                                     tidydata$activitydescription)
average <- grep("mean", names(tidydata))
stdev <- grep("std", names(tidydata))
tidydata <- tidydata[, c(3,2,average,stdev)]

#melting tidy data and average calculation
melttidydata <- melt(tidydata, id=c("subjectid", "activitydescription")
                     , feature=names(tidydata)[3:81])
result <- dcast(melttidydata, subjectid + activitydescription ~ variable,
                mean)


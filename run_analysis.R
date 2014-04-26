setwd("E:/Desk/Coursera/GCD/UCI HAR Dataset/")
# need this for arrange
library("plyr", lib.loc="D:/algorepo/R/win-library/3.1")
library("reshape2", lib.loc="D:/algorepo/R/win-library/3.1")
# read in the labeling
actlabels = read.table("activity_labels.txt", header=FALSE, col.names = c("ActivityCode", "Activity"))
featlabels = read.table("features.txt", header=FALSE, col.names = c("FeatureCode", "Feature"))
# load the activity rows
testy = read.table("test/y_test.txt", header = FALSE)
trainy = read.table("train/y_train.txt", header=FALSE)
# load the subject rows
subtest = read.table("test/subject_test.txt", header=FALSE)
subtrain = read.table("train/subject_train.txt", header=FALSE)
# read in the data
testdata = read.table("test/X_test.txt", header=FALSE, col.names=featlabels$Feature)
traindata = read.table("train/X_train.txt", header=FALSE, col.names=featlabels$Feature)
# find the relevant columns
stdlabels <- grep("std\\(", featlabels$Feature)
meanlabels <- grep("mean\\(", featlabels$Feature)
# concatenate the relevant labels into one vector
rellabels <- c(meanlabels, stdlabels)
# sort that vector
rellabels <- sort(rellabels)
# cull the data tables for relevant columns
testdt <- testdata[rellabels]
traindt <- traindata[rellabels]
# add the subject and activity
tedt <- testdt
trdt <- traindt
subtestv <- subtest[[1]]
subtrainv <- subtrain[[1]]
acttestv <- testy[[1]]
acttrainv <- trainy[[1]]
tedt$subject <- subtestv
tedt$activity <- acttestv
trdt$subject <- subtrainv
trdt$activity <- acttrainv
# clean up a little
# remove(testdata)
# remove(traindata)
# remove(testdt)
# remove(traindt)
# concatenate the train and test tables
fulldata <- rbind(tedt,trdt)
# reorder the columns
neworderv <- c(c(67,68),seq(from=1,to=66,by=1))
fulldataorder <- fulldata[,neworderv]
# now add a new column with the string value of activity
names(actlabels)[1]<-paste("activity")
names(actlabels)[2]<-paste("activityName")
nameit <- merge(fulldataorder, actlabels, by = "activity")
# sort it into something more intuitive :)
salldata <- arrange(nameit, subject, activity)
# get rid of the activity code column
noactcode <- salldata[,c(c(2,69),seq(from=3,to=68,by=1))]
# melt the activity and subject in preparation for the cast for mean
ap <- melt(noactcode,id=c("activityName","subject"))
# cast activities and subjects and get aggregate means
res <- acast(ap, subject + activityName ~ variable, mean)
# split out the column names for tidiness
#    split subject and activity
rout <- cbind(res, colsplit(rownames(res), pattern="_",names=c("subject","activity")))
#   reorder the result so subject and activity columns are first two cols
rout1 <- rout[,c(c(67,68),seq(from=1, to=66, by=1))]
#   remove the row.names as they are no longer required
rownames(rout1) <- NULL
# Clean up subject names for readability
#   remove ".." and "..."
colrout <- gsub("\\.\\.", ".", gsub("\\.\\.\\.", ".", colnames(rout2)))
#   remove trailing periods from some column names
colrout <- gsub("mean.$", "mean", colrout)
colrout <- gsub("std.$", "std", colrout)
#   rewrite the column names
colnames(rout1) <- colrout
# write out the table
write.table(rout1, "summary_output.txt", sep=" ", row.names = FALSE)

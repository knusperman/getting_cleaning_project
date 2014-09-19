#get packages
install.packages("plyr")
library("plyr")
#import
#general
read.table("activity_labels.txt")->act_labels
read.table("features.txt")->features
#train
read.table("train/X_train.txt")->x_train
read.table("train/y_train.txt")->y_train
read.table("train/subject_train.txt")->subject_train
#test
read.table("test/X_test.txt")->x_test
read.table("test/y_test.txt")->y_test
read.table("test/subject_test.txt")->subject_test
#rename columns
#features
colnames(x_train)<-features$V2
colnames(x_test)<-features$V2
#activity labels
testactivities <- join(y_test, act_labels)$V2 
trainactivities <- join(y_train, act_labels)$V2

# add columns
test <- cbind(x_test, testactivities, subject_test)
train <- cbind(x_train, trainactivities, subject_train)

#put both data sets together
colnames(test)<- c(as.character(features$V2), "activity", "subject")
colnames(train)<- c(as.character(features$V2), "activity", "subject")
fulldata <- rbind(train,test)

#extract means and standard deviations
fulldata_means <- fulldata[grepl("-mean()", colnames(fulldata))]
fulldata_sds <- fulldata[grepl("-sd()", colnames(fulldata))]
mean_sd_extract <- cbind(fulldata_means, fulldata_sds)

test_means <- x_test[grepl("-mean()", colnames(x_test))]
train_means <- x_train[grepl("-mean()", colnames(x_train))]

#aggregate
aggregation <- aggregate(x = fulldata, by = list(fulldata$subject, fulldata$activity), FUN=mean, na.rm=TRUE)
aggregation <- aggregation[-c(564,565)]
colnames(aggregation)<- c("subject", "activity", paste("mean_", as.character(features$V2), sep =""))

write.table(x = aggregation,file = "output.txt",row.name=FALSE)

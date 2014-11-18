#load dplyr
library(dplyr)

# load the feature names
features<-read.csv(file = "data/features.txt", sep =" ", header = FALSE)

# load the activity labels
activity<-read.csv(file = "data/activity_labels.txt", sep =" ", header = FALSE)

# load the test data
X_test<-read.fwf(file = "data/test/X_test.txt", colClasses=rep("numeric",562), widths=c(1,rep(16,561)), header = FALSE)
y_test<-read.csv(file = "data/test/y_test.txt", sep =" ", header = FALSE)
subject_test<-read.csv(file = "data/test/subject_test.txt", sep =" ", header = FALSE)
# write the activity results to the first column
X_test[,1]<-y_test
# add the subject id
X_test<-cbind(subject_test,X_test)
# add the column names
names(X_test)<-c("Subject", "Activity", as.character(features[,2]))

# load the training data
X_train<-read.fwf(file = "data/train/X_train.txt", colClasses=rep("numeric",562), widths=c(1,rep(16,561)), header = FALSE)
y_train<-read.csv(file = "data/train/y_train.txt", sep =" ", header = FALSE)
subject_train<-read.csv(file = "data/train/subject_train.txt", sep =" ", header = FALSE)
# write the activity results to the first column
X_train[,1]<-y_train
# add the subject id
X_train<-cbind(subject_train,X_train)
# add the column names
names(X_train)<-c("Subject", "Activity", as.character(features[,2]))

# merge data sets
data<-rbind(X_test,X_train)

# filter out the subject, activity, and the mean() and std() values
filtered<-data[,c(1,2,grep("mean\\()|std\\()", names(data)))]

# adding the factor lables to the activity column
filtered[[2]]<-factor(filtered[[2]], labels = activity[[2]])

# generate descriptive names
names(filtered)<-sub("Acc", "Accelerometer", names(filtered))
names(filtered)<-sub("Gyro", "Gyroscope", names(filtered))
names(filtered)<-sub("Mag", "Magnitude", names(filtered))
names(filtered)<-sub("-mean()", "Mean", names(filtered), fixed = TRUE)
names(filtered)<-sub("-std()", "StandardDeviation", names(filtered), fixed = TRUE)
names(filtered)<-sub("-X", "AxisX", names(filtered), fixed = TRUE)
names(filtered)<-sub("-Y", "AxisY", names(filtered), fixed = TRUE)
names(filtered)<-sub("-Z", "AxisZ", names(filtered), fixed = TRUE)
names(filtered)<-sub("tBody", "TimeDomainBody", names(filtered), fixed = TRUE)
names(filtered)<-sub("tGravity", "TimeDomainGravity", names(filtered), fixed = TRUE)
names(filtered)<-sub("fBody", "FrequencyDomainBody", names(filtered), fixed = TRUE)
names(filtered)<-sub("fGravity", "FrequencyDomainGravity", names(filtered), fixed = TRUE)
names(filtered)<-sub("BodyBody", "Body", names(filtered), fixed = TRUE)

#summarize
summary <- filtered %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))

#apply final name
names(summary)<-c(names(summary)[1:2], paste("MeanBySubjectByActivity",names(summary)[3:68], sep = ""))

#write output
write.table(summary,row.name=FALSE,file="output.txt")
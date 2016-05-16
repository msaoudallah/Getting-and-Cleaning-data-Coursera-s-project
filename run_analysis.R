library(data.table)
library(dplyr)
library(reshape)

featnames = fread("UCI HAR Dataset/features.txt")

X_train = fread("UCI HAR Dataset/train/X_train.txt")
Y_train = fread("UCI HAR Dataset/train/Y_train.txt")
tr_Sub = fread("UCI HAR Dataset/train/subject_train.txt")
names(Y_train)<- c("Activity")
names(tr_Sub)<- c("subject")
X_test = fread("UCI HAR Dataset/test/X_test.txt")
Y_test = fread("UCI HAR Dataset/test/Y_test.txt")
te_Sub = fread("UCI HAR Dataset/test/subject_test.txt")
names(Y_test)<- c("Activity")
names(te_Sub)<- c("subject")
dataSet <- rbind(cbind(X_train,Y_train,tr_Sub),cbind(X_test,Y_test,te_Sub))
cf <- grep("mean|std",featnames$V2)
dataSet <- select(dataSet,c(cf,562,563))
activity_names <- fread("UCI HAR Dataset/activity_labels.txt")
activity_factor <- factor(dataSet$Activity,levels = activity_names$V1,labels = activity_names$V2)
dataSet[,Activity := activity_factor]
names(dataSet) = c(featnames[grep("mean|std",featnames$V2)]$V2,"Activity","subject")

ids = featnames[grepl("mean|std",featnames$V2)]$V2

molted = melt(dataSet,id = c("Activity","subject")  )

nds = cast(molted, Activity + subject ~ variable , mean)

write.csv(nds,"tidy.csv")





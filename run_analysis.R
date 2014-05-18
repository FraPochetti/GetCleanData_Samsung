#check whether data.frames exist not to reload big data each time script runs
if (!exists('X.train') & !exists('X.test')) {
  X.train <- read.table('X_train.txt') #dim = 7352 X 561
  X.test <- read.table('X_test.txt') #dim = 2947 X 561
}

#load y files
y.train <- read.table('y_train.txt') #dim = 7352 X 1
y.test <- read.table('y_test.txt') #dim = 2947 X 1

#load subject files
subject.train <- read.table('subject_train.txt') #dim = 7352 X 1
subject.test <- read.table('subject_test.txt') #dim = 2947 X 1

#build single data set binding properly the loaded data.frames
complete.train <- cbind(subject.train, y.train, X.train) #dim = 7352 X 563

complete.test <- cbind(subject.test, y.test, X.test) #dim = 2947 X 563

samsung <- rbind(complete.train, complete.test) #dim = 10299 X 563

#load the txt file with all the features names and indices
features <- read.table('features.txt', colClasses = c('numeric', 'character')) #dim = 561 X 2

#select all the features containing the substring 'mean' and 'std' and generate logical vector
logical.features <- ((grepl("-mean()", features$V2) | grepl("-std()", features$V2)) & !grepl("-meanFreq", features$V2))

#add two TRUE elements to logical.features in order to be sure to select y and subject columns (first 2 columns) from samsung data.frame
first.two <-c(TRUE, TRUE)
logical.features <- c(first.two, logical.features)

#subset samsung data.frame
samsung <- samsung[,logical.features] #dim = 10299 X 68


#set proper columns names to samsung data.frame
column.names <- c('Subject', 'Activity')
#select from features data.frame the names of the correct variables
measured.variables <- features$V2[(grepl("-mean()", features$V2) | grepl("-std()", features$V2)) & !grepl("-meanFreq", features$V2)]

column.names <- c(column.names, measured.variables)
#rename columns
colnames(samsung) <- column.names

#rename activities
activities <- read.table('activity_labels.txt', colClasses = c('numeric', 'character')) #dim = 6 X 2

map = setNames(activities$V2, activities$V1)
samsung$Activity <- map[unlist(samsung$Activity)]

#returning tidy data.frame
require(reshape2)
samsung.melt = melt(samsung, id = c("Subject", "Activity"))
samsung.tidy <- dcast(samsung.melt, formula = Subject + Activity ~ variable, mean) #dim = 180 X 68

#set significant digits to 8 as the original merged dataset
samsung.tidy[,3:68] <- signif(samsung.tidy[,3:68],8)

#save data.frame
write.table(samsung.tidy, "./SamsungTidy.txt", sep="\t", col.names = colnames(samsung.tidy))




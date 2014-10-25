# First, read in the processed signal data data from the test subjects
X_df <- read.table("./test/X_test.txt")
# Then merge the data from the train subjects
X_df <- rbind(X_df,read.table("./train/X_train.txt"))

# Load the feature names, later used as column headings
# These are too cryptic and some characters are rewritten when 'data' is converted
# They will be replaced before that stage
features <- read.table("./features.txt", stringsAsFactors = FALSE)
# Extract the feature names as a character vector
X_cols <- features[,2]

# Initial tidy up of the column names to remove punctuation and whitespace
# This makes it easier to translate selected columns later
X_cols <- sapply(X_cols, chartr,old="(),", new="  -")
X_cols <- sapply(X_cols, gsub, pattern="\\s", replacement="")
# Name the columns of the processed data using the cryptic feature names
colnames(X_df) <- X_cols

# Load the activity names as factors
activity_labels <- read.table("./activity_labels.txt")
# Turn them into a vector
fac_act <- activity_labels[[2]]

# Read in the activity data for the test subjects, coded as integers
Y_df <- read.table("./test/y_test.txt")
# Then merge the data from the train subjects
Y_df <- rbind(Y_df,read.table("./train/y_train.txt"))

# Convert this data into a vector of factors, as derived from activity_labels.txt
Y_vec <- Y_df[[1]]
Activity <- factor(Y_vec,labels = fac_act)

# Read in the IDs from the test subjects
subj_df <- read.table("./test//subject_test.txt")
# Merge in the IDs from the train subjects
subj_df <- rbind(subj_df,read.table("./train//subject_train.txt"))
# Convert to a vector
Subject <- subj_df[[1]]

# Create the full data frame of subjects, activities and processed data
data <- data.frame(Subject,Activity,X_df)

## Need to rename the columns at this point
# This will change the 'select' function call below

# The dplyr package is required for the 'select' and 'group_by' function
library(dplyr)

# Convert to a data.table to allow use of dlpyr functions
data_tbl <- tbl_df(data)

# Create new table containing independent variables and those measurements that
# are the mean or standard deviation of signal data
# This discounts measurements of mean frequency and of angles from the gravitational mean
#data_sel <- select(data_tbl, subj_vec, Y_fac, contains("mean"), contains("std"))
data_sel <- select(data_tbl, Subject, Activity, contains("mean"), contains("std"), -contains("gravityMean"), -contains("meanFreq"), -contains("angletBodyAccMean.gravity"))

# Remove spurious repetition in feature names
names(data_sel) <- gsub("BodyBody", "Body", names(data_sel))

# Group by activity and then by subject id
data_grp <- group_by(data_sel, Activity, Subject)

# Finally, calculate the mean of previously selected measurements and return the output
data_summ <- summarise_each(data_grp, funs(mean))

# Return the summarised data
data_summ
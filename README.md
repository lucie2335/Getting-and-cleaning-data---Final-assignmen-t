**There are two tidy data sets : tidydata1 and tidydata2.** \_\_ Only
the second is posted\_\_ **They compiled measurements realised on 30
volunteers during 6 different types of activities,** by the mean of a
smartphone (Samsung Galaxy S II) on the waist. Using its embedded
accelerometer and gyroscope, the experiment captured : - Triaxial
acceleration from the accelerometer (total acceleration) and the
estimated body acceleration. - Triaxial Angular velocity from the
gyroscope. - A 561-feature vector with time and frequency domain
variables.

**The raw data used to create tidydata1 and tidy\_ata2 is available
here:**

<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" class="uri">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

**The script used to tidy this raw data is run\_analysis.R,** joined in
this repository. Please note that the raw data was divided in two sets:
train & test, which are combined in the tidy data sets.

**To use this script**, you need to download the raw data on your
computer. Then, in the script, you type the path to the downloaded file
on the designated line at the beginning of the script.

The script then: - gets the names of the variables - gets the TEST SET,
names it with the variables and includes the activities and subjects. -
gets the TRAIN SET, names it with the variables and includes the
activities and subjects. - combines them in a file - extracts only the
measurements on the mean and standard deviation - clarifies the names of
the activities At this point, tidydata1 is created.

The script then: - creates a second, independent tidy data set with the
average of each variable for each activity and each subject. At this
point, tidydata2 is created.

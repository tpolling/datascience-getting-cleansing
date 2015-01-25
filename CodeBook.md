Code Book
=========

The average data table in file one/avg_one.txt holds the average for each measurement variable by activity and subject
The possible activities are listed in activity_labels.txt. The number of subjects are in one/subject_one.txt.

Each column in the variable lists the mean/standard deviation of linear accelartion and gyroscope measurements as listed below.
Each activity for a subject has 128 measurements in a given time window. They will be averaged based on mean and standard
deviation (mean() or std()) for the respective measurements.
For the given duration of an activity, this results in a number of measurements. This final measurement set is averaged by
activity and subject, resulting in one row that averages the below variable by activity and subject.
 [1] tBodyAcc-mean()-X           tBodyAcc-mean()-Y           tBodyAcc-mean()-Z          
 [4] tBodyAcc-std()-X            tBodyAcc-std()-Y            tBodyAcc-std()-Z           
 [7] tGravityAcc-mean()-X        tGravityAcc-mean()-Y        tGravityAcc-mean()-Z       
[10] tGravityAcc-std()-X         tGravityAcc-std()-Y         tGravityAcc-std()-Z        
[13] tBodyAccJerk-mean()-X       tBodyAccJerk-mean()-Y       tBodyAccJerk-mean()-Z      
[16] tBodyAccJerk-std()-X        tBodyAccJerk-std()-Y        tBodyAccJerk-std()-Z       
[19] tBodyGyro-mean()-X          tBodyGyro-mean()-Y          tBodyGyro-mean()-Z         
[22] tBodyGyro-std()-X           tBodyGyro-std()-Y           tBodyGyro-std()-Z          
[25] tBodyGyroJerk-mean()-X      tBodyGyroJerk-mean()-Y      tBodyGyroJerk-mean()-Z     
[28] tBodyGyroJerk-std()-X       tBodyGyroJerk-std()-Y       tBodyGyroJerk-std()-Z      
[31] tBodyAccMag-mean()          tBodyAccMag-std()           tGravityAccMag-mean()      
[34] tGravityAccMag-std()        tBodyAccJerkMag-mean()      tBodyAccJerkMag-std()      
[37] tBodyGyroMag-mean()         tBodyGyroMag-std()          tBodyGyroJerkMag-mean()    
[40] tBodyGyroJerkMag-std()      fBodyAcc-mean()-X           fBodyAcc-mean()-Y          
[43] fBodyAcc-mean()-Z           fBodyAcc-std()-X            fBodyAcc-std()-Y           
[46] fBodyAcc-std()-Z            fBodyAccJerk-mean()-X       fBodyAccJerk-mean()-Y      
[49] fBodyAccJerk-mean()-Z       fBodyAccJerk-std()-X        fBodyAccJerk-std()-Y       
[52] fBodyAccJerk-std()-Z        fBodyGyro-mean()-X          fBodyGyro-mean()-Y         
[55] fBodyGyro-mean()-Z          fBodyGyro-std()-X           fBodyGyro-std()-Y          
[58] fBodyGyro-std()-Z           fBodyAccMag-mean()          fBodyAccMag-std()          
[61] fBodyBodyAccJerkMag-mean()  fBodyBodyAccJerkMag-std()   fBodyBodyGyroMag-mean()    
[64] fBodyBodyGyroMag-std()      fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std() 

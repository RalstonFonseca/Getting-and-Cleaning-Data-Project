# CodeBook.md

This CodeBook describes the data and variables in 2 data files and Transformations:

I) The initial tidy data file - tidy_data1.csv.
II) The tidy data set tidy_data2.csv which is derived from tidy_data1.csv with the average of each variable for each activity and each subject.
III) Transformations

### I) tidy_data1.csv

*The tidy_data1.csv data file is a text file, containing comma-separated values.

**Rows:**
Totally there are _10,300_ rows in the file 
The first row contains the names of the variables, which described below.Remaining _10,299_ rows are observations.


**Variables:**
There are _68_ variables per row. They are described below:

* subject
An integer ID from _1_ to _30_ for the volunteers

* activity   
The activity performed by the person wearing a smartphone (Samsung Galaxy S II) on the waist.

_laying_
_sitting_
_standing_
_walking_
_walkingdownstairs_
_walkingupstairs_ 

Following time and frequency domain variables are normalized and bounded within [-1,1].
Each row has 	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration &
		- Triaxial Angular velocity from the gyroscope. 

The base features selected for caculating _mean_ and _standard deviation (std)_ come from the accelerometer and gyroscope 3-axial raw signals.
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain variables. 

These signals were used to estimate variables _(mean & std)_ of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
                                 
* timeBodyAccelerometer-mean-X 
* timeBodyAccelerometer-mean-Y
* timeBodyAccelerometer-mean-Z
* timeBodyAccelerometer-std-X          
* timeBodyAccelerometer-std-Y
* timeBodyAccelerometer-std-Z
* timeGravityAccelerometer-mean-X
* timeGravityAccelerometer-mean-Y             
* timeGravityAccelerometer-mean-Z
* timeGravityAccelerometer-std-X              
* timeGravityAccelerometer-std-Y
* timeGravityAccelerometer-std-Z 
* timeBodyAccelerometerJerk-mean-X
* timeBodyAccelerometerJerk-mean-Y            
* timeBodyAccelerometerJerk-mean-Z
* timeBodyAccelerometerJerk-std-X             
* timeBodyAccelerometerJerk-std-Y
* timeBodyAccelerometerJerk-std-Z  
* timeBodyGyroscope-mean-X
* timeBodyGyroscope-mean-Y                    
* timeBodyGyroscope-mean-Z
* timeBodyGyroscope-std-X                     
* timeBodyGyroscope-std-Y
* timeBodyGyroscope-std-Z
* timeBodyGyroscopeJerk-mean-X
* timeBodyGyroscopeJerk-mean-Y                
* timeBodyGyroscopeJerk-mean-Z
* timeBodyGyroscopeJerk-std-X                 
* timeBodyGyroscopeJerk-std-Y
* timeBodyGyroscopeJerk-std-Z   
* timeBodyAccelerometerMagnitude-mean
* timeBodyAccelerometerMagnitude-std  
* timeGravityAccelerometerMagnitude-mean
* timeGravityAccelerometerMagnitude-std 
* timeBodyAccelerometerJerkMagnitude-mean
* timeBodyAccelerometerJerkMagnitude-std   
* timeBodyGyroscopeMagnitude-mean
* timeBodyGyroscopeMagnitude-std   
* timeBodyGyroscopeJerkMagnitude-mean
* timeBodyGyroscopeJerkMagnitude-std
* frequencyBodyAccelerometer-mean-X
* frequencyBodyAccelerometer-mean-Y       
* frequencyBodyAccelerometer-mean-Z
* frequencyBodyAccelerometer-std-X            
* frequencyBodyAccelerometer-std-Y
* frequencyBodyAccelerometer-std-Z  
* frequencyBodyAccelerometerJerk-mean-X
* frequencyBodyAccelerometerJerk-mean-Y
* frequencyBodyAccelerometerJerk-mean-Z
* frequencyBodyAccelerometerJerk-std-X        
* frequencyBodyAccelerometerJerk-std-Y
* frequencyBodyAccelerometerJerk-std-Z   
* frequencyBodyGyroscope-mean-X
* frequencyBodyGyroscope-mean-Y              
* frequencyBodyGyroscope-mean-Z
* frequencyBodyGyroscope-std-X                
* frequencyBodyGyroscope-std-Y
* frequencyBodyGyroscope-std-Z      
* frequencyBodyAccelerometerMagnitude-mean
* frequencyBodyAccelerometerMagnitude-std"   
* frequencyBodyAccelerometerJerkMagnitude-mean
* frequencyBodyAccelerometerJerkMagnitude-std
* frequencyBodyGyroscopeMagnitude-mean
* frequencyBodyGyroscopeMagnitude-std   
* frequencyBodyGyroscopeJerkMagnitude-mean
* frequencyBodyGyroscopeJerkMagnitude-std


### II) tidy_data2.csv

* The tidy_data2.csv data file is a text file, containing comma-separated values.

**Rows:**
Totally there are _181_ rows in the file.
The first row contains the names of the variables, which described above. Remaining _180_ rows are observations.

**Variables:**
There are _68_ variables per row. They are described above:

### III) Transformations

The run_analysis.R performs following transformations to the source data:
1) The training and test sets were merged to create one data set.
2) Only the mean and standard deviation (std) measurements were extracted for each observation from the dataset. 
3) The activity identifiers which were initially present as integers between 1 and 6, were replaced with descriptive activity names (see activity variable).
4) The variable names were replaced with descriptive variable names.Following rules were applied:
Special characters *(* and *)* were removed
Starting letters *t* and *f* were expanded to *time* and *frequency* respectively.
*Acc*, *Gyro* and *Mag*  were replaced with *Accelerometer*, *Gyroscope* and *Magnitude* respectively.
Replaced *BodyBody* occurence with *Body*


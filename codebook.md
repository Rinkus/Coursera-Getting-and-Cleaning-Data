CodeBook Coursera Getting and Cleaning Data Project
====================================================

# Variables

##subjectid:

identifies the subject that participate in this observation. Total 30 subjects were observed to obtain the data


##activitydescription:

describe the activity that the subject did to collect the data. consist six different type of activities:
* walking
* walkingupstairs
* walkingdownstairs
* sitting
* laying
* standing


##Variables parameter(79 columns)

This variable parameter calculate the mean value of the parameter describe in the column names. There are 79 columns that include in variable parameters written in this format: `t|Body|Acc|mean|X`
* `t/f`: time/frequency domain signals
* `Body/Gravity`: measurement of acceleration signals
* `Acc/Gyro`: accelerometer or gyroscope signal
* `mean/std`: calculated measurement the average or standard deviation
* `X/Y/Z`: the axis of the sensor calculated
* `Jerk`: Jerk signals
* `mag`: magnitude
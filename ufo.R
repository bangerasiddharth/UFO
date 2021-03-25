#L00157101
#ufo.csv dataset is downloaded from Assignments & tests area on Blackboard
#This dataset contains over 80,000 reports of unidentified flying object (UFO) sightings over the last century
#New project UFO has been created

#---
#Q1|
#---
ufo_data <- read.csv("ufo.csv", na = "")                                        #reading the ufo.csv file into the ufo_data dataframe, replacing values with empty spaces with NA
head(ufo_data,5)                                                                #displaying first 5 records from ufo_dta dataframe to ensure data was loaded as expected

#---
#Q2|
#---
str(ufo_data)                                                                   #showing the structure of the ufo_data dataframe
head(ufo_data,15)                                                               #displaying first 15 records of the dataframe
nrow(ufo_data)                                                                  #counting the number of rows within the UFO dataframe (should be 89071)

#---
#Q3|
#---
converted_date <- as.Date(ufo_data$datetime, "%m/%d/%Y")                        #since date.posted contains date values, the data type should be converted to date (currently it is character)
converted_date                                                                  #we have converted datatype of date.posted from char to date and then saved this into converted_Date dataframe

#---
#Q4|
#---
ufo_data$datetime <- converted_datetime
ufo_data$date.posted <- as.Date(ufo_data$date.posted, "%m/%d/%Y")               #updating the ufo_data data frame with the new date structure which is stored in converted_date dataframe
str(ufo_data)                                                                   #displaying the structure of ufo_data dataframe to ensure that data type of date.posted column has been changed from chr to date

#---
#Q5|
#---
names(ufo_data)                                                                 #displaying names of variables in ufo_data dataframe
names(ufo_data)[6] <- "DurationSeconds"                                         #modifying name of var 'duration..seconds.' to 'DurationSeconds'
names(ufo_data)[7] <- "DurationHrsMins"                                         #modifying name of var 'duration..hours.min.' to 'DurationHrsMins'
names(ufo_data)[9] <- "DatePosted"                                              #modifying name of var 'date.posted.' to 'DatePosted'
names(ufo_data)                                                                 #displaying names of variables in ufo_data dataframe to ensure the variables have been update as required

#---
#Q6|
#---
class(ufo_data$latitude)                                                        #checking the datatype of variable latitude (its chr)
ufo_data$latitude = as.numeric(ufo_data$latitude)                               #converting the datatype from chr to numeric
class(ufo_data$latitude)                                                        #verifying that the datatype of latitude has been updated to numeric

#---
#Q7|
#---
#install.packages("mice")                                                       #installing mice package
library(mice)
md.pattern(ufo_data)                                                            #using mice library to display the number of missing variables in the UFO data frame

#How many records have no missing data content? = 69528
sum(complete.cases(ufo_data))
#How many variables have all data variables missing?
colSums(is.na(ufo_data))

#---
#Q8|
#---
attach(ufo_data)                                                                #attach is used to access used to access the variables present in the data framework without calling the  ufo_data dataframe
sorted_data <- ufo_data[order(shape, city),]                                    #sorting ufo_data fataframe first by shape and then by city within that shape
sorted_ufo_data <- subset(
  sorted_data, select=c("datetime", "city", "country", "shape"))                #extracting columns datetime, city, country, shape and saving it into a new dataframe called sorted_ufo_data
head(sorted_ufo_data,5)                                                         #displaying the first 5 records of the new sorted_ufo_data dataframe

#---
#Q9|                                                                            #selecting only those values where country is equal to 'gb' and shape is equal to 'disk'
#---
ufo_gb_disk <- subset(
  ufo_data, country == 'gb' & shape == 'disk')
head(ufo_gb_disk,5)

#---
#Q10|                                                                            
#---
write.csv(ufo_data, file = "modified_ufo.csv")                                  #saving the modified ufo_data dataframe
write.csv(ufo_gb_disk, file = " ufo_gb_disk.csv")                               #saving the ufo_gb_disk dataframe
write.csv(sorted_ufo_data, file = " sorted_ufo_data.csv")                       #saving the sorted_ufo_data dataframe
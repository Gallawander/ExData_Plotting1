##### This script subsets the household power consumption dataset containing only data from the dates 2007-02-01 and 2007-02-02 to write a new dataset called data.txt #####
# The original dataset is available here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# The original dataset has 2,075,259 rows and 9 columns
# File size of the original dataset is: 128 MB
# NOTE: Package "data.table" is required for proper function of this script

### Checks  whether the package is installed ###
if(!require(data.table)){
  install.packages("data.table")
  library(data.table)
}

### Reads specified rows from the original dataset starting from the date of 1/2/2007 ###
# skip argumet skips everything before specified string
# nrows defines number of rows to be read after the skip
# computation of nrows: nrows = 2 days * 24 hours * 60 minutes
data <- fread("household_power_consumption.txt", skip = "1/2/2007", nrows = 2880, sep = ";")
# Another possible option (no need for extra packages but SLOWER!)
# data <- read.table("household_power_consumption.txt", skip = grep("1/2/2007", readLines("household_power_consumption.txt")) - 1, nrows = 2880, sep = ";")

### Specifies the colnames ###
colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

### Defines the colnames ###
colnames(data) <- colNames

### Writes data into a data.txt ###
fwrite(data, "data.txt", sep = ";")
# Another possible option (no need for extra packages but SLOWER!)
# write.table(data, "data.txt", sep = ";")
### For this operation data.table package is needed ###
### Checks for the presence of data.table package ###
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
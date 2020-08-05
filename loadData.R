##### This script loads the data.txt and modyfies the Date and Time variables into a proper format #####
# The data.txt dataset contains has 2880 rows and 9 columns
# File size of the data.txt: 132 kB
# NOTE: Package "data.table" is required for proper functioning of this script

### Checks whether the package is installed ###
if(!require(data.table)){
  install.packages("data.table")
  library(data.table)
}

### Loads the reduced household power consumption dataset ###
data <- fread("data.txt", sep = ";", header = TRUE)

### Glimpse the data ###
str(data)
head(data)

### Checks for the presence of "?" (i.e. missing data) ###
any(grep("?", data, fixed = T))

### Converts the Date and Time variables into Date and POSIXct time formats ### 
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

### Sets the locale to English for proper day labels
origLocale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")
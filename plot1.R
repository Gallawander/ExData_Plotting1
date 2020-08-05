##### This script creates a plot 1 and saves it as a PNG #####

# Sources the loading script
source("loadData.R")

# Opens the PNG graphical device
png(filename = "plot1.png",
    width = 480,
    height = 480,
    units = "px")

# Plots the histogram
hist(data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Closes the graphical device
dev.off()
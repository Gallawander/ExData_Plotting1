##### This script creates a plot 2 and saves it as a PNG #####

# Sources the loading script
source("loadData.R")

# Opens the PNG graphical device
png(filename = "plot2.png",
    width = 480,
    height = 480,
    units = "px")

# Creates the plot
plot(data$Time,
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Closes the graphical device
dev.off()
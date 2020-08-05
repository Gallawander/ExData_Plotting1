##### This script creates a plot 3 and saves it as a PNG #####

# Sources the loading script
source("loadData.R")

# Opens the PNG graphical device
png(filename = "plot3.png",
    width = 480,
    height = 480,
    units = "px")

# Creates the plot
plot(data$Time,
     data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(data$Time,
      data$Sub_metering_2,
      col = "red")
lines(data$Time,
      data$Sub_metering_3,
      col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2, col = c("black", "red", "blue"))

# Closes the graphical device
dev.off()
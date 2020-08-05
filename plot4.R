##### This script creates a plot 4 and saves it as a PNG #####

# Sources the loading script
source("loadData.R")

# Opens the PNG graphical device
png(filename = "plot4.png",
    width = 480,
    height = 480,
    units = "px")

# Organizes plots to a 2x2 grid
par(mfrow = c(2,2))

### Creates plots in a 2x2 grid ###
# plot 1
plot(data$Time,
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

#plot 2
plot(data$Time,
     data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

#plot 3
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
       lty = 1, lwd = 2, col = c("black", "red", "blue"),
       bty = "n")

# plot 4
plot(data$Time,
     data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# Closes the graphical device
dev.off()

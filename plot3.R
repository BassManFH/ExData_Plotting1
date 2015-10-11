# Read unpacked file in the same dir
dataset <- read.table("household_power_consumption.txt",
                      sep = ";",
                      header = TRUE,
                      na.strings = "?")

# Convert "Date" column to useful format
dataset[,1] <- as.Date(dataset[,1], format = "%d/%m/%Y")

# Create a subset with needed data only
subset <- subset(dataset,
                 Date >= "2007-02-01" & Date <= "2007-02-02")

# Convert "Time" column to use exact time for graph
subset$Time <- paste(subset$Date, subset$Time, sep=" ")
subset$Time <- strptime(subset$Time, "%Y-%m-%d %H:%M:%S")

# Create variable to use common y-axis measurement
yaxislimit=range(c(subset$Sub_metering_1,subset$Sub_metering_2,subset$Sub_metering_3))

# Make a plot in PNG file
png(filename = "plot3.png")
plot(subset$Time, subset$Sub_metering_1,
     type = "l", ylim = yaxislimit,
     ylab = "Energy sub metering", xlab = "")
par(new = TRUE)
plot(subset$Time, subset$Sub_metering_2,
     type = "l", col = "red", ylim = yaxislimit,
     ylab = "", xlab = "")
par(new = TRUE)
plot(subset$Time, subset$Sub_metering_3,
     type = "l", col = "blue", ylim = yaxislimit,
     ylab = "", xlab = "")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black", "red", "blue"))
dev.off()
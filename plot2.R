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

# Make a plot in PNG file
png(filename = "plot2.png")
plot(subset$Time, subset$Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()

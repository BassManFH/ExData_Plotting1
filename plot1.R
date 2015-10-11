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

# Make a plot in PNG file
png(filename = "plot1.png")
hist(subset$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

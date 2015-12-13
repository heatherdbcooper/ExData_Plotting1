# Set the working directory
setwd("C:/Users/Heather/Documents/GitHub/ExData_Plotting1")

# Read in data
data <- read.table(file="household_power_consumption.txt", sep=";", skip=1, header=FALSE, na.strings=c("?"))

# Set the column names for the data
cols <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(data) <- cols

# Get subset
data <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")

# Format dates
data$timestamp <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Plot
png("plot3.png", width = 480, height = 480, bg="transparent")
with(data, plot(timestamp, Sub_metering_1, main='', xlab='', ylab='Energy sub metering', type="n"))
with(data, lines(timestamp, Sub_metering_1, col="black"))
with(data, lines(timestamp, Sub_metering_2, col="red"))
with(data, lines(timestamp, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

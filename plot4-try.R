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
png("plot4-try.png", width = 480, height = 480, bg="white")#"transparent")

# Set up frame
par(mfrow = c(2, 2))

# 1st plot is just plot 2 without the "kilowatts" bit
#plot(data$timestamp, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# 2nd plot very similar
#plot(data$timestamp, data$Voltage, type="l", xlab="datetime", ylab='Voltage')

# 3rd plot is plot 3
#with(data, plot(timestamp, Sub_metering_1, main='', xlab='', ylab='Energy sub metering', type="n"))
#with(data, lines(timestamp, Sub_metering_1, col="black"))
#with(data, lines(timestamp, Sub_metering_2, col="red"))
#with(data, lines(timestamp, Sub_metering_3, col="blue"))
#legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

trydata <- data

# 4th plot is v similar to plots 1 and 2
with(data, plot(timestamp, Global_reactive_power, type="l", xlab="datetime"))
with(data, plot(timestamp, Global_reactive_power, type="s", xlab="datetime", col="#0000ff22"))
with(data, plot(timestamp, Global_reactive_power, type="s", xlab="datetime", col="#0000ff22"))
dev.off()

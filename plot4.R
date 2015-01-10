## Read complete dataset from csv file
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=F)

## Convert to date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Extract data based on condition
data_subset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Combine Date & Time
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(data_subset$Datetime, data_subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
plot(data_subset$Datetime, data_subset$Voltage, type="l", ylab="Voltage (volt)", xlab="")
plot(data_subset$Datetime, data_subset$Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(data_subset$Datetime, data_subset$Sub_metering_2, col='Red')
lines(data_subset$Datetime, data_subset$Sub_metering_3, col='Blue')
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, bty="n")
plot(data_subset$Datetime, data_subset$Global_reactive_power, type="l", ylab="Global Rective Power (kilowatts)",xlab="")

## Save to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
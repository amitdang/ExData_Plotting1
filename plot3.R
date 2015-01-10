## Read complete dataset from csv file
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=F)

## Convert to date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Extract data based on condition
data_subset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Combine Date & Time
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)

## Plot 3
plot(data_subset$Datetime, data_subset$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data_subset$Datetime, data_subset$Sub_metering_2, type="l", col="red")
lines(data_subset$Datetime, data_subset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
## Read complete dataset from csv file
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=F)

## Convert to date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Extract data based on condition
data_subset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Combine Date & Time
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data_subset$Datetime, data_subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
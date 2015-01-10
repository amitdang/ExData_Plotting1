## Read complete dataset from csv file
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=F)

## Convert to date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Extract data based on condition
data_subset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plot 1
hist(data_subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
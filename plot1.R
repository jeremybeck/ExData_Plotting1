## Script to read and format household power consumption data and create a histogram of 
## Global active power that is saved to a png

data <- read.table('./household_power_consumption.txt', sep=';', header=T, na.strings="?", stringsAsFactors=F)
data$Date_Time <- paste(data$Date, data$Time)
data$Date_Time <- strptime(data$Date_Time, format="%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data.filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")


## Plot 1
# Modify this with labels and correct size with png()
png("plot1.png", width=480, height=480, units="px")
hist(data.filtered$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
## Script to read and format household power consumption data and create a time series plot of
## the three sub metering variables

data <- read.table('./household_power_consumption.txt', sep=';', header=T, na.strings="?", stringsAsFactors=F)
data$Date_Time <- paste(data$Date, data$Time)
data$Date_Time <- strptime(data$Date_Time, format="%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data.filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## Plot 3
png("plot3.png", width=480, height=480, units="px")
plot(data.filtered$Date_Time,data.filtered$Sub_metering_1, type="line", xlab="", ylab="Energy sub metering")
lines(data.filtered$Date_Time, data.filtered$Sub_metering_2, col="red")
lines(data.filtered$Date_Time, data.filtered$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"))
dev.off()
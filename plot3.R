# read data for 2 dates: 1/2/2007 and 2/2/2007
data <- read.table('household_power_consumption.txt', skip = 66637, nrows = 2880, sep = ';',na.strings = '?', stringsAsFactors = F)
# set headers
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# convert Date and Time to correct format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
# plot the 3 sub metering data to one plot
png('plot3.png')
plot(data$Sub_metering_1,type = 'l', ylab = "Energy sub metering",xaxt = 'n',xlab = "")
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))
lines(data$Sub_metering_2, col=2)
lines(data$Sub_metering_3, col=4)
legend("topright", lty = rep(1,3), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
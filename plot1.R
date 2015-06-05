# read data for 2 dates: 1/2/2007 and 2/2/2007
data <- read.table('household_power_consumption.txt', skip = 66637, nrows = 2880, sep = ';',na.strings = '?', stringsAsFactors = F)
# set headers
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# convert Date and Time to correct format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
# plot the Global Active Power histogram to plot1.png
png('plot1.png')
hist(data$Global_active_power,col = 2,xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
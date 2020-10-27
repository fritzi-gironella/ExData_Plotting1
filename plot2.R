## This is part of a submission for ExData_Plotting1, a Coursera Course Project.
## The code in plot2.R constructs the plot2.png plot. The code file should 
## include code for reading the data so that the plot can be fully reproduced. 
## The code that creates the PNG file is included.

## Reading data from the dates 2007-02-01 and 2007-02-02.
dat <- read.table(file="household_power_consumption.txt", header=FALSE, sep=';', 
                  skip=66637, nrows=2880, na.string='?', 
                  colClasses=c('character', 'character', rep('numeric',7)), 
                  col.names=c("Date", "Time", "Global_active_power",
                              "Global_reactive_power", "Voltage", 
                              "Global_intensity", "Sub_metering_1", 
                              "Sub_metering_2", "Sub_metering_3"))

## Convert Date and Time variable to Date/Time classes. 
## Time column contains both Date and Time
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
dat$Time <- strptime(paste(dat$Date, dat$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

## Construct the plot and save it to a PNG file with a width of 480 pixels and a 
## height of 480 pixels.
## 'plot2.png' is a line graph of Global Active Power (kilowatts) for all  
## timestamps.
png("plot2.png", width = 480, height = 480, units = "px")

plot(dat$Time, dat$Global_active_power, type='l', 
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
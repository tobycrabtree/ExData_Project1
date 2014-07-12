## Exploratory Data Analysis 
## Project 1, July 2014 - Plot 3
## By Tobias Crabtree

## Downloaded data on July 11, 2014 from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## read unzipped file "household_power_consumption.txt" that contains the data into table
data<-read.table("household_power_consumption.txt",header=TRUE, nrow=70000, sep=";", na.strings="?")

## subset data from the dates 2007-02-01 and 2007-02-02
dataSubset<- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
dataSubset$Date <- as.Date(dataSubset$Date, format="%d/%m/%Y") ## change class to date 
dataSubset$Global_active_power <- as.numeric(dataSubset$Global_active_power) ## change class to numeric

## create day column which merges date and time 
dataSubset$Day <- strptime(paste(dataSubset$Date, dataSubset$Time), format="%Y-%m-%d %H:%M:%S")

## copy plot to a PNG file
dev.copy(png, file="plot3.png", width=480, height=480)

## plot
plot(dataSubset$Day,dataSubset$Sub_metering_1, ylab="Energy sub metering", lwd=1, type="l", xlab="")
lines(dataSubset$Day,dataSubset$Sub_metering_2, col="red", ylab="Energy sub metering", lwd=1, type="l", xlab="")
lines(dataSubset$Day,dataSubset$Sub_metering_3, col="blue", ylab="Energy sub metering", lwd=1, type="l", xlab="")
axis(1, at=c(1,nrow(dataSubset)/2,nrow(dataSubset)),labels=c("Thu","Fri","Sat")) 
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )


dev.off()


## Exploratory Data Analysis 
## Project 1, July 2014 - Plot 2
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
dev.copy(png, file="plot2.png", width=480, height=480)

## plot
with(dataSubset, plot(dataSubset$Day,dataSubset$Global_active_power, ylab="Global Active Power (kilowatts)", lwd=1, type="l", xlab="", main="Plot 2"))
axis(1, at=c(1,nrow(dataSubset)/2,nrow(dataSubset)),labels=c("Thu","Fri","Sat")) 

dev.off()

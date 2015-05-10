## LOading Data

setwd("C:/Users/Tinoco/Google Drive/2. Research (Current)/(2015) Courses/(2015) Especialization in Data Science_/4. Exploratory Data Analysis/Week 1/exdata-data-household_power_consumption") 

dataL <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## Converting Format
dataL$Date <- as.Date(dataL$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(dataL, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataL)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Figure 1

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to a file in PNG format

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

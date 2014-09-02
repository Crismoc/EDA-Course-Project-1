setwd("C:\\Users\\Cristobal\\Dropbox\\Data Science Coursera\\4 Exploratory Data Analysis\\Course Project 1")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "data.zip")
unzip("data.zip")
fulldata <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

library(lubridate)

fulldata$Datetime <- paste(fulldata$Date, fulldata$Time, sep = " ")
fulldata$Datetime <- dmy_hms(fulldata$Datetime)

data <- fulldata[year(fulldata$Datetime) == 2007 & month(fulldata$Datetime) == 02 & day(fulldata$Datetime) == 01 | year(fulldata$Datetime) == 2007 & month(fulldata$Datetime) == 02 & day(fulldata$Datetime) == 02,]

Sys.setlocale("LC_TIME", "English")

par(mfrow = c(2,2))
par(mar = c(3.9,3.9,2.9,2.5))
plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", cex.lab = 0.7, cex.axis = 0.7)
plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", cex.lab = 0.7, cex.axis = 0.7, cex = 0.7)
plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", cex.lab = 0.7, cex.axis = 0.7, cex = 0.7)
lines(data$Datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$Datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", y.intersp = 0.8, bty = "n", inset = c(0,0), box.lwd = "1", lwd="1", cex = 0.7, col = c("black", "red", "blue"), legend = c("Sub_metering_1                ", "Sub_metering_2", "Sub_metering_3"))
plot(data$Datetime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", cex.lab = 0.7, cex.axis = 0.7)

dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()

setwd("C:\\Users\\Cristobal\\Dropbox\\Data Science Coursera\\4 Exploratory Data Analysis\\Course Project 1")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "data.zip")
unzip("data.zip")
fulldata <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

library(lubridate)

fulldata$Datetime <- paste(fulldata$Date, fulldata$Time, sep = " ")
fulldata$Datetime <- dmy_hms(fulldata$Datetime)

data <- fulldata[year(fulldata$Datetime) == 2007 & month(fulldata$Datetime) == 02 & day(fulldata$Datetime) == 01 | year(fulldata$Datetime) == 2007 & month(fulldata$Datetime) == 02 & day(fulldata$Datetime) == 02,]

hist(data$Global_active_power, col = 554, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", cex.axis = 0.7, cex.lab = 0.7)

dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
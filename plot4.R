## **Exploratory Data Anaysis**

### Read data
data <- read.table("C:/Users/gaby/Documents/GitHub/CourseraRepo/ExData_Plotting1/household_power_consumption.txt", sep = ";", header = TRUE) 
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")


head(data)

#### loading libraries
library(tidyverse)
library(lubridate)

# Getting date and time
date_time <- strptime(paste(data$Date,as.character(data$Time)),"%Y-%m-%d %H:%M:%S")

# **Plot 4**

par(mfrow=c(2,2), mar = c(4,4,3,2)+0.1)
## *similar to plot 2*
plot(date_time, as.numeric(as.character(data$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power")
## *voltage plot*
plot(date_time, as.numeric(as.character(data$Voltage)), 
     type = "l", xlab = "Date Time", ylab = "Voltage")
## *similar to plot 3*
plot(date_time, as.numeric(as.character(data$Sub_metering_1)), 
     type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, as.numeric(as.character(data$Sub_metering_2)),
      type = "l", col = "firebrick4")
lines(date_time, data$Sub_metering_3,
      type = "l", col = "dodgerblue3")
legend("topright", "(x,y)", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("gray10", "firebrick4", "dodgerblue3"), lty = 1, cex = 0.5, bty = "n")
## global reactive power plot
plot(date_time, as.numeric(as.character(data$Global_reactive_power)),
     type = "l", xlab = "Date Time", ylab = "Global_reactive_power")

dev.copy(png, filename="plot4.png",
         width  = 480,
         height = 480)

dev.off()

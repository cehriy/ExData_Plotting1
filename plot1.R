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

# **Plot 1**
### *histogram*
hist(as.numeric(as.character(data$Global_active_power)),
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "firebrick4")

dev.copy(png, filename="plot1.png",
         width  = 480,
         height = 480)

dev.off()

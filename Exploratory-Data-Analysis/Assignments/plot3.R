##import packages
library(lubridate)
library(stringr)
library(dplyr)

##download and unzip
#description of data: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
        url       <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        dwnld.dir <- "UCI_PowerData"
download.file(url, "UCI_PowerData.zip")
unzip("UCI_PowerData.zip", exdir = dwnld.dir)
        
        #set download directory and number of lines to skip on read
        dwnld.fld  <- paste(getwd(), dwnld.dir, sep = "/")
        dwnld.file <- paste(dwnld.fld, list.files(dwnld.fld), sep = "/")
        skp        <- length(grep("2006", readLines(dwnld.file))) + 1
#read and assign names to data
power.data           <- read.delim(dwnld.file, header = F, sep = ";", skip = skp, na.strings = "\\?")
colnames(power.data) <- str_split(readLines(dwnld.file, n = 1L), ";")[[1]]
        #only complete cases and filter for first 2 days of February 2007
        power.data      <- power.data[complete.cases(power.data),]
        power.data$Date <- as.Date(power.data$Date, "%d/%m/%Y")
        power.data      <- power.data[year(power.data$Date) == 2007, ]
        power.data      <- power.data[month(power.data$Date) == 2, ]
        power.data      <- power.data[day(power.data$Date) <= 2, ]
        power.data      <- bind_cols(power.data, data.frame(Date_Time = as.POSIXct(paste(power.data$Date, power.data$Time))))
            #assign correct data types for plotting
            power.data$Global_active_power <- as.numeric(power.data$Global_active_power)
            power.data$Sub_metering_1      <- as.numeric(power.data$Sub_metering_1)
            power.data$Sub_metering_2      <- as.numeric(power.data$Sub_metering_2)
            power.data$Sub_metering_3      <- as.numeric(power.data$Sub_metering_3)
            
##--Plot 3
library(reshape2)
png("plot3.png", width = 480, height = 480, units = "px")

    new.data <- melt(power.data[7:10], id.vars = "Date_Time")
    new.data[new.data$variable == "Sub_metering_1", 3] <- new.data[new.data$variable == "Sub_metering_1", 3] - 2
    new.data[new.data$variable == "Sub_metering_2", 3] <- new.data[new.data$variable == "Sub_metering_2", 3] - 2
        with(new.data, plot(Date_Time, value, type = "n", xlab = "", ylab = "Energy sub metering"))
        with(subset(new.data, variable == "Sub_metering_1"), lines(Date_Time, value, col = "black", type = "l"))
        with(subset(new.data, variable == "Sub_metering_2"), lines(Date_Time, value, col = "red", type = "l"))
        with(subset(new.data, variable == "Sub_metering_3"), lines(Date_Time, value, col = "blue", type = "l"))
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.col = c("black", "red", "blue"))

dev.off()

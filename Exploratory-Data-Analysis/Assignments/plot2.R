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
            
##--Plot 2
png("plot2.png", width = 480, height = 480, units = "px")
    
    with(power.data, plot(Date_Time, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
    lines(power.data$Date_Time, power.data$Global_active_power, type = "l")

dev.off()

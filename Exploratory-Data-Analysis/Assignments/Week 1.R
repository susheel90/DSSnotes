url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "UCI_PowerData.zip")
dwnld.dir <- "UCI_PowerData"
unzip("UCI_PowerData.zip", exdir = dwnld.dir)
dwnld.fld <- paste(getwd(), dwnld.dir, sep = "/")
dwnld.file <- paste(dwnld.fld, list.files(dwnld.fld), sep = "/")
read.table(dwnld.file, header = T, sep = ";", skip = grep("2006", readLines(dwnld.file)))

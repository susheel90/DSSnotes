# download the data
url    <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
wrkdir <- paste(getwd(), "Assignments/Exploratory Data Analysis/CourseProject2", sep = "/")
setwd(wrkdir)
dest   <- paste(getwd(), "data.zip", sep = "/")
download.file(url, dest)
unzip(dest)
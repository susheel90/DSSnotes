library(ggplot2)
library(magrittr)

# Prepping the Data -------------------------------------------------------


# download the data onto hard drive
url    <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
wrkdir <- paste(getwd(), "Assignments/Exploratory Data Analysis/CourseProject2", sep = "/")
setwd(wrkdir)
dest   <- paste(getwd(), "data.zip", sep = "/")
download.file(url, dest)
unzip(dest)

# load datasets into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Question 1 --------------------------------------------------------------


# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from all 
# sources for each of the years 1999, 2002, 2005, and 2008.

# find total emissions
total.emissions        <- aggregate(NEI$Emissions, list(NEI$year), function(x) sum(x))
names(total.emissions) <- c("Year", "Emissions")

 # plot with 'base'
png("plot1.png")
plot(x    = total.emissions$Year,
     y    = total.emissions$Emissions,
     main = "Total Annual PM2.5 Emissions: United States",
     sub  = "1999-2008",
     ylab = "Total Annual Emissions",
     xlab = "Year",
     xaxt = "n")

lines(x    = total.emissions$Year,
      y    = total.emissions$Emissions,
      type = "h")

axis(side = 1,
     at   = c(1999:2008))

# turn off device
dev.off()


# Question 2 --------------------------------------------------------------


# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# find total Baltimore emissions
baltimore                  <- NEI[NEI$fips == "24510", ]
baltimore.emissions        <- aggregate(baltimore$Emissions, list(baltimore$year), function(x) sum(x))
names(baltimore.emissions) <- c("Year", "Emissions")

# plot with 'base'
png("plot2.png")
plot(x    = baltimore.emissions$Year,
     y    = baltimore.emissions$Emissions,
     main = "Total Annual PM2.5 Emissions: Baltimore, Maryland",
     sub  = "1999-2008",
     ylab = "Total Annual Emissions",
     xlab = "Year",
     xaxt = "n")

lines(x    = baltimore.emissions$Year,
      y    = baltimore.emissions$Emissions,
      type = "h")

axis(side = 1,
     at   = c(1999:2008))

# turn off device
dev.off()


# Question 3 --------------------------------------------------------------


# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

# find the total emissions by 'Type' in Baltimore
baltimore.breakdown <- aggregate(baltimore$Emissions, list(baltimore$year, as.factor(baltimore$type)), function(x) sum(x))
names(baltimore.breakdown) <- c("Year", "Type", "Emissions")

 # plot with `ggplot`
png("plot3.png")
q <- qplot(x      = Year,
           y      = Emissions,
           data   = baltimore.breakdown,
           facets = .~Type,
           main   = "Total Annual PM2.5 Emissions\n Baltimore, Maryland\n 1999-2008")
s <- geom_smooth(method = "loess",
                 se = FALSE)
q + s

# turn off device
dev.off()


# Question 4 --------------------------------------------------------------


# 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# tidy the data
sectors      <- unique(SCC$EI.Sector)
coal         <- grep("Coal", sectors)
search.coal  <- sectors[coal] %>%
                paste(collapse = "|")
search.scc   <- SCC[grep(search.coal, SCC$EI.Sector), 'SCC'] %>%
                paste(collapse = "|")
nei.coal     <- NEI[grep(search.scc, NEI$SCC), ]

coal.emissions        <- aggregate(nei.coal$Emissions, list(nei.coal$year), function(x) sum(x))
names(coal.emissions) <- c("Year", "Emissions")

# plot it out
png("plot4.png")
q <- qplot(x    = Year,
           y    = Emissions,
           data = coal.emissions,
           main = "Total Annual PM2.5 Emissions: Coal\n United States\n 1999-2008")
s <- geom_smooth(method = "loess",
                 se = FALSE)
q + s

# turn it off
dev.off()


# Question 5 --------------------------------------------------------------

# 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# tidy it up
vehicles              <- grep("Vehicles", sectors)
search.vehicles       <- sectors[vehicles] %>%
                         paste(collapse = "|")
search.scc            <- SCC[grep(search.vehicles, SCC$EI.Sector), 'SCC'] %>%
                         paste(collapse = "|")
baltimore.vehicles    <- baltimore[grep(search.scc, baltimore$SCC), ]

balt.vehicles.emissions        <- aggregate(baltimore.vehicles$Emissions, list(baltimore.vehicles$year), function(x) sum(x))
names(balt.vehicles.emissions) <- c("Year", "Emissions")

# plot it out
png("plot5.png")
q <- qplot(x    = Year,
           y    = Emissions,
           data = balt.vehicles.emissions,
           main = "Total Annual PM2.5 Emissions: Vehicles\n Baltimore, Maryland\n 1999-2008")
s <- geom_smooth(method = "loess",
                 se = FALSE)
q + s

# turn it off
dev.off()


# Question 6 --------------------------------------------------------------


# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions?

# find total Baltimore emissions
la                  <- NEI[NEI$fips == "06037", ]
la.emissions        <- aggregate(la$Emissions, list(la$year), function(x) sum(x))
names(la.emissions) <- c("Year", "Emissions")

# tidy it up
vehicles              <- grep("Vehicles", sectors)
search.vehicles       <- sectors[vehicles] %>%
    paste(collapse = "|")
search.scc            <- SCC[grep(search.vehicles, SCC$EI.Sector), 'SCC'] %>%
    paste(collapse = "|")
la.vehicles    <- la[grep(search.scc, la$SCC), ]

la.vehicles.emissions        <- aggregate(la.vehicles$Emissions, list(la.vehicles$year), function(x) sum(x))
names(la.vehicles.emissions) <- c("Year", "Emissions")

# add to each
la.vehicles.emissions$City   <- c("LA")
balt.vehicles.emissions$City <- c("Baltimore")
labalt.vehicles.emissions    <- rbind(la.vehicles.emissions, balt.vehicles.emissions)

# plot it out
png("plot6.png")
q <- qplot(x     = Year,
           y     = Emissions,
           data  = labalt.vehicles.emissions,
           color = City,
           main  = "Total Annual PM2.5 Emissions: Vehicles\n Baltimore, Maryland & Los Angeles, California\n 1999-2008")
s <- geom_smooth(method = "lm",
                 se = TRUE)
q + s

# turn it off
dev.off()



# Q1 Alt ------------------------------------------------------------------


barplot(height    = total.emissions$Emissions,
        names.arg = total.emissions$Year)


        ## summarise emissions by year
        yeartot <- NEI %>% group_by(year) %>% summarise(emissions = sum(Emissions))


total <- tapply(NEI$Emissions, NEI$year, FUN = sum)


# Q2 Alt ------------------------------------------------------------------


baltimore.emissions        <- aggregate(Emissions ~ year,
                                        NEI[NEI$fips == "24510"],
                                        sum)


        Baltimore <- subset(NEI, fips == "24510", select=c(Emissions, year))
        total <- tapply(Baltimore$Emissions, Baltimore$year, FUN = sum)


# Q3 Alt ------------------------------------------------------------------


baltimore.breakdown <- aggregate(Emissions ~ year + type, NEI[NEI$fips=="24510",], sum)

        ## summarise by type and start/end year for Baltimore
        typetotBalt <- NEI %>% filter(fips == "24510", year == 1999 | year == 2008) %>% 
            group_by(type, year) %>% summarise(emissions = sum(Emissions))

   
# Q4 Alt ------------------------------------------------------------------

nei.scc  <- merge(NEI, SCC, by="SCC")
nei.coal <- nei.scc[grepl("coal", nei.scc$Short.Name, ignore.case=TRUE), ]
nei.coal <- aggregate(Emissions ~ year, nei.coal, sum)


# Q5 Alt ------------------------------------------------------------------


vehicles.NEI <- NEI[NEI$SCC %in% SCC[grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE),]$SCC,]
baltimore <- vehicles.NEI[vehicles.NEI$fips=="24510",]
tots.by.year <- aggregate(Emissions ~ year, baltimore, sum)


# Q6 Alt ------------------------------------------------------------------


##Subset SCC and NEI
vehicles.NEI <- NEI[NEI$SCC %in% SCC[grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE),]$SCC,]

## Subset the for Baltimore and LA
baltimore <- vehicles.NEI[vehicles.NEI$fips=="24510",]
la <- vehicles.NEI[vehicles.NEI$fips=="06037",]

##Add City Label
baltimore$city <- "Baltimore City"
la$city <- "Los Angeles County"

##Combine
combined <- rbind(baltimore, la)

##Aggregate total emissions by year
tots.by.year <- aggregate(Emissions ~ year + city, combined, sum)

## Change canvas
png('plot6.png', width = 480, height = 480)

## Create Plot
g <- ggplot(data=tots.by.year, aes(x=factor(year), y=Emissions/1000)) 
g <- g + facet_grid(. ~ city) +  
    geom_bar(aes(fill=year),stat="identity") +
    ggtitle('Total Emissions of Motor Vehicle Sources Los Angeles vs. Baltimore') +
    ylab('Total PM2.5 Emissions (in thousands of tons)') +
    xlab('Year') +
    theme(legend.position='none')
print(g)

##--
        # Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
        # vehicle sources in Los Angeles County, California (fips == "06037"). 
        # Which city has seen greater changes over time in motor vehicle emissions?
        
        # 24510 is Baltimore, 06037 is LA CA
        # Searching for ON-ROAD type in NEI
        subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
        
        aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
        aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
        aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"
##--

## Determine subset matching vehicle sources from both cities
vehicle <- grepl("vehicle", mergedData$Short.Name, ignore.case=TRUE)
subdataB <- mergedData[vehicle & mergedData$fips=="24510",]
subdataL <- mergedData[vehicle & mergedData$fips=="06037",]
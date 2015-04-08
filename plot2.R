## plot2.R -- Program to create a line plot for 'Global Active Power'
## This is the second graph created as part of Course 
## Project 1 in the Exploratory Data Analysis Class on Coursera
#############################################################

## Loading the full data file
allData <- read.csv("household_power_consumption.txt", header=TRUE
                    ,sep=';', na.strings="?"
                    )

## Convert date field
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")
 
# ## Subset to data needed for this plot
plotData <- subset(allData 
                  ,(Date >= "2007/02/01" & Date <= "2007/02/02")
                   )

# Create datetime field needed for graph
date_time <- paste(as.Date(plotData$Date), plotData$Time)
plotData$Datetime <- as.POSIXct(date_time)

# Draw plot with appropriate formatting
plot(plotData$Global_active_power~plotData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#  Saving plot to a  file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
## plot3.R -- Program to create a combination line chart 
## Created as part of Course Project 1 in the 
## Exploratory Data Analysis Class on Coursera
## This is chart #3 of the assignment
#########################################################

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

# Create datetime field needed for graphing
date_time <- paste(as.Date(plotData$Date), plotData$Time)
plotData$Datetime <- as.POSIXct(date_time)

# Write directly to png file for better formatting
# You can comment this line out if you want to plot on screen
png(filename = 'plot3.png'
    ,height = 480, width = 480, unit = 'px')

# Draw plot 3 with appropriate formatting
with(plotData, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright"
       ,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col=c("black", "red", "blue")
       , lty=1
       )

# close plotting device
dev.off()
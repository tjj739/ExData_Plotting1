## plot4.R -- Program to create a 4 panel charts
## Created as part of Course Project 1 in the 
## Exploratory Data Analysis Class on Coursera
## This is chart #4 of the assignment
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

# Create datetime field needed for graph
date_time <- paste(as.Date(plotData$Date), plotData$Time)
plotData$Datetime <- as.POSIXct(date_time)

# Write directly to png file for better formatting
# You can comment this line out if you want to plot on screen
png(filename = 'plot4.png'
    ,height = 480, width = 480, unit = 'px')

# Create 4 charts total in 2x2 format
par(mfrow=c(2,2))
with(plotData, {
        plot(Global_active_power~Datetime, type="l" 
             ,ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l" 
             ,ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l" 
             ,ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue")
               ,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
               ,lty=1
               ,bty="n"
               )
        plot(Global_reactive_power~Datetime, type="l" 
             ,xlab="datetime"
             )
})

# close plotting device
dev.off()
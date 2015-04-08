## plot1.R -- Program to create a histogram for 'Global Active Power'
## Created as part of Course Project 1 in the 
## Exploratory Data Analysis Class on Coursera
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

# Draw plot 1 with appropriate formatting
hist(plotData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
 
#  Saving plot to a  file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
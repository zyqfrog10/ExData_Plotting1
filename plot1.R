## This code will read 2007-02-01 and 2007-02-02 household energy 
## usage from "household_power_consumption.txt" provided on the
## class page (orginally from UC Irvine Machine Learning Repository).
## Then it will make a histogram of Global Active power. 
## The title will be "Global Active Power" and the bar filling 
## color is red.
## Finally the plot will be saved as "plot1.png".

## Read the data needed
filename <- "household_power_consumption.txt"
data <- read.table(filename,skip=66637,nrow=2880,
                   col.names=colnames(read.table(filename,nrow=1,
                                                 header=TRUE,
                                                 sep=";")),
                   sep=";")

## Make the plot
### open a file named as "plot1.png"
png(filename="plot1.png",width=480,height=480,units="px")
### draw the histgram
hist(data$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
### output the plot
dev.off()

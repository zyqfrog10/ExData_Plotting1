## This code will read 2007-02-01 and 2007-02-02 household energy 
## usage from "household_power_consumption.txt" provided on the
## class page (orginally from UC Irvine Machine Learning Repository).
## Then it will make a plot of Global Active power varying through
## Thursday to Saturday.
## Finally the plot will be saved as "plot2.png".

## Read the data needed
filename <- "household_power_consumption.txt"
data <- read.table(filename,skip=66637,nrow=2880,
                   col.names=colnames(read.table(filename,nrow=1,
                                                 header=TRUE,
                                                 sep=";")),
                   sep=";")

## convert the Date and Time to Date/Time format
x <- paste(data[,1],data[,2])
y <- strptime(x,"%d/%m/%Y %H:%M:%S")
## make a new data frame containing y
newdata <- cbind(data,y)

## Make the plot
### open a file named as "plot2.png"
png(filename="plot2.png",width=480,height=480,units="px")
### draw the plot
#### plot the graph
plot(newdata$y,newdata$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
### output the plot
dev.off()

## This code will read 2007-02-01 and 2007-02-02 household energy 
## usage from "household_power_consumption.txt" provided on the
## class page (orginally from UC Irvine Machine Learning Repository).
## Then it will make a plot of four graphs:
## 1) Global Active Power v.s. datetime
## 2) Voltage v.s. datetime
## 3) Energy sub metering v.s. datetime
## 4) Global_reactive_power v.s. datetime
## Finally the plot will be saved as "plot4.png".

## Read the data needed
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
### open a file named as "plot3.png"
png(filename="plot4.png",width=480,height=480,units="px")
### draw the plot
par(mfcol=c(2,2))
#### plot the graph
#### 1st one
plot(newdata$y,newdata$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")

#### 2nd one
with(newdata,plot(y,Sub_metering_1,xlab="",
                  ylab="Energy sub metering",type="l",col="black"))
par(new=TRUE)
with(newdata,plot(y,Sub_metering_2,ylim=range(c(0,par('usr')[4])),
                  axes=FALSE,xlab="",ylab="",type="l",col="red"))
par(new=TRUE)
with(newdata,plot(y,Sub_metering_3,ylim=range(c(0,par('usr')[4])),
                  axes=FALSE,xlab="",ylab="",type="l",col="blue"))
legend("topright",lty="solid",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#### 3rd one
plot(newdata$y,newdata$Voltage,type="l",xlab="datetime",
     ylab="Voltage")

#### 4th one
plot(newdata$y,newdata$Global_reactive_power,type="l",xlab="datetime",
     ylab="Global_reactive_power")
### output the plot
dev.off()
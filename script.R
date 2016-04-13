setwd("F:/Disk D/R programing/Coursera specialization/Course 4/w1")
library(lubridate)

# Extracting the data of 2 required days
library(ggplot2)
power_consum <- read.csv("F:/Disk D/R programing/Coursera specialization/Course 4/w1/household_power_consumption.txt", sep=";")
power_consum$Date <-as.Date(dmy(power_consum$Date),format="%d-%m-%y")
dulieu <- power_consum[power_consum$Date=="2007-02-01"|power_consum$Date=="2007-02-02",]
for (i in 1:length(dulieu$Global_active_power)){if (dulieu$Global_active_power=="?"){dulieu$Global_active_power<-NA}}

dulieu$Global_active_power <- as.numeric(as.character(dulieu$Global_active_power))
dulieu$Global_intensity <- as.numeric(as.character(dulieu$Global_intensity))
dulieu$Sub_metering_1 <- as.numeric(as.character(dulieu$Sub_metering_1))
dulieu$Sub_metering_2 <- as.numeric(as.character(dulieu$Sub_metering_2))
dulieu$Global_reactive_power <- as.numeric(as.character(dulieu$Global_reactive_power))
dulieu$Voltage <- as.numeric(as.character(dulieu$Voltage))

# Dealing with the time variable
test_time <- strptime(head(dulieu$Time),format = "%H:%M:%S")
only_time <- paste(hour(test_time),minute(test_time),sep = ":")
week_day <- weekdays(dulieu$Date,TRUE)


#Plot 1 picture
png(filename = "plot1.png")
hist(as.numeric(dulieu$Global_active_power),main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red")
dev.off()

# Plot picture 2
png(filename = "plot2.png")
plot(c(1:2880),dulieu$Global_active_power,type = "l",xaxt = "n",lwd=0.5,xlab = "",ylab ="Global Active Power (kilowatts)" )
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
dev.off()

# Plot picture 3
png(filename = "plot3.png")
plot(c(1:2880),dulieu$Sub_metering_1,type = "l",xaxt = "n",lwd=0.5,xlab = "",ylab ="Energy sub metering" )
par(new=TRUE)
plot(c(1:2880),dulieu$Sub_metering_2,col="red",type = "l",axes = FALSE,ylim = c(0,30),xaxt = "n",xlab = "",ylab ="Energy sub metering" )
par(new=TRUE)
plot(c(1:2880),dulieu$Sub_metering_3,col="blue",type = "l",axes = FALSE,ylim = c(0,30),xaxt = "n",xlab = "",ylab ="Energy sub metering" )
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"))
dev.off()

# Plot picture 4
png(filename = "plot4.png")
par(mfrow=c(2,2))
plot(c(1:2880),dulieu$Global_active_power,type = "l",xaxt = "n",lwd=0.5,xlab = "",ylab ="Global Active Power (kilowatts)" )
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
plot(c(1:2880),dulieu$Voltage,type = "l",xaxt = "n",lwd=0.5,xlab = "datetime",ylab ="Voltage" )
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
plot(c(1:2880),dulieu$Sub_metering_1,type = "l",xaxt = "n",lwd=0.5,xlab = "",ylab ="Energy sub metering" )
par(new=TRUE)
plot(c(1:2880),dulieu$Sub_metering_2,col="red",type = "l",axes = FALSE,ylim = c(0,30),xaxt = "n",xlab = "",ylab ="Energy sub metering" )
par(new=TRUE)
plot(c(1:2880),dulieu$Sub_metering_3,col="blue",type = "l",axes = FALSE,ylim = c(0,30),xaxt = "n",xlab = "",ylab ="Energy sub metering" )
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"))
plot(c(1:2880),dulieu$Global_reactive_power,type = "l",xaxt = "n",lwd=0.5,xlab = "datetime",ylab ="Global_reactive_power" )
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
dev.off()


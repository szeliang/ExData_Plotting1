#R Script for Course Project 1 of Module 4: Exploratory Data Analysis
#This script produces Plot 4

#This script assumes that the original zipped data is available in your working directory.
#The zipped file should be in its original filename: exdata-data-household_power_consumption.zip



#Read and prepare Data for plotting (note: rows 66637:69516 corresponds to data from 2007-02-01 to 2007-02-02)
unzip("exdata-data-household_power_consumption.zip")
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
data <- data[66637:69516,]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))

#Produce plot on PNG (4 in 1)
png(filename="plot4.png",width=480,height=480)
par(mfcol=c(2,2))

#plot 1/4
plot(data$Global_active_power,type="l",ylab="Global Active Power",xlab="",xaxt="n")
axis(1,at=c(1,1441,2880),labels = c("Thu","Fri","Sat"))

#plot 2/4
plot(data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",xaxt="n")
points(data$Sub_metering_2,type="l",col="RED")
points(data$Sub_metering_3,type="l",col="BLUE")
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))
legend("topright",lty=1,col=c("BLACK","RED","BLUE"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#plot 3/4
plot(data$Voltage,type="l",ylab="Voltage",xlab="datetime",xaxt="n")
axis(1,at=c(1,1441,2880),labels = c("Thu","Fri","Sat"))

#plot 4/4
plot(data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",xaxt="n")
axis(1,at=c(1,1441,2880),labels = c("Thu","Fri","Sat"))

dev.off()

#Clean up. Original zip file is not deleted.
file.remove("household_power_consumption.txt")
#R Script for Course Project 1 of Module 4: Exploratory Data Analysis
#This script produces Plot 1

#This script assumes that the original zipped data is available in your working directory.
#The zipped file should be in its original filename: exdata-data-household_power_consumption.zip



#Read and prepare Data for plotting (note: rows 66637:69516 corresponds to data from 2007-02-01 to 2007-02-02)
unzip("exdata-data-household_power_consumption.zip")
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
data <- data[66637:69516,]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Produce plot on PNG
png(filename="plot1.png",width=480,height=480)
hist(data$Global_active_power,col = "RED",main="Global Active Power",ylab = "Frequency",xlab = "Global Active Power (kilowatts)")
dev.off()

#Clean up. Original zip file is not deleted.
file.remove("household_power_consumption.txt")

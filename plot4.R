## DATA LOADING

## Load in Data
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset the data to the appropriate dates
datasub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")


## CHART MAKING
## Chart is 4 line charts of various energy use metrics

## Set up plot space to be 2x2
par(mfrow=c(2,2))

## Get X axis length for relabling later
datalen <- length(datasub$Global_active_power)

## Plot 1,1
  plot(datasub$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", xaxt = "n")
  axis(1, at = c(0, datalen/2, datalen), labels = c("Thu","Fri","Sat"))

## Plot 1,2  
  plot(datasub$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt = "n")
  axis(1, at = c(0, datalen/2, datalen), labels = c("Thu","Fri","Sat"))
  
  
## Plot 2,1
  range <- with(datasub, range(Sub_metering_1, Sub_metering_2, Sub_metering_3))

  plot(datasub$Sub_metering_1, type = "l", ylim = range, col = "black", ylab = "Energy Sub Metering", xlab = "", xaxt = "n")
  lines(datasub$Sub_metering_2, type = "l" , col = "red")
  lines(datasub$Sub_metering_3, type = "l", col = "blue")

  ##Make Axis Labels
  axis(1, at = c(0, datalen/2, datalen), labels = c("Thu","Fri","Sat"))

  ##Make Legend
  legend("topright", c("Sub_metering_1","Sub_metering_1","Sub_metering_1"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n", cex = 0.7)

## Plot 2,2
  plot(datasub$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", xaxt = "n")
  axis(1, at = c(0, datalen/2, datalen), labels = c("Thu","Fri","Sat"))
  

## Save file as PNG
dev.copy(png, "plot4.png")
dev.off()
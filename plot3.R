## DATA LOADING

## Load in Data
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset the data to the appropriate dates
datasub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")


## CHART MAKING
## Chart is a line chart of Energy Sub Metering

range <- with(datasub, range(Sub_metering_1, Sub_metering_2, Sub_metering_3))

plot(datasub$Sub_metering_1, type = "l", ylim = range, col = "black", ylab = "Energy Sub Metering", xlab = "", xaxt = "n")
lines(datasub$Sub_metering_2, type = "l" , col = "red")
lines(datasub$Sub_metering_3, type = "l", col = "blue")

##Make Axis Labels
datalen <- length(datasub$Global_active_power)
axis(1, at = c(0, datalen/2, datalen), labels = c("Thu","Fri","Sat"))

##Make Legend
legend("topright", c("Sub_metering_1","Sub_metering_1","Sub_metering_1"), lty = c(1,1,1), col = c("black", "red", "blue"))


## Save file as PNG
dev.copy(png, "plot3.png")
dev.off()
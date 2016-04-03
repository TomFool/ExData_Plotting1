## DATA LOADING

## Load in Data
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset the data to the appropriate dates
datasub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")


## CHART MAKING
## Chart is a line chart of Global Active Power

plot(datasub$Global_active_power, type = "l", ylab = "Global Active Power (kilwatts)", xlab = "", xaxt = "n")

datalen <- length(datasub$Global_active_power)
axis(1, at = c(0, datalen/2, datalen), labels = c("Thu","Fri","Sat"))


## Save file as PNG
dev.copy(png, "plot2.png")
dev.off()
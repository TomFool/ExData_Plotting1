## DATA LOADING

## Load in Data
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset the data to the appropriate dates
datasub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")


## CHART MAKING
## Chart is a histogram of Global_active_power
hist(datasub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Save file as PNG
dev.copy(png, "plot1.png")
dev.off()
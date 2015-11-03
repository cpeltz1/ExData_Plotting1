## Read in data (file is in working directory)
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset data for correct 2 days
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert accordingly
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subset$Sub_metering_1)
subMetering2 <- as.numeric(subset$Sub_metering_2)
subMetering3 <- as.numeric(subset$Sub_metering_3)

## Plot
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, col="red")
lines(datetime, subMetering3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)

## Save file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

## Read in data (file is in working directory)
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset data for correct 2 days
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert date and power columns
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subset$Global_active_power)

## Plot
plot(datetime, globalActivePower, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

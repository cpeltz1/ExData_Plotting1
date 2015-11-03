## Read in data (file is in working directory)
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset data for correct 2 days
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Change column to numeric so histogram will work
globalActivePower <- as.numeric(subset$Global_active_power)

## Plot histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

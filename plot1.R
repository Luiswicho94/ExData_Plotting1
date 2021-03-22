
## Reading table, loading lables and subetting for February
Power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(Power) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")
Subpower <- subset(Power, Power$Date=="1/2/2007" | Power$Date == "2/2/2007")

##Creating PNG file and Calling Plot function.
png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(Subpower$Global_Active_Power)), col = "red", main="Global Active Power", xlab = "Global Active Power(kilowatts)")
title(main="Global Active Power")
dev.off()

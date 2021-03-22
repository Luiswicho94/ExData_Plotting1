##Reading table, labeling and subsetting February data. (Copied from Plot1.R)
Power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(Power) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")
Subpower <- subset(Power, Power$Date=="1/2/2007" | Power$Date == "2/2/2007")

##Reclass Date and Time variables to objects.
Subpower$Date <- as.Date(Subpower$Date, format = "%d/%m/%Y")
Subpower$Time <- strptime(Subpower$Time, format = "%H:%M:%S")
Subpower[1:1440, "Time"] <- format(Subpower[1:1440, "Time"], "2007-02-01 %H:%M:%S")
Subpower[1441:2880, "Time"] <- format(Subpower[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

#Create PNG and plot 
png("plot2.png", width = 480, height = 480)
plot(Subpower$Time, as.numeric(as.character(Subpower$Global_Active_Power)), type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
title(main = "Global Active Power vs Time")
dev.off()
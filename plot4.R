## ##Reading table, labeling and subsetting February data. (As used in Plot1.R)
Power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(Power) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")
Subpower <- subset(Power, Power$Date=="1/2/2007" | Power$Date == "2/2/2007")

##Reclass Date and Time variables to objects. (As used in plot2.R)
Subpower$Date <- as.Date(Subpower$Date, format = "%d/%m/%Y")
Subpower$Time <- strptime(Subpower$Time, format = "%H:%M:%S")
Subpower[1:1440, "Time"] <- format(Subpower[1:1440, "Time"], "2007-02-01 %H:%M:%S")
Subpower[1441:2880, "Time"] <- format(Subpower[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

##Initiate plotting space for a lot of graphs
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

##Start plotting and putting graphs in their respective space
with(Subpower, {
  plot(Subpower$Time, as.numeric(as.character(Subpower$Global_Active_Power)), type = "l", xlab = "", ylab = "Global Active Power")
  plot(Subpower$Time, as.numeric(as.character(Subpower$Voltage)), type = "l", xlab = "datetime", ylab = "Voltage")
  plot(Subpower$Time, Subpower$Sub_Metering_1, type = "n", xlab = "", ylab = "Energy Sub Metering")
  with(Subpower, lines(Time, as.numeric(as.character(Sub_Metering_1))))
  with(Subpower, lines(Time, as.numeric(as.character(Sub_Metering_2)), col = "red"))
  with(Subpower, lines(Time, as.numeric(as.character(Sub_Metering_3)), col = "blue"))
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), cex = 0.6)
  plot(Subpower$Time, as.numeric(as.character(Subpower$Global_Active_Power)), type = "l", xlab = "datatime", ylab = "Global Reactive Power")
})
dev.off()

hpc <- read.table("~/00.Coursera/Household Power Consumption/household_power_consumption.txt", sep=";", na.strings="?", skip=1, 
                  stringsAsFactors=F)
col_names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
              "Sub_metering_2", "Sub_metering_3")
colnames(hpc) <- col_names
hpc[, 3:8] <- lapply(hpc[, 3:8], function(x) as.numeric(as.character(x)))
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc[, 1] <- as.Date(as.character(hpc[, 1]), "%d/%m/%Y")
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02", ]

png("plot4.png", width=480, height=480, units="px")
par(mfcol = c(2, 2))
plot(hpc$DateTime, hpc$Global_active_power, ylab="Global Active Power", xlab="", type="l")
with(hpc, {
plot(hpc$DateTime, hpc$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
points(hpc$DateTime, hpc$Sub_metering_2, col="red", type="l")
points(hpc$DateTime, hpc$Sub_metering_3, col="blue", type="l")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n",
    cex=0.9)
})
plot(hpc$DateTime, hpc$Voltage, xlab="datetime", ylab="Voltage", type="l")
plot(hpc$DateTime, hpc$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()
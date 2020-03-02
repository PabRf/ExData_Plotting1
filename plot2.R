hpc <- read.table("~/00.Coursera/Household Power Consumption/household_power_consumption.txt", sep=";", na.strings="?", skip=1, 
                  stringsAsFactors=F)
col_names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
              "Sub_metering_2", "Sub_metering_3")
colnames(hpc) <- col_names
hpc[, 3:8] <- lapply(hpc[, 3:8], function(x) as.numeric(as.character(x)))
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc[, 1] <- as.Date(as.character(hpc[, 1]), "%d/%m/%Y")
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02", ]

png("plot2.png", width=480, height=480, units="px")
plot2 <- plot(hpc$DateTime, hpc$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()
hpc <- read.table("~/00.Coursera/Household Power Consumption/household_power_consumption.txt", sep=";", na.strings="?", skip=1, 
                  stringsAsFactors=F)
col_names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
              "Sub_metering_2", "Sub_metering_3")
colnames(hpc) <- col_names
hpc[, 3:8] <- lapply(hpc[, 3:8], function(x) as.numeric(as.character(x)))
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc[, 1] <- as.Date(as.character(hpc[, 1]), "%d/%m/%Y")
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02", ]

png("plot1.png", width=480, height=480, units="px")
plot1 <- hist(hpc$Global_active_power, col="red", breaks=25, main="", mgp=c(1.2,0.4,0), lab=c(4,7,5), cex.main=0.6, cex.axis=0.6, 
              cex.lab=0.6, tcl=-0.25, xlab="Global Active Power (kilowatts)", xaxt="n", xlim=c(0,8), ylim=c(0,1300))
axis(side=1, at=seq(0,6,2), labels=seq(0,6,2), cex.axis=0.6, cex.lab=0.6, tcl=-0.25, mgp=c(1.2,0.4,0))
title(main="Global Active Power", line=-0.2, cex.main=0.6, adj=0.4)
dev.off()